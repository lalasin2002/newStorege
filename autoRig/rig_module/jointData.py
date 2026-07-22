# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om
import  os,copy ,json , re


from autoRig_config import AUTO_RIG_ROOT, GUIDE_RIGS_PATH
from tools import controlAttribute , controlObject , naming , createObject , match , grouping




class JointDataManager(object):
    
    def __init__(self):
        try:
            self.string_type = basestring
        except NameError:
            self.string_type = str

        self.string_attrs = [
            "rig_id",
            "rig_module",
            "rig_build",
            "rig_side",
            "rig_part",
            "rig_index",
            "rig_system",
            "rig_jointRole"
        ]
        '''
        참고 
        "rig_id" : "arm:A:L:shoulder"
        "rig_module": "arm_type"
        "rig_build": "A",
        "rig_side": "L",
        "rig_part": "shoulder",
        "rig_system": "guide",
        "rig_jointRole": "primary",

        
        '''



    def setJointTag(self , joint_item , dict_data):
        if not self._check_joint(joint_item):
            raise ValueError(u"setJointTag : 올바른 joint가 아닙니다: {}".format(joint_item))
        if not isinstance(dict_data, dict):
            raise TypeError(u"setJointTag : dict_data는 dict여야 합니다.")
        invalid_attrs = [attr for attr in dict_data if attr not in self.string_attrs]
        if invalid_attrs:
            raise ValueError(u"setJointTag : 지원하지 않는 tag입니다: {}".format(invalid_attrs))
        result = {}
        for attr_name, value in dict_data.items():
            if value is None:
                value = ""
            result[attr_name] = controlAttribute.addStringAttr(joint_item,attr_name,str(value))
        
        return result

    def getJointTag(self , joint_item ,attr_list=None):
        if attr_list is not None and not isinstance(attr_list , (list, tuple)):
            raise ValueError(u"getJointTag : {} 는 리스트 /튜플이 아닙니다.".format(joint_item))
        if not self._check_joint(joint_item):
            raise ValueError(u"getJointTag : 올바른 joint가 아닙니다: {}".format(joint_item))
        if attr_list is None:
            attr_list = self.string_attrs

        if not self._check_tags(joint_item, attr_list):
            raise ValueError(
                u"getJointTag : required tags do not exist: "
                u"joint={}, attrs={}".format(joint_item, attr_list)
            )

        return {
            attr: cmds.getAttr("{}.{}".format(joint_item, attr))
            for attr in attr_list
        }
        
    def getRangeJoints(self , joint_items , rangeTag_data ):
        if not isinstance(joint_items , (list , tuple)):
            raise ValueError(u"getRangeJoints : {}은 리스트/튜플이 아닙니다".format(joint_items))
        if not all(self._check_joint(x) for x in joint_items):
            raise ValueError(u"getRangeJoints : 올바른 joint 리스트/튜플이 아닙니다: {}".format(joint_items))
        if not isinstance(rangeTag_data , list):
            raise ValueError(u"getRangeJoints : rangeTag_date은 리스트 가 아닙니다. [(key, value) , (key ,value)]")
        if not len(rangeTag_data) == 2:
            raise ValueError(u"getRangeJoints : rangeTag_date 리스트가 2개 이어야합니다. [(key, value) , (key ,value)]")
        if not all(isinstance(data , tuple) for data in rangeTag_data):
            raise ValueError(u"getRangeJoints : rangeTag_date 요소가 튜플이 아닙니다. [(key, value) , (key ,value)]")
        if not all(len(data) ==2 for data in rangeTag_data):
            raise ValueError(u"getRangeJoints : rangeTag_date 요소가 2개 이어야 합니다.  [(key, value) , (key ,value)]")
        if not all(isinstance(element, self.string_type) for data in rangeTag_data for element in data):
            raise ValueError(u"getRangeJoints : 모든 요소가 문자열이 아닙니다.  [(key, value) , (key ,value)]")
        
        startKey , startValue = rangeTag_data[0]
        endKey , endValue = rangeTag_data[1]

        startIndex = None 
        endIndex = None

        for  i ,jnt in enumerate(joint_items):
            if startIndex is None:
                if cmds.objExists("{}.{}".format(jnt ,startKey )):
                    if cmds.getAttr("{}.{}".format(jnt ,startKey )) == startValue:
                        startIndex = i  
            if endIndex is None:
                if cmds.objExists("{}.{}".format(jnt ,endKey )):
                    if cmds.getAttr("{}.{}".format(jnt ,endKey )) == endValue:
                        endIndex = i
            if startIndex is not None and endIndex is not None:
                break

        if startIndex is None or endIndex is None:
            raise ValueError(u"getRangeJoints : joint_items에 rangeTag_data와 매칭되는 데이터가 없습니다.")
        
        if startIndex > endIndex:
            raise ValueError(
                u"getRangeJoints : start joint가 end joint보다 뒤에 있습니다. startIndex={}, endIndex={}".format(startIndex, endIndex)
            )

        return joint_items[startIndex : endIndex  + 1]

    def getSearchJoints(self , joint_items ,rangeTag_data  ):
        if not isinstance(joint_items , (list , tuple)):
            raise ValueError(u"getSearchJoints : {}은 리스트/튜플이 아닙니다".format(joint_items))
        if not all(self._check_joint(x) for x in joint_items):
            raise ValueError(u"getSearchJoints : 올바른 joint 리스트/튜플이 아닙니다: {}".format(joint_items))
        if not isinstance(rangeTag_data , list):
            raise ValueError(u"getSearchJoints : rangeTag_date은 리스트 가 아닙니다. [(key, value) , (key ,value)]")
        if not all(isinstance(data , tuple) for data in rangeTag_data):
            raise ValueError(u"getSearchJoints : rangeTag_date 요소가 튜플이 아닙니다. [(key, value) , (key ,value)]")
        if not all(isinstance(element, self.string_type) for data in rangeTag_data for element in data):
            raise ValueError(u"getSearchJoints : 모든 요소가 문자열이 아닙니다.  [(key, value) , (key ,value)]")
        
        joints = []
        for jnt in joint_items:
            for attr , value in rangeTag_data:
                if cmds.objExists("{}.{}".format(jnt , attr)):
                    if cmds.getAttr("{}.{}".format(jnt , attr)) == value:
                        joints.append(jnt)
        return joints



    #--------helper
    def _check_joint(self , joint_item):
        if not isinstance(joint_item ,self.string_type ):
            return False
        if not cmds.objExists(joint_item):
            return False
        if not cmds.objectType(joint_item) == "joint":
            return False
        return True


    def _check_tags(self , joint_item , attr_list):
        if not self._check_joint(joint_item ):
            return False
        if not isinstance(attr_list , (list , tuple)):
            return False
        is_exist_attr = [cmds.objExists("{}.{}".format(joint_item, attr))for attr in attr_list]
        if not all(is_exist_attr):
            return False
        return True


# JointBuilder에는 Maya attribute 저장 책임을 넣지 않습니다.
# 아래 함수가 create_guide_joint()의 build_results를 받은 뒤,
# plan에 포함된 metadata를 실제 Guide Joint attribute로 기록합니다.
def writeGuideJointBuildResults(build_results, joint_data_manager):
    """build_results의 모든 Joint metadata를 Maya scene에 저장합니다."""
    if not isinstance(build_results, dict):
        raise TypeError(
            u"writeGuideJointBuildResults : build_results는 dict여야 합니다."
        )
    if not callable(getattr(joint_data_manager, "setJointTag", None)):
        raise TypeError(
            u"writeGuideJointBuildResults : joint_data_manager에 "
            u"setJointTag() 메서드가 필요합니다."
        )

    build_plans = []

    # build_plans 리스트 자체를 함수에 전달합니다.
    # _collectJointBuildPlans()는 True/False를 반환하지 않고,
    # 발견한 build plan을 이 리스트에 직접 추가합니다.
    _collectJointBuildPlans(build_results, build_plans)

    # 함수의 반환값 대신, 실행 후 build_plans가 비었는지 확인하여
    # build plan을 하나라도 찾았는지 판단합니다.
    if not build_plans:
        raise ValueError(
            u"writeGuideJointBuildResults : Joint build plan을 찾을 수 없습니다."
        )



    required_metadata = list(joint_data_manager.string_attrs)

    # 실제 attribute를 만들기 전에 모든 plan을 먼저 검증합니다.
    # 오류가 발생했을 때 일부 Joint에만 tag가 남는 상황을 줄이기 위함입니다.
    tag_tasks = []
    used_joints = set()
    used_ids = set()

    for build_plan in build_plans:
        joint_plans = build_plan.get("joints", [])

        for joint_plan in joint_plans:
            joint_item = joint_plan.get("joint_name")
            if not joint_item or not cmds.objExists(joint_item):
                raise ValueError(
                    u"writeGuideJointBuildResults : Joint가 존재하지 않습니다: {}".format(
                        joint_item
                    )
                )
            if not cmds.objectType(joint_item) == "joint":
                raise ValueError(
                    u"writeGuideJointBuildResults : joint 타입이 아닙니다: {}".format(
                        joint_item
                    )
                )

            metadata = joint_plan.get("metadata")
            if not isinstance(metadata, dict):
                raise ValueError(
                    u"writeGuideJointBuildResults : metadata가 없습니다: {}".format(
                        joint_item
                    )
                )

            missing_attrs = [
                attr_name
                for attr_name in required_metadata
                if attr_name not in metadata
            ]
            if missing_attrs:
                raise ValueError(
                    u"writeGuideJointBuildResults : 필수 metadata가 없습니다: "
                    u"joint={}, attrs={}".format(joint_item, missing_attrs)
                )

            rig_id = metadata.get("rig_id")
            if joint_item in used_joints:
                raise ValueError(
                    u"writeGuideJointBuildResults : Joint가 중복되었습니다: {}".format(
                        joint_item
                    )
                )
            if rig_id in used_ids:
                raise ValueError(
                    u"writeGuideJointBuildResults : rig_id가 중복되었습니다: {}".format(
                        rig_id
                    )
                )

            # Builder가 명시한 metadata만 저장합니다.
            # group과 기타 build 정보는 실제 scene hierarchy에서 확인하므로
            # 별도의 string tag로 중복 저장하지 않습니다.
            tag_data = copy.deepcopy(metadata)

            used_joints.add(joint_item)
            used_ids.add(rig_id)
            tag_tasks.append((joint_item, tag_data))

    if not tag_tasks:
        raise ValueError(
            u"writeGuideJointBuildResults : 저장할 Guide Joint가 없습니다."
        )

    result = {}
    for joint_item, tag_data in tag_tasks:
        result[joint_item] = joint_data_manager.setJointTag(
            joint_item,
            tag_data
        )

    return result


def readGuideJointData(joint_data_manager):
    """씬에 저장된 Guide Joint tag를 다시 읽습니다."""
    if not callable(getattr(joint_data_manager, "getJointTag", None)):
        raise TypeError(
            u"readGuideJointData : joint_data_manager에 "
            u"getJointTag() 메서드가 필요합니다."
        )

    result = {}
    joint_items = cmds.ls(type="joint", long=True) or []

    for joint_item in joint_items:
        attr_paths = [
            "{}.{}".format(joint_item, attr_name)
            for attr_name in joint_data_manager.string_attrs
        ]
        if not all(cmds.objExists(attr_path) for attr_path in attr_paths):
            continue

        tag_data = joint_data_manager.getJointTag(joint_item)
        if not tag_data.get("rig_system") == "guide":
            continue

        module_key = (
            tag_data.get("rig_module"),
            tag_data.get("rig_build"),
            tag_data.get("rig_side")
        )
        joint_record = {
            "node": joint_item,
            "tags": tag_data
        }
        result.setdefault(module_key, []).append(joint_record)

    # message multi index나 scene 검색 순서에 의존하지 않고 저장된 index로 정렬합니다.
    for module_records in result.values():
        module_records.sort(
            key=lambda record: (
                int(record["tags"].get("rig_index") or 0),
                record["tags"].get("rig_id") or ""
            )
        )

    return result


def _collectJointBuildPlans(data, results):
    """head와 hand처럼 중첩된 build_results에서 build plan을 재귀 검색합니다."""

    # data는 현재 검사할 dict, list, tuple 또는 그 내부 값입니다.
    # results는 호출한 쪽의 build_plans와 동일한 리스트 객체입니다.
    # 따라서 results.append()의 결과가 호출한 쪽 build_plans에도 남습니다.
    # 이 함수의 목적은 성공 여부 반환이 아니라 모든 build plan 수집이므로
    # 별도의 True/False 반환값을 사용하지 않습니다.
    if isinstance(data, dict):

        # 현재 dict가 JointBuilder 결과인지 확인하기 위해
        # "joints" key의 값을 가져옵니다.
        joint_plans = data.get("joints")

        # "joints" 값이 list라면 현재 dict 전체가 하나의 build plan입니다.
        if isinstance(joint_plans, list):

            # Joint 하나가 아니라 "joints"를 포함한 build plan 전체를
            # 호출한 쪽의 build_plans 리스트에 추가합니다.
            results.append(data)

            # 현재 build plan은 이미 찾았으므로 내부를 더 탐색하지 않고
            # 현재 재귀 호출만 종료합니다. 값을 반환하는 return이 아닙니다.
            return

        # 현재 dict에 "joints" 리스트가 없다면 root, legs, result 같은
        # 모든 value를 다시 함수에 전달하여 한 단계 더 안쪽을 탐색합니다.
        for value in data.values():
            _collectJointBuildPlans(value, results)

        # 현재 dict의 모든 value 탐색이 끝났으므로 현재 호출을 종료합니다.
        # return만 작성하면 Python의 실제 반환값은 None입니다.
        return

    # 현재 data가 list 또는 tuple이면 그 안의 항목을 하나씩 탐색합니다.
    # 여기서도 반환값을 모으는 것이 아니라 같은 results 리스트를 계속
    # 전달하므로 발견된 모든 build plan이 하나의 리스트에 누적됩니다.
    if isinstance(data, (list, tuple)):
        for value in data:
            _collectJointBuildPlans(value, results)

    # 문자열, 숫자, None처럼 dict/list/tuple이 아닌 값은 수집 대상이
    # 아니므로 아무 작업 없이 함수가 끝나며 반환값은 None입니다.


class itemMessageManager():
    def __init__(self):
        try:
            self.string_type = basestring
        except NameError:
            self.string_type = str
        #개발중

    






    
