# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import requests , os ,io
try:
    from PySide6 import QtCore
except:
    from PySide2 import QtCore


def request_toGet_comfyuiData( endPoint  ,  host="127.0.0.1", port=8188, timeout=3.0):
    url = "http://{}:{}{}" .format(host , port , endPoint )

    try:
        response = requests.get(url , timeout = timeout)
        #timeLine= response.total_seconds()
        statusCode= response.status_code

        if not statusCode == 200: #연결 상태 이상시
            return False ,  u"HTTP 에러 {}: {}".format(statusCode, response.text[:100])
        
        try:
            data = response.json() #json이 아닐때
        except ValueError:
            return False, u"응답이 JSON 형식 아님"
        
        return True , data
    
    except requests.exceptions.Timeout: #요청시간이 넘어갈경우
        return False, u"연결 시간 초과"
    except requests.exceptions.ConnectionError as e:
        return False, u"ComfyUI 연결 실패, 상세 에러 확인: {}".format(e)
    
    ## 위에서 아래로 잡아나가는 클래스구조
    ## request 클래스 자체의 메서드간 종속관계 이상시

    except requests.exceptions.RequestException as e: 
        return False, u"요청 실패: {}".format(e) 
    
    except Exception as e: # 기도해라
        return False, u"에러: {}".format(e)

def post_to_comfyui( endPoint, data , host="127.0.0.1", port=8188, timeout=10.0):
    url = "http://{}:{}{}".format(host, port, endPoint)
    getData = None
    try:
        response = requests.post(url, json=data , timeout = timeout)
        statusCode = response.status_code
        #timeLine= response.total_seconds()
        if not statusCode in (200, 201):
            return False, u"HTTP {}: {}".format(statusCode, response.text[:100])
        
        try:
            getData = response.json() #json이 아닐때
        except ValueError:
            return False, u"응답이 JSON 형식 아님"
        return True , getData
    except requests.exceptions.Timeout:
        return False, u"연결 시간 초과"
    except requests.exceptions.ConnectionError as e:
        return False,  u"ComfyUI 연결 실패, 상세 에러 확인: {}".format(e)
    except Exception as e:
        return False, u"에러: {}".format(e)
    
def check_comfyuiConnection(host="127.0.0.1", port=8188):
    return request_toGet_comfyuiData("/system_stats", host, port, timeout=3.0)


def get_queue(host="127.0.0.1", port=8188):
    return request_toGet_comfyuiData("/queue", host, port)

def get_checkPoints(host="127.0.0.1", port=8188):
    success , data = request_toGet_comfyuiData("/object_info/CheckpointLoaderSimple" , host, port)
    if not success:
        return False, data
    try:
        models = data["CheckpointLoaderSimple"]["input"]["required"]["ckpt_name"][0]
        return True, models
    except KeyError as e: # 딕셔너리 키를 못 찾을 때 나는 에러를 명확히 잡음
        return False, u"데이터에서 키를 찾을 수 없음: {}".format(e)
    except Exception as e:
        return False , u"응답 형식 이상: {}".format(e)
    
def get_samplers(host="127.0.0.1", port=8188):
    success , data = request_toGet_comfyuiData("/object_info/KSampler" , host, port)
    if not success:
        return False, data
    try:
        samplers = data["KSampler"]["input"]["required"]["sampler_name"][0]
        return True, samplers                                                             
    except KeyError as e: # 딕셔너리 키를 못 찾을 때 나는 에러를 명확히 잡음
        return False, u"데이터에서 키를 찾을 수 없음: {}".format(e)
    except Exception as e:
        return False, u"응답 형식 이상: {}".format(e)
    



def upload_image(path , host="127.0.0.1", port=8188):
    if not os.path.exists(path):
        return False, u"파일이 존재하지 않음: {}".format(path)
    
    url = "http://{}:{}/upload/image".format(host, port)

    try:
        with io.open(path, "rb") as f:
            files = {"image": f}
            data = {"overwrite": "true"}  # 같은 이름 있으면 덮어쓰기
            response = requests.post(url, files=files, data=data, timeout=30.0)
        
        if not response.status_code == 200:
            return False, u"HTTP {}: {}".format(response.status_code, response.text[:100])
        
        return True, response.json()
    except requests.exceptions.Timeout:
        return False, u"업로드 시간 초과"
    except Exception as e:
        return False, u"업로드 실패: {}".format(e)

def queue_prompt(workflow_data, host="127.0.0.1", port=8188):
    """워크플로우 JSON을 큐에 던지기. 응답에 prompt_id 들어있음"""
    return post_to_comfyui("/prompt", {"prompt": workflow_data}, host, port, timeout=10.0)

def get_history(prompt_id, host="127.0.0.1", port=8188):
    endPoint = "/history/{}".format(prompt_id)
    return request_toGet_comfyuiData(endPoint, host, port , timeout=5.0)
