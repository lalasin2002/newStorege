@echo off
chcp 65001 >nul

REM ------------------------------------------------------------
REM Maya 2022 Python 3.7용 .pyd 빌드 배치 (일반 파이썬 사용)
REM ------------------------------------------------------------

call "C:\Program Files (x86)\Microsoft Visual Studio\18\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

set DISTUTILS_USE_SDK=1
set MSSdk=1
set WindowsSdkDir=C:\Program Files (x86)\Windows Kits\10\
set WindowsSDKVersion=10.0.19041.0\

REM 이전 빌드 캐시 삭제
if exist build rmdir /s /q build
if exist StandOuterTool2022.c del /f /q StandOuterTool2022.c
if exist StandOuterTool2022.pyd del /f /q StandOuterTool2022.pyd

REM ------------------------------------------------------------
REM [핵심] 방금 설치한 순정 파이썬 3.7 경로 (질문자님 PC 기준)
set PYTHON_PATH="C:\Users\P097\AppData\Local\Programs\Python\Python37\python.exe"

REM 1. Cython 모듈 자동 설치
echo 컴파일러(Cython) 모듈을 설치/확인합니다...
%PYTHON_PATH% -m pip install Cython setuptools

REM 2. 마야 2022용 컴파일 실행
echo 컴파일을 시작합니다...
%PYTHON_PATH% setup2022.py build_ext --inplace

pause