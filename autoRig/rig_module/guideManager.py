# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om
import re , pprint, sys, os,copy ,json

'''
current_path = __file__
current_folderPath = os.path.abspath(os.path.dirname(current_path))
parent_folderPath = os.path.dirname(current_folderPath)


if parent_folderPath not in sys.path:
    sys.path.append(parent_folderPath)
    print("Added to sys.path: {}".format(parent_folderPath))

from tools import controlAttribute, controlObject
'''

autoRig_folderPath = os.path.abspath(r"D:\Code\MayaCode\autoRig")
guide_folderPath = os.path.abspath(r"D:\Code\MayaCode\autoRig\guide_tools\guide_rigs")

if autoRig_folderPath not in sys.path:
    sys.path.append(autoRig_folderPath)
    print("Added to sys.path: {}".format(autoRig_folderPath))

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


def setTags(item , dts ={ "rig_side" : "" , "rig_type" : ""  , "rig_part" : "" , "rig_role" : "" , "rig_data" : "" , "rig_boneType" : ""} ):
    returnDt = {}
    for attrName, stringName in dts.items():
        attr = controlAttribute.addStringAttr(item, attrName, stringName)
        # 키를 어트리뷰트 이름으로 하여 모든 경로를 저장
        returnDt[attrName] = attr 
    return returnDt




class guideDataManager():
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
        if not isinstance(dicts , dict):
            return
        self.dataRules = dicts
   
    def setCheckPoints(self, List):
        if not isinstance(List , list):
            return
         
        self.checkPoints = List
    #_______________________________________________________

    def importGuide(self, path , nameSpace=None):
        path = self._isCheckPath(path)
        if not path:
            return []
        
        guideNodes = controlObject.load_reference(path , nameSpace )
        #print ()
        if not guideNodes:
            return []
        

        return guideNodes
    
    def getReferenceObjects(self, refNode  ):
        if cmds.objectType(refNode) != "reference":
            return []
        
        guideObjects = controlObject.get_referenceObjects(refNode )
        return guideObjects



    def setDefineData(self, items, buildIndex=0, buildAlp="A"):
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
        
        detail = guideDetailTemplate()
        detail["name"] = item
        #임시 비활성화
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

        try:
            detail["matrix"] = [round(v, 5) for v in cmds.xform(item, ws=1, q=1, m=1)]
        except:
            detail["matrix"] = None
            
        '''
        detail["index"] = metaData.get("rig_index")
        detail["rig_boneType"] = metaData.get("rig_boneType")
        detail["side"] = metaData.get("rig_side")
            
        return detail


    def _getPathMiddleKey(self, metaData):
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
        objAttrPath = "{}.{}".format(item ,checkitem )
        if not cmds.objExists(objAttrPath):
            return
        try:
            getValue = cmds.getAttr(objAttrPath )
            return getValue
        except:
            return None

    def _isCheckPath(self, path , abs  = False ):
        isExistPath = os.path.exists(path)
        if not isExistPath:
            return None
        if abs:
            path = os.path.abspath(path)
        return path
    
    def _addList(self, item , addTargetList):
        if not isinstance( addTargetList , list):
            return
        if isinstance(item , (list, tuple)) and all(isinstance(x , self.string_type) for x in item):
            addTargetList.extend(item )
        if isinstance(item , self.string_type):
            addTargetList.append(item)
        return addTargetList
    

class guideCombine():
    def __init__(self):
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
    def setChestPoint(self , item):
        if not cmds.objExists(item):
            return 
        self.chestPoint = item
    def setRootPoint(self,item):
        if not cmds.objExists(item):
            return 
        self.rootPoint = item
    def setHeadPoint(self, item ):
        if not cmds.objExists(item):
            return 
        self.headPoint = item
    def setLeftHandPoint(self , item):
        if not cmds.objExists(item):
            return 
        self.LeftHandPoint = item

    def setRightHandPoint(self , item):
        if not cmds.objExists(item):
            return 
        self.RightHandPoint = item

    #----------------------------------------
    def setCombineRoot(self , item   ):
        if not cmds.objExists(item):
            return
        isConstraint = cmds.listRelatives(item , type = "parentConstraint")
        if isConstraint:
            cmds.delete(isConstraint)
        cmds.parentConstraint(self.rootPoint , item ,mo =1)

    def setCombineChest(self , item   ):
        if not cmds.objExists(item):
            return
        isConstraint = cmds.listRelatives(item , type = "parentConstraint")
        if isConstraint:
            cmds.delete(isConstraint)
        cmds.parentConstraint(self.chestPoint , item ,mo =1)

    def setCombineHead(self ,item):
        if not cmds.objExists(item):
            return
        isConstraint = cmds.listRelatives(item , type = "parentConstraint")
        if isConstraint:
            cmds.delete(isConstraint)
        cmds.parentConstraint(self.headPoint , item ,mo =1)

    def setCombineLeftHand(self ,item):
        if not cmds.objExists(item):
            return
        isConstraint = cmds.listRelatives(item , type = "parentConstraint")
        if isConstraint:
            cmds.delete(isConstraint)
        cmds.parentConstraint(self.LeftHandPoint , item ,mo =1)
    def setCombineRightHand(self ,item):
        if not cmds.objExists(item):
            return
        isConstraint = cmds.listRelatives(item , type = "parentConstraint")
        if isConstraint:
            cmds.delete(isConstraint)
        cmds.parentConstraint(self.RightHandPoint , item ,mo =1)

    def parentRigGroup(self , item ):
        if not cmds.objExists(item):
            return
        isCheckDt = self._checkDict(self.groups )
        if not isCheckDt:
            return
        try:
            cmds.parent(item ,self.groups["guide_rig"] )
        except:
            pass

    def parentNonParentGroup(self , item ):
        if not cmds.objExists(item):
            return
        isCheckDt = self._checkDict(self.groups )
        if not isCheckDt:
            return
        try:
            cmds.parent(item ,self.groups["guide_nonParent"] )
        except:
            pass

    def createTotalGroup(self , names = ["guide_setUp" , "guide_rig" , "guide_nonParent"]):
        if not isinstance(names , (list, tuple)):
            return
        if not len(names) == 3:
            return
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

        try:
            cmds.parent(self.groups["guide_rig"] ,self.groups["guide_total"] )
        except:
            pass
        try:
            cmds.parent(groups["guide_nonParent"],self.groups["guide_total"] )
        except:
            pass
        
    #--helper
    def _checkDict(self , dt):
        if not isinstance(dt , dict):
            return False
        if not dt:
            return False

        for key in dt.keys():
            if not key:
                return False
        return True
    def _matchPoint(self , matchItem , destnationItem):
        cmds.matchTransform(matchItem , destnationItem , pos =1 , rot =0 , scl= 0)

    
        
def findKeyValues(dt, targetKey, results=None):
    #여기 수정: dict 전체에서 특정 key의 value를 전부 찾는 helper
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