# -*- coding: utf-8 -*-

import google.generativeai as genai
import google.ai.generativelanguage as glm

import os , sys , inspect ,pprint

from mcpTool import mayaBridge
from mcpTool import objectTransform

def pathAppend( log = True):
    # __file__ 현재 작업중인 파일 위치
    #os.path.dirname (경로)의 메인폴더 위치
    st = u"-----"*2 + "{}" + u"-----"*2 +"\n"
    st = st.format("pathAppend")
    CurrentDir = os.path.dirname(os.path.abspath(__file__))
    if not CurrentDir in sys.path:
        sys.path.append(CurrentDir)
        st+= "sys.path 등록 : {}\n".format(CurrentDir)
    else:
        st+= "sys.path 이미등록됨 : {}\n".format(CurrentDir)

    if log:
        print (st)

pathAppend()

def get_moduleTools(module):
    """
    여러 모듈이 담긴 리스트에서 모든 함수를 하나의 리스트로 합쳐서 추출하기
    Args:
        -module_list (list): 툴 모듈들이 담긴 리스트
    Returns:
        합쳐진 함수 객체들의 리스트 (list)
    """
    tools_list = []
    # 리스트 안에 있는 모듈들을 하나씩 꺼내서
    for mod in module:
        # 그 모듈 안의 함수들을 전부 tools_list에 추가합니다.
        for name, func in inspect.getmembers(mod, inspect.isfunction):
            tools_list.append(func)

    return tools_list



#-------------------------------------------------------------------------------------------------------------




def request_to_ai(order , API_Key , ModelName , tool_list , sys_prompt=None , history=None):
    """
    제미나이에게 질문하고, 선택한 도구를 동적으로 찾아 자동 실행하는 엔진
    Args:
        -order       (str): 사용자의 명령
        -API_Key     (str): 제미나이 API 키
        -Model (str): 사용할 모델 이름 (예: 'gemini-1.5-flash')
        -tool_list (module): 도구들이 들어있는 모듈 (예: translateTool)
    Returns:
        최종 결과 문자열 (str)
    """
    # 제미나이와 대화 시작
    genai.configure(api_key=API_Key)
    moduleTools = get_moduleTools(tool_list)

    if history is None:
        history = []
    Model = genai.GenerativeModel(ModelName, tools=moduleTools , system_instruction=sys_prompt)
    Chat = Model.start_chat(history=history)
    Response = Chat.send_message(order)
    
    for part in Response.parts:
        if part.function_call:
            #제미나이가 고른 함수의 이름표 (문자열)
            FuncName = part.function_call.name #예: "set_xform_translate"
            #함수에 넣어야 할 매개변수들이 담긴 딕셔너리(사전)
            Args = part.function_call.args ## 예: {'TargetObj': 'pCube1', ...}


            TargetFunction = None
            
            for mod in tool_list:
                if hasattr(mod, FuncName): 
                    TargetFunction = getattr(mod, FuncName)
                    break # 찾았으면 더 이상 리스트를 뒤질 필요 없이 반복문 탈출!
            
            if TargetFunction:
                # tool 작동
                FuncResult = TargetFunction(**Args)


                #Chat.send_message : Model.start_chat().send_message : ai한테 요청한 내용
                #glm.Part : AI에게 보내는 <메시지, 텍스트, 이미지 , ..> 따위 데이터 모음집  
                ''' 예시
                Chat.send_message([
                3     glm.Part(text="이 건물 이름이 뭐야?"),  # 첫 번째 상자: 내용물은 '텍스트'
                4     glm.Part(image=my_image_data)       # 두 번째 상자: 내용물은 '이미지'    
                5 ])
                '''

                #glm.Part (function_response  = ...)  : function_response는 어떤 함수(사용자가 넣은 )를 쓴것에 대한 결과 보고요청   #Part의 종류가 '결과 보고서' 자체임을 알려주는 '라벨'이나 '스티커'
                #genai.protos.FunctionResponse() : 딕션너리 형태의 어떤 함수(사용자가 넣은 ) , ai의 '보고서 양식(템플릿 : 딕셔너리)' 
                Response = Chat.send_message(glm.Part(function_response=glm.FunctionResponse(name=FuncName,response={'result': FuncResult}) ) )
                return Response.text ,  Chat.history

            else:
                return (u"에러: {} 도구를 모듈에서 찾을 수 없습니다.".format(FuncName)) ,  Chat.history
        
            #oldCode
    return (u"(tool ) : " + Response.text) ,  Chat.history


