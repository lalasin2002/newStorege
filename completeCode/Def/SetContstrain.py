# -*- coding: utf-8 -*-
import maya.cmds as cmds


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

    def orientConstraint_Build(self, mainTain=True):
        """
        Orient Constraint를 생성합니다.
        회전값의 짐벌락이나 오일러 계산 오류를 피하기 위해 마야의 업데이트 기능을 활용합니다.
        """
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

    def parentConstraint_Build(self, mainTain=True):
        """
        Parent Constraint를 생성합니다.
        위치와 회전을 모두 고려하여 오프셋을 설정합니다.
        """
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