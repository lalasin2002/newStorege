# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om
import  os,copy ,json


from autoRig_config import AUTO_RIG_ROOT, GUIDE_RIGS_PATH
from tools import controlAttribute , controlObject

#--------------------------------------------------------------------------

#rootPoint : space
#["rig_type" , "rig_part" , "rig_role" , "rig_data" , "rig_boneType" , "rig_index"]


def guideDetailTemplate():
    templateDetail = {
        "name": None,
        "pos": None,
        "index": 0,
        "rig_boneType": None,
        "side": None,
    }
    return templateDetail




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

        self.checkPoints = ["rig_side" ,"rig_type" , "rig_part" , "rig_role" , "rig_data" , "rig_boneType" , "rig_index"]

        self.dataRules = {
            #"rig_boneType" : ["{rig_boneType}", "{alp}", "{rig_side}", "rig_boneType"],
            "rootPoint": ["{rig_boneType}", "{alp}", "{rig_side}", "rootPoint"],
            "nonParent": ["{rig_boneType}", "{alp}", "{rig_side}", "nonParent"],
            "mirrorRoot": ["{rig_boneType}", "{alp}", "{rig_side}", "mirrorRoot"],
            "default": ["{rig_boneType}", "{alp}", "{rig_side}", "{rig_role}", "{rig_data}", "{rig_part}"]
        }


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



    def setDefineData(self, items, buildIndex=0, buildAlp="A"):
        '''
        입력된 아이템 리스트를 순회하며 메타데이터를 추출하고, 
        dataRules에 따라 분류된 다중 중첩 딕셔너리 구조(최종 데이터 트리)를 생성합니다.

        Args:
            items (list of str): 분석할 가이드 오브젝트 리스트.
            buildIndex (int, optional): 현재 빌드 인덱스. 기본값 0.
            buildAlp (str, optional): 현재 빌드 알파벳. 기본값 "A".

        Returns:
            dict: 조건에 맞게 분류되고 구조화된 최종 메타데이터 딕셔너리.
        '''
        finalDict = {}

        for item in items:
            metaData = self._getMetaData(item, self.checkPoints)

            if not metaData:
                continue

            if not all(metaData.get(key) for key in ["rig_type", "rig_side", "rig_part", "rig_boneType"]):
                continue

            metaData["buildIndex"] = buildIndex
            metaData["alp"] = buildAlp

            side = metaData.get("rig_side")
            alp = metaData.get("alp")
            rig_type = metaData.get("rig_type")
            rig_boneType = metaData.get("rig_boneType")

            # 필수 data path 데이터 방어
            if not rig_boneType:
                continue

            if not alp:
                continue

            if not side:
                continue

            #1단계 : boneType -> alp 까지만 먼저 생성
            if rig_boneType not in finalDict:
                finalDict[rig_boneType] = {}


            #2단계 : finalDict[rig_boneType] 이후 alp key가 없으면 alp 입력
            ''' 예시 자료
            "chest": {
                    "A": {
                        "rigType": "biped",
                        "buildIndex": 0,
                        "alp": "A",
                        "rig_boneType": "chest",
            
            '''
            if alp not in finalDict[rig_boneType]:
                finalDict[rig_boneType][alp] = {
                    "rigType": rig_type,
                    "buildIndex": buildIndex,
                    "alp": alp,
                    "rig_boneType": rig_boneType
                }

            path_middle_keys = self._getPathMiddleKey(metaData)
            detail_data = self._makeDetailData(item, metaData)

            current = finalDict

            # path_middle_keys[:-1]하는 이유 : 
            # 마지막 key는 detail_data가 들어갈 저장 이름이므로,
            # 마지막 key를 제외한 중간 경로만 먼저 dict로 생성한다.
            # finalDict["leg"]["A"]["L"]["main"]["loc"]["knee"] = detail_data 최종적으로 이걸 만들기 위함
            # 
            for key in path_middle_keys[:-1]: 
                # finalDict["leg"] => finalDict["leg"]["A"] => finalDict["leg"]["A"]["L"] => ...["loc"] + detail_data 까지
                if key not in current:
                    current[key] = {}
                current = current[key]

            # finalDict["leg"]...["loc"]["knee"]
            last_key = path_middle_keys[-1]
            # finalDict["leg"]...["loc"]["knee"] = detail_data
            current[last_key] = detail_data

        return finalDict



    #__helper
    def _makeDetailData(self ,item , metaData):
        '''
        (내부 헬퍼) 단일 오브젝트에 대한 디테일 정보를 템플릿 딕셔너리에 매핑하여 반환합니다.

        Args:
            item (str): 오브젝트 이름.
            metaData (dict): 추출된 메타데이터 딕셔너리.

        Returns:
            dict: 채워진 디테일 딕셔너리.
        '''
        detail = guideDetailTemplate()
        detail["name"] = item
        #임시 비활성화
        
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
            
        
        detail["index"] = metaData.get("rig_index")
        detail["rig_boneType"] = metaData.get("rig_boneType")
        detail["side"] = metaData.get("rig_side")
            
        return detail


    def _getPathMiddleKey(self, metaData):
        '''
        (내부 헬퍼) 오브젝트에서 특정 속성(checkPoints)들의 값을 모두 가져와 딕셔너리로 만듭니다.

        Args:
            item (str): 오브젝트 이름.
            checkPoints (list): 조회할 속성 리스트.

        Returns:
            dict: {속성이름: 속성값} 형태의 딕셔너리.
        '''
        path_keys = []
        # "rig_part" : 부위가 어디인지)
        part = metaData.get("rig_part")

        if part == "rootPoint":
            ruleList = self.dataRules["rootPoint"] # ["{rig_boneType}", "{alp}", "{rig_side}", "rootPoint"],
        elif part == "nonParent":
            ruleList = self.dataRules["nonParent"] # ["{rig_boneType}", "{alp}", "{rig_side}", "nonParent"],
        elif part == "mirrorRoot":
            ruleList = self.dataRules["mirrorRoot"]
        #elif part == "rig_boneType":
        #    ruleList = self.dataRules["rig_boneType"]
        else:
            ruleList = self.dataRules["default"] # ["{rig_boneType}", "{alp}", "{rig_side}", "{rig_role}", "{rig_data}", "{rig_part}"]

        path_keys = [ rule.format(**metaData) for rule in ruleList ] #포매팅

        ## ex) path_keys = [ "arm" , "A" , "L", "main", "loc", "shoulder"]
        ##          rule 은 "{rig_boneType}", "{alp}", "{rig_side}", "{rig_role}", "{rig_data}", "{rig_part}"

        return path_keys

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


    def _getAttrData(self , item , checkitem ):
        '''
        (내부 헬퍼) 오브젝트의 특정 속성 하나를 안전하게 조회합니다.

        Args:
            item (str): 오브젝트 이름.
            checkitem (str): 속성 이름.

        Returns:
            any or None: 조회된 속성값. 존재하지 않으면 None.
        '''
        objAttrPath = "{}.{}".format(item ,checkitem )
        if not cmds.objExists(objAttrPath):
            return
        try:
            getValue = cmds.getAttr(objAttrPath )
            return getValue
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

        self.chestPoint = None
        self.rootPoint = None
        self.headPoint = None
        self.LeftHandPoint = None
        self.RightHandPoint = None
        self.groups = { "guide_total" : None,
                        "guide_rigs" : None,
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
        if not cmds.objExists(item): return
        isConstraint = cmds.listRelatives(item, type="parentConstraint")
        if isConstraint: cmds.delete(isConstraint)
        cmds.parentConstraint(self.rootPoint, item, mo=1)

    def setCombineChest(self, item):
        '''설정된 Chest 기준점 오브젝트가 대상(item)을 제어하도록 Parent Constraint를 설정합니다.'''
        if not cmds.objExists(item): return
        isConstraint = cmds.listRelatives(item, type="parentConstraint")
        if isConstraint: cmds.delete(isConstraint)
        cmds.parentConstraint(self.chestPoint, item, mo=1)

    def setCombineHead(self, item):
        '''설정된 Head 기준점 오브젝트가 대상(item)을 제어하도록 Parent Constraint를 설정합니다.'''
        if not cmds.objExists(item): return
        isConstraint = cmds.listRelatives(item, type="parentConstraint")
        if isConstraint: cmds.delete(isConstraint)
        cmds.parentConstraint(self.headPoint, item, mo=1)

    def setCombineLeftHand(self, item):
        '''설정된 Left Hand 기준점 오브젝트가 대상(item)을 제어하도록 Parent Constraint를 설정합니다.'''
        if not cmds.objExists(item): return
        isConstraint = cmds.listRelatives(item, type="parentConstraint")
        if isConstraint: cmds.delete(isConstraint)
        cmds.parentConstraint(self.LeftHandPoint, item, mo=1)

    def setCombineRightHand(self, item):
        '''설정된 Right Hand 기준점 오브젝트가 대상(item)을 제어하도록 Parent Constraint를 설정합니다.'''
        if not cmds.objExists(item): return
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
        if not cmds.objExists(item): return
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
        
        try: cmds.parent(groups["guide_nonParent"], self.groups["guide_total"])
        except: pass
        
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