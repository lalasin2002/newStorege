from mcp.server.fastmcp import FastMCP
import maya.cmds as cmds #작성용
import os, sys
import mayaBridge

def pathAppend(log = True):
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

mcp = FastMCP("mayaMCP_server")

@mcp.tool()
def set_xform_translate(object , posData = [0,0,0] ,log = True):
    """
    오브젝트의 월드 좌표 위치를 지정한 값으로 이동시키기
    Args:
        -TargetObj (str): 이동시킬 오브젝트의 이름
        -posData   (list): x, y, z 좌표값을 담은 리스트
        -log       (bool): 로그 출력 여부
    Returns:
        마야 처리 결과 (str)
    """
    st = u"-----"*2 + "{}" + u"-----"*2 +"\n"
    st = st.format("set_xform_translate")
    
    mayaCmd = '''
import maya.cmds as cmds
ResultMsg = ""
isExist = cmds.objExists('{obj}')
if isExist:
    # pos는 리스트 형태로 들어가야 하므로 따옴표를 제거합니다.
    cmds.xform('{obj}', ws=True, t={pos}) 
    ResultMsg = "Success: Moved '{obj}' to {pos}"
else:
    ResultMsg = "Error: '{obj}' does not exist"
ResultMsg
'''.format(obj = object , pos = posData )
    st += u"Ai 요청 수신 : xform({obj}, ws =1 , t = {pos})\n".format (obj = object , pos = posData )
    if log:
        print (st)
    Response = mayaBridge.sendToMaya(mayaCmd)
    return Response

