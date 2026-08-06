import maya.cmds as cmds
import maya.mel as mel
import pprint


def nonCntShapes(Type):
    List = []
    shapes = cmds.ls(type = Type) or []
    for x in shapes:
        IsInCnt = cmds.listConnections(x ,s =1)
        IsOutCnt = cmds.listConnections(x ,d =1)
        
        if not IsInCnt and not IsOutCnt:
            List.append(x)
    return List
    
    
def deleteUnusedNodes():
    log = None
    errorLog = None

    try:
        mel.eval('source "MLdeleteUnused.mel"; MLdeleteUnused;')
        log = u">> [delete UnusedNode] : 고아 Node 모두 제거 \n"
    except Exception as e:
        errorLog = u">> [delete UnusedNode] !! 제거실패 !!\n"
        errorLog += u">> [delete UnusedNode] 상세내용 {}\n".format(e)

    return {"deleteLog" : log ,"errorLog" : errorLog }
        
                

unusedLog = deleteUnusedNodes()
findMesh = nonCntShapes("mesh")
#findnurbsCurves = nonCntShapes("mesh")

total = findMesh
for i ,x in enumerate(total):
    print (i ,x)
    cmds.delete(x)