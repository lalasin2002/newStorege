# -*- coding: utf-8 -*-
import sys, os
import maya.cmds as cmds
import maya.mel as mel


def onMayaDroppedPythonFile(*args):
    current_file_path = os.path.normpath(__file__)
    current_dir = os.path.dirname(current_file_path)
    Missingfiles = []

    isDirOptimizer = False
    if "nHairManager" in current_dir and os.path.exists(current_dir):
        isDirOptimizer = True
    
    UiFile = os.path.join(current_dir ,"nHairManager.ui" )
    CodeFile = os.path.join(current_dir ,"nHairManager.py")
    CodePycFile = os.path.join(current_dir ,"nHairManagerr.pyc")
    #InstallFile = os.path.join(current_dir, "install.py" )

    if not os.path.exists(UiFile):
        Missingfiles.append("nHairManager.ui")

    if not (os.path.exists(CodeFile) or os.path.exists(CodePycFile)):
        Missingfiles.append("nHairManager.py")

    if isDirOptimizer == False:
        cmds.confirmDialog( title = u"'nHairManager 폴더' 채로두세요 " ,message = u"선생님도 밖에서 일하고 싶지 않을실텐데 ,  nHairManager 건물을 버리고  nHairManager.ui , nHairManager.py 직원을 어디에 내보네십니까?" , button=[u"제발 '폴더'채로"] )
        return
    
    if Missingfiles:
        missing_str = ", ".join(Missingfiles)
        cmds.confirmDialog(title= u"주요 파일이 없음", message = u"{a} 이 없습니다 , nHairManager폴더에 고용직원 {a} 들이 없는데 어떻게 일이 가능할까요?" .format(a = missing_str)  ,button=[u"파일을 확인하세요"] )
        return


    command_template = """
import sys
import os

ToolPath = r"{path}"
if ToolPath not in sys.path:
    
    sys.path.append(ToolPath)

import nHairManager
if sys.version_info[0] >= 3:
    import importlib
    importlib.reload(nHairManager)
else:
    reload(nHairManager)

if __name__ == "__main__":
    try:
        nHairManagerUi.close()
        nHairManagerUi.deleteLater()
    except:
        pass

    nHairManagerUi = nHairManager.DesignerUI()
    nHairManagerUi.show()
"""

    final_command = command_template.format(path=current_dir)

    gShelfTopLevel = mel.eval('$tmpVar=$gShelfTopLevel')
    current_shelf = cmds.tabLayout(gShelfTopLevel, query=True, selectTab=True)


    cmds.shelfButton(
        parent=current_shelf,
        annotation="nHairManagerr Tool",
        label="nHairManager",
        image="pythonFamily.png",
        command=final_command,
        sourceType="python",
        imageOverlayLabel="nHairManager", 
        overlayLabelColor=(1, .25, .25)
    )
    cmds.confirmDialog(
        title= u"설치 완료",
        message=u"설치 경로(sys.path) :: {}\n\n nHairManager 버튼 생성 위치 :: {}" .format(current_dir ,current_shelf),
        button=["Close"]
    )