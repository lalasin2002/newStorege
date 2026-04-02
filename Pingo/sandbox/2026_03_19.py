# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import os, time, shutil, re, json, pprint, sys


'''
curveCV = cmds.ls("iceRail_Crv.cv[*]" , fl =1)


for i , x in enumerate(curveCV):

    xpos = cmds.xform("iceRailGuide_Crv.cv[{}]" .format(i) , ws =1 , q =1 , t =1)

    cmds.xform(x , t = xpos)

'''

def Create_PocifNode(Name, CrvName="", Parameter=0, TurnOnPercentage=True):
    """
    'pointOnCurveInfo' 노드를 생성하고, 매개변수 및 백분율 모드를 설정합니다.
    선택적으로 주어진 커브에 연결합니다.

    Args:
        Name (str): 생성할 'pointOnCurveInfo' 노드의 이름.
        CrvName (str, optional): 연결할 커브의 이름. 비어 있으면 연결하지 않습니다.
        Parameter (float, optional): 'parameter' 속성에 설정할 값. 기본값은 0.
        TurnOnPercentage (bool, optional): 'turnOnPercentage' 속성을 활성화할지 여부. 기본값은 True.

    Returns:
        str: 생성된 'pointOnCurveInfo' 노드의 이름.
    """
    POCIF = cmds.createNode('pointOnCurveInfo', n=Name)
    cmds.setAttr("{}.turnOnPercentage".format(POCIF), TurnOnPercentage)
    cmds.setAttr("{}.parameter".format(POCIF), Parameter)

    if cmds.objExists(CrvName):
        cmds.connectAttr("{}.worldSpace[0]".format(CrvName), "{}.inputCurve".format(POCIF), f=1)

    return POCIF



def Grping(Target , Count , Grp_Suffix = ["_Grp" , "_Offset" , "_Prime" , '_GrpPrime']):
    """
    주어진 대상 오브젝트에 대해 여러 개의 그룹을 생성하고 계층화합니다.
    생성된 그룹은 대상 오브젝트의 위치에 스냅된 후, 대상 오브젝트는 가장 안쪽 그룹의 자식이 됩니다.

    Args:
        Target (str): 그룹 계층을 생성할 대상 오브젝트의 이름.
        Count (int): 생성할 그룹의 개수 (Grp_Suffix 리스트의 처음부터 Count 만큼 사용).
        Grp_Suffix (list, optional): 생성할 그룹의 이름에 사용될 접미사 리스트.
                                     기본값은 ["_Grp", "_Offset", "_Prime", "_GrpPrime"].

    Returns:
        list: 생성된 그룹의 리스트 (바깥쪽 그룹부터 안쪽 그룹 순서).
    """

    Count = int(Count) # Count를 정수로 변환
    Groups =[] # 생성된 그룹들을 저장할 리스트
    Parent_Group = None # 이전 그룹을 저장하여 계층을 구축

    # 지정된 Count 만큼 그룹 생성 및 계층화
    for i , x in enumerate(Grp_Suffix[:Count]):
        Group = cmds.createNode("transform" , n = "{}{}" .format(Target ,x)) # 그룹 노드 생성

        if Parent_Group:
            cmds.parent( Parent_Group ,Group ) # 이전 그룹을 현재 그룹의 자식으로 설정 (바깥쪽에서 안쪽으로)
        Parent_Group = Group # 현재 그룹을 이전 그룹으로 업데이트
        Groups.append(Group) # 생성된 그룹을 리스트에 추가

    # 가장 바깥쪽 그룹을 대상 오브젝트의 위치에 스냅하고 제약 조건 삭제
    cmds.delete(cmds.parentConstraint(Target, Groups[-1]))
    # 대상 오브젝트를 가장 안쪽 그룹의 자식으로 설정
    cmds.parent(Target ,  Groups[0])

    return  Groups



selects = cmds.ls(sl =1)

total = 1.0

value = 1.0 / (len(sel) - 1)
list = []
for x in selects:
    Pos = cmds.xform(x, q=1, t=1, ws=1)
    Tuple = tuple(Pos)

    list.append(Tuple)

curve = cmds.curve(d=1, p=list)



div = 1.0/(len(selects) -1)
for  i ,x in enumerate(selects):
    value = div * i
    node = Create_PocifNode("{}_POCIF" .format(x),curve,value )
    loc = cmds.spaceLocator(n = "{}_loc" .format(x))[0]

    for v in "XYZ":
        cmds.connectAttr(node + ".position{}" .format(v) , loc + ".translate{}" .format(v) , f=1)


    Pos = cmds.xform(loc , ws =1 , q =1, t =1)


    cmds.select(cl =1)


    cmds.tangentConstraint(curve , loc , aim = (0,0,1) ,u = (0,1,0) , wu =(0,1,0) , worldUpType= "objectrotation", wuo = "vectorLoc")
    cmds.pointConstraint(loc, x ,mo =1 )
    cmds.orientConstraint(loc, x ,mo =1 )









