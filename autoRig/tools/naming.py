# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import maya.cmds as cmds
import re


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

        Returns:
            list: 성공적으로 변경된 오브젝트들의 새 이름 리스트.
        '''
        renames = []
        if not self.tasks:
            print("No tasks to execute.")
            return []

        # 뒤쪽 자식 노드부터 이름을 바꿔야 부모 이름이 바뀌어 경로가 깨지는 것을 방지할 수 있습니다.
        # 필요하다면 오브젝트 경로 길이에 따라 정렬하는 로직을 추가해도 좋습니다.
        for item, renameString in self.tasks:
            if cmds.objExists(item):
                ranameObj = cmds.rename(item, uniqueName(renameString))
                renames.append(ranameObj)
            else:
                print("Warning: Object '{}' does not exist. Skipping.".format(item))

        return renames


class nameSetUp:
    '''
    숫자, 대문자, 소문자 등 다양한 텍스트 패턴 포맷을 조합하여 
    다수의 오브젝트에 적용할 일괄 네이밍 규칙(Batch Renaming Rule)을 구축(Setup)하는 클래스입니다.
    '''
    def __init__(self):
        try:
            self.string_type = basestring
        except NameError:
            self.string_type = str

        self.patternFormat = re.compile(r'\{.*?\}')
        self.patternUpperAlp = re.compile(r"[A-Z]")
        self.patternLowerAlp = re.compile(r"[a-z]")

        self.startNum = None
        self.endNum = None
        self.padding = None
        self.startUpperAlp = None
        self.endUpperAlp = None
        self.startLowerAlp = None
        self.endLowerAlp = None

        self.numberFormat = None
        self.upperAlpFormat = None
        self.lowerAlpFormat = None
        self.nameFormat = None

        self.fullString = None

        self.Item = []
        self.task = []

    def setNumber(self, formatName="{num}", startNum=1, endNum=-1, padding=1):
        '''
        전체 네이밍 포맷 내에서 숫자로 치환될 패턴과 그 범위를 설정합니다.

        Args:
            formatName (str, optional): 치환 타겟 문자열 포맷. 기본값은 "{num}".
            startNum (int, optional): 시작 숫자. 기본값은 1.
            endNum (int, optional): 끝 숫자. -1일 경우 목록 개수만큼 자동 확장. 기본값은 -1.
            padding (int, optional): 숫자의 빈자리를 '0'으로 채울 자릿수. 기본값은 1.
        '''
        if not bool(self.patternFormat.search(formatName)):
            raise ValueError(u">> formatName must be a formatting string.")
        if not all(isinstance(x, int) for x in [startNum, endNum, padding]):
            raise ValueError(u">> startNum, endNum, and padding must be integers.")

        self.startNum = startNum
        self.endNum = endNum 
        self.padding = padding
        self.numberFormat = formatName 

    def setUpperAlp(self, formatName="{Alp}", startUpperAlp="A", endUpperAlp="Z"):
        '''
        전체 네이밍 포맷 내에서 영어 대문자로 치환될 패턴과 그 범위를 설정합니다.

        Args:
            formatName (str, optional): 대문자 치환 타겟 포맷. 기본값은 "{Alp}".
            startUpperAlp (str, optional): 시작 알파벳 대문자 (A-Z). 기본값은 "A".
            endUpperAlp (str, optional): 끝 알파벳 대문자 (A-Z). 기본값은 "Z".
        '''
        if not bool(self.patternFormat.search(formatName)):
            raise ValueError(u">> formatName must be a formatting string.")
        if not all(bool(self.patternUpperAlp.search(x)) for x in [startUpperAlp, endUpperAlp]):
            raise ValueError(u"startUpperAlp and endUpperAlp must be characters from A-Z.")

        self.startUpperAlp = startUpperAlp
        self.endUpperAlp = endUpperAlp
        self.upperAlpFormat = formatName

    def setLowerAlp(self, formatName="{alp}", startLowerAlp="a", endLowerAlp="z"):
        '''
        전체 네이밍 포맷 내에서 영어 소문자로 치환될 패턴과 그 범위를 설정합니다.

        Args:
            formatName (str, optional): 소문자 치환 타겟 포맷. 기본값은 "{alp}".
            startLowerAlp (str, optional): 시작 알파벳 소문자 (a-z). 기본값은 "a".
            endLowerAlp (str, optional): 끝 알파벳 소문자 (a-z). 기본값은 "z".
        '''
        if not bool(self.patternFormat.search(formatName)):
            raise ValueError(u">> formatName must be a formatting string.")
        if not all(bool(self.patternLowerAlp.search(x)) for x in [startLowerAlp, endLowerAlp]):
            raise ValueError(u">> startLowerAlp and endLowerAlp must be characters from a-z.")

        self.startLowerAlp = startLowerAlp 
        self.endLowerAlp = endLowerAlp
        self.lowerAlpFormat = formatName

    def setNameFormat(self, fullString, formatName="{item}"):
        '''
        최종적으로 완성될 이름의 전체 포맷 문자열 규칙을 지정합니다.

        Args:
            fullString (str): 이름 규칙 문자열 전체 (예: "L_{item}_{num}_{Alp}_Jnt").
            formatName (str, optional): 향후 기능 확장을 위한 기준 치환 타겟 포맷. 기본값은 "{item}".
        '''
        if not isinstance(fullString, self.string_type):
            raise ValueError(">> fullString must be a string.")
        if not bool(self.patternFormat.search(formatName)):
            raise ValueError(u">> formatName must be a formatting string.")

        self.fullString = fullString
        self.nameFormat = formatName
        
    def setAddItem(self, item):
        '''
        일괄 이름 변경 규칙을 적용할 대상 오브젝트를 작업 리스트에 추가합니다.

        Args:
            item (str or list or tuple): 대상 마야 오브젝트 이름 또는 이름 리스트.
        '''
        if isinstance(item, self.string_type):
            self.Item.append(item)
        if isinstance(item, (list, tuple)):
            self.Item += item

    def bulids(self, setUniqueName=True):
        '''
        설정된 포맷 룰(숫자, 대/소문자)을 순회하며 최종적으로 변경될 새 이름들을 계산하고 
        작업 목록(Task)을 빌드합니다.

        Args:
            setUniqueName (bool, optional): 이름 충돌을 방지하기 위해 uniqueName 처리를 강제할지 여부. 기본값은 True.

        Returns:
            list: 생성된 [(원본오브젝트, 새이름), ...] 형태의 작업 태스크 리스트.
        '''
        if self.endNum == -1:
            self.endNum = len(self.Item)

        if not self.fullString:
            print("Warning: fullString is not set.")
            return
        
        formatDict = {}
        upper_index = 0
        lower_index = 0
        current_num = self.startNum

        is_num = self.numberFormat in self.fullString if self.numberFormat else False
        is_upper_alp = self.upperAlpFormat in self.fullString if self.upperAlpFormat else False
        is_lower_alp = self.lowerAlpFormat in self.fullString if self.lowerAlpFormat else False

        upper_count = 0
        if self.startUpperAlp and self.endUpperAlp:
            upper_count = ord(self.endUpperAlp) - ord(self.startUpperAlp) + 1
            
        lower_count = 0
        if self.startLowerAlp and self.endLowerAlp:
            lower_count = ord(self.endLowerAlp) - ord(self.startLowerAlp) + 1

        tasks = nameTask()

        for i, item in enumerate(self.Item):
            if self.numberFormat:
                num_str = str(current_num).zfill(self.padding)
                key = self.numberFormat.strip("{}")
                formatDict[key] = num_str

            if self.upperAlpFormat and self.startUpperAlp:
                current_upper = chr(ord(self.startUpperAlp) + upper_index)
                key = self.upperAlpFormat.strip("{}")
                formatDict[key] = current_upper

            if self.lowerAlpFormat and self.startLowerAlp:
                current_lower = chr(ord(self.startLowerAlp) + lower_index)
                key = self.lowerAlpFormat.strip("{}")
                formatDict[key] = current_lower

            renameString = self.fullString.format(**formatDict)
            if setUniqueName:
                self.task.append((item, uniqueName(renameString)))
            else:
                self.task.append((item, renameString))

            if self.numberFormat:
                current_num += 1
                if current_num > self.endNum:
                    current_num = self.startNum
                    
                    if is_upper_alp and is_lower_alp:
                        lower_index += 1
                        if lower_index >= lower_count:
                            lower_index = 0
                            upper_index += 1
                    elif is_upper_alp:
                        upper_index += 1
                    elif is_lower_alp:
                        lower_index += 1

            # 숫자를 사용하지 않는 경우: 매번 알파벳이 직접 증가
            else:
                if is_upper_alp and is_lower_alp:
                    lower_index += 1
                    if lower_index >= lower_count:
                        lower_index = 0
                        upper_index += 1
                elif is_upper_alp:
                    upper_index += 1
                elif is_lower_alp:
                    lower_index += 1

            # 알파벳 범위 초과 예외 처리 (영어로 변경)
            if is_upper_alp and upper_index >= upper_count:
                raise RuntimeError("Upper Alphabet range exceeded.")
            
            if is_lower_alp and not is_upper_alp and lower_index >= lower_count:
                raise RuntimeError("Lower Alphabet range exceeded.")

        return self.task

    def exec_rename(self):
        '''
        bulids() 메서드를 통해 생성된 일괄 작업(Task) 리스트를 씬에 직접 적용하여 
        실제 오브젝트의 이름을 변경합니다.

        Returns:
            None
        '''
        if not self.task:
            return
        for item, renameString in self.task:
            if cmds.objExists(item):
                cmds.rename(item, renameString)
            else:
                print("Warning: Object '{}' does not exist. Skipping.".format(item))



class namingRule():
    '''
    Rig build 과정에서 사용할 이름 규칙을 관리하고, token 기반으로 최종 이름 문자열을 생성합니다.

    기본 token:
        side, extra_side, item_name, alp, num, rule, obj_type, extra

    Example:
        >>> rule = namingRule()
        >>> rule.set_name_field("{side}{extra_side}_{item_name}{alp}{num}_{rule}_{obj_type}")
        >>> rule.setTokenMap("side", {"left": "L"})
        >>> rule.setTokenMap("obj_type", {"control": "Ctrl"})
        >>> rule.build(side="left", extra_side="front", item_name="shoulder", alp="A", num="01", rule="FK", obj_type="control")
        u"Lfront_shoulderA01_FK_Ctrl"
    '''
    def __init__(self):
        try:
            self.string_type = basestring
        except NameError:
            self.string_type = str

        self.name_field = "{side}{extra_side}_{item_name}{alp}{num}_{rule}_{obj_type}{extra}"
        self.token_pattern = re.compile(r"\{(.*?)\}")

        self.default_tokens = {
            "side": "",
            "extra_side": "",
            "item_name": "",
            "alp": "",
            "num": "",
            "rule": "",
            "obj_type": "",
            "extra": ""
        }

        self.token_maps = {
            "side": {},
            "extra_side": {},
            "rule": {},
            "obj_type": {}
        }

    #---------------------------------------------------------------------set token / map
    def addToken(self, tokenName, defaultValue=""):
        '''
        name_field에서 사용할 custom token을 추가합니다.
        '''
        if not isinstance(tokenName, self.string_type):
            return False
        if not tokenName:
            return False
        if self._checkTokenName(tokenName) is False:
            return False

        self.default_tokens[tokenName] = defaultValue
        return True

    def setTokenMap(self, tokenName, dict_item):
        '''
        특정 token에 대한 alias map을 설정합니다.
        예: tokenName="obj_type", {"control": "Ctrl", "joint": "Jnt"}
        '''
        if not isinstance(tokenName, self.string_type):
            return False
        if not isinstance(dict_item, dict):
            return False
        if tokenName not in self.default_tokens:
            return False

        self.token_maps[tokenName] = dict_item
        return True

    # 기존 호출 스타일을 유지하기 위한 wrapper
    def set_objType_map(self, dict_item):
        return self.setTokenMap("obj_type", dict_item)

    def set_sideType_map(self, dict_item):
        return self.setTokenMap("side", dict_item)

    def set_extraSideType_map(self, dict_item):
        return self.setTokenMap("extra_side", dict_item)

    def set_ruleType_map(self, dict_item):
        return self.setTokenMap("rule", dict_item)

    #---------------------------------------------------------------------set Name field
    def set_name_field(self, item):
        '''
        최종 이름 규칙 문자열을 설정합니다.
        등록되지 않은 token이 포함되면 ValueError를 발생시킵니다.
        '''
        if not isinstance(item, self.string_type):
            return False

        tokens = self._getTokens(item)
        if not tokens:
            return False

        invalidTokens = [x for x in tokens if x not in self.default_tokens]
        if invalidTokens:
            raise ValueError(u"지원하지 않는 naming token 입니다: {}".format(invalidTokens))

        self.name_field = item
        return True

    def build(self, item_name="", side="", extra_side="", alp="", num="", rule="", obj_type="", extra="", unique=False, **kwargs):
        '''
        현재 name_field와 token 값을 바탕으로 최종 이름 문자열을 반환합니다.
        '''
        if self.name_field is None:
            return ""

        formatDict = self.default_tokens.copy()
        formatDict.update({
            "item_name": item_name,
            "side": side,
            "extra_side": extra_side,
            "alp": alp,
            "num": num,
            "rule": rule,
            "obj_type": obj_type,
            "extra": extra
        })

        for key, value in kwargs.items():
            if key not in self.default_tokens:
                self.addToken(key)
            formatDict[key] = value

        for tokenName, mapData in self.token_maps.items():
            if tokenName in formatDict:
                formatDict[tokenName] = self._getMapValue(mapData, formatDict[tokenName])

        try:
            name = self.name_field.format(**formatDict)
        except KeyError as e:
            raise ValueError(u"naming build 에러: '{}' token 값이 없습니다.".format(e))

        name = self._cleanupName(name)
        if unique:
            name = uniqueName(name)

        return name

    #---------------------------------------------------------------------helper
    def _getTokens(self, item):
        if not isinstance(item, self.string_type):
            return []
        return self.token_pattern.findall(item)

    def _checkTokenName(self, tokenName):
        if not isinstance(tokenName, self.string_type):
            return False
        if self.token_pattern.search(tokenName):
            return False
        if not re.match(r"^[A-Za-z_][A-Za-z0-9_]*$", tokenName):
            return False
        return True

    def _getMapValue(self, mapData, value):
        if isinstance(mapData, dict) and value in mapData:
            return mapData[value]
        return value

    def _cleanupName(self, name):
        if not isinstance(name, self.string_type):
            return name
        while "__" in name:
            name = name.replace("__", "_")
        return name



    


