# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import socket

def send_to_maya(code , host = "127.0.0.1" , port = 7771 ,  timeout=3.0):
    """
    Maya commandPort에 Python 코드를 전송하고 응답을 받음.
    
    Args:
        code (str): 실행할 Python 코드 문자열
        host (str): Maya가 떠 있는 IP (기본 localhost)
        port (int): Maya commandPort 번호
        timeout (float): 응답 대기 시간 (초)
    
    Returns:
        (success, response):
            success (bool): 통신 성공 여부
            response (str): Maya가 반환한 텍스트 또는 에러 메시지
    """

    socketItem = None
    response = None
    try:
        # 소켓설정 : IPv4 방식(AF_INET) 사용 , TCP 방식(SOCK_STREAM)
        socketItem = socket.socket(socket.AF_INET ,socket.SOCK_STREAM)
        socketItem.settimeout(timeout) 

        socketItem.connect((host , port))
        socketItem.sendall(code.encode("utf-8")) # UTF-8 인코딩 필수

        #이런 모르겠다 외우자..
        response = socketItem.recv(8192).decode("utf-8", errors="replace")
        return True, response

    except socket.timeout:
        return False , u"연결시간 초과"
    except ConnectionRefusedError:
        return False , u"연결 거부됨 (Maya port 확인 권고) "
    except Exception as e:
        return False , u"에러 :{}".format(e)
    finally: #에외와 상관없이 열린 포트는 닫는다.
        if socketItem:
            socketItem.close()

def check_mayaConnection(code ,host = "127.0.0.1" , port = 7771 , checkVersion = True):
    command = "import maya.cmds as cmds;"
    command += code 
    if checkVersion:
        command += "; print ('>> version : ' +  cmds.about(v=1))"

    return send_to_maya(command  , host  , port )
    

##테스트용
#check , res = check_mayaConnection("hello?")
#print (check , res )