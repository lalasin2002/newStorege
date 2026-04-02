
@echo off
set MAYAPY="c:\program files\autodesk\maya2025\bin\mayapy.exe"

set SCRIPT="%~dp0StandOuterTool.py"

%MAYAPY% %SCRIPT%

echo ==========================================
echo Execution Finished. Check errors above.
echo ==========================================

pause