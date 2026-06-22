
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import maya.cmds as cmds
import re





def uniqueName(Name, maxLoop=2500):
    """
    Maya 씬 내에서 고유한 이름을 생성합니다. (패딩 유지 기능 포함)
    """
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
    def __init__(self):
        self.tasks = []
    
    def setTask(self , item , renameString ):
        task = (item ,renameString )
        self.tasks.append(task )

    def delTask(self):
        self.tasks = []
    
    def addTask(self, task):
        self.tasks += task


    def build(self):
        renames = []
        if not self.tasks:
            print("No tasks to execute.")
            return []

        # 뒤쪽 자식 노드부터 이름을 바꿔야 부모 이름이 바뀌어 경로가 깨지는 것을 방지할 수 있습니다.
        # 필요하다면 오브젝트 경로 길이에 따라 정렬하는 로직을 추가해도 좋습니다.
        for item, renameString in self.tasks:
            if cmds.objExists(item):
                ranameObj = cmds.rename(item, uniqueName(renameString))
                renames.append(ranameObj )
            else:
                print("Warning: Object '{}' does not exist. Skipping.".format(item))

        return renames



    

class nameSetUp:
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


    def setNumber(self, formatName = "{num}" , startNum = 1, endNum = -1, padding = 1):
        if not bool(self.patternFormat.search(formatName)):
            raise ValueError(u">> formatName must be a formatting string.")
        if not all(isinstance(x , int) for x in [startNum , endNum ,padding]):
            raise ValueError(u">> startNum, endNum, and padding must be integers.")


        self.startNum = startNum
        self.endNum =endNum 
        self.padding = padding
        self.numberFormat = formatName 

    def setUpperAlp(self, formatName ="{Alp}" ,startUpperAlp = "A" , endUpperAlp ="Z"):
        if not bool(self.patternFormat.search(formatName)):
            raise ValueError(u">> formatName must be a formatting string.")
        if not all(bool(self.patternUpperAlp.search(x) ) for x in [startUpperAlp , endUpperAlp] ):
            raise ValueError(u"startUpperAlp and endUpperAlp must be characters from A-Z.")


        self.startUpperAlp = startUpperAlp
        self.endUpperAlp = endUpperAlp
        self.upperAlpFormat = formatName

    def setLowerAlp(self , formatName = "{alp}", startLowerAlp = "a" , endLowerAlp = "z"):
        if not bool(self.patternFormat.search(formatName)):
            raise ValueError(u">> formatName must be a formatting string.")
        if not all(bool(self.patternLowerAlp.search(x) ) for x in [startLowerAlp , endLowerAlp] ):
            raise ValueError(u">> startLowerAlp and endLowerAlp must be characters from a-z.")


        self.startLowerAlp = startLowerAlp 
        self.endLowerAlp =  endLowerAlp
        self.lowerAlpFormat = formatName




    def setNameFormat(self ,fullString , formatName = "{item}"):
        if not isinstance(fullString ,self.string_type ):
            raise ValueError(">> fullString must be a string.")
        if not bool(self.patternFormat.search(formatName)):
            raise ValueError(u">> formatName must be a formatting string.")

        self.fullString  = fullString
        self.nameFormat = formatName
        
    def setAddItem(self, item ):
        if isinstance(item ,self.string_type ):
            self.Item.append(item)
        if isinstance(item ,(list, tuple) ):
            self.Item+=item


    def bulids(self,setUniqueName = True):
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

        for  i , item in enumerate(self.Item):


            if self.numberFormat:
                num_str = str(current_num).zfill(self.padding)
                print (">>>>>>>>>>>" , num_str)
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

            #if self.nameFormat:
            #    key = self.nameFormat.strip("{}")
            #    formatDict[key] = item

            renameString = self.fullString.format(**formatDict)
            if setUniqueName:
                self.task.append((item, uniqueName(renameString) ))
            else:
                self.task.append((item, renameString ))


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

            # 4. 알파벳 범위 초과 예외 처리 (영어로 변경)
            if is_upper_alp and upper_index >= upper_count:
                raise RuntimeError("Upper Alphabet range exceeded.")
            
            if is_lower_alp and not is_upper_alp and lower_index >= lower_count:
                raise RuntimeError("Lower Alphabet range exceeded.")

        return self.task

    def exec_rename(self):
        if not self.task:
            return
        for item, renameString in self.task:
            if cmds.objExists(item):
                cmds.rename(item, renameString)
            else:
                print("Warning: Object '{}' does not exist. Skipping.".format(item))

