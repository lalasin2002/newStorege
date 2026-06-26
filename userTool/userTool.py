
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMayaUI as omui
import re , pprint , json , os, sys ,io

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


def pathAppend(log = True):
    # __file__ 현재 작업중인 파일 위치
    #os.path.dirname (경로)의 메인폴더 위치
    st = u"-----"*2 + "{}" + u"-----"*2 +"\n"
    st = st.format("pathAppend")
    CurrentDir = os.path.dirname(os.path.abspath(__file__))
    if not CurrentDir in sys.path:
        sys.path.append(CurrentDir)
        st+= u">> sys.path 등록 : {}\n".format(CurrentDir)
    else:
        st+= u">> sys.path 이미등록됨 : {}\n".format(CurrentDir)

    if log:
        print (st)


pathAppend()
from function import match ,grouping ,naming , pysideHelper , controlObject ,createObject , objectState , findObject ,controlAttribute


current_path = __file__
current_folderPath = os.path.abspath(os.path.dirname(current_path))
uiFile = "userTool.ui"
prevJson = "_prev.json"
ctrlData = "ctrlsData"

uiPath = os.path.join(current_folderPath, uiFile)
prevPath = os.path.join(current_folderPath,prevJson)
ctrlsDataPath = os.path.join(current_folderPath,ctrlData)





def maya_main_window():
    maya_main_window_ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(int(maya_main_window_ptr), QtWidgets.QWidget)

class DesignerUI(QtWidgets.QDialog):
    def __init__(self, parent=maya_main_window()):
        super(DesignerUI, self).__init__(parent)

        self._prevData ={}
        self._prevPath = prevPath
        self._prevMap = [
            ("mainMatch"                ,"mainMatch_Cbb"               ,"currentIndex"      ,"setCurrentIndex"      , 0 ),
            ("subMatch"                 ,"subMatch_Cbb"                ,"currentIndex"      ,"setCurrentIndex"      , 0 ),
            ("targetingMatchTasks"      ,"targeting_match_Cbb"         ,"currentIndex"      ,"setCurrentIndex"      , 0 ),
            ("reverseMatchTasks"        ,"targeting_reverse_Chb"       ,"isChecked"         ,"setChecked"           , False),
            ("deleteConstraint"         ,"deleteConstraint_Chb"        ,"isChecked"         ,"setChecked"           , True),

            ("groupingNames"            ,"grpExtraName_Te"             ,"toPlainText"       ,"setPlainText"         ,"{item}_Grp,{item}_Offset,{item}_Prime,{item}_PrimeGrp"),
            ("groupingCount"            ,"grpCount_SB"                 ,"value"             ,"setValue"             , 2 ),
            ("groupingSequenceParent"   ,"groupingSequenceParent_Chb"  ,"isChecked"         ,"setChecked"           , False),
            ("groupingKeepPosition"     ,"groupingKeepPosition_Chb"    ,"isChecked"         ,"setChecked"           , True),

            ("renameField"              ,"rename_Le"                   ,"text"              ,"setText"              ,  ""),
            ("renameNumStart"           ,"numRangeStart_Sb"            ,"value"             ,"setValue"             ,  1 ),
            ("renameNumEnd"             ,"numRangeEnd_Sb"              ,"value"             ,"setValue"             , -1 ),
            ("renamePadding"            ,"numPadding_Sb"               ,"value"             ,"setValue"             ,  2 ),
            ("renameUpperAlpStart"      ,"upperAlpStart_Le"            ,"text"              ,"setText"              , "A"),
            ("renameUpperAlpEnd"        ,"upperAlpEnd_Le"              ,"text"              ,"setText"              , "Z"),
            ("renameLowerAlpStart"      ,"lowerAlpStart_Le"            ,"text"              ,"setText"              , "a"),
            ("renameLowerAlpEnd"        ,"lowerAlpEnd_Le"              ,"text"              ,"setText"              , "z"),
            ("renameShape"              , "renameShape_Chb"            ,"isChecked"         ,"setChecked"           , True),

            ("searchField"              ,"search_Le"                   ,"text"              ,"setText"              , "" ),
            ("replaceField"             ,"replace_Le"                  ,"text"              ,"setText"              , "" ),

            ("createCtrlMatch"          ,"matchCurve_Chb"              ,"isChecked"         ,"setChecked"           , False),
            ("createCtrlGetName"        ,"getRenameCurve_Chb"          ,"isChecked"         ,"setChecked"           , False),

            ("textStyle"                ,"textStyle_Cbb"               ,"currentIndex"      ,"setCurrentIndex"      , 0 ),
            ("textCenterPivot"          ,"centerPivotText_Chb"         ,"isChecked"         ,"setChecked"           , False),
            ("textGetName"              ,"getRenameText_Chb"           ,"isChecked"         ,"setChecked"           , False),
            ("textMatch"                ,"matchText_Chb"               ,"isChecked"         ,"setChecked"           , False),
            ("textField"                ,"setText_Le"                  ,"text"              ,"setText"              , "" ),


            ("insertJntAxis"            ,"insertJntAxis_Cbb"           ,"currentIndex"      ,"setCurrentIndex"      ,  0 ),
            ("insertJntCount"           ,"insertJntCount_Sb"           ,"value"             ,"setValue"             ,  1 ),

            ("createFoliPnSize"         ,"createFoliPnSize_Dsb"        ,"value"             ,"setValue"             ,  0.125 ),
            ("createFoliPnAxis"         ,"createFoliAxis_Cbb"          ,"currentIndex"      ,"setCurrentIndex"      ,  0 ),
            ("createFoliGetName"        ,"getRenameCreateFoliPn_Chb"   ,"isChecked"         ,"setChecked"           , False),
            ("createFoliStartNum"       ,"createFoliNumRangeStart_Sb"  ,"value"             ,"setValue"             ,   1  ),
            ("createFoliPadding"        ,"creatFoliNumPadding_Sb"      ,"value"             ,"setValue"             ,   1  ),
            ("createFoliNameFormat"     ,"createFoliName_Le"           ,"text"              ,"setText"              , "{item}" ),
            ("createFoliExtraName"      ,"createFoliExtraName_Le"      ,"text"              ,"setText"              , "_Foli" ),
            ("createPnExtraName"        ,"createPnExtraName_Le"        ,"text"              ,"setText"              , "_PN" ),
            ("createFoliPrefix"         ,"createFoliPrefixName_Rdb"    ,"isChecked"         ,"setChecked"           , False),
            ("createFoliSuffix"         ,"createFoliSuffixName_Rdb"    ,"isChecked"         ,"setChecked"           , True),
            ("createFoliGrp"            ,"groupCreateFoli_Chb"         ,"isChecked"         ,"setChecked"           , False),
            ("createFoliGrpName"        ,"grpNamingCreateFoli_Le"      ,"text"              ,"setText"              , "folicles" ),
            ("createFoliPnGrpName"      ,"grpNamingCreatePn_Le"        ,"text"              ,"setText"              , "planes" ),
            ("createFoliConstraint"     ,"constraintFoli_Chb"          ,"isChecked"         ,"setChecked"           , True),

            ("selectObjName"            ,"selectObjName_Le"            ,"text"              ,"setText"              , "" ),
            ("selectObjPattern"         ,"selectObjPattern_Le"         ,"text"              ,"setText"              , "" ),
            ("selectObjType"            ,"selectObjType_Le"            ,"text"              ,"setText"              , "" ),
            ("selectObjGetName"         ,"selectObjName_Chb"           ,"isChecked"         ,"setChecked"           , True),
            ("selectObjGetPattern"      ,"selectObjPattern_Chb"        ,"isChecked"         ,"setChecked"           , True),
            ("selectObjGetType"         ,"selectObjType_Chb"           ,"isChecked"         ,"setChecked"           , True),

            ("insertGrpNumberStart"     ,"insertGroupingNumStart_Sb"   ,"value"             ,"setValue"             ,  1),
            ("insertGrpNumberPadding"   ,"insertGroupingNumPadding_Sb" ,"value"             ,"setValue"             ,  2),
            ("insertGrpCount"           ,"insertGrouping_Sb"           ,"value"             ,"setValue"             ,  1),
            ("insertGrpNameFormat"      ,"insertGrpName_Le"            ,"text"              ,"setText"              , "{item}_insertGrp{Num}" ),
            ("insertGrpPattern"         ,"insertGrpPattern_Le"         ,"text"              ,"setText"              , "" ),
            ("insertGrpGetName"         ,"getRenameInsertGrouping_Chb" ,"isChecked"         ,"setChecked"           , False),

            ("mirrorGrpPattern"         ,"mirrorGrpPattern_Le"         ,"text"              ,"setText"              , "" ),
            ("mirrorGrpNameFormat"      ,"mirrorGrpNameFormat_Le"      ,"text"              ,"setText"              , "{item}_mirrorGrp" ),
            ("mirrorGrpTargetChk"       ,"mirrorGrpTarget_Chb"         ,"isChecked"         ,"setChecked"           , False),
            ("mirrorLeftGrpName"        ,"mirrorLeftGrpName_Le"        ,"text"              ,"setText"              , "L_" ),
            ("mirrorRightGrpName"       ,"mirrorRightGrpName_Le"       ,"text"              ,"setText"             , "R_" ),

            ("sequenceParentIndex"      ,"sequenceParentIndex_Sb"      ,"value"             ,"setValue"             ,  1),

            ("cntParentGrpPattern"         ,"cntParentGrpPattern_Le"          ,"text"              ,"setText"              , "" ),
            ("cntParentGrpConstraintName"  ,"cntParentGrpConstraintName_Le"   ,"text"              ,"setText"              , "{item}_constraint" ),
            ("cntParentGrpCntParentName"   ,"cntParentGrpCntParentName_Le"    ,"text"              ,"setText"              , "{item}_cntParent" ),
            ("cntParentGrpConstraintGrps"  ,"cntParentGrpConstraintGrp_Te"    ,"toPlainText"       ,"setPlainText"         , "{item}_constraintGrp" ),
            ("cntParentGrpConnectGrps"     ,"cntParentGrpConnectGrp_Te"       ,"toPlainText"       ,"setPlainText"         , "{item}_connectGrp" ),
            ("cntParentTranslate"          ,"cntParentTrans_Chb"              ,"isChecked"         ,"setChecked"           , True),
            ("cntParentRotate"             ,"cntParentRotate_Chb"             ,"isChecked"         ,"setChecked"           , True),
            ("cntParentScale"              ,"cntParentScale_Chb"              ,"isChecked"         ,"setChecked"           , True),

            ("createMeshCurveThresHold"    ,"createMeshCurveThresHold_Dsb"   ,"value"             ,"setValue"             ,  30),
            ("createMeshCurveSize"         ,"createMeshCurveSize_Dsb"        ,"value"             ,"setValue"             ,  1),
            ("createMeshCurveGetName"      ,"getNameCreateMeshCurve_Chb"     ,"isChecked"         ,"setChecked"           ,  False),

            ("InsertCurveTarget"           ,"InsertCurveTarget_Cbb"           ,"currentIndex"      ,"setCurrentIndex"      ,  0 ),
            
            ("createCurveDegree"           ,"createCurveDegree_Sb"           ,"value"             ,"setValue"             ,  1 ),
            ("createCurveGetName"          ,"getNameCreateCurve_Chb"         ,"isChecked"         ,"setChecked"           ,  False ),

            ("addAttrTypr"                 ,"addAttr_Cbb"                    ,"currentIndex"      ,"setCurrentIndex"      ,  0 ),
            ("addAttrMinCheck"             ,"addAttrMin_Chb"                 ,"isChecked"         ,"setChecked"           ,  False ),
            ("addAttrMaxCheck"             ,"addAttrMax_Chb"                 ,"isChecked"         ,"setChecked"           ,  False ),
            ("addAttrMinValue"             ,"addAttrMin_Dsb"                 ,"value"             ,"setValue"             ,  0 ),
            ("addAttrMaxValue"             ,"addAttrMax_Dsb"                 ,"value"             ,"setValue"             ,  10 ),
            ("addAttrName"                 ,"addAttrName_Le"                 ,"text"              ,"setText"              , "" ),
            ("addAttrNiceName"             ,"addAttrNiceName_Le"             ,"text"              ,"setText"              , "" ),
            ("addAttrEnums"                ,"addAttrEnum_Te"                 ,"toPlainText"       ,"setPlainText"         , "A ,B" ),

            ("addSepAttrName"              ,"addSepAttrName_Le"              ,"text"              ,"setText"              , "" ),
            ("addSepNiceName"              ,"addSepNiceName_Le"              ,"text"              ,"setText"              , "" ),
            ("addSepAttrLock"              ,"addSepLock_Chb"                 ,"isChecked"         ,"setChecked"           ,  False ),

            ("createPocifPattern"          ,"createPocifPattern_Le"          ,"text"              ,"setText"              , "" ),
            ("createPocifCurveName"        ,"createPocifCurveName_Le"        ,"text"              ,"setText"              , "" ),
            ("createPocifCntedObjName"     ,"createPocifCntedObjName_Le"     ,"text"              ,"setText"              , "" ),
            ("createPocifNodeName"         ,"createPocifNodeName_Le"         ,"text"              ,"setText"              , "" ),
            ("createPocifGetName_Chb"      ,"getNameCreatePocif_Chb"         ,"isChecked"         ,"setChecked"           ,  False ),
            ("createPocifCurveDegree"      ,"createPocifCurveDegree_Sb"      ,"value"             ,"setValue"             ,  1 ),
            ("createPocifConstraint"       ,"createPocifConstraint_Chb"      ,"isChecked"         ,"setChecked"           ,  False )
            



        ]


        self.setWindowTitle("userTool")
        self.init_ui(uiPath)
        self._setup_icon()
        self._loadPrev()
        
        self._setGroupCountOffsetMax()
        self.connect_widget()
        self._loadCtrlData()
        self.ui.curves_Cbb.setCurrentIndex(0)


    def connect_widget(self):
        
        self.ui.match_Btn.clicked.connect(self.matchObject)
        self.ui.grpBuild_Btn.clicked.connect(self.grouping)
        self.ui.grpMin_Btn.clicked.connect(lambda : self.setGroupCount(False))
        self.ui.grpMax_Btn.clicked.connect(lambda : self.setGroupCount(True))

        self.ui.rename_Btn.clicked.connect(self.renameFunc)
        #search_n_replace
        self.ui.search_n_replace_Btn.clicked.connect(self.search_and_replace)
        self.ui.setTextSearch_Btn.clicked.connect(lambda : self.ui.search_Le.setText(cmds.ls(sl =1)[-1]))
        self.ui.setTextReplace_Btn.clicked.connect(lambda : self.ui.replace_Le.setText(cmds.ls(sl =1)[-1]))
        #selectCtrlType
        self.ui.loadCurveData_Btn.clicked.connect(self._loadCtrlData)
        self.ui.curves_Cbb.currentTextChanged.connect(lambda : pysideHelper.set_imageToLabel(self.ui.curves_Cbb.currentData().get("imgPath") ,self.ui.curvePreviw_Le ))
        #createCtrl
        self.ui.createObjCurve_Btn.clicked.connect( lambda : self.createCtrl())
        self.ui.createJntCurve_Btn.clicked.connect( lambda : self.createCtrl(True))
        self.ui.insertCurveShp_Btn.clicked.connect(self.insertCtrl)
        #createTextCtrl
        self.ui.insertText_Btn.clicked.connect(lambda : self.createTextCtrl(True))
        self.ui.createText_Btn.clicked.connect(lambda : self.createTextCtrl(False))

        #insertJnt
        self.ui.insertJntBuild_Btn.clicked.connect(self.insertJoint)
        #createFoli
        self.ui.createFoli_Btn.clicked.connect(self.createFoli)
        #draw
        self.ui.drawNormalObj_Btn.clicked.connect( lambda : self.drawObject(0))
        self.ui.drawTempleteObj_Btn.clicked.connect( lambda : self.drawObject(1))
        self.ui.drawReferenceObj_Btn.clicked.connect( lambda : self.drawObject(2))
        self.ui.drawBoneJnt_Btn.clicked.connect(lambda : self.drawJoint(0))
        self.ui.drawBoxJnt_Btn.clicked.connect(lambda : self.drawJoint(1))
        self.ui.drawNoneJnt_Btn.clicked.connect(lambda : self.drawJoint(2))

        #color white - black
        self.ui.whiteColor_Btn.clicked.connect(lambda : self.drawColor(16))#white 16
        self.ui.silverColor_Btn.clicked.connect(lambda : self.drawColor(2))
        self.ui.grayColor_Btn.clicked.connect(lambda : self.drawColor(3))
        self.ui.boulderColor_Btn.clicked.connect(lambda : self.drawColor(0))
        self.ui.blackColor_Btn.clicked.connect(lambda : self.drawColor(1))
        #color yellow
        self.ui.yellowColor_Btn.clicked.connect(lambda : self.drawColor(17))
        self.ui.laserLemonColor_Btn.clicked.connect(lambda : self.drawColor(22))
        #color blue
        self.ui.skyColor_Btn.clicked.connect(lambda : self.drawColor(18))
        self.ui.azureColor_Btn.clicked.connect(lambda : self.drawColor(29))
        self.ui.blueColor_Btn.clicked.connect(lambda : self.drawColor(6))
        self.ui.smaltColor_Btn.clicked.connect(lambda : self.drawColor(15))
        self.ui.stratosColor_Btn.clicked.connect(lambda : self.drawColor(5))
        #color red - pink
        self.ui.redColor_Btn.clicked.connect(lambda : self.drawColor(13))
        self.ui.monzaColor_Btn.clicked.connect(lambda : self.drawColor(4))
        self.ui.totemPoleColor_Btn.clicked.connect(lambda : self.drawColor(12))
        self.ui.sundownColor_Btn.clicked.connect(lambda : self.drawColor(21))
        self.ui.purplePizzazzColor_Btn.clicked.connect(lambda : self.drawColor(9))
        self.ui.royalHeathColor_Btn.clicked.connect(lambda : self.drawColor(31))
        #color orange - brown
        self.ui.harvestGoldColor_Btn.clicked.connect(lambda : self.drawColor(21))
        self.ui.copperColor_Btn.clicked.connect(lambda : self.drawColor(24))
        self.ui.muleFawnColor_Btn.clicked.connect(lambda : self.drawColor(10))
        self.ui.jonColor_Btn.clicked.connect(lambda : self.drawColor(11))
        #color green - teal
        self.ui.greenColor_Btn.clicked.connect(lambda : self.drawColor(14))
        self.ui.screaminGreenColor_Btn.clicked.connect(lambda : self.drawColor(19))
        self.ui.greenHazeColor_Btn.clicked.connect(lambda : self.drawColor(23))
        self.ui.seaGreenColor_Btn.clicked.connect(lambda : self.drawColor(27))
        self.ui.sushiColor_Btn.clicked.connect(lambda : self.drawColor(26))
        self.ui.yellowGreenColor_Btn.clicked.connect(lambda : self.drawColor(25))
        self.ui.keppelColor_Btn.clicked.connect(lambda : self.drawColor(28))
        self.ui.crusoeColor_Btn.clicked.connect(lambda : self.drawColor(7))
        #color purple
        self.ui.royalPurpleColor_Btn.clicked.connect(lambda : self.drawColor(30))
        self.ui.tolopeaColor_Btn.clicked.connect(lambda : self.drawColor(8))


        #searchSelect
        self.ui.selectObj_Btn.clicked.connect(lambda : self.searchItem(0))
        self.ui.selectObInSelect_Btn.clicked.connect(lambda : self.searchItem(1))
        self.ui.selectObjHierarchy_Btn.clicked.connect(lambda : self.searchItem(2))

        #insertGrp
        self.ui.insertGrouping_Btn.clicked.connect(self.insertGroup)
        #mirrorGrp
        self.ui.mirrorGrpName_Btn.clicked.connect(self.mirrorGroup)
        #sequence parent
        self.ui.sequenceParent_Btn.clicked.connect(self.sequenceParent)
        #cntParentGrp
        self.ui.cntParentGrp_Btn.clicked.connect(lambda: self.cntParentGrp(debug=False))
        self.ui.cntParentGrpDebug_Btn.clicked.connect(lambda: self.cntParentGrp(debug=True))
        #createMeshCurve
        self.ui.createMeshCurve_Btn.clicked.connect(self.createMeshCurve)
        #insertCurve
        self.ui.InsertCurve_Btn.clicked.connect(self.insertCurve)
        #createCurve
        self.ui.createCurve_Btn.clicked.connect(self.createCurve)
        #addAttr
        self.ui.addAttr_Btn.clicked.connect(self.addCustomAttr)
        #sepAttr
        self.ui.addSep_Btn.clicked.connect(self.addSeparateAttr)
        #createPocifObjs
        self.ui.createPocif_Btn.clicked.connect(self.createPocifObjs)

    def createPocifObjs(self):
        selects = [x for x in cmds.ls(sl=1 ,allPaths =1 ) if controlObject.isDag(x)]
        itemPatternCheck = re.compile(r'\{item\}')

        curveName = self.ui.createPocifCurveName_Le.text()
        connectObjName = self.ui.createPocifCntedObjName_Le.text()
        nodeName = self.ui.createPocifNodeName_Le.text()
        getName = self.ui.getNameCreatePocif_Chb.isChecked()
        degree = self.ui.createPocifCurveDegree_Sb.value()
        constraintCheck = self.ui.createPocifConstraint_Chb.isChecked()
        
        pattern = None
        if self.ui.createPocifPattern_Le.text():
            pattern = self.ui.createPocifPattern_Le.text()
        if not len(selects)>0:
            return
        cmds.undoInfo(openChunk=1)
        try:
            renames = None
            newCurveName = None
            pocifCurve = None
            if getName:
                renames = self._setTaskRenames([None for x in selects])
            if curveName:
                if itemPatternCheck.search(curveName):
                    newCurveName = curveName.format(item = selects[0])
                else:
                    newCurveName = curveName
            else:
                newCurveName = curveName
            if newCurveName:
                posList = [tuple(cmds.xform(x, ws =1 , t =1 , q=1)) for x in selects]
                pocifCurve = createObject.createCurve(posList , degree , newCurveName )

            

            parameterDiv = 1.0/(len(selects)-1)
            for  i ,x in enumerate(selects):
                pocifName = None
                cntedObjName = None
                item = x
                if pattern:
                    search = re.search(pattern ,x)
                    if search:
                        #print ("sss",search.group())
                        item = search.group()

                if renames:
                    item = renames[i][1]

                if itemPatternCheck.search(connectObjName):
                    cntedObjName = connectObjName.format(item = item)
                else:
                    cntedObjName = connectObjName
                if itemPatternCheck.search(nodeName):
                    pocifName = nodeName.format(item = item)
                else:
                    pocifName = nodeName
                
                if cntedObjName:
                    cntedObjName = cmds.spaceLocator(n = cntedObjName)[0]
                if pocifName:
                    connectData = []
                    for ax in "XYZ":
                        data = ("position{}" .format(ax) , "{}.translate{}" .format(cntedObjName , ax))
                        connectData.append(data)
                    pocifNode = createObject.createPocif(pocifName , pocifCurve ,parameterDiv *i , True , connectData)

                if constraintCheck:
                    cmds.pointConstraint(cntedObjName ,x ,mo=1 )
                    
                



        finally:
            cmds.undoInfo(closeChunk=1)
        




    def addSeparateAttr(self):
        selects = [x for x in cmds.ls(sl=1 ,allPaths =1 ) if controlObject.isDag(x)]
        longName = self.ui.addSepAttrName_Le.text()
        niceName = self.ui.addSepNiceName_Le.text()
        attrLock = self.ui.addSepLock_Chb.isChecked()
        if longName is None or longName == "":
            return
        if not len(selects)>0:
            return
        cmds.undoInfo(openChunk=1)
        try:
            for x in selects:
                controlAttribute.addSeparateAttr(x, longName ,attrLock , niceName)

        finally:
            cmds.undoInfo(closeChunk=1)

    def addCustomAttr(self):
        selects = [x for x in cmds.ls(sl=1 ,allPaths =1 ) if controlObject.isDag(x)]
        longName = self.ui.addAttrName_Le.text()
        niceName = self.ui.addAttrNiceName_Le.text()
        checkMin = self.ui.addAttrMin_Chb.isChecked()
        checkMax = self.ui.addAttrMax_Chb.isChecked()
        minValue = self.ui.addAttrMin_Dsb.value()
        maxValue = self.ui.addAttrMax_Dsb.value()
        attrType = self.ui.addAttr_Cbb.currentText()

        enums = None
        if self.ui.addAttrEnum_Te.toPlainText():
            enums = self._getTextList(self.ui.addAttrEnum_Te.toPlainText())
            enums = ":".join(enums)
        if longName is None or longName == "":
            return
        if not len(selects)>0:
            return
        cmds.undoInfo(openChunk=1)
        try:
            for item in selects:
                attrDict = {}
                if niceName:
                    attrDict["nn"] = niceName

                if attrType in ["float" , "int"]:
                    if checkMin:
                        attrDict["min"] =  minValue
                        attrDict["hasMinValue"] = True
                    if checkMax:
                        attrDict["max"] = maxValue
                        attrDict["hasMaxValue"] = True
                    if checkMin and attrType == "int":
                        attrDict["min"] =  int(minValue)
                    if checkMax and attrType == "int":
                        attrDict["max"] =  int(maxValue)   
                if attrType == "enum":
                    if enums:
                        attrDict["en"] = enums
                    else:
                        continue
                controlAttribute.addCustomAttr(item , longName , attrType , **attrDict)
        finally:
            cmds.undoInfo(closeChunk=1)
        
    def createCurve(self):
        selects = cmds.ls(sl=1 ,allPaths =1 , fl =1)
        degree = self.ui.createCurveDegree_Sb.value()
        getName = self.ui.getNameCreateCurve_Chb.isChecked()
        if not len(selects)>0:
            return
        cmds.undoInfo(openChunk=1)
        try:
            posList = []
            for x in selects:
                pos = cmds.xform(x,ws =1, q =1 , t =1 )
                if all(x == 0 for x in pos):
                    pos = cmds.xform(x , q =1 , pivots=1 ,ws =1)[:3]
                posList.append(tuple(pos))
            for i in range(len(selects)):
                print (selects[i] , posList[i] )
            crvName =None
            if getName:
                crvName = self._setTaskRenames([None])[1]
            crv = createObject.createCurve(posList , degree , crvName )
        finally:
            cmds.undoInfo(closeChunk=1)



    def insertCurve(self):
        selects = [x for x in cmds.ls(sl =1) if controlObject.isDag(x)]
        if not len(selects)>0:
            return
        targetIndex = self.ui.InsertCurveTarget_Cbb.currentIndex()
        insertSource = None
        insertTargets = None
        cmds.undoInfo(openChunk=1)
        try:
            if targetIndex == 0:
                insertSource = selects[0]
                insertTargets = selects[1:]
            else:
                insertSource = selects[-1]
                insertTargets = selects[:-1]
            for x in insertTargets:
                dulicateInsertSource = controlObject.dulicateObject(insertSource)
                controlObject.insertShp(x , dulicateInsertSource[0] , types = ["nurbsCurve"] , renameBool = True)
                cmds.delete(dulicateInsertSource[0])

        finally:
            cmds.undoInfo(closeChunk=1)


    def createMeshCurve(self):
        selects = [x for x in cmds.ls(sl =1) if controlObject.isDag(x)]
        if not len(selects)>0:
            return
        angle_threshold = self.ui.createMeshCurveThresHold_Dsb.value()
        size = self.ui.createMeshCurveSize_Dsb.value()
        getName = self.ui.getNameCreateMeshCurve_Chb.isChecked()
        cmds.undoInfo(openChunk=1)
        try:
            if getName:
                renames = self._setTaskRenames([None for x in selects])
            for i,x in enumerate(selects):
                name = naming.uniqueName("curve")
                if getName:
                    name = renames[i][1]
                createObject.create_MeshFeatureEdge_curve(x , name , angle_threshold , size, True)
        finally:
            cmds.undoInfo(closeChunk=1)
        
    def cntParentGrp(self, debug = False):
        selects = [ x for x in cmds.ls(sl =1 ) if controlObject.isDag(x)]
        print (selects)
        if not len(selects)>0:
            return
        pattern = None
        if self.ui.cntParentGrpPattern_Le.text():
            pattern = self.ui.cntParentGrpPattern_Le.text()
        itemCheckPattern = re.compile(r'\{item\}')

        preConstraintName = self.ui.cntParentGrpConstraintName_Le.text()
        preCntParentName = self.ui.cntParentGrpCntParentName_Le.text()

        preConstraintGrpName = self._getTextList(self.ui.cntParentGrpConstraintGrp_Te.toPlainText())
        preConnectGrpName = self._getTextList(self.ui.cntParentGrpConnectGrp_Te.toPlainText())

        translateChk = self.ui.cntParentTrans_Chb.isChecked()
        rotateChk = self.ui.cntParentRotate_Chb.isChecked()
        scaleChk = self.ui.cntParentScale_Chb.isChecked()
        attr = []
        constraintTypes = []
        if translateChk:
            constraintTypes.append("pointConstraint")
            attr.append("translate")
        if rotateChk:
            constraintTypes.append("orientConstraint")
            attr.append("rotate")
        if scaleChk:
            constraintTypes.append("scaleConstraint")
            attr.append("scale")
        cmds.undoInfo(openChunk=1)
        try:
            connectParent = grouping.connectParent()
            for x in selects:
                print (x)
                constraintGrpNames = []
                connectGrpNames = []
                constrainName = None
                connectName = None

                item = x
                if pattern:
                    search = re.search(pattern ,x)
                    if search:
                        #print ("sss",search.group())
                        item = search.group()

                #print (item)

                if itemCheckPattern.search(preConstraintName):
                    constrainName = preConstraintName.format(item = item)
                if itemCheckPattern.search(preCntParentName):
                    connectName = preCntParentName.format(item = item)


                for nameItem in preConstraintGrpName:
                    if itemCheckPattern.search(nameItem):
                        constraintGrpNames.append(nameItem.format(item = item))
                    else:
                        constraintGrpNames.append(nameItem)
                for nameItem in preConnectGrpName:
                    if itemCheckPattern.search(nameItem):
                        connectGrpNames.append(nameItem.format(item = item))
                    else:
                        connectGrpNames.append(nameItem)

                connectParent.addTarget(item)
                connectParent.setWorkTarget(item, constraintName=constrainName, connectName=connectName)
                connectParent.setGroupData(item , constraintGrpList = constraintGrpNames , connectGrpList = connectGrpNames)
                connectParent.setConstraintData(item , constraints = constraintTypes)
                connectParent.setConnectData(item , connectTarget = item , connects = attr)
            
            if debug:
                pprint.pprint (connectParent.dictWork)
            else:
                connectParent.build()
        finally:
            cmds.undoInfo(closeChunk=1)
        



    def sequenceParent(self):
        selects =[s for s in cmds.ls(sl =1 , allPaths=1)if controlObject.isDag(s)]
        selects.reverse()
        index = self.ui.sequenceParentIndex_Sb.value()
        if not len(selects)>0:
            return
        cmds.undoInfo(openChunk=1)
        try:
            parent = None
            lastParent = None
            for x in selects:
                allChild = cmds.ls(x , dagObjects=1 , allPaths=1)
                try:
                    lastParent = allChild[index]
                except:
                    lastParent = allChild[-1]
                if parent:
                    cmds.parent(x ,parent )
                parent = lastParent
        finally:
            cmds.undoInfo(closeChunk=1)
            
        


    def mirrorGroup(self):
        targetAxis = self.ui.mirrorGrpTarget_Chb.isChecked()
        nameFormat = self.ui.mirrorGrpNameFormat_Le.text()
        nameLeft = self.ui.mirrorLeftGrpName_Le.text()
        nameRight = self.ui.mirrorRightGrpName_Le.text()
        pattern = None
        checkItemString = re.compile(r'\{item\}')
        if self.ui.mirrorGrpPattern_Le.text():
            pattern = self.ui.mirrorGrpPattern_Le.text()

        selects =[s for s in cmds.ls(sl =1 )if controlObject.isDag(s)]
        if not len(selects)>0:
            return
        cmds.undoInfo(openChunk=1)
        
        try:
            dulicates = [cmds.duplicate(x )[0] for x in selects]
            groups =[]
            for x in dulicates:
                formats = {}
                names = x
                if pattern:
                    search = re.search(pattern ,x)
                    if search:
                        names = search.group()
                if checkItemString.search(nameFormat):
                    formats["item"] = names
                else:
                    formats["item"] = ""
                grpName = nameFormat.format(**formats)
                mirrorGrp = grouping.insertGrp(x , [grpName] , False)[0]
                groups.append(mirrorGrp)
            
            search_n_replace_dict = { "s" :  nameLeft , "r" : nameRight}
            if targetAxis:
                search_n_replace_dict = { "s" : nameRight , "r" : nameLeft }

            for x in groups:
                print (x)
                cmds.setAttr(x + ".scaleX" , -1)
                childs = cmds.listRelatives(x , c =1 ,fullPath=1)
                if childs:
                    split = childs[0].split("|")
                    replaceSearch = re.search(r"(.+)(\d+)$" , split[-1])
                    if replaceSearch:
                        replaceTarget = replaceSearch.group(1)
                        cmds.select(childs[0], r=True)
                        mel.eval('searchReplaceNames "{s}" "{r}" "selected"'.format(s = split[-1] , r =replaceTarget))
            cmds.select(groups)
            mel.eval('searchReplaceNames "{s}" "{r}" "hierarchy"'.format(**search_n_replace_dict))
        finally:
            cmds.undoInfo(closeChunk=1)


        

    def insertGroup(self):
        numStart = self.ui.insertGroupingNumStart_Sb.value()
        padding = self.ui.insertGroupingNumPadding_Sb.value()
        getName = self.ui.getRenameInsertGrouping_Chb.isChecked()
        nameFormat = self.ui.insertGrpName_Le.text()
        grpCount = self.ui.insertGrouping_Sb.value()
        pattern = None
        checkItemString = re.compile(r'\{item\}')
        checkNumString = re.compile(r'\{num\}')

        if self.ui.insertGrpPattern_Le.text():
            pattern = self.ui.insertGrpPattern_Le.text()
        cmds.undoInfo(openChunk=1)
        try:
            selects = [s for s in cmds.ls(sl =1 )if controlObject.isDag(s)]
            insertGrpNames = []
            if not len(selects)>0:
                return
            if getName:
                grpCount = 1
                preNames = self._setTaskRenames([None for x in selects])
                insertGrpNames = [[x] for _ ,x  in preNames ]
            else:
                for i , x in enumerate(selects):
                    name = x
                    formats = {}
                    if pattern:
                        search = re.search(pattern ,x)
                        if search:
                            name = search.group()
                    if checkItemString.search(nameFormat):
                        formats["item"] = name
                    else:
                        formats["item"] = ""
                    tupleData = []
                    for v in range(0,grpCount):
                        if checkNumString.search(nameFormat):
                            formats["num"] = str( int(numStart + v)).zfill(padding)
                        else:
                            formats["num"] = ""
                        grpName = nameFormat.format(**formats)
                        tupleData.append(grpName)
                    insertGrpNames.append(tupleData)
            print(insertGrpNames)     
            for i , x in enumerate(selects):
                grouping.insertGrp(x ,insertGrpNames[i] )
        finally:
            cmds.undoInfo(closeChunk=1)
            
            
    def searchItem(self , funcType = 0 ):
        
        selects = None
        cmds.undoInfo(openChunk=1)
        try:
            if funcType == 0:
                selects = cmds.ls()
            if funcType == 1:
                selects = cmds.ls(sl =1)
            if funcType == 2:
                preSelects = cmds.ls(sl =1)
                selects =[]
                for x in preSelects:
                    items = findObject.setHierarchyObjs(x)
                    selects.extend(items)
            if selects is None:
                return
            
            checkName = self.ui.selectObjName_Chb.isChecked()
            checkPattern = self.ui.selectObjPattern_Chb.isChecked()
            checkTypes = self.ui.selectObjType_Chb.isChecked()

            searchItems = findObject.searchObject(selects)
            if checkName:
                nameText = self.ui.selectObjName_Le.text()
                if nameText:
                    searchItems.searchString(nameText)
            if checkTypes:
                typeString = self._getTextList(self.ui.selectObjType_Le.text())
                if typeString:
                    searchItems.checkType(typeString)
            if checkPattern:
                patternString = self.ui.selectObjPattern_Le.text()
                print (patternString )
                if patternString:
                    searchItems.searchPattern(patternString)

            searchItems.removeDuplicates()
            cmds.select(searchItems.total)
            pprint.pprint(searchItems.total)
        finally:
            cmds.undoInfo(closeChunk=1)



    def drawColor(self, colorNumber):
        selects = [x for x in cmds.ls(sl =1,allPaths=1) if controlObject.isDag(x)]
        if not len(selects) >0:
            return
        cmds.undoInfo(openChunk=1)
        try:
            for x in selects:
                objectState.setDrawObj(x , colorNumber )
        finally:
            cmds.undoInfo(closeChunk=1)


    def drawJoint(self, value):
        selects = cmds.ls(sl =1, type= "joint",allPaths=1)
        if not len(selects) >0:
            return
        cmds.undoInfo(openChunk=1)
        try:
            for x in selects:
                cmds.setAttr(x + ".drawStyle", value )
        finally:
            cmds.undoInfo(closeChunk=1)

    def drawObject(self , value):
        selects = [x for x in cmds.ls(sl =1,allPaths=1) if controlObject.isDag(x)]
        if not len(selects) >0:
            return
        cmds.undoInfo(openChunk=1)
        try:
            for obj in selects:
                if value > 0:
                    cmds.setAttr(obj + ".overrideEnabled" , 1)
                    cmds.setAttr(obj + ".overrideDisplayType" , value)
                else:
                    cmds.setAttr(obj + ".overrideEnabled" , 0)
        finally:
            cmds.undoInfo(closeChunk=1)


    def createFoli(self):
        getName = self.ui.getRenameCreateFoliPn_Chb.isChecked()
        pnSize = self.ui.createFoliPnSize_Dsb.value()
        axis = self.ui.createFoliAxis_Cbb.currentText()
        numberStart = self.ui.createFoliNumRangeStart_Sb.value()
        padding = self.ui.creatFoliNumPadding_Sb.value()

        grpCheck =self.ui.groupCreateFoli_Chb.isChecked()
        grpFoliName = self.ui.grpNamingCreateFoli_Le.text()
        grpGrpName = self.ui.grpNamingCreatePn_Le.text()
        nameString = self.ui.createFoliName_Le.text()
        foliExtraName = self.ui.createFoliExtraName_Le.text()
        pnExtraName = self.ui.createPnExtraName_Le.text()
        preffix = self.ui.createFoliPrefixName_Rdb.isChecked()
        suffix = self.ui.createFoliSuffixName_Rdb.isChecked()
        constraintCheck = self.ui.constraintFoli_Chb.isChecked()
        pnNameTask = []
        pnsNameTask = []
        folis = []
        patternFormat = re.compile(r'\{item\}')
        selects = [x for x in cmds.ls(sl =1) if controlObject.isDag(x)]

        if not len(selects)>0 :
            return
        Pns = []
        axisDict = { "X" : (90 , 0, 0),
                     "Y" : (0 , 90 , 0),
                     "Z" : (0, 0 , 90 )
                    }
        preffixPnName = ""
        suffixPnName = ""
        preffixFoliName = ""
        suffixFoliName = ""
        
        if preffix:
            preffixPnName= pnExtraName 
            preffixFoliName = foliExtraName
        if suffix:
            suffixPnName= pnExtraName
            suffixFoliName = foliExtraName
        pnNameFormat = preffixPnName  + "{obj}" + suffixPnName
        foliNameFormat = preffixFoliName   + "{obj}" + suffixFoliName 
        cmds.undoInfo(openChunk=1)
        try:
            for x in selects:
                Pn = cmds.polyPlane(sx = 1, sy =1 ,h = pnSize , w = pnSize )[0]
                cmds.rotate(axisDict[axis][0],axisDict[axis][1],axisDict[axis][2],Pn)
                cmds.makeIdentity(Pn ,s=1,rotate=1 ,translate=1 ,apply=1)
                cmds.delete(Pn , constructionHistory=True)
                match.match_parentConstraint(Pn , x)
                Pns.append(Pn)
            if getName:
                preTask = self._setTaskRenames(Pns)
                for objName , preNames in preTask:
                    combineName = pnNameFormat.format(obj = preNames)
                    pnNameTask.append( (objName , naming.uniqueName(combineName))  )
            else:
                for i , x in enumerate(Pns):
                    if bool(patternFormat.search(nameString)):
                        objName = nameString.format(item = selects[i])
                    else:
                        objName = nameString + str(numberStart + i).zfill(padding)

                    print ("objName" , objName , selects[i] , nameString)
                    combineName = pnNameFormat.format(obj = objName)
                    pnNameTask.append( (x  ,naming.uniqueName(combineName )) )
            if pnNameTask:
                for obj , renames in pnNameTask:
                    isShp = cmds.listRelatives(obj , s =1 )
                    if isShp:
                        for i ,x in enumerate(isShp):
                            count = str(i+1)
                            shpName = renames + "{}Shape" .format(count )
                            pnsNameTask .append((x , naming.uniqueName(shpName)))

            if getName:
                NoneTask = [None for x in Pns]
                foliNamesTask = self._setTaskRenames(NoneTask)
                foliNames = [(None , foliNameFormat.format(obj =x )) for _, x in foliNamesTask]
                countTasks = 0
                for _ , names in foliNames:
                    foliData = createObject.create_foli(naming.uniqueName(names) , Pns[countTasks] )
                    folis.append(foliData[0])
                    countTasks +=1
            else:
                for i ,x in enumerate(Pns):
                    if bool(patternFormat.search(nameString)):
                        objName = nameString.format(item = selects[i])
                    else:
                        objName = nameString + str(numberStart + i).zfill(padding)
                    foliData = createObject.create_foli(naming.uniqueName(objName) , Pns[i] )
                    folis.append(foliData[0])

            #pnsNameTask +=pnNameTask
            renameShpTask = naming.nameTask()
            renameShpTask.addTask(pnsNameTask)
            renameShpTask.build()
            renameTask = naming.nameTask()
            renameTask.addTask(pnNameTask)
            renameTask.build()
            if grpCheck:
                cmds.group(folis, n = naming.uniqueName(grpFoliName))
                cmds.group( [y for x ,y in pnNameTask ]  ,n = naming.uniqueName(grpGrpName))

            if constraintCheck:
                for i,x in selects:
                    cmds.parentConstraint(folis[i] , x , mo =1 )
        
        finally:
            cmds.undoInfo(closeChunk=1)
    
    
    def insertJoint(self):
        cmds.undoInfo(openChunk=1)
        try:
            selects = cmds.ls(sl =1 , type = "joint",allPaths=1)
            cmds.select(selects[0] , hierarchy=1)
            hierarchySelects = cmds.ls(sl=1 , type="joint" , allPaths=1)
            if not len(hierarchySelects)> 1:
                return
            
            selectAxis = self.ui.insertJntAxis_Cbb.currentText()
            count = self.ui.insertJntCount_Sb.value()
            Axis = None
            startJnt = hierarchySelects[0]
            endJnt = hierarchySelects[1]
            #aimDict ={
            #    "X" : [(1,0,0) ,(0,1,0) ,(0,1,0)],
            #    "Y" : [(0,1,0) ,(1,0,0), (1,0,0)],
            #   "Z" : [(0,0,1) ,(1,0,0), (1,0,0)]
            #}

            if selectAxis == "auto":
                Axis = objectState.getJntAxis(startJnt , endJnt)
            else:
                Axis = selectAxis
            distance = round(objectState.getDistance(startJnt , endJnt),3)
            divValue = 1.0/(count+1)

            inserter = createObject.jointInserter(startJnt , endJnt)
            for i in range(1, count + 1):

                parameter = divValue * i
                inserter.calculateVector(naming.uniqueName("insert_joint") , parameter)
                inserter.createInsertJnt()
                inserter.orientJnt()
            
            cmds.select(selects )
        finally:
            cmds.undoInfo(closeChunk=1)



    def createTextCtrl(self, insertBool = False):
        selects = cmds.ls(sl =1 , fl =1)
        getName = self.ui.getRenameText_Chb.isChecked()
        matchPos = self.ui.matchText_Chb.isChecked()
        fontCenter = self.ui.centerPivotText_Chb.isChecked()

        textField = self.ui.setText_Le.text()
        fontStyle = self.ui.textStyle_Cbb.currentText()

        workItems = []
        tasks = []
        
        if textField == "" or  textField is None:
            return

        if insertBool:
            cmds.undoInfo(openChunk=1)
            try:
                selects = [x for x in selects if controlObject.isDag(x) == True]
                for i , x in enumerate(selects):
                    item = createObject.create_textCrv_fixed(naming.uniqueName("temp_text") ,textField , fontCenter ,fontStyle  )
                    oldShp = cmds.listRelatives(x , s =1 , fullPath=1)
                    if oldShp:
                        cmds.delete(oldShp)
                    controlObject.insertShp(x , item , ["nurbsCurve" , "mesh"] , True)
                    cmds.delete(item)
                cmds.select(selects)
            finally:
                cmds.undoInfo(closeChunk=1)
        else:
            cmds.undoInfo(openChunk=1)
            try:
                tasks = []
                workItems = [None for x in range(len(selects)or 1)]
                if getName:
                    tasks = self._setTaskRenames(workItems)
                else:
                    tasks = [(x , "temp_name") for x in workItems]
                count = 0
                for _ , nameItem in tasks:
                    item = createObject.create_textCrv_fixed(naming.uniqueName(nameItem) ,textField , fontCenter ,fontStyle  )
                    if matchPos:
                        match.match_xform(item , selects[count])
                    count +=1
            finally:
                cmds.undoInfo(closeChunk=1)


    def insertCtrl(self):
        selects = cmds.ls(sl =1)
        itemName = None
        itemPath = None
        currentData = self.ui.curves_Cbb.currentData()
        if currentData:
            itemName = currentData.get("name")
            itemPath = currentData.get("filePath")
        if not itemName and not itemPath:
            return
        if not len(selects)>0:
            return
        selects = [x for x in selects if controlObject.isDag(x) == True]
        cmds.undoInfo(openChunk=1)
        try:
            for i , x in enumerate(selects):
                item = controlObject.load_importReference(itemPath , None)[0]
                oldShp = cmds.listRelatives(x , s =1 , fullPath=1)
                if oldShp:
                    cmds.delete(oldShp)
                controlObject.insertShp(x , item , ["nurbsCurve" , "mesh"] , True)
                cmds.delete(item)
        finally:
            cmds.undoInfo(closeChunk=1)

    def createCtrl(self , JntBool = False):
        selects = cmds.ls(sl =1 , fl =1)
        itemName = None
        itemPath = None
        workItems = []
        tasks = []
        getName = self.ui.getRenameCurve_Chb.isChecked()
        matchPos = self.ui.matchCurve_Chb.isChecked()
        #{ "name"    : itemName ,  "filePath" : filePath ,"imgPath"  : fileImg} 확인용
        currentData = self.ui.curves_Cbb.currentData()
        if currentData:
            itemName = currentData.get("name")
            itemPath = currentData.get("filePath")

        if not itemName and not itemPath:
            return
        
        cmds.undoInfo(openChunk=1)
        try:
            for x in range(len(selects) or 1 ):
                ctrl = None
                item = controlObject.load_importReference(itemPath , None)[0]
            
                if JntBool:
                    cmds.select(cl =1)
                    ctrl = cmds.joint()
                    controlObject.insertShp(ctrl , item , ["nurbsCurve" , "mesh"] , False)
                    cmds.setAttr(ctrl  + ".drawStyle" ,2)
                    cmds.delete(item)
                else:
                    ctrl = item
                workItems.append(ctrl)
            cmds.select(selects)
            if getName:
                tasks = self._setTaskRenames(workItems)
            else:
                tasks = [(x , "temp_name") for x in workItems]
            if matchPos and len(selects) > 0:
                for i , x in enumerate(workItems):
                    match.match_xform(x , selects[i] )
            nameBuildTask = naming.nameTask()
            nameBuildTask.addTask(tasks)
            result = nameBuildTask.build()
            otherTask = []
            if result:
            
                for x in result:
                    renameString = x + "Shape{}"
                    shps = cmds.listRelatives(x , s=1 , fullPath=1)
                    if shps:
                        for i , s in enumerate(shps):
                                shpName = naming.uniqueName(renameString.format(str(i +1)))
                                otherTask.append( (s , shpName)  )
                
            if otherTask:
                shpNameBuildTask = naming.nameTask()
                shpNameBuildTask.addTask(otherTask)
                shpNameBuildTask.build()
        finally:
            cmds.undoInfo(closeChunk=1)



    def setGroupCount(self, maxBool = True):
        groupsNames = self._getTextList(self.ui.grpExtraName_Te.toPlainText())
        print (groupsNames)
        if groupsNames:
            groupCount = len(groupsNames)
            if maxBool:
                self.ui.grpCount_SB.setValue(groupCount)
            else:
                self.ui.grpCount_SB.setValue(1)

    def grouping(self):
        selects = cmds.ls(sl =1 ,allPaths=1)
        itemCheckPattern = re.compile(r'\{item\}')
        groupsNames = self._getTextList(self.ui.grpExtraName_Te.toPlainText())
        groupsNames = [x for x in groupsNames if itemCheckPattern.search(x)]
        #print (groupsNames)
        sequenceParent = self.ui.groupingSequenceParent_Chb.isChecked()
        keepPosition = self.ui.groupingKeepPosition_Chb.isChecked()
        groupingCount = self.ui.grpCount_SB.value()
        if len(selects) == 0:
            return
        if not groupsNames:
            return

        keepParentTask = []
        cmds.undoInfo(openChunk=1)
        try:
            upperTarget = None
            selects.reverse()
            for item in selects:
                rootParent = cmds.listRelatives(item , p =1 ,allDescendents=1)
                groupData = [x.format(item = item) for x in groupsNames]
                
                
                grp = grouping.insertGrp(item , groupData[:groupingCount] , keepPosition)

                if rootParent and keepPosition:
                    task = (grp[-1] , rootParent[0])
                    keepParentTask.append(task)

                if sequenceParent and upperTarget:
                    cmds.parent(upperTarget ,item)
                if sequenceParent:
                    upperTarget = grp[-1]

            if keepParentTask and keepPosition:
                if sequenceParent:
                    keepParentTask = [keepParentTask[-1] ]
                
                for grpRoot , originParent  in keepParentTask:
                    cmds.parent(grpRoot  , originParent)
        except Exception as e:
            print (e)
        finally:
            cmds.undoInfo(closeChunk=1)
    
    def search_and_replace(self):
        hierarchy = self.ui.search_n_replaceHierarchy_Chb.isChecked()
        selects =cmds.ls(sl =1 , allPaths=1)
        type = "selected"

        searchString = self.ui.search_Le.text()
        replaceString = self.ui.replace_Le.text()


        if hierarchy:
            type = "hierarchy"
        mel.eval('searchReplaceNames "{s}" "{r}" "{t}"'.format(s = searchString , r = replaceString , t = type))



    def renameFunc(self):
        selects =cmds.ls(sl =1 , allPaths=1)
        tasks = self._setTaskRenames(selects)
        shpName = self.ui.renameShape_Chb.isChecked()
        result = None
        cmds.undoInfo(openChunk=1)
        try:
            if tasks :
                nameBuildTask = naming.nameTask()
                nameBuildTask.addTask(tasks)
                result = nameBuildTask.build()
            if result and shpName:
                otherTask = []
                for x in result:
                    renameString = x + "Shape{}"
                    shps = cmds.listRelatives(x , s=1 , fullPath=1)
                    if shps:
                        for i , s in enumerate(shps):
                                shpName = naming.uniqueName(renameString.format(str(i +1)))
                                otherTask.append( (s , shpName)  )
                if otherTask:
                    shpNameBuildTask = naming.nameTask()
                    shpNameBuildTask.addTask(otherTask)
                    shpNameBuildTask.build()
        finally:
            cmds.undoInfo(closeChunk=1)

    def matchObject(self):
        selects = cmds.ls(sl =1 ,allPaths=1)

        targetingIndex = self.ui.targeting_match_Cbb.currentIndex()
        mainMatchIndex = self.ui.mainMatch_Cbb.currentIndex()
        subMatchIndex = self.ui.subMatch_Cbb.currentIndex()
        deleteConstraint = self.ui.deleteConstraint_Chb.isChecked()

        tasks =[]

        if self.ui.targeting_reverse_Chb.isChecked() == True:
            selects.reverse()

        if targetingIndex == 0:
            for item in selects[1:]:
                work = (selects[0] ,item )
                tasks.append(work)
        if targetingIndex == 1:
            for item in selects[:-1]:
                work = (selects[-1] , item)
                tasks.append(work)
        if targetingIndex ==2 and len(selects) % 2 ==0:
            half = int(len(selects)/2)
            parents = selects[half:]
            child =  selects[:half+1]
            for i in range(half):
                work = ( (parents[i] , child[i])  )
                tasks.append(work)

        cmds.undoInfo(openChunk=1)
        try:
            if tasks:
                if mainMatchIndex == 0:
                    for parent , child in tasks:
                        match.match_parentConstraint(child , parent, deleteConstraint)
                if mainMatchIndex == 1:
                    for parent , child in tasks:
                        match.match_constraintObject(child , parent , True , False , False, deleteConstraint)
                if mainMatchIndex ==2 :
                    for parent , child in tasks:
                        match.match_constraintObject(child , parent , False , True , False , deleteConstraint)
                if mainMatchIndex ==3:
                    for parent , child in tasks:
                        match.match_constraintObject(child , parent , False , False , True , deleteConstraint)

            if tasks and subMatchIndex > 0:
                if subMatchIndex ==1 :
                    for parent , child in tasks:
                        match.match_parentConstraint(child , parent,deleteConstraint)
                if subMatchIndex ==2 :
                    for parent , child in tasks:
                        match.match_constraintObject(child , parent , True , False , False, deleteConstraint)
                if subMatchIndex ==3 :
                    for parent , child in tasks:
                        match.match_constraintObject(child , parent , False , True , False, deleteConstraint)
                if subMatchIndex ==4 :
                    for parent , child in tasks:
                        match.match_constraintObject(child , parent , False , False , True, deleteConstraint)
        except Exception as e:
            print (e)
        finally:
            cmds.undoInfo(closeChunk= 1)
        pprint.pprint(tasks)



    #_________________________________________________________________________helper
    def _setGroupCountOffsetMax(self):
        groupNameData = self.ui.grpExtraName_Te.toPlainText()
        groupNameList = self._getTextList(groupNameData)
        Count = len(groupNameList)
        self.ui.grpCount_SB.setMaximum(Count)
        

    def _getTextList(self , strings , splitPart = ","):
        stringList = strings.split(splitPart)
        stripList = [item.strip() for item in stringList]
        return stripList
    
    def _setTaskRenames(self , items):
        if not isinstance(items , list):
            print (">> list 요소가 필요합니다.")
            return None

        selects = items
        startNum = self.ui.numRangeStart_Sb.value()
        endNum = self.ui.numRangeEnd_Sb.value()
        padding = int(self.ui.numPadding_Sb.value())

        upperStartAlp = self.ui.upperAlpStart_Le.text()
        upperEndAlp = self.ui.upperAlpEnd_Le.text()

        lowerStartAlp = self.ui.lowerAlpStart_Le.text()
        lowerEndAlp = self.ui.lowerAlpEnd_Le.text()

        nameField = self.ui.rename_Le.text()
        

        renameFunc = naming.nameSetUp()
        renameFunc.setNumber("{num}", startNum , endNum , padding)
        renameFunc.setUpperAlp("{Alp}" , upperStartAlp , upperEndAlp )
        renameFunc.setLowerAlp("{alp}" , lowerStartAlp , lowerEndAlp)
        renameFunc.setNameFormat( nameField , "{item}")  
        renameFunc.setAddItem(selects)
        
        task = renameFunc.bulids()
        
        
        return task
    
    def _loadCtrlData(self):
        data = []
        if not os.path.exists(ctrlsDataPath):
            raise ValueError(u">> 컨트롤러 데이터 불러오기 실패 : 현폴더에 ctrlsData 폴더가 없습니다.")
        
        fils = [x for x in os.listdir(ctrlsDataPath) if x.endswith(".ma")]
        
        for fileName in fils:
            fileImg = None
            filePath = os.path.join(ctrlsDataPath , fileName )
            isImg = os.path.exists(filePath.replace(".ma",".jpg"))
            if isImg:
                fileImg = filePath.replace(".ma",".jpg")

            itemName = fileName.replace(".ma","")

            dataDict = { "name"    : itemName , 
                        "filePath" : filePath ,
                        "imgPath"  : fileImg
            }
            data.append(dataDict)
        
        for dt in data:
            item = dt.get("name")
            self.ui.curves_Cbb.addItem(item , dt)
            
    def _setPreView(self , item , labelWidget):
        print (item )

    #_________________________________________________________________________loadui

    def closeEvent(self , event):
        try:
            self._savePrev()
        except Exception as e:
            print(u">> 종료 중 저장 실패: {}".format(e))

    def _loadPrev(self):
        data = None
        if os.path.exists(self._prevPath):
            try:
                with io.open(self._prevPath , "r" , encoding="utf-8") as f:
                    data = json.load(f)
            except:
                print(u">> 에러 : _prev.json 데이터 읽기 실패")
        if data:
            self._prevData.update(data)

            for key , widgetName , getAttr , setAttr , default in self._prevMap:
                widget = getattr(self.ui , widgetName)
                value = self._prevData.get(key , default)
                getattr(widget , setAttr)(value)

    def _savePrev(self):

        for key , widgetName , getAttr , setAttr , default in self._prevMap:
            widget = getattr(self.ui , widgetName)
            self._prevData[key] = getattr(widget , getAttr)()
        
        #__update

        upData = {}
        if os.path.exists(self._prevPath):
            try:
                with io.open(self._prevPath , "r" , encoding= "utf-8") as f:
                    upData = json.load(f)
            except Exception as e:
                print (u">> 에러 : _prev.json 데이터 읽기 실패\n>> 초기화 후 덮어쓰기 실행 ")
        upData.update(self._prevData)

        try:
            with io.open(self._prevPath  , "w", encoding= "utf-8") as f:
                try:
                    json_str = json.dumps(upData, ensure_ascii=False, indent=4)
                    if isinstance(json_str, str):
                        json_str = json_str.decode('utf-8')
                    f.write(json_str)
                except:
                    json.dump(upData, f, ensure_ascii=False, indent=4)
            print (u">> _prev.json 가 저장되었습니다.")
        except Exception as e:
            print(u">> 에러 : _prev.json 저장 중 오류 발생: {}".format(e))

    def init_ui(self, uiPath):
        if not os.path.exists(uiPath):
            raise ValueError(u">> {} 경로에 {}가 없습니다.".format(current_folderPath, uiPath))
        
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

    def _setup_icon(self):
        style = QApplication.style() 
        refresh_icon = style.standardIcon(QtWidgets.QStyle.SP_BrowserReload)

        iconMapTasks = [
            ("loadCurveData_Btn" , refresh_icon)
        ]
        for widget_name , icon in iconMapTasks:
            widget = getattr(self.ui , widget_name)
            getattr(widget , "setIcon")(icon)


def show():
    userToolUi = DesignerUI()
    userToolUi.show()