import maya.cmds as cmds

def Setup_Maya_Listener(PortNum=7001):
    """
    마야가 외부 명령을 받을 수 있도록 포트를 개방합니다.
    Args:
        -PortNum (int): 통신에 사용할 포트 번호 (기본 7001)
    """
    PortAddr = ":{}".format(PortNum)
    if cmds.commandPort(PortAddr, q=True):
        cmds.commandPort(name=PortAddr, cl=True)
        
    cmds.commandPort(name=PortAddr, stp="python")
    print(u"마야 리스너 활성화: {}번 포트가 열렸습니다.".format(PortNum))

Setup_Maya_Listener(7001)