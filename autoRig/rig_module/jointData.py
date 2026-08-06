# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om
import  os,copy ,json , re


from autoRig_config import AUTO_RIG_ROOT, GUIDE_RIGS_PATH
from tools import controlAttribute , controlObject , naming , createObject , match , grouping




class JointDataManager(object):
    '''
    Maya Joint에 autoRig 식별 정보를 String attribute로 기록하고,
    저장된 정보를 다시 검색하거나 수정하기 위한 데이터 관리 클래스입니다.

    이 클래스가 관리하는 tag는 rig_id, rig_module, rig_build, rig_side,
    rig_part, rig_index, rig_system, rig_jointRole입니다.
    '''
    
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
    def editJointTag(self,  joint_item , dict_data):
        '''
        Joint에 이미 만들어져 있는 autoRig String tag의 값을 수정합니다.

        새로운 attribute를 생성하지 않으며, JointDataManager에서 지원하는 tag만
        수정할 수 있습니다. 전달된 tag를 모두 먼저 검증한 뒤 값을 입력하므로
        일부 tag만 변경되고 중간에 실패하는 상황을 방지합니다.

        Args:
            joint_item (str): tag 값을 수정할 Maya Joint 이름.
            dict_data (dict): 수정할 tag 이름과 새 값의 딕셔너리.

        Returns:
            dict: 수정한 tag 이름과 실제 attribute 경로의 대응 정보.

        Raises:
            ValueError: Joint, tag 이름, attribute 타입이 올바르지 않을 때.
            TypeError: dict_data가 dict 타입이 아닐 때.
        '''
        if not self._check_joint(joint_item):
            raise ValueError(u"editJointTag : 올바른 joint가 아닙니다: {}".format(joint_item))
        if not isinstance(dict_data, dict):
            raise TypeError(u"editJointTag : dict_data는 dict여야 합니다.")

        invalid_attrs = [attr for attr in dict_data if attr not in self.string_attrs]
        if invalid_attrs:
            raise ValueError(
                u"editJointTag : 지원하지 않는 tag입니다: {}".format(invalid_attrs)
            )

        missing_attrs = [
            attr_name
            for attr_name in dict_data
            if not cmds.attributeQuery(
                attr_name,
                node=joint_item,
                exists=True
            )
        ]
        if missing_attrs:
            raise ValueError(
                u"editJointTag : Joint에 존재하지 않는 tag입니다: "
                u"joint={}, attrs={}".format(joint_item, missing_attrs)
            )

        non_string_attrs = [
            attr_name
            for attr_name in dict_data
            if cmds.getAttr(
                "{}.{}".format(joint_item, attr_name),
                type=True
            ) != "string"
        ]
        if non_string_attrs:
            raise ValueError(
                u"editJointTag : string 타입이 아닌 tag입니다: "
                u"joint={}, attrs={}".format(joint_item, non_string_attrs)
            )

        result = {}
        for attr_name , value in dict_data.items():
            if value is None:
                value = ""
            cmds.setAttr(
                "{}.{}".format(joint_item, attr_name),
                str(value),
                type="string"
            )
            result[attr_name] = "{}.{}" .format(joint_item , attr_name)
        return result
        

    def setJointTag(self , joint_item , dict_data):
        '''
        Joint에 autoRig가 사용하는 String tag를 생성하고 초기값을 기록합니다.

        이미 같은 tag가 존재하면 controlAttribute.addStringAttr()의 처리 규칙에
        따라 해당 attribute를 사용하며, None 값은 빈 문자열로 저장합니다.

        Args:
            joint_item (str): tag를 기록할 Maya Joint 이름.
            dict_data (dict): 생성할 tag 이름과 값의 딕셔너리.

        Returns:
            dict: 생성하거나 설정한 tag 이름과 attribute 경로의 대응 정보.
        '''
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
        '''
        Joint에 저장된 autoRig String tag를 읽어 딕셔너리로 반환합니다.

        attr_list를 생략하면 JointDataManager가 관리하는 모든 tag를 읽습니다.
        요청한 tag가 하나라도 없으면 불완전한 데이터를 반환하지 않고 오류를
        발생시킵니다.

        Args:
            joint_item (str): tag를 읽을 Maya Joint 이름.
            attr_list (list or tuple, optional): 읽을 tag 이름 목록.

        Returns:
            dict: tag 이름과 현재 저장값의 대응 정보.
        '''
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
        '''
        정렬된 Joint 목록에서 시작 tag와 종료 tag 사이의 구간을 추출합니다.

        rangeTag_data의 첫 번째 조건과 일치하는 Joint를 시작점으로 사용하고,
        두 번째 조건과 일치하는 Joint를 종료점으로 사용합니다. 시작과 종료
        Joint를 모두 포함한 목록을 반환합니다.

        Args:
            joint_items (list or tuple): 순서가 유지된 Maya Joint 목록.
            rangeTag_data (list): [(시작 tag, 값), (종료 tag, 값)] 형식의 조건.

        Returns:
            list or tuple: 시작 Joint부터 종료 Joint까지의 구간.
        '''
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
        '''
        Joint 목록에서 하나 이상의 tag 검색 조건과 일치하는 Joint를 찾습니다.

        검색 조건은 OR 방식으로 처리합니다. 하나의 Joint가 여러 조건을
        만족하더라도 결과 목록에는 한 번만 추가됩니다.

        Args:
            joint_items (list or tuple): 검색할 Maya Joint 목록.
            rangeTag_data (list): [(tag 이름, 검색값), ...] 형식의 조건 목록.

        Returns:
            list: 조건 중 하나 이상을 만족한 Joint 목록.
        '''
        if not isinstance(joint_items , (list , tuple)):
            raise ValueError(u"getSearchJoints : {}은 리스트/튜플이 아닙니다".format(joint_items))
        if not all(self._check_joint(x) for x in joint_items):
            raise ValueError(u"getSearchJoints : 올바른 joint 리스트/튜플이 아닙니다: {}".format(joint_items))
        if not isinstance(rangeTag_data , list):
            raise ValueError(u"getSearchJoints : rangeTag_date은 리스트 가 아닙니다. [(key, value) , (key ,value)]")
        if not all(isinstance(data , tuple) for data in rangeTag_data):
            raise ValueError(u"getSearchJoints : rangeTag_date 요소가 튜플이 아닙니다. [(key, value) , (key ,value)]")
        if not all(len(data) == 2 for data in rangeTag_data):
            raise ValueError(u"getSearchJoints : rangeTag_date 요소는 2개여야 합니다. [(key, value) , (key ,value)]")
        if not all(isinstance(element, self.string_type) for data in rangeTag_data for element in data):
            raise ValueError(u"getSearchJoints : 모든 요소가 문자열이 아닙니다.  [(key, value) , (key ,value)]")
        
        joints = []
        for jnt in joint_items:
            for attr , value in rangeTag_data:
                if cmds.objExists("{}.{}".format(jnt , attr)):
                    if cmds.getAttr("{}.{}".format(jnt , attr)) == value:
                        joints.append(jnt)
                        break
        return joints



    #--------helper
    def _check_joint(self , joint_item):
        '''
        전달값이 현재 Maya 씬에 존재하는 Joint 노드인지 확인합니다.

        Returns:
            bool: 문자열이며 실제 Joint 노드이면 True, 아니면 False.
        '''
        if not isinstance(joint_item ,self.string_type ):
            return False
        if not cmds.objExists(joint_item):
            return False
        if not cmds.objectType(joint_item) == "joint":
            return False
        return True


    def _check_tags(self , joint_item , attr_list):
        '''
        지정한 Joint에 요청한 tag attribute가 모두 존재하는지 확인합니다.

        Returns:
            bool: Joint와 모든 tag가 유효하면 True, 아니면 False.
        '''
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
    '''
    Guide Joint 생성 결과에 포함된 metadata를 Maya Joint attribute로 저장합니다.

    중첩된 build_results 안에서 모든 Joint build plan을 찾아낸 뒤, 실제 Joint와
    필수 metadata, 중복 Joint 및 중복 rig_id를 먼저 검증합니다. 전체 검증이
    성공한 경우에만 각 Joint에 tag를 기록하여 일부 Joint에만 데이터가 저장되는
    상황을 방지합니다.

    Args:
        build_results (dict): JointBuilder가 반환한 중첩 build 결과.
        joint_data_manager (JointDataManager): tag를 기록할 데이터 관리자.

    Returns:
        dict: Joint 이름과 생성된 attribute 정보의 대응 결과.
    '''
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
    '''
    Maya 씬의 Joint 중 rig_system이 guide인 Joint 데이터를 수집합니다.

    각 Guide Joint의 필수 tag를 검증하고, rig_module, rig_build, rig_side를
    조합한 module key로 데이터를 분류합니다. 같은 module에 속한 Joint는
    rig_index 순서로 정렬하며, 숫자로 변환할 수 없는 index는 뒤쪽으로 보내
    상위 데이터 검증 단계에서 오류 내용을 처리할 수 있게 합니다.

    Args:
        joint_data_manager (JointDataManager): tag 목록과 읽기 기능을 제공할 관리자.

    Returns:
        dict: (rig_module, rig_build, rig_side)를 key로 사용하는 Joint 데이터.
    '''
    if not callable(getattr(joint_data_manager, "getJointTag", None)):
        raise TypeError(
            u"readGuideJointData : joint_data_manager에 "
            u"getJointTag() 메서드가 필요합니다."
        )

    result = {}
    # Joint 이름은 naming rule에서 고유하게 생성하므로 short name으로 수집합니다.
    # full DAG path를 저장하면 parent/unparent 작업으로 계층이 바뀔 때 기존
    # node 값이 무효화되지만, short name은 계층 변경과 관계없이 유지됩니다.
    joint_items = cmds.ls(type="joint") or []

    for joint_item in joint_items:
        attr_paths = [
            "{}.{}".format(joint_item, attr_name)
            for attr_name in joint_data_manager.string_attrs
        ]
        if not all(cmds.objExists(attr_path) for attr_path in attr_paths):
            rig_system_attr = "{}.rig_system".format(joint_item)
            if (
                cmds.objExists(rig_system_attr)
                and cmds.getAttr(rig_system_attr) == "guide"
            ):
                missing_attrs = [
                    attr_name
                    for attr_name, attr_path in zip(
                        joint_data_manager.string_attrs,
                        attr_paths
                    )
                    if not cmds.objExists(attr_path)
                ]
                raise ValueError(
                    u"readGuideJointData : Guide Joint의 필수 tag가 누락되었습니다: "
                    u"joint={}, attrs={}".format(joint_item, missing_attrs)
                )
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
    # 잘못된 rig_index는 여기에서 중단하지 않고 뒤로 보내 getBase_joint_data가 검증하게 합니다.
    def guide_joint_sort_key(record):
        '''
        Guide Joint 레코드를 rig_index와 rig_id 순서로 정렬할 key를 만듭니다.

        올바르지 않은 rig_index 때문에 전체 데이터 읽기가 중단되지 않도록
        변환 실패 항목에는 별도의 우선순위를 부여해 정상 항목 뒤로 보냅니다.
        '''
        rig_index = record["tags"].get("rig_index")
        try:
            rig_index = int(rig_index)
            invalid_index = 0
        except (TypeError, ValueError):
            rig_index = 0
            invalid_index = 1

        return (
            invalid_index,
            rig_index,
            record["tags"].get("rig_id") or ""
        )

    for module_records in result.values():
        module_records.sort(key=guide_joint_sort_key)

    return result


def _collectJointBuildPlans(data, results):
    '''
    중첩된 build_results를 재귀 탐색하여 Joint build plan을 모두 수집합니다.

    "joints" key의 값이 list인 dict를 하나의 build plan으로 판단하고, 발견한
    dict를 호출자가 전달한 results 목록에 직접 추가합니다.

    Args:
        data: 현재 탐색할 dict, list, tuple 또는 내부 데이터.
        results (list): 발견한 build plan을 누적할 목록.
    '''

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


def _findGuideParentId(joint_item):
    '''
    Joint의 상위 계층에서 가장 가까운 Guide Joint의 rig_id를 찾습니다.

    Joint 사이에 offset group이나 일반 transform이 있어도 부모 방향으로 계속
    탐색합니다. rig_system 값이 "guide"이고 rig_id attribute가 존재하는 첫
    번째 상위 노드를 Guide 부모로 판단합니다.

    Args:
        joint_item (str): 부모 Guide Joint를 검색할 시작 Joint 또는 DAG 노드.

    Returns:
        str or None: 가장 가까운 Guide 부모의 rig_id. 없으면 None.
    '''
    parents = cmds.listRelatives(
        joint_item,
        parent=True,
        fullPath=True
    ) or []

    while parents:
        parent_item = parents[0]

        rig_system_attr = "{}.rig_system".format(parent_item)
        rig_id_attr = "{}.rig_id".format(parent_item)

        if (
            cmds.objExists(rig_system_attr)
            and cmds.objExists(rig_id_attr)
            and cmds.getAttr(rig_system_attr) == "guide"
        ):
            return cmds.getAttr(rig_id_attr)

        parents = cmds.listRelatives(
            parent_item,
            parent=True,
            fullPath=True
        ) or []

    return None

class jointControlManager():
    '''
    Base Rig Joint 생성 과정에서 필요한 Joint 편집 작업을 모아둔 클래스입니다.

    부모 transform 제거, 단일 Joint 복제, 표시 상태와 반지름 설정,
    preferredAngle 및 jointOrient 입력을 일관된 검증 절차로 처리합니다.
    '''

    def __init__(self):
        '''
        Python 버전에 맞는 문자열 타입과 최근 작업한 노드 정보를 초기화합니다.
        '''
        try:
            self.string_type = basestring
        except NameError:
            self.string_type = str

        self.currentJoint = None 
        self.otherObject = None 

    def unParent_transform(self , joint_item , delete_transform = True):
        '''
        Joint 바로 위의 일반 transform을 제거하고 상위 계층에 다시 연결합니다.

        부모가 이미 Joint이면 계층을 변경하지 않습니다. 부모가 offset group과
        같은 일반 transform이면 Joint를 그 transform의 부모로 먼저 이동하여
        월드 변환을 유지합니다. delete_transform이 True이면 Joint를 옮긴 뒤
        기존 부모 transform을 삭제합니다.

        Args:
            joint_item (str): 부모 transform에서 분리할 Maya Joint.
            delete_transform (bool, optional): 기존 부모 transform 삭제 여부.

        Returns:
            tuple: (새로운 직접 부모 Joint 또는 None,
                    삭제되지 않고 남은 기존 transform 또는 None).
        '''
        parent_joint = None
        parent_transform = None

        if not self._check_joint(joint_item):
            raise ValueError(u"unParent_transform : {}는 joint 타입이 아닙니다.".format(joint_item))

        parents = cmds.listRelatives(
            joint_item,
            parent=True,
            fullPath=True
        ) or []
        if not parents:
            self.currentJoint = joint_item
            return parent_joint, parent_transform

        direct_parent = parents[0]
        if cmds.nodeType(direct_parent) == "joint":
            parent_joint = direct_parent
            self.currentJoint = joint_item
            return parent_joint, parent_transform

        parent_transform = direct_parent
        grand_parents = cmds.listRelatives(
            parent_transform,
            parent=True,
            fullPath=True
        ) or []

        if grand_parents:
            target_parent = grand_parents[0]
            cmds.parent(joint_item, target_parent, absolute=True)
            if cmds.nodeType(target_parent) == "joint":
                parent_joint = target_parent
        else:
            cmds.parent(joint_item, world=True, absolute=True)

        if delete_transform and cmds.objExists(parent_transform):
            # 이 함수에서 parent_transform은 Guide Joint에 삽입된 offset group입니다.
            # 위에서 Joint를 상위 계층으로 먼저 이동했으므로 기존 offset group은
            # 더 이상 필요하지 않습니다. 빈 그룹인지 다시 검사하여 삭제를
            # 건너뛰지 않고, delete_transform=True의 요청대로 실제 삭제합니다.
            cmds.delete(parent_transform)

            # cmds.delete() 호출 뒤에도 노드가 남아 있다면 잠금 등의 이유로
            # 삭제가 실패한 것이므로 조용히 넘어가지 않고 원인을 알립니다.
            if cmds.objExists(parent_transform):
                raise RuntimeError(
                    u"unParent_transform : 부모 transform 삭제에 실패했습니다: "
                    u"{}".format(parent_transform)
                )

            parent_transform = None

        self.currentJoint = joint_item
        return parent_joint , parent_transform

    def duplicate_joint(self , joint_item , rename_string  , parent_item = None):
        '''
        자식 계층을 복제하지 않고 지정한 Joint 하나만 복제합니다.

        복제한 Joint에 새 이름을 적용하고, parent_item이 전달되면 해당 노드
        아래로 배치합니다. 원본 Joint의 하위 Joint 체인을 중복 생성하지 않기
        위해 Maya duplicate 명령의 parentOnly 옵션을 사용합니다.

        Args:
            joint_item (str): 복제할 원본 Maya Joint.
            rename_string (str): 복제 Joint에 적용할 이름.
            parent_item (str, optional): 복제 Joint를 연결할 부모 노드.

        Returns:
            str: 새로 복제된 Joint 이름.
        '''
        exist_joint = self._check_joint(joint_item)
        

        if not exist_joint:
            raise ValueError(u"duplicate_joint: {}는 joint 타입이 아닙니다.".format(joint_item))
        if not isinstance(rename_string , self.string_type) or not rename_string:
            raise ValueError(u"duplicate_joint: {}는 문자열이 아닙니다.".format(rename_string))
        if parent_item and not cmds.objExists(parent_item):
            raise ValueError(
                u"duplicate_joint: parent_item이 존재하지 않습니다: {}".format(
                    parent_item
                )
            )

        duplicate_joint = cmds.duplicate(
            joint_item,
            name=rename_string,
            parentOnly=True
        )[0]
        if parent_item:
            cmds.parent(duplicate_joint , parent_item)


        self.currentJoint = duplicate_joint
        return duplicate_joint

    def set_jointState(self , joint_item , state_num = 0  , returnString = False):
        '''
        Maya Joint의 drawStyle 값을 설정하여 뷰포트 표시 방식을 변경합니다.

        state_num은 0에서 3 사이로 제한되며 범위를 벗어나면 가장 가까운
        유효값으로 보정합니다. returnString이 True이면 숫자와 함께 사람이
        읽을 수 있는 표시 상태 이름을 반환합니다.

        Args:
            joint_item (str): 표시 상태를 변경할 Maya Joint.
            state_num (int, optional): 적용할 drawStyle 번호.
            returnString (bool, optional): 상태 이름 반환 여부.

        Returns:
            tuple: (Joint 이름, 상태 번호 또는 상태 이름).
        '''

        # state_num : 0 = bone , 1 = box , 2 = None , 3 =  joint
        return_string ={0 : "Bone" , 1 : "Multi-child as Box" , 2 : "None" , 3 : "Joint"}
        if not isinstance(state_num , int):
            raise ValueError(u"set_jointState: state_num은 int 타입이어야 합니다.".format(joint_item))
        if not self._check_joint(joint_item):
            raise ValueError(u"set_jointState: {}는 joint 타입이 아닙니다.".format(joint_item))
        if state_num > 3:
            state_num = 3
        if state_num < 0:
            state_num = 0
        cmds.setAttr(joint_item + ".drawStyle" , state_num)
        self.currentJoint = joint_item
        if returnString:
            return joint_item , return_string.get(state_num)
        else:
            return joint_item , state_num

    def set_jointRadius(self ,  joint_item , radius = 0 ):
        '''
        Joint의 radius attribute를 설정하여 뷰포트 표시 크기를 변경합니다.

        Args:
            joint_item (str): 반지름을 변경할 Maya Joint.
            radius (int or float, optional): Joint에 적용할 radius 값.

        Returns:
            tuple: (Joint 이름, 적용된 radius 값).
        '''
        if not isinstance(radius , (int, float)):
            raise ValueError(u"set_jointRadius: state_num은 int/float 타입이어야 합니다.".format(joint_item))
        if not self._check_joint(joint_item):
            raise ValueError(u"set_jointRadius: {}는 joint 타입이 아닙니다.".format(joint_item))

        cmds.setAttr("{}.radius".format(joint_item), radius)
        self.currentJoint = joint_item
        return joint_item , radius

    def set_jointPreferredAngle(self , joint_item , vector_item):
        '''
        IK 계산 시 Joint가 선호하는 회전 방향인 preferredAngle을 설정합니다.

        vector_item의 세 값을 preferredAngleX, preferredAngleY,
        preferredAngleZ에 각각 입력합니다.

        Args:
            joint_item (str): preferredAngle을 설정할 Maya Joint.
            vector_item (list or tuple): X, Y, Z 순서의 숫자 세 개.

        Returns:
            str: 값을 설정한 Joint 이름.
        '''
        vector_errorLog = self._check_threeVector(vector_item , "set_jointpreferredAngle: ")
        if vector_errorLog is not True:
            raise ValueError(vector_errorLog)
        if not self._check_joint(joint_item):
            raise ValueError(u"set_jointRadius: {}는 joint 타입이 아닙니다.".format(joint_item))

        for  i ,ax in enumerate("XYZ"):
            cmds.setAttr("{jnt}.preferredAngle{axis}" .format(jnt = joint_item , axis = ax) , vector_item[i])

        self.currentJoint = joint_item
        return joint_item

    def set_jointOrient(self , joint_item , vector_item = (0,0,0)):
        '''
        Joint의 로컬 축 기준이 되는 jointOrient XYZ 값을 직접 설정합니다.

        Args:
            joint_item (str): jointOrient를 설정할 Maya Joint.
            vector_item (list or tuple, optional): X, Y, Z 순서의 숫자 세 개.

        Returns:
            str: 값을 설정한 Joint 이름.
        '''
        vector_errorLog = self._check_threeVector(vector_item , "set_jointOrient: ")
        if vector_errorLog is not True:
            raise ValueError(vector_errorLog)
        if not self._check_joint(joint_item):
            raise ValueError(u"set_jointRadius: {}는 joint 타입이 아닙니다.".format(joint_item))

        for  i ,ax in enumerate("XYZ"):
            cmds.setAttr("{jnt}.jointOrient{axis}" .format(jnt = joint_item , axis = ax) , vector_item[i])
        self.currentJoint = joint_item
        return joint_item

    def convert_jointOrient(self, joint_item , destination_item , function_reverse = False):
        '''
        Joint의 jointOrient와 대상 노드의 rotate 값을 서로 이전합니다.

        기본 동작은 Joint의 jointOrient 값을 대상 노드의 rotate에 입력하고
        Joint의 jointOrient를 0으로 초기화합니다. function_reverse가 True이면
        대상 노드의 rotate를 Joint jointOrient로 되돌리고 rotate를 0으로
        초기화합니다.

        Args:
            joint_item (str): jointOrient 값을 읽거나 입력할 Maya Joint.
            destination_item (str): rotate 값을 읽거나 입력할 대상 노드.
            function_reverse (bool, optional): 반대 방향으로 이전할지 여부.

        Returns:
            list: 변경 전 jointOrient 튜플과 rotate 튜플.
        '''
        if not self._check_joint(joint_item):
            raise ValueError(u"convert_jointOrient: {}는 joint 타입이 아닙니다.".format(joint_item))
        if not cmds.objExists(destination_item):
            raise ValueError(u"convert_jointOrient: {}는 현재씬에 존재하지않습니다." .format(destination_item))
        if not all(cmds.objExists("{}.rotate{}" .format(destination_item , ax)) for ax in "XYZ"):
            raise ValueError(u"convert_jointOrient: {}는 rotate attr가 존재하지않습니다.".format(destination_item))
        tasks =[]
        axis = ["X" , "Y" , "Z"]
        orient_data = []
        rotate_data = []

        for i , ax in enumerate(axis):
            jointOrient = cmds.getAttr("{}.jointOrient{}" .format(joint_item , ax))
            rotate = cmds.getAttr("{}.rotate{}" .format(destination_item , ax))
            tasks.append((jointOrient , rotate))
            orient_data.append(jointOrient)
            rotate_data.append(rotate)


        axis_count = 0
        for jointOrient_v , rotate_v in tasks:
            destination_value = jointOrient_v
            jointValue = 0
            if function_reverse:
                destination_value = 0
                jointValue = rotate_v
            
            cmds.setAttr("{}.jointOrient{}" .format(joint_item ,  axis[axis_count] )  ,    jointValue)
            cmds.setAttr("{}.rotate{}" .format(destination_item ,  axis[axis_count] ) ,   destination_value)

            axis_count+=1
        
        self.currentJoint = joint_item
        self.otherObject = destination_item
        return [tuple(orient_data) , tuple(rotate_data)]

    def _check_threeVector(self , vector_item , method_name = None):
        '''
        값이 숫자 세 개로 이루어진 list 또는 tuple인지 확인합니다.

        Returns:
            bool or str: 올바른 3축 값이면 True, 아니면 오류 설명 문자열.
        '''
        if method_name is None:
            method_name = ""

        if not isinstance(vector_item , (list , tuple)):
            return (u"{}{}는 list/tuple 이어야합니다".format(method_name , vector_item))
        if not len(vector_item) ==3 :
            return (u"{}{}는 요소가 3개 이어야 합니다.".format(method_name , vector_item))
        if not all(isinstance(element , (int , float)) for element in vector_item ):
            return (u"{}{}의 요소는 int/float 이어야 합니다.".format(method_name , vector_item))
        return True

    def _check_joint(self , joint_item):
        '''
        전달값이 현재 Maya 씬에 존재하는 Joint 노드인지 확인합니다.

        Returns:
            bool: 유효한 Joint이면 True, 아니면 False.
        '''
        if not isinstance(joint_item ,self.string_type ):
            return False
        if not cmds.objExists(joint_item):
            return False
        if not cmds.objectType(joint_item) == "joint":
            return False
        return True


class create_base_rig_joint():
    '''
    getBase_joint_data()가 만든 Guide Joint 데이터를 Base Rig 생성용으로
    선택하고 정리하기 위한 클래스입니다.

    module 이름, build 알파벳, side를 기준으로 필요한 rig_id 목록을 찾고,
    module에 기록된 생성 순서를 유지하여 반환합니다.
    '''

    def __init__(self):
        '''
        데이터 검증에 사용할 문자열 타입, 필수 key, side 규칙을 초기화합니다.
        '''
        try:
            self.string_type = basestring
        except NameError:
            self.string_type = str

        self.check_main_key = ["joints" , "modules"]
        self.check_axis = ["L" , "C" , "R"]
        self.check_attr = [
            "rig_id",
            "rig_module",
            "rig_build",
            "rig_side",
            "rig_part",
            "rig_index",
            "rig_system",
            "rig_jointRole"
        ]
        self.duplicate_dict= {"joints" : {} , 'modules' : {}}

        self.check_alp = re.compile(r"^[A-Z]$")
        self.rename_manager = None
        
        self.main_data =None
    def set_main_data(self , dict_data):
        if not isinstance(dict_data , dict):
            raise ValueError(u"set_main_data: dict_data는 dict 타입이 아닙니다.")
        joints_data = dict_data["joints"]
        modules_data = dict_data["modules"]
        if not isinstance(joints_data, dict) or not isinstance(modules_data, dict):
            raise ValueError(u"organize_joint_data: joints와 modules는 dict 타입이어야 합니다.")
        self.main_data = dict_data 

    def set_naming_rule(self, naming_rule):
        if not callable(getattr(naming_rule, "build", None)):
            raise TypeError(
                u"naming_rule에는 build() 메서드가 필요합니다."
            )
    
        self.rename_manager = naming_rule

    def build_name(self, **name_data):
        return self.rename_manager.build(**name_data)

    def organize_joint_data(self , dict_data , check_module , alp , axis ):
        '''
        Base Joint 데이터에서 특정 module/build/side의 rig_id 목록을 추출합니다.

        다음 데이터 경로를 사용하여 module에 저장된 rig_id 순서를 읽습니다.
        dict_data["modules"][check_module][alp][axis]

        필수 key, module, build, side, rig_id 타입, 중복과 joints 데이터의
        참조 누락을 먼저 검증합니다. 실제 Maya node는 반환된 rig_id를 이용해
        dict_data["joints"][rig_id]["node"] 경로에서 가져올 수 있습니다.

        Args:
            dict_data (dict): getBase_joint_data()가 만든 전체 Base Joint 데이터.
            check_module (str): 선택할 module 이름. 예: "arm_type".
            alp (str): 선택할 한 글자 대문자 build ID. 예: "A".
            axis (str): 선택할 side. "L", "C", "R" 중 하나.

        Returns:
            list: module에 기록된 순서를 유지한 rig_id 문자열 목록.

        Example:
            >>> manager = create_base_rig_joint()
            >>> rig_ids = manager.organize_joint_data(
            ...     base_joint_data,
            ...     "arm_type",
            ...     "A",
            ...     "L"
            ... )
        '''
        if not isinstance(dict_data , dict):
            raise ValueError(u"organize_joint_data: dict_data는 dict 타입이 아닙니다.")
        if not isinstance(check_module , self.string_type):
            raise ValueError(u"organize_joint_data: check_module는 문자열 타입이 아닙니다.")
        if not isinstance(alp, self.string_type):
            raise ValueError(u"organize_joint_data: alp는 문자열 타입이 아닙니다.")
        if not isinstance(axis, self.string_type):
            raise ValueError(u"organize_joint_data: axis는 문자열 타입이 아닙니다.")

        missing_main_keys = [key for key in self.check_main_key if key not in dict_data]
        if missing_main_keys:
            raise ValueError(u"organize_joint_data: 필수 dict key가 없습니다: {}".format( missing_main_keys))

        joints_data = dict_data["joints"]
        modules_data = dict_data["modules"]


        if not isinstance(joints_data, dict) or not isinstance(modules_data, dict):
            raise ValueError(u"organize_joint_data: joints와 modules는 dict 타입이어야 합니다.")
        
        if check_module not in modules_data:
            raise ValueError(u"organize_joint_data: {}는 dict_data['modules']의 key가 아닙니다.".format( check_module))

        if self.check_alp.match(alp) is None:
            raise ValueError(u"organize_joint_data: {} 는 대문자 알파벳이 아닙니다." .format(alp))



        module_type_data = modules_data[check_module]
        if not isinstance(module_type_data, dict) or alp not in module_type_data:
            raise ValueError(u"organize_joint_data: {}는 {} module의 build key가 아닙니다.".format(alp, check_module ))
        
        if axis not in self.check_axis:
            raise ValueError(u"organize_joint_data: {} 는 적합한 axis 가 아닙니다. {}" .format(axis , self.check_axis) )

        alp_bulit_data = module_type_data[alp]
        if not isinstance(alp_bulit_data, dict) or axis not in alp_bulit_data:
            raise ValueError(u"organize_joint_data: {} axis 데이터가 존재하지 않습니다: "u"module={}, build={}".format(axis, check_module, alp))

        rig_ids = alp_bulit_data[axis]

        if not isinstance(rig_ids, (list, tuple)):
            raise ValueError( u"organize_joint_data: module의 axis 데이터는 list/tuple이어야 합니다." )
        if not all(isinstance(rig_id, self.string_type) for rig_id in rig_ids):
            raise ValueError( u"organize_joint_data: module의 rig_id는 모두 문자열이어야 합니다.")
        if len(set(rig_ids)) != len(rig_ids):
            raise ValueError( u"organize_joint_data: module에 중복된 rig_id가 있습니다: {}".format(  rig_ids))

        missing_rig_ids = [ rig_id for rig_id in rig_ids if rig_id not in joints_data]
        if missing_rig_ids:
            raise ValueError(
                u"organize_joint_data: joints 데이터에 rig_id가 없습니다: {}".format(
                    missing_rig_ids
                )
            )

        return list(rig_ids)

    def leg_duplicate(self , rule_data  ):
        if self.main_data is None:


    
    def root_dulicate(self , rule_data  ):
        if self.main_data is None:
            raise ValueError( u"root_dulicate : main_data가 없습니다." )
        if not isinstance(rule_data , list):
            raise ValueError( u"root_dulicate : rule_data는 리스트여야 합니다." )
        if not all(isinstance(element , self.string_type) for element in rule_data):
            raise ValueError( u"root_dulicate : rule_data의 모든 요소는 문자열이어야 합니다." )

        rig_module = "root_type"

        #alp_data = self.main_data.get(rig_module)
        alp_data = "A"
        axis = ("center" , "C")
        
        builtPlan_dict = {}
        root_joint_ids = self.organize_joint_data(self.main_data , rig_module , alp_data , axis[1])
        for rule_item in rule_data:
            dicts = {}
            for rig_id in root_joint_ids:
                data_path = self.main_data["joints"][rig_id]
                part_name = data_path["tags"]["rig_part"]
                index = data_path["tags"]["rig_index"]
                joint_role = data_path["tags"]["rig_jointRole"]
                if joint_role == "primary":
                    number = ""
                else:
                    number = index

                joint_name = data_path["node"]
                
                JntName = self.build_name(
                    item_name = part_name,
                    side = axis[0],
                    extra_side = "",
                    alp = "",
                    num = number,
                    rule = rule_item ,
                    obj_type = "joint"
                    )
                dicts[joint_name] = JntName
            builtPlan_dict[rule_item] = dicts


        
        for rule_item , builtPlan in builtPlan_dict.items():
            joints = self.create_joint_module(builtPlan ,rule_item )


            for i , joint in enumerate(joints):
                source_id = cmds.getAttr(joint + ".rig_id")
                rig_id = source_id + ":{}".format(rule_item)
                edit_attr_data = { "rig_id" : rig_id , "rig_system" : rule_item  }
                add_attr_data = {"source_id" : source_id }

                joint_data = self._set_joint_data( joint  , None , edit_attr_data , add_attr_data )
                
                path_id = "{type}:{alp_string}:{ax}:{mod}".format(
                    type = rig_module , 
                    alp_string = alp_data ,
                    ax = axis[1] , 
                    mod = rule_item
                    )
                
                self.duplicate_dict["joints"].update(joint_data)

                # dict는 함수에 전달할 때 복사본이 만들어지는 것이 아니라,
                # 같은 dict 객체가 전달됩니다. 따라서 _set_module_data() 안에서
                # check_dict["modules"]를 수정하면 self.duplicate_dict도 바로
                # 수정됩니다. 반환값 module_data는 마지막 경로의 list를 확인할
                # 때 사용할 수 있지만, 저장을 위해 다시 update할 필요는 없습니다.
                module_data = self._set_module_data(rig_id , path_id , self.duplicate_dict )
                



            
    def _set_joint_data(self,object_item,check_attrs=None,extra_edit_dict=None,add_attr_dict=None):
        '''
        복제된 Maya Joint의 String tag를 정리하고 joints용 레코드를 만듭니다.

        Guide Joint를 duplicate하면 rig_id와 rig_system 같은 String attribute도
        원본 값 그대로 복제됩니다. 이 메서드는 복제된 Joint에 새로운 attribute를
        추가하고, 기존 attribute를 생성 시스템에 맞게 수정한 뒤, 다음 구조로
        정리하여 반환합니다.

        {
            rig_id: {
                "node": object_item,
                "tags": {
                    "rig_id": rig_id,
                    "rig_system": "fk",
                    ...
                }
            }
        }

        처리 순서:
            1. object_item이 현재 씬에 존재하는 Joint인지 검사합니다.
            2. add_attr_dict의 String attribute를 생성하거나 값을 설정합니다.
            3. extra_edit_dict로 이미 존재하는 String attribute 값을 수정합니다.
            4. check_attrs에 지정된 attribute 값을 읽어 tags dict를 만듭니다.
            5. Joint의 rig_id attribute 값을 레코드의 key로 사용합니다.

        Args:
            object_item (str):
                데이터를 설정할 복제 Joint의 Maya node 이름입니다.
                현재 씬에 존재해야 하며 node 타입은 반드시 Joint여야 합니다.

            check_attrs (list, optional):
                최종적으로 존재 여부와 String 타입을 검사하고, 반환되는 tags에
                포함할 attribute 이름 목록입니다.

                생략하면 self.check_attr의 기본 autoRig tag를 사용합니다.

                기본 목록:
                    rig_id, rig_module, rig_build, rig_side, rig_part,
                    rig_index, rig_system, rig_jointRole

                add_attr_dict와 extra_edit_dict에 포함된 attribute는 check_attrs에
                없어도 자동으로 반환 tags 목록에 추가됩니다.

            extra_edit_dict (dict, optional):
                복제 Joint에 이미 존재하는 String attribute의 값을 수정합니다.
                존재하지 않는 attribute를 전달하면 ValueError가 발생합니다.

                주로 Guide에서 상속된 다음 값을 변경할 때 사용합니다.

                {
                    "rig_id": "root_type:A:C:root:0:fk:main",
                    "rig_system": "fk"
                }

            add_attr_dict (dict, optional):
                복제 Joint에 새로 필요한 String attribute와 값을 전달합니다.
                attribute가 없으면 생성하며, 이미 존재하면 String 타입인지
                확인한 뒤 값을 설정합니다.

                주로 원본과 생성 chain 정보를 추가할 때 사용합니다.

                {
                    "rig_sourceId": "root_type:A:C:root:0",
                    "rig_chain": "main",
                    "rig_chainIndex": "0"
                }

        Returns:
            dict:
                duplicate_dict["joints"]에 update할 수 있는 Joint 레코드입니다.

                {
                    rig_id: {
                        "node": object_item,
                        "tags": {attribute_name: value, ...}
                    }
                }

        Raises:
            ValueError:
                object_item 또는 attribute 정보가 올바르지 않거나,
                최종 rig_id attribute가 비어 있을 때 발생합니다.

        Example:
            >>> source_id = "root_type:A:C:root:0"
            >>> new_rig_id = source_id + ":fk:main"
            >>> joint_record = self._set_joint_data(
            ...     object_item="M_root_Fk_Jnt",
            ...     extra_edit_dict={
            ...         "rig_id": new_rig_id,
            ...         "rig_system": "fk"
            ...     },
            ...     add_attr_dict={
            ...         "rig_sourceId": source_id,
            ...         "rig_chain": "main",
            ...         "rig_chainIndex": "0"
            ...     }
            ... )
            >>> self.duplicate_dict["joints"].update(joint_record)
        '''
        if not isinstance(object_item, self.string_type):
            raise ValueError(u"_set_joint_data : object_item은 문자열이어야 합니다.")
        if not cmds.objExists(object_item):
            raise ValueError(u"_set_joint_data : object_item이 존재하지 않습니다.")
        if cmds.objectType(object_item) != "joint":
            raise ValueError(u"_set_joint_data : object_item은 Joint여야 합니다.")
        if check_attrs is not None and not isinstance(check_attrs, list):
            raise ValueError(u"_set_joint_data : check_attrs는 list여야 합니다.")
        if add_attr_dict is not None and not isinstance(add_attr_dict, dict):
            raise ValueError(u"_set_joint_data : add_attr_dict는 dict여야 합니다.")
        if extra_edit_dict is not None and not isinstance(extra_edit_dict, dict):
            raise ValueError(u"_set_joint_data : extra_edit_dict는 dict여야 합니다.")

        add_attr_dict = add_attr_dict or {}
        extra_edit_dict = extra_edit_dict or {}
        search_attrs = list(self.check_attr if check_attrs is None else check_attrs)

        # 반환 레코드의 key는 Joint에 저장된 rig_id에서 가져옵니다.
        # 사용자가 check_attrs에서 rig_id를 제외했더라도 반드시 읽어야 합니다.
        if "rig_id" not in search_attrs:
            search_attrs.append("rig_id")

        for attr_name, value in add_attr_dict.items():
            attr_exists = cmds.attributeQuery(attr_name,node=object_item, exists=True)
            if attr_exists:
                attr_type = cmds.getAttr(
                    "{}.{}".format(object_item, attr_name),
                    type=True
                )
                if attr_type != "string":
                    raise ValueError(
                        u"_set_joint_data : String attribute가 아닙니다: {}".format(
                            attr_name
                        )
                    )

            controlAttribute.addStringAttr(
                object_item,
                attr_name,
                "" if value is None else str(value)
            )

            if attr_name not in search_attrs:
                search_attrs.append(attr_name)

        for attr_name, value in extra_edit_dict.items():
            if not cmds.attributeQuery(attr_name,node=object_item,exists=True):
                raise ValueError(
                    u"_set_joint_data : 수정할 attribute가 없습니다: {}".format(
                        attr_name
                    )
                )

            attr_type = cmds.getAttr(
                "{}.{}".format(object_item, attr_name),
                type=True
            )
            if not attr_type == "string":
                raise ValueError(
                    u"_set_joint_data : String attribute가 아닙니다: {}".format(
                        attr_name
                    )
                )

            cmds.setAttr(
                "{}.{}".format(object_item, attr_name),
                "" if value is None else str(value),
                type="string"
            )

            if attr_name not in search_attrs:
                search_attrs.append(attr_name)

        missing_attrs = [
            attr_name
            for attr_name in search_attrs
            if not cmds.attributeQuery(
                attr_name,
                node=object_item,
                exists=True
            )
        ]
        if missing_attrs:
            raise ValueError(
                u"_set_joint_data : 필수 attribute가 없습니다: {}".format(
                    missing_attrs
                )
            )

        rig_attr_data = {}
        for attr_name in search_attrs:
            attr_path = "{}.{}".format(object_item, attr_name)
            attr_type = cmds.getAttr(attr_path, type=True)
            if attr_type != "string":
                raise ValueError(
                    u"_set_joint_data : String attribute가 아닙니다: {}".format(
                        attr_name
                    )
                )
            rig_attr_data[attr_name] = cmds.getAttr(attr_path)

        rig_id = rig_attr_data.get("rig_id")
        if not isinstance(rig_id, self.string_type) or not rig_id:
            raise ValueError(
                u"_set_joint_data : Joint의 rig_id attribute가 비어 있습니다."
            )

        return {
            rig_id: {
                "node": object_item,
                "tags": rig_attr_data
            }
        }

    def _set_module_data(self, rig_id, path_id, check_dict):
        '''
        joints에 저장된 Joint ID를 modules 색인 경로에 등록합니다.

        이 메서드는 Joint 레코드를 새로 만들거나 Maya Joint를 수정하지 않습니다.
        _set_joint_data()로 만든 레코드가 check_dict["joints"]에 먼저 저장되어
        있는지 확인한 뒤, modules 아래에 경로를 만들고 그 Joint ID를 추가합니다.

        modules는 상세 데이터를 중복 저장하지 않고 joints의 key만 보관합니다.

        예를 들어 path_id가 다음 값이면:

            "root_type:A:C:fk:main"

        다음 경로를 자동으로 만듭니다.

            check_dict["modules"]
                      ["root_type"]
                      ["A"]
                      ["C"]
                      ["fk"]
                      ["main"]

        중간 경로인 root_type, A, C, fk는 dict로 생성되고, 마지막 경로인
        main은 rig_id를 저장하는 list로 생성됩니다. 같은 rig_id를 여러 번
        전달해도 마지막 list에는 한 번만 등록됩니다.

        Args:
            rig_id (str):
                modules 색인에 등록할 생성 Joint의 고유 ID입니다.
                호출 전에 check_dict["joints"][rig_id]가 존재해야 합니다.

                예:
                    "root_type:A:C:root:0:fk:main"

            path_id (str):
                modules 아래에 만들 색인 경로입니다. 각 단계는 콜론(:)으로
                구분하며 빈 항목이 없어야 합니다.

                권장 형식:
                    {rig_module}:{rig_build}:{rig_side}:{rig_system}:{rig_chain}

                예:
                    "root_type:A:C:fk:main"
                    "leg_type:A:L:bend:hip_knee"

            check_dict (dict):
                joints와 modules를 포함하는 전체 생성 데이터입니다.

                최초 형태:
                    {
                        "joints": {},
                        "modules": {}
                    }

                _set_joint_data() 결과를 먼저 joints에 update한 다음 전달해야
                합니다. 이 메서드는 전달받은 check_dict를 직접 수정합니다.

        Returns:
            list:
                rig_id가 등록된 마지막 chain 경로의 실제 list를 반환합니다.
                반환된 list와 check_dict 내부의 list는 같은 객체입니다.

        Raises:
            ValueError:
                인자 타입, joints/modules 구조, rig_id 존재 여부 또는 기존
                module 경로의 dict/list 타입이 올바르지 않을 때 발생합니다.

        Example:
            >>> source_id = "root_type:A:C:root:0"
            >>> new_rig_id = source_id + ":fk:main"
            >>> joint_record = self._set_joint_data(
            ...     "M_root_Fk_Jnt",
            ...     extra_edit_dict={
            ...         "rig_id": new_rig_id,
            ...         "rig_system": "fk"
            ...     },
            ...     add_attr_dict={
            ...         "rig_sourceId": source_id,
            ...         "rig_chain": "main",
            ...         "rig_chainIndex": "0"
            ...     }
            ... )
            >>> self.duplicate_dict["joints"].update(joint_record)
            >>> self._set_module_data(
            ...     new_rig_id,
            ...     "root_type:A:C:fk:main",
            ...     self.duplicate_dict
            ... )

            생성되는 modules 구조:
                {
                    "root_type": {
                        "A": {
                            "C": {
                                "fk": {
                                    "main": [new_rig_id]
                                }
                            }
                        }
                    }
                }
        '''
        if not isinstance(rig_id, self.string_type) or not rig_id:
            raise ValueError(u"_set_module_data : rig_id는 빈 문자열이 아니어야 합니다.")
        if not isinstance(path_id, self.string_type) or not path_id:
            raise ValueError(u"_set_module_data : path_id는 빈 문자열이 아니어야 합니다.")
        if not isinstance(check_dict, dict):
            raise ValueError(u"_set_module_data : check_dict는 dict여야 합니다.")
        if "joints" not in check_dict or not isinstance(check_dict["joints"], dict):
            raise ValueError(u"_set_module_data : check_dict['joints']는 dict여야 합니다.")
        if "modules" not in check_dict or not isinstance(check_dict["modules"], dict):
            raise ValueError(u"_set_module_data : check_dict['modules']는 dict여야 합니다.")
        if rig_id not in check_dict["joints"]:
            raise ValueError(u"_set_module_data : joints 데이터에 rig_id가 없습니다: {}".format(rig_id))

        path_items = path_id.split(":")
        if any(not path_item for path_item in path_items):
            raise ValueError( u"_set_module_data : path_id에 빈 경로가 있습니다: {}".format(  path_id))

        # check_dict는 호출부에서 전달한 self.duplicate_dict와 같은 dict 객체입니다.
        # 아래 대입은 modules를 복사하는 것이 아니라, 그 내부 dict를 가리키는
        # 또 하나의 변수 이름을 만드는 것입니다.
        current_path = check_dict["modules"]
        for path_item in path_items[:-1]:
            if path_item not in current_path:
                # 같은 객체 안에 새 dict를 추가하므로 이 변경은 호출부의
                # self.duplicate_dict["modules"]에도 즉시 반영됩니다.
                current_path[path_item] = {}
            elif not isinstance(current_path[path_item], dict):
                raise ValueError( u"_set_module_data : module 중간 경로가 dict가 아닙니다: {}".format( path_item))

            current_path = current_path[path_item]



        last_path = path_items[-1]
        if last_path not in current_path:
            current_path[last_path] = []
        elif not isinstance(current_path[last_path], list):
            raise ValueError(u"_set_module_data : module 마지막 경로가 list가 아닙니다: {}".format( last_path ) )

        joint_ids = current_path[last_path]
        if rig_id not in joint_ids:
            # joint_ids 역시 modules 내부에 들어 있는 실제 list입니다.
            # 이 list에 append하면 self.duplicate_dict의 list도 함께 변경됩니다.
            joint_ids.append(rig_id)

        # modules 데이터는 위 과정에서 이미 check_dict에 저장되었습니다.
        # 이 return은 저장을 위한 것이 아니라, 최종 경로의 list를 호출부에서도
        # 필요할 때 바로 사용할 수 있도록 돌려주는 편의용 반환값입니다.
        return joint_ids

        


    def create_joint_module(self , jointKey_nameValue_dict ,edit_rig_system = "" ):

        if not isinstance(jointKey_nameValue_dict , dict):
            raise ValueError(u"create_joint_module : {} 는 반드시 dict 자료형 이어야합니다. {joint_name : rename_item} ".format(jointKey_nameValue_dict))
        if not all(cmds.attributeQuery("rig_system" , node = joint_item , ex=True ) for joint_item in jointKey_nameValue_dict.keys()):
            raise ValueError(u"create_joint_module : {} 의 요소는 반드시 rig_system 라는 string attr를 가지고 있어야 합니다.".format(edit_rig_system))
        if not all(
            cmds.getAttr("{}.rig_system".format(joint_item), type=True) == "string"
            for joint_item in jointKey_nameValue_dict.keys()
        ):
            raise ValueError(u"create_joint_module : {} 의 요소는 반드시 rig_system 라는 string attr를 가지고 있어야 합니다.".format(edit_rig_system))
        createJointManager = jointControlManager()

        parent = None
        return_list = []
        for joint_item , name_string in jointKey_nameValue_dict.items():
            exist_joint = cmds.objExists(joint_item)
            check_string = isinstance(name_string , self.string_type)

            if not exist_joint or not check_string:
                raise ValueError (u"create_joint_module : dict의 {} , {} 이 존재하지않거나 , 문자열이 아닙니다." .format(joint_item , name_string))
            new_joint = createJointManager.duplicate_joint( joint_item ,name_string , parent)
            return_list.append(new_joint)
            parent = new_joint 

        return return_list

    

    def collect_joint_info(self , joints , search_range_data = [""]):
        tag_manager = JointDataManager()


    


            


            

            

        
        


        
        
        
        

        
        
        
        
        

            





    
