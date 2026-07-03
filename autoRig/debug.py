# -*- coding: utf-8 -*-
from __future__ import unicode_literals


import maya.cmds as cmds
import maya.api.OpenMaya as om
import os , sys , pprint ,json
'''
CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))

if CURRENT_DIR not in sys.path:
    sys.path.insert(0, CURRENT_DIR)
    print("[debug] Added to sys.path: {}".format(CURRENT_DIR))
'''
import autoRig_config as config
from tools import controlAttribute , controlObject , createObject ,grouping , match
from rig_module import guideManager

#print(config.AUTO_RIG_ROOT)
#print(config.TOOLS_PATH)
#print(config.RIG_MODULE_PATH)
#print(config.GUIDE_RIGS_PATH)

guide_file_format = "guide_biped_{}.ma"
guide_parts = ["root", "head" , "leg" , "arm"  , "hand"]
guide_preset_paths = [os.path.join(config.GUIDE_RIGS_PATH ,guide_file_format.format(part) ) for part in guide_parts ]
#pprint.pprint(guide_preset_paths)

temp_json_path = os.path.join(config.AUTO_RIG_ROOT , "guide_temp.json")

guide_import_manager = guideManager.guideDataManager()
guide_combine_manager = guideManager.guideCombine()
ref_nodes = []
total_dict = {}

name_space_foramt = "guide_{}"
for  i , path in enumerate(guide_preset_paths):
    name_space = name_space_foramt.format(guide_parts[i])
    ref_node = guide_import_manager.importGuide(path ,name_space )
    ref_nodes.append(ref_node)

for i , ref_item in enumerate(ref_nodes):
    objs = guide_import_manager.getReferenceObjects(ref_item)
    data = guide_import_manager.setDefineData(objs)
    total_dict.update(data)

#pprint.pprint(total_dict)
if total_dict:
    with open(temp_json_path , "w" )as f:
        json.dump(total_dict , f, indent=4)


root_point = None
chest_point = None


if total_dict: # 가능하다면 try 사용
    root_point = total_dict["root_type"]["A"]["C"]["main"]["loc"]["root"]["name"]
    chest_point = total_dict["root_type"]["A"]["C"]["main"]["loc"]["chest"]["name"]
    leftArm_point = total_dict["arm_type"]["A"]["L"]["main"]["loc"]["wrist"]["name"]
    rightArm_point = total_dict["arm_type"]["A"]["R"]["main"]["loc"]["wrist"]["name"]
    head_point = total_dict["neck_type"]["A"]["C"]["main"]["loc"]["neckEnd"]["name"]

    guide_combine_manager.setRootPoint(root_point)
    guide_combine_manager.setChestPoint(chest_point)
    guide_combine_manager.setHeadPoint(head_point)
    guide_combine_manager.setLeftHandPoint(leftArm_point)
    guide_combine_manager.setRightHandPoint(rightArm_point)

    leftLeg_root = total_dict["leg_type"]["A"]["L"]["mirrorRoot"]["name"]
    rightLeg_root = total_dict["leg_type"]["A"]["R"]["mirrorRoot"]["name"]
    leftArm_root = total_dict["arm_type"]["A"]["L"]["mirrorRoot"]["name"]
    rightArm_root = total_dict["arm_type"]["A"]["R"]["mirrorRoot"]["name"]
    leftHand_root = total_dict["hand_type"]["A"]["L"]["mirrorRoot"]["name"]
    rightHand_root = total_dict["hand_type"]["A"]["R"]["mirrorRoot"]["name"]
    head_root = total_dict["head_type"]["A"]["C"]["mirrorRoot"]["name"]


    guide_combine_manager.setCombineRoot(leftLeg_root)
    guide_combine_manager.setCombineRoot(rightLeg_root)
    guide_combine_manager.setCombineChest(leftArm_root)
    guide_combine_manager.setCombineChest(rightArm_root)
    guide_combine_manager.setCombineHead(head_root)

    guide_combine_manager.setCombineLeftHand(leftHand_root)
    guide_combine_manager.setCombineRightHand(rightHand_root)

    total_mirrors =[ x.get("name") for x in guideManager.findKeyValues(total_dict , "mirrorRoot")]
    total_nonParents =[ x.get("name") for x in  guideManager.findKeyValues(total_dict ,"nonParent")]

    for item in total_mirrors:
        guide_combine_manager.parentRigGroup(item)
    for item in total_nonParents:
        guide_combine_manager.parentNonParentGroup(item)


    #rint ("chest_point" , chest_point)
    #root_point = total_dict["root"]["A"]["C"]["main"]["loc"]["root"]["name"]
    #chest_point = total_dict["chest"]["A"]["C"]["main"]["loc"]["chest"]["name"]
    




