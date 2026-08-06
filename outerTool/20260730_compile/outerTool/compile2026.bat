@echo off
setlocal

REM Maya 2026 / Python 3.11 / 64-bit Cython extension build
call "C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvars64.bat"
if errorlevel 1 goto :error

set "DISTUTILS_USE_SDK=1"
set "MSSdk=1"
REM Reuse Cython from Maya 2025 only as a build-time tool.
set "PYTHONPATH=C:\Program Files\Autodesk\Maya2025\Python\Lib\site-packages"

if exist "build" rmdir /s /q "build"
if exist "StandOuterTool2026.c" del /f /q "StandOuterTool2026.c"
if exist "StandOuterTool2026.pyd" del /f /q "StandOuterTool2026.pyd"
if exist "StandOuterTool2026.cp311-win_amd64.pyd" del /f /q "StandOuterTool2026.cp311-win_amd64.pyd"

"C:\Program Files\Autodesk\Maya2026\bin\mayapy.exe" setup2026.py build_ext --inplace
if errorlevel 1 goto :error

echo.
echo Maya 2026 build completed successfully.
goto :end

:error
echo.
echo Maya 2026 build failed.

:end
pause
endlocal
