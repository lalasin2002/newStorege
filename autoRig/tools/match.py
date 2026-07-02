# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.api.OpenMaya as om


class orientManager():
    def __init__(self):
        self.string_type = None
        try:
            self.string_type = basestring
        except NameError:
            self.string_type = str

        self.currentFlag = None

    def makeOrientFlag(self , aimV=(1, 0, 0), upV=(0, 1, 0), worldV=(0, 1, 0), upObj=None, maintainOffset=False, wouldUpType = None ):
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

        #여기 수정: Maya aimConstraint에서 사용 가능한 worldUpType 방어
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
    
    def aimOrientObject(self , aimTarget , destinationTaget  , deleteConstaint = False , flag = None):
        self._validate_object(aimTarget)
        self._validate_object(destinationTaget)
        aimFlag = {}
        if isinstance(flag , dict):
            aimFlag = flag
        elif flag is None and self.currentFlag:
            aimFlag = self.currentFlag
        else:
            raise ValueError(u"aimOrientObject 에러 : flag 인자가 유효하지 않습니다. (dict or None)")
        
        constraint = cmds.aimConstraint(aimTarget , destinationTaget , **aimFlag)
        if deleteConstaint:
            cmds.delete(constraint)
            return None
        else:
            return constraint
    
    def tangentOrientObject(self, curveObj, destinationTarget, deleteConstraint=False, flag=None):
        self._validate_object(curveObj)
        self._validate_object(destinationTarget)
        curve = None
        if cmds.nodeType(curveObj) == "nurbsCurve":
            curve = curveObj
        if cmds.nodeType(curveObj ) == "transform":
            isShape = cmds.listRelatives(curveObj , s =1)
            if isShape:
                if cmds.nodeType(isShape[0]) =="nurbsCurve":
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

        #여기 수정: destinationTarget이 curveObj의 tangent 방향을 따르도록 tangentConstraint
        constraint = cmds.tangentConstraint(
            curveObj,
            destinationTarget,
            **tangentFlag
        )

        if deleteConstraint:
            cmds.delete(constraint)
            return None

        return constraint



    def _validate_vector(self, vec, nameString):
        """
        벡터 입력값(tuple, 길이 3, 숫자 요소)을 검증하는 헬퍼 메서드.

        Args:
            -vec        (tuple): 검증할 튜플 (예: (1, 0, 0))
            -nameString (str)  : 에러 메시지에 표시할 이름 (예: "aimV")
        Returns:
            None (통과 시 아무것도 반환 안 함, 실패 시 예외 발생)
        주의점:
            tuple이 아니면 TypeError, 길이가 3이 아니면 ValueError,
            요소 중 int/float이 아닌 것이 있으면 TypeError (bool은 거부).
        """
        if not isinstance(vec, (tuple ,list)):
            raise TypeError(u"{}는 list 또는 tuple이어야 합니다.".format(nameString))
        if len(vec) != 3:
            raise ValueError(u"{}는 길이 3이어야 합니다.".format(nameString))
        if not all(isinstance(x, (int, float)) and not isinstance(x, bool) for x in vec):
            raise TypeError(u"{}의 요소는 int/float이어야 합니다.".format(nameString))


    def _validate_object(self, target):
        """
        Maya 노드 입력값(문자열, 존재 여부, 노드 타입)을 검증하는 헬퍼 메서드.

        Args:
            -target     (str): 검증할 노드 이름 (예: "joint1")
            -typeString (str): 기대하는 노드 타입 (기본값 "joint")
        Returns:
            None (통과 시 아무것도 반환 안 함, 실패 시 예외 발생)
        주의점:
            문자열이 아니면 TypeError, 씬에 존재하지 않으면 ValueError,
            지정한 타입이 아니면 TypeError.
        """
        if not isinstance(target , self.string_type):
            raise TypeError(u"{}는 문자열만 유효합니다.".format(target))
        if not cmds.objExists(target):
            raise ValueError(u"{}는 존재하지 않습니다" .format(target))
        










def match_constraintObject( target , parentTgt, Bool_Point=True, Bool_Orient=True, Bool_Scale=False , deleteConstraint = True):
    ''' 
    Constraint maintainoffset = False 를 이용한 오브젝트 매치 \n
    target :: Constrain의 Parent 오브젝트 \n
    parentTgt :: Constrain를 받고자 하는 오브젝트 \n
    
    각 Bool_(Point , Orient , Scale) 은 Constrain의 타입사용을 의미함
    '''
    if Bool_Point == True:
        Po = cmds.pointConstraint( parentTgt , target, mo=0)
        if deleteConstraint:
            cmds.delete(Po)
    if Bool_Orient == True:
        Or = cmds.orientConstraint( parentTgt, target, mo=0)
        if deleteConstraint:
            cmds.delete(Or)
    if Bool_Scale == True:
        Scale = cmds.scaleConstraint( parentTgt , target, mo=0)
        if deleteConstraint:
            cmds.delete(Scale)


def match_parentConstraint(target ,parentTgt, deleteConstraint = True):
    constraint = cmds.parentConstraint(parentTgt, target , mo =0)
    if deleteConstraint:
        cmds.delete(constraint)
    
def match_xform(target , parentTgt , t = True , ro = True , s = True , extra = None):
    attrs = {}
    if extra is None:
        extra = {"ws": True}
    
    if t:
        pos = cmds.xform(parentTgt , q =1 , t =1 , **extra)
        if all(x == 0 for x in pos):
            pos = cmds.xform(parentTgt , q =1 , pivots=1 , **extra)[:3]
        attrs["t"] = pos
    if ro:
        roData = cmds.xform(parentTgt , q =1 , ro =1 ,**extra)
        attrs["ro"] = roData
    if s:
        scaleData = cmds.xform(parentTgt , q =1 , s =1 , **extra)
        attrs["s"] = scaleData

    
    cmds.xform(target , **extra , **attrs )






    