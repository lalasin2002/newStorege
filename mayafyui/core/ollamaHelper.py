# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import ollama


def request_prompt(user_input  , sys ,  progress_callback=None, is_running_check=None):

    if progress_callback:
        progress_callback(10)

    if is_running_check and not is_running_check():
        return "" 
    

    messages = [
        {'role': 'system', 'content': sys},
        {'role': 'user', 'content': user_input}
    ]

    try:
        if progress_callback:
            progress_callback(30)

        response = ollama.chat(
            model='llama3.2:3b',
            messages=messages
        )

        if progress_callback:
            progress_callback(100)
        
        return response['message']['content'].strip()
    except Exception as e:
        print(u">> 에러 : Ollama 통신 중 오류 발생: {}".format(e))
        return ""


def request_promptBoth(positive_input, positive_sys, negative_input, negative_sys,
                       progress_callback=None, is_running_check=None):
    """
    positive + negative 둘 다 한 번에 변환. thread에서 호출하기 좋음.
    리턴: "positive_tags|||negative_tags" (구분자로 합침)
    """
    positive_tags = ""
    negative_tags = ""

    # 단계를 명확하게 나눔
    if progress_callback:
        progress_callback(5)  # 시작
    
    if positive_input:
        if is_running_check and not is_running_check():
            return "|||"
        if progress_callback:
            progress_callback(15)  # positive 변환 시작
        
        positive_tags = request_prompt(positive_input, positive_sys)
        
        if progress_callback:
            progress_callback(50)  # positive 완료
    else:
        if progress_callback:
            progress_callback(50)  # positive 스킵
    
    if negative_input:
        if is_running_check and not is_running_check():
            return "{}|||".format(positive_tags)
        if progress_callback:
            progress_callback(60)  # negative 변환 시작
        
        negative_tags = request_prompt(negative_input, negative_sys)
        
        if progress_callback:
            progress_callback(95)  # negative 완료
    
    if progress_callback:
        progress_callback(100)

    # 두 결과를 구분자로 합쳐서 리턴
    return u"{}|||{}".format(positive_tags, negative_tags)