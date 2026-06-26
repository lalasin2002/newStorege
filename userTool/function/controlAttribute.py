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
    attrPath = getValidAttrTarget(item , longName)
    if not attrPath:
        return None

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
    attrPath = getValidAttrTarget(item , longName)
    if not attrPath:
        return None
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



#---------------toggle

def toggleAttrLock(target , attrName):
    attrPath = getValidAttrTarget(target , attrName)
    if not attrPath:
        return None
    newState = not cmds.getAttr(attrPath , lock = True)
    cmds.setAttr(attrPath , lock = newState)
    return newState

def toggleAttrKeyable(target , attrName):
    attrPath = getValidAttrTarget(target , attrName)
    if not attrPath:
        return None
    newState = not cmds.getAttr(attrPath , keyable=True)
    cmds.setAttr(attrPath, keyable=newState, channelBox=True)
    return newState

def toggleAttrHide(target , attrName):
    attrPath = getValidAttrTarget(target , attrName)
    if not attrPath:
        return None
    is_hidden = not cmds.getAttr(attrPath , keyable=True) and not cmds.getAttr(attrPath, channelBox=True)
    if is_hidden:
        cmds.setAttr(attrPath, keyable=True)
        return False
    else:
        cmds.setAttr(attrPath, keyable=False, channelBox=False)
        return True
    
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
        
        dicts = {"object" : item , "attr" : attr , "objAttr" : objAttr }
        #dicts = {}
        paired_destination = []
        paired_source = []
        isDestination = cmds.listConnections(objAttr , d =1 , c =1 , p = 1)
        isSource = cmds.listConnections(objAttr , s =1 , c =1 , p = 1)

        if isDestination:
            paired_destination = list(zip(isDestination[0::2], isDestination[1::2]))
        if isSource:
            paired_source = list(zip(isSource[0::2], isSource[1::2]) )
            
        dicts["destination"] = paired_destination
        dicts["source"] = paired_source
        dicts["index"] = index

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
        