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

    #---------------------------------------------------
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
    

    startVector = om.MVector(*cmds.xform(startJnt , q = 1 , ws =1 , rp=True))
    endVector = om.MVector(*cmds.xform(endJnt , q = 1 , ws =1 , rp=True))

    diffVector = endVector - startVector
    diffLength = diffVector.length()

    #---------------------------------------------------

    insertVector = startVector + diffVector *  parameter
    # startVector + diffVector 이유  >> startVector안 더하면 (0,0,0) 위치에서 적용됨 
    # startVector부터 삽입해야하니까 >> 헷갈리지 말것


    childVector = None
    insertChildJnt  = None
    insertParentJnt = None 
    closestDistance = float('inf') 
    chains = getJntChains(startJnt, endJnt)



    parentJnt =chains[0]
    parentVector= om.MVector(*cmds.xform( chains[0] , q = 1 , ws =1 , rp=True))
    for child in chains[1:]:
        childVector = om.MVector(*cmds.xform( child , q = 1 , ws =1 , rp=True))
        firstBetweenDiff =  childVector - parentVector
        secondBetweenDiff = insertVector - parentVector

        # dotP 계산을 위한 Diff들 (각도기 모양 )
        # first는 child간 방향벡터
        # second는 insertVector간 방향벡터

        dotP = firstBetweenDiff * secondBetweenDiff

        
        projectDistanceNormal = dotP/(firstBetweenDiff *firstBetweenDiff)
        # 아래와 같은 식임 
        # projectDistance = dotP/firstBetweenDiff.length()
        # projectDistanceNormal = projectDistance / firstBetweenDiff.length()

        # dotP / (firstBetweenDiff * firstBetweenDiff) 가 더 효율적인 이유:
        # .length() = √(x²+y²+z²)  → 제곱근(√) 연산 포함, 비싼 연산
        # 벡터 자기 자신과의 dot product = x²+y²+z² = |AB]² → 제곱근 없이 바로 |AB]² 가 나옴
        # 어차피 |AB|로 두 번 나누는 거 = |AB]² 으로 한 번 나누는 거랑 같음
        # → 제곱근 두 번 계산하느니, dot product 한 번이 빠름

        projectDistanceNormal = max(0.0, min(1.0, projectDistanceNormal))
        # min(1, t): 위에서 막음 (1 이상이면 1로)
        # max(0, ...): 아래에서 막음 (0 이하면 0으로)

        projectPoint = parentVector + firstBetweenDiff * projectDistanceNormal
        projectDistance = (insertVector - projectPoint).length()
        
        # closestDistance = firstBetweenDiff 투영했을때의 거리 (비교)
        if  projectDistance < closestDistance:
            closestDistance = projectDistance
            insertParentJnt = parentJnt   # ← 현재 segment의 parent 이름
            insertChildJnt  = child 
        
        parentVector = childVector 
        parentJnt    = child

        
    print(u"끼울 위치: {} <-> {} 사이".format(insertParentJnt, insertChildJnt))
    print(u"insertVector 좌표: {}".format(insertVector.x))
    print(u"가장 가까운 거리: {}".format(closestDistance))





insertJnt("ss" , "joint1" , "joint4" , 0.777)

## x 방향 기준 (world)
# joint1 0
# joint2 2
# joint3 6
# joint4 10

## 프린트 결과
'''

끼울 위치: joint3 <-> joint4 사이
insertVector 좌표: 7.770000100135803
가장 가까운 거리: 0.0
'''










