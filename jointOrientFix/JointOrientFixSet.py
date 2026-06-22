# -*- coding: utf-8 -*-
import pprint

import maya.cmds as cmds
import maya.OpenMayaUI as omui
import maya.mel as mel
import getpass, sys, os ,inspect

from PySide2.QtWidgets import QApplication, QFileDialog ,  QListWidgetItem
from PySide2 import QtCore, QtWidgets, QtUiTools, QtGui
from shiboken2 import wrapInstance
from collections import OrderedDict
from functools import partial

Version = cmds.about(version=True)
User = getpass.getuser()
Folder = "JointOrientFix"
UI_File = 'JointOrientFix.ui'
'''
Path = r"C:/Users/{}/Documents/maya/scripts/{}".format(User, Folder)


Folder_Dir = []
for x in os.listdir(Path):
    Folder_Dir.append(x)

PathSys = [d_PathSysModule('{}/{}' .format(Path , x)) for x in Folder_Dir ]
'''
def d_PathSysModule(Path):
    Module_Path = Path
    Dir_Path =os.path.dirname(Path)
    if not Module_Path in sys.path:
        sys.path.append(Module_Path)
    if not Dir_Path in sys.path:
        sys.path.append(Dir_Path)


CurrentPath = inspect.getfile(inspect.currentframe())
Path = os.path.dirname(CurrentPath)
PathSys = d_PathSysModule(Path)



def maya_main_window():
    maya_main_window_ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(int(maya_main_window_ptr), QtWidgets.QWidget)

#-----------------------------------------------------------------------------------------
def Cal_Distance(S, E):
    S_Pos = cmds.xform(S, q=1, t=1, ws=1)
    E_Pos = cmds.xform(E, q=1, t=1, ws=1)
    DT = ((S_Pos[0] - E_Pos[0]) ** 2 + (S_Pos[1] - E_Pos[1]) ** 2 + (S_Pos[2] - E_Pos[2]) ** 2) ** 0.5
    return DT

def Query_JntAxis(StartJnt, EndJnt):
    Axis = "XYZ"
    Start_Pos = cmds.xform(StartJnt, q=1, ws=1, t=1)
    End_Pos = cmds.xform(EndJnt, q=1, ws=1, t=1)

    Crv = cmds.curve(n="StartEnd_Crv", p=(Start_Pos, End_Pos), d=1)
    CrvShp = cmds.listRelatives(Crv, s=1)[0]
    loc = cmds.spaceLocator(n="StartEnd_loc")[0]
    POICF = cmds.createNode('pointOnCurveInfo', n="POS_POICF")
    DM = cmds.createNode('decomposeMatrix', n="POS_DM")

    cmds.setAttr(POICF + ".turnOnPercentage", 1)
    cmds.connectAttr(CrvShp + '.worldSpace[0]', POICF + '.inputCurve', f=1)
    cmds.connectAttr(POICF + '.position', loc + '.translate', f=1)
    cmds.setAttr(POICF + '.parameter', 1)

    loc_Pos = cmds.xform(loc, q=1, ws=1, t=1)
    cmds.delete(POICF)
    cmds.delete(Crv)
    cmds.xform(loc, t=loc_Pos, ws=1)
    cmds.parent(loc, StartJnt)

    loc_Current_Pos = cmds.xform(loc, q=1, t=1, r=1)
    DisTance = Cal_Distance(StartJnt, loc)
    AimAxis = None

    Decimal = 5
    Re_DisTance = "{:.{}f}".format(DisTance, Decimal)

    for i, x in enumerate(Axis):
        Re_Pos_Date = "{:.{}f}".format(abs(loc_Current_Pos[i]), Decimal)
        if Re_DisTance == Re_Pos_Date:
            AimAxis = x

            break
    cmds.delete(loc)
    return AimAxis

def d_Grping(Target , Count , Grp_Suffix = ["_Grp" , "_Offset" , "_Prime" , '_GrpPrime']):
    
    Count = int(Count)
    Groups =[]
    Parent_Group = None
    if Count > len(Grp_Suffix):
        Count = len(Grp_Suffix)
    for i , x in enumerate(Grp_Suffix[:Count]):
        Group = cmds.createNode("transform" , n = "{}{}" .format(Target ,x))

        if Parent_Group:
            cmds.parent( Parent_Group ,Group )
        Parent_Group = Group
        Groups.append(Group)
    cmds.delete(cmds.parentConstraint(Target, Groups[-1]))
    cmds.parent(Target ,  Groups[0])

    return Groups


def d_ReturnItemWithPath(Items):
    cmds.select(cl =1)
    cmds.select(Items)
    PreReTurnItems = cmds.ls(sl =1 , l =1 )

    if not PreReTurnItems:
        return None
    return PreReTurnItems




#-----------------------------------------------------------------------------------------
class DesignerUI(QtWidgets.QDialog):
    def __init__(self, parent=maya_main_window()):
        super(DesignerUI, self).__init__(parent)

        self.setWindowTitle("{}" .format(Folder))
        self.init_ui()
        #-------------------------------------------------인스턴스 변수

        self.OrientValue = 0
        self.Primary_Axis = "X"
        
        self.JntItems = None
        self.selectJnts = None
        self.TurnOnOff_LRA_Bool = False
        #self.CheckDic = {"X" : self.ui.RDB_AxisX ,"Y" :  self.ui.RDB_AxisY ,"Z"  :self.ui.RDB_AxisZ}
        
        
        
        #-------------------------------------------------

        self.init_ui()
        self.connect_widget()

    def connect_widget(self):


        # 라디오 버튼
        self.CheckDic = {"X" : self.ui.RDB_AxisX ,"Y" :  self.ui.RDB_AxisY ,"Z"  :self.ui.RDB_AxisZ}
        for Axis , Btn in self.CheckDic.items():
            Btn.clicked.connect(lambda : self.Function_ReturnJntAxisBtn())


        self.ui.Btn_AutoFindAxis.clicked.connect(lambda : self.Function_SelectJnts(True))
        self.ui.Btn_AutoFindAxis.clicked.connect(self.Funtcion_FindJntPrimary)
        self.ui.Btn_AutoFindAxis.clicked.connect(self.Function_ReSelectJnts_for_Items)


        self.ui.Btn_Hierarchy.clicked.connect(lambda : self.Function_SelectJnts(True))
        self.ui.Btn_Hierarchy.clicked.connect(self.Function_ReSelectJnts_for_Items)

        self.ui.Btn_LRA.clicked.connect(self.Function_Jnt_LRA_TurnOnOff)


        self.ui.Btn_setZero.clicked.connect(lambda : self.Function_SelectJnts(False))
        self.ui.Btn_setZero.clicked.connect(lambda : self.Funtcion_SetZero(self.selectJnts))


        self.ui.Btn_CalCustom.clicked.connect(self.Function_SelectJnts)
        self.ui.Btn_CalCustom.clicked.connect(lambda : self.Function_setJntRotate(self.ui.DSB_Value.value() , self.ui.CHB_StaticChild.isChecked()))
        self.ui.Btn_Cal5Plus.clicked.connect(self.Function_SelectJnts)
        self.ui.Btn_Cal5Plus.clicked.connect(lambda : self.Function_setJntRotate(5 , self.ui.CHB_StaticChild.isChecked()))
        self.ui.Btn_Cal15Plus.clicked.connect(self.Function_SelectJnts)
        self.ui.Btn_Cal15Plus.clicked.connect(lambda : self.Function_setJntRotate(15 , self.ui.CHB_StaticChild.isChecked()))
        self.ui.Btn_Cal45Plus.clicked.connect(self.Function_SelectJnts)
        self.ui.Btn_Cal45Plus.clicked.connect(lambda : self.Function_setJntRotate(45 , self.ui.CHB_StaticChild.isChecked()))

        self.ui.Btn_Cal5Minus.clicked.connect(self.Function_SelectJnts)
        self.ui.Btn_Cal5Minus.clicked.connect(lambda : self.Function_setJntRotate(-5 , self.ui.CHB_StaticChild.isChecked()))
        self.ui.Btn_Cal15Minus.clicked.connect(self.Function_SelectJnts)
        self.ui.Btn_Cal15Minus.clicked.connect(lambda : self.Function_setJntRotate(-15 , self.ui.CHB_StaticChild.isChecked()))
        self.ui.Btn_Cal45Minus.clicked.connect(self.Function_SelectJnts)
        self.ui.Btn_Cal45Minus.clicked.connect(lambda : self.Function_setJntRotate(-45 , self.ui.CHB_StaticChild.isChecked()))

    def Function_setJntRotate(self , Value , Static = True):


       
        for Jnt in self.selectJnts:
            Parent = cmds.listRelatives(Jnt , p =1 , fullPath=1 )
            Childs = cmds.listRelatives(Jnt , c = 1 ,fullPath= 1)
            #print ("Current Jnt ::" , Jnt)
            #print ("Parnet :: " , Parent)
            #print ("Childs :: " , Childs)

            if Childs and Static:
                cmds.parent(Childs[0] , w =1)
                Childs = Childs[0].replace(Jnt , "")
                

            
            JntGrp = d_Grping(Jnt , 2)
            JntLongGrp = cmds.ls(JntGrp[-1]  , l =1 , dag =1)

            #for x in JntLongGrp:
            #    print (x)
            
            if self.Primary_Axis and Value:
                cmds.setAttr(JntLongGrp[1] + ".rotate{}" .format(self.Primary_Axis) , Value)
                if Childs and Static:
                    cmds.parent(Childs , JntLongGrp[-1])
                if Parent:
                    cmds.parent(JntLongGrp[2] , Parent[0])
                else:
                    cmds.parent(JntLongGrp[2] ,w = 1)

                cmds.delete(JntLongGrp[0])
        cmds.select(self.selectJnts)

                


    def Function_Jnt_LRA_TurnOnOff(self):
        SelectsItems = cmds.ls(sl =1 , type = "joint" , l =1)
        if SelectsItems:
            for Joint in SelectsItems:
                Check = True
                GetCheck = cmds.getAttr("{}.displayLocalAxis" .format(Joint) )
                if GetCheck:
                    Check = False
                cmds.setAttr("{}.displayLocalAxis" .format(Joint) , Check)


    def Funtcion_FindJntPrimary(self):
        
        FindAxis = None
        
        if self.selectJnts:
            FindChildJnt = cmds.listRelatives(self.selectJnts[0] ,c = 1  , typ="joint")
            if FindChildJnt:
                FindAxis = Query_JntAxis(self.selectJnts[0], FindChildJnt[0])
                
            else:
                print ("\n dont existed child Jnt \n")
            if FindAxis:
                for DicAxis , Btn in self.CheckDic.items():
                    if DicAxis == FindAxis:
                        Btn.setChecked(True)
                        self.Function_ReturnJntAxisBtn
                        print ("FindAxis :: {}" .format(FindAxis))
                        break
            
            

    def Function_ReturnJntAxisBtn(self):
        for Axis , IsCheck in self.CheckDic.items():
            if IsCheck.isChecked():
                self.Primary_Axis = Axis
                print ("CurrentAxis :: {}" .format(self.Primary_Axis))
                break

    def Function_ReSelectJnts_for_Items(self):

        if self.selectJnts:
            cmds.select(self.selectJnts)
            #pprint.pprint(self.selectJnts)


    def Function_SelectJnts(self , Hierarchy = False):
        self.selectJnts = None
        
        SelectJnts = cmds.ls(sl =1 , type = "joint")
        PreSelectJnts = d_ReturnItemWithPath(SelectJnts)
        HierarchySet = None
        self.selectJnts = PreSelectJnts
        if Hierarchy == True:
            
            HierarchySet = set() #중복 처리를 위한
            for SelectJnt in PreSelectJnts:
                cmds.select(cl =1)
                cmds.select(SelectJnt , hi = 1)
                HierarchySelects = cmds.ls(sl =1 , type= "joint")
                HierarchySelects = d_ReturnItemWithPath(HierarchySelects)
                if isinstance(HierarchySelects , list):
                    HierarchySet.update(HierarchySelects)
                else:
                    HierarchySet.add(HierarchySelects)
                cmds.select(cl =1)
            self.selectJnts = sorted(list(HierarchySet))
        
        #return self.selectJnts
        

    def Funtcion_SetZero(self , Target):
        WorkList = []
        if isinstance(Target , list):
            WorkList +=Target
        else:
            WorkList.append(Target)

        for x in  WorkList:
            for Axis in "XYZ":
                cmds.setAttr("{}.jointOrient{}" .format(x , Axis) , 0)
            

    def init_ui(self):

        f = QtCore.QFile(Path + "/{}".format(UI_File))

        f.open(QtCore.QFile.ReadOnly)

        loader = QtUiTools.QUiLoader()
        self.ui = loader.load(f, parentWidget=self)
        f.close()

desinger_ui = None
def show():
    global desinger_ui 
    if desinger_ui:
        desinger_ui.close()
        desinger_ui.deleteLater()
        desinger_ui = None 

    if desinger_ui is None:
        desinger_ui = DesignerUI()
        desinger_ui.show()
