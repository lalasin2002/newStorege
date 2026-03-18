# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import os, time, shutil, re, json, pprint, sys

def grping(Target , Count , Grp_Suffix = ["_Grp" , "_Offset" , "_Prime" , '_GrpPrime']):
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


def match_ConstraintObject(Staric, Target, Bool_Point=True, Bool_Orient=True, Bool_Scale=False):
    ''' 
    Constraint maintainoffset = False 를 이용한 오브젝트 매치 \n
    Staric :: Constrain의 Parent 오브젝트 \n
    Target :: Constrain를 받고자 하는 오브젝트 \n
    
    각 Bool_(Point , Orient , Scale) 은 Constrain의 타입사용을 의미함
    '''

    
    if Bool_Point == True:
        Po = cmds.pointConstraint(Staric, Target, mo=0)
        cmds.delete(Po)
    if Bool_Orient == True:
        Or = cmds.orientConstraint(Staric, Target, mo=0)
        cmds.delete(Or)
    if Bool_Scale == True:
        Scale = cmds.scaleConstraint(Staric, Target, mo=0)
        cmds.delete(Scale)


def getSize(targetObject , minMax = True):
    bbox = cmds.exactWorldBoundingBox(targetObject)
    # [xmin, ymin, zmin, xmax, ymax, zmax]
    sizes = None
    sizes = bbox
    if minMax:
        size_x = bbox[3] - bbox[0]
        size_y = bbox[4] - bbox[1]
        size_z = bbox[5] - bbox[2]
        sizes = [size_x, size_y, size_z]
    
    return sizes

def squareCtrl(names):
    Ctrl = cmds.curve(d=1 , p=[(0.5, 0, -0.5), (0.5, 0, 0.5), (-0.5, 0, 0.5), (-0.5, 0, -0.5), (0.5, 0, -0.5)], n = names)
    return Ctrl


def scaleFreeze(targetObject , scaleValue = (1,1,1)):
    cmds.scale(scaleValue[0] , scaleValue[1] , scaleValue[2] , targetObject)
    cmds.makeIdentity(targetObject  ,apply = 1 , s  = 1 )
    return targetObject
    

selects = cmds.ls(sl =1)
matchString = None
count = 0
for i ,x in enumerate(selects):
    search = re.search(r"([a-z]+)([A-Z])([0-9]+)",x)
    Num = str(i+1).zfill(2)
    if search:
        Names = search.group()
        getSizeValues = getSize(x)

        ConstraintGrp = cmds.createNode("transform" , n = Names + "_conStraint")
        MainCtrl = squareCtrl(Names + "_Main_Ctrl")
        WorldCtrl = squareCtrl(Names + "_World_Ctrl")
        

        MainCtrl = scaleFreeze(MainCtrl , [v *1.1 for v in getSizeValues])
        WorldCtrl = scaleFreeze(WorldCtrl , [v *1.25 for v in getSizeValues])

        MainCtrlGrp = grping(MainCtrl , 2)
        WorldCtrlGrp = grping(WorldCtrl , 2)

        cmds.parent(MainCtrlGrp[-1] , WorldCtrl)

        match_ConstraintObject(x ,ConstraintGrp )
        match_ConstraintObject(x ,WorldCtrlGrp[-1] )

        parentGrp = cmds.listRelatives(x , p =1)

        cmds.parentConstraint(x , ConstraintGrp , mo =1)
        cmds.scaleConstraint(x , ConstraintGrp , mo =1)

        cmds.parent(MainCtrl , ConstraintGrp)

        if parentGrp:
            cmds.parent(ConstraintGrp , parentGrp[0])

            














        
