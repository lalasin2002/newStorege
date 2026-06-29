# -*- coding: utf-8 -*-
import maya.cmds as cmds


def Grping(Target , Count , Grp_Suffix = ["_Grp" , "_Offset" , "_Prime" , '_GrpPrime'] , prefix = False):
    """
    주어진 대상 오브젝트에 대해 여러 개의 그룹을 생성하고 계층화합니다.
    생성된 그룹은 대상 오브젝트의 위치에 스냅된 후, 대상 오브젝트는 가장 안쪽 그룹의 자식이 됩니다.

    Args:
        Target (str): 그룹 계층을 생성할 대상 오브젝트의 이름.
        Count (int): 생성할 그룹의 개수 (Grp_Suffix 리스트의 처음부터 Count 만큼 사용).
        Grp_Suffix (list, optional): 생성할 그룹의 이름에 사용될 접미사 리스트.
                                     기본값은 ["_Grp", "_Offset", "_Prime", "_GrpPrime"].

    Returns:
        list: 생성된 그룹의 리스트 (바깥쪽 그룹부터 안쪽 그룹 순서).
    """

    Count = int(Count) # Count를 정수로 변환
    Groups =[] # 생성된 그룹들을 저장할 리스트
    Parent_Group = None # 이전 그룹을 저장하여 계층을 구축

    # 지정된 Count 만큼 그룹 생성 및 계층화
    for i , x in enumerate(Grp_Suffix[:Count]):
        
        if prefix:
            Group = cmds.createNode("transform" , n = "{}{}" .format(x,Target )) # 그룹 노드 생성
        else:
            Group = cmds.createNode("transform" , n = "{}{}" .format(Target ,x)) # 그룹 노드 생성

        if Parent_Group:
            cmds.parent( Parent_Group ,Group ) # 이전 그룹을 현재 그룹의 자식으로 설정 (바깥쪽에서 안쪽으로)
        Parent_Group = Group # 현재 그룹을 이전 그룹으로 업데이트
        Groups.append(Group) # 생성된 그룹을 리스트에 추가

    # 가장 바깥쪽 그룹을 대상 오브젝트의 위치에 스냅하고 제약 조건 삭제
    cmds.delete(cmds.parentConstraint(Target, Groups[-1]))
    # 대상 오브젝트를 가장 안쪽 그룹의 자식으로 설정
    cmds.parent(Target ,  Groups[0])

    return  Groups


def insertGrp(target , names = [] , match = True  , keepParent = True):
    Groups =[]
    isParent = None
    matrix = None
    if keepParent:
        isParent = cmds.listRelatives(target , p =1,fullPath=1 )

    if match:
        matrix = cmds.xform(target  , q =1 , ws =1 , m = 1)
    child = None
    for x in names:
        if child is None:
            child = target 

        
        grp = cmds.createNode("transform" , n = x)
        if matrix:
            cmds.xform(grp , ws =1 ,m = matrix)
        cmds.parent(child ,grp)
        Groups.append(grp)
        child = grp

    if isParent:
        cmds.parent(Groups[-1] , isParent[0])

    return Groups
    

class connectParent():
    def __init__(self ):
        try:
            self.string_type = basestring
        except NameError:
            self.string_type = str
        self.dictWork = {}
        


    def addTarget(self, target):
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
    def setWorkTarget(self, target,  constraintName=None, connectName=None):
        if target not in self.dictWork:
            return
        if isinstance(constraintName, self.string_type):
            self.dictWork[target]["constraintName"] = constraintName
        if isinstance(connectName, self.string_type):
            self.dictWork[target]["connectName"] = connectName
    

    def setGroupData(self, target, constraintGrpList=None, connectGrpList=None):
        if target not in self.dictWork:
            return 
        if isinstance(constraintGrpList, (list, tuple)) and all(isinstance(x, self.string_type) for x in constraintGrpList):
            self.dictWork[target]["constraintGrps"] = constraintGrpList
            
        if isinstance(connectGrpList, (list, tuple)) and all(isinstance(x, self.string_type) for x in connectGrpList):
            self.dictWork[target]["connectGrps"] = connectGrpList

        
    
    def setConstraintData(self, target, constraints=["parentConstraint"]):
        if target not in self.dictWork:
            return 
            
        if isinstance(constraints, (list, tuple)) and all(x in ["parentConstraint", "pointConstraint", "orientConstraint", "scaleConstraint"] for x in constraints):
            self.dictWork[target]["constraintTypes"] = constraints 
    
    def setConnectData(self, target, connectTarget=None, connects=["translate", "rotate"]):
        if target not in self.dictWork:
            return
            
        if self._isDag(connectTarget) and connectTarget:
            self.dictWork[target]["connectTarget"] = connectTarget
            
        if isinstance(connects, (list, tuple)) and all(x in ["translate", "rotate", "scale"] for x in connects):
            self.dictWork[target]["connectTypes"] = connects
    
    def build(self):
        if not any([ [x.get("origin") for x in self.dictWork.values()]]):
            return

        parentList = []
        for key , dictData in self.dictWork.items():
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
                constraintObj = cmds.createNode("transform" , n = constraintName)
                constraintMatrix = self._getMatrix(origin)
                cmds.xform(constraintObj , ws =1 , m = constraintMatrix)
            if connectName:
                connectObj = cmds.createNode("transform" , n = connectName)
                connectMatrix = self._getMatrix(origin)
                cmds.xform(connectObj , ws =1 , m = connectMatrix)

            if constraintGrps and constraintObj:
                constraintGrpObjs = self._insertGrp(constraintObj , constraintGrps , match = True , keepParent = True)
            if connectGrps and connectObj:
                connectGrpObjs = self._insertGrp(connectObj , connectGrps , match = True , keepParent = False)
                parentList.append( ( connectObj  , connectGrpObjs[-1]))


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
            
            
            


    def _insertGrp(self , target , names = [] , match = True  , keepParent = True):
        Groups =[]
        isParent = None
        matrix = None
        if keepParent:
            isParent = cmds.listRelatives(target , p =1,fullPath=1 )

        if match:
            matrix = cmds.xform(target  , q =1 , ws =1 , m = 1)
        child = None
        for x in names:
            if child is None:
                child = target 
            grp = cmds.createNode("transform" , n = x)
            if matrix:
                cmds.xform(grp , ws =1 ,m = matrix)
            cmds.parent(child ,grp)
            Groups.append(grp)
            child = grp

        if isParent:
            cmds.parent(Groups[-1] , isParent[0])

        return Groups

    def _getMatrix(self , item):
        if not isinstance(item , self.string_type):
            return []
        if not self._isDag(item):
            return []
        pos = cmds.xform(item , q =1 , ws =1 , m =1)
        return pos

    def _isDag(self , item):    
        if not cmds.objExists(item):
            print("Warning: '{}' 오브젝트가 존재하지 않습니다.".format(item))
            return False
        inherited_types = cmds.nodeType(item, inherited=True)
        return "dagNode" in inherited_types
    
    def _additemToList(self, listVar , item):
        if item is None:
            return
        if not isinstance(listVar , list):
            return
        if isinstance(item , self.string_type) and self._isDag(item):
            listVar.append(item)
        if isinstance(item ,  list) and all( self._isDag(x) for x in item):
            listVar.extend(item)
        if isinstance(item , tuple) and all( self._isDag(x) for x in item):
            listVar.extend(list(item))

    def _defineElement(self, item):
        returns = None
        if isinstance(item , (tuple , list)):
            if all( self._isDag(x) for x in item):
                returns  = item
        if self._isDag(item):
            returns = item
        return returns
    
