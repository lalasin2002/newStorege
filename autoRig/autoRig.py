# -*- coding: utf-8 -*-
from __future__ import unicode_literals


import maya.cmds as cmds
import maya.api.OpenMaya as om
import maya.OpenMayaUI as omui
import os , sys , pprint ,json ,io

try:
    from shiboken6 import wrapInstance
except:
    from shiboken2 import wrapInstance
try:
    from PySide6.QtWidgets import QApplication, QFileDialog ,QListWidget, QListWidgetItem
    from PySide6 import QtCore, QtWidgets, QtUiTools, QtGui
except:
    from PySide2.QtWidgets import QApplication, QFileDialog ,QListWidget, QListWidgetItem
    from PySide2 import QtCore, QtWidgets, QtUiTools, QtGui 


'''
CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))

if CURRENT_DIR not in sys.path:
    sys.path.insert(0, CURRENT_DIR)
    print("[debug] Added to sys.path: {}".format(CURRENT_DIR))
'''



import autoRig_config as config
from rig_module import guideManager, jointData
from tools import controlAttribute ,controlObject , pysideHelper , naming 


ui_name = "autoRig.ui"
ui_path = os.path.join(config.AUTO_RIG_ROOT, ui_name)


def maya_main_window():
    maya_main_window_ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(int(maya_main_window_ptr), QtWidgets.QWidget)

class DesignerUI(QtWidgets.QDialog):
    def __init__(self, parent=maya_main_window()):
        super(DesignerUI, self).__init__(parent)
        self._prevPath = os.path.join(config.AUTO_RIG_ROOT , "_prev.json")
        self._prevData ={}
        self._prevMap =[
            ("mirrorGuideAttr",              "match_attrOption_Chb",          "isChecked",             "setChecked",        True ),
            ("padding",                     "padding_Sb",                   "value",                 "setValue",          0),
            
            ("nameFleid",                    "nameFleid_Te",                  "toPlainText",           "setPlainText",      "{side}{extra_side}_{item_name}{alp}{num}_{rule}{extra}_{obj_type}"),
            ("sideData",                     "sideData_Te",                   "toPlainText",           "setPlainText",      (
                '{\n'
                '"left" : "L" ,\n'
                '"right" : "R" ,\n'
                '"center" : "M"\n'
                '}'
            )),
            ("extraSideData",                "extraSideData_Te",              "toPlainText",           "setPlainText",      (
                '{\n'
                '"up" : "up" ,\n'
                '"down" : "down",\n'
                '"left" : "left",\n'
                '"right" :  "right"\n'
                '}'
            )),
            ("objTypeData",                  "objTypeData_Te",                "toPlainText",           "setPlainText",      (
                '{\n'
                '"control" : "Ctrl" ,\n'
                '"curve" : "Crv",\n'
                '"joint" : "Jnt",\n'
                '"ikhandle" : "Ikh",\n'
                '"locator" : "loc",\n'
                '"plane" : "Pn",\n'
                '"follicle" : "Foli",\n'
                '"annotation" : "Att",\n'
                '"distanceDimension" : "Dt",\n'
                '"transform" : "space"\n'
                '}'
            )),
            ("nodeTypeData",                 "nodetypeData_Te",               "toPlainText",           "setPlainText",      (
                '{\n'
                '"multDoubleLinear" : "Mdl",\n'
                '"addDoubleLinear"  : "Adl",\n'
                '"multiplyDivide" : "Md" ,\n'
                '"plusMinusAverage" : "Pma",\n'
                '"blendColors" : "Bc",\n'
                '"setRange" : "Sr",\n'
                '"clamp" : "Clp",\n'
                '"condition" : "Cdt",\n'
                '"decomposeMatrix" : "Dm",\n'
                '"distanceBetween" : "DtBetween",\n'
                '"curveInfo" : "CrvInfo",\n'
                '"pointOnCurveInfo" : "Pocif",\n'
                '"nearestPointOnCurve" : "Npoc"\n'
                '}'
            )),
            ("ruleData",                     "ruleData_Te",                   "toPlainText",           "setPlainText",      (
                '{\n'
                '"non" : "",\n'
                '"normal" : "Normal",\n'
                '"fk" : "Fk",\n'
                '"ik" : "Ik",\n'
                '"fkik" : "FkIk",\n'
                '"fkik_blend" : "FkIk_blend",\n'
                '"detail" : "Detail",\n'
                '"bend" : "Bend",\n'
                '"arc" : "Arc",\n'
                '"deform" : "Deform",\n'
                '"bind" : "Bind",\n'
                '"aim" : "Aim",\n'
                '"poleVector" : "Pv",\n'
                '"vector" : "Vector",\n'
                '"pivot" : "Pivot",\n'
                '"twist" : "Twist",\n'
                '"point" : "Point",\n'
                '"translate" : "Translate",\n'
                '"rotate" : "Rotate",\n'
                '"scale" : "Scale",\n'
                '"main" : "Main",\n'
                '"world" : "World",\n'
                '"root" : "Root",\n'
                '"local" : "Local",\n'
                '"option" : "Option",\n'
                '"follow" : "Follow",\n'
                '"static" : "Static",\n'
                '"blend" : "Blend",\n'
                '"connect" : "Cnt",\n'
                '"connectParent"  : "cntParent",\n'
                '"bank" : "Bank",\n'
                '"roll" : "roll",\n'
                '"spin" : "spin",\n'
                '"stretch" : "Stretch",\n'
                '"volume" : "Volume",\n'
                '"sum" : "Sum",\n'
                '"add" : "Add",\n'
                '"outPut" : "OutPut",\n'
                '"inPut" : "InPut",\n'
                '"div" : "div",\n'
                '"power" : "Power",\n'
                '"scaling" : "Scaling",\n'
                '"calculate" : "Calculate",\n'
                '"offset" : "Offset",\n'
                '"support" : "Support"\n'
                '}'
            )),
            ("groupData",                    "groupData_Te",                  "toPlainText",           "setPlainText",      (
                '{\n'
                '"group1" : "{item}_Grp".\n'
                '"group2" : "{item}_Offset1",\n'
                '"group3" : "{item}_Offset2",\n'
                '"group4" : "{item}_Offset3",\n'
                '"group5" : "{item}_Prime",\n'
                '"system" : "{item}_Setting"\n'
                '}'
            )),
        ]


        self.validate_guide_refs = ["guide_bipadRN" , "guide_quadRN"]
        self.validate_extra_guide_refs = ["guide_bipad_armRN" , "guide_bipad_handRN", "guide_bipad_legRN" ,"guide_quad_armRN" , "guide_quad_legRN", "guide_quad_tailRN"   ]


        self.main_guide_ref = None
        self.extra_guide_refs = []

        self.main_guide_objs = []
        self.extra_guide_objs = []

        self.guide_data = {}
        self._guideManager = guideManager.guideDataManager()
        self._guideCombine = guideManager.guideCombine()
        self._namingRule = naming.namingRule()

        self.naming_data = None
        self.base_jnt_data = None
        self.root_base_joint = None

        self.init_ui(ui_path)
        self.connect_widget()
        self._loadPrev()

    def connect_widget(self):
        #guide_import
        self.ui.import_main_guide_Btn.clicked.connect(self.import_main_guide)
        
        self.ui.set_guideParent_Btn.clicked.connect(self.set_parentItem_for_extraParent)
        self.ui.import_extra_guide_Btn.clicked.connect(self.import_extra_guide)

        self.ui.match_ToLeft_FromRight_Btn.clicked.connect(lambda : self.mirror_match(["L","R"]))
        self.ui.match_ToRight_FromLeft_Btn.clicked.connect(lambda : self.mirror_match(["R","L"]))

        self.ui.export_nameData_Btn.clicked.connect(self.export_namningData)
        self.ui.import_nameData_Btn.clicked.connect(self.import_namingData)
        
        self.ui.create_main_guideJnt_Btn.clicked.connect(self.create_guide_joint)
        self.ui.build_Btn.clicked.connect(self.crete_base_joint)

    def crete_base_joint(self):
        self._read_guide_data()
        self.set_name_rule()
        self.getBase_joint_data()

        joint_data = self.base_jnt_data.get("joints")
        jointControlManager = jointData.jointControlManager()

        if not joint_data:
            return
        #pprint.pprint (joint_data)
        #unParent
        for data in joint_data:
            path = joint_data[data]
            joint = path.get('node')

            jointControlManager.unParent_transform(joint , True)
        create_base_rig_manager = jointData.create_base_rig_joint()
        create_base_rig_manager.set_main_data(self.base_jnt_data)
        create_base_rig_manager.set_naming_rule(self._namingRule)
        root_modules = [ "fk" , "detail"]

        root_joints = create_base_rig_manager.organize_joint_data(self.base_jnt_data , "root_type" , "A" , "C")
        
        create_base_rig_manager.root_dulicate(root_modules)

        



        








    def create_guide_joint(self):
        self.getBase_joint_data()
        if self.root_base_joint:
            if cmds.objExists(self.root_base_joint[0]):
                cmds.delete(self.root_base_joint)
                self.root_base_joint = None

        self._read_guide_data()
        self.set_name_rule()
        padding = self.naming_data.get("padding", 0)
        guideJointManager = guideManager.guideJointManager(
            self._namingRule,
            self.naming_data["group"]
        )
        guideJointManager.set_guide_data(self.guide_data)
        total_organizing_data = guideJointManager.modules

        #print(u"debug2 : extra guide refs")
        #pprint.pprint(self.extra_guide_refs)
        #print(u"debug2 : module keys")
        #pprint.pprint(sorted(total_organizing_data.keys()))
        
        root_module = total_organizing_data.get(('root_type','A','C'))
        neck_module = total_organizing_data.get(('neck_type','A','C'))
        head_module = total_organizing_data.get(('head_type','A','C'))

        left_arm_modules = []
        right_arm_modules = []
        left_hand_modules = []
        right_hand_modules = []
        left_leg_modules = []
        right_leg_modules = []
        left_eye_modules = []
        right_eye_modules = []
        jaw_modules = []
        tongue_modules = []
        tail_modules = []

        for key_path_data , detail_data in total_organizing_data.items():

            key_type , alp , side = key_path_data
            if key_type == "arm_type":
                if side == "L":
                    left_arm_modules.append(detail_data)
                if side == "R":
                    right_arm_modules.append(detail_data)
            if key_type == "leg_type":
                if side == "L":
                    left_leg_modules.append(detail_data)
                if side == "R":
                    right_leg_modules.append(detail_data)
            if key_type == "hand_type":
                if side == "L":
                    left_hand_modules.append(detail_data)
                if side == "R":
                    right_hand_modules.append(detail_data)
            if key_type == "eye_type":
                if side == "L":
                    left_eye_modules.append(detail_data)
                if side == "R":
                    right_eye_modules.append(detail_data)
            if key_type == "gum_type" and side == "C":
                jaw_modules.append(detail_data)
            if key_type == "tongue_type" and side == "C":
                tongue_modules.append(detail_data)
            if key_type == "tail_type" and side == "C":
                tail_modules.append(detail_data)

        if not root_module:
            raise ValueError(u"debug2 : root_type:A:C module을 찾을 수 없습니다.")

        build_results = {
            "root": guideJointManager.build_root(
                root_module,
                padding=padding
            ),
            "neck": None,
            "head": None,
            "eyes": [],
            "jaws": [],
            "gums": [],
            "tongues": [],
            "tails": [],
            "arms": [],
            "hands": [],
            "legs": []
        }

        if neck_module:
            #print(u"debug2 : build_neck start - module=neck_type, build=A, side=C")
            build_results["neck"] = guideJointManager.build_neck(
                neck_module,
                padding=padding
            )

        if head_module:
            #print(u"debug2 : build_head start - module=head_type, build=A, side=C")
            build_results["head"] = guideJointManager.build_head(head_module)

        eye_modules = left_eye_modules + right_eye_modules
        eye_modules.sort(key=lambda data: data.get("key", ("", "", "")))
        for eye_module in eye_modules:
            module_key = eye_module.get("key")
            rig_module, rig_build, rig_side = module_key
            #print(u"debug2 : build_eye start - module={}, build={}, side={}".format(   rig_module,   rig_build,  rig_side  ) )
            eye_result = guideJointManager.build_eye(
                eye_module,
                insert_alp=(not rig_build == "A")
            )
            build_results["eyes"].append({
                "key": module_key,
                "result": eye_result
            })

        jaw_modules.sort(key=lambda data: data.get("key", ("", "", "")))
        for jaw_module in jaw_modules:
            module_key = jaw_module.get("key")
            rig_module, rig_build, rig_side = module_key
            #print(u"debug2 : build_jaw start - module={}, build={}, side={}".format(rig_module,rig_build,rig_side))
            jaw_result = guideJointManager.build_jaw(
                jaw_module,
                insert_alp=(not rig_build == "A")
            )
            build_results["jaws"].append({
                "key": module_key,
                "result": jaw_result
            })
            gum_result = guideJointManager.build_gum(
                jaw_module,
                insert_alp=(not rig_build == "A")
            )
            build_results["gums"].append({
                "key": module_key,
                "result": gum_result
            })

        tongue_modules.sort(key=lambda data: data.get("key", ("", "", "")))
        for tongue_module in tongue_modules:
            module_key = tongue_module.get("key")
            rig_module, rig_build, rig_side = module_key
            #print(u"debug2 : build_tongue start - module={}, build={}, side={}".format(rig_module,rig_build,rig_side))
            tongue_result = guideJointManager.build_tongue(
                tongue_module,
                insert_alp=(not rig_build == "A"),
                padding=padding
            )
            build_results["tongues"].append({
                "key": module_key,
                "result": tongue_result
            })

        tail_modules.sort(key=lambda data: data.get("key", ("", "", "")))
        for tail_module in tail_modules:
            module_key = tail_module.get("key")
            rig_module, rig_build, rig_side = module_key
            #print(u"debug2 : build_tail start - module={}, build={}, side={}".format(rig_module,rig_build,rig_side))
            tail_result = guideJointManager.build_tail(
                tail_module,
                insert_alp=(not rig_build == "A"),
                padding=padding
            )
            build_results["tails"].append({
                "key": module_key,
                "result": tail_result
            })

        leg_modules = left_leg_modules + right_leg_modules
        leg_modules.sort(key=lambda data: data.get("key", ("", "", "")))

        for leg_module in leg_modules:
            module_key = leg_module.get("key")
            rig_module, rig_build, rig_side = module_key

            #print(u"debug2 : build_leg start - module={}, build={}, side={}".format( rig_module,  rig_build, rig_side ))

            leg_result = guideJointManager.build_leg(
                leg_module,
                insert_alp=(not rig_build == "A"),
                padding=padding
            )
            build_results["legs"].append({
                "key": module_key,
                "result": leg_result
            })

        arm_modules = left_arm_modules + right_arm_modules
        arm_modules.sort(key=lambda data: data.get("key", ("", "", "")))

        for arm_module in arm_modules:
            module_key = arm_module.get("key")
            rig_module, rig_build, rig_side = module_key

            #print(u"debug2 : build_arm start - module={}, build={}, side={}".format( rig_module,   rig_build,rig_side ))

            arm_result = guideJointManager.build_arm(
                arm_module,
                insert_alp=(not rig_build == "A"),
                padding=padding
            )
            build_results["arms"].append({
                "key": module_key,
                "result": arm_result
            })

        hand_modules = left_hand_modules + right_hand_modules
        hand_modules.sort(key=lambda data: data.get("key", ("", "", "")))

        for hand_module in hand_modules:
            module_key = hand_module.get("key")
            rig_module, rig_build, rig_side = module_key

            #print(u"debug2 : build_hand start - module={}, build={}, side={}".format(rig_module,rig_build,rig_side ))

            hand_root_parent = self._resolve_hand_root_parent(
                hand_module,
                guideJointManager
            )
            hand_result = guideJointManager.build_hand(
                hand_module,
                insert_alp=(not rig_build == "A"),
                root_parent=hand_root_parent,
                padding=padding
            )
            build_results["hands"].append({
                "key": module_key,
                "result": hand_result
            })

        # JointBuilder의 반환 결과에 포함된 metadata를 실제 Guide Joint에 기록합니다.
        # JointBuilder는 Maya attribute 저장에 관여하지 않으며, 저장 책임은
        # jointData의 외부 함수와 JointDataManager가 담당합니다.
        joint_data_manager = jointData.JointDataManager()
        saved_joint_tags = jointData.writeGuideJointBuildResults(
            build_results,
            joint_data_manager
        )
        self.guide_joint_data = jointData.readGuideJointData(
            joint_data_manager
        )

        print(
            u"create_guide_joint : Guide Joint metadata 저장 완료 - {}개".format(
                len(saved_joint_tags)
            )
        )
        #print(u"debug2 : root/neck/head/eye/jaw/gum/tongue/tail/arm/hand/leg joint build complete")
        #pprint.pprint(build_results)
        self.getBase_joint_data()

        #pprint.pprint(self.base_jnt_data)



    def getBase_joint_data(self):
        joint_data_manager = jointData.JointDataManager()
        guide_joint_data = jointData.readGuideJointData(joint_data_manager)

        base_joint_data = {
            "joints": {},
            "modules": {},
            "roots": [],
            "invalid": []
        }

        if not guide_joint_data:
            return

        # 먼저 rig_id를 기준으로 Joint 본체와 module 색인을 만듭니다.
        # hierarchy는 모든 rig_id가 수집된 뒤 두 번째 단계에서 연결합니다.
        for module_key, module_records in guide_joint_data.items():
            if not isinstance(module_key, (tuple, list)) or len(module_key) != 3:
                base_joint_data["invalid"].append({
                    "reason": "invalid module key",
                    "module_key": module_key
                })
                continue

            rig_module, rig_build, rig_side = module_key
            if not all(module_key):
                base_joint_data["invalid"].append({
                    "reason": "empty module key",
                    "module_key": module_key
                })
                continue

            module_joint_ids = (
                base_joint_data["modules"]
                .setdefault(rig_module, {})
                .setdefault(rig_build, {})
                .setdefault(rig_side, [])
            )

            for joint_record in module_records:
                joint_item = joint_record.get("node")
                tags = dict(joint_record.get("tags") or {})
                rig_id = tags.get("rig_id")

                if not joint_item or not rig_id:
                    base_joint_data["invalid"].append({
                        "reason": "missing node or rig_id",
                        "node": joint_item,
                        "rig_id": rig_id
                    })
                    continue

                if rig_id in base_joint_data["joints"]:
                    base_joint_data["invalid"].append({
                        "reason": "duplicated rig_id",
                        "node": joint_item,
                        "rig_id": rig_id
                    })
                    continue

                try:
                    tags["rig_index"] = int(tags.get("rig_index"))
                except (TypeError, ValueError):
                    base_joint_data["invalid"].append({
                        "reason": "invalid rig_index",
                        "node": joint_item,
                        "rig_id": rig_id,
                        "rig_index": tags.get("rig_index")
                    })
                    continue

                base_joint_data["joints"][rig_id] = {
                    "node": joint_item,
                    "tags": tags,
                    "parent_id": None,
                    "children_ids": []
                }
                module_joint_ids.append(rig_id)

        # 중간 offset group을 건너뛰고 가장 가까운 상위 Guide Joint를 찾습니다.
        for rig_id, joint_record in base_joint_data["joints"].items():
            parent_id = jointData._findGuideParentId(joint_record["node"])

            if parent_id is None:
                base_joint_data["roots"].append(rig_id)
                continue

            if parent_id not in base_joint_data["joints"]:
                base_joint_data["invalid"].append({
                    "reason": "parent rig_id does not exist",
                    "node": joint_record["node"],
                    "rig_id": rig_id,
                    "parent_id": parent_id
                })
                continue

            joint_record["parent_id"] = parent_id
            base_joint_data["joints"][parent_id]["children_ids"].append(rig_id)

        def joint_sort_key(rig_id):
            joint_record = base_joint_data["joints"][rig_id]
            return (
                joint_record["tags"].get("rig_index", 0),
                rig_id
            )

        base_joint_data["roots"].sort(key=joint_sort_key)

        for joint_record in base_joint_data["joints"].values():
            joint_record["children_ids"].sort(key=joint_sort_key)

        for build_data in base_joint_data["modules"].values():
            for side_data in build_data.values():
                for module_joint_ids in side_data.values():
                    module_joint_ids.sort(key=joint_sort_key)

        if base_joint_data["invalid"]:
            self.base_jnt_data = base_joint_data
            raise ValueError(
                u"getBase_joint_data : 올바르지 않은 Guide Joint 데이터가 있습니다: {}".format(
                    base_joint_data["invalid"]
                )
            )

        self.base_jnt_data = base_joint_data
        try:
            self.root_base_joint = None
            self.root_base_joint = base_joint_data["joints"]['root_type:A:C:root:0']["node"]
            parent_node = cmds.listRelatives(self.root_base_joint , p = 1)
            if parent_node:
                self.root_base_joint = parent_node
        except Exception as e:
            print ("self.root_base_joint" ,  e)


        return self.base_jnt_data




    def debug(self):
        self._read_guide_data()
        self._read_namning_data()
        self.set_name_rule()
        
        jointBuilder = guideManager.JointBuilder()

        item_data = self.guide_data["items"]
        #pprint.pprint(item_data)
        item_path = "arm_type:A:L:main:{objtype}:{part}"
        curve_path = item_path.format(objtype = "curveShape" , part = "shoulder")
        is_curve_path = item_data.get(curve_path)
        if not is_curve_path:
            return
        
        
        aimVector_path = item_data.get(item_path.format(objtype = "aimVector", part = "shoulder"))
        loc_path = item_data.get(item_path.format(objtype = "loc", part = "shoulder"))


        insertJnt = None
        aimVector = aimVector_path.get("node")
        curve = is_curve_path.get("node")
        if loc_path:
            insertJnt = cmds.getAttr(loc_path["node"] + ".insertJnt")

        div = 1.0/(insertJnt +2 -1)


        
        for index in range(insertJnt + 2):
            jntName = self._namingRule.build(item_name = "shoulder" ,side =  "left" ,extra_side = "" , alp = "" , num = str(index+1).zfill(2) ,rule = "" , obj_type= "joint")
            pocifName = self._namingRule.build(item_name = "shoulder" ,side =  "left" ,extra_side = "" , alp = "" , num = str(index+1).zfill(2) ,rule = "" , obj_type= "pointOnCurveInfo")
            pointMM_name = self._namingRule.build(item_name = "shoulder" ,side =  "left" ,extra_side = "" , alp = "" , num = str(index+1).zfill(2) ,rule = "" , obj_type= "pointMatrixMult")
            param = div * index

            # 새 JointBuilder에서 현재 joint task 작성을 시작합니다.
            jointBuilder.define_joint_planData(
                jntName,
                jntName + "_Grp"
            )

            # 현재 joint의 위치를 shoulder curve 위의 parameter로 정의합니다.
            jointBuilder.define_pointOnCurve_planData(
                curve,
                param,
                pocifName,
                pointMM_name
            )

            # 기존 debug와 동일하게 shoulder aimVector를
            # tangent constraint의 world-up object로 사용합니다.
            jointBuilder.define_tangent_planData(
                curve,
                (1, 0, 0),
                (0, 1, 0),
                worldV=(0, 1, 0),
                worldUpObject=aimVector,
                worldUpType="objectrotation"
            )

            # 기존 index를 저장하고 완성된 task를 build_plan에 등록합니다.
            jointBuilder.define_index_planData(index)
            jointBuilder.add_current_plan_task()
        
        jointBuilder.build()



        #print (curve )
        #print (aimVector)
        print (insertJnt)

    def set_name_rule(self):
        self._namingRule = naming.namingRule()
        data = self._read_namning_data()

        self._namingRule.set_name_field(data.get("nameField"))
        tokens = {}

        
        tokens.update( data.get("objType"))
        tokens.update( data.get("nodeType"))

        
        self._namingRule.set_objType_map(tokens)
        self._namingRule.set_sideType_map(data.get("side"))
        self._namingRule.set_extraSideType_map(data.get("extraSide"))
        self._namingRule.set_ruleType_map(data.get("rule"))




    def import_namingData(self):

        import_result = QFileDialog.getOpenFileName(self, "set a path",config.AUTO_RIG_ROOT ,**{"filter" : u"JSON Files (*.json);;All Files (*.*)" , "selectedFilter": u"JSON Files (*.json)"}  )
        import_path = import_result[0] if isinstance(import_result, (list, tuple)) else import_result
        check_key = [ "nameField" , "side" , "extraSide" , "objType" , "nodeType" , "rule", "group" ]
        import_data = None

        check_path = os.path.exists(import_path )
        if not check_path:
            return
        try:
            with io.open(import_path, "r" , encoding="utf-8") as f:
                import_data = json.load(f)
        except:
            print(u"import_namingData 에러 : {} 데이터 읽기 실패".format(import_path))
            return
        if not import_data:
            print(u"import_namingData 에러 : {} 에 데이터 없음".format(import_path))

        if not import_data:
            return

        padding = import_data.get("padding", 0)
        if (
            not isinstance(padding, int)
            or isinstance(padding, bool)
            or padding < 0
        ):
            print(
                u"import_namingData error : padding must be an int of 0 or greater - {}".format(
                    padding
                )
            )
            return
        import_data["padding"] = padding

        if not all(import_data.get(key) for key in check_key ):
            print(u"import_namingData 에러 : {} 에 데이터 없음".format(import_path))
            return

        task_map = [ ("nameFleid_Te"     , "nameField"),
                     ("sideData_Te"      , "side" ),
                     ("extraSideData_Te" , "extraSide"),
                     ("objTypeData_Te"   , "objType"),
                     ("nodetypeData_Te"  , "nodeType"),
                     ("ruleData_Te"      , "rule"),
                     ("groupData_Te"     , "group"),
                     ("padding_Sb"       , "padding")
                    ]

        for widgetName , key in task_map:
            widget = getattr(self.ui , widgetName)
            if widgetName == "padding_Sb":
                getattr(widget , "setValue")(import_data[key])
            else:
                getattr(widget , "setPlainText")(import_data[key])

            #print (widget  , import_data[key]) 디버그용

    def export_namningData(self):
        self._read_namning_data()
        data = self.naming_data

        default_path = os.path.join(config.AUTO_RIG_ROOT, "namingData.json")
        export_result = QFileDialog.getSaveFileName(self, "set a path",default_path ,**{"filter" : u"JSON Files (*.json);;All Files (*.*)" , "selectedFilter": u"JSON Files (*.json)"}  )
        export_path = export_result[0] if isinstance(export_result, (list, tuple)) else export_result

        if not export_path:
            return

        if not export_path.lower().endswith(".json"):
            export_path += ".json"

        try:
            with io.open(export_path , "w" , encoding= "utf-8") as f:
                json.dump(data , f, ensure_ascii=False, indent=4)
                print (u"export_namningData : {} 으로 저장됨." .format(export_path))
        except Exception as e:
            print (u"export_namningData 에러 : {}".format(e))




    def import_main_guide(self):
        current_guide = self.ui.main_guide_Cbb.currentText()
        file = "guide_{}.ma".format(current_guide)
        namespace = "guide_{}". format(current_guide)

        preset_path = os.path.join(config.GUIDE_RIGS_PATH ,file )
        is_preset_path = os.path.exists(preset_path)
        if not is_preset_path:
            return
        
        # -----------------------------search guide ref 
        self.main_guide_ref = self._find_main_presetRef()
        # -----------------------------refresh guide ref
        if self.main_guide_ref and cmds.objExists(self.main_guide_ref):
            old_ref_path = cmds.referenceQuery(self.main_guide_ref , filename = True)
            cmds.file(old_ref_path , removeReference=True)

        self.main_guide_ref = self._guideManager.importGuide(preset_path , namespace)
        self.main_guide_objs = self._find_main_refObjects()
        self.guide_data = self._find_data_from_ref(self.main_guide_ref)


        self._guideCombine.createTotalGroup()
        
        containers_path = self.guide_data.get("containers")
        items_path = self.guide_data.get("items")
        for _ , data in  containers_path.items():
            container = data.get("node")
            self._guideCombine.parentNonParentGroup(container)

        for _ , data in items_path.items():
            role_type = data.get("rig_role")
            if role_type == "mirror":
                self._guideCombine.parentRigGroup(data.get("node"))

    def import_extra_guide(self):
        '''
        Extra guide preset을 추가로 불러온다.

        수정 방향:
            1. 기존 extra reference 전체를 다시 분석하지 않는다.
               이번에 새로 import한 reference만 guide_data로 만든다.

            2. Maya namespace와 rig_build는 역할이 다르다.
               namespace는 Maya scene 안에서 node 이름 충돌을 막기 위한 값이고,
               rig_build는 autoRig 데이터 안에서 같은 부위의 몇 번째 preset인지
               구분하기 위한 값이다.

            3. 같은 부위 검출은 파일명이나 namespace가 아니라 rig_module metadata로 한다.
               예: arm_type이 이미 A로 있으면 새 arm_type은 B가 된다.
        '''
        current_extra_guide = self.ui.extra_guide_Cbb.currentText()
        parent_item = self.ui.set_guideParent_Le.text()

        # parent_item은 extra guide가 어느 main guide 지점에 붙을지 기록하기 위한 값이다.
        # 선택값이 없거나 scene에 없는 node면 attach target 없이 import한다.
        if parent_item == "":
            parent_item = None

        if parent_item and not cmds.objExists(parent_item):
            parent_item = None

        file = "guide_{}.ma".format(current_extra_guide)

        # 같은 extra preset을 여러 번 불러올 수 있으므로 namespace는 매번 고유하게 만든다.
        # 예: bipad_arm, bipad_arm_1, bipad_arm_2
        namespace = self._make_unique_namespace(current_extra_guide)
        preset_path = os.path.join(config.GUIDE_RIGS_PATH ,file )

        if not os.path.exists(preset_path):
            return

        # 이번에 새로 불러온 extra guide reference만 처리한다.
        # 기존 extra guide까지 다시 setDefineData하면 buildIndex 계산과 병합이 꼬일 수 있다.
        ref_node = self._guideManager.importGuide(preset_path, namespace)
        if not ref_node:
            return

        guide_objs = self._guideManager.getReferenceObjects(ref_node)
        if not guide_objs:
            return

        # 같은 rig_module이 이미 self.guide_data 안에 있으면 다음 A/B/C index를 사용한다.
        # 이 판단은 guideDataManager가 담당한다. UI 쪽은 흐름만 제어한다.
        buildIndex = self._guideManager.getNextBuildIndex(self.guide_data, guide_objs)
        guide_data = self._guideManager.setDefineData(guide_objs, buildIndex=buildIndex)

        self.extra_guide_refs.append(ref_node)
        self.extra_guide_objs.extend(guide_objs)
        self.extra_guide_objs = list(set(self.extra_guide_objs))

        if self._guide_data_has_module(guide_data, "hand_type"):
            self._attach_extra_hand_guide(guide_data, parent_item)
        elif parent_item:
            self._set_attach_target_to_guide_data(guide_data, parent_item)

        # self.guide_data.update(guide_data)를 쓰면 items/containers 전체가 덮인다.
        # 그래서 section별로 안쪽 dict만 병합한다.
        self._merge_guide_data(guide_data)

        self._guideCombine.createTotalGroup()
        containers_path = self.guide_data.get("containers")
        items_path = self.guide_data.get("items")

        items_path = self.guide_data.get("items")
        for _ , data in  containers_path.items():
            container = data.get("node")
            self._guideCombine.parentNonParentGroup(container)

        for _ , data in items_path.items():
            role_type = data.get("rig_role")
            if role_type == "mirror":
                self._guideCombine.parentRigGroup(data.get("node"))





    def set_parentItem_for_extraParent(self):
        selects = [x for x in cmds.ls(sl =1) if controlObject.isDag(x)]
        if not len(selects) >0:
            return
        self.ui.set_guideParent_Le.setText(selects[-1])

    def mirror_match(self , ax = ["L", "R"] ):
        check_match_invertAttr = self.ui.match_attrOption_Chb.isChecked()
        self.guide_data = self._read_guide_data()

        pprint.pprint (cmds.ls("*RN" , type = "reference"))
        #print ("ref : " ,cmds.ls( type = "reference"))
        cmds.undoInfo(openChunk =1 )
        try:
            if not isinstance(ax, (list, tuple)) or len(ax) < 2:
                
                return []

            source_side = ax[0]
            target_side = ax[1]
            
            if source_side == target_side:
                #print (" source_side == target_side")
                return []
            
            items = self.guide_data.get("items", {})
            if not isinstance(items, dict):
                
                return []
            
            # 참고용 items data
            #"root_type:A:C:main:curveShape:neck": {
            #    "id": "root_type:A:C:main:curveShape:neck",
            #     ...
            #    "node": "guide_biped:C_neck_CrvShape",
            result = []
            
            for guide_id, source_data in items.items():
                if not source_data.get("rig_side") == source_side:
                    continue
                


                target_id = self._replace_guide_id_side(guide_id, target_side)
                if not target_id:
                    continue

                target_data = items.get(target_id)
                if not target_data:
                    continue

                source_node = source_data.get("node")
                target_node = target_data.get("node")

                if not source_node or not target_node:
                    continue
                #print ("source_node :: " , source_node)
                if check_match_invertAttr:

                    isSourceAttr = cmds.attributeQuery("insertJnt" , node = source_node , ex=1)
                    if isSourceAttr :
                        getValue = cmds.getAttr("{}.insertJnt" .format(source_node ))
                        #print ("isSourceAttr :" , source_node)
                        isTargetAttr = cmds.attributeQuery("insertJnt" , node = target_node , ex=1)
                        #print ("isTargetAttr : ",target_node)

                        if isTargetAttr:
                            cmds.setAttr( "{}.insertJnt" .format(target_node) , getValue)

                if source_data.get("matrix") == None:
                    continue

                if source_data.get("rig_data") == "aimVector":
                    # aimVector의 방향은 부모 aimConstraint가 계산한다.
                    # 자식에 입력된 사용자 rotate offset은 반사하지 않고
                    # 소스와 대상의 로컬 채널 값이 같도록 그대로 복사한다.
                    source_rotate = cmds.getAttr("{}.rotate".format(source_node))[0]
                    cmds.setAttr(
                        "{}.rotate".format(target_node),
                        -source_rotate[0],
                        -source_rotate[1],
                        source_rotate[2],
                        type="double3"
                    )
                else:
                    source_matrix = cmds.xform(source_node, q=True, ws=True, m=True)
                    mirror_matrix = self._mirror_matrix_x(source_matrix)

                    cmds.xform(target_node, ws=True, m=mirror_matrix)

                target_matrix = cmds.xform(target_node, q=True, ws=True, m=True)
                target_data["matrix"] = [round(v, 5) for v in target_matrix]
                target_data["pos"] = [round(v, 3) for v in cmds.xform(target_node, q=True, ws=True, t=True)]

                result.append((source_node, target_node))
            return result
        finally:
            cmds.undoInfo(closeChunk = 1)

    #--helper
    def _read_namning_data(self):
        nameField_data = self.ui.nameFleid_Te.toPlainText()
        side_data =  self.ui.sideData_Te.toPlainText()
        extraSide_data = self.ui.extraSideData_Te.toPlainText()
        objType_data = self.ui.objTypeData_Te.toPlainText()
        nodeType_data = self.ui.nodetypeData_Te.toPlainText()
        rule_data = self.ui.ruleData_Te.toPlainText()
        group_data = self.ui.groupData_Te.toPlainText()
        padding_data = self.ui.padding_Sb.value()

        data = {
            "nameField": nameField_data,
            "side": self._parse_naming_map("side", side_data),
            "extraSide": self._parse_naming_map("extraSide", extraSide_data),
            "objType": self._parse_naming_map("objType", objType_data),
            "nodeType": self._parse_naming_map("nodeType", nodeType_data),
            "rule": self._parse_naming_map("rule", rule_data),
            "group": self._parse_naming_map("group", group_data),
            "padding" :  padding_data
        }

        self.naming_data = data 
        return data

    def _parse_naming_map(self, name, text):
        try:
            result = json.loads(text)
        except ValueError as e:
            raise ValueError(
                u"{} naming 데이터의 JSON 문법이 잘못되었습니다: {}".format(
                    name, e
                )
            )

        if not isinstance(result, dict):
            raise ValueError(
                u"{} naming 데이터는 dictionary 형식이어야 합니다.".format(name)
            )

        return result

    def _merge_guide_data(self, guide_data):
        '''
        새 guide_data를 self.guide_data에 누적한다.

        주의:
            self.guide_data.update(guide_data)를 사용하면
            기존 items dict가 새 items dict로 통째로 교체된다.

        그래서 items, containers, invalid를 각각 따로 병합한다.
        '''
        if not isinstance(guide_data, dict):
            return

        # main guide 없이 extra guide를 먼저 부르는 상황도 방어한다.
        if not self.guide_data:
            self.guide_data = {
                "items": {},
                "containers": {},
                "invalid": []
            }

        if "items" not in self.guide_data:
            self.guide_data["items"] = {}

        if "containers" not in self.guide_data:
            self.guide_data["containers"] = {}

        if "invalid" not in self.guide_data:
            self.guide_data["invalid"] = []

        self.guide_data["items"].update(
            guide_data.get("items", {})
        )

        self.guide_data["containers"].update(
            guide_data.get("containers", {})
        )

        self.guide_data["invalid"].extend(
            guide_data.get("invalid", [])
        )


    def _set_attach_target_to_guide_data(self, guide_data, parent_item):
        '''
        이번에 import한 extra guide data에 attach target 정보를 기록한다.

        parent_item은 "이 extra guide를 어느 guide node에 붙일지"를 나타내는 값이다.
        현재 preset에는 rig_attachTarget attr이 없을 수 있으므로,
        우선 guide_data dict에는 항상 기록하고 scene node에는 attr이 있을 때만 setAttr한다.
        '''
        if not parent_item or not cmds.objExists(parent_item):
            return

        for section in ["items", "containers"]:
            section_data = guide_data.get(section, {})
            if not isinstance(section_data, dict):
                continue

            for detail in section_data.values():
                node = detail.get("node")
                detail["rig_attachTarget"] = parent_item

                if not node or not cmds.objExists(node):
                    continue

                # Reference node에는 새 attr 추가가 실패할 수 있다.
                # preset에 rig_attachTarget attr이 이미 있을 때만 scene node에도 값을 반영한다.
                attr_path = "{}.rig_attachTarget".format(node)
                if cmds.objExists(attr_path):
                    cmds.setAttr(attr_path, parent_item, type="string")


    def _guide_data_has_module(self, guide_data, rig_module):
        if not isinstance(guide_data, dict):
            return False

        for section in ["items", "containers"]:
            section_data = guide_data.get(section, {})
            if not isinstance(section_data, dict):
                continue

            for detail in section_data.values():
                if detail.get("rig_module") == rig_module:
                    return True

        return False


    def _find_guide_record_by_node(self, node):
        if not node or not cmds.objExists(node):
            return None, None

        node_paths = cmds.ls(node, long=True) or [node]
        node_path = node_paths[0]

        for section in ["items", "containers"]:
            section_data = self.guide_data.get(section, {})
            if not isinstance(section_data, dict):
                continue

            for guide_id, detail in section_data.items():
                detail_node = detail.get("node")
                if not detail_node or not cmds.objExists(detail_node):
                    continue

                detail_paths = cmds.ls(detail_node, long=True) or [detail_node]
                if detail_paths[0] == node_path:
                    return guide_id, detail

        return None, None


    def _find_arm_wrist_targets(self, rig_build=None):
        targets = {"L": [], "R": []}
        items = self.guide_data.get("items", {})
        if not isinstance(items, dict):
            return targets

        for guide_id, detail in items.items():
            if not detail.get("rig_module") == "arm_type":
                continue
            if not detail.get("rig_role") == "main":
                continue
            if not detail.get("rig_data") == "loc":
                continue
            if not detail.get("rig_part") == "wrist":
                continue
            if rig_build is not None:
                if not detail.get("rig_build") == rig_build:
                    continue

            side = detail.get("rig_side")
            if side in targets:
                targets[side].append((guide_id, detail))

        return targets


    def _attach_extra_hand_guide(self, guide_data, parent_item=None):
        selected_build = None

        if parent_item:
            _, selected_detail = self._find_guide_record_by_node(parent_item)
            is_wrist = (
                selected_detail
                and selected_detail.get("rig_module") == "arm_type"
                and selected_detail.get("rig_role") == "main"
                and selected_detail.get("rig_data") == "loc"
                and selected_detail.get("rig_part") == "wrist"
            )
            if is_wrist:
                selected_build = selected_detail.get("rig_build")
            else:
                cmds.warning(
                    u"extra hand의 parent는 arm wrist locator여야 합니다: {}".format(
                        parent_item
                    )
                )

        wrist_targets = self._find_arm_wrist_targets(selected_build)
        hand_items = guide_data.get("items", {})
        if not isinstance(hand_items, dict):
            return {}

        attach_results = {}

        for _, hand_detail in hand_items.items():
            if not hand_detail.get("rig_module") == "hand_type":
                continue
            if not hand_detail.get("rig_role") == "mirror":
                continue
            if not hand_detail.get("rig_part") == "mirrorRoot":
                continue

            side = hand_detail.get("rig_side")
            side_targets = wrist_targets.get(side, [])
            if not len(side_targets) == 1:
                if len(side_targets) > 1:
                    cmds.warning(
                        u"{} hand에 연결할 wrist가 여러 개입니다. UI에서 wrist를 선택하십시오.".format(
                            side
                        )
                    )
                else:
                    cmds.warning(
                        u"{} hand에 연결할 arm wrist를 찾을 수 없습니다.".format(side)
                    )
                continue

            target_id, target_detail = side_targets[0]
            target_node = target_detail.get("node")
            hand_root = hand_detail.get("node")
            if not target_node or not hand_root:
                continue
            if not cmds.objExists(target_node) or not cmds.objExists(hand_root):
                continue

            old_constraints = cmds.listConnections(
                hand_root,
                source=True,
                destination=False,
                type="parentConstraint"
            ) or []
            if old_constraints:
                cmds.delete(list(set(old_constraints)))

            constraint = cmds.parentConstraint(
                target_node,
                hand_root,
                maintainOffset=False
            )[0]

            hand_detail["rig_attachTarget"] = target_id
            attach_attr = "{}.rig_attachTarget".format(hand_root)
            if not cmds.objExists(attach_attr):
                try:
                    cmds.addAttr(hand_root, longName="rig_attachTarget", dataType="string")
                except RuntimeError:
                    pass
            if cmds.objExists(attach_attr):
                cmds.setAttr(attach_attr, target_id, type="string")

            constraint_attr = "{}.rig_attachTarget".format(constraint)
            if not cmds.objExists(constraint_attr):
                cmds.addAttr(
                    constraint,
                    longName="rig_attachTarget",
                    dataType="string"
                )
            cmds.setAttr(constraint_attr, target_id, type="string")
            attach_results[side] = target_id

        return attach_results


    def _restore_hand_attach_targets(self, guide_data):
        items = guide_data.get("items", {})
        if not isinstance(items, dict):
            return

        for detail in items.values():
            if not detail.get("rig_module") == "hand_type":
                continue
            if not detail.get("rig_role") == "mirror":
                continue
            if not detail.get("rig_part") == "mirrorRoot":
                continue
            if detail.get("rig_attachTarget"):
                continue

            hand_root = detail.get("node")
            if not hand_root or not cmds.objExists(hand_root):
                continue

            constraints = cmds.listConnections(
                hand_root,
                source=True,
                destination=False,
                type="parentConstraint"
            ) or []
            for constraint in list(set(constraints)):
                attr_path = "{}.rig_attachTarget".format(constraint)
                if not cmds.objExists(attr_path):
                    continue
                target_id = cmds.getAttr(attr_path)
                if target_id:
                    detail["rig_attachTarget"] = target_id
                    break


    def _resolve_hand_root_parent(self, hand_module, guide_joint_manager):
        if not isinstance(hand_module, dict):
            return None

        attach_target_id = None
        hand_items = hand_module.get("items", {})
        if not isinstance(hand_items, dict):
            return None

        for detail in hand_items.values():
            if not detail.get("rig_role") == "mirror":
                continue
            if not detail.get("rig_part") == "mirrorRoot":
                continue
            attach_target_id = detail.get("rig_attachTarget")
            if attach_target_id:
                break

        if not attach_target_id:
            return None

        target_detail = self.guide_data.get("items", {}).get(attach_target_id)
        if not target_detail:
            cmds.warning(
                u"hand attach target을 guide_data에서 찾을 수 없습니다: {}".format(
                    attach_target_id
                )
            )
            return None

        is_wrist = (
            target_detail.get("rig_module") == "arm_type"
            and target_detail.get("rig_role") == "main"
            and target_detail.get("rig_data") == "loc"
            and target_detail.get("rig_part") == "wrist"
        )
        if not is_wrist:
            cmds.warning(
                u"hand attach target이 arm wrist가 아닙니다: {}".format(
                    attach_target_id
                )
            )
            return None

        side_type_map = {"L": "left", "R": "right"}
        target_side = side_type_map.get(target_detail.get("rig_side"))
        target_build = target_detail.get("rig_build")
        if target_side is None or not target_build:
            return None

        hand_key = hand_module.get("key", (None, None, None))
        hand_side = hand_key[2] if len(hand_key) == 3 else None
        if not hand_side == target_detail.get("rig_side"):
            cmds.warning(
                u"hand와 attach wrist의 side가 일치하지 않습니다: hand={}, target={}".format(
                    hand_side,
                    target_detail.get("rig_side")
                )
            )
            return None

        target_alp = target_build if not target_build == "A" else ""
        return guide_joint_manager.build_name(
            item_name="wrist",
            side=target_side,
            extra_side="",
            alp=target_alp,
            num="",
            rule="",
            obj_type="joint"
        )

    def _mirror_matrix_x(self, matrix):
        """
        world X축 기준으로 matrix를 mirror한다.

        Maya xform matrix는 보통 아래 순서다:
            [xx, xy, xz, 0,
            yx, yy, yz, 0,
            zx, zy, zz, 0,
            tx, ty, tz, 1]

        X mirror는 단순 tx만 반전하면 위치만 맞고 회전축은 어색할 수 있다.
        그래서 X 관련 row/column 부호를 같이 바꾼다.
        """
        if not isinstance(matrix, (list, tuple)) or not len(matrix) == 16:
            return matrix

        m = list(matrix)

        mirror_indices = [
            1, 2,
            4,
            8,
            12
        ]

        for index in mirror_indices:
            m[index] = -m[index]

        return m

    def _replace_guide_id_side(self, guide_id, side):
        """
        guide id의 rig_side 토큰만 교체한다.

        id 구조:
            rig_module:rig_build:rig_side:rig_role:rig_data:rig_part
        """
        if not isinstance(guide_id, self._guideManager.string_type):
            return None

        tokens = guide_id.split(":")
        if len(tokens) < 3:
            return None

        tokens[2] = side
        return ":".join(tokens)

    def _make_unique_namespace(self, namespace):
        '''
        Maya scene에서 사용할 수 있는 고유 namespace를 만든다.

        buildIndex는 rig 데이터 구분용이고 namespace는 Maya node 충돌 방지용이다.
        둘을 같은 개념으로 묶지 않기 위해 별도 helper로 분리
        '''
        if not namespace:
            namespace = "guide"

        result = namespace
        count = 1

        while cmds.namespace(exists=result):
            result = "{}_{}".format(namespace, count)
            count += 1

        return result

    def _read_guide_data(self):
        '''
        현재 Maya scene에 올라와 있는 guide reference들을 다시 읽어서
        self.guide_data, self.main_guide_objs, self.extra_guide_objs를 갱신한다.

        사용 목적:
            UI를 새로 열었거나, 중간에 scene reference 상태가 바뀐 경우
            메모리에 들고 있던 self.guide_data를 scene 기준으로 다시 맞춘다.

        처리 순서:
            1. main guide reference를 먼저 읽는다.
            2. extra guide reference들을 순서대로 읽는다.
            3. 각 reference object를 setDefineData()로 변환한다.
            4. extra guide는 현재까지 쌓인 self.guide_data를 기준으로
               getNextBuildIndex()를 계산해서 A/B/C rig_build를 복원한다.

        주의:
            rig_build attr이 preset node에 실제로 저장되어 있지 않은 경우,
            scene의 reference 순서 기준으로 buildIndex를 다시 계산한다.
        '''
        self.guide_data = {
            "items": {},
            "containers": {},
            "invalid": []
        }

        self.main_guide_ref = None
        self.extra_guide_refs = []
        self.main_guide_objs = []
        self.extra_guide_objs = []

        self.main_guide_ref = self._find_main_presetRef()
        
        if self.main_guide_ref:
            self.main_guide_objs = self._guideManager.getReferenceObjects(self.main_guide_ref)
            main_data = self._guideManager.setDefineData(self.main_guide_objs)
            self._merge_guide_data(main_data)

        self.extra_guide_refs = self._find_extra_presetRef()
        for ref_node in self.extra_guide_refs:
            guide_objs = self._guideManager.getReferenceObjects(ref_node)
            if not guide_objs:
                continue

            buildIndex = self._guideManager.getNextBuildIndex(self.guide_data, guide_objs)
            guide_data = self._guideManager.setDefineData(guide_objs, buildIndex=buildIndex)

            self.extra_guide_objs.extend(guide_objs)
            self._merge_guide_data(guide_data)

        self.extra_guide_objs = list(set(self.extra_guide_objs))
        self._restore_hand_attach_targets(self.guide_data)
        return self.guide_data


    def _find_main_presetRef(self):
        guide_preset_ref = None
        if self.main_guide_ref is None:
            find_refs = cmds.ls(type = "reference")
            
            for x in find_refs:
                
                if x in self.validate_guide_refs:
                    
                    guide_preset_ref = x
                    break
        #print (">> guide_preset_ref : {}" .format(guide_preset_ref))
        return guide_preset_ref
                
    def _find_extra_presetRef(self):
        extra_guide_refs = []
        all_references = cmds.ls(type="reference") or []

        # validate_extra_guide_refs에는 기본 reference 이름만 적어둔다.
        # 같은 preset을 여러 번 불러오면 Maya가 bipad_armRN, bipad_arm_1RN처럼
        # reference node 이름을 늘릴 수 있으므로 prefix 기준으로도 검사한다.
        valid_prefixes = []
        for ref_name in self.validate_extra_guide_refs:
            prefix = ref_name
            if prefix.endswith("RN"):
                prefix = prefix[:-2]
            valid_prefixes.append(prefix)

            if prefix.startswith("guide_"):
                valid_prefixes.append(prefix[len("guide_"):])

        for x in all_references:
            if x in self.validate_extra_guide_refs:
                extra_guide_refs.append(x)
                continue

            for prefix in valid_prefixes:
                is_base_reference = x == prefix + "RN"
                is_numbered_reference = (
                    x.startswith(prefix + "_") and x.endswith("RN")
                )
                if is_base_reference or is_numbered_reference:
                    extra_guide_refs.append(x)
                    break

        return extra_guide_refs
        



    def _find_main_refObjects(self):
        if self.main_guide_ref is None:
            self._find_main_presetRef()
        if self.main_guide_ref is None:
            return
        main_guide_objs = self._guideManager.getReferenceObjects(self.main_guide_ref)
        return main_guide_objs
    
    def _find_data_from_ref(self , ref_node):
        if not ref_node:
            return
        guide_objs = self._guideManager.getReferenceObjects(ref_node)
        data = self._guideManager.setDefineData(guide_objs)
        return data

    #--------------------------------------------------UI
    def _loadPrev(self):
        data = None
        if os.path.exists(self._prevPath):
            try:
                with io.open(self._prevPath , "r" , encoding="utf-8") as f:
                    data = json.load(f)
            except:
                print(u">> 에러 : _prev.json 데이터 읽기 실패")
        if data:
            self._prevData.update(data)

            for key , widgetName , getAttr , setAttr , default in self._prevMap:
                widget = getattr(self.ui , widgetName)
                value = self._prevData.get(key , default)
                getattr(widget , setAttr)(value)


    def _savePrev(self):
        for key , widgetName , getAttr , setAttr , default in self._prevMap:
            widget = getattr(self.ui , widgetName)
            self._prevData[key] = getattr(widget , getAttr)()

        upData = {}
        if os.path.exists(self._prevPath):
            try:
                with io.open(self._prevPath , "r" , encoding= "utf-8") as f:
                    upData = json.load(f)
            except Exception as e:
                print (u">> 에러 : _prev.json 데이터 읽기 실패\n>> 초기화 후 덮어쓰기 실행 ")
        upData.update(self._prevData)
        try:
            with io.open(self._prevPath  , "w", encoding= "utf-8") as f:
                try:
                    json_str = json.dumps(upData, ensure_ascii=False, indent=4)
                    if isinstance(json_str, str):
                        json_str = json_str.decode('utf-8')
                    f.write(json_str)
                except:
                    json.dump(upData, f, ensure_ascii=False, indent=4)
            print (u">> _prev.json 가 저장되었습니다.")
        except Exception as e:
            print(u">> savePrev 에러 : _prev.json 저장 중 오류 발생: {}".format(e))



    def init_ui(self, uiPath):
        if not os.path.exists(uiPath):
            raise ValueError(u">> {} 경로에 {}가 없습니다.".format(config.AUTO_RIG_ROOT, uiPath))
        
        f = QtCore.QFile(uiPath)
        f.open(QtCore.QFile.ReadOnly)
        loader = QtUiTools.QUiLoader()
        
        # 주의: parentWidget을 self로 바로 주지 말고, 변수로 받습니다.
        self.ui = loader.load(f, parentWidget=None) 
        f.close()

        main_layout = QtWidgets.QVBoxLayout(self)
        main_layout.setContentsMargins(0, 0, 0, 0) 
        main_layout.addWidget(self.ui)
        self.setWindowFlags(QtCore.Qt.Window)

    def closeEvent(self , event):
        try:
            self._savePrev()
        except Exception as e:
            print(u">> savePrev 종료 중 저장 실패: {}".format(e))
        
def show():
    autoRigUI = DesignerUI()
    autoRigUI.show()
