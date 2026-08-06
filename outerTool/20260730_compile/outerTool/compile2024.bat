@echo off
setlocal

REM Maya 2024 / Python 3.10 / 64-bit Cython extension build
call "C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvars64.bat"
if errorlevel 1 goto :error

set "DISTUTILS_USE_SDK=1"
set "MSSdk=1"

if exist "build" rmdir /s /q "build"
if exist "StandOuterTool2024.c" del /f /q "StandOuterTool2024.c"
if exist "StandOuterTool2024.pyd" del /f /q "StandOuterTool2024.pyd"
if exist "StandOuterTool2024.cp310-win_amd64.pyd" del /f /q "StandOuterTool2024.cp310-win_amd64.pyd"

py -V:3.10 setup2024.py build_ext --inplace
if errorlevel 1 goto :error

echo.
echo Maya 2024 build completed successfully.
goto :end

:error
echo.
echo Maya 2024 build failed.

:end
pause
endlocal
