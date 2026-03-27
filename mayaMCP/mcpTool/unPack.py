# -*- coding: utf-8 -*-

def unPacker_for_func(matchDict, **kwargs):
    """
    AI가 보낸 키워드 인자(kwargs)를 허용된 플래그 리스트(matchDict)와 대조하여 필터링하기
    Args:
        -matchDict (dict): 허용할 약어와 정식명칭 매핑 테이블
        -kwargs    (dict): AI로부터 전달받은 가변 키워드 인자
    Returns:
        필터링된 플래그 데이터(dict)
    """
    if not isinstance(matchDict, dict) or not isinstance(kwargs, dict):
        return {}

    flagData = {}
    
    for key, value in kwargs.items():
        # 파이썬 2.7의 unicode 호환을 위해 명시적 문자열로 변환
        str_key = str(key) 
        for matchKey, matchValue in matchDict.items():
            if str_key == matchKey or str_key == matchValue:
                flagData[str_key] = value
                break 

    return flagData

def logData( title ,target =None, dict =None   ):
    log = "----- AI 함수사용 :  {} -----\n" .format(title)
    log += "> 대상 오브젝트(s) : {}\n" .format(target)
    log += "> 전달받은 인자값 : {}\n" .format(dict)
    

    return log


