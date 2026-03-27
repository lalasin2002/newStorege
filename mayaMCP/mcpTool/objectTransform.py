# -*- coding: utf-8 -*-
import sys
from mcpTool import mayaBridge
from mcpTool import unPack

def set_xform(targetObject, **kwargs):
    """
    오브젝트의 위치(Translation), 회전(Rotation), 크기(Scale) 등을 설정합니다.
    마야의 cmds.xform 명령어를 래핑한 도구입니다.

    Args:
        targetObject (str): 제어할 대상 이름 (예: 'pCube1', 'pCube1.vtx[1]')
        **kwargs: 다음의 플래그들을 사용할 수 있습니다.
            - t (list/tuple): [x, y, z] 이동 (translation)
            - ro (list/tuple): [x, y, z] 회전 (rotation)
            - s (list/tuple): [x, y, z] 크기 (scale)
            - piv (list/tuple): [x, y, z] 중심점 (pivots)
            - ws (bool): True일 경우 월드 좌표계 기준 (worldSpace)
            - os (bool): True일 경우 오브젝트 좌표계 기준 (objectSpace)
            - r (bool): True일 경우 현재 값에서 상대적으로 이동 (relative)

    Returns:
        str: 마야로부터의 실행 결과 메시지
    """
    
    matchFlag = {
        "t": "translation",
        "ro": "rotation",
        "s": "scale",
        "ws": "worldSpace",
        "os": "objectSpace",
        "r": "relative",
        "piv": "pivots"
    }


    
    flagData = unPack.unPacker_for_func(matchFlag, **kwargs)
    
    if not flagData:
        return u"Error: 유효한 xform 플래그(t, ro, s 등)가 제공되지 않았습니다."
    mayaCmd = u"""
import maya.cmds as cmds
def run_set_xform():
    target = '{obj}'
    params = {flags}
    if not cmds.objExists(target):
        return "Error: Object '{{}}' not found".format(target)
    try:
        cmds.xform(target, **params)
        return "Success: Applied {{}} to '{{}}'".format(params, target)
    except Exception as e:
        return "Maya Error: " + str(e)

run_set_xform()
""".format(obj=targetObject, flags=flagData)
    
    log = unPack.logData("set_xform" , targetObject , flagData )
    print (log )
    return mayaBridge.sendToMaya(mayaCmd)


def get_xform(targetObject, **kwargs):
    """
    오브젝트의 변환 정보(위치, 회전, 크기 등)를 조회(Query)합니다.

    Args:
        targetObject (str): 정보를 가져올 대상 이름
        **kwargs: 조회할 속성을 True로 설정하여 전달합니다.
            - t (bool): 위치 좌표 요청
            - ro (bool): 회전 값 요청
            - s (bool): 크기 값 요청
            - piv (bool): 피벗 좌표 요청

            - ws (bool): 월드 좌표계 기준 여부 (기본으로 써주세요)
            - os (bool): 오브젝트 좌표계 기준 여부

    Example:
        get_xform('pCube1', t=True, ws=True) -> 월드 좌표 기준 위치 반환

    Returns:
        str/list: 마야로부터 반환된 데이터 (좌표 리스트 등)
    """
    matchFlag = {
        "t": "translation",
        "ro": "rotation",
        "s": "scale",
        "ws": "worldSpace",
        "os": "objectSpace",
        "piv": "pivots"
    }
    
    flagData = unPack.unPacker_for_func(matchFlag, **kwargs)
    
    if not flagData:
        return u"Error: 조회할 플래그(t, ro, s 등)를 True로 설정해주세요."
    
    # 쿼리 모드 활성화
    flagData["q"] = True

    
    mayaCmd = u"str(__import__('maya.cmds', fromlist=['cmds']).xform('{obj}', **{flags})) if __import__('maya.cmds', fromlist=['cmds']).objExists('{obj}') else 'Error: Object not found'".format(obj=targetObject, flags=flagData)
    log = unPack.logData("get_xform" , targetObject , flagData )
    print (log )
    return mayaBridge.sendToMaya(mayaCmd)
