# -*- coding: utf-8 -*-
import maya.cmds as cmds
import re , pprint

selects = cmds.ls(sl =1)

LatticePos = ["{}.pt[1][0][0]","{}.pt[1][0][1]" ,"{}.pt[0][0][0]" , "{}.pt[0][0][1]"]
#LatticePos = ["{}.pt[1][1][1]","{}.pt[0][1][1]" ,"{}.pt[0][1][0]" , "{}.pt[1][1][0]"]

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



def getCenter(target_list):
    center = None 
    valid_points = 0
    if isinstance(target_list , (list , tuple)) and all(cmds.objExists(x) for x in target_list):
        center = [0.0 , 0.0 , 0.0]
        for element in target_list:
            pos = cmds.xform(element ,query=True, translation=True, worldSpace=True)
            center[0] += pos[0]
            center[1] += pos[1]
            center[2] += pos[2]
            valid_points  +=1
        if valid_points >0:
            center = [p/ valid_points for p in center]
    else:
        raise ValueError (u"Some of the input objects do not exist in the scene.")
    
    return center


pattern = r"(.+)(_Geo|_Grp)"

for i , x in enumerate(selects):
    search = re.search(pattern , x)
    if search:
        names = search.groups()[0]
        print (names)

        Lattice = cmds.lattice(x , dv=(2, 2, 2), oc=True)
        LatticePos = [o.format(Lattice[1]) for o in  LatticePos]
        scalePos = cmds.xform(Lattice[1] ,ws =1, s =1 , q=1)
        averageScale = 0
        for s in scalePos:
            averageScale += s
        averageScale = averageScale/3

        centerPos = getCenter(LatticePos)

        constraintGrp = cmds.createNode("transform" , n = names + "_conStraint")
        Ctrl = cmds.curve(d = 1, p = [(1,0, -1) , (1 , 0, 1 ) , (-1 , 0, 1 ) , (-1 , 0, -1 ) , (1 , 0, -1 )] , n = names + "_Ctrl" )
        cmds.scale(averageScale , averageScale , averageScale , Ctrl )
        cmds.makeIdentity(Ctrl ,apply = 1 , s  = 1 )
        CtrlGrp = Grping(Ctrl ,2)
        

        cmds.xform(constraintGrp , ws =1 , t= centerPos)
        cmds.xform(Ctrl , ws =1 , t= centerPos)
        cmds.delete(cmds.orientConstraint(x ,constraintGrp , mo =0))
        cmds.delete(cmds.orientConstraint(x ,Ctrl  , mo =0))
        cmds.delete(Lattice)


        cmds.parentConstraint(Ctrl ,constraintGrp , mo =1 )
        cmds.scaleConstraint(Ctrl , constraintGrp , mo =1)


        parentGrp = cmds.listRelatives(x , p =1)
        cmds.parent(x , constraintGrp)
        if parentGrp:
            cmds.parent(constraintGrp , parentGrp[0])
        


        




    
    


