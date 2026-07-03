# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.api.OpenMaya as om


class orientManager():
    '''
    오브젝트의 방향성(Orient, Aim, Tangent 등)과 관련된 Constraint 옵션을 설정하고, 
    해당 옵션을 바탕으로 실제 축 정렬을 실행하는 매니저 클래스입니다.
    '''
    def __init__(self):
        self.string_type = None
        try:
            self.string_type = basestring
        except NameError:
            self.string_type = str

        self.currentFlag = None

    def getRotate(self , item , flag = {"ws" : True , "ro" : True}  ):
        self._validate_object(item)
        if not isinstance(flag , dict):
            raise ValueError(u"getRotate 에러 : flag 인자가 유효하지 않습니다. (dict or None)")

        rotate = cmds.xform(item , q =1 ,**flag)
        return rotate
    
    def getJointOrient(self , item ):
        self._validate_object(item)
        if not cmds.nodeType(item) == "joint":
            raise ValueError(u"getJointOrient 에러 : {}은 joint가 아닙니다." .format( item ))
        return cmds.joint(item, q=True, orientation=True)

        
    def makeOrientFlag(self, aimV=(1, 0, 0), upV=(0, 1, 0), worldV=(0, 1, 0), upObj=None, maintainOffset=False, worldUpType=None):
        '''
        Aim 또는 Tangent Constraint에 사용할 방향 설정 플래그(Dictionary)를 생성하고 내부(currentFlag)에 저장합니다.

        Args:
            aimV (tuple or list, optional): 타겟을 향할 기준 축 벡터. 기본값 (1, 0, 0).
            upV (tuple or list, optional): 위를 향할 기준 업 벡터. 기본값 (0, 1, 0).
            worldV (tuple or list, optional): 월드 공간 기준의 업 벡터. 기본값 (0, 1, 0).
            upObj (str, optional): 업 벡터 계산에 참조할 타겟 오브젝트 이름. 기본값 None.
            maintainOffset (bool, optional): 현재 오프셋 유지 여부. 기본값 False.
            worldUpType (str, optional): 업 벡터 계산 방식 ("scene", "object", "objectrotation", "vector", "none"). 
                                         지정하지 않으면 upObj 유무에 따라 자동 설정됩니다.

        Returns:
            dict: Constraint 명령어에 전달할 플래그 딕셔너리.
        '''
        flags = {}
        self._validate_vector(aimV, "aimV")
        self._validate_vector(upV, "upV")
        self._validate_vector(worldV, "worldV")
        if upObj:
            self._validate_object(upObj)

        if worldUpType is None:
            if upObj:
                worldUpType = "objectrotation"
            else:
                worldUpType = "scene"

        # Maya aimConstraint에서 사용 가능한 worldUpType 방어
        if worldUpType not in ["scene", "object", "objectrotation", "vector", "none"]:
            raise ValueError(u"worldUpType 값이 유효하지 않습니다: {}".format(worldUpType))
        
        flags = {
            "aim": aimV,
            "u": upV,
            "wu": worldV,
            "wut": worldUpType,
            "mo": maintainOffset
        }
        
        if upObj:
            flags["wuo"] = upObj

        self.currentFlag = flags
        return flags
    
    def aimOrientObject(self, aimTarget, destinationTaget, deleteConstaint=False, flag=None):
        '''
        대상 오브젝트(destinationTaget)가 특정 오브젝트(aimTarget)를 바라보도록 Aim Constraint를 적용합니다.

        Args:
            aimTarget (str): 바라봐질 타겟 오브젝트 이름.
            destinationTaget (str): 회전되어 방향이 바뀔 대상 오브젝트 이름.
            deleteConstaint (bool, optional): 축 정렬 후 Constraint 노드를 삭제하여 회전값만 구울지(Bake) 여부. 기본값 False.
            flag (dict, optional): makeOrientFlag에서 생성한 옵션 딕셔너리. None일 경우 저장된 currentFlag 사용.

        Returns:
            str or None: 생성된 Constraint 노드 이름. 삭제(deleteConstaint=True) 시 None 반환.
        '''
        self._validate_object(aimTarget)
        self._validate_object(destinationTaget)
        aimFlag = {}
        if isinstance(flag, dict):
            aimFlag = flag
        elif flag is None and self.currentFlag:
            aimFlag = self.currentFlag
        else:
            raise ValueError(u"aimOrientObject 에러 : flag 인자가 유효하지 않습니다. (dict or None)")
        
        constraint = cmds.aimConstraint(aimTarget, destinationTaget, **aimFlag)
        if deleteConstaint:
            cmds.delete(constraint)
            return None
        else:
            return constraint
    
    def tangentOrientObject(self, curveObj, destinationTarget, deleteConstraint=False, flag=None):
        '''
        대상 오브젝트(destinationTarget)가 특정 커브(curveObj)의 곡률(Tangent) 방향을 따르도록 Tangent Constraint를 적용합니다.

        Args:
            curveObj (str): 기준이 될 NURBS 커브 노드(또는 커브 Shape을 가진 Transform 노드).
            destinationTarget (str): 회전되어 방향이 바뀔 대상 오브젝트 이름.
            deleteConstraint (bool, optional): 축 정렬 후 Constraint 노드를 삭제할지 여부. 기본값 False.
            flag (dict, optional): makeOrientFlag에서 생성한 옵션 딕셔너리.

        Returns:
            str or None: 생성된 Constraint 노드 이름. 삭제 시 None 반환.
        '''
        self._validate_object(curveObj)
        self._validate_object(destinationTarget)
        curve = None
        if cmds.nodeType(curveObj) == "nurbsCurve":
            curve = curveObj
        if cmds.nodeType(curveObj) == "transform":
            isShape = cmds.listRelatives(curveObj, s=1)
            if isShape:
                if cmds.nodeType(isShape[0]) == "nurbsCurve":
                    curve = isShape[0]
        
        if curve is None:
            raise ValueError(u"tangentOrientObject 에러 : curveObj 인자가 nurbsCurve를 포함한 transform이 아닙니다.")

        tangentFlag = {}

        if isinstance(flag, dict):
            tangentFlag = flag
        elif flag is None and self.currentFlag:
            tangentFlag = self.currentFlag
        else:
            raise ValueError(u"tangentOrientObject 에러 : flag 인자가 유효하지 않습니다. (dict or None)")

        # destinationTarget이 curveObj의 tangent 방향을 따르도록 tangentConstraint
        constraint = cmds.tangentConstraint(
            curveObj,
            destinationTarget,
            **tangentFlag
        )

        if deleteConstraint:
            cmds.delete(constraint)
            return None

        return constraint
    
    def setMatchOrient(self, queryItem_or_vec, destinationObj, flag=None):
        '''
        대상 오브젝트의 회전(Rotate) 값을 지정된 3D 벡터 수치나 다른 기준 오브젝트의 회전값과 동일하게 맞춥니다.

        Args:
            queryItem_or_vec (str or list or tuple): 복사해 올 회전값의 기준이 되는 3D 벡터(예: [90, 0, 0]) 또는 씬 내의 마야 오브젝트 이름.
            destinationObj (str): 회전값이 실제로 변경될 대상 오브젝트 이름.
            flag (dict, optional): cmds.xform에 추가로 전달할 옵션 플래그. 기본값은 {"ws": True} (월드 공간).

        Returns:
            list: 대상 오브젝트에 최종적으로 적용된 [x, y, z] 형태의 회전 데이터 리스트.

        Raises:
            ValueError: 인자가 유효하지 않거나 대상 오브젝트에 Rotate 속성이 없을 경우.
        '''
        if flag is None:
            flag = {"ws": True}

        self._validate_object(destinationObj)

        if not isinstance(flag, dict):
            raise ValueError(u"setMatchOrient 에러 : flag 인자가 유효하지 않습니다. (dict)")

        if not all(cmds.objExists(destinationObj + ".rotate{}".format(ax)) for ax in "XYZ"):
            raise ValueError(u"setMatchOrient 에러 : {}은 회전(Rotate) 어트리뷰트가 존재하지 않습니다.".format(destinationObj))
            
        data = None 

        if isinstance(queryItem_or_vec, (list, tuple)) and len(queryItem_or_vec) == 3:
            # 벡터 값 검증
            self._validate_vector(queryItem_or_vec, "queryItem_or_vec")
            data = list(queryItem_or_vec)

        elif isinstance(queryItem_or_vec, self.string_type) and cmds.objExists(queryItem_or_vec):
            # 일반 오브젝트의 rotate 값을 가져옴 (self.getRotate가 구현되어 있어야 함)
            data = self.getRotate(queryItem_or_vec)

        if data is None:
            raise ValueError(u"setMatchOrient 에러 : queryItem_or_vec 인자가 유효하지 않습니다. (3D 벡터 또는 존재하는 오브젝트 이름)")

        cmds.xform(destinationObj, ro=data, **flag)

        return data


    def setJointOrient(self, queryJoint_or_vec, destinationJoint):
        '''
        대상 조인트의 방향(Joint Orient) 값을 지정된 3D 벡터 수치나 다른 기준 조인트의 방향값과 동일하게 맞춥니다.

        Args:
            queryJoint_or_vec (str or list or tuple): 복사해 올 방향값의 기준이 되는 3D 벡터(예: [90, 0, 0]) 또는 기준 조인트 이름.
            destinationJoint (str): Joint Orient 값이 실제로 덮어씌워질 대상 조인트 이름.

        Returns:
            list: 대상 조인트에 최종적으로 적용된 [x, y, z] 형태의 Joint Orient 데이터 리스트.

        Raises:
            ValueError: 대상이 조인트가 아니거나, 기준이 되는 벡터/오브젝트가 유효하지 않을 경우.
        '''
        self._validate_object(destinationJoint)

        if not cmds.nodeType(destinationJoint) == "joint":
            raise ValueError(u"setJointOrient 에러 : {}은 joint가 아닙니다.".format(destinationJoint))

        data = None

        if isinstance(queryJoint_or_vec, (list, tuple)) and len(queryJoint_or_vec) == 3:
            self._validate_vector(queryJoint_or_vec, "queryJoint_or_vec")
            data = list(queryJoint_or_vec)

        elif isinstance(queryJoint_or_vec, self.string_type):
            self._validate_object(queryJoint_or_vec)

            if cmds.nodeType(queryJoint_or_vec) == "joint":
                # 기준 조인트의 Orient 값을 가져옴 (self.getJointOrient가 구현되어 있어야 함)
                data = self.getJointOrient(queryJoint_or_vec)
            else:
                raise ValueError(u"setJointOrient 에러 : {}은 joint가 아닙니다.".format(queryJoint_or_vec))

        if data is None:
            raise ValueError(u"setJointOrient 에러 : queryJoint_or_vec 인자가 유효하지 않습니다. (3D 벡터 또는 존재하는 joint 이름)")
        
        for i, ax in enumerate("XYZ"):
            cmds.setAttr("{}.jointOrient{}".format(destinationJoint, ax), data[i])

        return data
            


    def _validate_vector(self, vec, nameString):
        '''
        (내부 헬퍼) 입력된 값이 유효한 3D 벡터(길이 3의 숫자형 리스트/튜플)인지 검증합니다.

        Args:
            vec (tuple or list): 검증할 튜플 (예: (1, 0, 0)).
            nameString (str): 에러 메시지 출력에 사용될 변수 이름.

        Raises:
            TypeError: 튜플/리스트가 아니거나 내부 요소가 숫자형이 아닐 때.
            ValueError: 길이가 3이 아닐 때.
        '''
        if not isinstance(vec, (tuple, list)):
            raise TypeError(u"{}는 list 또는 tuple이어야 합니다.".format(nameString))
        if len(vec) != 3:
            raise ValueError(u"{}는 길이 3이어야 합니다.".format(nameString))
        if not all(isinstance(x, (int, float)) and not isinstance(x, bool) for x in vec):
            raise TypeError(u"{}의 요소는 int/float이어야 합니다.".format(nameString))

    def _validate_object(self, target):
        '''
        (내부 헬퍼) 지정된 이름의 마야 노드가 문자열이며 씬 내에 실존하는지 검증합니다.

        Args:
            target (str): 검증할 노드 이름.

        Raises:
            TypeError: target이 문자열이 아닐 때.
            ValueError: target이 씬 내에 존재하지 않을 때.
        '''
        if not isinstance(target, self.string_type):
            raise TypeError(u"{}는 문자열만 유효합니다.".format(target))
        if not cmds.objExists(target):
            raise ValueError(u"{}는 존재하지 않습니다".format(target))





def match_constraintObject(target, parentTgt, Bool_Point=True, Bool_Orient=True, Bool_Scale=False, deleteConstraint=True):
    ''' 
    Constraint(mo=False) 노드를 생성하는 방식을 이용하여 대상(target)의 위치, 회전, 스케일을 기준(parentTgt)에 맞춥니다.

    Args:
        target (str): 이동/회전의 목표점이 되는 기준 타겟 (Parent 역할).
        parentTgt (str): 위치가 맞춰질 움직이는 대상 오브젝트 (Child 역할).
        Bool_Point (bool, optional): 위치(Translate) 매치 여부. 기본값 True.
        Bool_Orient (bool, optional): 회전(Rotate) 매치 여부. 기본값 True.
        Bool_Scale (bool, optional): 크기(Scale) 매치 여부. 기본값 False.
        deleteConstraint (bool, optional): 매치 완료 후 Constraint 노드 삭제 여부. 기본값 True.

    Example:
        >>> match_constraintObject("master_loc", "slave_ctrl", Bool_Scale=True)
    '''
    if Bool_Point == True:
        Po = cmds.pointConstraint(parentTgt, target, mo=0)
        if deleteConstraint:
            cmds.delete(Po)
    if Bool_Orient == True:
        Or = cmds.orientConstraint(parentTgt, target, mo=0)
        if deleteConstraint:
            cmds.delete(Or)
    if Bool_Scale == True:
        Scale = cmds.scaleConstraint(parentTgt, target, mo=0)
        if deleteConstraint:
            cmds.delete(Scale)


def match_parentConstraint(target, parentTgt, deleteConstraint=True):
    '''
    Parent Constraint(mo=False)를 이용해 대상(target)의 위치와 회전을 기준(parentTgt)에 한 번에 일치시킵니다.

    Args:
        target (str): 움직일 대상 오브젝트 이름 (피제어자).
        parentTgt (str): 목표점이 되는 기준 오브젝트 이름 (제어자).
        deleteConstraint (bool, optional): 정렬 후 Constraint 노드를 삭제할지 여부. 기본값 True.
    '''
    constraint = cmds.parentConstraint(parentTgt, target, mo=0)
    if deleteConstraint:
        cmds.delete(constraint)
    

def match_xform(target, parentTgt, t=True, ro=True, s=True, extra=None):
    '''
    xform 명령어를 사용하여 기준 오브젝트(parentTgt)의 트랜스폼 매트릭스 정보를 대상(target)에 복사합니다. 
    (Constraint 노드를 사용하지 않아 빠르고 깔끔합니다)

    Args:
        target (str): 정보가 덮어씌워질(이동할) 대상 오브젝트 이름.
        parentTgt (str): 위치/회전의 기준이 되는 오브젝트 이름.
        t (bool, optional): Translate(위치) 정보 복사 여부. 기본값 True.
        ro (bool, optional): Rotate(회전) 정보 복사 여부. 기본값 True.
        s (bool, optional): Scale(크기) 정보 복사 여부. 기본값 True.
        extra (dict, optional): xform 명령어에 추가로 전달할 옵션 플래그. 기본값은 {"ws": True} (월드 공간).
    '''
    attrs = {}
    if extra is None:
        extra = {"ws": True}
    
    if t:
        pos = cmds.xform(parentTgt, q=1, t=1, **extra)
        if all(x == 0 for x in pos):
            pos = cmds.xform(parentTgt, q=1, pivots=1, **extra)[:3]
        attrs["t"] = pos
    if ro:
        roData = cmds.xform(parentTgt, q=1, ro=1, **extra)
        attrs["ro"] = roData
    if s:
        scaleData = cmds.xform(parentTgt, q=1, s=1, **extra)
        attrs["s"] = scaleData
    
    cmds.xform(target, **extra, **attrs)