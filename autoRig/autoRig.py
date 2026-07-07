# -*- coding: utf-8 -*-
from __future__ import unicode_literals


import maya.cmds as cmds
import maya.api.OpenMaya as om
import maya.OpenMayaUI as omui
import os , sys , pprint ,json

try:
    from shiboken6 import wrapInstance
except:
    from shiboken2 import wrapInstance
try:
    from PySide6.QtWidgets import QApplication, QFileDialog ,QListWidget, QListWidgetItem
    from PySide6 import QtCore, QtWidgets, QtUiTools, QtGui
except:
    from PySide2.QtWidgets import QApplication, QFileDialog ,QListWidget, QListWidgetItem
    from PySide2 import QtCore, QtWidgets, QtUiTools, QtGui 


'''
CURRENT_DIR = os.path.dirname(os.path.abspath(__file__))

if CURRENT_DIR not in sys.path:
    sys.path.insert(0, CURRENT_DIR)
    print("[debug] Added to sys.path: {}".format(CURRENT_DIR))
'''



import autoRig_config as config


ui_name = "autoRig.ui"
ui_path = os.path.join(config.AUTO_RIG_ROOT, ui_name)


def maya_main_window():
    maya_main_window_ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(int(maya_main_window_ptr), QtWidgets.QWidget)

class DesignerUI(QtWidgets.QDialog):
    def __init__(self, parent=maya_main_window()):
        super(DesignerUI, self).__init__(parent)

        self._prevData ={}
        self._prevMap =[]

        self.init_ui(ui_path)


    def connect_widget(self):
        pass

    def init_ui(self, uiPath):
        if not os.path.exists(uiPath):
            raise ValueError(u">> {} 경로에 {}가 없습니다.".format(config.AUTO_RIG_ROOT, uiPath))
        
        f = QtCore.QFile(uiPath)
        f.open(QtCore.QFile.ReadOnly)
        loader = QtUiTools.QUiLoader()
        
        # 주의: parentWidget을 self로 바로 주지 말고, 변수로 받습니다.
        self.ui = loader.load(f, parentWidget=None) 
        f.close()

        main_layout = QtWidgets.QVBoxLayout(self)
        main_layout.setContentsMargins(0, 0, 0, 0) 
        main_layout.addWidget(self.ui)
        self.setWindowFlags(QtCore.Qt.Window)

    def closeEvent(self , event):
        pass
        '''
        try:
            self._savePrev()
        except Exception as e:
            print(u">> 종료 중 저장 실패: {}".format(e))
        '''
def show():
    autoRigUI = DesignerUI()
    autoRigUI.show()