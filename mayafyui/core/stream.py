
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import sys 
try:
    from PySide6 import QtCore
except:
    from PySide2 import QtCore



if sys.version_info[0] < 3:
    text_type = unicode
else:
    text_type = str




class EmittingStream(QtCore.QObject):
    textWritten = QtCore.Signal(text_type) 

    def __init__(self):
        super(EmittingStream, self).__init__()
        '''
        self.ignore_keywords = [
            "Arnold",           # 아놀드 렌더러 로그
            "oiio",             # OpenImageIO 로그
            "qt.svg",           # Qt 아이콘 에러
            "loading metadata", # 아놀드 메타데이터 로딩
            "loading plugins",  # 플러그인 로딩 잡다한 소리
            "Global variable",  # 멜 스크립트 전역 변수 경고 (imageFormats.mel 등)
            "NVLink",           # 그래픽카드 관련
            "rlm",              # 라이센스 관련
            "running on",       # 아놀드 실행 정보
        ]
        '''

        self._writing = False 

    def write(self, text):
        # EmittingStream 사용중인지 확인
        if self._writing:
            return
        
        self._writing = True
        try:
            # 내용이 있을 때만 신호 발사
            if text: 
                self.textWritten.emit(text)
            
            # [중요] 원래 콘솔(cmd)에도 찍어줌 (UI가 죽어도 cmd에선 보이게)
            sys.__stdout__.write(text)
            
        except Exception:
            # 혹시 에러나면 원래 콘솔에라도 뱉음
            sys.__stdout__.write(text)
            
        finally:
            # 3. 다 썼으니 깃발 내리기
            self._writing = False

    def flush(self):
        pass