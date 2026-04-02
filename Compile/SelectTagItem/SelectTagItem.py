# -*- coding: utf-8 -*-
import pprint

import maya.cmds as cmds
import maya.OpenMayaUI as omui
import maya.mel as mel
import getpass, sys, re, os 

from PySide2.QtWidgets import QApplication, QFileDialog ,  QListWidgetItem
from PySide2 import QtCore, QtWidgets, QtUiTools, QtGui
from shiboken2 import wrapInstance
from collections import OrderedDict
from functools import partial
PythonV = sys.version
Version = cmds.about(version=True)
User = getpass.getuser()
Folder = 'SelectTagItem'
UI_File = 'SelectTagItem.ui'

def d_PathDir():
    import inspect , os
    currentPath = inspect.getfile(inspect.currentframe())
    
    
    DirPath = os.path.dirname(currentPath)
    return DirPath


def d_PathBasic(User , Folder):
    Path = r"C:/Users/{}/Documents/maya/scripts/{}".format(User, Folder)
    return Path

def d_PathSysModule(Path):
    Module_Path = Path
    Dir_Path =os.path.dirname(Path)
    if not Module_Path in sys.path:
        sys.path.append(Module_Path)
    if not Dir_Path in sys.path:
        sys.path.append(Dir_Path)


Path =d_PathBasic(User , Folder)
Folder_Dir = []
for x in os.listdir(Path):
    Folder_Dir.append(x)

PathSys = [d_PathSysModule('{}/{}' .format(Path , x)) for x in Folder_Dir ]


# ------------------------------------------------------------------------------------

def d_Return_lst_QtListViewItem(QList):
    lst = []
    lst = [QList.item(i).text() for i in range(QList.count())]
    return lst


def d_Add_lst_QtListViewItem(QList , ItemLst , Clear = True , Align = "" ):
    Worklst = []
    QAlign = None
    item =None
    if Align == "Left" or Align ==  "":
        QAlign = QtCore.Qt.AlignLeft
    if Align == "Center":
        QAlign = QtCore.Qt.AlignHCenter
    if Align == "Right":
        QAlign = QtCore.Qt.AlignRight
    
    if type(ItemLst) == list and len(ItemLst) > 0:
        Worklst =  [x for i ,x in enumerate(ItemLst ) if x not in ItemLst[:i]]
    if Clear:
        QList.clear()
    
    
    for x in Worklst:
        item = QListWidgetItem(str(x))
        item.setTextAlignment(QAlign)

        QList.addItem(item)

def d_is_Attr_Match_String(Obj, AttrName, String):
    if cmds.objExists(Obj) == True:
        Attr = cmds.attributeQuery(AttrName, node=Obj, exists=True)
        if Attr == True:
            GetAttr = cmds.getAttr('{}.{}'.format(Obj, AttrName))
            if GetAttr == String:
                return True
            else:
                return False

def d_is_Duplicate_Name(Target , Type = "transform"):
    All_Objs = cmds.ls(long=True ,typ=Type )
    ShortTgtName = Target.split("|")[-1]
    DulicateLst = []
    for Obj in All_Objs:
        ShortName = Obj.split("|")[-1]
        if ShortName == ShortTgtName and Obj != Target:
            DulicateLst.append(Obj)

    if DulicateLst:
        return True
    else:
        return False
    

def d_Add_StringAttr(Target, LongName, String):
    Attr = cmds.attributeQuery(LongName, node=Target, exists=True)
    if not Attr == True:
        cmds.addAttr(Target, ln=LongName, dt="string")
        cmds.setAttr('{}.{}'.format(Target, LongName), String, type="string")
        GetAttr = LongName
        return GetAttr

def d_Delete_Attr(Target, LongName):
    Attr = cmds.attributeQuery(LongName, node=Target, exists=True)
    if Attr == True:
        AttrName = '{}.{}'.format(Target, LongName)
        cmds.deleteAttr(AttrName)


def maya_main_window():
    maya_main_window_ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(int(maya_main_window_ptr), QtWidgets.QWidget)



#-------------------------------------------------------------------------------------------------------



class DesignerUI(QtWidgets.QDialog):
    def __init__(self, parent=maya_main_window()):
        super(DesignerUI, self).__init__(parent)

        self.AttrName = "SelectTag"
        self.PresetTag_PrifixString =  "<Preset>"
        self.ExceptList = ["Ctrl"]
        self.TagStings = []
        self.AllSelectBool = False
        
        self.setWindowTitle("SelectTagItem")
        self.init_ui()
        self.Connect_Widget()
        self.Function_FindTagString()
        self.Function_InsertTagToCBB()
        self.Function_FindItem(self.ui.CBB_StringType.currentText() , self.ui.CBB_ObjType.currentText())
    

    def Connect_Widget(self):
        
        self.ui.Btn_PresetAddTag.clicked.connect(self.Funtction_Set_PreTag)
        self.ui.Btn_PresetAddTag.clicked.connect(self.Function_FindTagString)
        self.ui.Btn_PresetAddTag.clicked.connect(self.Function_InsertTagToCBB)
        self.ui.Btn_PresetAddTag.clicked.connect(lambda : self.Function_FindItem(self.ui.CBB_StringType.currentText() , self.ui.CBB_ObjType.currentText()))

        self.ui.Btn_PresetDeleteTag.clicked.connect(lambda :self.Function_Delete_PreTag() )
        self.ui.Btn_PresetDeleteTag.clicked.connect(self.Function_FindTagString)
        self.ui.Btn_PresetDeleteTag.clicked.connect(self.Function_InsertTagToCBB)
        self.ui.Btn_PresetDeleteTag.clicked.connect(lambda : self.Function_FindItem(self.ui.CBB_StringType.currentText() , self.ui.CBB_ObjType.currentText()))

        self.ui.Btn_PresetDeleteAllTag.clicked.connect(lambda :self.Function_Delete_PreTag(True))
        self.ui.Btn_PresetDeleteAllTag.clicked.connect(self.Function_FindTagString)
        self.ui.Btn_PresetDeleteAllTag.clicked.connect(self.Function_InsertTagToCBB)
        self.ui.Btn_PresetDeleteAllTag.clicked.connect(lambda : self.Function_FindItem(self.ui.CBB_StringType.currentText() , self.ui.CBB_ObjType.currentText()))

        self.ui.Btn_Search.clicked.connect(self.Function_FindTagString)
        self.ui.Btn_Search.clicked.connect(self.Function_InsertTagToCBB)
        self.ui.Btn_Reload.clicked.connect(lambda : self.Function_FindItem(self.ui.CBB_StringType.currentText() , self.ui.CBB_ObjType.currentText()))

        self.ui.LW_ItemList.itemClicked.connect(lambda : self.Function_Select_Interaction_ListItem(self.ui.LW_ItemList ))
        self.ui.LW_ItemList.itemSelectionChanged.connect(lambda : self.Function_Select_Interaction_ListItem(self.ui.LW_ItemList ))

        self.ui.Btn_SelectAll.clicked.connect(lambda : self.set_Function_Toggle_Select(self.ui.LW_ItemList))
        

            
    def set_Function_Toggle_Select(self , QList):

        if self.AllSelectBool == False:
            self.Function_Select_Interaction_ListItem(QList , True)
            self.Function_BtnToggle()
        else:
            self.Function_DeSelect_ListItem(self.ui.LW_ItemList)
            self.Function_BtnToggle()

    def Function_BtnToggle(self):
        self.AllSelectBool = not self.AllSelectBool
        print (self.AllSelectBool)


    def Function_DeSelect_ListItem(self ,  QList  ):
        LenQList = QList.count()
        for x in range(LenQList):
            Item = QList.item(x)
            Item.setSelected(False)

        cmds.select(cl =1)


    def Function_Select_Interaction_ListItem(self , QList , All_Select_Bool = False):
        SeletedWidgetItems = []
        if All_Select_Bool:
            LenQList = QList.count()
            for x in range(LenQList):
                Item = QList.item(x)
                Item.setSelected(True)

        WidgetItems = QList.selectedItems()  
        for item in WidgetItems:
            item = item.text().strip()
            itemObj = item.split(">>>")[-1]
            if cmds.objExists(itemObj):
                SeletedWidgetItems.append(itemObj)
            

        cmds.select(SeletedWidgetItems )

    def Function_Delete_PreTag(self , All = False):
        selectItmes = cmds.ls(sl =1 , type = "transform")
        if All:
            selectItmes = cmds.ls(type = "transform" , l =1)
            selectItmes = [x for x in selectItmes if cmds.attributeQuery(self.AttrName , node =x , ex =1)]
        if len(selectItmes)>0:
            for x in selectItmes:
                AttrBool = cmds.attributeQuery(self.AttrName , node =x , ex =1)
                if AttrBool:
                    GetAttr = cmds.getAttr(x + ".{}" .format(self.AttrName))

                    if self.PresetTag_PrifixString in GetAttr:
                        d_Delete_Attr(x , self.AttrName)

    def Funtction_Set_PreTag(self):
        PresetTag_String = self.ui.LE_PresetTagName.text()
        PresetTag_String = PresetTag_String.strip()
        selectItmes = cmds.ls(sl =1 , type = "transform")

        Result_String = ""
        if len(PresetTag_String)> 0 :
            Result_String = "{}{}" .format(self.PresetTag_PrifixString , PresetTag_String)
            Result_String = Result_String.strip()

        if len(Result_String)>0:
            for x in selectItmes:
                d_Add_StringAttr(x , self.AttrName , Result_String)


    def Function_InsertTagToCBB(self):
        if len(self.TagStings)>0:
            self.ui.CBB_StringType.clear()
            self.ui.CBB_StringType.addItem("All")
            for x in self.TagStings:
                self.ui.CBB_StringType.addItem(x)

    def Function_FindTagString(self):
        self.ui.LE_FindString.clear()

        FindStringsList = []
        All_RN_Mesh_Transforms = cmds.ls("*.{}" .format(self.AttrName), "*:*.{}".format(self.AttrName) , "*:*:*.{}".format(self.AttrName)  ,  "*:*:*:*.{}".format(self.AttrName) , l= 1 , o=1 )

        for x in All_RN_Mesh_Transforms:
            if cmds.attributeQuery(self.AttrName  , node = x , ex =1):
                GetAttr = cmds.getAttr(x + ".{}".format(self.AttrName ) )

                FindStringsList.append(GetAttr)

        FindStringsList = list(set(FindStringsList))
        FindStringsList = [x.strip() for x in FindStringsList] 
        FindStrings = ",".join(FindStringsList)

        self.ui.LE_FindString.setText(FindStrings)
        self.Funtion_QueryFindStrings()


    def Funtion_QueryFindStrings(self):
        Strings = self.ui.LE_FindString.text()
        Strings = [x.strip() for x in Strings.split(",") ]
        Strings = list(set(Strings))
        self.TagStings = Strings


    
    def Function_FindItem(self , StringType  , ObjType):
        Dic = OrderedDict()
        WorkList = []
        ObjArrangeList = []
        InsertItemList = []


        StringType = [StringType]
        if StringType[0] == "All":
            StringType = self.TagStings

        if ObjType == "All":
            ObjType = ".+"

        Pattern = r"({})_([0-9]+)_(.+)" .format(ObjType)
        All_RN_Objs = cmds.ls("*.{}" .format(self.AttrName), "*:*.{}".format(self.AttrName) , "*:*:*.{}".format(self.AttrName)  ,  "*:*:*:*.{}".format(self.AttrName) , l= 1 , o=1 )


        if any ("|" in x  for x in All_RN_Objs):
            for Item in All_RN_Objs:
                if not d_is_Duplicate_Name(Item):
                    Item = Item.split("|")[-1]
                WorkList.append(Item)
                
        Key = None
        Value = []
        for Obj in WorkList:
            Search = re.search(Pattern , Obj)
            if Search:
                ObjArrangeList.append(Obj)

        for String in StringType:
            Key = None
            Value = []
            for Obj in ObjArrangeList:
                FindStringBool = d_is_Attr_Match_String(Obj  , self.AttrName ,String )
                if FindStringBool:
                    Key = String
                    Value.append(Obj)

            Dic[Key] = Value


        for Key , Value in Dic.items():
            
            for ValueItem in Value:
                InsertVar = "{}   >>>   {}".format(Key , ValueItem)
                InsertItemList.append(InsertVar)
        InsertItemList.sort()
        d_Add_lst_QtListViewItem(self.ui.LW_ItemList , InsertItemList )


    def init_ui(self):

        f = QtCore.QFile(Path + "/{}".format(UI_File))

        f.open(QtCore.QFile.ReadOnly)

        loader = QtUiTools.QUiLoader()
        self.ui = loader.load(f, parentWidget=self)
        f.close()


def Run():
    
    try:
        desinger_ui.close()
        desinger_ui.deleteLater()
    except:
        pass
    desinger_ui = DesignerUI()
    desinger_ui.show()





