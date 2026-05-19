
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import sys ,traceback
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
            if sys.__stdout__ is not None:
                sys.__stdout__.write(text)
        except Exception:
            if sys.__stdout__ is not None:
                sys.__stdout__.write(text)
            
        finally:
            # 3. 다 썼으니 깃발 내리기
            self._writing = False

    def flush(self):
        if sys.__stdout__ is not None:
            try:
                sys.__stdout__.flush()
            except Exception:
                pass

class thread(QtCore.QThread):
    progress_signal = QtCore.Signal(int)
    finished_signal = QtCore.Signal(str)
    error_signal = QtCore.Signal(str)
    def __init__(self, target_func, *args, **kwargs):
        """
        :param target_func: 스레드에서 실행할 메인 함수
        :param args: 함수에 전달할 인자
        :param kwargs: 함수에 전달할 키워드 인자
        """
        super(thread, self).__init__()
        self.target_func = target_func
        self.args = args
        self.kwargs = kwargs
        self._is_running = True
    def run(self):
        try:
            # 1. 실행할 함수(target_func)에 진행률과 종료 체크용 콜백 함수를 몰래 찔러 넣어줍니다.
            # (단, target_func가 이 kwargs를 받을 수 있게 정의되어 있어야 합니다.)
            self.kwargs['progress_callback'] = self.progress_signal.emit #emit 함수 안해서 작동시 나타나는 숫자
            self.kwargs['is_running_check'] = lambda: self._is_running

            # 
            result = self.target_func(*self.args, **self.kwargs) # 기존 함수에 self.kwargs ,

            # 3. 사용자가 강제 종료한 게 아니라면 완료 시그널 발송
            if self._is_running:
                self.finished_signal.emit(result)

        except Exception as e:
            err_msg = "{}\n{}".format(e, traceback.format_exc())
            self.error_signal.emit(err_msg)

    def stop(self):
        self._is_running = False