@echo off
REM ------------------------------------------------------------
REM Maya 2025 Python 3.11용 .pyd 빌드 배치
REM ------------------------------------------------------------

call "C:\Program Files (x86)\Microsoft Visual Studio\18\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

set DISTUTILS_USE_SDK=1
set MSSdk=1
set WindowsSdkDir=C:\Program Files (x86)\Windows Kits\10\
set WindowsSDKVersion=10.0.19041.0\

REM 빌드 캐시 및 2025 타겟 파일 삭제
if exist build rmdir /s /q build
if exist StandOuterTool2025.c del /f /q StandOuterTool2025.c
if exist StandOuterTool2025.pyd del /f /q StandOuterTool2025.pyd

REM Maya 2025 mayapy로 실행 (setup2025.py를 읽도록 변경)
"C:\Program Files\Autodesk\Maya2025\bin\mayapy.exe" setup2025.py build_ext --inplace

pause