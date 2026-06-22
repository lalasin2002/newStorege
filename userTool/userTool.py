
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
from function import match ,grouping ,naming , pysideHelper , controlObject ,createObject , objectState , findObject


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

            ("groupingNames"            ,"grpExtraName_Te"             ,"toPlainText"       ,"setPlainText"         ,"_Grp,_Offset,_Prime,_PrimeGrp"),
            ("groupingPrefix"           ,"grpPrefixName_Rdb"           ,"isChecked"         ,"setChecked"           , False),
            ("groupingSuffix"           ,"grpSuffixName_Rdb"           ,"isChecked"         ,"setChecked"           , True),
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
            ("insertGrpNameFormat"      ,"insertGrpName_Le"            ,"text"              ,"setText"              , "{item}_insertGrp{Num}" )
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


    def insertGroup(self):
        numStart = self.ui.insertGroupingNumStart_Sb.value()
        



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
            aimDict ={
                "X" : [(1,0,0) ,(0,1,0) ,(0,1,0)],
                "Y" : [(0,1,0) ,(1,0,0), (1,0,0)],
                "Z" : [(0,0,1) ,(1,0,0), (1,0,0)]
            }

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
                inserter.orientJnt(aimDict.get(Axis)[0] ,aimDict.get(Axis)[1] , aimDict.get(Axis)[2] )
            
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

        groupsNames = self._getTextList(self.ui.grpExtraName_Te.toPlainText())
        sequenceParent = self.ui.groupingSequenceParent_Chb.isChecked()
        keepPosition = self.ui.groupingKeepPosition_Chb.isChecked()
        groupingCount = self.ui.grpCount_SB.value()

        prefix = False
        if self.ui.grpPrefixName_Rdb.isChecked():
            prefix = True
        if self.ui.grpSuffixName_Rdb.isChecked():
            prefix = False

        keepParentTask = []
        cmds.undoInfo(openChunk=1)
        try:
            upperTarget = None
            selects.reverse()
            for item in selects:
                rootParent = cmds.listRelatives(item , p =1 ,allDescendents=1)

                grp = grouping.Grping(item , groupingCount ,groupsNames ,prefix)

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