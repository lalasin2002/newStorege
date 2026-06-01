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

jsonData = {}
selects = cmds.ls(sl=1, allPaths=1) or []

for x in selects:
    
    final_fileNode = None
    final_shaderPlug = None
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
    data = {
        "shaderEngine": engine,
        "fileNode": final_fileNode,
        "shaderNode": final_shaderPlug if final_shaderPlug else (shaders[0] if shaders else None),
        "imgName": imgName,
        "imgPath": imgPath,
        "imgDirPath": imgDirPath
    }

    jsonData[x] = data
"""
    return headCode + code