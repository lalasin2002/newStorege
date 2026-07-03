# -*- coding: utf-8 -*-
import maya.cmds as cmds


def Grping(Target, Count, Grp_Suffix=["_Grp", "_Offset", "_Prime", '_GrpPrime'], prefix=False):
    '''
    대상 오브젝트 위치에 여러 겹의 부모 그룹(Hierarchy)을 생성하고 스냅(매치)합니다.

    Args:
        Target (str): 그룹 계층을 생성할 대상(자식) 오브젝트 이름.
        Count (int): 생성할 그룹의 개수 (Grp_Suffix 리스트 범위 내).
        Grp_Suffix (list, optional): 생성할 그룹 이름에 붙을 접미사(또는 접두사) 리스트. 기본값은 ["_Grp", "_Offset", "_Prime", '_GrpPrime'].
        prefix (bool, optional): True일 경우 Grp_Suffix를 접미사 대신 접두사(Prefix)로 사용합니다. 기본값은 False.

    Returns:
        list: 생성된 그룹들의 노드 이름 리스트 (가장 바깥쪽 부모부터 안쪽 순서).

    Example:
        >>> groups = Grping("L_Arm_Ctrl", 2)
    '''
    Count = int(Count) # Count를 정수로 변환
    Groups =[] # 생성된 그룹들을 저장할 리스트
    Parent_Group = None # 이전 그룹을 저장하여 계층을 구축

    # 지정된 Count 만큼 그룹 생성 및 계층화
    for i, x in enumerate(Grp_Suffix[:Count]):
        if prefix:
            Group = cmds.createNode("transform", n="{}{}".format(x, Target))
        else:
            Group = cmds.createNode("transform", n="{}{}".format(Target, x))

        if Parent_Group:
            cmds.parent(Parent_Group, Group) # 이전 그룹을 현재 그룹의 자식으로 설정 (바깥쪽에서 안쪽으로)
        Parent_Group = Group # 현재 그룹을 이전 그룹으로 업데이트
        Groups.append(Group)

    # 가장 바깥쪽 그룹을 대상 오브젝트의 위치에 스냅하고 제약 조건 삭제
    cmds.delete(cmds.parentConstraint(Target, Groups[-1]))
    # 대상 오브젝트를 가장 안쪽 그룹의 자식으로 설정
    cmds.parent(Target, Groups[0])

    return Groups


def insertGrp(target, names=[], match=True, keepParent=True):
    '''
    대상 오브젝트와 기존 부모 노드 사이에 지정된 이름의 새로운 그룹 계층을 순차적으로 끼워 넣습니다.

    Args:
        target (str): 그룹을 씌울 기존 자식 대상 오브젝트 이름.
        names (list, optional): 생성할 중간 그룹 노드들의 이름 리스트. 기본값은 [].
        match (bool, optional): 생성되는 새 그룹들의 트랜스폼을 target 오브젝트의 위치/회전에 맞출지 여부. 기본값은 True.
        keepParent (bool, optional): 기존 target의 부모 계층을 유지하여, 새로 만들어진 가장 상위 그룹을 그 부모 아래에 넣을지 여부. 기본값은 True.

    Returns:
        list: 새롭게 생성된 중간 그룹 노드들의 리스트.
    '''
    Groups = []
    isParent = None
    matrix = None
    
    if keepParent:
        isParent = cmds.listRelatives(target, p=1, fullPath=1)

    if match:
        matrix = cmds.xform(target, q=1, ws=1, m=1)
        
    child = None
    for x in names:
        if child is None:
            child = target 

        grp = cmds.createNode("transform", n=x)
        if matrix:
            cmds.xform(grp, ws=1, m=matrix)
            
        cmds.parent(child, grp)
        Groups.append(grp)
        child = grp

    if isParent:
        cmds.parent(Groups[-1], isParent[0])

    return Groups
    

class connectParent():
    '''
    두 오브젝트(Constraint를 주는 쪽과 연결받는 쪽) 간의 복잡한 그룹 구조와 
    Constraint / Node Connection을 일괄적으로 셋업(Setup)해 주는 클래스입니다.
    '''
    def __init__(self):
        try:
            self.string_type = basestring
        except NameError:
            self.string_type = str
        self.dictWork = {}

    def addTarget(self, target):
        '''
        셋업을 진행할 기준(Origin) 오브젝트를 내부 작업 딕셔너리(dictWork) 목록에 추가합니다.

        Args:
            target (str or list or tuple): 작업 목록에 추가할 씬 내의 마야 오브젝트 이름 또는 리스트.
        '''
        additem = self._defineElement(target)
        if additem is None:
            return
        for x in additem if isinstance(additem, (list, tuple)) else [additem]:
            if x not in self.dictWork:
                self.dictWork[x] = {
                    "origin": x,
                    "constraintName": None,
                    "connectName": None,
                    "constraintGrps": [],
                    "connectGrps": [],
                    "constraintTypes": [],
                    "connectTypes": [],
                    "connectTarget": None
                }
                
    def setWorkTarget(self, target, constraintName=None, connectName=None):
        '''
        해당 기준 오브젝트에 대해 생성될 Constraint용 그룹과 Connect용 최상위 트랜스폼 이름을 지정합니다.

        Args:
            target (str): addTarget으로 추가했던 기준 오브젝트 이름.
            constraintName (str, optional): Constraint(제어자) 역할을 할 최상위 트랜스폼 이름.
            connectName (str, optional): Connect(피제어자) 역할을 할 최상위 트랜스폼 이름.
        '''
        if target not in self.dictWork:
            return
        if isinstance(constraintName, self.string_type):
            self.dictWork[target]["constraintName"] = constraintName
        if isinstance(connectName, self.string_type):
            self.dictWork[target]["connectName"] = connectName
    
    def setGroupData(self, target, constraintGrpList=None, connectGrpList=None):
        '''
        각 생성될 최상위 트랜스폼 아래에 겹겹이 쌓을 중간 서브 그룹(Offset 계층 등)의 이름 리스트를 설정합니다.

        Args:
            target (str): 기준 오브젝트 이름.
            constraintGrpList (list of str, optional): Constraint용 계층에 추가할 서브 그룹 이름 리스트.
            connectGrpList (list of str, optional): Connect용 계층에 추가할 서브 그룹 이름 리스트.
        '''
        if target not in self.dictWork:
            return 
        if isinstance(constraintGrpList, (list, tuple)) and all(isinstance(x, self.string_type) for x in constraintGrpList):
            self.dictWork[target]["constraintGrps"] = constraintGrpList
            
        if isinstance(connectGrpList, (list, tuple)) and all(isinstance(x, self.string_type) for x in connectGrpList):
            self.dictWork[target]["connectGrps"] = connectGrpList
            
    def setConstraintData(self, target, constraints=["parentConstraint"]):
        '''
        Constraint용 노드가 Connect용 노드를 제어할 때 사용할 마야 Constraint 방식을 설정합니다.

        Args:
            target (str): 기준 오브젝트 이름.
            constraints (list of str, optional): 적용할 Constraint 방식 리스트 ("parentConstraint", "pointConstraint" 등). 기본값은 ["parentConstraint"].
        '''
        if target not in self.dictWork:
            return 
            
        if isinstance(constraints, (list, tuple)) and all(x in ["parentConstraint", "pointConstraint", "orientConstraint", "scaleConstraint"] for x in constraints):
            self.dictWork[target]["constraintTypes"] = constraints 
    
    def setConnectData(self, target, connectTarget=None, connects=["translate", "rotate"]):
        '''
        최종적으로 Connect 그룹이 Direct Connection(노드 연결)을 통해 값을 넘겨줄 타겟과 속성을 설정합니다.

        Args:
            target (str): 기준 오브젝트 이름.
            connectTarget (str, optional): 실제 속성 값을 전달받을 최종 대상(Target) 오브젝트.
            connects (list of str, optional): 연결할 속성(Channel) 리스트 ("translate", "rotate", "scale"). 기본값은 ["translate", "rotate"].
        '''
        if target not in self.dictWork:
            return
            
        if self._isDag(connectTarget) and connectTarget:
            self.dictWork[target]["connectTarget"] = connectTarget
            
        if isinstance(connects, (list, tuple)) and all(x in ["translate", "rotate", "scale"] for x in connects):
            self.dictWork[target]["connectTypes"] = connects
    
    def build(self):
        '''
        설정된 모든 셋업 데이터(WorkDict)를 바탕으로 씬 내에 실제 트랜스폼 계층을 생성하고 
        Constraint 및 Attribute Connection을 일괄 실행(Build)합니다.

        Returns:
            None
        '''
        if not any([[x.get("origin") for x in self.dictWork.values()]]):
            return

        parentList = []
        for key, dictData in self.dictWork.items():
            constraintObj = None
            connectObj = None
            
            origin = dictData.get("origin")
            constraintName = dictData.get("constraintName")
            connectName = dictData.get("connectName")
            constraintGrps = dictData.get("constraintGrps")
            connectGrps = dictData.get("connectGrps")
            constraintTypes = dictData.get("constraintTypes")
            connectTypes = dictData.get("connectTypes")
            connectTarget = dictData.get("connectTarget")
            if not origin:
                continue
            
            if constraintName:
                constraintObj = cmds.createNode("transform", n=constraintName)
                constraintMatrix = self._getMatrix(origin)
                cmds.xform(constraintObj, ws=1, m=constraintMatrix)
            if connectName:
                connectObj = cmds.createNode("transform", n=connectName)
                connectMatrix = self._getMatrix(origin)
                cmds.xform(connectObj, ws=1, m=connectMatrix)

            if constraintGrps and constraintObj:
                constraintGrpObjs = self._insertGrp(constraintObj, constraintGrps, match=True, keepParent=True)
            if connectGrps and connectObj:
                connectGrpObjs = self._insertGrp(connectObj, connectGrps, match=True, keepParent=False)
                parentList.append((connectObj, connectGrpObjs[-1]))

            if constraintTypes and constraintObj and connectObj:
                for x in constraintTypes:
                    try:
                        if x == "parentConstraint":
                            cmds.parentConstraint(constraintObj, connectObj, mo=True)
                        elif x == "pointConstraint":
                            cmds.pointConstraint(constraintObj, connectObj, mo=True)
                        elif x == "orientConstraint":
                            cmds.orientConstraint(constraintObj, connectObj, mo=True)
                        elif x == "scaleConstraint":
                            cmds.scaleConstraint(constraintObj, connectObj, mo=True)
                    except Exception as e:
                        cmds.warning("컨스트레인트 실패 ({}): {}".format(x, e))

            if connectTypes and connectObj and connectTarget:
                for attr in connectTypes:
                    for axis in ["X", "Y", "Z"]:
                        src = "{}.{}{}".format(connectObj, attr, axis)
                        dst = "{}.{}{}".format(connectTarget, attr, axis)
                        try:
                            cmds.connectAttr(src, dst)
                        except Exception as e:
                            cmds.warning("연결 실패 ({} -> {}): {}".format(src, dst, e))

        count = 0
        oldParent = None
        for target, grp in parentList:
            if count == 0:
                cmds.setAttr(grp + ".visibility", 0)
            if oldParent:
                cmds.parent(grp, oldParent)
            oldParent = target
            count += 1
            
    # ------------------------------------------------------------------
    # Helper Methods
    # ------------------------------------------------------------------

    def _insertGrp(self, target, names=[], match=True, keepParent=True):
        '''
        (내부 헬퍼) connectParent 셋업 과정 중, 지정된 트랜스폼 노드 아래에 그룹 계층을 
        안전하게 삽입(Insert)하기 위해 사용되는 독립적인 그룹화 메서드입니다.

        Args:
            target (str): 그룹 계층을 씌울 대상 오브젝트.
            names (list): 삽입할 중간 그룹 노드 이름 리스트.
            match (bool): 트랜스폼 매트릭스 동기화 여부.
            keepParent (bool): 기존 부모 계층 유지 여부.

        Returns:
            list: 생성된 중간 그룹 노드 리스트.
        '''
        Groups = []
        isParent = None
        matrix = None
        if keepParent:
            isParent = cmds.listRelatives(target, p=1, fullPath=1)

        if match:
            matrix = cmds.xform(target, q=1, ws=1, m=1)
            
        child = None
        for x in names:
            if child is None:
                child = target 
            grp = cmds.createNode("transform", n=x)
            if matrix:
                cmds.xform(grp, ws=1, m=matrix)
            cmds.parent(child, grp)
            Groups.append(grp)
            child = grp

        if isParent:
            cmds.parent(Groups[-1], isParent[0])

        return Groups

    def _getMatrix(self, item):
        '''
        (내부 헬퍼) 지정된 오브젝트의 월드 공간 매트릭스(World Matrix) 정보를 추출합니다.

        Args:
            item (str): 조회할 마야 오브젝트 이름.

        Returns:
            list: 16자리 부동 소수점으로 구성된 월드 매트릭스 리스트. 실패 시 빈 리스트 반환.
        '''
        if not isinstance(item, self.string_type):
            return []
        if not self._isDag(item):
            return []
        pos = cmds.xform(item, q=1, ws=1, m=1)
        return pos

    def _isDag(self, item):    
        '''
        (내부 헬퍼) 대상 이름이 마야 씬 내에 존재하며 DAG(Directed Acyclic Graph) 계층에 속하는 
        물리적 노드(Transform, Shape 등)인지 판별합니다.

        Args:
            item (str): 판별할 마야 노드 이름.

        Returns:
            bool: DAG 노드이면 True, 아니면 False.
        '''
        if not cmds.objExists(item):
            print("Warning: '{}' 오브젝트가 존재하지 않습니다.".format(item))
            return False
        inherited_types = cmds.nodeType(item, inherited=True)
        return "dagNode" in inherited_types
    
    def _additemToList(self, listVar, item):
        '''
        (내부 헬퍼) 검증된 DAG 오브젝트(단일 객체 또는 리스트/튜플)를 지정된 리스트 변수에 안전하게 병합(Extend/Append)합니다.

        Args:
            listVar (list): 아이템을 담을 목적지 리스트 변수.
            item (str, list, tuple): 목적지 리스트에 추가할 마야 오브젝트(들).
        '''
        if item is None or not isinstance(listVar, list):
            return
        if isinstance(item, self.string_type) and self._isDag(item):
            listVar.append(item)
        if isinstance(item, list) and all(self._isDag(x) for x in item):
            listVar.extend(item)
        if isinstance(item, tuple) and all(self._isDag(x) for x in item):
            listVar.extend(list(item))

    def _defineElement(self, item):
        '''
        (내부 헬퍼) 입력된 아이템이 유효한 단일 오브젝트인지, 또는 유효한 오브젝트들의 리스트/튜플인지 검증하고 정제하여 반환합니다.

        Args:
            item (any): 검증할 데이터.

        Returns:
            str or list or tuple or None: 검증에 통과한 원본 데이터. 실패 시 None.
        '''
        returns = None
        if isinstance(item, (tuple, list)):
            if all(self._isDag(x) for x in item):
                returns = item
        if self._isDag(item):
            returns = item
        return returns