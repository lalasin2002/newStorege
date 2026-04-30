@echo off

:: 1. 경로 변수 설정
set MAYAPY_PATH="C:\Program Files\Autodesk\Maya2022\bin\mayapy.exe"
set LAUNCHER_SCRIPT="%~dp0run.py"

:: 2. 마야 파이썬 유무 확인 (괄호 제거 완료)
if not exist %MAYAPY_PATH% (
    echo [에러] 해당 경로에서 마야 파이썬 mayapy.exe 를 찾을 수 없습니다.
    pause
    exit /b
)

:: 3. 툴 실행
echo 마야 파이썬 엔진을 구동합니다...
call %MAYAPY_PATH% %LAUNCHER_SCRIPT%

:: 4. 창 꺼짐 방지
echo.
echo [시스템] 프로세스가 종료되었습니다.
pause