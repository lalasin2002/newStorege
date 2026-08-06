@echo off
setlocal

set "MAYAPY_PATH=C:\Program Files\Autodesk\Maya2024\bin\mayapy.exe"
set "LAUNCHER_SCRIPT=%~dp0run.py"

if not exist "%MAYAPY_PATH%" (
    echo [ERROR] Maya 2024 mayapy.exe was not found:
    echo "%MAYAPY_PATH%"
    pause
    exit /b 1
)

if not exist "%LAUNCHER_SCRIPT%" (
    echo [ERROR] Launcher script was not found:
    echo "%LAUNCHER_SCRIPT%"
    pause
    exit /b 1
)

echo Starting StandOuterTool for Maya 2024...
"%MAYAPY_PATH%" "%LAUNCHER_SCRIPT%"
set "EXIT_CODE=%ERRORLEVEL%"

echo.
echo StandOuterTool process finished with exit code %EXIT_CODE%.
pause
endlocal & exit /b %EXIT_CODE%
