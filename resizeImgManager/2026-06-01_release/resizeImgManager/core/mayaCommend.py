# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import tempfile ,os 

def set_JsonPath(path , codeDataName):

    #tempPath = os.path.join(tempfile.gettempdir() , "{}.json".format(tempJsonName)).replace("\\", "/")

    prefixcode = "\nimport json\n"


    code = """# -*- coding: utf-8 -*-
with open("{p}", "w") as f:
    json.dump({data}, f)
""".format(p=path, data=codeDataName)

    
    return prefixcode , code

def create_shadingNode(shaderName , fileNodeName , p2tName , shaderType ):
    cnt = ["{}.outColor".format(fileNodeName) , "{}.color".format(shaderName)]
    headCode = """
import maya.cmds as cmds
def create_shadingNode(nodeName, nodeType = "lambert", cntfile = None):
    shadingNode = cmds.shadingNode(nodeType, asShader=True, name=nodeName)

    if cntfile and len(cntfile)>1:
        isSource = cmds.objExists(cntfile[0])
        isDestination = cmds.objExists(cntfile[1])
        if isSource  and isDestination:
            cmds.connectAttr(cntfile[0] , cntfile[1] , f=1)

    return shadingNode
def create_file(nodeName , p2tName = None):
    fileNode = cmds.shadingNode("file", asTexture=True, isColorManaged=True, name=nodeName)
    p2t = None
    if p2tName:
        p2t = cmds.shadingNode("place2dTexture",n= p2tName, asUtility=True)
        tasks = [
                ("{}.coverage", "{}.coverage"),
                ("{}.translateFrame", "{}.translateFrame"),
                ("{}.rotateFrame", "{}.rotateFrame"),
                ("{}.mirrorU", "{}.mirrorU"),
                ("{}.mirrorV", "{}.mirrorV"),
                ("{}.stagger", "{}.stagger"),
                ("{}.wrapU", "{}.wrapU"),
                ("{}.wrapV", "{}.wrapV"),
                ("{}.repeatUV", "{}.repeatUV"),
                ("{}.offset", "{}.offset"),
                ("{}.rotateUV", "{}.rotateUV"),
                ("{}.noiseUV", "{}.noiseUV"),
                ("{}.vertexUvOne", "{}.vertexUvOne"),
                ("{}.vertexUvTwo", "{}.vertexUvTwo"),
                ("{}.vertexUvThree", "{}.vertexUvThree"),
                ("{}.vertexCameraOne", "{}.vertexCameraOne"),
                ("{}.outUV", "{}.uv"),
                ("{}.outUvFilterSize", "{}.uvFilterSize")
                ]
        for source , destination in tasks:
            cmds.connectAttr(source.format(p2t) , destination.format(fileNode),f =1)

    return fileNode , p2t
"""
    code = """
file = create_file({file} , {p2t})
shader = create_shadingNode({node} , {shadingType} , {attrCnt})
""".format(file = repr(fileNodeName) , p2t = repr(p2tName) , node = repr(shaderName) , shadingType = repr(shaderType) , attrCnt = repr(cnt))
    return headCode , code


def disconnect_nodes(sourceAttr , destinationAttr):
    headCode = """
import maya.cmds as cmds
"""
    code = """
isSource = cmds.objExists({source})
isDestination = cmds.objExists({destination})

if isSource and isDestination:
    cmds.disconnectAttr({source} ,{destination} )
    print (">> disconnect : {source} ,{destination}")
""".format(source = repr(sourceAttr) , destination = repr(destinationAttr))
    return headCode , code


def setAttrData(nodeAttr , inputData , unpack = None):
    
    unpackData = {}
    if isinstance(unpack  , dict):
        unpackData.update(unpack)

    headCode = """
import maya.cmds as cmds
"""
    code = """
isNodeAttr = cmds.objExists({insertAttr})
if isNodeAttr:
    try:
        cmds.setAttr({insertAttr} , {data} , **{unPack})
    except Exception as e:
        print (e)
""".format(insertAttr = repr(nodeAttr) , data = repr(inputData) , unPack = repr(unpackData))

    return headCode , code


def connect_nodes(sourceAttr , destinationAttr):
    headCode = """
import maya.cmds as cmds
"""
    code = """
isSource = cmds.objExists({source})
isDestination = cmds.objExists({destination})
if isSource and isDestination:
    cmds.connectAttr({source} ,{destination} ,f =1 )
    print (">> connect : {source} ,{destination}")
""".format(source = repr(sourceAttr) , destination = repr(destinationAttr))
    return headCode , code





def get_selectedMayaShaderData( shaderAttr , searchPattern):
    headCode = """
import maya.cmds as cmds
import re ,os


pattern = r"" + {pattern}
attr = {attr}
""".format(attr = repr(shaderAttr) , pattern = repr(searchPattern))

    code = """
def getShaderEngine(obj):
    work_item = obj
    
    if cmds.objectType(obj) == "transform":
        shapes = cmds.listRelatives(work_item, shapes=True, fullPath=True) or []
        if shapes:
            work_item = shapes[0]
    shaderEngine = cmds.listConnections(work_item, type="shadingEngine") or []
    if shaderEngine: 
        return shaderEngine[0]
    return None

def getShaderNodes(shaderEngine , types = ["RedshiftMaterial"]):
    if not shaderEngine or not cmds.objExists(shaderEngine):
        return None
    if not cmds.objectType(shaderEngine) == "shadingEngine":
        return None

    shaderNodes = cmds.listConnections(shaderEngine , s= 1 , d =0 ) or []
    if shaderNodes:
        # [수정된 부분] isDag 함수를 부르지 않고 직접 검사합니다!
        shaderNodes = [x for x in shaderNodes if not cmds.objectType(x, isAType='dagNode') and not cmds.objectType(x) == "groupId"] or []
    if types and shaderNodes:
        shaderNodes = [x for x in shaderNodes if cmds.objectType(x) in types] or []

    return shaderNodes 

def getConnectedNode(node , typeNode = "file" ,plug =False , connection = True ):
    if not cmds.objExists(node):
        return
    
    unpack = { "s" : True , "d" : False , "t" : typeNode , "p" : plug , "c" : connection   }
    return cmds.listConnections(node , **unpack ) or []

def getCntedNodeFromShaderEngine(engineNode , cnted = True  , plug = True ):
    if not cmds.objectType(engineNode) == "shadingEngine":
        return []
    unpack = { "s" : True , "d" : False  , "p" : plug , "c" :cnted   }
    
    cntItmes = cmds.listConnections(engineNode , **unpack ) or None
    if cntItmes:
        cntItmes.reverse()
    return cntItmes


jsonData = {}
selects = cmds.ls(sl=1, allPaths=1) or []

for x in selects:
    
    final_fileNode = None
    final_shaderPlug = None
    cnted_rsshader = None
    cnted_shader = None
    imgPath = None
    imgName = None
    imgDirPath = None

    
    engine = getShaderEngine(x)
    shaders = getShaderNodes(engine)

    if shaders:
        raw_fileNodes = getConnectedNode(shaders[0], "file")
        paired_fileNodes = list(zip(raw_fileNodes[::2], raw_fileNodes[1::2])) if raw_fileNodes else []
        
        for destination, source in paired_fileNodes:
            if attr in destination:
                getFilePath = cmds.getAttr(source + ".fileTextureName")
                search = re.search(pattern, getFilePath)
                if search:
                    imgPath = search.group()
                    imgDirPath, imgName = os.path.split(imgPath)
                    
                    final_fileNode = source
                    final_shaderPlug = destination
                    break
    if engine:
        cnted_rsshader = getCntedNodeFromShaderEngine("{}.rsSurfaceShader" .format(engine))
        cnted_shader = getCntedNodeFromShaderEngine("{}.surfaceShader" .format(engine))
        

    data = {
        "shaderEngine": engine,
        "fileNode": final_fileNode,
        "shaderNode": final_shaderPlug if final_shaderPlug else (shaders[0] if shaders else None),
        "imgName": imgName,
        "imgPath": imgPath,
        "imgDirPath": imgDirPath,
        "cnted_rsshader" : cnted_rsshader,
        "cnted_shader" : cnted_shader
    }

    jsonData[x] = data
"""
    return headCode , code