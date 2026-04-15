# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
from collections import OrderedDict

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