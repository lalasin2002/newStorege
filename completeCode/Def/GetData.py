# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om

def get_pararmeterCurve(obj_or_pos , Curve ):
    """
    지정한 오브젝트의 위치 또는 좌표값(list, tuple)에서 가장 가까운 커브의 파라미터 값을 찾아 반환합니다.

    Args:
        obj_or_pos (str or list or tuple): 
            - 파라미터를 찾을 기준 위치가 되는 오브젝트의 이름 (예: "curve1")
            - 또는 3D 월드 공간 좌표 (예: [1.0, 2.0, 3.0] 또는 (1.0, 2.0, 3.0))
        
        Curve (str): 
            - 대상이 되는 커브의 이름 (transform 또는 nurbsCurve shape 이름 모두 가능)

    Returns:
        float: 계산된 커브 파라미터 값. 실패 시 None을 반환할 수 있습니다.
        
    Raises:
        TypeError: 입력값이 유효하지 않을 경우 에러를 발생시킵니다.
    """
    string_type = None
    try:
        string_type = basestring
    except NameError:
        string_type = str

    Position = None
    CrvShp = None
    Parameter = None
    if cmds.objExists(Curve):
        CurveType = cmds.objectType(Curve)

        if CurveType == "transform":
            IsShp = cmds.listRelatives(Curve , s =1  ,type = "nurbsCurve")
            if IsShp:
                CrvShp = IsShp[0]
        if CurveType == "nurbsCurve":
            CrvShp = Curve
    else:
        raise TypeError (">> Invaild input. Expected a Curve")
    

    if isinstance(obj_or_pos , string_type) and cmds.objExists(obj_or_pos) and Curve:

        PosNode = cmds.createNode("transform")
        cmds.delete(cmds.pointConstraint(obj_or_pos , PosNode , mo = 0))
        Position = cmds.xform(PosNode , ws =1 , t = 1 , q =1)

        cmds.delete(PosNode)
    elif isinstance(obj_or_pos , (list , tuple)) and len(obj_or_pos) == 3 and all(isinstance(x, (int, float)) for x in obj_or_pos):
        Position = obj_or_pos
    else:
        raise TypeError (">> Invalid input. Expected a tuple like (0, 0, 0) or a list/tuple of such tuples.")

    if Position:
        nearestPointOnCrv = cmds.createNode("nearestPointOnCurve")
        for i , x in enumerate("XYZ"):
            cmds.setAttr(nearestPointOnCrv + ".inPosition{}" .format(x) , Position[i])

        cmds.connectAttr(CrvShp + ".worldSpace[0]" , nearestPointOnCrv + ".inputCurve" , f=1)
        Parameter = cmds.getAttr(nearestPointOnCrv + ".parameter")
        if Parameter:
            cmds.delete(nearestPointOnCrv)

        return Parameter





def getMeshVtx_SequencePos(FirstVtxs, ConversionTuple=True, MaxLoop=1000):
    """
    메쉬 버텍스 시작점부터 시퀀스(Ring) 단위로 확장하며 각 구간의 중심점 Pos를 가져오기
    Args:
        -FirstVtxs      (list): 시작 버텍스 리스트 (예: ['pSphere1.vtx[0]'])
        -ConversionTuple(bool): 결과 위치값을 튜플(tuple) 형태로 반환할지 여부
        -MaxLoop        (int) : 무한루프 방지를 위한 최대 반복 횟수 제한값
    Returns:
        거리값 리스트(list)
    """
    if not FirstVtxs or not cmds.objExists(FirstVtxs[0].split(".")[0]):
        return []
        
    MeshTF = FirstVtxs[0].split(".")[0]
    AllVtx = cmds.ls("{}.vtx[*]".format(MeshTF), fl=True)
    TotalVtxCount = len(AllVtx)
    
    ReturnList = []
    SearchedSet = set(FirstVtxs)  
    CurrentRing = list(FirstVtxs) 
    Add = list(FirstVtxs)         
    
    loop_count = 0
    
    
    while len(SearchedSet) <= TotalVtxCount:
        
        
        if loop_count >= MaxLoop:
            print(u"경고: MaxLoop 제한에 도달하여 연산을 강제 중지합니다.")
            break
            
        
        if CurrentRing:
            x_sum, y_sum, z_sum = 0.0, 0.0, 0.0
            for vtx in CurrentRing:
                pos = cmds.xform(vtx, q=True, ws=True, t=True)
                x_sum += pos[0]
                y_sum += pos[1]
                z_sum += pos[2]
            
            vtx_count = len(CurrentRing)
            center_pos = [x_sum / vtx_count, y_sum / vtx_count, z_sum / vtx_count]
            
            if ConversionTuple:
                center_pos = tuple(center_pos)
            ReturnList.append(center_pos)
        
        
        if len(SearchedSet) == TotalVtxCount:
            break
            
        
        cmds.select(Add)
        mel.eval('PolySelectTraverse 1')
        new_selection = cmds.ls(sl=True, fl=True)
        
        # 안전 장치
        if len(new_selection) == len(Add):
            print(u"알림: 메쉬가 끊어져 있어 더 이상 확장할 수 없습니다.")
            break
            
        
        CurrentRing = list(set(new_selection) - SearchedSet)
        SearchedSet.update(new_selection)
        Add = new_selection
        
        loop_count += 1
        
    return ReturnList


def get_poleVectorPos(Root , Middle , End , Scalar = 1):
    """IK PoleVector 정확한 위치 가져오기"""
    RootPos = cmds.xform(Root , q= 1, ws =1 , t =1)
    MiddlePos = cmds.xform(Middle , q= 1, ws =1 , t =1)
    EndPos =  cmds.xform(End , q= 1, ws =1 , t =1)
    
    RootVector = om.MVector(RootPos[0] , RootPos[1] , RootPos[2])
    MiddleVector = om.MVector(MiddlePos[0] , MiddlePos[1] , MiddlePos[2])
    EndVector = om.MVector(EndPos[0] , EndPos[1] , EndPos[2])
    
    
    RootEnd_Vector = (EndVector - RootVector)
    RootMiddle_Vector = (MiddleVector- RootVector)
    
    DotP = RootEnd_Vector * RootMiddle_Vector
    
    ProJect_Length= float(DotP)/float(RootEnd_Vector.length())
    
    Normalize_RootEnd = RootEnd_Vector.normal()
    
    ProJ_Vector = Normalize_RootEnd * ProJect_Length
    
    Arrow_Vector = (RootMiddle_Vector  - ProJ_Vector) *  Scalar
    
    Pole_Vector = Arrow_Vector + MiddleVector
    

    Pole_Vecotor_Pos = [Pole_Vector.x , Pole_Vector.y , Pole_Vector.z]
    return Pole_Vecotor_Pos


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



#----------------------------------------------------------------------------------Attr
def get_EnumAttrItem(Target, LongName):
    """Enum 속성의 항목 리스트 반환."""
    if cmds.attributeQuery(LongName, node=Target, exists=True):
        Enum = cmds.attributeQuery(LongName, node=Target, listEnum=True)
        return Enum[0].split(":")
    return []


def get_AttrValue(Target, LongName):
    """속성의 최소, 최대, 현재 값을 딕셔너리로 반환."""
    if cmds.attributeQuery(LongName, node=Target, exists=True):
        Dic = {}
        Dic["Min"] = cmds.attributeQuery(LongName, node=Target, minimum=True)[0]
        Dic["Max"] = cmds.attributeQuery(LongName, node=Target, maximum=True)[0]
        Dic["Current"] = cmds.getAttr("{}.{}".format(Target, LongName))
        return Dic
    return {}

def get_JntRotateOrder(Jnt):
    """
    조인트의 'rotateOrder' 속성 값(정수)을 maya.api.OpenMaya.MEulerRotation.RotationOrder 열거형으로 변환.
    """
    ro_attr_val = cmds.getAttr(Jnt + ".rotateOrder")
    # Maya 'rotateOrder' 속성 값과 MEulerRotation.RotationOrder 매핑:
    # 0: kXYZ, 1: kYZX, 2: kZXY, 3: kXZY, 4: kYXZ, 5: kZYX
    mapping = [
        om.MEulerRotation.kXYZ, om.MEulerRotation.kYZX, om.MEulerRotation.kZXY,
        om.MEulerRotation.kXZY, om.MEulerRotation.kYXZ, om.MEulerRotation.kZYX
    ]
    if 0 <= ro_attr_val < len(mapping):
        return mapping[ro_attr_val]

#---------------------------------------------------------------------------Obj
def get_HierarchyObj_List(Target , Type = None):
    cmds.select(Target, hi=1)
    lst = cmds.ls(sl=1 )
    if not Type == None:
        lst = [x for x in lst if cmds.objectType(x) == Type]
    cmds.select(cl =1)
    return lst

def get_SelectFaces(list):
    Faces = [x for x in list if ".f" in x]
    return Faces

def get_SelectEdges(list):
    Edges = [x for x in list if ".e" in x]
    return Edges

def get_SelectVtxs(list):
    Vtxs = [x for x in list if ".vtx" in x]
    return Vtxs

def get_ShapeType( target, nodeType):
        """
        (내부 헬퍼) 주어진 이름과 타입으로 트랜스폼과 셰이프 노드를 안정적으로 찾아 반환합니다.

        `target`으로 트랜스폼 이름이 들어오든 셰이프 이름이 들어오든, 
        항상 (트랜스폼, 셰이프) 쌍을 튜플로 반환합니다.

        :param str target: 찾을 노드의 이름입니다.
        :param str or list nodeType: 찾을 노드의 타입. 단일 타입은 문자열, 복수 타입은 리스트로 지정합니다.
        :return: tuple: `(트랜스폼_이름, 셰이프_이름)`을 반환합니다. 실패 시 `(None, None)`.
        :주의점: `nucleus`처럼 셰이프가 없는 노드는 `(노드_이름, 노드_이름)` 형태로 반환될 수 있습니다.
        """
        if not target or not cmds.objExists(target):
            return (None, None)

        if not isinstance(nodeType, list):
            nodeType = [nodeType]

        transform_node = None
        shape_node = None

        if any(cmds.objectType(target, isAType=nt) for nt in nodeType):
            shape_node = target
            parents = cmds.listRelatives(shape_node, parent=True, fullPath=True)
            if parents:
                transform_node = parents[0]
            else:
                transform_node = shape_node
        
        elif cmds.objectType(target, isAType='transform'):
            transform_node = target
            shapes = cmds.listRelatives(transform_node, shapes=True, fullPath=True) or []
            for shp in shapes:
                if any(cmds.objectType(shp, isAType=nt) for nt in nodeType):
                    shape_node = shp
                    break
        
        return (transform_node, shape_node)
#---------------------------------------------------------------------------Skin


def get_SkinCluster(obj):
    skin_cluster_nodes = mel.eval('findRelatedSkinCluster("{}")'.format(obj))
    return skin_cluster_nodes

def get_SkinPercent(obj):
    Dic = {}
    Shp = cmds.listRelatives(obj, s=1)[0]
    skinCluter = cmds.listConnections(Shp, type='skinCluster')[0]
    vtxs = cmds.ls(obj + '.vtx[*]', fl=1)

    for x in vtxs:
        weight = cmds.skinPercent(skinCluter, x, q=1, value=1, ignoreBelow=0.001)
        Jnt = cmds.skinPercent(skinCluter, x, q=1, transform=None)
        for y in range(len(Jnt) - 1):
            if len(weight) == 1:
                weight.append(0)
        list = []

        for y in range(len(Jnt)):
            Tu = []
            Tu.append(Jnt[y])
            Tu.append(weight[y])
            Tu = tuple(Tu)
            list.append(Tu)

        Dic[x] = list
    return Dic


#---------------------------------------------------------------------------Render
def getShader(Obj , Type = "lambert"):
    """타입별 오브젝트 쉐이더 가져오기"""
    WorkItme = Obj
    ShadingEngine = None
    Shader = None
    if cmds.objectType(WorkItme) == "transform":
        if cmds.listRelatives(WorkItme , c =1):
            WorkItme = cmds.listRelatives(WorkItme , c =1)[0]

    if cmds.objectType(WorkItme) in ["mesh", "nurbsCurve"]:
        ShadingEngine = cmds.listConnections(WorkItme , type="shadingEngine")
        if ShadingEngine and len(ShadingEngine)>0:
            ShadingEngine = ShadingEngine[0]

    if ShadingEngine:
        Shader = cmds.listConnections(ShadingEngine , s= 1 , d =0  ,  t = Type)
    
    return Shader

def getRenderSet(Obj):
    lstAttr = ['castsShadows', 'receiveShadows', 'holdOut', 'motionBlur', 'primaryVisibility', 'smoothShading',
               'visibleInReflections', 'visibleInRefractions', 'doubleSided']

    Dic = {}
    for x in range(len(lstAttr)):
        GetValue = cmds.getAttr('{}.{}'.format(Obj, lstAttr[x]))
        Dic[lstAttr[x]] = GetValue
    return Dic

def getNode_From_MeshShaderEngine(Object , Types = ["blendColors" , "RedshiftMaterialBlender"],returnToDic = True ):
    """
    오브젝트(transform 또는 mesh)에서 셰이딩 엔진을 찾아, 연결된 모든 상위 노드 중 
    지정한 타입의 노드들을 반환합니다.

    Args:
        -obj (str): 오브젝트의 이름 (transform 또는 mesh)
        -types (list, optional): 찾고 싶은 노드 타입 리스트.
        -return_to_dic (bool, optional): 결과를 딕셔너리로 반환할지 리스트로 반환할지 결정.

    Returns:
        -dict or list: 찾은 노드들. return_to_dic 값에 따라 형식이 달라짐.
    """
    
    def Find_all_CntUpstream(Start , FoundNodes = None):
        '''재귀함수'''
        if FoundNodes is None:
            FoundNodes = set()
        connects = cmds.listConnections(Start , s =1 , d =0) or []
        for node in connects:
            if node not in FoundNodes:
                FoundNodes.add(node)
                Find_all_CntUpstream(node , FoundNodes)
        return FoundNodes


    TransForm = None
    MeshShp = None
    ShadingEngine = None
    returnDic = {}
    returnList = []
    ObjectType= cmds.objectType(Object)
    if ObjectType == "transform":
        shps = cmds.listRelatives(Object , s = 1 , type = "mesh" , fullPath=1)
        if shps:
            TransForm = Object
            MeshShp = shps[0]
    if ObjectType == "mesh":
        parents = cmds.listRelatives(Object , p= 1 , type = "transform" , fullPath=1)
        if parents :
            TransForm = parents[0]
            MeshShp = Object
    if TransForm is None or MeshShp is None:
        raise TypeError(">> Invalid input. Expected a transform or mesh node name (string).")
    try:
        ShadingEngine = cmds.listConnections(MeshShp  , type="shadingEngine")[0]
    except (TypeError, IndexError):
        print(">> Warning: No shadingEngine found for  '{}'." .format(MeshShp))
        return returnDic if returnToDic else returnList
    for type in Types:
        returnDic[type] = []
    
    Conects = Find_all_CntUpstream(ShadingEngine)
    TypesSet = set(Types)
    for node in Conects:
        node_type = cmds.objectType(node)
        if node_type in TypesSet:
            returnDic[node_type].append(node)

    if returnToDic:
        returnDic["shadingEngine"] = ShadingEngine
        return returnDic
    else:
        for k , v in returnDic.items():
            returnList += v
        return returnList
    



#-------------------------------------------------------------------Cal
def getDistance(StartObj, EndObj ):
    """
    두 오브젝트의 거리값 가져오기
    Args:
        -StartObj (str): 첫번째 오브젝트
        -EndObj   (str): 두번째 오브젝트
    Returns:
        거리값(float)
    """
    S_Pos = cmds.xform(StartObj , q =1, t =1 ,ws =1)
    E_Pos = cmds.xform(EndObj, q=1, t=1, ws=1)
    DT = ((S_Pos[0] - E_Pos[0])**2 + (S_Pos[1] - E_Pos[1])**2 + (S_Pos[2] - E_Pos[2])**2)**0.5
    return DT

def getParameterValue(Total , Parameter):
    """정규화된 파라미터 기반 값 구하기"""
    Value = Total * Parameter
    return Value

def getParmeter(Total, Value):
    """정규화"""
    Parameter = Value / Total
    return Parameter