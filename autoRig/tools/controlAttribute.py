# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import maya.cmds as cmds


##------------------------------------------Attr
def getValidAttrTarget(target, attrName):
    '''
    오브젝트와 속성 이름을 조합하여 "node.attribute" 형태의 경로가 씬에 존재하는지 검증합니다.

    Args:
        target (str): 마야 오브젝트 이름.
        attrName (str): 속성(Attribute) 이름.

    Returns:
        str or None: 유효하면 "target.attrName" 문자열 반환, 존재하지 않으면 None.
    '''
    attrTarget = "{}.{}".format(target, attrName)
    if not cmds.objExists(attrTarget):
        cmds.warning("오류: '{}' 속성을 찾을 수 없습니다.".format(attrTarget))
        return None
    return attrTarget


def addSeparateAttr(item, longName, lockBool=True, separateName="_______________"):
    '''
    채널 박스에서 속성들을 시각적으로 분리하기 위한 구분선(Enum) 속성을 추가합니다.

    Args:
        item (str): 구분선을 추가할 대상 노드.
        longName (str): 속성의 실제 이름 (내부 시스템용).
        lockBool (bool, optional): 생성 후 속성을 잠글지(Lock) 여부. 기본값 True.
        separateName (str, optional): 채널 박스에 표시될 구분선 모양. 기본값 "________".

    Returns:
        str: 생성된 속성 경로 ("node.attribute").
    '''
    attrPath = "{}.{}".format(item, longName)
    if cmds.attributeQuery(longName, node=item, exists=True):
        if lockBool:
            cmds.setAttr(attrPath, lock=not cmds.getAttr(attrPath, lock=1))
        return attrPath
    
    cmds.addAttr(item, ln=longName, nn=separateName, en=":", at="enum", k=True)
    if lockBool:
        cmds.setAttr(attrPath, lock=True)


def addCustomAttr(item, longName, attrType, **kwargs):
    '''
    지정된 타입과 옵션으로 오브젝트에 사용자 정의 속성(Custom Attribute)을 추가합니다.

    Args:
        item (str): 속성을 추가할 대상 노드.
        longName (str): 추가할 속성의 이름.
        attrType (str): 속성의 데이터 타입 ('float', 'int', 'bool', 'string', 'enum', 'matrix').
        **kwargs: cmds.addAttr에 전달할 추가 인자 (예: min, max, dv 등).

    Returns:
        str or None: 생성된 속성 경로, 실패 시 None.
    '''
    attrPath = "{}.{}".format(item, longName)
    if cmds.attributeQuery(longName, node=item, exists=True):
        return attrPath
    
    typeMap = {
        'float': {'at': 'double'}, 'int': {'at': 'long'}, 'bool': {'at': 'bool'},
        'matrix': {'at': 'matrix'}, 'enum': {'at': 'enum'},
    }
    
    attrArgs = typeMap.get(attrType, {}).copy()
    if attrType not in ['string', 'matrix'] and 'k' not in kwargs and 'cb' not in kwargs:
        attrArgs["k"] = True
    if attrType == "enum" and (not kwargs.get('en') or ':' not in kwargs.get('en', '')):
        attrArgs["en"] = "A:B"
        
    attrArgs.update(kwargs)
    cmds.addAttr(item, ln=longName, **attrArgs)
    return attrPath


def addStringAttr(node, attr_name, value=""):
    '''
    오직 String 타입의 어트리뷰트만 안전하게 생성하고 값을 입력하는 전용 함수입니다.

    Args:
        node (str): String 속성을 추가할 대상 노드.
        attr_name (str): 생성할 속성 이름.
        value (str, optional): 속성에 입력할 초기 문자열. 기본값은 빈 문자열("").

    Returns:
        str: 생성 및 값이 설정된 속성 경로 ("node.attr_name").

    Example:
        >>> addStringAttr("pCube1", "memo", "Hello Maya")
    '''
    attr_path = "{}.{}".format(node, attr_name)
    
    # 1. 속성이 존재하지 않을 때만 새로 껍데기 생성
    if not cmds.attributeQuery(attr_name, node=node, exists=True):
        cmds.addAttr(node, ln=attr_name, dt="string")
        
    # 2. 생성된(또는 이미 있는) 속성에 String 값 넣기
    cmds.setAttr(attr_path, value, type="string")
    
    return attr_path


#---------------toggle

def toggleAttrLock(target, attrName):
    '''
    지정된 속성의 잠금(Lock) 상태를 토글(On/Off)합니다.

    Args:
        target (str): 대상 노드 이름.
        attrName (str): 잠금을 토글할 속성 이름.

    Returns:
        bool or None: 속성이 최종적으로 잠겼으면 True, 풀렸으면 False. 속성이 없으면 None.
    '''
    attrPath = getValidAttrTarget(target, attrName)
    if not attrPath:
        return None
    newState = not cmds.getAttr(attrPath, lock=True)
    cmds.setAttr(attrPath, lock=newState)
    return newState


def toggleKeyable(target, attrName):
    '''
    지정된 속성의 Keyable 상태를 토글(On/Off)합니다. 
    Keyable이 해제되어도 채널 박스(Channel Box)에서는 계속 보이도록 유지합니다.

    Args:
        target (str): 대상 노드 이름.
        attrName (str): 토글할 속성 이름.

    Returns:
        bool or None: 최종적으로 Keyable 상태가 되었으면 True, 해제되었으면 False. 실패 시 None.
    '''
    attrPath = getValidAttrTarget(target, attrName)
    if not attrPath:
        return None
    
    is_non_keyable = not cmds.getAttr(attrPath, keyable=True)
    if is_non_keyable:
        cmds.setAttr(attrPath, keyable=True) 
        return True 
    else:
        cmds.setAttr(attrPath, keyable=False, channelBox=True)
        return False


def toggleAttrHide(target, attrName):
    '''
    지정된 속성을 채널 박스에서 완전히 숨기거나(Hide) 다시 보이게(Unhide) 토글합니다.

    Args:
        target (str): 대상 노드 이름.
        attrName (str): 토글할 속성 이름.

    Returns:
        bool or None: 최종적으로 숨김 처리되었으면 True, 다시 보이게 되었으면 False. 실패 시 None.
    '''
    attrPath = getValidAttrTarget(target, attrName)
    if not attrPath:
        return None
        
    is_keyable = cmds.getAttr(attrPath, keyable=True)
    is_channelbox = cmds.getAttr(attrPath, channelBox=True)
    
    # 둘 중 하나라도 True면 화면에 보이고 있는 상태
    is_visible = is_keyable or is_channelbox
    
    if not is_visible:
        cmds.setAttr(attrPath, keyable=True) 
        return False  
    else:
        cmds.setAttr(attrPath, keyable=False, channelBox=False)
        return True   


#-------------------------------MoveAttr

class moveAttr():
    '''
    채널 박스 내 속성(Attribute)들의 표시 순서를 변경하기 위한 클래스입니다.
    마야는 속성 순서를 직접 바꾸는 기능을 지원하지 않으므로, 
    기존 속성의 데이터, 연결(Connection), 잠금 상태를 모두 백업한 뒤 
    원하는 순서대로 속성을 삭제하고 다시 생성(Rebuild)하여 복구합니다.
    '''
    def __init__(self):
        try:
            self.string_type = basestring
        except NameError:
            self.string_type = str
        self.standardAttrs = []
        self.workDict = {}

    def setStandardAttrs(self, attrs):
        '''
        정렬의 기준이 될 속성 리스트를 등록합니다.

        Args:
            attrs (list of str): 재정렬할 속성 이름들이 담긴 리스트.

        Returns:
            list: 등록된 속성 리스트.
        '''
        self.standardAttrs = []
        self._addList(attrs, self.standardAttrs)
        return self.standardAttrs

    def defineData(self, item, attrs):
        '''
        해당 오브젝트(item)가 가진 특정 속성(attrs)들의 기존 설정 및 연결 정보를 수집하여 백업합니다.

        Args:
            item (str): 대상 오브젝트 이름.
            attrs (list of str): 정보를 백업할 속성 이름 리스트.
        '''
        works = []
        self._addList(attrs, works)
        for attr in works:
            objAttr = self._existObjAttr(item, attr)
            if not objAttr:
                continue
            index = works.index(attr)
            attrData = self._setDict(item, attr, index)
            self.workDict[attr] = attrData

    def moveElement(self, element_or_index, moveElement_or_moveIndex):
        '''
        내부 리스트에서 두 요소의 위치(순서)를 서로 바꿉니다.

        Args:
            element_or_index (str or int): 이동할 요소의 이름 또는 현재 인덱스.
            moveElement_or_moveIndex (str or int): 교환할 목적지 요소의 이름 또는 인덱스.

        Returns:
            bool: 성공적으로 위치가 교환되었으면 True, 대상을 찾지 못했으면 False.
        '''
        startRootIndex = self._getIndex(element_or_index)
        destinationIndex = self._getIndex(moveElement_or_moveIndex)

        if startRootIndex is not None and destinationIndex is not None:
            self._swapInList(startRootIndex, destinationIndex)
            self._syncWorkDict(startRootIndex, destinationIndex)
            return True
            
        return False

    def build(self):
        '''
        수집된 정보와 변경된 순서를 바탕으로 대상 속성들을 실제로 삭제하고 다시 생성합니다.
        기존에 연결되어 있던 노드 커넥션이나 잠금 상태, 최소/최대값 등이 모두 복구됩니다.

        Returns:
            bool: 재구축 작업이 성공적으로 완료되었으면 True.
        '''
        if not self.standardAttrs or not self.workDict:
            return False
        external_locked_attrs = []

        # 속성 삭제 및 연결 해제 진행
        for attr in self.standardAttrs:
            if attr not in self.workDict:
                continue
            
            attr_info = self.workDict[attr]
            attr_path = attr_info["attrPath"]

            # 내 노드 Lock 해제
            if attr_info.get("lock"):
                cmds.setAttr(attr_path, lock=False)

            # Source 연결 끊기 (외부 -> 나)
            if attr_info.get("source"):
                for my_attr, external_attr in attr_info["source"]:
                    if cmds.isConnected(external_attr, my_attr):
                        if cmds.getAttr(external_attr, lock=True):
                            cmds.setAttr(external_attr, lock=False)
                            external_locked_attrs.append(external_attr)
                        cmds.disconnectAttr(external_attr, my_attr)
            
            # Destination 연결 끊기 (나 -> 외부)
            if attr_info.get("destination"):
                for my_attr, external_attr in attr_info["destination"]:
                    if cmds.isConnected(my_attr, external_attr):
                        if cmds.getAttr(external_attr, lock=True):
                            cmds.setAttr(external_attr, lock=False)
                            external_locked_attrs.append(external_attr)
                        cmds.disconnectAttr(my_attr, external_attr)

            if cmds.objExists(attr_path):
                cmds.deleteAttr(attr_path)

        # 정해진 순서대로 속성 재생성 및 복구
        sorted_attrs = sorted(self.workDict.keys(), key=lambda x: self.workDict[x]["index"])

        for attr in sorted_attrs:
            attr_info = self.workDict[attr]
            item = attr_info["object"]
            attr_path = attr_info["attrPath"]

            kwargs = {
                "longName": attr
            }
            if attr_info.get("shortName"): kwargs["shortName"] = attr_info["shortName"]
            if attr_info.get("niceName"): kwargs["niceName"] = attr_info["niceName"]

            if attr_info.get("dataType"):
                kwargs["dataType"] = attr_info["dataType"]
            else:
                kwargs["attributeType"] = attr_info.get("attrType")

                if attr_info.get("hasMinValue") and attr_info.get("min") is not None:
                    kwargs["hasMinValue"] = True
                    kwargs["minValue"] = attr_info["min"]
                if attr_info.get("hasMaxValue") and attr_info.get("max") is not None:
                    kwargs["hasMaxValue"] = True
                    kwargs["maxValue"] = attr_info["max"]

            # Enum 복구
            if attr_info.get("attrType") == "enum" and attr_info.get("enumNames"):
                kwargs["enumName"] = attr_info["enumNames"]

            cmds.addAttr(item, **kwargs)

            # 채널박스 복구
            if attr_info.get("hidden") is not None:
                cmds.setAttr(attr_path, channelBox=attr_info["hidden"])
            if attr_info.get("keyable") is not None:
                cmds.setAttr(attr_path, keyable=attr_info["keyable"])

            if attr_info.get("defaultValue") is not None and not attr_info.get("source"):
                try:
                    if kwargs.get("dataType") == "string":
                        cmds.setAttr(attr_path, attr_info["defaultValue"], type="string")
                    else:
                        cmds.setAttr(attr_path, attr_info["defaultValue"])
                except Exception as e:
                    print("// Warning: Could not restore value for {}: {}".format(attr_path, e))

        for attr in sorted_attrs:
            attr_info = self.workDict[attr]
            attr_path = attr_info["attrPath"]

            # Source 연결 복구 (외부 -> 나)
            if attr_info.get("source"):
                for my_attr, external_attr in attr_info["source"]:
                    try: cmds.connectAttr(external_attr, my_attr, force=True)
                    except Exception as e: print("// Warning: Connection failed {} -> {}".format(external_attr, my_attr))

            # Destination 연결 복구 (나 -> 외부)
            if attr_info.get("destination"):
                for my_attr, external_attr in attr_info["destination"]:
                    try: cmds.connectAttr(my_attr, external_attr, force=True)
                    except Exception as e: print("// Warning: Connection failed {} -> {}".format(my_attr, external_attr))

            # 내 속성이 원래 잠겨있었다면 다시 잠금
            if attr_info.get("lock"):
                cmds.setAttr(attr_path, lock=True)

        return True

    # -- helper (내부 작동을 위한 비공개 함수들이므로 생략 가능하지만 구조 안정을 위해 남겨둡니다)
    def _getIndex(self, element_or_index):
        if isinstance(element_or_index, self.string_type) and element_or_index in self.standardAttrs:
            return self.standardAttrs.index(element_or_index)
        elif isinstance(element_or_index, int) and 0 <= element_or_index < len(self.standardAttrs):
            return element_or_index
        return None
    
    def _swapInList(self, idx1, idx2):
        self.standardAttrs[idx1], self.standardAttrs[idx2] = self.standardAttrs[idx2], self.standardAttrs[idx1]

    def _syncWorkDict(self, idx1, idx2):
        moved_attr1 = self.standardAttrs[idx1]
        moved_attr2 = self.standardAttrs[idx2]
        
        if moved_attr1 in self.workDict:
            self.workDict[moved_attr1]["index"] = idx1
        if moved_attr2 in self.workDict:
            self.workDict[moved_attr2]["index"] = idx2

    def _setDict(self, item, attr, index):
        objAttr = self._existObjAttr(item, attr)
        if not objAttr:
            return None
        
        dicts = {"attrPath": objAttr, "index": index, "object": item, "attr": attr}

        typeData = self._getAttrDataType(item, attr)
        stataData = self._getState(item, attr)
        destinationData = self._getDestination(item, attr)
        sourcesData = self._getSource(item, attr)
        nameData = self._getDatailName(item, attr)
        minMaxData = self._getMinMaxData(item, attr)
        dicts.update(typeData)
        dicts.update(stataData)
        dicts.update(destinationData)
        dicts.update(sourcesData)
        dicts.update(nameData)
        dicts.update(minMaxData)

        return dicts

    def _getDestination(self, item, attr):
        dicts = {"destination": None}
        attrPath = self._existObjAttr(item, attr)
        if not attrPath:
            return dicts
        isDestination = cmds.listConnections(attrPath, d=1, s=0, c=1, p=1)
        if isDestination:
            paired_destination = list(zip(isDestination[0::2], isDestination[1::2]))
            dicts["destination"] = paired_destination
        return dicts
    
    def _getSource(self, item, attr):
        dicts = {"source": None}
        attrPath = self._existObjAttr(item, attr)
        if not attrPath:
            return dicts
        isSource = cmds.listConnections(attrPath, s=1, d=0, c=1, p=1)
        if isSource:
            paired_source = list(zip(isSource[0::2], isSource[1::2]))
            dicts["source"] = paired_source
        return dicts

    def _getState(self, item, attr):
        dicts = {"lock": None, "keyable": None, "hidden": None}
        attrPath = self._existObjAttr(item, attr)
        if not attrPath:
            return dicts
        
        isLock = cmds.getAttr(attrPath, lock=True)
        isKeyable = cmds.getAttr(attrPath, k=True)
        isChannel = cmds.getAttr(attrPath, cb=True)
        dicts = {"lock": isLock, "keyable": isKeyable, "hidden": isChannel}
        return dicts

    def _getMinMaxData(self, item, attr):
        dicts = {"hasMaxValue": None, "max": None, "hasMinValue": None, "min": None}
        attrPath = self._existObjAttr(item, attr)
        if not attrPath:
            return dicts
        getHasMax = cmds.addAttr(attrPath, hasMaxValue=True, q=1)
        getHasMin = cmds.addAttr(attrPath, hasMinValue=True, q=1)
        getMax = cmds.addAttr(attrPath, max=1, q=1)
        getMin = cmds.addAttr(attrPath, min=1, q=1)
        if getHasMax:
            dicts["hasMaxValue"] = getHasMax
            dicts["max"] = getMax
        if getHasMin:
            dicts["hasMinValue"] = getHasMin
            dicts["min"] = getMin
        return dicts

    def _getDatailName(self, item, attr):
        dicts = {"niceName": None, "longName": None, "shortName": None}
        attrPath = self._existObjAttr(item, attr)
        if not attrPath:
            return dicts
        isNiceName = cmds.addAttr(attrPath, q=1, nn=True)
        isLongName = cmds.addAttr(attrPath, q=1, ln=True)
        isShortName = cmds.addAttr(attrPath, q=1, sn=True)
        if isNiceName:
            dicts["niceName"] = isNiceName
        if isLongName:
            dicts["longName"] = isLongName
        if isShortName:
            dicts["shortName"] = isShortName
        
        return dicts

    def _getAttrDataType(self, item, attr):
        dicts = {"attrType": None, "dataType": None, "enumNames": None, "defaultValue": None}
        attrPath = self._existObjAttr(item, attr)
        if not attrPath:
            return dicts
        
        attrType = cmds.addAttr(attrPath, q=True, attributeType=True)
        getValue = cmds.getAttr(attrPath)

        if attrType:
            dicts["attrType"] = attrType
            
        if attrType == 'typed':
            dt_raw = cmds.addAttr(attrPath, q=True, dt=True)
            if isinstance(dt_raw, list) and dt_raw:
                dicts["dataType"] = dt_raw[0]
            else:
                dicts["dataType"] = dt_raw
        else:
            dicts["dataType"] = None

        if attrType == 'enum':
            enumsData = cmds.addAttr(attrPath, q=True, enumName=True)
            if enumsData:
                dicts["enumNames"] = enumsData
                
        if getValue is not None:
            dicts["defaultValue"] = getValue
            
        return dicts

    def _existObjAttr(self, item, attr):
        attrPath = "{}.{}".format(item, attr)
        if cmds.objExists(attrPath):
            return attrPath
        else:
            return None

    def _addList(self, item, addTargetList):
        if not isinstance(addTargetList, list):
            return
        if isinstance(item, (list, tuple)) and all(isinstance(x, self.string_type) for x in item):
            addTargetList.extend(item)
        if isinstance(item, self.string_type):
            addTargetList.append(item)
        return addTargetList