@echo off
REM ------------------------------------------------------------
REM Maya 2020 Python 2.7용 .pyd 빌드 배치
REM VS 2026 Build Tools + v143 + SDK 19041 기준
REM ------------------------------------------------------------


REM ------------------------------------------------------------
REM Visual Studio 2026 x64 컴파일 환경 활성화
REM ------------------------------------------------------------
REM cl.exe / link.exe / include / lib 환경변수 자동 세팅
REM 이걸 안 하면 mayapy가 최신 컴파일러를 못 찾음
call "C:\Program Files (x86)\Microsoft Visual Studio\18\BuildTools\VC\Auxiliary\Build\vcvars64.bat"


REM ------------------------------------------------------------
REM setuptools에게 현재 활성화된 컴파일러 환경 강제 사용
REM ------------------------------------------------------------
REM mayapy 기본 v140 탐색 로직을 우회
REM 방금 위에서 연 VS2026(v143)를 그대로 사용하게 만듦
set DISTUTILS_USE_SDK=1
set MSSdk=1


REM ------------------------------------------------------------
REM Windows SDK 버전 고정
REM ------------------------------------------------------------
REM 최신 SDK(26100)는 Python2.7 + Maya2020에서 충돌 가능
REM 안정적인 19041 사용
set WindowsSdkDir=C:\Program Files (x86)\Windows Kits\10\
set WindowsSDKVersion=10.0.19041.0\


REM ------------------------------------------------------------
REM 이전 빌드 캐시 삭제
REM ------------------------------------------------------------
REM 오래된 .c / .pyd / build 캐시 때문에
REM 잘못된 include 경로가 재사용되는 문제 방지
if exist build rmdir /s /q build
if exist StandOuterTool2020.c del /f /q StandOuterTool2020.c
if exist StandOuterTool2020.pyd del /f /q StandOuterTool2020.pyd


REM ------------------------------------------------------------
REM Maya 2020 내장 Python(mayapy)로 빌드 실행
REM ------------------------------------------------------------
REM 반드시 mayapy를 써야 Maya Python ABI와 일치
"C:\Program Files\Autodesk\Maya2020\bin\mayapy.exe" setup2020.py build_ext --inplace


REM 결과 확인용 일시정지
pause