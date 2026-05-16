# -*- coding: utf-8 -*-

import os
try:
    from PySide6 import QtWidgets, QtCore, QtUiTools , QtGui 
    from PySide6.QtWidgets import QApplication, QFileDialog
    
except:
    from PySide2 import QtWidgets, QtCore, QtUiTools , QtGui 
    from PySide2.QtWidgets import QApplication, QFileDialog


def open_directory( path):
    isPath = os.path.exists(path)
    if isPath == False:
        os.mkdir(path) 
    os.startfile(path)

def change_Label( templete  , widget ):
    widget.setText(templete )

def set_existingDirectoryPath(parent , path  ,string = "select folder" ):
    options = QFileDialog.getExistingDirectory(parent, string , path)
    return options


def set_imageToLabel( path , widget):
        pixmap = QtGui.QPixmap(path)
        # 라벨 위젯의 현재 사이즈에 맞게 스케일링 (안티앨리어싱 적용)
        scaled_pixmap = pixmap.scaled(
            widget.size(),
            QtCore.Qt.KeepAspectRatio,
            QtCore.Qt.SmoothTransformation
        )
        widget.setPixmap(scaled_pixmap)

def add_imagesToPreviewList(path , widget , prefix="snap_", ext=".jpg"):
    widget.clear()

    #widget.setViewMode(QtWidgets.QListView.IconMode)  # 아이콘이 위, 텍스트가 아래로 가는 중앙 정렬 모드
    #widget.setResizeMode(QtWidgets.QListView.Adjust)  # 창 크기를 조절하면 아이템들이 알아서 다음 줄로 넘어감 (반응형)
    #widget.setMovement(QtWidgets.QListView.Static)    # 아이콘을 마우스로 드래그해서 위치를 망가뜨리는 것 방지
    
    files = [f for f in os.listdir(path) if f.startswith(prefix) and f.endswith(ext)]
    files.sort()


    for fileName in files:
        fullPath = os.path.join(path, fileName).replace("\\", "/")
        reader = QtGui.QImageReader(fullPath)
        size = reader.size()

        icon = QtGui.QIcon(fullPath)
        item = QtWidgets.QListWidgetItem(icon, fileName)
        item.setTextAlignment(QtCore.Qt.AlignCenter)
        item.setData(QtCore.Qt.UserRole, fullPath)
        item.setData(QtCore.Qt.UserRole +1 , fileName)
        item.setData(QtCore.Qt.UserRole +2 , [size.width() , size.height()])
        
        widget.addItem(item)

def delete_QwidgetItems( Qwidget):
    selects = Qwidget.selectedItems()
    if not selects:
        return
    for item in selects:
        row = Qwidget.row(item)
        Qwidget.takeItem(row)
        imagePath =item.data(QtCore.Qt.UserRole)
        try:
            os.remove(imagePath)
        except Exception as e:
            print (">> 이미지 삭제 에러 : {}" .format (e))

        del item


def setDefault_QcomboBox(Qwidget , string ):
    
    count = Qwidget.count()
    Qwidget.clear()
    if count == 0:
        Qwidget.addItem(string)
    