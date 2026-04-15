# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import maya.api.OpenMaya as om
from collections import OrderedDict

def Constraint_WithCntScale(Static , Target , MainTain = True):
    """
    Static 오브젝트와 Target 오브젝트 사이에 parentConstraint를 생성하고,
    Static 오브젝트의 스케일을 Target 오브젝트의 스케일에 직접 연결합니다.

    Args:
        Static (str): 제약 조건을 제공하는 소스 오브젝트 (부모).
        Target (str): 제약 조건을 받는 대상 오브젝트 (자식).
        MainTain (bool, optional): 제약 조건 생성 시 대상 오브젝트의 현재 오프셋을 유지할지 여부. 기본값은 True.

    Returns:
        str: 생성된 parentConstraint 노드의 이름.
    """
    Constraint = None
    Constraint = cmds.parentConstraint(Static , Target , mo = MainTain)
    # Static 오브젝트의 스케일 속성을 Target 오브젝트의 스케일 속성에 직접 연결
    for x in "XYZ":
        cmds.connectAttr('{}.scale{}' .format(Static, x) ,'{}.scale{}' .format(Target ,x),f =1)
    return Constraint[0]

def Constraint_WithScale(Static , Target , MainTain = True):
    """
    Static 오브젝트와 Target 오브젝트 사이에 parentConstraint와 scaleConstraint를 생성합니다.

    Args:
        Static (str): 제약 조건을 제공하는 소스 오브젝트 (부모).
        Target (str): 제약 조건을 받는 대상 오브젝트 (자식).
        MainTain (bool, optional): 제약 조건 생성 시 대상 오브젝트의 현재 오프셋을 유지할지 여부. 기본값은 True.

    Returns:
        list: [parentConstraint 노드 이름, scaleConstraint 노드 이름]을 포함하는 리스트.
    """
    Constraint = cmds.parentConstraint(Static , Target , mo = MainTain)
    ScaleConstraint = cmds.scaleConstraint(Static , Target , mo = MainTain) # 'm'이 아닌 'mo'로 변경했습니다.

    return [Constraint[0] , ScaleConstraint[0]]

def Constraint_PointAndOrient(Static , Target , MainTain = True , Scaling = False):
    """
    Static 오브젝트와 Target 오브젝트 사이에 pointConstraint와 orientConstraint를 생성합니다.
    선택적으로 scaleConstraint도 생성할 수 있습니다.

    Args:
        Static (str): 제약 조건을 제공하는 소스 오브젝트 (부모).
        Target (str): 제약 조건을 받는 대상 오브젝트 (자식).
        MainTain (bool, optional): 제약 조건 생성 시 대상 오브젝트의 현재 오프셋을 유지할지 여부. 기본값은 True.
        Scaling (bool, optional): scaleConstraint를 생성할지 여부. 기본값은 False.

    Returns:
        list: 생성된 제약 조건 노드들의 이름을 포함하는 리스트.
              Scaling이 False이면 [pointConstraint, orientConstraint]를 반환하고,
              Scaling이 True이면 [pointConstraint, orientConstraint, scaleConstraint]를 반환합니다.
    """
    Point = cmds.pointConstraint(Static , Target , mo = MainTain)
    Orient = cmds.orientConstraint(Static , Target , mo = MainTain)
    Scale = None
    if Scaling:
        Scale = cmds.scaleConstraint(Static , Target , mo = MainTain)[0] # 'm'이 아닌 'mo'로 변경했습니다.

    return [Point[0] , Orient[0]] if Scaling == False else [Point[0] , Orient[0] , Scale]

def Constraint_SeceneAim(Static, Target , aimV = (1,0,0) , upV = (0,1,0) , worldV = (0,1,0)  , MainTain = True):
    """
    Static 오브젝트와 Target 오브젝트 사이에 'scene' worldUpType을 사용하는 aimConstraint를 생성합니다.
    Target 오브젝트가 Static 오브젝트를 바라보도록 합니다.

    Args:
        Static (str): 목표(바라볼) 오브젝트의 이름.
        Target (str): 바라볼 대상이 되는 오브젝트의 이름.
        aimV (tuple, optional): Target 오브젝트의 어떤 축이 Static 오브젝트를 향할지 정의하는 벡터. 기본값은 (1,0,0) (X축).
        upV (tuple, optional): Target 오브젝트의 어떤 축이 worldUpVector와 일치할지 정의하는 벡터. 기본값은 (0,1,0) (Y축).
        worldV (tuple, optional): 'scene' worldUpType에 사용될 세계 상향 벡터. 기본값은 (0,1,0).
        MainTain (bool, optional): 제약 조건 생성 시 대상 오브젝트의 현재 오프셋을 유지할지 여부. 기본값은 True.

    Returns:
        str: 생성된 aimConstraint 노드의 이름.
    """
    worldUpType = "scene"
    Aim = cmds.aimConstraint(Static , Target  , mo = MainTain , aim = aimV  , u = upV , wu = worldV , wut = worldUpType)
    return Aim[0]

def Constraint_VectorAim(Static, Target , aimV = (1,0,0) , upV = (0,1,0) , worldV = (0,1,0)  , MainTain = True):
    """
    Static 오브젝트와 Target 오브젝트 사이에 'vector' worldUpType을 사용하는 aimConstraint를 생성합니다.
    Target 오브젝트가 Static 오브젝트를 바라보도록 합니다.

    Args:
        Static (str): 목표(바라볼) 오브젝트의 이름.
        Target (str): 바라볼 대상이 되는 오브젝트의 이름.
        aimV (tuple, optional): Target 오브젝트의 어떤 축이 Static 오브젝트를 향할지 정의하는 벡터. 기본값은 (1,0,0) (X축).
        upV (tuple, optional): Target 오브젝트의 어떤 축이 worldUpVector와 일치할지 정의하는 벡터. 기본값은 (0,1,0) (Y축).
        worldV (tuple, optional): 'vector' worldUpType에 사용될 세계 상향 벡터. 기본값은 (0,1,0).
        MainTain (bool, optional): 제약 조건 생성 시 대상 오브젝트의 현재 오프셋을 유지할지 여부. 기본값은 True.

    Returns:
        str: 생성된 aimConstraint 노드의 이름.
    """
    worldUpType = "vector"
    Aim = cmds.aimConstraint(Static , Target  , mo = MainTain , aim = aimV  , u = upV , wu = worldV , wut = worldUpType)
    return Aim[0]

def Constraint_ObjRotateAim(Static, Target, Obj , aimV = (1,0,0) , upV = (0,1,0) , worldV = (0,1,0)  , MainTain = True):
    """
    Static 오브젝트와 Target 오브젝트 사이에 'objectrotation' worldUpType을 사용하는 aimConstraint를 생성합니다.
    Target 오브젝트가 Static 오브젝트를 바라보도록 하며, Obj 오브젝트의 회전을 세계 상향 벡터로 사용합니다.

    Args:
        Static (str): 목표(바라볼) 오브젝트의 이름.
        Target (str): 바라볼 대상이 되는 오브젝트의 이름.
        Obj (str): 'objectrotation' worldUpType에 사용될 오브젝트의 이름. 이 오브젝트의 회전이 세계 상향 벡터를 결정합니다.
        aimV (tuple, optional): Target 오브젝트의 어떤 축이 Static 오브젝트를 향할지 정의하는 벡터. 기본값은 (1,0,0) (X축).
        upV (tuple, optional): Target 오브젝트의 어떤 축이 worldUpVector와 일치할지 정의하는 벡터. 기본값은 (0,1,0) (Y축).
        worldV (tuple, optional): 'objectrotation' worldUpType에 사용될 세계 상향 벡터. 이 벡터는 Obj의 로컬 공간에서 해석됩니다. 기본값은 (0,1,0).
        MainTain (bool, optional): 제약 조건 생성 시 대상 오브젝트의 현재 오프셋을 유지할지 여부. 기본값은 True.

    Returns:
        str: 생성된 aimConstraint 노드의 이름.
    """
    worldUpType = "objectrotation"
    Aim = cmds.aimConstraint(Static , Target  , mo = MainTain , aim = aimV  , u = upV , wu = worldV , wut = worldUpType , wuo = Obj )
    return Aim[0]



class DistributeConstraint:
    """
    Start 객체와 End 객체 사이의 선형 구간(Linear)에 있는 물체들을 투영(Projection)하여,
    위치 비율에 따라 컨스트레인트 웨이트(Weight)를 자동으로 분배하는 클래스입니다.
    
    Usage:
        tool = DistributeConstraint("Start_Locator", "End_Locator")
        tool.addItems(["Obj_A", "Obj_B", "Obj_C"])
        tool.calculate()
        tool.parentConstraint_Build(mainTain=True)
    """

    def __init__(self, StartObj, EndObj):
        # Python 2 (Maya 2020 이하)와 Python 3 (Maya 2022 이상) 호환성 체크
        self._string_type = None
        try:
            self._string_type = basestring
        except NameError:
            self._string_type = str

        self.workList = []
        self.StartObj = self._defineObject(StartObj, True)
        self.EndObj = self._defineObject(EndObj, True)
        self.Data = []

    def addItems(self, item):
        """
        작업할 대상(아이템)을 리스트에 추가합니다.
        문자열, 리스트, 튜플 타입을 모두 지원합니다.
        """
        if isinstance(item, tuple):
            item = list(item)

        if isinstance(item, list):
            self.workList += item

        if isinstance(item, self._string_type):
            self.workList.append(item)

    def changeItemList(self, Lst):
        """
        작업 리스트를 새로운 리스트로 완전히 교체합니다.
        """
        if isinstance(Lst, tuple):
            Lst = list(Lst)
        if isinstance(Lst, list):
            self.workList = Lst

    def calculate(self, printBool=False):
        """
        [핵심 로직]
        벡터 내적(Dot Product)을 사용하여 각 아이템이 Start와 End 사이
        어느 지점에 위치하는지(0.0 ~ 1.0) 계산하고 데이터를 저장합니다.
        """
        self.Data = []
        
        # 1. Start, End 객체가 존재하는지 확인
        if self.StartObj and self.EndObj:
            # 월드 좌표 구하기
            StartPos = cmds.xform(self.StartObj, ws=1, t=1, q=1)
            EndPos = cmds.xform(self.EndObj, ws=1, t=1, q=1)

            # MVector 변환
            startV = om.MVector(StartPos[0], StartPos[1], StartPos[2])
            endV = om.MVector(EndPos[0], EndPos[1], EndPos[2])

            # 2. 기준 벡터(Start -> End) 계산
            CenterV = endV - startV
            CenterVdistance = round(CenterV.length(), 3) # 전체 길이

            # 길이가 너무 짧을 경우(0에 가까움) 에러 방지
            if CenterVdistance < 0.0001:
                cmds.warning("Start and End are too close!")
                return

            # 3. 각 아이템별 위치 비율 계산
            for x in self.workList:
                TargetPos = cmds.xform(x, ws=1, t=1, q=1)
                TargetV = om.MVector(TargetPos[0], TargetPos[1], TargetPos[2])

                # 빗변 벡터 (Start -> Target)
                DiffTargetV = TargetV - startV
                
                # [내적] 투영된 거리 계산 ( A . B )
                # CenterV는 정규화되지 않았으므로, 결과값은 (거리 * 전체길이)가 됨
                Dot = DiffTargetV * CenterV
                
                # 실제 투영 거리 (Projection Distance) 추출
                ProjectionDistance = Dot / CenterVdistance 
                
                # 4. 비율(0~1) 계산 및 클램핑(Clamp)
                # 0보다 작거나 1보다 큰 값을 0.0~1.0 사이로 자름
                raw_parameter = ProjectionDistance / CenterVdistance
                parameter = round(max(0, min(raw_parameter, 1)), 3)
                
                
                r_parameter = round(1.0 - parameter, 3)

                
                Dict = {
                    "obj": x, 
                    "parameter": parameter,     # EndObj 웨이트
                    "r_parameter": r_parameter, # StartObj 웨이트
                }
                self.Data.append(Dict)

        # 디버깅용 출력
        if printBool:
            for x in self.Data:
                print(x)

    def pointConstraint_Build(self, mainTain=True):
        """
        Point Constraint를 생성합니다.
        mainTain=True일 경우, 현재 위치를 유지하도록 오프셋을 자동 설정합니다.
        """
        built_constraints = []
        if self.Data:
            for data in self.Data:
                target_obj = data["obj"]
                
                
                orig_pos = cmds.xform(target_obj, q=True, t=True, ws=True)
                
                
                constraint = cmds.pointConstraint(self.StartObj, self.EndObj, target_obj, mo=False)[0]
                
                
                cmds.setAttr("{}.{}W0".format(constraint, self.StartObj), data["r_parameter"])
                cmds.setAttr("{}.{}W1".format(constraint, self.EndObj), data["parameter"])

                
                if mainTain:
                    cmds.xform(target_obj, t=orig_pos, ws=True)
                    cmds.pointConstraint(constraint, e=True, mo=True)
                    built_constraints.append(constraint)
        return built_constraints

    def orientConstraint_Build(self, mainTain=True):
        """
        Orient Constraint를 생성합니다.
        회전값의 짐벌락이나 오일러 계산 오류를 피하기 위해 마야의 업데이트 기능을 활용합니다.
        """
        built_constraints = []
        if self.Data:
            for data in self.Data:
                target_obj = data["obj"]

                
                original_rot = cmds.xform(target_obj, q=True, ro=True, ws=True)
                
                
                constraint = cmds.orientConstraint(self.StartObj, self.EndObj, target_obj, mo=False)[0]
                
                
                cmds.setAttr("{}.{}W0".format(constraint, self.StartObj), data["r_parameter"])
                cmds.setAttr("{}.{}W1".format(constraint, self.EndObj), data["parameter"])

                
                if mainTain:
                    cmds.xform(target_obj, ro=original_rot, ws=True)
                    cmds.orientConstraint(constraint, e=True, mo=True)
                    built_constraints.append(constraint)
        return built_constraints
    

    def parentConstraint_Build(self, mainTain=True):
        """
        Parent Constraint를 생성합니다.
        위치와 회전을 모두 고려하여 오프셋을 설정합니다.
        """
        built_constraints = []
        if self.Data:
            for data in self.Data:
                target_obj = data["obj"]

                
                orig_pos = cmds.xform(target_obj, q=True, t=True, ws=True)
                orig_rot = cmds.xform(target_obj, q=True, ro=True, ws=True)
                
                
                constraint = cmds.parentConstraint(self.StartObj, self.EndObj, target_obj, mo=False)[0]
                
                
                cmds.setAttr("{}.{}W0".format(constraint, self.StartObj), data["r_parameter"])
                cmds.setAttr("{}.{}W1".format(constraint, self.EndObj), data["parameter"])
                
                
                if mainTain:
                    cmds.xform(target_obj, t=orig_pos, ro=orig_rot, ws=True)
                    cmds.parentConstraint(constraint, e=True, mo=True)
                    built_constraints.append(constraint)

        return built_constraints

    def _defineObject(self, target, raiseBool=False):
        """
        (내부 헬퍼) 입력된 오브젝트가 문자열인지, 씬에 실제로 존재하는지 검사합니다.
        """
        returnItem = None
        
        if not isinstance(target, self._string_type):
            if raiseBool:
                variableType = type(target).__name__
                raise TypeError("> Invalid type for '{var}'. Expected a string, but got {varType}.".format(var=str(target), varType=variableType))
            return returnItem
            
        
        if not cmds.objExists(target):
            if raiseBool:
                raise ValueError("> Object '{}' does not exist in the scene.".format(target))
            return returnItem
            
        returnItem = target
        return returnItem
    




class MultiFollowManager:
    """
    Maya 리깅 시 애니메이터를 위한 Space Switch(Multi Follow) 시스템을 
    자동으로 구성하고 Set Driven Key를 연결해주는 관리 클래스입니다.
    """
    
    def __init__(self, item, attrName):
        """
        클래스 초기화 및 기본 데이터를 세팅합니다.

        Args:
            item (str): Enum 어트리뷰트가 있거나 생성될 컨트롤러(오브젝트) 이름.
            attrName (str): 공간 전환에 사용할 Enum 어트리뷰트 이름.

        Raises:
            TypeError: 파라미터가 문자열(string) 타입이 아닐 경우.
            ValueError: 지정한 item 오브젝트가 씬에 존재하지 않을 경우.
        """
        try:
            self._string_type = basestring
        except NameError:
            self._string_type = str

        if not isinstance(item, self._string_type):
            raise TypeError(u">> item 파라미터는 string 타입이어야 합니다: {}".format(item))
            
        if not cmds.objExists(item):
            raise ValueError(u">> '{}' 오브젝트가 존재하지 않습니다.".format(item))
            
        if not isinstance(attrName, self._string_type):
            raise TypeError(u">> attrName 파라미터는 string 타입이어야 합니다: {}".format(attrName))
        
        self.item = item
        self.attrName = attrName
        self.attrItem = "{}.{}".format(item, attrName)
        self.managerNode = None
        self.enumElements = None
        self.enumReplaceData = None
        self.followNodesDict = OrderedDict()
        self.packingGrp = None
        
    def defineEnumAttr(self):
        """
        오브젝트에 이미 존재하는 Enum 어트리뷰트를 읽어와 내부 데이터로 정의합니다.

        Raises:
            ValueError: 어트리뷰트가 존재하지 않거나 Enum 요소가 없을 경우.
            TypeError: 지정된 어트리뷰트의 타입이 Enum이 아닐 경우.
        """
        if not self._existAttr(self.item, self.attrName):
            raise ValueError(u"{}.{}가 존재하지 않습니다.".format(self.item, self.attrName))
        if not self._getAttrType(self.item, self.attrName) == "enum":
            raise TypeError(u"{}.{}은(는) enum 데이터가 아닙니다.".format(self.item, self.attrName))
        if not self._getEnumData(self.item, self.attrName):
            raise ValueError(u"{}.{}에 enum 데이터 요소가 없습니다.".format(self.item, self.attrName))
        
        self.enumElements = self._getEnumData(self.item, self.attrName)

    def createEnumAttr(self, enums):
        """
        오브젝트에 새로운 Enum 어트리뷰트를 생성하고 내부 데이터로 정의합니다.

        Args:
            enums (str or list or tuple): 생성할 Enum 목록 (예: "Head:Body:World" 또는 ["Head", "Body", "World"]).
        """
        self._addAttrEunm(self.item, self.attrName, enums)
        self.enumElements = self._getEnumData(self.item, self.attrName)

    def defineConstraintObjData(self, Data):
        """
        Follow 타겟 노드들의 이름을 사용자가 직접 리스트로 명시하여 지정할 때 사용합니다.

        Args:
            Data (list or tuple): 타겟 노드에 적용할 이름 리스트 (예: ["C_Head_Space", "C_Body_Space"]).

        Returns:
            OrderedDict: Enum 요소를 키(Key)로, 지정된 이름을 값(Value)으로 가지는 데이터 사전.

        Raises:
            RuntimeError: Enum 데이터가 미리 정의되지 않았을 경우.
            TypeError: 입력된 데이터가 리스트/튜플이 아니거나 문자열 요소가 아닐 경우.
            ValueError: 입력된 이름의 개수와 Enum 항목의 개수가 다를 경우.
        """
        if not self.enumElements:
            raise RuntimeError(u"enum 데이터가 없습니다. defineEnumAttr 메서드를 통해 생성해주세요.")
        if not isinstance(Data, (list, tuple)):
            raise TypeError(u"{}는 list, tuple만 허용됩니다.".format(Data))
        if not all(isinstance(x, self._string_type) for x in Data):
            raise TypeError(u"{}의 모든 요소는 string 타입이어야 합니다.".format(Data))

        if len(Data) != len(self.enumElements):
            raise ValueError(u"입력된 이름 개수({})가 Enum 개수({})와 다릅니다.".format(len(Data), len(self.enumElements)))

        dictData = OrderedDict()
        for x in range(len(self.enumElements)):
            dictData[self.enumElements[x]] = Data[x]
            
        return dictData
        
    def createMultiFollow(self, mainConstraintName=None, PosTarget=None, customNames=None):
        """
        공간 전환의 핵심이 되는 Manager 노드와 각각의 Follow 타겟 노드들을 생성하고 매핑합니다.

        Args:
            mainConstraintName (str, optional): 생성될 매니저 노드의 커스텀 이름. 기본값은 None ('어트리뷰트명_FollowManager').
            PosTarget (str, optional): 생성될 노드들이 위치(Transform)를 맞출 대상 타겟 오브젝트. 기본값은 None.
            customNames (dict or list, optional): 타겟 노드들의 이름을 덮어씌울 커스텀 데이터. 기본값은 None.

        Raises:
            RuntimeError: Enum 데이터가 미리 정의되지 않았을 경우.
        """
        if not self.enumElements:
            raise RuntimeError(u"enum 데이터가 없습니다. defineEnumAttr 메서드를 통해 생성해주세요.")

        self.managerNode = mainConstraintName if mainConstraintName else "{}_FollowManager".format(self.attrName)
        if not cmds.objExists(self.managerNode):
            cmds.createNode("transform", n=self.managerNode)
            if PosTarget:
                self._xformPos(PosTarget, self.managerNode)

        self.followNodesDict.clear()
        name_map = customNames if isinstance(customNames, dict) else {}

        for enum_name in self.enumElements:
            basic_name = "{}_{}".format(enum_name, "follow")
            follow_name = name_map.get(enum_name, basic_name)
            
            obj = cmds.createNode("transform", n=follow_name)
            if PosTarget:
                self._xformPos(PosTarget, obj)
                
            self.followNodesDict[enum_name] = obj
            
    def packing(self, packingName=None):
        """
        생성된 Manager 노드와 Follow 노드들을 하나의 그룹(Grp) 아래로 정리(Parent)합니다.

        Args:
            packingName (str, optional): 생성될 패킹 그룹의 이름. 기본값은 None ('매니저이름_Setting').

        Raises:
            ValueError: 매니저 노드나 Follow 타겟 노드가 생성되지 않았을 경우.
        """
        manager = self.managerNode
        targets = list(self.followNodesDict.values())
        
        if not manager or not cmds.objExists(manager):
            raise ValueError(u"컨스트레인 Manager 오브젝트가 없습니다. createMultiFollow를 먼저 실행하세요.")
        if not targets:
            raise ValueError(u"컨스트레인 follow 오브젝트가 없습니다.")
        
        grp_name = packingName if isinstance(packingName, self._string_type) else manager + "_Setting"
        
        if not cmds.objExists(grp_name):
            grp = cmds.createNode("transform", n=grp_name)
        else:
            grp = grp_name
            
        if grp:
            self._xformPos(manager, grp)
            
            try:
                cmds.parent(manager, grp)
            except RuntimeError:
                pass 
        
            for x in targets:
                try:
                    cmds.parent(x, grp)
                except RuntimeError:
                    pass
        self.packingGrp = grp

    def multiConstraint(self, constraintType="parentConstraint"):
        """
        Follow 타겟 노드들이 Manager 노드를 제어하도록 컨스트레인을 걸고,
        Enum 값에 따라 웨이트(Weight)가 변경되도록 Set Driven Key를 연결합니다.

        Args:
            constraintType (str, optional): 적용할 컨스트레인 종류 ('parentConstraint', 'pointConstraint', 'orientConstraint', 'scaleConstraint'). 기본값은 'parentConstraint'.

        Raises:
            ValueError: 매니저 오브젝트나 Follow 타겟 노드가 없을 경우.
            RuntimeError: 컨스트레인 노드 생성에 실패했을 경우.
        """
        if not cmds.objExists(self.managerNode):
            raise ValueError(u"컨스트레인 Manager 오브젝트가 없습니다.")
        if not self.followNodesDict:
            raise ValueError(u"생성된 follow 오브젝트가 없습니다. createMultiFollow를 먼저 실행하세요.")

        targets = list(self.followNodesDict.values())
        weight_attrs = None
        constraintNode = None

        if constraintType == "parentConstraint":
            constraintNode = cmds.parentConstraint(targets, self.managerNode, mo=True)[0]
        elif constraintType == "pointConstraint":
            constraintNode = cmds.pointConstraint(targets, self.managerNode, mo=True)[0]
        elif constraintType == "orientConstraint":
            constraintNode = cmds.orientConstraint(targets, self.managerNode, mo=True)[0]
        elif constraintType == "scaleConstraint":
            constraintNode = cmds.scaleConstraint(targets, self.managerNode, mo=True)[0]

        if not constraintNode:
            raise RuntimeError(u"컨스트레인 생성에 실패했습니다.")

        if constraintType == "parentConstraint":
            weight_attrs = cmds.parentConstraint(constraintNode, q=True, weightAliasList=True)
        elif constraintType == "pointConstraint":
            weight_attrs = cmds.pointConstraint(constraintNode, q=True, weightAliasList=True)
        elif constraintType == "orientConstraint":
            weight_attrs = cmds.orientConstraint(constraintNode, q=True, weightAliasList=True)
        elif constraintType == "scaleConstraint":
            weight_attrs = cmds.scaleConstraint(constraintNode, q=True, weightAliasList=True)

        for i, (enum_name, target_node) in enumerate(self.followNodesDict.items()):
            for attr_index, weight_attr in enumerate(weight_attrs):
                full_attr_path = "{}.{}".format(constraintNode, weight_attr)
                
                weight_value = 1 if i == attr_index else 0
                cmds.setDrivenKeyframe(
                    full_attr_path, 
                    cd=self.attrItem, 
                    dv=i, 
                    v=weight_value, 
                    itt='linear', 
                    ott='linear'
                )

    # -------------------------------------------------------------------- Helper Functions
    def _xformPos(self, posItem, matchItem):
        """
        타겟 오브젝트(posItem)의 트랜스폼(위치, 회전, 스케일)을 대상(matchItem)에 매칭합니다.
        
        Args:
            posItem (str): 위치 정보를 제공할 기준 오브젝트.
            matchItem (str): 위치가 이동될 대상 오브젝트.
        """
        if not cmds.objExists(posItem):
            raise ValueError(u"{}가 존재하지 않습니다.".format(posItem))
        if not cmds.objExists(matchItem):
            raise ValueError(u"{}가 존재하지 않습니다.".format(matchItem))

        pos_trans = cmds.xform(posItem, q=True, ws=True, t=True)
        if pos_trans == [0.0, 0.0, 0.0]:
            pos_trans = cmds.xform(posItem, q=True, ws=True, rp=True)
            
        pos_rotate = cmds.xform(posItem, q=True, ws=True, ro=True)
        pos_scale = cmds.xform(posItem, q=True, ws=True, s=True)

        cmds.xform(matchItem, ws=True, t=pos_trans, ro=pos_rotate, s=pos_scale)

    def _existAttr(self, item, attr):
        """어트리뷰트 존재 여부를 확인합니다."""
        return cmds.objExists("{}.{}".format(item, attr))
        
    def _getAttrType(self, item, attr):
        """어트리뷰트의 데이터 타입을 반환합니다."""
        if self._existAttr(item, attr):
            return cmds.attributeQuery(attr, node=item, attributeType=True)
        return None
        
    def _getEnumData(self, item, attr, split=True):
        """Enum 어트리뷰트 내의 문자열 요소들을 리스트로 반환합니다."""
        if self._existAttr(item, attr):
            enums = cmds.attributeQuery(attr, node=item, listEnum=True)[0]
            if split:
                return enums.split(":")
        return None

    def _addAttrEunm(self, item, attr, enumData):
        """오브젝트에 Enum 어트리뷰트를 새로 추가하거나 갱신합니다."""
        addEnum = None
        if isinstance(enumData, self._string_type) and ":" in enumData:
            addEnum = enumData
        elif isinstance(enumData, (list, tuple)):
            addEnum = ":".join(enumData)
            
        if addEnum is None:
            raise ValueError(u"{}에 데이터가 없습니다.".format(enumData))
        
        if self._existAttr(item, attr):
            if self._getAttrType(item, attr) != "enum":
                raise TypeError(u">> {}.{} 는 존재하나, 타입이 enum 타입이 아닙니다.".format(item, attr))
            cmds.addAttr("{}.{}".format(item, attr), e=True, en=addEnum)
        else:
            cmds.addAttr(item, ln=attr, at="enum", en=addEnum, k=True)