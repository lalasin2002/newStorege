# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om
import  os,copy ,json


from autoRig_config import AUTO_RIG_ROOT, GUIDE_RIGS_PATH
from tools import controlAttribute , controlObject , naming , createObject , match

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

            "pos": None,
            "rot": None,
            "scale": None,
            "matrix": None,
        }

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

        #self.data = None
        self.naming_rule = None
        self.build_plan = {"joints" : {},
                           "curve" : None,
                           "vectorPoint" : None,
                           "aimData" : None,
                           "rootParent"  : None,
                           }
        self.return_data = {"joints" : {} ,
                            "curve" : None,
                            "rootParent"  : None
                            }
        


    #def define_guide_data(self , date):
    #    if not isinstance(date , dict):
    #        return
        
    def set_curve(self, curve):
        if not isinstance(curve , self.string_type):
            return
        if not cmds.objectType(curve) == "nurbsCurve":
            return
        self.build_plan["curve"] = curve

    def set_aimData(self , aim  , upVector , wouldVector = None):
        aim = self._check_vector(aim)
        upVector = self._check_vector(upVector)
        wouldVector = self._check_vector(wouldVector)

        if not aim:
            return
        if not upVector:
            return

        data = { "aim" : aim , "u" : upVector , "wu" : wouldVector}
        self.build_plan["aimData"] = data



    def set_joint_data(self , jointName , parameter , grpName = None ,pocifNodeName = None, index = None):
        
        if not isinstance(jointName, self.string_type):
            return
        if not isinstance(parameter, (int, float)) or isinstance(parameter, bool):
            return
        if grpName and not isinstance(grpName, self.string_type):
            return
        if pocifNodeName and not isinstance(pocifNodeName, self.string_type):
            return


        count = 0

        if index is None:
            max = len(self.build_plan["joints"])
            count = max +1
        if isinstance(index , int):
            if index in self.build_plan["joints"]:
                self.build_plan["joints"][index] = {} 
            count = index 


        joint_data = { "name"      : jointName  , 
                       "parameter" : parameter  ,
                       "jointGrp"  : grpName    ,
                       "pocifNode" : pocifNodeName
                      }
        self.build_plan["joints"][count] = joint_data 

    def set_orientatinVector(self ,vectorName ):
        if not isinstance(vectorName, self.string_type):
            return
        if not cmds.objExists(vectorName):
            return
        self.build_plan["vectorPoint"] = vectorName 
    
    def set_rootParent(self , item ):
        if not isinstance( item , self.string_type):
            return
        if not cmds.objExists( item ):
            return
        self.build_plan["rootParent"] = item  
        
    def build(self ):
        curve = self.build_plan.get("curve")
        joints = self.build_plan.get("joints")
        vector = self.build_plan.get("vectorPoint")
        aimData = self.build_plan.get("aimData")
        rootParent = self.build_plan.get("rootParent")
        if not aimData:
            return
        if curve is None or not cmds.objExists(curve):
            return
        if not  len(joints) > 0 :
            return
        curve_tranform = cmds.listRelatives(curve , p =1)[0]
        cvs = cmds.ls("{}.cv[*]".format(curve_tranform) ,fl=1 )

        first_xform = cmds.xform(cvs[0] , ws =1 , q= 1, t =1 )
        last_xform = cmds.xform(cvs[-1] , ws =1 , q= 1, t =1 )

        jntBulider = createObject.jointCreater()
        orientManager = match.orientManager()
        tangent_flag = orientManager.makeOrientFlag(self.build_plan["aimData"]["aim"] , self.build_plan["aimData"]["u"] ,self.build_plan["aimData"]["wu"],vector)
        jntBulider.setStartEndVector(first_xform , last_xform)
        parent = None
        #joint_data = {"name" : None , "group" : None , "pocif" : None }
        self.return_data["curve"] = curve
        self.return_data["rootParent"] = rootParent
        
        for index in sorted(self.build_plan["joints"]):
            data = self.build_plan["joints"][index]
            param =  data.get("parameter")
            joint_name = data.get("name")
            joint_group_name = data.get("jointGrp" )
            pocifNode = None
            pocif_name = data.get("pocifNode" )
            
            target = None

            Jnt, JntGrp = jntBulider.createJointByParam(param ,joint_name ,joint_group_name ,parent  )
            target = Jnt
            if JntGrp:
                target = JntGrp

            if parent is None:
                parent = target

            if pocif_name:
                cntData = []
                for ax in "XYZ":
                    task = ("position{}" .format( ax) , "{}.translate{}" .format(target ,ax) )
                    cntData.append(task )
                pocifNode = createObject.createPocif( pocif_name , curve , param , True , cntData)
            orientManager.tangentOrientObject(curve , target , False , tangent_flag)

            joint_data = {
                "name": Jnt,
                "group": JntGrp,
                "pocif": pocifNode
            }
            self.return_data["joints"][index] = joint_data

            
            
    # helper
    def _check_vector(self, vec):
        if not isinstance(vec, (tuple, list)):
            return None
        if len(vec) != 3:
            return None
        if not all(isinstance(x, (int, float)) and not isinstance(x, bool) for x in vec):
            return None
        return tuple(vec)




class guideJointManager():
    def __init__(self):
        pass





