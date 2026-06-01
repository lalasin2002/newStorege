# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.OpenMayaUI as omui
## 모듈로 불러와서 쓰지 말고 그냥 복붙할것 // 참고용

try:
    from shiboken6 import wrapInstance
except:
    from shiboken2 import wrapInstance


try:
    from PySide6.QtWidgets import QApplication, QFileDialog
    from PySide6 import QtCore, QtWidgets, QtUiTools, QtGui 
except:
    from PySide2.QtWidgets import QApplication, QFileDialog
    from PySide2 import QtCore, QtWidgets, QtUiTools, QtGui 
    



def maya_main_window():
    maya_main_window_ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(int(maya_main_window_ptr), QtWidgets.QWidget)