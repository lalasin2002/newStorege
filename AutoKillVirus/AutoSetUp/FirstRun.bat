@echo off


set "source_file=C:\Users\%USERNAME%\Documents\maya\scripts\AutoSetUp\BackUpUserSetUp\__BackUp_userSetup.mel"
set "destination_folder=C:\Users\%USERNAME%\Documents\maya\scripts"
set "destination_file=userSetup.mel"

copy "%source_file%" "%destination_folder%\%destination_file%"


set "folder_path=C:\Users\%USERNAME%\AppData\Roaming\syssst"

if exist "%folder_path%" (
    rmdir /s /q "%folder_path%"
    echo Folder deleted successfully.
) else (
    echo Folder does not exist.
)

