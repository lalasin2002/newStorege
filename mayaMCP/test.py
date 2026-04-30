# -*- coding: utf-8 -*-
import sys
import os
import inspect
import pprint

# 경로 설정
path = os.path.abspath(r"D:\Code\MayaCode\mayaMCP")
if path not in sys.path:
    sys.path.append(path)

# 모듈 임포트 (이때 translateTool.py를 읽어오며 에러가 발생했던 것임)
from mayaMCP.mcpTool import objectTransform

def get_moduleTools(module):
    """
    모듈 내의 함수 리스트 반환
    Args:
        -module (module): 대상 모듈
    Returns:
        함수 리스트(list)
    """
    return [func for name, func in inspect.getmembers(module, inspect.isfunction)]

# 실행
tool_list = get_moduleTools(objectTransform)
pprint.pprint(tool_list)