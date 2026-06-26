# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import maya.cmds as cmds
import os,sys


def pathAppend(log = True):
    # __file__ 현재 작업중인 파일 위치
    #os.path.dirname (경로)의 메인폴더 위치
    st = u"-----"*2 + "{}" + u"-----"*2 +"\n"
    st = st.format("pathAppend")
    CurrentDir = os.path.dirname(os.path.abspath(__file__))
    if not CurrentDir in sys.path:
        sys.path.append(CurrentDir)
        st+= u">> sys.path 등록 : {}\n".format(CurrentDir)
    else:
        st+= u">> sys.path 이미등록됨 : {}\n".format(CurrentDir)

    if log:
        print (st)

pathAppend(False)
import naming


def isDag(node_name):
    """
    주어진 노드가 DAG 노드인지 판별합니다.
    """
    # 1. 노드가 씬에 존재하는지 먼저 확인
    if not cmds.objExists(node_name):
        print("Warning: '{}' 오브젝트가 존재하지 않습니다.".format(node_name))
        return False
        
    # 2. inherited=True로 해당 노드의 조상 클래스 계보를 모두 가져옴
    inherited_types = cmds.nodeType(node_name, inherited=True)
    
    # 3. 그 계보 안에 'dagNode'가 포함되어 있다면 DAG 노드!
    return "dagNode" in inherited_types





def insertShp(target , shps , types = ["nurbsCurve" , "mesh"] , renameBool = True):
    try:
        string_type = basestring
    except NameError:
        string_type = str

    insertShps =None
    transform = None 

    if isinstance(shps , (list, tuple)) and all(cmds.objectType(x ) in types for x in shps):
        insertShps = shps
    if isinstance(shps ,string_type) and isDag(shps ):
        transform = shps
        isShp = cmds.listRelatives(shps , s =1,fullPath=1 )
        
        if isShp:
            if all(cmds.objectType(x ) in types for x in isShp):
                insertShps = isShp 
    
    
    if not insertShps:
        
        return
    if not transform:
        transform = cmds.listRelatives(insertShps[0] , p = 1)
    
    
    returnList = []
    for i , x in enumerate(insertShps):
        shp = x 
        if renameBool:
            shp = cmds.rename(x , "{origin}Shape{count}" .format(origin =target  , count = str(i+1) ))

        cmds.parent(shp , target ,shape=True, relative=True)
        returnList.append(shp)

    return transform , returnList

def dulicateObject(target):
    try:
        string_type = basestring
    except NameError:
        string_type = str

    if not isinstance(target , string_type):
        return None
    if not cmds.objExists(target):
        return None
    
    newObject = cmds.duplicate(target , rc =1)

    shapes = cmds.listRelatives(newObject[0] , s=1 ,fullPath=True)
    transform = newObject[0]
    renameShapes = []
    if shapes:
        for  i , x in enumerate(shapes):
            
            renameShapes.append(x)

    return transform , renameShapes
    
def load_importReference(filePath , namespace = None):
    try:
        string_type = basestring
    except NameError:
        string_type = str

    attrDict = {}
    if namespace is None:
        attrDict = { "namespace" :":", "mergeNamespacesOnClash" : True}
    if namespace and isinstance(namespace , string_type):
        attrDict = {"namespace" : namespace }

    try:
        cmds.file(filePath , reference= 1, **attrDict )
    except Exception as e:
        raise ValueError(u">> load_importReference 에러 : {}" .format(e))
    
    refNode = cmds.file(filePath , q =1 , referenceNode=True)
    if not refNode:
        cmds.warning(u">> load_importReference 에러 : 레퍼런스 노드를 찾을수없음" )
        return []
    imported_nodes = cmds.referenceQuery(refNode, nodes=True, dagPath=True)
    cmds.file(filePath, importReference=True)
    return imported_nodes









