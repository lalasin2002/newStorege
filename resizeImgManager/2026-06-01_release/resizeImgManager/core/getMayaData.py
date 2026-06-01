# -*- coding: utf-8 -*-
import maya.cmds as cmds
import re ,os , pprint




def isDag(node):
    return cmds.objectType(node, isAType='dagNode')

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
        shaderNodes = [x for x in shaderNodes if not isDag(x) and not cmds.objectType(x) == "groupId"] or []
    if types and shaderNodes:
        shaderNodes = [x for x in shaderNodes if cmds.objectType(x) in types] or []

    return shaderNodes 

def getConnectedNode(node , typeNode = "file" ,plug =False , connection = True ):
    if not cmds.objExists(node):
        return
    
    unpack = { "s" : True , "d" : False , "t" : typeNode , "p" : plug , "c" : connection   }
    return cmds.listConnections(node , **unpack ) or []



jsonData = {}
selects = cmds.ls(sl =1 , allPaths =1)

pattern = r"" + "(.+)(_dif)(\.jpg)"
attr = ".diffuse_color"
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
        
        # fileNode = [(fileNode[i], fileNode[i+1]) ...] 대신 아래처럼 zip 활용
        paired_fileNodes = list(zip(raw_fileNodes[::2], raw_fileNodes[1::2])) if raw_fileNodes else []
        
        for destination, source in paired_fileNodes:
            if attr in destination:
                getFilePath = cmds.getAttr(source + ".fileTextureName")
                search = re.search(pattern, getFilePath)
                if search:
                    imgPath = search.group()
                    imgDirPath, imgName = os.path.split(imgPath)
                    
                    # 2. 기존 변수를 덮어쓰지 않고 최종 결과 변수에 담아줍니다.
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
pprint.pprint(jsonData)
    

    
        


