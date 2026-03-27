# -*- coding: utf-8 -*-
import socket

def sendToMaya(CommandStr , Port = 7001 , log =True):
    st = ""
    Response = None
    st += u"-----"*2 + "sendToMaya" + u"-----"*2 +"\n"
    try:
        # 소켓설정 : IPv4 방식(AF_INET) 사용 , TCP 방식(SOCK_STREAM)
        Client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        # 연결 : 127.0.0.1(내 컴퓨터) 이라는 경로로 포트넘버 7001에 연결 
        Client.connect(('127.0.0.1', Port))
        # 메시지 전송
        Client.send(CommandStr.encode('utf-8'))
        # 최대 1024바이트만큼 읽어옴. 받은 바이트를 다시 문자열로 해독(decode)
        Response = Client.recv(1024).decode()
        Client.close()
        
        # 마야가 아무런 메시지를 돌려주지 않았을 경우를 대비한 방어 코드
        if not Response:
            Response = "Success: The command was executed in Maya, but no message was returned."
            st += (u"마야가 응답하지 않았지만, 성공으로 간주합니다.\n")
        else:
            st += (u"마야 명령수신 : {}\n" .format(Response))

    except Exception as e:
        st += (u"마야 연결 실패: {}\n".format(e))
        Response = (u"에러: 마야 연결에 실패했습니다. commandPort가 열려있는지 확인하세요.")
    if log:
        print (st)
    return Response 
