# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.api.OpenMaya as om
import pprint ,re

def uniqueName(Name, maxLoop=2500):
    '''
    Maya 씬 내에서 이름 충돌을 방지하기 위해 유니크(고유)한 이름을 생성합니다.
    문자열 끝에 숫자가 포함되어 있을 경우, 해당 숫자의 자릿수(패딩, 예: 01, 001)를 
    그대로 유지하면서 숫자를 순차적으로 증가시킵니다.

    Args:
        Name (str): 부여하고자 하는 기본 이름 (예: "L_Arm_01").
        maxLoop (int, optional): 고유 이름을 찾기 위한 최대 시도 횟수. 기본값은 2500.

    Returns:
        str: 씬 내에 존재하지 않는 유니크한 최종 이름.

    Example:
        >>> new_name = uniqueName("pCube_001") # 이미 존재하면 "pCube_002" 반환
    '''
    string_type = None
    try:
        string_type = basestring
    except NameError:
        string_type = str
        
    returnName = Name
    
    if isinstance(Name, string_type):
        # 숫자 추출을 위한 정규식
        isIntPattern = r"(.*?)([0-9]+)(.*?)$"
        isInt = re.search(isIntPattern, Name)
        
        if isInt:
            match_prefix = isInt.group(1)
            match_num = isInt.group(2)
            match_suffix = isInt.group(3)
            
            count = int(match_num)
            padding_length = len(match_num) # ★ 기존 숫자의 패딩 자릿수 저장
            
            formatName = match_prefix + "{}" + match_suffix
            
            for x in range(count, maxLoop + count):
                # ★ 저장된 자릿수만큼 다시 패딩(zfill) 적용
                formatted_num = str(x).zfill(padding_length) 
                returnName = formatName.format(formatted_num)
                
                if not cmds.objExists(returnName):
                    break
        else:
            formatName = Name + "{}"
            for x in range(0, maxLoop):
                formatted_num = str(x) if x > 0 else ""
                returnName = formatName.format(formatted_num)
                if not cmds.objExists(returnName):
                    break

    return returnName

class nameTask():
    '''
    다수의 오브젝트 이름 변경(Rename) 작업을 리스트 형태로 모아두었다가 
    한 번에 실행할 수 있도록 관리하는 태스크(Task) 매니저 클래스입니다.
    '''
    def __init__(self):
        self.tasks = []
    
    def setTask(self, item, renameString):
        '''
        단일 이름 변경 작업을 태스크 리스트에 추가합니다.

        Args:
            item (str): 이름을 변경할 씬 내 원본 오브젝트 이름.
            renameString (str): 새롭게 부여할 대상 이름.
        '''
        task = (item, renameString)
        self.tasks.append(task)

    def delTask(self):
        '''
        현재 등록된 모든 이름 변경 작업을 초기화(삭제)합니다.
        '''
        self.tasks = []
    
    def addTask(self, task):
        '''
        이미 구성된 이름 변경 작업 리스트를 기존 태스크에 병합합니다.

        Args:
            task (list of tuple): [(원본이름, 새이름), ...] 형태의 태스크 리스트.
        '''
        self.tasks += task

    def build(self):
        '''
        등록된 모든 이름 변경 작업을 실제로 씬(Scene)에서 일괄 실행합니다.
        이름 충돌 시 자동으로 uniqueName을 통해 고유 이름이 부여됩니다.
        '''
        renames = []
        if not self.tasks:
            print("No tasks to execute.")
            return []

        # [핵심 추가 코드] 계층구조가 깊은 하위 노드부터 처리하도록 리스트를 내림차순 정렬합니다.
        # x[0]은 원본 오브젝트의 경로 문자열이며, '|'의 개수가 많을수록 하위 노드입니다.
        self.tasks.sort(key=lambda x: x[0].count('|'), reverse=True)

        for item, renameString in self.tasks:
            if cmds.objExists(item):
                ranameObj = cmds.rename(item, uniqueName(renameString))
                renames.append(ranameObj)
            else:
                print("Warning: Object '{}' does not exist. Skipping.".format(item))

        return renames


selects = cmds.ls(sl =1)
cmds.select(selects[0] , hi =1)
duplicates = cmds.ls(sl =1 ,dag =1)
duplicates = [node for node in duplicates if '|' in node]
duplicates = [node for node in duplicates if cmds.objectType(node) == "transform"]


nameTask = nameTask()
check_id = duplicates[0].split("|")[0]
for node in duplicates:
    split_item = node.split("|")
    root_id = split_item[0]
    middle_id = split_item[1:-1]
    end_id = split_item[-1]
    
    if check_id == root_id:

        rename_string = "{}_{}".format(root_id , end_id)

        nameTask.setTask(node , rename_string)

    check_id = root_id


pprint.pprint(nameTask.tasks)

nameTask.build()



