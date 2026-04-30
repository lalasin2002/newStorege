# -*- coding: utf-8 -*-
from functools import wraps
import maya.cmds as cmds



'''
-사용법 : 
@undo_chunk
def build():
pass
는 build = undoChunk(build)와 같다.
'''

def undoChunk(func):
    """
    코드 undo 기능 (데코레이터)
    Args:
        -func (function): undo 기능으로 감쌀(포장할) 대상 원래 함수
    Returns:
        wrapper (function): 원래 함수를 대신해서 실행될 포장지 함수
    """
    
    # @wraps: 진짜 함수(func)의 주석과 이름을 포장지(wrapper) 겉면에 그대로 베껴 적어줌
    @wraps(func)
    def wrapper(*args, **kwargs):
        """
        원래 함수 대신 실행되는 포장지 역할
        Args:
            -*args: 나중에 사용자가 원래 함수를 부를 때 넣는 값들
            -**kwargs: 나중에 사용자가 원래 함수를 부를 때 넣는 키워드 값들
        Returns:
            원래 함수의 반환값
        """
        
        try:
            # [포장지 앞면 작동]
            cmds.undoInfo(openChunk=True)
            
            # [진짜 알맹이 작동]
            # wrapper가 가로채서 받은 인자(*args, **kwargs)를 
            # 잊지 않고 진짜 함수(func)에게 넘겨주며 실행시킴.
            # 이 줄이 없으면 Undo 스위치만 켜지고 진짜 작업(모델링 등)은 아예 실행되지 않음.
            return func(*args, **kwargs)
            
        finally:
            # [포장지 뒷면 작동]
            cmds.undoInfo(closeChunk=True)
            
    # 스크립트를 처음 읽을 때(1단계), 원래 함수의 이름표를 이 wrapper로 둔갑시킴
    return wrapper