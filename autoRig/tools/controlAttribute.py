# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import maya.cmds as cmds


##------------------------------------------Attr

def getValidAttrTarget(target, attrName):
    try:
        string_type = basestring
    except NameError:
        string_type = str
    if not all(isinstance(x, string_type) for x in [target, attrName]):
        cmds.warning("target과 attrName은 문자열이어야 합니다.")
        return None
        
    attrTarget = "{}.{}".format(target, attrName)

    if not cmds.objExists(attrTarget):
        cmds.warning("오류: '{}' 속성을 찾을 수 없습니다.".format(attrTarget))
        return None
        
    return attrTarget


def addSeparateAttr(item , longName , lockBool =True ,separateName = "_______________" ):
    attrPath = "{}.{}".format(item , longName)
    isAttr = cmds.attributeQuery(longName , node =item , exists = True)
    if isAttr:
        if lockBool:
            getLock = cmds.getAttr(attrPath ,lock =1)
            if getLock:
                cmds.setAttr(attrPath , lock =0)
            else:
                cmds.setAttr(attrPath , lock =1)
        return attrPath
    
    cmds.addAttr(item , ln=longName , nn = separateName  , en = ":{}".format(longName) , at ="enum", k=True)
    if lockBool:
        cmds.setAttr(attrPath , lock =True)
    return attrPath

def addCustomAttr(item , longName , attrType , **kwargs):
    attrPath = "{}.{}".format(item , longName)
    isAttr = cmds.attributeQuery(longName , node =item , exists = True)
    if isAttr:
        return attrPath
    typeMap = {
        'float': {'at': 'double'},
        'int': {'at': 'long'},
        'bool': {'at': 'bool'},
        'matrix': {'at': 'matrix'},
        'enum': {'at': 'enum'},
    }
    if attrType not in typeMap:
        cmds.warning(u"지원하지 않는 속성 타입입니다: {}".format(attrType))
        return None
    
    attrArgs = typeMap[attrType].copy()
    if attrType not in [ 'string' , 'matrix'] and 'k' not in kwargs and 'cb' not in kwargs:
        attrArgs["k"] = True
    if attrType == "enum":
        en_value = kwargs.get('en', '')
        if not en_value or ':' not in en_value:
            attrArgs["en"] = "A:B"
    
    attrArgs.update(kwargs)
    cmds.addAttr(item, ln=longName, **attrArgs)
    return attrPath

def addStringattr(node, attr_name, value=""):
    """오직 String 타입의 어트리뷰트만 생성하고 값을 입력하는 함수"""
    attr_path = "{}.{}".format(node, attr_name)
    
    # 1. 속성이 존재하지 않을 때만 새로 껍데기 생성
    if not cmds.attributeQuery(attr_name, node=node, exists=True):
        cmds.addAttr(node, ln=attr_name, dt="string")
        
    # 2. 생성된(또는 이미 있는) 속성에 String 값 넣기
    cmds.setAttr(attr_path, value, type="string")
    
    return attr_path

#---------------toggle

def toggleAttrLock(target , attrName):
    attrPath = getValidAttrTarget(target , attrName)
    if not attrPath:
        return None
    newState = not cmds.getAttr(attrPath , lock = True)
    cmds.setAttr(attrPath , lock = newState)
    return newState

def toggleKeyable(target, attrName):
    attrPath = getValidAttrTarget(target, attrName)
    if not attrPath:
        return None
    
    is_non_keyable = not cmds.getAttr(attrPath, keyable=True)
    if is_non_keyable:
        cmds.setAttr(attrPath, keyable=True) 
        return True # Keyable이 되었음을 반환
    else:
        cmds.setAttr(attrPath, keyable=False, channelBox=True)
        return False

def toggleAttrHide(target, attrName):
    attrPath = getValidAttrTarget(target, attrName)
    if not attrPath:
        return None
        
    # 1. 채널 박스에 노출되어 있는지 확인 (Keyable이거나 ChannelBox에 떠있거나)
    is_keyable = cmds.getAttr(attrPath, keyable=True)
    is_channelbox = cmds.getAttr(attrPath, channelBox=True)
    
    # 둘 중 하나라도 True면 화면에 보이고 있는 상태(visible)입니다.
    is_visible = is_keyable or is_channelbox
    
    if not is_visible:
        cmds.setAttr(attrPath, keyable=True) 
        # (keyable=True를 주면 자동으로 채널 박스에 표시됩니다)
        return False  # is_hidden = False
    else:
        # 현재 보이고 있다면 -> 완전히 숨기기 (Hide)
        cmds.setAttr(attrPath, keyable=False, channelBox=False)
        return True   # is_hidden = True
    
#-------------------------------MoveAttr

class moveAttr():
    def __init__(self ):
        try:
            self.string_type = basestring
        except NameError:
            self.string_type = str
        self.standardAttrs = []
        self.workDict = {}

    def setStandardAttrs(self, attrs):
        """
        입력받은 속성들을 안전하게 리스트 형태로 standardAttrs에 지정합니다.
        """
        self.standardAttrs = []
        self._addList(attrs, self.standardAttrs)
        return self.standardAttrs

    def defineData(self, item , attrs):
        works =[]
        self._addList(attrs , works)
        for attr in works:
            objAttr = self._existObjAttr(item , attr)
            if not objAttr:
                continue
            index = works.index(attr)
            attrData = self._setDict(item , attr , index)
            self.workDict[attr] = attrData

    def moveElement(self, element_or_index, moveElement_or_moveIndex):
        """
        두 요소의 인덱스를 찾아 리스트 순서를 바꾸고 딕셔너리를 동기화합니다.
        """
        startRootIndex = self._getIndex(element_or_index)
        destinationIndex = self._getIndex(moveElement_or_moveIndex)

        if startRootIndex is not None and destinationIndex is not None:
            self._swapInList(startRootIndex, destinationIndex)
            self._syncWorkDict(startRootIndex, destinationIndex)
            return True
            
        return False

    def build(self):
        if not self.standardAttrs or not self.workDict:
            return False
        external_locked_attrs =[]

        #속성 삭제 및 연결 해제 진행
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
                        # 외부 노드의 Lock 상태 확인 후 해제
                        if cmds.getAttr(external_attr, lock=True):
                            cmds.setAttr(external_attr, lock=False)
                            external_locked_attrs.append(external_attr)
                        # 순서 주의: 외부가 Source, 내가 Destination
                        cmds.disconnectAttr(external_attr, my_attr)
            
            # Destination 연결 끊기 (나 -> 외부)
            if attr_info.get("destination"):
                for my_attr, external_attr in attr_info["destination"]:
                    if cmds.isConnected(my_attr, external_attr):
                        # 외부 노드의 Lock 상태 확인 후 해제
                        if cmds.getAttr(external_attr, lock=True):
                            cmds.setAttr(external_attr, lock=False)
                            external_locked_attrs.append(external_attr)
                        # 순서 주의: 내가 Source, 외부가 Destination
                        cmds.disconnectAttr(my_attr, external_attr)

            if cmds.objExists(attr_path):
                cmds.deleteAttr(attr_path)


        #정해진 순서(self.standardAttrs)대로 속성 재생성 및 복구
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

            # -------------------------------------------------------------
            # 수집된 데이터가 이미 깨끗하므로 조건이 매우 단순해집니다.
            # -------------------------------------------------------------
            if attr_info.get("dataType"):
                # dataType이 존재한다는 것은 수집 단계에서 'typed'(문자열 등)로 판별되었다는 뜻
                kwargs["dataType"] = attr_info["dataType"]
            else:
                # 그 외의 모든 일반 숫자, enum 등은 attributeType을 사용
                kwargs["attributeType"] = attr_info.get("attrType")

                # Min/Max는 attributeType을 쓰는 숫자형에서만 작동하므로 여기에 배치
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

            #채널박스 복구
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




    #--helper
    def _getIndex(self, element_or_index):
        if isinstance(element_or_index, self.string_type) and element_or_index in self.standardAttrs:
            return self.standardAttrs.index(element_or_index)
        elif isinstance(element_or_index, int) and 0 <= element_or_index < len(self.standardAttrs):
            return element_or_index
        return None
    
    def _swapInList(self, idx1, idx2):
        self.standardAttrs[idx1], self.standardAttrs[idx2] = self.standardAttrs[idx2], self.standardAttrs[idx1]

    def _syncWorkDict(self, idx1, idx2):
        # 이미 _swapInList가 실행된 후이므로, 바뀐 위치의 속성 이름을 가져옵니다.
        moved_attr1 = self.standardAttrs[idx1]
        moved_attr2 = self.standardAttrs[idx2]
        
        if moved_attr1 in self.workDict:
            self.workDict[moved_attr1]["index"] = idx1
        if moved_attr2 in self.workDict:
            self.workDict[moved_attr2]["index"] = idx2


    def _setDict(self, item , attr , index ):
        objAttr = self._existObjAttr(item,attr )
        if not objAttr:
            return None
        
        dicts = {"attrPath" :objAttr  , "index" : index , "object" :item, "attr" : attr  }

        typeData = self._getAttrDataType(item , attr)
        stataData = self._getState(item , attr)
        destinationData = self._getDestination(item , attr)
        sourcesData = self._getSource(item , attr)
        nameData = self._getDatailName(item , attr)
        minMaxData = self._getMinMaxData(item , attr)
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
        # 반드시 s=0 을 추가하여 나가는 연결(Destination)만 잡도록 합니다.
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
        # 반드시 d=0 을 추가하여 들어오는 연결(Source)만 잡도록 합니다.
        isSource = cmds.listConnections(attrPath, s=1, d=0, c=1, p=1)
        if isSource:
            paired_source = list(zip(isSource[0::2], isSource[1::2]))
            dicts["source"] = paired_source
        return dicts


    def _getState(self , item , attr):
        dicts = { "lock" : None , "keyable" : None , "hidden" : None}
        attrPath = self._existObjAttr(item , attr)
        if not attrPath:
            return dicts
        
        isLock = cmds.getAttr(attrPath , lock = True)
        isKeyable = cmds.getAttr(attrPath , k = True)
        isChannel = cmds.getAttr(attrPath , cb= True)
        dicts = {"lock" : isLock , "keyable" : isKeyable , "hidden" : isChannel}
        return dicts




    def _getMinMaxData(self, item , attr ):
        dicts ={"hasMaxValue" : None , "max" : None ,"hasMinValue" : None , "min" : None }
        attrPath = self._existObjAttr(item , attr)
        if not attrPath:
            return dicts
        getHasMax = cmds.addAttr(attrPath ,hasMaxValue = True , q =1 )
        getHasMin = cmds.addAttr(attrPath ,hasMinValue = True , q =1 )
        getMax = cmds.addAttr(attrPath , max = 1 , q =1)
        getMin = cmds.addAttr(attrPath , min = 1 , q =1)
        if getHasMax:
            dicts["hasMaxValue"] = getHasMax
            dicts["max"] = getMax
        if getHasMin:
            dicts["hasMinValue"] = getHasMin
            dicts["min"] = getMin
        return dicts

    def _getDatailName(self, item , attr):
        dicts = {"niceName" : None , "longName" : None , "shortName" : None}
        attrPath = self._existObjAttr(item , attr)
        if not attrPath:
            return dicts
        isNiceName = cmds.addAttr(attrPath , q =1 , nn = True)
        isLongName = cmds.addAttr(attrPath , q =1 , ln =True)
        isShortName = cmds.addAttr(attrPath , q =1 , sn =True)
        if isNiceName :
            dicts["niceName"] = isNiceName
        if isLongName:
            dicts["longName"] = isLongName
        if isShortName :
            dicts["shortName" ] = isShortName
        
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
            
        # [핵심 수정] 복합 타입('typed')일 때만 dataType 플래그를 조회합니다.
        if attrType == 'typed':
            dt_raw = cmds.addAttr(attrPath, q=True, dt=True)
            # 리스트로 반환될 경우 문자열만 깔끔하게 빼냅니다.
            if isinstance(dt_raw, list) and dt_raw:
                dicts["dataType"] = dt_raw[0]
            else:
                dicts["dataType"] = dt_raw
        else:
            # 숫자형(double), enum 등은 dataType에 쓰레기값이 안 들어가게 None으로 막습니다.
            dicts["dataType"] = None

        # Enum 범위 수집
        if attrType == 'enum':
            enumsData = cmds.addAttr(attrPath, q=True, enumName=True)
            if enumsData:
                dicts["enumNames"] = enumsData
                
        if getValue is not None:
            dicts["defaultValue"] = getValue
            
        return dicts



    def _existObjAttr(self, item , attr):
        attrPath ="{}.{}".format(item , attr)
        if cmds.objExists(attrPath):
            return attrPath
        else:
            return None

    def _addList(self, item , addTargetList):
        if not isinstance( addTargetList , list):
            return
        if isinstance(item , (list, tuple)) and all(isinstance(x , self.string_type) for x in item):
            addTargetList.extend(item )
        if isinstance(item , self.string_type):
            addTargetList.append(item)
        return addTargetList


