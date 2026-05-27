# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import maya.cmds as cmds
import maya.mel as mel
import re ,os



def get_currentFilePath():
    fileName = cmds.file(query=True, sceneName=True)
    absPath = fileName.replace("//" , r"\\")
    dirPath , fileName = os.path.split(absPath)

    return dirPath , fileName


dirPath , fileName = get_currentFilePath()

print (u"디렉토리 :: {}" .format(dirPath))
print (u"현재파일 :: {}" .format(fileName))
