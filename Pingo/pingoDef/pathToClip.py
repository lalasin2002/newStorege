# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import maya.cmds as cmds
import maya.mel as mel
import re ,os

try:
    from PySide2.QtWidgets import QApplication
except ImportError:
    from PySide6.QtWidgets import QApplication

def get_currentFilePath():
    fileName = cmds.file(query=True, sceneName=True)
    absPath = fileName.replace("//" , r"\\")
    dirPath , fileName = os.path.split(absPath)

    return dirPath , fileName
    
def clipbodard(string):
    strings = QApplication.clipboard()
    strings.setText(dirPath)
    
    return strings.text()
    
    
dirPath , fileName = get_currentFilePath()
clipbodardData = clipbodard(dirPath)


print (u"복사 된 클립보드 :: {}" .format(clipbodardData))
print (u"   현재파일     :: {}" .format(fileName))

## 사용방법 
'''
1. 스크립트 실행
2. 현재 작업하는 씬의 경로의 폴더경로를 복사됨(Ctrl + C)
3. 저장시 경로를 불혀넣기 

'''



