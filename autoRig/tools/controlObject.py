# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import maya.cmds as cmds
import maya.mel as mel
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

def getShapeType(obj):
    if not cmds.objExists(obj):
        return None

    # obj 자체가 shape일 수도 있음
    node_type = cmds.nodeType(obj)

    if node_type not in ["transform", "joint"]:
        return node_type

    shapes = cmds.listRelatives(obj, s=1, ni=1) or []

    if not shapes:
        return None

    return cmds.nodeType(shapes[0])



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

    beforeRefs = set(cmds.ls(type="reference") or [])
    try:
        cmds.file(filePath , reference= 1, **attrDict )
    except Exception as e:
        raise ValueError(u">> load_importReference 에러 : {}" .format(e))
    
    afterRefs = set(cmds.ls(type="reference") or [])
    newRefs = list(afterRefs - beforeRefs)
    
    
    if not newRefs:
        cmds.warning(u">> load_importReference 에러 : 새 reference 노드를 찾을 수 없음")
        return []
    
    refNode = newRefs[0]
    imported_nodes = get_referenceObjects(refNode )
    cmds.file(filePath, importReference=True)
    return imported_nodes

def load_reference(filePath, namespace=None, mergeNamespacesOnClash=False, flag=None):
    try:
        string_type = basestring
    except NameError:
        string_type = str

    if not os.path.exists(filePath):
        return None

    attrDict = {
        "options": "v=0;",
        "reference": True,
        "ignoreVersion": True
    }

    if namespace and isinstance(namespace, string_type):
        attrDict.update({
            "namespace": namespace,
            "mergeNamespacesOnClash": mergeNamespacesOnClash
        })

    if isinstance(flag, dict) and flag:
        attrDict.update(flag)

    try:
        refPath = cmds.file(filePath, **attrDict)

        refNode = cmds.referenceQuery(refPath, referenceNode=True)

        return refNode

    except Exception as e:
        print("Reference load failed: {}".format(filePath))
        print(e)
        return None


def get_referenceObjects(refNode_or_path, flag=None):
    try:
        string_type = basestring
    except NameError:
        string_type = str

    refNode = None
    if isinstance(refNode_or_path, string_type) and os.path.exists(refNode_or_path):
        refResult = cmds.file(refNode_or_path, q=True, referenceNode=True)
        refNode = refNode_or_path
        if isinstance(refResult, list) and len(refResult) > 0:
            refNode = refResult[0]
        elif isinstance(refResult, string_type):
            refNode = refResult
    elif cmds.objExists(refNode_or_path):
        if cmds.objectType(refNode_or_path) == "reference":
            refNode = refNode_or_path

    if not refNode:
        print("Warning: Cannot find a valid reference node for '{}'".format(refNode_or_path))
        return []

    if flag is None:
        flag = {
            "nodes": True,
            "dagPath": True
        }

    try:
        nodes = cmds.referenceQuery(refNode, **flag)
        return nodes or []

    except Exception as e:
        print("Reference query failed: {}".format(refNode))
        print(e)
        return []

def scaleCurveCvs(item , value = 1.0):
    cvs = cmds.ls("{}.cv[*]" .format(item), flatten=True)
    if not cvs:
        cmds.warning("{}에서. NURBS 커브가 맞는지 확인해주세요.".format(item))
        return
    center_pivot = cmds.xform(item, query=True, scalePivot=True, worldSpace=True)
    cmds.scale(value, value, value, cvs, pivot=center_pivot, objectSpace=True, relative=True)


def mirrorObject(item , axis = "YZ"  , parentBool = True):
    flags = { "mirror{}".format(axis) : True ,  "mirrorBehavior" : True}
    rootParent = cmds.listRelatives(item , p =1)

    cmds.select(clear=True)
    rootJoint = cmds.joint(p = (0,0,0))
    cmds.select(clear=True)
    posJoint = cmds.joint()
    cmds.matchTransform(posJoint, item, pos=True, rot=True)
    cmds.parent(posJoint , rootJoint)
    cmds.parent(item , posJoint)
    mirorrData =cmds.mirrorJoint(posJoint, **flags)
    dulicateObjs = mirorrData[1:]
    cmds.parent(dulicateObjs[0] , w =1)
    cmds.parent(item  , w =1)
    cmds.delete(rootJoint)
    cmds.select(dulicateObjs[0])
    
    if parentBool and rootParent:
        cmds.parent(dulicateObjs[0] , rootParent[0] )
        cmds.parent(item  ,rootParent[0] )
    
        

    return dulicateObjs








    






