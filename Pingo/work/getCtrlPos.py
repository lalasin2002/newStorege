# -*- coding: utf-8 -*-
import maya.cmds as cmds
import os
import json
import re

def Hierarchy(Root, patternString=None):
    """
    루트 노드 하위에서 특정 패턴을 가진 오브젝트 목록 가져오기
    Args:
        -Root          (str): 탐색을 시작할 최상위 노드
        -patternString (str): 검색할 정규식 패턴 (예: r".+_Aim_Ctrl$")
    Returns:
        조건에 맞는 오브젝트의 풀패스 목록 (list)
    """
    cmds.select(Root, hierarchy=True)
    hierarchySelects = cmds.ls(selection=True, type="transform")
    
    List = []
    Pattern = ""
    
    if isinstance(patternString, str):
        Pattern = patternString
        
    for x in hierarchySelects:
        if patternString:
            search = re.search(Pattern, x)
            if search:
                fullpath = cmds.ls(x, long=True)
                List.append(fullpath[0])

    return List


def DictPos(List, flagDict={"t": True, "os": True}):
    """
    오브젝트 목록의 트랜스폼 데이터(좌표)를 딕셔너리로 추출하기
    Args:
        -List     (list): 위치값을 추출할 오브젝트 리스트
        -flagDict (dict): 추출할 xform 플래그 (기본값: 로컬 Translate)
    Returns:
        오브젝트를 키, 좌표를 값으로 하는 딕셔너리 (dict)
    """
    Dict = {}
    for x in List:
        Pos = cmds.xform(x, query=True, **flagDict)
        Dict[x] = Pos

    return Dict


def setPosDict(PosDict, flag=["os", "t"], printLog=True):
    """
    딕셔너리 데이터를 바탕으로 오브젝트에 좌표값 덮어씌우기
    Args:
        -PosDict  (dict): {오브젝트명: 좌표리스트} 형태의 딕셔너리
        -flag     (list): 적용할 xform 플래그 (기본값: 로컬 Translate)
        -printLog (bool): 작업 경과 로그 출력 여부
    Returns:
        없음
    """
    ErrorString = ""
    WorkLogString = "\n\n"
    
    if printLog:
        ErrorString += "_____________________________________________\n"
        
    if isinstance(PosDict, dict):
        Count = 1
        for obj, value in PosDict.items():
            if cmds.objExists(obj):
                cmds.xform(obj, **{flag[0]: True, flag[1]: value})
                if printLog:
                    WorkLogString += u">>작업경과 {n} : 딕셔너리의 데이터 {o} \n    > {v} \n     > 적용되었습니다\n".format(n=Count, o=obj, v=value)
            else:
                if printLog:
                    ErrorString += u">>작업경과 {n} : 현재 씬에서 딕셔너리의 데이터 {o} \n > 존재하지않습니다.\n".format(n=Count, o=obj)
            Count += 1 
            
    if printLog:
        print (u"{}".format(WorkLogString))
        print (u"{}".format(ErrorString))


def ctrlPosData(PathVar, WorkType="export", fileName="ctrlPosData.json", Pattern=r".+_Aim_Ctrl$"):
    """
    컨트롤러 위치 데이터를 JSON 파일로 내보내거나 불러오는 메인 실행 함수
    Args:
        -PathVar  (str): JSON 파일이 저장되거나 위치한 폴더 절대 경로
        -WorkType (str): 작업 모드 ("export" 또는 "import")
        -fileName (str): 저장할 또는 불러올 JSON 파일 이름
        -Pattern  (str): 타겟 컨트롤러를 찾을 정규식 패턴
    Returns:
        없음
    """
    if not any(WorkType == t for t in ["export", "import"]):
        raise TypeError(u">> 적절한 WorkType 지정되지않았습니다. export, import 둘중 하나만 정확히 입력해야 합니다.")
    
    select = cmds.ls(selection=True)
    absPath = os.path.abspath(PathVar)
    JsonPath = os.path.join(absPath, fileName)
    
    lsExistPath = os.path.isdir(absPath)
    IsExistJsonPath = os.path.isfile(JsonPath)

    if WorkType == "export" and len(select) == 0:
        raise IndexError(u">> 에러! : 상위 그룹을 셀렉트 했는지 확인하세요")
        
    if lsExistPath == False:
        raise TypeError(u">> 에러! : 입력한 폴더경로를 탐색하지 못했습니다. PathVar의 경로를 확인하세요")
        
    if WorkType == "import":
        if IsExistJsonPath == False:
            raise TypeError(u">> 에러! : 입력된 JSON 경로 파일을 탐색하지 못했습니다. PathVar, fileName를 확인하세요")

    # Export 모드 로직
    if WorkType == "export" and len(select) > 0 and lsExistPath:
        HierarchyData = Hierarchy(select[0], Pattern)
        CtrlPosDict = DictPos(HierarchyData)
        
        if len(CtrlPosDict) > 0:
            with open(JsonPath, "w") as file:
                json.dump(CtrlPosDict, file, indent=4)
                
            for k, v in CtrlPosDict.items():
                print (u"> {} : {} 데이터".format(k, v))
                
            print (u"\n\n >> {path} \n   > 에 데이터가 저장되었습니다.".format(path=JsonPath))
        else:
            raise RuntimeError(u">> 에러! : 조건에 맞는 데이터를 찾지 못했습니다. Pattern을 다시 정의하거나, 적절한 상위 그룹을 셀렉트 했는지 확인하세요")
    
    # Import 모드 로직
    if WorkType == "import" and IsExistJsonPath == True:
        Data = None
        with open(JsonPath, "r") as file:
            Data = json.load(file)
            
        if Data and isinstance(Data, dict):
            setPosDict(Data)

# ==========================================
# 실행 예제 (사용 시 주석 해제 후 사용)
# ==========================================
"""
Path = r"C:\Temp"
TypeString = "export" # 또는 "import"
fileNameString = "ctrlPosData.json"
PatternString = r".+_Aim_Ctrl$"

ctrlPosData(Path, TypeString, fileNameString, PatternString)
"""