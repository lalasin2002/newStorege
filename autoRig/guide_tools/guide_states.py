# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om
import re , pprint, sys, os

'''
current_path = __file__
current_folderPath = os.path.abspath(os.path.dirname(current_path))
parent_folderPath = os.path.dirname(current_folderPath)
tools_folderPath = os.path.join(parent_folderPath, 'tools')
guide_folderPath = os.path.join(parent_folderPath, 'guide_rigs')
'''
tools_folderPath = os.path.abspath("D:\Code\MayaCode\autoRig\tools")
guide_folderPath = os.path.abspath("D:\Code\MayaCode\autoRig\guide_rigs")


if tools_folderPath not in sys.path:
    sys.path.append(tools_folderPath)
    print("Added to sys.path: {}".format(tools_folderPath))

from tools import controlAttribute , controlObject

#--------------------------------------------------------------------------

#rootPoint : space
#["rig_type" , "rig_part" , "rig_role" , "rig_data" , "rig_boneType" , "rig_index"]
def guideDataTemplate():
    template = {

        "rigType":None,

        "buildIndex": 0,
        "alp":"A",

        "rootPoint":{},
        "nonParent":{},

        "main":{
            "loc":{},
            "curve":{},
            "curveShape":{},
            "aimVector":{},
            "space":{}
        },

        "extra":{
            "loc":{},
            "curve":{},
            "curveShape":{},
            "pivot":{},
            "space":{}

        }

    }
    return template

def guideDataDetailTemplete():
    templateDetail = { "name" : None , "pos" : None , "index" : 0 , "boneType" : None}
    return templateDetail




#--------------------------------------------------------------------------


def setTags(item , dts ={ "rig_type" : ""  , "rig_part" : "" , "rig_role" : "" , "rig_data" : "" , "rig_boneType" : ""} ):
    returnDt = {}
    for attrName, stringName in dts.items():
        attr = controlAttribute.addStringattr(item, attrName, stringName)
        # 키를 어트리뷰트 이름으로 하여 모든 경로를 저장
        returnDt[attrName] = attr 
    return returnDt






class guideManager():
    def __init__(self):
        try:
            self.string_type = basestring
        except NameError:
            self.string_type =  str
        
        self.standard_templete = {}
        self.standard_detail_templete = {}

        self.checkPoints = ["rig_type" , "rig_part" , "rig_role" , "rig_data" , "rig_boneType" , "rig_index"]

        self.dataRules =  {
                "rootPoint": ["rootPoint"],
                "nonParent": ["nonParent"],
                "default": ["{rig_role}", "{rig_data}", "{rig_part}"]
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

    def importGuide(self, path , namespace=None):
        path = self._isCheckPath(path)
        if not path:
            return []
        
        GuideData = controlObject.load_importReference(path , namespace)
        return GuideData

    def setDefineData(self , items):
        finalDict = {}
        module_counter = {}

        for item in items:
            metaData = self._getMetaData(item , self.checkPoints)

            if not metaData:
                continue
            #검사지 ("rig_type" : 바이패드인지 아닌지) , ("rig_part" : 부위가 어디인지) 는 있어야함
            if not  metaData.get("rig_type") or not  metaData.get("rig_part"):
                continue
            
            path_middle_keys = self._getPathMiddleKey(metaData)
            detail_data = self._makeDetailData(item ,metaData )

            rig_type = metaData.get("rig_type")
            













    #__helper
    def _makeDetailData(self ,item , metaData):
        detail = guideDataDetailTemplete()
        detail["name"] = item
        detail["pos"] = [ round(v,3) for v in cmds.xform(item , ws=1 , q =1, t =1)]
        detail["index"] = metaData.get("rig_index")
        detail["boneType"] = metaData.get("rig_boneType")
        
        return detail


    def _getPathMiddleKey(self, metaData):
        path_keys = []
        # "rig_part" : 부위가 어디인지)
        part = metaData.get("rig_part")
        if part == "rootPoint":
                path_keys = self.dataRules["rootPoint"] # [root]
        elif part == "nonParent":
            path_keys = self.dataRules["nonParent"] # [nonParent]
        else:
            path_keys = [ rule.format(**metaData) for rule in self.dataRules["default"]] #포매팅

        ## ex) path_keys = ["main", "loc", "shoulder"]  , rule 은 "{rig_role}", "{rig_data}", "{rig_part}"

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
    

    









