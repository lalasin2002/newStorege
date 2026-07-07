# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om
import  os,copy ,json


from autoRig_config import AUTO_RIG_ROOT, GUIDE_RIGS_PATH
from tools import controlAttribute , controlObject , naming

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
        try:
            self.string_type = basestring
        except NameError:
            self.string_type =  str
        
        self.standard_templete = {}
        self.standard_detail_templete = {}

        self.requiredAttrs = [
                        "rig_type",
                        "rig_module",
                        "rig_side",
                        "rig_role",
                        "rig_data",
                        "rig_part",
                    ]
        self.optionalAttrs = [
                        "rig_build",
                        "rig_index",
                        "rig_attachTarget",
                    ]
        #base_id = "{rig_module}:{rig_build}:{rig_side}:{rig_role}:{rig_data}:{rig_part}"

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
        finalDict = {
            "items": {},
            "containers": {},
            "invalid": []
        }

        rig_build = chr(65 + buildIndex)

        for item in items:
            metaData = self._getMetaData(item, self.checkPoints)

            if not metaData:
                continue
            if not any(metaData.get(attr) for attr in self.checkPoints):
                continue

            missing = [attr for attr in self.requiredAttrs if not metaData.get(attr)]
            if missing:
                finalDict["invalid"].append({
                    "node": item,
                    "reason": "missing required attrs",
                    "missing": missing
                })
                continue

            if not metaData.get("rig_build"):
                metaData["rig_build"] = rig_build

            detail = self._makeDetailData(item, metaData)
            guideId = detail.get("id")

            if self._isContainerData(metaData):
                targetDict = finalDict["containers"]
            else:
                targetDict = finalDict["items"]

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



    #__helper
    def _makeGuideId(self, metaData):
        return "{}:{}:{}:{}:{}:{}".format(
            metaData.get("rig_module", ""),
            metaData.get("rig_build", ""),
            metaData.get("rig_side", ""),
            metaData.get("rig_role", ""),
            metaData.get("rig_data", ""),
            metaData.get("rig_part", "")
        )
    def _isContainerData(self, metaData):
        if metaData.get("rig_role") == "container":
            return True

        if metaData.get("rig_data") == "group":
            return True

        return False

    def _makeDetailData(self, item, metaData):
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






class guideJointBuilder():
    def __init__(self):
        self.data = None

    
        




















#___debug___
'''

leg_path = os.path.abspath(r"D:\Code\MayaCode\autoRig\guide_rigs\guide_biped_leg.ma") 
arm_path = os.path.abspath(r"D:\Code\MayaCode\autoRig\guide_rigs\guide_biped_arm.ma") 
chest_path = os.path.abspath(r"D:\Code\MayaCode\autoRig\guide_rigs\guide_biped_chest.ma") 
hand_path = os.path.abspath(r"D:\Code\MayaCode\autoRig\guide_rigs\guide_biped_hand.ma")
head_path = os.path.abspath(r"D:\Code\MayaCode\autoRig\guide_rigs\guide_biped_head.ma")

total_data = {}

guide = guideDataManager()
chest_ref = guide.importGuide(chest_path , "guide")
leg_ref = guide.importGuide(leg_path , "guide")
arm_ref = guide.importGuide(arm_path , "guide")
hand_ref = guide.importGuide(hand_path , "guide")
head_ref = guide.importGuide(head_path , "guide")



chest_objs = guide.getReferenceObjects(chest_ref)
leg_objs = guide.getReferenceObjects(leg_ref)
arm_objs = guide.getReferenceObjects(arm_ref)
hand_objs = guide.getReferenceObjects(hand_ref)
head_objs = guide.getReferenceObjects(head_ref)

chest_data = guide.setDefineData(chest_objs)
leg_data = guide.setDefineData(leg_objs)
arm_data = guide.setDefineData(arm_objs)
hand_data = guide.setDefineData(hand_objs)
head_data = guide.setDefineData(head_objs)

total_data = {}
total_data.update(chest_data)
total_data.update(leg_data)
total_data.update(arm_data)
total_data.update(hand_data)
total_data.update(head_data)

debug_temp_path = r"D:\Code\MayaCode\autoRig\guide_rigs\temp.json"
debug_temp_path = os.path.abspath(debug_temp_path)

with open(debug_temp_path , "w" ) as f:
    json.dump(total_data ,f , indent=4)



guideCombineManager = guideCombine()

chestPoints = total_data["chest"]["A"]["C"]["main"]["loc"]

armPoints = total_data["arm"]["A"]
legPoints = total_data["leg"]["A"]
handPoints = total_data["hand"]["A"]
headPoints = total_data["head"]["A"]


total_mirrors =[ x.get("name") for x in findKeyValues(total_data , "mirrorRoot")]
total_nonParent =[ x.get("name") for x in findKeyValues(total_data ,"nonParent")] 

pprint.pprint(total_mirrors)


guideCombineManager.createTotalGroup()

guideCombineManager.setRootPoint(chestPoints["root"]["name"])
guideCombineManager.setChestPoint(chestPoints["chest"]["name"])
guideCombineManager.setHeadPoint(chestPoints["neckEnd"]["name"])
guideCombineManager.setLeftHandPoint(armPoints["L"]["main"]["loc"]["wrist"]["name"])
guideCombineManager.setRightHandPoint(armPoints["R"]["main"]["loc"]["wrist"]["name"])

guideCombineManager.setCombineRoot(legPoints["L"]["mirrorRoot"]["name"])
guideCombineManager.setCombineRoot(legPoints["R"]["mirrorRoot"]["name"])
guideCombineManager.setCombineChest(armPoints["L"]["mirrorRoot"]["name"])
guideCombineManager.setCombineChest(armPoints["R"]["mirrorRoot"]["name"])
guideCombineManager.setCombineLeftHand(handPoints["L"]["mirrorRoot"]["name"])
guideCombineManager.setCombineRightHand(handPoints["R"]["mirrorRoot"]["name"])
guideCombineManager.setCombineHead(headPoints["C"]["mirrorRoot"]["name"])




for item in total_mirrors:
    guideCombineManager.parentRigGroup(item)
for item in total_nonParent:
    guideCombineManager.parentNonParentGroup(item)

'''