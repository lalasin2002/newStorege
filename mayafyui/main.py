# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import sys , os ,re ,json ,io ,time

try:
    from PySide6 import QtWidgets, QtCore, QtUiTools , QtGui
except:
    from PySide2 import QtWidgets, QtCore, QtUiTools , QtGui


def pathAppend(log = True):
    # __file__ 현재 작업중인 파일 위치
    #os.path.dirname (경로)의 메인폴더 위치
    st = u"-----"*2 + "{}" + u"-----"*2 +"\n"
    st = st.format("pathAppend")
    CurrentDir = os.path.dirname(os.path.abspath(__file__))
    if not CurrentDir in sys.path:
        sys.path.append(CurrentDir)
        st+= "sys.path 등록 : {}\n".format(CurrentDir)
    else:
        st+= "sys.path 이미등록됨 : {}\n".format(CurrentDir)

    if log:
        print (st)

curentPath = os.path.dirname(os.path.abspath(__file__))
jsonPath = os.path.join(curentPath , "_prev.json")
uiPath =os.path.join(curentPath , "mayafyui.ui")





class DesignerUI(QtWidgets.QDialog):
    def __init__(self , parent = None):
        super(DesignerUI ,self).__init__(parent) 


    def init_ui(self , path ):

