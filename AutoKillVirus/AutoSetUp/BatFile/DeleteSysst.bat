@echo off
set "folder_path=C:\Users\%USERNAME%\AppData\Roaming\syssst"

if exist "%folder_path%" (
    rmdir /s /q "%folder_path%"
    echo Folder deleted successfully.
) else (
    echo Folder does not exist.
)