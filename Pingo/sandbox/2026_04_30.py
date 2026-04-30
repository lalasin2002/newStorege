# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om


def getJntChains(startJnt, endJnt):
    """
    startJnt에서 endJnt까지 이어지는 조인트 체인 리스트를 반환
    Args:
        -startJnt (str): 체인의 시작 조인트
        -endJnt   (str): 체인의 끝 조인트 (startJnt의 후손이어야 함)
    Returns:
        조인트 이름 리스트(list) - 예: ['joint1', 'joint2', 'joint3', 'joint4']
    """
    if not cmds.objExists(startJnt):
        raise ValueError(u"{}가 존재하지 않습니다." .format(startJnt))
    if not cmds.nodeType(startJnt) =="joint":
        raise TypeError(u"{}는 조인트가 아닙니다.." .format(startJnt))
    if not cmds.objExists(endJnt ):
        raise ValueError(u"{}가 존재하지 않습니다." .format(endJnt))
    if not cmds.nodeType(endJnt) =="joint":
        raise TypeError(u"{}는 조인트가 아닙니다.." .format(endJnt))
    
    # ===== 종료 조건 (Base Case) =====
    # startJnt와 endJnt가 같으면 더 내려갈 필요 없음
    # 재귀가 더 이상 깊어지지 않고 여기서 진짜 값을 반환

    if startJnt == endJnt:
        return [endJnt]

    children = cmds.listRelatives(startJnt, c=True, type='joint') or []
    for child in children:
        # 이 child의 모든 후손 조인트들 (자식의 자식의 자식...)

        # 이 child가 endJnt거나, endJnt가 child의 후손에 있으면
        # >>  child를 따라가면 endJnt에 도달할 수 있음
        descendants = cmds.listRelatives(child, ad=True, type='joint') or []
        if child == endJnt or endJnt in descendants:
            ## 과정예시
            # child == endJnt :: 'joint2' == 'joint4'  >>  False
            # endJnt in descendants :: 'joint4' in ['joint5','joint4','joint3'] >>  True

            return [startJnt] + getJntChains(child, endJnt)
            # startJnt == endJnt 될때 까지 호출
            # [startJnt]  + getJntChains(child, endJnt)
            # ['joint1']  + getJntChains(child, endJnt) = ['joint2']
            # ['joint1']  +     ['joint2']      + getJntChains(child, endJnt) =  ['joint3']
            # ['joint1']  +     ['joint2']      +        ['joint3']           + getJntChains(child, endJnt) = ['joint4']
            
        
    raise ValueError(u"{}에서 {}로 가는 경로가 없습니다.".format(startJnt, endJnt))




def insertJnt(insertName , startJnt, endJnt , parameter):
    string_type = None
    try:
        string_type = basestring
    except NameError:
        string_type = str


    if not cmds.objExists(startJnt):
        raise ValueError(u"{}가 존재하지 않습니다." .format(startJnt))
    if not cmds.objectType(startJnt) == "joint":
        raise TypeError(u"{}는 조인트가 아닙니다.." .format(startJnt))
    if not cmds.objExists(endJnt ):
        raise ValueError(u"{}가 존재하지 않습니다." .format(endJnt))
    if not cmds.objectType(endJnt) == "joint":
        raise TypeError(u"{}는 조인트가 아닙니다.." .format(endJnt))
    if not isinstance(insertName , string_type):
        raise TypeError(u"{}는 문자열만 유효합니다.".format(insertName))
    if not isinstance(parameter , (int , float)) or isinstance(parameter, bool):
        raise TypeError(u"{}는 실수만 유효합니다.".format(parameter))
    if not 0.0 <= parameter <= 1.0:
        raise ValueError(u"parameter는 0.0 ~ 1.0 범위여야 합니다. 입력값: {}".format(parameter))
    if cmds.objExists(insertName):
        raise ValueError(u"{}가 이미 존재합니다.".format(insertName))
    
    childrens = cmds.listRelatives(startJnt, allDescendents=True, type='joint') or []
    if endJnt not in childrens:
        raise ValueError(u"{}는 {}의 자식 계층이 아닙니다.".format(endJnt, startJnt))
    
    startPos = cmds.xform(startJnt , q = 1 , ws =1 , rp=True)
    endPos = cmds.xform(endJnt , q = 1 , ws =1 , rp=True)

    startVector = om.MVector(*startPos)
    endVector = om.MVector(*endPos)

    diffVector = endVector - startVector
    #diffLength = diffVector.length()

    childJnt = None
    parentJnt = None
    insertVector = diffVector *  parameter










