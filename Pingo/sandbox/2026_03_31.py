import maya.cmds as cmds
import maya.mel as mel

import re

def Match_ConstraintObject(Staric, Target, Bool_Point=True, Bool_Orient=True, Bool_Scale=False):
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



def d_MeshFeatureEdge_Ctrl(MeshItem, Name, angle_threshold=30, size=1, Position=False):
    """
    오브젝트의 외곽 형태(Border) 및 일정 각도 이상 꺾이는 특징적 엣지(Feature Edge)를 
    추출하여 커브 컨트롤러를 생성합니다.
    Args:
        -MeshItem        (str): 컨트롤러를 생성할 대상 메쉬의 이름
        -Name            (str): 생성될 컨트롤러(그룹)의 이름
        -angle_threshold (int): 엣지 추출 기준 각도 (기본값 30도)
        -size            (float): 컨트롤러의 전체적인 크기 (기본값 1)
        -Position        (bool): 대상 메쉬와의 위치/회전 일치 여부 (기본값 False)
    Returns:
        생성된 컨트롤러의 이름(str)
    """

    if not cmds.objExists(MeshItem):
        print(u"대상 메쉬가 존재하지 않습니다.")
        return None
    
    shapes = cmds.listRelatives(MeshItem, shapes=True, fullPath=True) or []
    if not any(cmds.objectType(s) == 'mesh' for s in shapes):
        print(u"메쉬 타입이 아닙니다.")
        return None

    cmds.select(MeshItem)
    TargetEdges = []

    try:
        # 1. 특정 각도 이상 꺾이는 엣지 선택 (Feature Edge)
        cmds.polySelectConstraint(mode=3, type=0x8000, angle=True, anglebound=(angle_threshold, 180))
        angle_edges = cmds.ls(sl=True, fl=True) or []
        cmds.polySelectConstraint(disable=True)

        # 2. 열린 경계 엣지 선택 (Border Edge)
        cmds.polySelectConstraint(mode=3, type=0x8000, where=1)
        border_edges = cmds.ls(sl=True, fl=True) or []
        cmds.polySelectConstraint(disable=True)

        # 두 결과물의 중복 제거 및 통합
        TargetEdges = list(set(angle_edges + border_edges))

    finally:
        cmds.polySelectConstraint(disable=True)

    if not TargetEdges:
        print(u"외곽 형태를 정의할 엣지를 찾을 수 없습니다.")
        cmds.select(cl=True)
        return None

    Ctrl = cmds.createNode("transform", n=Name)
    mesh_pos = cmds.xform(MeshItem, q=True, ws=True, rp=True)
    mesh_rot = cmds.xform(MeshItem, q=True, ws=True, ro=True)
    
    offset_pos = [-x for x in mesh_pos]
    temp_curves_to_delete = []

    for i, edge in enumerate(TargetEdges):
        cmds.select(edge)
        crv_transform = cmds.polyToCurve(degree=1, form=2, ch=False)[0]
        cmds.xform(crv_transform, ws=True, t=offset_pos, r=True)
        
        cmds.makeIdentity(crv_transform, apply=True, t=1, r=1, s=1, n=0)

        shp = cmds.listRelatives(crv_transform, s=True)[0]
        renamed_shp = cmds.rename(shp, "{}{}Shape".format(Name, i + 1))
        cmds.parent(renamed_shp, Ctrl, relative=True, shape=True)
        
        temp_curves_to_delete.append(crv_transform)
        
    if temp_curves_to_delete:
        cmds.delete(temp_curves_to_delete)

    cmds.scale(size, size, size, Ctrl)
    cmds.makeIdentity(Ctrl, apply=True, s=1)

    if Position:
        cmds.xform(Ctrl, ws=True, t=mesh_pos)
        cmds.xform(Ctrl, ws=True, ro=mesh_rot)

    cmds.select(Ctrl)
    return Ctrl


pattern = r"(.+)(_Geo)"

selects = cmds.ls(sl =1 )
for i ,x in enumerate(selects):
    search = re.search(pattern , x)

    if search:
        matchNames = search.group(1)

        #edges = cmds.ls(x + ".e[*]" ,fl =1)
        rotPos = cmds.xform(x , ws =1 , q =1 , ro =1)
        cmds.xform(x , ws =1 , ro = [0,0,0])
        Ctrl = d_MeshFeatureEdge_Ctrl(x ,  matchNames + "_Ctrl" , 30 , 1.05 )
        cmds.xform(x , ws =1, ro = rotPos)
        Match_ConstraintObject(x ,Ctrl )


        constraintGrp = cmds.createNode("transform" , n = matchNames + "_conStraint" )
        cmds.parentConstraint(Ctrl , constraintGrp)
        cmds.scaleConstraint(Ctrl , constraintGrp)

        CtrlGrp  = Grping(Ctrl , 2)

        Match_ConstraintObject( x ,CtrlGrp[-1] )
        ParentGrp = cmds.listRelatives(x , p =1 )
        cmds.parent(x , constraintGrp)

        if ParentGrp:
            cmds.parent(constraintGrp , ParentGrp[0])
