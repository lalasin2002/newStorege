# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om
import  os,copy ,json , re


from autoRig_config import AUTO_RIG_ROOT, GUIDE_RIGS_PATH
from tools import controlAttribute , controlObject , naming , createObject , match , grouping

#--------------------------------------------------------------------------

#rootPoint : space
#["rig_type" , "rig_part" , "rig_role" , "rig_data" , "rig_boneType" , "rig_index"]


def guideDetailTemplate():
    return {
        "id": None,
        "node": None,

        "rig_type": None,
        "rig_module": None,
        "rig_build": None,
        "rig_side": None,
        "rig_role": None,
        "rig_data": None,
        "rig_part": None,
        "rig_index": None,

        "pos": None,
        "rot": None,
        "scale": None,
        "matrix": None
    }




#--------------------------------------------------------------------------


def setTags(item, dts={"rig_side": "", "rig_type": "", "rig_part": "", "rig_role": "", "rig_data": "", "rig_boneType": ""}):
    '''
    지정된 오브젝트에 딕셔너리의 키/값 쌍을 문자열 속성(String Attribute)으로 추가하여 태그를 부여합니다.

    Args:
        item (str): 속성을 추가할 마야 오브젝트 이름.
        dts (dict, optional): 추가할 태그 정보가 담긴 딕셔너리.

    Returns:
        dict: 키를 어트리뷰트 이름으로 하고, 값을 생성된 어트리뷰트 전체 경로로 하는 딕셔너리.
    '''
    returnDt = {}
    for attrName, stringName in dts.items():
        attr = controlAttribute.addStringAttr(item, attrName, stringName)
        # 키를 어트리뷰트 이름으로 하여 모든 경로를 저장
        returnDt[attrName] = attr 
    return returnDt

def setInvertJntAttr(item , value = 2):
    attrPath = "{}.{}".format(item , "insertJnt")
    if not cmds.objExists(attrPath):
        controlAttribute.addCustomAttr(item , "insertJnt" , "int" , **{"min" : 0 , "hnv" : True})
    if not cmds.getAttr(attrPath, type=True) == "long":
        cmds.deleteAttr(attrPath)
        controlAttribute.addCustomAttr(item , "insertJnt" , "int",**{"min" : 0 , "hnv" : True})
    
    cmds.setAttr(attrPath , value)

    if cmds.objExists(attrPath):
        return attrPath


        





class guideDataManager():
    '''
    가이드 리그(Guide Rig)의 메타데이터를 추출하고, 설정된 네이밍/계층 규칙(Data Rules)에 따라 
    복잡한 중첩 딕셔너리를 빌드하는 매니저 클래스입니다.
    '''
    def __init__(self):
        # Guide preset 안의 Maya node metadata를 읽고 guide_data dict로 바꾸는 manager.
        # 기준은 node 이름이 아니라 rig_module, rig_side, rig_role 같은 custom attribute이다.
        # Extra guide를 여러 번 불러올 때도 같은 rig_module의 rig_build(A, B, C...)를 여기서 계산한다.
        try:
            self.string_type = basestring
        except NameError:
            self.string_type =  str

        self.standard_templete = {}
        self.standard_detail_templete = {}

        # guide data를 만들기 위해 반드시 있어야 하는 metadata.
        # 이 값이 빠진 node는 invalid 목록으로 보낸다.
        self.requiredAttrs = [
                        "rig_type",
                        "rig_module",
                        "rig_side",
                        "rig_role",
                        "rig_data",
                        "rig_part",
                    ]
        # 있으면 같이 수집하지만, 없어도 guide data 생성은 가능한 metadata.
        # rig_build가 없으면 setDefineData()에서 buildIndex로 자동 생성한다.
        self.optionalAttrs = [
                        "rig_build",
                        "rig_index",
                        "rig_attachTarget",
                    ]
        #base_id = "{rig_module}:{rig_build}:{rig_side}:{rig_role}:{rig_data}:{rig_part}"

        # 실제로 각 Maya node에서 읽어올 attribute 목록.
        self.checkPoints = self.requiredAttrs + self.optionalAttrs



    #_______________________________________________________
    def setDataRuls(self , dicts):
        '''
        데이터를 파싱할 때 사용할 새로운 계층/네이밍 규칙 딕셔너리를 덮어씌웁니다.

        Args:
            dicts (dict): 덮어씌울 룰 딕셔너리 데이터.
        '''
        if not isinstance(dicts , dict):
            return
        self.dataRules = dicts
   
    def setCheckPoints(self, List):
        '''
        메타데이터 추출 시 오브젝트에서 확인할 속성(Attribute) 리스트를 지정합니다.

        Args:
            List (list of str): 확인할 속성 이름들의 리스트.
        '''
        if not isinstance(List , list):
            return
         
        self.checkPoints = List
    #_______________________________________________________

    def importGuide(self, path , nameSpace=None):
        '''
        지정된 경로의 마야 파일을 씬에 레퍼런스(Reference)로 불러옵니다.

        Args:
            path (str): 불러올 마야 파일의 경로.
            nameSpace (str, optional): 사용할 네임스페이스 문자열.

        Returns:
            list or str: 성공 시 로드된 레퍼런스 노드 정보, 실패 시 빈 리스트.
        '''
        path = self._isCheckPath(path)
        if not path:
            return []
        
        guideNodes = controlObject.load_reference(path , nameSpace )
        #print ()
        if not guideNodes:
            return []
        

        return guideNodes
    
    def getReferenceObjects(self, refNode  ):
        '''
        특정 레퍼런스 노드에 속해있는 모든 오브젝트(노드) 목록을 가져옵니다.

        Args:
            refNode (str): 조회할 레퍼런스 노드 이름.

        Returns:
            list: 레퍼런스에 속한 오브젝트 리스트.
        '''
        if cmds.objectType(refNode) != "reference":
            return []
        
        guideObjects = controlObject.get_referenceObjects(refNode )
        return guideObjects



    def setDefineData(self, items, buildIndex=0):
        '''
        Guide object 목록을 받아 최종 guide_data dictionary로 변환한다.

        buildIndex는 rig_build 자동 생성용 값이다.
        0은 A, 1은 B, 2는 C가 된다.

        반환 구조:
            items      - 일반 guide node detail dict
            containers - group/container 성격의 guide node detail dict
            invalid    - metadata 부족 또는 guide id 중복 node 목록
        '''
        finalDict = {
            "items": {},
            "containers": {},
            "invalid": []
        }

        # 같은 부위 preset을 여러 번 불러올 때 구분값으로 쓴다.
        # arm_type을 처음 불러오면 A, 한 번 더 불러오면 B가 되는 식이다.
        rig_build = chr(65 + buildIndex)

        for item in items:
            # Maya node의 custom attr에서 rig_type, rig_module 등을 읽는다.
            metaData = self._getMetaData(item, self.checkPoints)

            if not metaData:
                continue
            if not any(metaData.get(attr) for attr in self.checkPoints):
                continue

            # requiredAttrs 중 하나라도 비어 있으면 build 대상에서 제외하고
            # invalid에 남겨서 나중에 어떤 node가 문제였는지 확인할 수 있게 한다.
            missing = [attr for attr in self.requiredAttrs if not metaData.get(attr)]
            if missing:
                finalDict["invalid"].append({
                    "node": item,
                    "reason": "missing required attrs",
                    "missing": missing
                })
                continue

            # preset 안에 rig_build가 이미 있으면 그 값을 존중한다.
            # 없을 때만 현재 buildIndex로 A/B/C 값을 만들어 넣는다.
            if not metaData.get("rig_build"):
                metaData["rig_build"] = rig_build

            detail = self._makeDetailData(item, metaData)
            guideId = detail.get("id")

            # container/group 성격의 guide는 일반 item과 분리해서 저장한다.
            if self._isContainerData(metaData):
                targetDict = finalDict["containers"]
            else:
                targetDict = finalDict["items"]

            # 같은 guide id가 같은 section 안에서 중복되면 덮어쓰지 않고 invalid로 보낸다.
            if guideId in targetDict:
                finalDict["invalid"].append({
                    "node": item,
                    "reason": "duplicated id",
                    "id": guideId,
                    "exists": targetDict[guideId].get("node")
                })
                continue

            targetDict[guideId] = detail

        return finalDict
    

    def getModulesFromItems(self, items):
        '''
        object 목록에서 rig_module 값만 모아 중복 없이 반환한다.

        같은 부위인지 판단할 때 파일명이나 namespace보다 rig_module이 안전하다.
        예: guide_bipad_arm.ma 안의 node들은 보통 arm_type을 가진다.
        '''
        modules = []

        for item in items:
            metaData = self.getMetaData(item)
            rig_module = metaData.get("rig_module")

            if rig_module and rig_module not in modules:
                modules.append(rig_module)

        return modules


    def getNextBuildIndex(self, currentData, items):
        '''
        새로 불러온 guide objects가 현재 guide_data 안에서 몇 번째 build인지 계산한다.

        예:
            currentData 안에 arm_type:A가 이미 있고,
            새 items도 arm_type이면 다음 buildIndex는 1이 된다.
            setDefineData(..., buildIndex=1)를 호출하면 rig_build는 B가 된다.

        Args:
            currentData (dict): 지금까지 누적된 guide_data.
            items (list): 이번에 새로 import된 reference object 목록.

        Returns:
            int: 다음 buildIndex. 0이면 A, 1이면 B, 2이면 C.
        '''
        if not isinstance(currentData, dict):
            currentData = {}

        # 이번에 들어온 preset이 어떤 rig_module인지 먼저 확인한다.
        # 같은 rig_module끼리만 A/B/C 순서를 공유한다.
        modules = self.getModulesFromItems(items)

        if not modules:
            return 0

        maxIndex = -1

        # guide_data는 items와 containers로 나뉘어 있으므로 둘 다 검사한다.
        for section in ["items", "containers"]:
            dataSection = currentData.get(section, {})

            if not isinstance(dataSection, dict):
                continue

            for guideId, detailData in dataSection.items():
                # 다른 부위는 buildIndex 계산에서 제외한다.
                # arm_type을 추가할 때 leg_type의 rig_build는 신경 쓰지 않는다.
                if detailData.get("rig_module") not in modules:
                    continue

                rig_build = detailData.get("rig_build")
                index = self._buildNameToIndex(rig_build)

                if index > maxIndex:
                    maxIndex = index

        return maxIndex + 1




    def getMetaData(self, item):
        '''
        item 하나의 guide metadata를 가져오는 public wrapper.

        외부 클래스(autoRig UI, debug script 등)에서는 _getMetaData()를 직접 부르지 않고
        이 메서드를 사용한다.
        '''
        return self._getMetaData(item, self.checkPoints)




    #__helper
    def _buildNameToIndex(self, rig_build):
        '''
        rig_build 문자값을 buildIndex 숫자로 바꾼다.

        A -> 0
        B -> 1
        C -> 2

        유효하지 않은 값은 -1을 반환해서 max 계산에서 무시되게 한다.
        '''
        if not rig_build:
            return -1

        rig_build = str(rig_build).upper()

        if len(rig_build) != 1:
            return -1

        if not "A" <= rig_build <= "Z":
            return -1

        return ord(rig_build) - ord("A")

    def _makeGuideId(self, metaData):
        '''
        guide data dictionary의 key로 사용할 고유 id를 만든다.

        rig_module, rig_build, side, role, data, part를 조합한다.
        같은 부위라도 rig_build가 다르면 다른 guide로 구분된다.
        '''
        return "{}:{}:{}:{}:{}:{}".format(
            metaData.get("rig_module", ""),
            metaData.get("rig_build", ""),
            metaData.get("rig_side", ""),
            metaData.get("rig_role", ""),
            metaData.get("rig_data", ""),
            metaData.get("rig_part", "")
        )
    def _isContainerData(self, metaData):
        '''
        이 guide node를 일반 item이 아니라 container 쪽에 넣을지 판단한다.

        현재 기준:
            rig_role == "container"
            또는 rig_data == "group"
        '''
        if metaData.get("rig_role") == "container":
            return True

        if metaData.get("rig_data") == "group":
            return True

        return False

    def _makeDetailData(self, item, metaData):
        '''
        metadata와 transform 정보를 합쳐 guide detail dictionary를 만든다.

        pos/rot/scale/matrix는 가능한 경우에만 수집한다.
        shape node처럼 transform query가 안 되는 node는 None으로 남긴다.
        '''
        detail = {
            "id": self._makeGuideId(metaData),
            "node": item,

            "rig_type": metaData.get("rig_type"),
            "rig_module": metaData.get("rig_module"),
            "rig_build": metaData.get("rig_build"),
            "rig_side": metaData.get("rig_side"),
            "rig_role": metaData.get("rig_role"),
            "rig_data": metaData.get("rig_data"),
            "rig_part": metaData.get("rig_part"),
            "rig_index": metaData.get("rig_index"),
            "rig_attachTarget": metaData.get("rig_attachTarget"),

            #"pos": None,
            #"rot": None,
            #"scale": None,
            "matrix": None
        }
        '''
        try:
            detail["pos"] = [round(v, 3) for v in cmds.xform(item, ws=1, q=1, t=1)]
        except:
            detail["pos"] = None

        try:
            detail["rot"] = [round(v, 3) for v in cmds.xform(item, ws=1, q=1, ro=1)]
        except:
            detail["rot"] = None

        try:
            detail["scale"] = [round(v, 3) for v in cmds.xform(item, r=1, q=1, s=1)]
        except:
            detail["scale"] = None
        '''
        try:
            detail["matrix"] = [round(v, 5) for v in cmds.xform(item, ws=1, q=1, m=1)]
        except:
            detail["matrix"] = None

        return detail


    def _getMetaData(self , item , checkPoints ):
        '''
        (내부 헬퍼) 오브젝트에서 특정 속성(checkPoints)들의 값을 모두 가져와 딕셔너리로 만듭니다.

        Args:
            item (str): 오브젝트 이름.
            checkPoints (list): 조회할 속성 리스트.

        Returns:
            dict: {속성이름: 속성값} 형태의 딕셔너리.
        '''
        if not isinstance(item , self.string_type):
            return {}
        if not isinstance(checkPoints , (list ,tuple)):
            return {}
        
        metaData = {}
        for attr in checkPoints:
            getAttrValue = self._getAttrData(item , attr)
            metaData[attr] =  getAttrValue 

        return metaData


    def _getAttrData(self, item, checkitem):
        if not cmds.objExists(item):
            return

        userAttrs = cmds.listAttr(item, userDefined=True) or []
        if checkitem not in userAttrs:
            return

        objAttrPath = "{}.{}".format(item, checkitem)

        try:
            return cmds.getAttr(objAttrPath)
        except:
            return None

    def _isCheckPath(self, path , abs  = False ):
        '''
        (내부 헬퍼) 시스템 상에 경로(Path)가 실제로 존재하는지 검증합니다.

        Args:
            path (str): 검증할 파일 경로.
            abs (bool, optional): 절대 경로(Absolute Path)로 변환해 반환할지 여부. 기본값 False.

        Returns:
            str or None: 존재하는 경로. 존재하지 않으면 None.
        '''
        isExistPath = os.path.exists(path)
        if not isExistPath:
            return None
        if abs:
            path = os.path.abspath(path)
        return path
    
    def _addList(self, item , addTargetList):
        '''
        (내부 헬퍼) 문자열 또는 문자열 리스트를 목적지 리스트에 안전하게 병합합니다.
        '''
        if not isinstance( addTargetList , list):
            return
        if isinstance(item , (list, tuple)) and all(isinstance(x , self.string_type) for x in item):
            addTargetList.extend(item )
        if isinstance(item , self.string_type):
            addTargetList.append(item)
        return addTargetList
    

class guideCombine():
    def __init__(self):
        '''
        여러 파트로 분할된 가이드 리그(Guide Rig)들을 특정 신체 부위 기준점(Root, Chest 등)에 맞춰 
        Constraint로 연결하고, 씬을 정리하기 위한 전체 통합 그룹 구조를 구성하는 클래스입니다.
        '''
        try:
            self.string_type = basestring
        except NameError:
            self.string_type =  str
        self.task = []


        self.chestPoint = None
        self.rootPoint = None
        self.headPoint = None
        self.LeftHandPoint = None
        self.RightHandPoint = None
        self.groups = { "guide_total" : None,
                        "guide_rig" : None,
                        "guide_nonParent" : None
        }
        
#----------------------------------------
    def setChestPoint(self, item):
        '''가슴(Chest) 연결 기준점이 될 오브젝트를 설정합니다.'''
        if not cmds.objExists(item): return 
        self.chestPoint = item

    def setRootPoint(self, item):
        '''루트(Root/Pelvis) 연결 기준점이 될 오브젝트를 설정합니다.'''
        if not cmds.objExists(item): return 
        self.rootPoint = item

    def setHeadPoint(self, item):
        '''머리(Head) 연결 기준점이 될 오브젝트를 설정합니다.'''
        if not cmds.objExists(item): return 
        self.headPoint = item

    def setLeftHandPoint(self, item):
        '''왼손(Left Hand) 연결 기준점이 될 오브젝트를 설정합니다.'''
        if not cmds.objExists(item): return 
        self.LeftHandPoint = item

    def setRightHandPoint(self, item):
        '''오른손(Right Hand) 연결 기준점이 될 오브젝트를 설정합니다.'''
        if not cmds.objExists(item): return 
        self.RightHandPoint = item

    #----------------------------------------
    def setCombineRoot(self, item):
        '''설정된 Root 기준점 오브젝트가 대상(item)을 제어하도록 Parent Constraint를 설정합니다.'''
        if not cmds.objExists(item): 
            return
        if not self.rootPoint and not cmds.objExists(self.rootPoint):
            raise ValueError("Root point is not set. Please set the root point before combining.")
        isConstraint = cmds.listRelatives(item, type="parentConstraint")
        if isConstraint: cmds.delete(isConstraint)

        
        cmds.parentConstraint(self.rootPoint, item, mo=1)

    def setCombineChest(self, item):
        '''설정된 Chest 기준점 오브젝트가 대상(item)을 제어하도록 Parent Constraint를 설정합니다.'''
        if not cmds.objExists(item): 
            return
        if not self.chestPoint or not cmds.objExists(self.chestPoint):
            raise ValueError("Chest point is not set. Please set the chest point before combining.")
        isConstraint = cmds.listRelatives(item, type="parentConstraint")
        if isConstraint: cmds.delete(isConstraint)
        
        cmds.parentConstraint(self.chestPoint, item, mo=1)

    def setCombineHead(self, item):
        '''설정된 Head 기준점 오브젝트가 대상(item)을 제어하도록 Parent Constraint를 설정합니다.'''
        if not cmds.objExists(item): 
            return
        if not self.headPoint or not cmds.objExists(self.headPoint):
            raise ValueError("Head point is not set. Please set the head point before combining.")
        isConstraint = cmds.listRelatives(item, type="parentConstraint")
        if isConstraint: cmds.delete(isConstraint)
        cmds.parentConstraint(self.headPoint, item, mo=1)

    def setCombineLeftHand(self, item):
        '''설정된 Left Hand 기준점 오브젝트가 대상(item)을 제어하도록 Parent Constraint를 설정합니다.'''
        if not cmds.objExists(item): 
            return
        if not self.LeftHandPoint or not cmds.objExists(self.LeftHandPoint):
            raise ValueError("Left Hand point is not set. Please set the left hand point before combining.")
        isConstraint = cmds.listRelatives(item, type="parentConstraint")
        if isConstraint: cmds.delete(isConstraint)
        cmds.parentConstraint(self.LeftHandPoint, item, mo=1)

    def setCombineRightHand(self, item):
        '''설정된 Right Hand 기준점 오브젝트가 대상(item)을 제어하도록 Parent Constraint를 설정합니다.'''
        if not cmds.objExists(item): 
            return
        if not self.RightHandPoint or not cmds.objExists(self.RightHandPoint):
            raise ValueError("Right Hand point is not set. Please set the right hand point before combining.")
        isConstraint = cmds.listRelatives(item, type="parentConstraint")
        if isConstraint: cmds.delete(isConstraint)
        
        cmds.parentConstraint(self.RightHandPoint, item, mo=1)

    def parentRigGroup(self, item):
        '''
        지정된 오브젝트를 가이드 리그 전용 계층인 'guide_rig' 그룹 아래로 페어런트합니다.
        
        Args:
            item (str): 페어런트 할 마야 오브젝트 이름.
        '''
        if not cmds.objExists(item): return
        isCheckDt = self._checkDict(self.groups)
        if not isCheckDt: return
        try:
            cmds.parent(item, self.groups["guide_rig"])
        except:
            pass

    def parentNonParentGroup(self, item):
        '''
        지정된 오브젝트를 독립 가이드 계층인 'guide_nonParent' 그룹 아래로 페어런트합니다.
        
        Args:
            item (str): 페어런트 할 마야 오브젝트 이름.
        '''
        if not cmds.objExists(item): 
            return
        isCheckDt = self._checkDict(self.groups)
        if not isCheckDt: return
        try:
            cmds.parent(item, self.groups["guide_nonParent"])
        except:
            pass

    def createTotalGroup(self, names=["guide_setUp", "guide_rig", "guide_nonParent"]):
        '''
        씬 정리를 위한 가이드 전체 최상위 그룹 및 하위 셋업 그룹 구조를 생성하고 구성합니다.

        Args:
            names (list, optional): [전체그룹명, 리그그룹명, 논페어런트그룹명] 순서의 리스트.
        '''
        if not isinstance(names, (list, tuple)): return
        if not len(names) == 3: return
        groups = []
        
        for name in names:
            if cmds.objExists(name):
                grp = name
            else:
                grp = cmds.createNode("transform", n=name)
            groups.append(grp)

        self.groups["guide_total"] = groups[0]
        self.groups["guide_rig"] = groups[1]
        self.groups["guide_nonParent"] = groups[2]

        try: cmds.parent(self.groups["guide_rig"], self.groups["guide_total"])
        except: pass
        
        try: cmds.parent(self.groups["guide_nonParent"], self.groups["guide_total"])
        except: pass

    def set_method_data(self,constraintType = None , flag = None):
        if not constraintType  in ["parentConstraint" , "pointConstraint" , "orientConstraint" , "scaleConstraint"]:
            return  None 
        
        if flag is None:
            flag = {}
        if not isinstance(flag , dict):
            flag = {}
        
        return { "type" : constraintType , "flag" : flag }

    def set_combine_data(self , source , target , method):
        if not isinstance(source , self.string_type):
            return None
        if not isinstance(target , self.string_type):
            return None
        if not isinstance(method , dict):
            return None
        data = {"source" : source , "target" : target , "operation" :  method }
        self.task.append( data )
        return data 
    
    def build_task(self):
        if not len(self.task)>0:
            return
        for task in self.task:
            source = None
            target = None
            operater = None
            flag = None
            isSource = task.get("source")
            isTarget = task.get("target")
            isMethod = task.get("operation")
            if not all([isSource, isTarget, isMethod]):
                continue
            source = isSource
            target = isTarget
            operater = isMethod.get("type")
            flag = isMethod.get("flag")

            if not cmds.objExists(source):
                continue

            if not cmds.objExists(target):
                continue

            if not operater in ["parentConstraint" , "pointConstraint" , "orientConstraint" , "scaleConstraint"] or not flag:
                continue
            try:
                if operater == "parentConstraint":
                    cmds.parentConstraint(source , target , **flag)
                elif operater == "pointConstraint":
                    cmds.pointConstraint(source , target , **flag)
                elif operater == "orientConstraint":
                    cmds.orientConstraint(source , target , **flag)
                elif operater == "scaleConstraint":
                    cmds.scaleConstraint(source , target , **flag)
            except Exception as e:
                print ( u"build_task 에러 : {}" .format(e) )



    def get_data(self):
        return self.task
        
    # -- helper
    def _checkDict(self, dt):
        '''
        (내부 헬퍼) 딕셔너리가 비어있지 않고, 내부의 키(Key) 값들이 유효한지 검증합니다.
        '''
        if not isinstance(dt, dict): return False
        if not dt: return False

        for key in dt.keys():
            if not key: return False
        return True

    def _matchPoint(self, matchItem, destnationItem):
        '''
        (내부 헬퍼) 두 오브젝트의 위치(Translate)만 매치시킵니다.
        '''
        cmds.matchTransform(matchItem, destnationItem, pos=1, rot=0, scl=0)

    
def safeGetKey(dictionary, keys, default=None):
    """
    중첩된 딕셔너리에서 키 리스트를 바탕으로 안전하게 값을 가져오는 함수
    """
    if not isinstance(dictionary, dict):
        return default
    if not isinstance(keys, (list, tuple)):
        return default
    result = dictionary
    for key in keys:
        # 현재 탐색 중인 값이 딕셔너리 타입이고, 안에 해당 키가 있을 때만 한 단계 더 들어감
        if isinstance(result, dict) and key in result:
            result = result[key]
        else:
            return default  # 중간에 키가 끊기거나 딕셔너리가 아니면 기본값(None) 반환
    
    return result


        
def findKeyValues(dt, targetKey, results=None):
    '''
    중첩된 딕셔너리(리스트 포함) 구조 안에서 특정 키(Key)와 일치하는 
    모든 값(Value)들을 찾아 리스트로 반환하는 재귀 함수입니다.

    Args:
        dt (dict): 탐색을 진행할 대상 중첩 딕셔너리.
        targetKey (str): 값을 추출하고자 하는 딕셔너리의 키 이름.
        results (list, optional): 재귀적으로 값을 누적할 빈 리스트. 외부 호출 시 생략 권장.

    Returns:
        list: 검색된 모든 Value들이 담긴 리스트.

    Example:
        >>> my_dict = {"a": {"id": 1}, "b": {"c": {"id": 2}}}
        >>> findKeyValues(my_dict, "id")
        [1, 2]
    '''
    if results is None:
        results = []

    if not isinstance(dt, dict):
        return results

    for key, value in dt.items():
        if key == targetKey:
            results.append(value)

        if isinstance(value, dict):
            findKeyValues(value, targetKey, results)

        elif isinstance(value, (list, tuple)):
            for item in value:
                if isinstance(item, dict):
                    findKeyValues(item, targetKey, results)

    return results


class JointBuilder():
    def __init__(self):
        try:
            self.string_type = basestring
        except NameError:
            self.string_type =  str

        try:
            self.integer_type = (int, long)
        except NameError:
            self.integer_type = (int,)
        self.number_type = self.integer_type + (float,)

        self.build_plan  = {"joints" : [],
                            "rootParent" : None
                            }
        self.joint_data_temp = {"joint_name" : None ,
                                "group_name" : None ,
                                           #"curve" / "point"
                                "position" : {"mode" : None , "source" : None , "parameter" : None  },
                                            #"orient" / "aim" / "tangent"
                                "orientation" : {"mode" : None ,
                                                 "source" : None ,
                                                 "maintainOffset" : None ,
                                                 "aimVector" : None ,
                                                 "upVector" : None ,
                                                 "worldUpVector" : None ,
                                                 "worldUpType" : None  ,
                                                 "worldUpObject": None },
                                "node_names" : {"pocif" : None , "pointMatrix" : None },
                                "index" : None
                                }
        self.check_task = ["joint_name" , "group_name" , "position" , "orientation" ,"node_names" , "index" ]
        self.check_position_task = ["mode" , "source"  , "parameter"  ]
        self.check_orientation_task = ["mode" ,"source" , "maintainOffset" , "aimVector" , "upVector" , "worldUpVector" ,"worldUpType", "worldUpObject" ]
        #self.check_nodeName_task = ["pocif" , "pointMatrix" , "mulMatrix" , "decomposeMatrix" , "orientConstraint" ]
        # 현재 position 연결은 POCIF 또는 locator의 point 값과
        # pointMatrixMult를 사용하므로 아래 두 이름만 검사합니다.
        self.check_nodeName_task = ["pocif" , "pointMatrix"]

        self.check_position_mode = ["curve" , "point"]
        self.check_orientation_mode = ["orient" , "aim" , "tangent", "inherit", "none"]
        self.check_orientConstraint_type = ["scene", "object", "objectrotation", "vector", "none"]


        self.current_plan_data = None





    def define_joint_planData(self, joint_name, group_name=None, data=None):
        '''
        현재 작성 중인 task에 생성할 joint와 group 이름을 정의합니다.

        data를 전달하면 해당 dictionary 자체를 수정합니다.
        data를 생략하면 current_plan_data를 사용하고, 현재 데이터도 없으면
        joint_data_temp을 복사하여 새로운 task 작성을 시작합니다.
        '''
        if not isinstance(joint_name, self.string_type):
            raise ValueError(
                u"define_joint_planData: {}은 문자열이어야 합니다.".format(joint_name)
            )

        if group_name is not None:
            if not isinstance(group_name, self.string_type):
                raise ValueError(
                    u"define_joint_planData: group_name은 문자열 또는 None이어야 합니다."
                )

        joint_data = self._resolve_plan_data(data)
        joint_data["joint_name"] = joint_name
        joint_data["group_name"] = group_name
        return joint_data


    def define_point_planData(self, source, pointMatrix_name=None,
                              live=True, data=None):
        '''
        현재 task의 위치를 locator 또는 DAG object의 위치로 정의합니다.

        source의 world position은 build 단계에서 pointMatrixMult를 통해
        joint group 부모 공간의 translate 값으로 변환될 예정입니다.
        '''
        self._validate_dag_object(source, "define_point_planData")
        self._validate_optional_name(pointMatrix_name,
                                     "define_point_planData",
                                     "pointMatrix_name")
        self._validate_bool(live, "define_point_planData", "live")

        joint_data = self._resolve_plan_data(data)
        joint_data["position"]["mode"] = "point"
        joint_data["position"]["source"] = source
        joint_data["position"]["parameter"] = None
        joint_data["position"]["live"] = live

        # point 위치에서는 POCIF가 필요하지 않습니다.
        joint_data["node_names"]["pocif"] = None
        joint_data["node_names"]["pointMatrix"] = pointMatrix_name
        return joint_data


    def define_pointOnCurve_planData(self, curveShape, param, pocif_name,
                                     pointMatrix_name=None, live=True,
                                     data=None):
        '''
        현재 task의 위치를 NURBS curve 위의 parameter 위치로 정의합니다.

        curveShape에는 nurbsCurve shape 또는 해당 shape을 가진 transform을
        전달할 수 있습니다. build 단계에서는 POCIF가 curve 위치를 구하고,
        pointMatrixMult가 그 위치를 joint group 부모 공간으로 변환합니다.
        '''
        self._validate_curve(curveShape, "define_pointOnCurve_planData")

        if not isinstance(param, self.number_type) or isinstance(param, bool):
            raise ValueError(
                u"define_pointOnCurve_planData: {}는 숫자여야 합니다.".format(param)
            )

        if not isinstance(pocif_name, self.string_type):
            raise ValueError(
                u"define_pointOnCurve_planData: pocif_name은 문자열이어야 합니다."
            )

        self._validate_optional_name(pointMatrix_name,
                                     "define_pointOnCurve_planData",
                                     "pointMatrix_name")
        self._validate_bool(live,
                            "define_pointOnCurve_planData",
                            "live")

        joint_data = self._resolve_plan_data(data)
        joint_data["position"]["mode"] = "curve"
        joint_data["position"]["source"] = curveShape
        joint_data["position"]["parameter"] = param
        joint_data["position"]["live"] = live
        joint_data["node_names"]["pocif"] = pocif_name
        joint_data["node_names"]["pointMatrix"] = pointMatrix_name
        return joint_data


    def define_orient_planData(self, source, maintainOffset=False, data=None):
        '''
        현재 task의 회전을 source의 회전값을 따라가도록 정의합니다.

        이 mode는 build 단계에서 orientConstraint 또는 동일한 회전 연결
        방식으로 처리하기 위한 데이터입니다.
        '''
        self._validate_dag_object(source, "define_orient_planData")
        self._validate_bool(maintainOffset,
                            "define_orient_planData",
                            "maintainOffset")

        joint_data = self._resolve_plan_data(data)
        self._set_orientation_data(
            joint_data,
            mode="orient",
            source=source,
            maintainOffset=maintainOffset
        )
        return joint_data


    def define_aim_planData(self, source, aimV, upV, worldV=None,
                            worldUpObject=None, worldUpType="scene",
                            maintainOffset=False, data=None):
        '''
        현재 task의 회전을 source를 바라보는 aim 방식으로 정의합니다.

        예를 들어 ankle task의 source에 toe locator를 전달하면 ankle이
        toe 방향을 바라보도록 만드는 데 사용할 수 있습니다.
        '''
        #참고용
        # orientation 데이터에는 mode/source와 Maya constraint에 필요한
        # 방향 vector 및 world-up 설정이 함께 저장됩니다.
        self._validate_dag_object(source, "define_aim_planData")
        aim_vector = self._validate_vector(aimV,
                                           "define_aim_planData",
                                           "aimV")
        up_vector = self._validate_vector(upV,
                                          "define_aim_planData",
                                          "upV")
        world_vector = self._validate_optional_vector(
            worldV,
            "define_aim_planData",
            "worldV"
        )
        self._validate_world_up(worldUpType,
                                worldUpObject,
                                "define_aim_planData")
        self._validate_bool(maintainOffset,
                            "define_aim_planData",
                            "maintainOffset")

        joint_data = self._resolve_plan_data(data)
        self._set_orientation_data(
            joint_data,
            mode="aim",
            source=source,
            maintainOffset=maintainOffset,
            aimVector=aim_vector,
            upVector=up_vector,
            worldUpVector=world_vector,
            worldUpType=worldUpType,
            worldUpObject=worldUpObject
        )
        return joint_data


    def define_tangent_planData(self, curveShape, aimV, upV, worldV=None,
                                worldUpObject=None, worldUpType="scene",
                                data=None):
        '''
        현재 task의 회전을 curve tangent 방향으로 정의합니다.

        curve 위치는 define_pointOnCurve_planData에서 정의하고,
        tangent 회전은 이 메서드에서 별도로 정의하므로 위치 방식과
        회전 방식을 독립적으로 조합할 수 있습니다.
        '''
        self._validate_curve(curveShape, "define_tangent_planData")
        aim_vector = self._validate_vector(aimV,
                                           "define_tangent_planData",
                                           "aimV")
        up_vector = self._validate_vector(upV,
                                          "define_tangent_planData",
                                          "upV")
        world_vector = self._validate_optional_vector(
            worldV,
            "define_tangent_planData",
            "worldV"
        )
        self._validate_world_up(worldUpType,
                                worldUpObject,
                                "define_tangent_planData")

        joint_data = self._resolve_plan_data(data)
        self._set_orientation_data(
            joint_data,
            mode="tangent",
            source=curveShape,
            maintainOffset=False,
            aimVector=aim_vector,
            upVector=up_vector,
            worldUpVector=world_vector,
            worldUpType=worldUpType,
            worldUpObject=worldUpObject
        )
        return joint_data


    def define_inherit_planData(self, data=None):
        '''
        현재 task가 별도의 회전 연결 없이 부모 회전을 상속하도록 정의합니다.

        다음 aim 대상이 없는 toeEnd 같은 마지막 조인트에 사용할 수 있습니다.
        '''
        joint_data = self._resolve_plan_data(data)
        self._set_orientation_data(joint_data, mode="inherit")
        return joint_data


    def define_noneOrient_planData(self, data=None):
        '''현재 task에 회전 작업을 만들지 않도록 정의합니다.'''
        joint_data = self._resolve_plan_data(data)
        self._set_orientation_data(joint_data, mode="none")
        return joint_data


    def define_index_planData(self, index, data=None):
        '''현재 task가 build될 순서를 나타내는 index를 정의합니다.'''
        if not isinstance(index, self.integer_type) or isinstance(index, bool):
            raise ValueError(
                u"define_index_planData: {}는 정수여야 합니다.".format(index)
            )
        if index < 0:
            raise ValueError(
                u"define_index_planData: index는 0 이상이어야 합니다."
            )

        joint_data = self._resolve_plan_data(data)
        joint_data["index"] = index
        return joint_data

    def define_rootParent(self, source , force = True):
        item = None 
        if force:
            item  = self._validate_dag_object(source, "define_rootParent")
        else:
            if isinstance(source , self.string_type):
                item = source 
        
        self.build_plan["rootParent"] = item 

    def add_current_plan_task(self, data=None):
        '''
        현재 작성이 끝난 joint task를 build_plan의 joints 목록에 등록합니다.

        등록이 끝나면 current_plan_data를 비웁니다. 다음 define 호출이
        이미 등록한 task를 다시 수정하지 않도록 하기 위한 처리입니다.
        '''
        joint_data = self._resolve_plan_data(data)

        # index를 따로 정의하지 않은 경우에는 현재 사용하지 않는
        # 가장 작은 index를 자동으로 부여합니다.
        if joint_data.get("index") is None:
            used_index = [
                task.get("index") for task in self.build_plan["joints"]
            ]
            index = 0
            while index in used_index:
                index += 1
            joint_data["index"] = index

        self._validate_completed_plan_data(joint_data)

        index = joint_data.get("index")
        for current_data in self.build_plan["joints"]:
            if current_data.get("index") == index:
                raise ValueError(
                    u"add_current_plan_task: 중복된 index입니다: {}".format(index)
                )

        # 전달받은 data 자체를 task로 사용하는 현재 설계를 유지합니다.
        # 이곳에서는 deepcopy하지 않습니다.
        self.build_plan["joints"].append(joint_data)
        self.current_plan_data = None
        return joint_data


    def clear_current_plan_data(self):
        '''작성 중인 task를 등록하지 않고 취소합니다.'''
        self.current_plan_data = None


    def build(self , radius = 0.25):
        #check
        joint_plans = self.build_plan.get("joints")
        if not isinstance(joint_plans, (list, tuple)):
            raise ValueError(
                u"build: build_plan['joints']는 list 또는 tuple이어야 합니다."
            )
        if not joint_plans:
            raise ValueError(u"build: 만들어진 plan Data가 없습니다")

        # Maya node를 만들기 전에 모든 task를 먼저 검사합니다.
        # 잘못된 task 때문에 build 도중 일부 node만 남는 상황을 줄입니다.
        checked_indexes = []
        planned_node_names = []

        for task_order, plan_data in enumerate(joint_plans):
            if not isinstance(plan_data, dict):
                raise ValueError(
                    u"build: {}번째 plan Data가 dictionary가 아닙니다.".format(
                        task_order
                    )
                )

            try:
                self._validate_completed_plan_data(plan_data)
            except ValueError as error:
                raise ValueError(
                    u"build: index {} task 검증 실패 - {}".format(
                        plan_data.get("index", task_order),
                        error
                    )
                )

            plan_index = plan_data.get("index")
            if plan_index in checked_indexes:
                raise ValueError(
                    u"build: 중복된 task index입니다: {}".format(plan_index)
                )
            checked_indexes.append(plan_index)

            # Maya가 중복 이름에 숫자를 자동으로 붙이지 않도록
            # 실제 생성 전에 plan 내부와 scene의 이름 충돌을 검사합니다.
            node_names = plan_data.get("node_names") or {}
            create_names = [
                plan_data.get("joint_name"),
                plan_data.get("group_name"),
                node_names.get("pocif"),
                node_names.get("pointMatrix")
            ]

            for create_name in create_names:
                if not create_name:
                    continue
                if create_name in planned_node_names:
                    raise ValueError(
                        u"build: plan 안에서 생성 이름이 중복됩니다: {}".format(
                            create_name
                        )
                    )
                if cmds.objExists(create_name):
                    raise ValueError(
                        u"build: 이미 존재하는 Maya node 이름입니다: {}".format(
                            create_name
                        )
                    )
                planned_node_names.append(create_name)

        plans = sorted(joint_plans, key=lambda data: data["index"])

        parent = None
        root = None
        for plan_data in plans:

            #초기화
            Jnt = None
            Jnt_grp = None
            target = None

            Jnt_name = plan_data.get("joint_name")
            grp_name = plan_data.get("group_name")

            position_mode =None
            position_source = None

            position_parameter = None
            position_pocif_node = None
            position_pointMatrix_node = None

            orient_mode = None
            orient_source = None
            orient_maintainOffset = None
            orient_rotData_flag = {}




            # 조인트/그룹/ target 지정 및 생성
            cmds.select(cl =1)
            Jnt = cmds.joint(n = Jnt_name )
            cmds.setAttr(Jnt + ".radius" , radius)
            if not Jnt or not cmds.objExists(Jnt):
                raise RuntimeError(
                    u"build: joint 생성에 실패했습니다: {}".format(Jnt_name)
                )
            target = Jnt

            if grp_name:
                Jnt_grp = grouping.insertGrp(Jnt , [grp_name])
                if not Jnt_grp or not cmds.objExists(Jnt_grp[0]):
                    raise RuntimeError(
                        u"build: joint group 생성에 실패했습니다: {}".format(
                            grp_name
                        )
                    )
                target = Jnt_grp[0]
            if root is None:
                root = target
            # 일차 검증
            if target is None or not cmds.objExists(target):
                raise RuntimeError(
                    u"build: position/orientation을 적용할 target이 없습니다: {}".format(
                        Jnt_name
                    )
                )


            # position 세팅
            position_mode = plan_data["position"].get("mode")
            position_source = plan_data["position"].get("source")
            if position_mode not in self.check_position_mode:
                raise ValueError(
                    u"build: 유효하지 않은 position mode입니다: {}".format(
                        position_mode
                    )
                )
            if not position_source or not cmds.objExists(position_source):
                raise ValueError(
                    u"build: position source가 존재하지 않습니다: {}".format(
                        position_source
                    )
                )

            if position_mode == "point":
                point_constraint = cmds.pointConstraint(
                    position_source,
                    target,
                    mo=0
                )
                if not point_constraint:
                    raise RuntimeError(
                        u"build: pointConstraint 생성에 실패했습니다: {} -> {}".format(
                            position_source,
                            target
                        )
                    )

            elif position_mode == "curve":
                position_parameter = plan_data["position"].get("parameter")
                position_pocif_name = plan_data["node_names"].get("pocif")
                position_pointMatrix_name = plan_data["node_names"].get("pointMatrix")

                if (
                    not isinstance(position_parameter, self.number_type)
                    or isinstance(position_parameter, bool)
                ):
                    raise ValueError(
                        u"build: curve parameter가 올바르지 않습니다: {}".format(
                            position_parameter
                        )
                    )
                if not position_pocif_name:
                    raise ValueError(
                        u"build: curve mode에는 POCIF 이름이 필요합니다: {}".format(
                            Jnt_name
                        )
                    )

                position_pocif_node = createObject.createPocif(
                    position_pocif_name,
                    position_source,
                    position_parameter,
                    True
                )
                if not position_pocif_node or not cmds.objExists(position_pocif_node):
                    raise RuntimeError(
                        u"build: POCIF 생성에 실패했습니다: {}".format(
                            position_pocif_name
                        )
                    )

                connect_task = [
                    (
                        "{}.position".format(position_pocif_node),
                        "{}.translate".format(target)
                    )
                ]

                if position_pointMatrix_name:
                    position_pointMatrix_node = cmds.createNode(
                        "pointMatrixMult",
                        n=position_pointMatrix_name
                    )
                    if (
                        not position_pointMatrix_node
                        or not cmds.objExists(position_pointMatrix_node)
                    ):
                        raise RuntimeError(
                            u"build: pointMatrixMult 생성에 실패했습니다: {}".format(
                                position_pointMatrix_name
                            )
                        )

                    cmds.setAttr(
                        "{}.vectorMultiply".format(position_pointMatrix_node),
                        False
                    )

                    # pointMatrixMult를 사용하면 POCIF의 world position을
                    # target 부모 공간의 translate 값으로 변환합니다.
                    connect_task = [
                        (
                            "{}.position".format(position_pocif_node),
                            "{}.inPoint".format(position_pointMatrix_node)
                        ),
                        (
                            "{}.parentInverseMatrix[0]".format(target),
                            "{}.inMatrix".format(position_pointMatrix_node)
                        ),
                        (
                            "{}.output".format(position_pointMatrix_node),
                            "{}.translate".format(target)
                        )
                    ]

                if not connect_task:
                    raise RuntimeError(
                        u"build: curve position 연결 작업이 만들어지지 않았습니다: {}".format(
                            Jnt_name
                        )
                    )

                for cnt_source, cnt_destination in connect_task:
                    cmds.connectAttr(cnt_source, cnt_destination, f=1)

            # orient 세팅
            orient_mode = plan_data["orientation"].get("mode")
            orient_source = plan_data["orientation"].get("source")
            if orient_mode not in self.check_orientation_mode:
                raise ValueError(
                    u"build: 유효하지 않은 orientation mode입니다: {}".format(
                        orient_mode
                    )
                )

            if orient_mode in ["inherit", "none"]:
                # inherit와 none은 별도의 constraint를 생성하지 않습니다.
                pass

            elif orient_mode == "orient":
                if not orient_source or not cmds.objExists(orient_source):
                    raise ValueError(
                        u"build: orient source가 존재하지 않습니다: {}".format(
                            orient_source
                        )
                    )
                orient_maintainOffset = plan_data["orientation"].get("maintainOffset")
                if not isinstance(orient_maintainOffset, bool):
                    raise ValueError(
                        u"build: orient maintainOffset은 bool이어야 합니다."
                    )
                orient_constraint = cmds.orientConstraint(
                    orient_source,
                    target,
                    mo=orient_maintainOffset
                )
                if not orient_constraint:
                    raise RuntimeError(
                        u"build: orientConstraint 생성에 실패했습니다: {} -> {}".format(
                            orient_source,
                            target
                        )
                    )

            elif orient_mode in ["aim", "tangent"]:
                if not orient_source or not cmds.objExists(orient_source):
                    raise ValueError(
                        u"build: {} source가 존재하지 않습니다: {}".format(
                            orient_mode,
                            orient_source
                        )
                    )

                orientation_data = plan_data["orientation"]
                aim_vector = orientation_data.get("aimVector")
                up_vector = orientation_data.get("upVector")
                world_up_vector = orientation_data.get("worldUpVector")
                world_up_type = orientation_data.get("worldUpType") or "scene"
                world_up_object = orientation_data.get("worldUpObject")

                if self._check_vector(aim_vector) is None:
                    raise ValueError(
                        u"build: {} aimVector가 올바르지 않습니다: {}".format(
                            orient_mode,
                            aim_vector
                        )
                    )
                if self._check_vector(up_vector) is None:
                    raise ValueError(
                        u"build: {} upVector가 올바르지 않습니다: {}".format(
                            orient_mode,
                            up_vector
                        )
                    )
                if (
                    world_up_vector is not None
                    and self._check_vector(world_up_vector) is None
                ):
                    raise ValueError(
                        u"build: {} worldUpVector가 올바르지 않습니다: {}".format(
                            orient_mode,
                            world_up_vector
                        )
                    )
                if world_up_type not in self.check_orientConstraint_type:
                    raise ValueError(
                        u"build: 유효하지 않은 worldUpType입니다: {}".format(
                            world_up_type
                        )
                    )
                if (
                    world_up_type in ["object", "objectrotation"]
                    and not world_up_object
                ):
                    raise ValueError(
                        u"build: worldUpType이 {}이면 worldUpObject가 필요합니다.".format(
                            world_up_type
                        )
                    )
                if world_up_object and not cmds.objExists(world_up_object):
                    raise ValueError(
                        u"build: worldUpObject가 존재하지 않습니다: {}".format(
                            world_up_object
                        )
                    )

                orient_rotData_flag = {
                    "aimVector": aim_vector,
                    "upVector": up_vector,
                    "worldUpType": world_up_type
                }
                if world_up_vector is not None:
                    orient_rotData_flag["worldUpVector"] = world_up_vector
                if world_up_object is not None:
                    orient_rotData_flag["worldUpObject"] = world_up_object

                if orient_mode == "aim":
                    orient_maintainOffset = orientation_data.get("maintainOffset")
                    if not isinstance(orient_maintainOffset, bool):
                        raise ValueError(
                            u"build: aim maintainOffset은 bool이어야 합니다."
                        )
                    orientManager = match.orientManager()
                    orient_rotData_flag["maintainOffset"] = orient_maintainOffset
                    orientManager.aimOrientObject(orient_source , target , False , orient_rotData_flag )

                if orient_mode == "tangent":
                    orientManager = match.orientManager()
                    orientManager.tangentOrientObject(orient_source , target , False , orient_rotData_flag  )

            # 사용자가 작성한 parent 연결 로직은 그대로 유지합니다.
            if parent:
                cmds.parent(target , parent)
            parent = target
        rootParent = self.build_plan.get("rootParent")
        if rootParent and cmds.objExists(rootParent):
            cmds.parent(root , rootParent)
        return self.build_plan


    #helper
    def _set_orientation_data(self, joint_data, mode, source=None,
                              maintainOffset=None, aimVector=None,
                              upVector=None, worldUpVector=None,
                              worldUpType=None, worldUpObject=None):
        '''
        orientation dictionary의 모든 값을 한 번에 교체합니다.

        같은 current_plan_data에서 aim을 정의한 뒤 orient로 변경하더라도
        이전 aimVector나 worldUpObject 값이 남지 않도록 하기 위한 helper입니다.
        '''
        orientation_data = joint_data["orientation"]
        orientation_data["mode"] = mode
        orientation_data["source"] = source
        orientation_data["maintainOffset"] = maintainOffset
        orientation_data["aimVector"] = aimVector
        orientation_data["upVector"] = upVector
        orientation_data["worldUpVector"] = worldUpVector
        orientation_data["worldUpType"] = worldUpType
        orientation_data["worldUpObject"] = worldUpObject


    def _validate_dag_object(self, item, method_name):
        '''문자열로 전달된 Maya DAG object가 실제로 존재하는지 검사합니다.'''
        if not isinstance(item, self.string_type):
            raise ValueError(
                u"{}: source는 문자열이어야 합니다.".format(method_name)
            )
        if not cmds.objExists(item) or not controlObject.isDag(item):
            raise ValueError(
                u"{}: {}는 존재하지 않거나 DAG object가 아닙니다.".format(
                    method_name,
                    item
                )
            )
        return item


    def _validate_curve(self, curve, method_name):
        '''
        입력값이 nurbsCurve shape이거나 nurbsCurve를 가진 transform인지 검사합니다.
        '''
        self._validate_dag_object(curve, method_name)

        if cmds.nodeType(curve) == "nurbsCurve":
            return curve

        shapes = cmds.listRelatives(
            curve,
            shapes=True,
            noIntermediate=True,
            fullPath=True
        ) or []

        for shape in shapes:
            if cmds.nodeType(shape) == "nurbsCurve":
                return curve

        raise ValueError(
            u"{}: {}는 nurbsCurve가 아닙니다.".format(method_name, curve)
        )


    def _validate_optional_name(self, name, method_name, argument_name):
        '''None 또는 node 이름으로 사용할 문자열인지 검사합니다.'''
        if name is not None and not isinstance(name, self.string_type):
            raise ValueError(
                u"{}: {}은 문자열 또는 None이어야 합니다.".format(
                    method_name,
                    argument_name
                )
            )
        return name


    def _validate_bool(self, value, method_name, argument_name):
        '''flag 값이 정확히 bool 형식인지 검사합니다.'''
        if not isinstance(value, bool):
            raise ValueError(
                u"{}: {}은 bool이어야 합니다.".format(
                    method_name,
                    argument_name
                )
            )
        return value


    def _validate_vector(self, vector, method_name, argument_name):
        '''3개의 숫자로 이루어진 vector를 검사하고 tuple로 반환합니다.'''
        checked_vector = self._check_vector(vector)
        if checked_vector is None:
            raise ValueError(
                u"{}: {}는 유효한 3D vector가 아닙니다: {}".format(
                    method_name,
                    argument_name,
                    vector
                )
            )
        return checked_vector


    def _validate_optional_vector(self, vector, method_name, argument_name):
        '''None은 허용하고, 값이 있으면 유효한 3D vector인지 검사합니다.'''
        if vector is None:
            return None
        return self._validate_vector(vector, method_name, argument_name)


    def _validate_world_up(self, worldUpType, worldUpObject, method_name):
        '''aim/tangent constraint에서 사용할 world-up 설정을 검사합니다.'''
        valid_types = ["scene", "object", "objectrotation", "vector", "none"]

        if worldUpType is not None and worldUpType not in valid_types:
            raise ValueError(
                u"{}: {}는 유효한 worldUpType이 아닙니다.".format(
                    method_name,
                    worldUpType
                )
            )

        if worldUpObject is not None:
            self._validate_dag_object(worldUpObject, method_name)

        if worldUpType in ["object", "objectrotation"]:
            if worldUpObject is None:
                raise ValueError(
                    u"{}: worldUpType이 {}이면 worldUpObject가 필요합니다.".format(
                        method_name,
                        worldUpType
                    )
                )


    def _validate_completed_plan_data(self, joint_data):
        '''
        작성이 끝난 task가 build_plan에 들어갈 수 있는 상태인지 검사합니다.

        _check_data는 dictionary 모양만 검사하고, 이 helper는 실제 mode별로
        필수 값이 입력되었는지를 검사합니다.
        '''
        if not self._check_data(joint_data):
            raise ValueError(
                u"add_current_plan_task: joint task의 데이터 형식이 올바르지 않습니다."
            )

        joint_name = joint_data.get("joint_name")
        group_name = joint_data.get("group_name")
        index = joint_data.get("index")
        position_data = joint_data["position"]
        orientation_data = joint_data["orientation"]
        node_name_data = joint_data["node_names"]

        if not isinstance(joint_name, self.string_type):
            raise ValueError(
                u"add_current_plan_task: joint_name이 정의되지 않았습니다."
            )
        self._validate_optional_name(group_name,
                                     "add_current_plan_task",
                                     "group_name")

        if not isinstance(index, self.integer_type) or isinstance(index, bool):
            raise ValueError(
                u"add_current_plan_task: index가 정수로 정의되지 않았습니다."
            )

        position_mode = position_data.get("mode")
        if position_mode not in ["point", "curve"]:
            raise ValueError(
                u"add_current_plan_task: position mode가 정의되지 않았습니다."
            )

        self._validate_bool(position_data.get("live"),
                            "add_current_plan_task",
                            "position.live")

        if position_mode == "point":
            self._validate_dag_object(position_data.get("source"),
                                      "add_current_plan_task")

        if position_mode == "curve":
            self._validate_curve(position_data.get("source"),
                                 "add_current_plan_task")
            parameter = position_data.get("parameter")
            if not isinstance(parameter, self.number_type) or isinstance(parameter, bool):
                raise ValueError(
                    u"add_current_plan_task: curve parameter가 숫자가 아닙니다."
                )
            if not isinstance(node_name_data.get("pocif"), self.string_type):
                raise ValueError(
                    u"add_current_plan_task: curve task에는 pocif 이름이 필요합니다."
                )

        self._validate_optional_name(node_name_data.get("pointMatrix"),
                                     "add_current_plan_task",
                                     "pointMatrix")

        orientation_mode = orientation_data.get("mode")
        valid_orientation_modes = ["orient", "aim", "tangent", "inherit", "none"]
        if orientation_mode not in valid_orientation_modes:
            raise ValueError(
                u"add_current_plan_task: orientation mode가 정의되지 않았습니다."
            )

        if orientation_mode in ["orient", "aim"]:
            self._validate_dag_object(orientation_data.get("source"),
                                      "add_current_plan_task")

        if orientation_mode == "tangent":
            self._validate_curve(orientation_data.get("source"),
                                 "add_current_plan_task")

        if orientation_mode in ["aim", "tangent"]:
            self._validate_vector(orientation_data.get("aimVector"),
                                  "add_current_plan_task",
                                  "orientation.aimVector")
            self._validate_vector(orientation_data.get("upVector"),
                                  "add_current_plan_task",
                                  "orientation.upVector")
            self._validate_optional_vector(
                orientation_data.get("worldUpVector"),
                "add_current_plan_task",
                "orientation.worldUpVector"
            )
            self._validate_world_up(
                orientation_data.get("worldUpType"),
                orientation_data.get("worldUpObject"),
                "add_current_plan_task"
            )


    def _resolve_plan_data(self, data=None):
        # 우선순위:
        # 1. 메서드에 직접 전달된 data
        # 2. 현재 작성 중인 current_plan_data
        # 3. joint_data_temp의 새로운 복사본

        joint_data = data

        if joint_data is None:
            joint_data = self.current_plan_data

        if joint_data is None:
            # 템플릿 원본이 수정되는 것을 막기 위해
            # 새로운 plan을 시작할 때만 deepcopy합니다.
            joint_data = copy.deepcopy(self.joint_data_temp)

        if not self._check_data(joint_data):
            raise ValueError(
                u"JointBuilder: data 형식이 올바르지 않습니다."
            )

        # 이후 define 메서드들이 data를 전달받지 않아도
        # 현재 작성 중인 plan을 계속 사용할 수 있게 합니다.
        self.current_plan_data = joint_data
        return joint_data

    def _check_vector(self, vec):
        if not isinstance(vec, (tuple, list)):
            return None
        if len(vec) != 3:
            return None
        if not all(isinstance(x, self.number_type) and not isinstance(x, bool) for x in vec):
            return None
        return tuple(vec)


    def _check_data(self, data):
        if not isinstance(data, dict):
            return False

        for key in self.check_task:
            if key not in data:
                return False

        position_data = data.get("position")
        orientation_data = data.get("orientation")
        node_name_data = data.get("node_names")

        # 내부 데이터도 반드시 dictionary인지 확인합니다.
        if not isinstance(position_data, dict):
            return False

        if not isinstance(orientation_data, dict):
            return False

        if not isinstance(node_name_data, dict):
            return False

        for key in self.check_position_task:
            if key not in position_data:
                return False

        for key in self.check_orientation_task:
            if key not in orientation_data:
                return False

        for key in self.check_nodeName_task:
            if key not in node_name_data:
                return False

        return True
        

class guideJointManager():
    def __init__(self,naming_rule , grp_name_rule):
        try:
            self.string_type = basestring
        except NameError:
            self.string_type = str

        try:
            self.integer_type = (int, long)
        except NameError:
            self.integer_type = (int,)
        self.number_type = self.integer_type + (float,)

        self.guide_data = None
        # 구조:
        # {
        #     "items": {...},
        #     "containers": {...},
        #     "invalid": [...]
        # }
        #
        # 아직 set_guide_data()를 호출하지 않았으므로 None으로 시작합니다.
        self.modules = {}

        # 전체 guide_data를 부위별로 분류한 결과를 저장합니다.
        #
        # key는 다음 세 metadata의 조합입니다.
        # (rig_module, rig_build, rig_side)
        #
        # 예:
        # {
        #     ("root_type", "A", "C"): {...},
        #     ("arm_type", "A", "L"): {...},
        #     ("arm_type", "A", "R"): {...}
        # }
        self.set_naming_rule(naming_rule)
        # key : "group1" , "group2" , ...
        self.group_naming_rule = self.set_group_naming_rule(grp_name_rule )


    def set_group_naming_rule(self ,grp_name_rule ):
        if not isinstance(grp_name_rule , dict):
            raise ValueError (u"set_group_naming_rule : grp_name_rule 는 dict 가 아닙니다.")
        pattern = r"^(?:group[0-9]+|system)$"
        item_pattern = r"\{item\}"
        for key ,string_data in grp_name_rule.items():
            key_search = re.search(pattern , key)
            if not key_search:
                raise ValueError (u"set_group_naming_rule : {} 는 적합한 key 가 아닙니다." .format(key))
            if not isinstance(string_data, self.string_type) or not re.search(item_pattern, string_data):
                raise ValueError (u"set_group_naming_rule : {} 규칙에 {{item}}이 없습니다." .format(key))
        return grp_name_rule
    def set_naming_rule(self, naming_rule):
        if not callable(getattr(naming_rule, "build", None)):
            raise TypeError(
                u"naming_rule에는 build() 메서드가 필요합니다."
            )

        self.naming_rule = naming_rule

    def build_name(self, **name_data):
        return self.naming_rule.build(**name_data)

    def set_guide_data(self , guide_data):
        if not isinstance(guide_data, dict):
            return False
        # 원본 전체 guide 데이터를 그대로 저장합니다.
        self.guide_data = guide_data
        # 원본 데이터를 부위별로 분류해서 self.modules에 저장합니다.
        self.modules = self.group_modules(guide_data)
        return True




    def build_leg(self, module_data, side_type=None, axis_data=None,
                  insert_alp=False, joint_num=None, root_parent=None):
        if not isinstance(module_data, dict):
            raise TypeError(u"build_leg : module_data는 dict여야 합니다.")

        module_key = module_data.get("key")
        if not isinstance(module_key, (tuple, list)) or not len(module_key) == 3:
            raise ValueError(u"build_leg : module_data에 유효한 key가 없습니다.")

        key_type, alp, side = module_key
        if not key_type == "leg_type":
            return

        side_type_map = {"L": "left", "R": "right"}
        module_side_type = side_type_map.get(side)
        if module_side_type is None:
            raise ValueError(
                u"build_leg : leg module의 side는 L 또는 R이어야 합니다: {}".format(side)
            )

        if side_type is None:
            side_type = module_side_type
        elif not side_type == module_side_type:
            raise ValueError(
                u"build_leg : module side({})와 side_type({})이 일치하지 않습니다.".format(
                    side, side_type
                )
            )

        if not isinstance(insert_alp, bool):
            raise TypeError(u"build_leg : insert_alp는 bool이어야 합니다.")

        if joint_num is not None:
            if not isinstance(joint_num, self.integer_type) or isinstance(joint_num, bool):
                raise TypeError(u"build_leg : joint_num은 int 또는 None이어야 합니다.")
            if joint_num < 0:
                raise ValueError(u"build_leg : joint_num은 0 이상이어야 합니다.")

        name_alp = alp if insert_alp else ""

        hip_item_path = self._find_one(module_data, "main", "loc", "hip")
        knee_item_path = self._find_one(module_data, "main", "loc", "knee")
        ankle_item_path = self._find_one(module_data, "main", "loc", "ankle")

        rig_type = hip_item_path.get("rig_type")
        if rig_type not in ["biped", "quad"]:
            raise ValueError(
                u"build_leg : 지원하지 않는 rig_type입니다: {}".format(rig_type)
            )

        hip_curve_path = self._find_one(module_data, "main", "curveShape", "hip")
        knee_curve_path = self._find_one(module_data, "main", "curveShape", "knee")

        hip_item_node = hip_item_path.get("node")
        knee_item_node = knee_item_path.get("node")
        ankle_item_node = ankle_item_path.get("node")
        hip_curve = hip_curve_path.get("node")
        knee_curve = knee_curve_path.get("node")

        hip_insert_count = self._resolve_insert_count(hip_item_node, joint_num)
        knee_insert_count = self._resolve_insert_count(knee_item_node, joint_num)
        hip_joint_count = hip_insert_count + 4
        knee_joint_count = knee_insert_count + 4

        if rig_type == "biped":
            toe_item_path = self._find_one(module_data, "main", "loc", "toe")
            toe_end_item_path = self._find_one(module_data, "main", "loc", "toeEnd")
            aim_vector_path = self._find_one(module_data, "main", "aimVector", "hip")

            toe_item_node = toe_item_path.get("node")
            toe_end_item_node = toe_end_item_path.get("node")
            aim_vector = aim_vector_path.get("node")

            segment_data = [
                {"part": "hip", "end_part": "knee",
                 "start": hip_item_node, "end": knee_item_node,
                 "curve": hip_curve, "insert_count": hip_insert_count,
                 "joint_count": hip_joint_count},
                {"part": "knee", "end_part": "ankle",
                 "start": knee_item_node, "end": ankle_item_node,
                 "curve": knee_curve, "insert_count": knee_insert_count,
                 "joint_count": knee_joint_count}
            ]
            point_orient_data = [
                {"part": "toe", "node": toe_item_node},
                {"part": "toeEnd", "node": toe_end_item_node}
            ]
        else:
            ankle_curve_path = self._find_one(
                module_data, "main", "curveShape", "ankle"
            )
            toe_root_item_path = self._find_one(module_data, "main", "loc", "toeRoot")
            toe_item_path = self._find_one(module_data, "main", "loc", "toe1")
            toe_end_item_path = self._find_one(module_data, "main", "loc", "toe2")
            aim_vector_path = self._find_one(module_data, "main", "aimVector", "leg")

            ankle_curve = ankle_curve_path.get("node")
            toe_root_item_node = toe_root_item_path.get("node")
            toe_item_node = toe_item_path.get("node")
            toe_end_item_node = toe_end_item_path.get("node")
            aim_vector = aim_vector_path.get("node")
            ankle_insert_count = self._resolve_insert_count(
                ankle_item_node, joint_num
            )
            ankle_joint_count = ankle_insert_count + 4

            segment_data = [
                {"part": "hip", "end_part": "knee",
                 "start": hip_item_node, "end": knee_item_node,
                 "curve": hip_curve, "insert_count": hip_insert_count,
                 "joint_count": hip_joint_count},
                {"part": "knee", "end_part": "ankle",
                 "start": knee_item_node, "end": ankle_item_node,
                 "curve": knee_curve, "insert_count": knee_insert_count,
                 "joint_count": knee_joint_count},
                {"part": "ankle", "end_part": "toeRoot",
                 "start": ankle_item_node,
                 "end": toe_root_item_node, "curve": ankle_curve,
                 "insert_count": ankle_insert_count,
                 "joint_count": ankle_joint_count}
            ]
            point_orient_data = [
                {"part": "toe1", "node": toe_item_node},
                {"part": "toe2", "node": toe_end_item_node}
            ]

        if side_type == "left":
            aim_data = {
                "aim": (0, 1, 0),
                "u": (0, 0, 1),
                "wu": (0, 0, 1)
            }
        else:
            aim_data = {
                "aim": (0, -1, 0),
                "u": (0, 0, -1),
                "wu": (0, 0, -1)
            }

        if axis_data is not None:
            self._check_aim_data(axis_data)
            aim_data = axis_data

        leg_joint_builder = JointBuilder()
        build_index = 0

        for segment_index, segment in enumerate(segment_data):
            part = segment["part"]
            end_part = segment["end_part"]
            curve = segment["curve"]
            end_node = segment["end"]
            insert_count = segment["insert_count"]

            curve_joint_data = []
            if segment_index == 0:
                curve_joint_data.append({
                    "item_name": part,
                    "num": "",
                    "parameter": 0.0,
                    "orient_node": None
                })

            curve_joint_data.append({
                "item_name": "{}_seg".format(part),
                "num": "1",
                "parameter": 0.01,
                "orient_node": None
            })

            for insert_index in range(insert_count):
                insert_parameter = float(insert_index + 1) / (insert_count + 1)
                curve_joint_data.append({
                    "item_name": part,
                    "num": str(insert_index + 1).zfill(2),
                    "parameter": insert_parameter,
                    "orient_node": None
                })

            curve_joint_data.append({
                "item_name": "{}_seg".format(part),
                "num": "2",
                "parameter": 0.99,
                "orient_node": None
            })
            curve_joint_data.append({
                "item_name": end_part,
                "num": "",
                "parameter": 1.0,
                "orient_node": end_node
            })

            for joint_data in curve_joint_data:
                item_name = joint_data["item_name"]
                number = joint_data["num"]
                parameter = joint_data["parameter"]
                orient_node = joint_data["orient_node"]

                joint_name = self.build_name(
                    item_name=item_name,
                    side=side_type,
                    extra_side="",
                    alp=name_alp,
                    num=number,
                    rule="",
                    obj_type="joint"
                )
                group_name = self.group_naming_rule["group1"].format(
                    item=joint_name
                )
                pocif_name = self.build_name(
                    item_name=item_name,
                    side=side_type,
                    extra_side="",
                    alp=name_alp,
                    num=number,
                    rule="",
                    obj_type="pointOnCurveInfo"
                )
                point_matrix_name = self.build_name(
                    item_name=item_name,
                    side=side_type,
                    extra_side="",
                    alp=name_alp,
                    num=number,
                    rule="",
                    obj_type="pointMatrixMult"
                )

                leg_joint_builder.define_joint_planData(joint_name, group_name)
                leg_joint_builder.define_pointOnCurve_planData(
                    curve,
                    parameter,
                    pocif_name,
                    point_matrix_name
                )

                if orient_node is None:
                    leg_joint_builder.define_tangent_planData(
                        curve,
                        aim_data["aim"],
                        aim_data["u"],
                        aim_data["wu"],
                        aim_vector,
                        "objectrotation"
                    )
                else:
                    leg_joint_builder.define_orient_planData(orient_node)

                leg_joint_builder.define_index_planData(build_index)
                leg_joint_builder.add_current_plan_task()
                build_index += 1

        for point_data in point_orient_data:
            part = point_data["part"]
            point_node = point_data["node"]

            joint_name = self.build_name(
                item_name=part,
                side=side_type,
                extra_side="",
                alp=name_alp,
                num="",
                rule="",
                obj_type="joint"
            )
            group_name = self.group_naming_rule["group1"].format(
                item=joint_name
            )
            point_matrix_name = self.build_name(
                item_name=part,
                side=side_type,
                extra_side="",
                alp=name_alp,
                num="",
                rule="",
                obj_type="pointMatrixMult"
            )

            leg_joint_builder.define_joint_planData(joint_name, group_name)
            leg_joint_builder.define_point_planData(
                point_node,
                point_matrix_name
            )
            leg_joint_builder.define_orient_planData(point_node)
            leg_joint_builder.define_index_planData(build_index)
            leg_joint_builder.add_current_plan_task()
            build_index += 1

        if root_parent is None:
            root_parent = self.build_name(
                item_name="root",
                side="center",
                extra_side="",
                alp="",
                num="",
                rule="",
                obj_type="joint"
            )

        leg_joint_builder.define_rootParent(root_parent)
        return leg_joint_builder.build(0.75)

    def build_root(self, module_data, axis_data = None, joint_num=None):
        if not isinstance(module_data, dict):
            raise TypeError(u"build_root : module_data는 dict여야 합니다.")

        module_key = module_data.get("key")
        if not isinstance(module_key, (tuple, list)) or not len(module_key) == 3:
            raise ValueError(u"build_root : module_data에 유효한 key가 없습니다.")

        key_type , alp , side = module_key
        if not key_type == "root_type":
            return

        root_item_path = self._find_one(module_data, "main", "loc", "root")
        chest_item_path = self._find_one(module_data, "main", "loc", "chest")
        root_curve_path = self._find_one(module_data, "main", "curveShape", "root")
        aim_vector_path = self._find_one(module_data, "main", "aimVector", "root")

        root_item_node = root_item_path.get("node")
        chest_item_node = chest_item_path.get("node")
        root_curve = root_curve_path.get("node")
        aim_vector = aim_vector_path.get("node")
        rig_type = root_item_path.get("rig_type")
        if isinstance(joint_num, self.integer_type) and not isinstance(joint_num, bool):
            joint_count = joint_num
        elif cmds.objExists(root_item_node + ".insertJnt"):
            joint_count = int(cmds.getAttr(root_item_node + ".insertJnt")) + 2
        else:
            return

        if joint_count < 2:
            raise ValueError(u"build_root : joint_num은 2 이상이어야 합니다.")

        aim_data = {}

        if rig_type == "biped":
            aim_data = {"aim" : (0,1,0) , "u" : (0,0,1) , "wu" : (0,0,1) }
        elif rig_type == "quad":
            aim_data = {"aim" : (0,0,1) , "u" : (0,1,0) , "wu" : (0,1,0) }
        elif axis_data is None:
            raise ValueError(u"build_root : rig_type에 맞는 기본 axis data가 없습니다: {}".format(rig_type))

        if axis_data is not None:
            self._check_aim_data(axis_data)
            aim_data = axis_data

        rootJoint_builder = JointBuilder()

        div = 1.0/(joint_count-1)
        item_name_dict = {}
        for index in range(joint_count):
            if index == 0 :
                name_item = "root"
            elif index == joint_count-1:
                name_item = "chest"
            else:
                name_item = "spine"
            item_name_dict[index] = name_item

        for index in range(joint_count):
            count_string = str(index).zfill(2)
            if index == 0 :
                count_string = ""
            if index == joint_count-1:
                count_string = ""
            joint_name = self.build_name(item_name = item_name_dict[index] , side = "center" , extra_side = ""  , alp = "" , rule = "" ,obj_type="joint" , num =count_string )
            group_name = self.group_naming_rule["group1"].format(item = joint_name)
            pocif_name = self.build_name(item_name = item_name_dict[index] , side = "center" , extra_side = ""  , alp = "" , rule = "" ,obj_type="pointOnCurveInfo" , num =count_string )
            pointMM_name = self.build_name(item_name = item_name_dict[index] , side = "center" , extra_side = ""  , alp = "" , rule = "" ,obj_type="pointMatrixMult" , num =count_string )

            parameter = div * index
            rootJoint_builder.define_joint_planData(joint_name , group_name)
            rootJoint_builder.define_pointOnCurve_planData(root_curve ,parameter , pocif_name , pointMM_name )

            if index == joint_count-1:
                rootJoint_builder.define_orient_planData(chest_item_node )
            else:
                rootJoint_builder.define_tangent_planData(root_curve ,aim_data["aim"] , aim_data["u"] , aim_data["wu"],  aim_vector , "objectrotation" )
            rootJoint_builder.define_index_planData(index)
            rootJoint_builder.add_current_plan_task()
        return rootJoint_builder.build(0.75)






    #__data_helper

    def _resolve_insert_count(self, item_node, joint_num=None):
        if joint_num is not None:
            return joint_num

        insert_attr = "{}.insertJnt".format(item_node)
        if cmds.objExists(insert_attr):
            return int(cmds.getAttr(insert_attr))

        return 0

    def _check_aim_data(self, data):
        if not isinstance(data , dict):
            raise ValueError(u"check_aim_data : data 는 constraint dict 가 아닙니다." )

        required_keys = set(["aim", "u", "wu"])
        if not set(data.keys()) == required_keys:
            raise ValueError(
                u"check_aim_data : aim, u, wu key가 정확히 필요합니다: {}".format(
                    sorted(data.keys())
                )
            )

        for key , value in data.items():
            self._validate_vector(value ,"_check_aim_data"  , key )
        return True

    def _validate_vector(self, vector, method_name, argument_name):
        '''3개의 숫자로 이루어진 vector를 검사하고 tuple로 반환합니다.'''
        checked_vector = self._check_vector(vector)
        if checked_vector is None:
            raise ValueError(
                u"{}: {}는 유효한 3D vector가 아닙니다: {}".format(
                    method_name,
                    argument_name,
                    vector
                )
            )
        return checked_vector


    def _check_vector(self, vec):
        if not isinstance(vec, (tuple, list)):
            return None
        if not len(vec) == 3:
            return None
        if not all(isinstance(x, self.number_type) and not isinstance(x, bool) for x in vec):
            return None
        return tuple(vec)

    def _get_sorted_locs(self ,module_data, rig_role="main"):
        """
        module_data에서 locator 데이터를 찾아
        rig_index 순서로 정렬해서 반환합니다.

        주로 arm, leg처럼 한 방향으로 이어지는
        linear chain을 처리할 때 사용합니다.
        """
        loc_items = self._find_items(
                                        module_data,
                                        rig_role=rig_role,
                                        rig_data="loc"
                                    )

        indexed_locs = []

        for detail in loc_items:
            rig_index = detail.get("rig_index")

            # bool은 int로 변환할 수 있지만
            # 정상적인 rig_index 값이 아니므로 제외합니다.
            if isinstance(rig_index, bool):
                raise ValueError(u"locator의 rig_index가 bool입니다: {}".format( detail.get("node") )  )

            try:
                # guide metadata에서 읽은 "0", "1"과 같은
                # 문자열 index를 정렬용 정수로 변환합니다.
                numeric_index = int(rig_index)
            except (TypeError, ValueError):
                raise ValueError(
                    u"locator의 rig_index를 숫자로 변환할 수 없습니다: "
                    u"node={}, rig_index={}".format(
                        detail.get("node"),
                        rig_index
                    )
                )

            # 원본 detail의 rig_index는 변경하지 않고,
            # 숫자로 변환한 index를 정렬에만 사용합니다.
            indexed_locs.append((numeric_index, detail))

        indexed_locs.sort(key=lambda item: item[0])
        return [item[1] for item in indexed_locs]


    def _find_one(self , module_data , rig_role=None,rig_data=None,rig_part=None  ):
        """
        조건에 맞는 guide detail을 정확히 하나만 찾아 반환합니다.

        검색 결과가 없거나 여러 개라면
        정상적인 module 데이터가 아니므로 ValueError를 발생시킵니다.
        """
        found_items = self._find_items(
                            module_data,
                            rig_role=rig_role,
                            rig_data=rig_data,
                            rig_part=rig_part
                        )
        # 조건에 맞는 데이터가 하나도 없는 경우입니다.
        if len(found_items) == 0:
            raise ValueError(
                u"guide 데이터를 찾을 수 없습니다. "
                u"role={}, data={}, part={}".format(
                    rig_role,
                    rig_data,
                    rig_part
                )
            )
        if len(found_items) > 1:
            raise ValueError(
                u"guide 데이터가 중복되었습니다. "
                u"role={}, data={}, part={}, count={}".format(
                    rig_role,
                    rig_data,
                    rig_part,
                    len(found_items)
                )
        )
        return found_items[0]


    def _find_items(self , module_data , rig_role=None,rig_data=None,rig_part=None  ):
        """
        module_data의 items에서 조건에 맞는 guide detail을 찾습니다.

        조건을 None으로 전달하면 해당 조건은 검사하지 않습니다.

        예:
            rig_data="loc"
            → 모든 locator 검색

            rig_data="curveShape", rig_part="shoulder"
            → shoulder curve 검색
        """
        result = []
        if not isinstance(module_data, dict):
            return result
        # module_data 안에서 일반 guide 데이터 get
        #
        # module_data 구조:
        # {
        #     "items": {...},
        #     "containers": {...}
        # }
        items = module_data.get("items", {})
        if not isinstance(items, dict):
            return result
        
        # guide_id:
        #     "arm_type:A:L:main:loc:shoulder"
        # detail:
        #     {
        #         "node": "guide_biped:L_shoulder_loc",
        #         "rig_module": "arm_type",
        #         "rig_build": "A",
        #         "rig_side": "L",
        #         ...
        #     }
        for guide_id, detail in items.items():
            if not isinstance(detail, dict):
                continue

            # rig_role/data/part 감별
            if rig_role is not None:
                if not detail.get("rig_role") == rig_role:
                    continue
            if rig_data is not None:
                if not detail.get("rig_data") == rig_data:
                    continue
            if rig_part is not None:
                if not detail.get("rig_part") == rig_part:
                    continue
            result.append(detail)
        return result


    def group_modules(self , guide_data):
        modules = {}

        for section_name in ["items", "containers"]:
            # "items", "containers" 있는지
            section_data = guide_data.get(section_name, {})
            # section_data = guide_data.get("items") = {...}
            # section_data = guide_data.get("containers") = {...}

            if not isinstance(section_data, dict):
                continue

            # guide_id:
            #     "arm_type:A:L:main:loc:shoulder"
            # detail:
            #     {
            #         "node": "guide_biped:L_shoulder_loc",
            #         "rig_module": "arm_type",
            #         "rig_build": "A",
            #         "rig_side": "L",
            #         ...
            #     }
            for guide_id, detail in section_data.items():
                if not isinstance(detail, dict):
                    continue

                # ("arm_type", "A", "L")
                # if ("arm_type", "A", "L") not in modules:
                module_key = (
                    detail.get("rig_module"),
                    detail.get("rig_build"),
                    detail.get("rig_side")
                )

                # module 구분에 필요한 값이 하나라도 없으면 제외
                if not all(module_key):
                    continue
                # ("arm_type", "A", "L")
                # "key": module_key 편의용

                if not module_key in modules:
                    modules[module_key] = {
                        "key": module_key,
                        "items": {},
                        "containers": {}
                        }
                # modules[module_key]["containers"][guide_id] = detail
                modules[module_key][section_name][guide_id] = detail
        return modules
