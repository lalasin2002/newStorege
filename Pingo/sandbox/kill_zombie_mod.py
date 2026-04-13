# -*- coding: utf-8 -*-
import sys
import os

def Kill_Zombie_Modules_And_Reload(folder):
    """
    sys.modules에 꼬여있는 기존 모듈 메모리를 강제로 삭제하고 깨끗하게 재연결합니다.
    Args:
        없음
    Returns:
        없음
    """
    # 1. 마야 메모리에 남아있는 Def 관련 모든 모듈 강제 삭제
    # Python 3.x 호환을 위해 list()로 감싸서 반복
    modules_to_delete = [mod for mod in list(sys.modules.keys()) if mod.startswith(folder)]
    
    if modules_to_delete:
        for mod in modules_to_delete:
            del sys.modules[mod]
            print(u"마야 메모리에서 강제 삭제 완료: " + mod)
    else:
        print(u"메모리에 삭제할 모듈이 없습니다.")

    # 2. 최우선 순위로 경로 다시 설정
    path = r"D:\Code\MayaCode\completeCode"
    Abspath = os.path.abspath(path)
    if Abspath not in sys.path:
        sys.path.insert(0, Abspath)



Kill_Zombie_Modules_And_Reload("Def")