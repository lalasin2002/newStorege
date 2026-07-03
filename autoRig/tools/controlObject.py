# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import maya.cmds as cmds
import maya.mel as mel
import os,sys


def isDag(node_name):
    '''
    주어진 노드가 DAG(Directed Acyclic Graph) 노드인지, 즉 씬 뷰에 존재하는 오브젝트인지 판별합니다.

    Args:
        node_name (str): 판별할 마야 노드의 이름.

    Returns:
        bool: DAG 노드이면 True, 아니면 False.

    Example:
        >>> result = isDag("pCube1")
    '''
    if not cmds.objExists(node_name):
        print("Warning: '{}' 오브젝트가 존재하지 않습니다.".format(node_name))
        return False
        
    inherited_types = cmds.nodeType(node_name, inherited=True)
    
    return "dagNode" in inherited_types


def defineShape( item , objType ="nurbsCurve" ):
    if not cmds.objExists(item):
        return None

    # item 자체가 nurbsCurve shape인 경우
    if cmds.nodeType(item) == objType:
        return item
    shapes = cmds.listRelatives(item, s=True, ni=True, f=True) or []
    
    for shape in shapes:
        if cmds.nodeType(shape) == objType:
            return shape

    return None


def insertShp(target, shps, types=["nurbsCurve", "mesh"], renameBool=True):
    '''
    지정된 대상 Transform 노드에 다른 Shape 노드들을 자식으로 삽입(Parent)합니다.

    Args:
        target (str): Shape을 삽입받을 부모 Transform 노드 이름.
        shps (list or str): 삽입할 Shape 노드 이름 또는 리스트.
        types (list, optional): 허용할 Shape 타입 리스트. 기본값은 ["nurbsCurve", "mesh"].
        renameBool (bool, optional): 삽입 후 자동으로 이름을 변경할지 여부. 기본값은 True.

    Returns:
        tuple or None: (부모 Transform 노드 이름, [삽입된 Shape 노드들의 리스트]). 조건이 안 맞으면 None.

    Example:
        >>> parent, new_shapes = insertShp("target_ctrl", ["curveShape1"])
    '''
    try:
        string_type = basestring
    except NameError:
        string_type = str

    insertShps = None
    transform = None 

    if isinstance(shps, (list, tuple)) and all(cmds.objectType(x) in types for x in shps):
        insertShps = shps
    if isinstance(shps, string_type) and isDag(shps):
        transform = shps
        isShp = cmds.listRelatives(shps, s=1, fullPath=1)
        
        if isShp:
            if all(cmds.objectType(x) in types for x in isShp):
                insertShps = isShp 
    
    if not insertShps:
        return
    if not transform:
        transform = cmds.listRelatives(insertShps[0], p=1)
    
    returnList = []
    for i, x in enumerate(insertShps):
        shp = x 
        if renameBool:
            shp = cmds.rename(x, "{origin}Shape{count}".format(origin=target, count=str(i+1)))

        cmds.parent(shp, target, shape=True, relative=True)
        returnList.append(shp)

    return transform, returnList


def dulicateObject(target):
    '''
    대상 오브젝트를 복제(Duplicate)하고, 복제된 새 오브젝트의 Transform과 Shape 정보를 반환합니다.

    Args:
        target (str): 복제할 대상 오브젝트 이름.

    Returns:
        tuple or None: (복제된 Transform 노드 이름, [복제된 Shape 노드 경로 리스트]). 실패 시 None.

    Example:
        >>> new_transform, new_shapes = dulicateObject("pCube1")
    '''
    try:
        string_type = basestring
    except NameError:
        string_type = str

    if not isinstance(target, string_type):
        return None
    if not cmds.objExists(target):
        return None
    
    newObject = cmds.duplicate(target, rc=1)

    shapes = cmds.listRelatives(newObject[0], s=1, fullPath=True)
    transform = newObject[0]
    renameShapes = []
    if shapes:
        for i, x in enumerate(shapes):
            renameShapes.append(x)

    return transform, renameShapes
    

def load_importReference(filePath, namespace=None):
    '''
    지정된 경로의 마야 파일을 Reference로 먼저 불러온 뒤, 해당 내용을 씬으로 완전히 임포트(Import)합니다.

    Args:
        filePath (str): 불러올 마야 파일의 절대 경로.
        namespace (str, optional): 적용할 네임스페이스. 기본값은 루트(":")로 병합.

    Returns:
        list: 씬에 성공적으로 임포트된 모든 노드들의 리스트.

    Example:
        >>> imported_nodes = load_importReference("C:/assets/prop.ma", namespace="prop1")
    '''
    try:
        string_type = basestring
    except NameError:
        string_type = str

    attrDict = {}
    if namespace is None:
        attrDict = {"namespace": ":", "mergeNamespacesOnClash": True}
    if namespace and isinstance(namespace, string_type):
        attrDict = {"namespace": namespace}

    beforeRefs = set(cmds.ls(type="reference") or [])
    try:
        cmds.file(filePath, reference=1, **attrDict)
    except Exception as e:
        raise ValueError(u">> load_importReference 에러 : {}".format(e))
    
    afterRefs = set(cmds.ls(type="reference") or [])
    newRefs = list(afterRefs - beforeRefs)
    
    if not newRefs:
        cmds.warning(u">> load_importReference 에러 : 새 reference 노드를 찾을 수 없음")
        return []
    
    refNode = newRefs[0]
    imported_nodes = get_referenceObjects(refNode)
    cmds.file(filePath, importReference=True)
    return imported_nodes


def load_reference(filePath, namespace=None, mergeNamespacesOnClash=False, flag=None):
    '''
    지정된 경로의 마야 파일을 씬에 Reference로 로드합니다.

    Args:
        filePath (str): Reference로 불러올 마야 파일 경로.
        namespace (str, optional): 사용할 네임스페이스 문자열.
        mergeNamespacesOnClash (bool, optional): 네임스페이스 충돌 시 병합할지 여부. 기본값은 False.
        flag (dict, optional): cmds.file에 추가로 넘겨줄 플래그 딕셔너리.

    Returns:
        str or None: 생성된 Reference 노드의 이름 (예: "propRN"). 실패 시 None.

    Example:
        >>> ref_node = load_reference("C:/assets/prop.ma", namespace="chr")
    '''
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
    '''
    Reference 노드 이름이나 파일 경로를 통해 해당 Reference에 속한 노드 목록을 가져옵니다.

    Args:
        refNode_or_path (str): Reference 노드 이름 또는 Reference 파일 경로.
        flag (dict, optional): referenceQuery에 사용할 플래그 딕셔너리.

    Returns:
        list: Reference에 속해 있는 노드 또는 경로들의 리스트.

    Example:
        >>> nodes = get_referenceObjects("propRN")
    '''
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


def scaleCurveCvs(item, value=1.0):
    '''
    NURBS 커브의 트랜스폼(Scale)을 건드리지 않고, 컴포넌트 단위(CV)에서 크기를 조절합니다.

    Args:
        item (str): 스케일을 조절할 NURBS 커브의 이름.
        value (float, optional): 조절할 스케일 배수. 기본값은 1.0.

    Returns:
        None

    Example:
        >>> scaleCurveCvs("curve1", 1.5)
    '''
    cvs = cmds.ls("{}.cv[*]".format(item), flatten=True)
    if not cvs:
        cmds.warning("{}에서. NURBS 커브가 맞는지 확인해주세요.".format(item))
        return
    center_pivot = cmds.xform(item, query=True, scalePivot=True, worldSpace=True)
    cmds.scale(value, value, value, cvs, pivot=center_pivot, objectSpace=True, relative=True)


def mirrorObject(item, axis="YZ", parentBool=True):
    '''
    임시 Joint 트리를 활용하여 선택한 오브젝트를 지정된 평면 축을 기준으로 대칭 복사(Mirror)합니다.

    Args:
        item (str): 대칭 복사할 대상 오브젝트 이름.
        axis (str, optional): 기준이 될 대칭 평면 축. 기본값은 "YZ".
        parentBool (bool, optional): 원본과 동일한 부모 구조 아래에 넣을지 여부. 기본값은 True.

    Returns:
        list: 미러링이 완료되어 복제된 결과물 오브젝트 노드 리스트.

    Example:
        >>> mirrored_objs = mirrorObject("pCube1", axis="YZ", parentBool=True)
    '''
    flags = {"mirror{}".format(axis): True, "mirrorBehavior": True}
    rootParent = cmds.listRelatives(item, p=1)

    cmds.select(clear=True)
    rootJoint = cmds.joint(p=(0, 0, 0))
    cmds.select(clear=True)
    posJoint = cmds.joint()
    cmds.matchTransform(posJoint, item, pos=True, rot=True)
    cmds.parent(posJoint, rootJoint)
    cmds.parent(item, posJoint)
    mirorrData = cmds.mirrorJoint(posJoint, **flags)
    dulicateObjs = mirorrData[1:]
    cmds.parent(dulicateObjs[0], w=1)
    cmds.parent(item, w=1)
    cmds.delete(rootJoint)
    cmds.select(dulicateObjs[0])
    
    if parentBool and rootParent:
        cmds.parent(dulicateObjs[0], rootParent[0])
        cmds.parent(item, rootParent[0])
        
    return dulicateObjs


def get_curveData(curve):
    """
    curve transform 또는 nurbsCurve shape를 받아서 span 관련 정보를 반환한다.
    Python 2.7 / 3.x 호환용.
    """

    if not cmds.objExists(curve):
        raise ValueError(u"get_curveData 에러 : {} 노드가 존재하지 않습니다.".format(curve))

    curveShape = None

    # curve 자체가 nurbsCurve shape인 경우
    if cmds.nodeType(curve) == "nurbsCurve":
        curveShape = curve

    # transform이 들어온 경우 shape 검색
    else:
        shapes = cmds.listRelatives(curve, s=True, ni=True, f=True) or []
        for shape in shapes:
            if cmds.nodeType(shape) == "nurbsCurve":
                curveShape = shape
                break

    if not curveShape:
        raise ValueError(u"get_curveData 에러 : {} 에서 nurbsCurve shape를 찾을 수 없습니다.".format(curve))

    parent = cmds.listRelatives(curveShape, p=True, f=True) or []

    spans = cmds.getAttr(curveShape + ".spans")
    degree = cmds.getAttr(curveShape + ".degree")
    form = cmds.getAttr(curveShape + ".form")
    minValue = cmds.getAttr(curveShape + ".minValue")
    maxValue = cmds.getAttr(curveShape + ".maxValue")
    cvCount = cmds.getAttr(curveShape + ".controlPoints", size=True)

    data = {
        "curve": parent[0] if parent else curveShape,
        "curveShape": curveShape,
        "spans": spans,
        "degree": degree,
        "form": form,
        "minValue": minValue,
        "maxValue": maxValue,
        "cvCount": cvCount
    }

    return data

def rebuild_existingCurve(curve, spans=None, degree=None, keepEnd=True, keepRange=0, tol=0.01):
    """
    이미 존재하는 curve를 rebuild한다.
    원본 curve를 직접 수정한다.
    CV 적절한 개수 = spans + degree
    keepRange:
        0 = 0 to 1
        1 = original
        2 = 0 to numSpans
    """

    if not cmds.objExists(curve):
        raise ValueError(u"rebuild_existingCurve 에러 : {} 노드가 존재하지 않습니다.".format(curve))

    spanData = get_curveData(curve)

    curveTransform = spanData["curve"]
    curveShape = spanData["curveShape"]

    # spans / degree를 넘기지 않으면 기존 값 사용
    if spans is None:
        spans = spanData["spans"]

    if degree is None:
        degree = spanData["degree"]

    if isinstance(spans, bool) or not isinstance(spans, int):
        raise ValueError(u"rebuild_existingCurve 에러 : spans는 int만 허용됩니다.")

    if isinstance(degree, bool) or not isinstance(degree, int):
        raise ValueError(u"rebuild_existingCurve 에러 : degree는 int만 허용됩니다.")

    if spans < 1:
        raise ValueError(u"rebuild_existingCurve 에러 : spans는 1 이상이어야 합니다.")

    if degree < 1:
        raise ValueError(u"rebuild_existingCurve 에러 : degree는 1 이상이어야 합니다.")

    # Maya curve degree는 보통 1(linear) 또는 3(cubic)을 주로 사용
    if degree > 7:
        raise ValueError(u"rebuild_existingCurve 에러 : degree가 너무 큽니다. 입력값: {}".format(degree))

    cmds.rebuildCurve(
        curveTransform,
        ch=False,
        rpo=True,
        rt=0,
        end=1,
        kr=keepRange,
        kcp=False,
        kep=keepEnd,
        kt=False,
        s=spans,
        d=degree,
        tol=tol
    )

    # rebuild 후 정보 다시 반환
    return get_curveData(curveTransform)