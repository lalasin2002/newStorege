# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import maya.api.OpenMaya as om
import maya.cmds as cmds
import re , fnmatch

def setHierarchyObjs(object, typeList=[], allPath=False):
    # dag=True를 사용하면 object와 그 하위 노드들을 모두 반환합니다.
    selects = cmds.ls(object, dag=True, long=allPath) or []
    
    if isinstance(typeList, (list, tuple)) and typeList:
        return [x for x in selects if cmds.objectType(x) in typeList]
    
    return selects



class searchObject():
    def __init__(self , targets = None):

        try:
            self.string_type = basestring
        except NameError:
            self.string_type = str
        
        self.total = []
        if targets:
            self.addTargets(targets)
            self.isTargets()

    def addTargets(self , additems):
        self.total.extend(self._makeList(additems))

    def isTargets(self):
        isTargets = []
        for x in self.total:
            try:
                if cmds.objExists(x):
                    isTargets.append(x)
            except Exception as e:
                print (u">> IsTargets Error :" ,e)
        if isTargets:
            self.total = isTargets
        return self

    def removeDuplicates(self):
        self.total = list(dict.fromkeys(self.total))
        return self

    def checkType(self , types):
        checkTargets = self._makeList(types)
        if checkTargets:
            self.total = [x for x in self.total if cmds.objectType(x) in checkTargets]
        return self

    def excludeType(self ,  types):
        checkTargets = self._makeList(types)
        if checkTargets:
            self.total = [x for x in self.total if not cmds.objectType(x) in checkTargets]
        return self

    def searchPattern(self , pattern):
        if not isinstance(pattern , self.string_type):
            raise ValueError(u">> searchPattern Error : Invalid input. Expected a string for re_pattern" )
        print("현재 self.total에 들어있는 갯수:", len(self.total))
        print("전달받은 패턴:", pattern)
        
        searchs = []
        for item in self.total:
            search = re.search(pattern , item)
            if search:
                searchs.append(item)
        self.total = searchs
        return self
    
    def searchString(self , searchStringVar):
        if not isinstance(searchStringVar, self.string_type):
            raise ValueError(u">> searchString Error : Invalid input. Expected a string")
        self.total = [x for x in self.total if fnmatch.fnmatch(x.split('|')[-1], searchStringVar)]

        return self
    
    def returnData(self):
        return self.total

    def _makeList(self, items):
        # 내부적으로만 사용하는 유틸리티: 문자열이든 리스트든 무조건 리스트로 반환
        if isinstance(items, (list, tuple)) and items:
            return list(items)
        if isinstance(items, self.string_type) and items:
            return [items]
        return []