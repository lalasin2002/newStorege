# -*- coding: utf-8 -*-
import sys, os
import maya.cmds as cmds
import maya.mel as mel


def onMayaDroppedPythonFile(*args):
    current_file_path = os.path.normpath(__file__)
    current_dir = os.path.dirname(current_file_path)
    missingfiles = []
    checkCodeFiles = ["userTool.py" , "userTool.pyc"]
    checkOthers = ["userTool.ui","function"]
    
    isCode = False
    isOthers= False
    isDir = False

    if "userTool" in current_dir and os.path.exists(current_dir):
        isDir = True

    nonExistCodes =[]
    for codeFile in checkCodeFiles:
        codePath = os.path.join(current_dir ,  codeFile )
        if not os.path.exists(codePath):
            nonExistCodes.append(codeFile)
        else:
            isCode = True
            break

    if isCode == False:
        missingfiles += nonExistCodes

    
    for other in checkOthers:
        otherPath = os.path.join(current_dir , other)
        if not os.path.exists(otherPath):
            missingfiles.append(other)

    if not checkOthers in missingfiles:
        isOthers = True

    if isDir == False:
        cmds.confirmDialog( title = u"'userTool 폴더' 채로두세요" , message = "userTool 폴더 안이 아님",button=[u"확인"] )
        return
    
    if missingfiles:
        missing_str = ", ".join(missingfiles)
        cmds.confirmDialog(title= u"주요 파일이 없음", message = u"{a} 이 없습니다" .format(a = missing_str)  ,button=[u"파일을 확인하세요"] )
        return
    
    command_template = """
import sys
import os
ToolPath = r"{path}"

if ToolPath not in sys.path:
    sys.path.append(ToolPath)

parentPath = os.path.dirname(ToolPath)
if parentPath not in sys.path:
    sys.path.append(parentPath)

import userTool
try:
    import importlib
    importlib.reload(userTool)
except:
    reload(userTool)

if __name__ == "__main__":
    try:
        userToolUi.close()
        userToolUi.deleteLater()
    except:
        pass

    userToolUi = userTool.DesignerUI()
    userToolUi.show()
"""
    final_command = command_template.format(path=current_dir)
    gShelfTopLevel = mel.eval('$tmpVar=$gShelfTopLevel')
    current_shelf = cmds.tabLayout(gShelfTopLevel, query=True, selectTab=True)

    cmds.shelfButton(
        parent=current_shelf,
        annotation="userTool",
        label="userTool",
        image="pythonFamily.png",
        command=final_command,
        sourceType="python",
        imageOverlayLabel="userTool", 
        overlayLabelColor=(1, .25, .25)
    )
    cmds.confirmDialog(
        title= u"설치 완료",
        message=u"설치 경로(sys.path) :: {}\n\n userTool 버튼 생성 위치 :: {}" .format(current_dir ,current_shelf),
        button=["Close"]
    )
    
            

    



    
        