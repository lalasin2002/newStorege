# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.OpenMayaUI as omui
import maya.api.OpenMaya as om
import re , pprint , json , os, sys 

version_str = cmds.about(apiVersion=True)

if version_str >= 20250000:
    from shiboken6 import wrapInstance
else:
    from shiboken2 import wrapInstance


if sys.version_info[0] >= 3:
    from PySide6.QtWidgets import QApplication, QFileDialog
    from PySide6 import QtCore, QtWidgets, QtUiTools, QtGui 
else:
    from PySide2.QtWidgets import QApplication, QFileDialog
    from PySide2 import QtCore, QtWidgets, QtUiTools, QtGui 
'''
class RampLimiter(object): 
    # 일종의 callBack은 , 스크립트가 작동되는동안 특정 무언가를 감시하고 그걸 제어라는 것
    def __init__(self, node_name, attr_name, max_points=3):
        self.node_name = node_name
        self.attr_name = attr_name
        self.max_points = max_points
        self.callback_id = None
        
    def start(self):
        sel = om.MSelectionList() #cmds.ls(sl =1) 만듬 #원래 cmds.ls(sl =1) 클래스
        try:
            sel.add(self.node_name)
            mobj = sel.getDependNode(0)
        except Exception:
            cmds.warning(u">> [에러] 타겟 노드를 찾을 수 없습니다: {}".format(self.node_name))
            return

        self.callback_id = om.MNodeMessage.addAttributeChangedCallback(mobj, self._on_attr_changed)
        
        print(u">> API 콜백 센서 작동 시작! (타겟: {})".format(self.node_name))

    def stop(self):
        if self.callback_id is not None:
            om.MMessage.removeCallback(self.callback_id)
            self.callback_id = None
            # 창 닫을 때 센서가 잘 꺼지는지 확인
            print(u">> API 콜백 센서 해제 완료.")

    def _on_attr_changed(self, msg, plug, otherPlug, clientData):
        """센서가 움직임을 감지하면 실행되는 내부 함수입니다."""
        # 플러그 이름에 'value'가 포함되어 있는지 확인
        # (gradientControl은 value[3].value_Position 같은 하위 속성을 건드리므로 이름 검사를 조금 더 넉넉하게 잡습니다)
        if self.attr_name in plug.name():
            #  센서가 반응했는지 확인하는 생존 신고용 프린트!
            # print(u">>  속성 변화 감지됨: {}".format(plug.name())) 
            cmds.evalDeferred(self._check_and_remove)

    def _check_and_remove(self):
        target_path = "{}.{}".format(self.node_name, self.attr_name)
        if not cmds.objExists(target_path): return
            
        indices = cmds.getAttr(target_path, multiIndices=True)
        
        if indices and len(indices) > self.max_points:
            # 4 점이 3개를 넘었다는 걸 코드가 눈치챘는지 확인!
            print(u">> 점 개수 초과 감지! 현재: {}개 / 허용: {}개".format(len(indices), self.max_points))
            indices.sort()
            
            for extra_idx in indices[self.max_points:]:
                point_to_delete = "{}[{}]".format(target_path, extra_idx)
                cmds.removeMultiInstance(point_to_delete, b=True)
                #  삭제 명령이 정확한 타겟을 향해 날아갔는지 확인!
                print(u">> 강제 삭제됨: {}".format(point_to_delete))
                
            cmds.warning(u">> 그래프 포인트는 최대 {}개까지만 허용됩니다!".format(self.max_points))
'''
current_path = __file__
current_folderPath = os.path.abspath(os.path.dirname(current_path))

def _rampCreate(ramp = "nHairCntRamp"):
    if cmds.objExists(ramp):
        cmds.delete(ramp)
    
    node = cmds.createNode("remapValue", n =ramp )
    pointCount = 3
    div = 1.0/(pointCount -1)
    for i in range(pointCount):
        posV = div * i
        floatV = 1.0 - posV
        point = "{}.value[{}]" .format(node , i)
        cmds.setAttr(point + ".value_Position" , posV)
        cmds.setAttr(point + ".value_FloatValue" , floatV)
    return node



#-------------------------------------------------------------------------------------------------
def maya_main_window():
    maya_main_window_ptr = omui.MQtUtil.mainWindow()
    if sys.version_info[0] >= 3:
        return wrapInstance(int(maya_main_window_ptr), QtWidgets.QWidget)
    else:
        return wrapInstance(long(maya_main_window_ptr), QtWidgets.QWidget)


class DesignerUI(QtCore.QObject):
    def __init__(self):
        super(DesignerUI, self).__init__()
        # 일반 object이므로 super() __init__ 이 필요 없습니다.
        self.importDate = {}
        self.ctrlsData = {}
        self.scene_info = {}
        self.selected_attrs = []
        self.referenceData = {}
        self.ramp = "nHairCntRamp"


        self.matchList = ["ScenePath"  ,
                          "SceneInfo",
                            "SceneFileName" ,
                            "SceneName"  ,
                            "SceneExt" ,
                            "SceneFolderPath" ,
                            "driverPath"  ,
                            "mainFolder" ,
                            "subFolder"  ,
                            "project" ,
                            "episode"  , 
                            "sequence"  ,
                            "cut" , 
                            "season" ]
        self.currentFrameBool = False
        try:
            self._string_type = basestring
        except NameError:
            self._string_type = str

        self.tags = ["Collision", "CollisionCnt" ,"nHair_Ctrl" , "headCenter" , "headCenterCnt" , "outputCrv" , "inputCrv" , "inputCrvCnt" , "cntBlsh" , "cntCollisionBlsh" ]
        self.init_ui()
        #self._setup_ramp_and_limiter()
        #self._set_gradientLayout(self.ramp)
        self.setup_table_widget()
        
        self.set_currentPath()
        self._get_Frame()
        self._set_exportFrame()
        self.set_alembicPath()
        
        self.connect_widget()
    
    #---------------------------------------------------------------------------------------------ui 함수
    def init_ui(self , parent = maya_main_window() ):
        ui_file = os.path.join(current_folderPath, "nHairManager.ui")
        
        if not os.path.exists(ui_file):
            cmds.error(u">> UI 파일이 없습니다: {}".format(ui_file))
            return
        
        f = QtCore.QFile(ui_file)
        f.open(QtCore.QFile.ReadOnly)
        loader = QtUiTools.QUiLoader()
        self.ui = loader.load(f, parent ) 
        f.close()
        self.ui.setWindowFlags(QtCore.Qt.Window)
        self.ui.setWindowTitle("nHairManagerUI")

    def connect_widget(self):

        self.ui.RefAssetSearch_Btn.clicked.connect(self.Add_refList)
        self.ui.setFrame_Btn.clicked.connect(self.set_Frame)
        self.ui.refer_nHair_Btn.clicked.connect(self.refer_nHair)
        self.ui.refer_nHair_Btn.clicked.connect(self.Add_searchAlembicCurves)

        self.ui.References_LW.itemSelectionChanged.connect(self.Add_Ctrls)
        self.ui.References_LW.itemSelectionChanged.connect(self.Add_searchAlembicCurves)


        self.ui.CtrlReload_Btn.clicked.connect(self.Add_Ctrls)
        #self.ui.CtrlAttrs_LW.itemSelectionChanged.connect(self.Add_Attrs)
        self.ui.AttrReload_Btn.clicked.connect(self.Add_Attrs)

        self.ui.setAttr_Btn.clicked.connect(self.setAttr_from_Qwidget)
        self.ui.currentPath_Btn.clicked.connect(self.set_currentPath)
        self.ui.currentPath_Btn.clicked.connect(self.set_alembicPath)

        self.ui.ExportPath_Btn.clicked.connect(lambda : self.set_pathWindow( self.ui.ExportPath_LE))
        self.ui.CrvReload_Btn.clicked.connect(self.Add_searchAlembicCurves)
        self.ui.alembicCurve_LW.itemSelectionChanged.connect(self.set_alembicDataName)

        self.ui.Export_Btn.clicked.connect(self.alembic_export)
        self.ui.alembicLoadtPath_Btn.clicked.connect(lambda : self.set_pathWindow(self.ui.alembicLoadtPath_LE))
        
        self.ui.alembicFileLoad_Btn.clicked.connect(self.Add_alembicFileLoad)
        self.ui.alembicFileLoad_Btn.clicked.connect(self.set_referenceData_for_alembic)

        self.ui.alembicRefer_Btn.clicked.connect(self.load_referenceAlembicData)
        self.ui.alembicRefer_Btn.clicked.connect(self.set_referenceData_for_alembic)

        self.ui.alembicRefer_connect_Btn.clicked.connect(self.set_referenceData_for_alembic)
        self.ui.alembicRefer_connect_Btn.clicked.connect(self.cnt_alembicReference)

        #-------------------------CallBack관련
        #self.ui.setAttractionScale_Btn.clicked.connect(self.set_attrectionScale_value)



    def show(self):
        self.ui.show()
    #---------------------------------------------------------------------------------------------------------Ramp 콜백관련
    '''
    def _setup_ramp_and_limiter(self):
        self.nHairRamp = _rampCreate(self.ramp)
        self.my_limiter = RampLimiter(self.nHairRamp, "value", max_points=3)
        self.my_limiter.start()

    def eventFilter(self, obj, event):
        # 마우스 클릭이 아니라, 창이 닫히는(Close) 이벤트일 때만 작동!
        if obj == self.ui and event.type() == QtCore.QEvent.Close:
            if hasattr(self, 'my_limiter') and self.my_limiter:
                self.my_limiter.stop() # 창이 닫히면 센서도 깔끔하게 종료
        return False # 다른 이벤트들은 원래대로 지나가게 둠
    '''
    #---------------------------------------------------------------------------------------------------------

    def set_attrectionScale_value(self):
        seletedItem = self._Get_QtListItems(self.ui.Ctrls_LW)

        if seletedItem and cmds.objExists(self.nHairRamp):
            pprint.pprint(seletedItem)
            MatchList = ["value1_attract" , "value2_attract" , "value3_attract" , "pos1_attract" , "pos2_attract" , "pos3_attract"]


            point1 = "{}.vlaue[0]" .format(self.nHairRamp)
            point2 = "{}.vlaue[1]" .format(self.nHairRamp)
            point3 = "{}.vlaue[2]" .format(self.nHairRamp)
            Data = { point1 : {"pos" : (cmds.getAttr(point1 + ".value_Position")  , cmds.getAttr(point1 + ".value_FloatValue"))} ,
                     point2 : {"pos" : (cmds.getAttr(point2 + ".value_Position")  , cmds.getAttr(point1 + ".value_FloatValue"))} ,
                     point3 : {"pos" : (cmds.getAttr(point3 + ".value_Position")  , cmds.getAttr(point1 + ".value_FloatValue"))}
                    }



                





    def refer_nHair(self):
        if self.importDate:
            for Rn , refData in self.importDate.items():
                #print (Rn ,refData )
                nHairPath = refData.get("nHairPath")
                nHairFile = refData.get("nHairFile")
                nHairRN = None
                FileName = None
                if nHairFile:
                    FileName = nHairFile.split(".")[0]
                    nHairRN = "{}RN".format(FileName)


                if os.path.exists(nHairPath):
                    if not cmds.objExists(nHairRN):
                        nHairRN = self._load_reference(refData["nHairPath"])

                    refAllitems = cmds.referenceQuery(nHairRN ,nodes=True, dagPath=True )
                    refAlltransform = cmds.ls(refAllitems , type = "transform")
                    refAllBlsh = cmds.ls(refAllitems , type = "blendShape")
                    refAllNodes = []
                    refAllNodes +=refAlltransform
                    refAllNodes +=refAllBlsh

                    #----------------------------------------------------0223여기부터 정리 #1.레퍼런스 불러오고 이미 있으면 킾 , 2.tag 검출로 ch에셋에 연결
                    sa = ["Collision" ,"nHair_Ctrl" , "headCenter" , "outputCrv" , "inputCrv" , "cntBlsh" ]

                    Data = {}
                    for string in self.tags:
                        lists = []
                        
                        for node in refAllNodes:
                            getTag = self._stringAttrSearchs(node)
                            if getTag and getTag == string:
                                lists.append(node)
                        if len(lists) == 1:
                            lists = lists[0]
                        else:
                            lists = sorted(lists)
                        
                        Data[string] = lists
                    Data["nHairRn"] = nHairRN
                    Data["assetName"] = Rn.replace("RN" , "")
                    #----------------------------------------------------
                    chaAllitems = cmds.referenceQuery(Rn,nodes=True, dagPath=True )
                    chaAlltransform = cmds.ls(chaAllitems, type = "transform")
                    for string in self.tags:
                        for node in chaAlltransform:
                            getTag = self._stringAttrSearchs(node)
                            if getTag and getTag == string:
                                Data[string] = node
                    self.ctrlsData[Rn] = Data
                    #----------------------------------------------------
                    cmds.currentTime( 1, edit=True)
                    if not cmds.listRelatives(self.ctrlsData[Rn]["headCenter"] , type = "parentConstraint"):
                        cmds.parentConstraint(self.ctrlsData[Rn]["headCenterCnt"] , self.ctrlsData[Rn]["headCenter"] ,mo =0)
                    if not cmds.listRelatives(self.ctrlsData[Rn]["headCenter"] ,type =  "scaleConstraint"):
                        cmds.scaleConstraint(self.ctrlsData[Rn]["headCenterCnt"] , self.ctrlsData[Rn]["headCenter"] ,mo =0)
                    #["Collision", "CollisionCnt" ,"nHair_Ctrl" , "headCenter" , "headCenterCnt" , "outputCrv" , "inputCrv" , "inputCrvCnt" , "cntBlsh" , "cntCollisionBlsh" ]
                    BlshName = Rn.replace("RN" , "_CollisionBlsh")
                    if not self.ctrlsData[Rn].get("cntCollisionBlsh") and not cmds.objExists(BlshName):
                        Blsh = cmds.blendShape(self.ctrlsData[Rn]["CollisionCnt"] , self.ctrlsData[Rn]["Collision"] ,n =BlshName  )
                        cmds.setAttr("{}.{}" .format(BlshName , self.ctrlsData[Rn]["CollisionCnt"].split(":")[-1] ) , 1)
                        self.ctrlsData[Rn]["cntCollisionBlsh"] = BlshName
                    if not cmds.objExists("{}.{}" .format(self.ctrlsData[Rn]["cntBlsh"], self.ctrlsData[Rn]["inputCrvCnt"] ) ):
                        cmds.blendShape(self.ctrlsData[Rn]["cntBlsh"] , e =1 , target= (self.ctrlsData[Rn]["inputCrv"] ,1  , self.ctrlsData[Rn]["inputCrvCnt" ] , 1))
                        cmds.setAttr("{}.{}".format( self.ctrlsData[Rn]["cntBlsh"], self.ctrlsData[Rn]["inputCrvCnt"].split(":")[-1]),1 )


            #pprint.pprint(self.ctrlsData)
    def set_alembicPath(self):
        
        if self.scene_info:
            
            exportDict = self.scene_info.copy()
            defaultMain = "03_Main-Production"
            default_subFolder = "04_Simulation"
            default_epSubFolder = "Alembic"
            default_alembicFolder = self.scene_info.get("SceneInfo")
            default_folder = self.scene_info.get("SceneInfo")

            RootPathFormat = "{dr}/Project_{pj}/{season}/{main}/{sub}" .format(dr = self.scene_info.get("driverPath"),
                                                                            pj =self.scene_info.get("project") ,
                                                                            sub = default_subFolder,
                                                                            season = self.scene_info.get("season") ,
                                                                            main = defaultMain )
            lists=[]
            full_path = None
            if os.path.exists(RootPathFormat):
                #print ("sss")
                for dirpath, dirnames, filenames in os.walk(RootPathFormat):
                    #print (dirpath)
                    #print (dirnames)
                    #print (filenames)

                    if default_folder in dirnames:
                        full_path = os.path.join(dirpath, default_folder)
                        lists.append(full_path)
            #print (lists[-1] )
            if len(lists)>0:
                full_path = lists[-1]     



            
            
            '''
            {middle}/{folder}".format(dr = self.scene_info.get("driverPath") ,
                                                                            pj =self.scene_info.get("project") ,
                                                                            sub = default_subFolder,
                                                                            season = self.scene_info.get("season") ,
                                                                            main = defaultMain ,
                                                                            middle = self.scene_info.get("middlePath") , 
                                                                            folder = self.scene_info.get("SceneInfo")
                                                                            )
            '''

            if full_path:
                absPath = os.path.abspath(full_path )
                absPath = absPath.replace("\\", "/")
                self.ui.ExportPath_LE.setText(absPath)
                self.ui.alembicLoadtPath_LE.setText(absPath)




    def setAttr_from_Qwidget(self):
        selects_attrs =[]
        selected_indexes = self.ui.CtrlAttrs_TW.selectionModel().selectedRows()
        selected_ctrls = self._Get_Selected_QtList(self.ui.Ctrls_LW)
        setvalue = self.ui.setAttr_Dsb.value()

        if selected_ctrls and selected_indexes:

            for index in selected_indexes:
                row = index.row()

                attr = self.ui.CtrlAttrs_TW.item(row , 0 )
                value = self.ui.CtrlAttrs_TW.item(row , 1 )

                if attr and value:
                    attr_text = attr.text()
                    value_text = value.text().replace(":", "").strip()
                    selects_attrs.append((row  , attr_text))

            for Ctrl in selected_ctrls:
                for num , attr in selects_attrs:
                    CtrlAttr = "{}.{}".format(Ctrl , attr)
                    isCtrlAttr = cmds.objExists( CtrlAttr)

                    if isCtrlAttr:
                        cmds.setAttr(CtrlAttr , setvalue)
                        self.selected_attrs.append( (num ,attr ))
                    else:
                        print (u"{} 가 존재하지않음" .format(CtrlAttr))

            self.Add_Attrs()
            #-----------------------셀렉트 유지
            if self.selected_attrs:
                for row , text in self.selected_attrs:
                    self.ui.CtrlAttrs_TW.selectRow(row)

    def Add_alembicFileLoad(self):
        path = self.ui.alembicLoadtPath_LE.text()
        isPath = os.path.exists(path)
        if isPath:
            pathDirList = [x for x in os.listdir(path) if ".abc" in x]
            
            self._Add_QtList(self.ui.alembicLoad_LW ,pathDirList )

    def load_referenceAlembicData(self):
        if not cmds.pluginInfo("AbcImport", query=True, loaded=True):
            cmds.loadPlugin("AbcImport")
        
        getData = self._Get_Selected_QtList(self.ui.alembicLoad_LW)
        getFolderPath = self.ui.alembicLoadtPath_LE.text()
        alembicPaths = []

        if getData and getFolderPath:
            for file in getData:
                ablembicPath = os.path.join(getFolderPath ,file )
                ablembicPath = ablembicPath.replace("\\", "/")
                if os.path.exists(ablembicPath):
                    alembicPaths.append(ablembicPath)
            if len(alembicPaths) >0:
                for path in alembicPaths:
                    nameSpace = None
                    filePath , file = os.path.split(path)
                    nameSpace , ext = os.path.splitext(file)

                    if nameSpace:
                        try:
                            cmds.file(path , reference= True , type = "Alembic" ,namespace=nameSpace , ignoreVersion=True,deferReference=False )
                            print (u">> 알렘빅 레퍼런스 성공: [{}] {}".format(nameSpace, path))
                        except Exception as e:
                                print (u">> 알렘빅 레퍼런스 실패: {}".format(e))

    def cnt_alembicReference(self):
        #{"nHair" : None , "ablembic" : None , "inputCurve" : None}
        if self.referenceData:
            for charRn , Data in self.referenceData.items():
                
                is_nHairRn = Data.get("nHair")
                is_alembicRn = Data.get("ablembic")
                is_inputCurve = Data.get("inputCurve")

                if is_alembicRn and is_inputCurve:
                    if cmds.objExists(is_alembicRn) and cmds.objExists(is_inputCurve):
                        item = charRn.replace("RN" , "")
                        cntBlshName = "cnt_alembic_{}" .format(item)
                        getBlshAttr = "{blsh}.{t}" .format(blsh =cntBlshName , t = is_alembicRn.split(":")[-1] )
                        cmds.setAttr(is_alembicRn + ".visibility" , 0)

                        print (">>>>" , getBlshAttr)
                        if not cmds.objExists(cntBlshName):
                            print (False)
                            cntBlshName = cmds.blendShape( is_alembicRn   , is_inputCurve   , n = cntBlshName)[0]
                            cmds.setAttr( getBlshAttr , 1)
                            getV = None
                        else:
                            print (True)
                            cmds.setAttr( getBlshAttr , 1)

                        #print (is_inputCurve)
                        skinCluster =self._querySkinCluster(is_inputCurve)
                        if skinCluster:
                            for node in skinCluster:
                                nodeAttr = "{}.envelope" .format(node)
                                if cmds.objExists(nodeAttr):
                                    cmds.setAttr( nodeAttr , 0)
                
                if is_nHairRn:
                    Blsh_targetAttr = "rig_sim_curve_G"
                    is_blsh_attr = "{}.{}" .format(is_nHairRn , Blsh_targetAttr)
                    print (is_blsh_attr)
                    if cmds.objExists(is_blsh_attr):
                        
                        #getValue = cmds.getAttr(is_blsh_attr)

                        #if getValue == 1:
                        cmds.setAttr(is_blsh_attr , 0)



        
    def set_referenceData_for_alembic (self):
        RnData = self._Get_referenceDatas()
        Pattern = r"(ch_)([0-9]+_)(.+)(_rigRN)"
        data = {}
        if RnData:
            for Rn in RnData:
                search = re.search(Pattern , Rn)
                if search:
                    data[Rn] = {"nHair" : None , "ablembic" : None , "inputCurve" : None}
                    refNodes = cmds.referenceQuery(Rn , nodes=1)
                    refNodes = [x for x in cmds.ls(refNodes , type = "transform") if  self._stringAttrSearchs(x) == "inputCrvCnt"]
                    if refNodes:
                        data[Rn]["inputCurve"] = refNodes[0]

            if data:
                for keyRn , v in  data.items():
                    Pattern = str(keyRn.replace("_rigRN" , ""))
                    PatternHair = "{}_nHairRN" .format(Pattern)
                    PatternAlembic = "{}_cacheRN" .format(Pattern)
                    for Rn in RnData:
                        search_nHair = re.search(PatternHair , Rn)
                        search_alembic = re.search(PatternAlembic , Rn)

                        if search_nHair:
                            refNodes = cmds.referenceQuery(Rn , nodes=True )
                            blshs = cmds.ls(refNodes , type = "blendShape")
                            blshs = [x for x in blshs if self._stringAttrSearchs(x)]
                            if blshs:
                                data[keyRn]["nHair" ] = blshs[0]
                        if search_alembic:
                            refNodes = cmds.referenceQuery(Rn , nodes=True )
                            if refNodes:
                                data[keyRn]["ablembic"] = refNodes[0]


                    self.referenceData = data
            pprint.pprint(data)

    def Add_searchAlembicCurves(self):
        simCurveData = []
        if self.ctrlsData:
            #pprint.pprint (self.ctrlsData)
            for Rn , Data in self.ctrlsData.items():
                #isData = Data.get("assetName")
                isCurves = Data.get("outputCrv")
                if isCurves:
                    simCurveData.append(isCurves)
            if simCurveData:
                self._Add_QtList(self.ui.alembicCurve_LW , simCurveData)
            #
    def set_alembicDataName(self):
        Names = self._Get_Selected_QtList(self.ui.alembicCurve_LW )
        if Names:
            Names = Names[-1]
        if cmds.objExists(Names):
            Name =Names.split(":")[0].replace("_nHair" , "_cache.abc")
            self.ui.ExportName_LE.setText(Name)

    def alembic_export(self):
        if not cmds.pluginInfo("AbcExport", query=True, loaded=True):
            cmds.loadPlugin("AbcExport")

        startFrame = self.ui.startExportFrame_DSB.value()
        endFrame = self.ui.endExportFrame_DSB.value()
        cmds.playbackOptions(minTime=startFrame, maxTime=endFrame)

        # 1. 파일 경로 조립은 반복문 들어가기 전에 한 번만 세팅합니다.
        exportFolderPath = self.ui.ExportPath_LE.text()
        exportFileName = self.ui.ExportName_LE.text()

        if not os.path.exists(exportFolderPath):
            os.makedirs(exportFolderPath)

        exportPath = os.path.join(exportFolderPath, exportFileName)
        exportPath = exportPath.replace("\\", "/") # 마야를 위한 역슬래시 변환

        selectItem = self._Get_Selected_QtList(self.ui.alembicCurve_LW)
        
        if selectItem:
            # 2. job_str의 뼈대(프레임 구간 등)를 만듭니다.
            job_str = "-frameRange {0} {1} -dataFormat ogawa -uvWrite -worldSpace ".format(startFrame, endFrame)
            
            valid_roots = 0 # 씬에 존재하는 오브젝트 개수 카운트
            
            # 3. 반복문 안에서는 오직 오브젝트 이름(-root)만 수집합니다!
            for listW_item in selectItem:
                foundItems = self.ui.alembicCurve_LW.findItems(listW_item, QtCore.Qt.MatchExactly)
                if foundItems:
                    self.ui.alembicCurve_LW.setCurrentItem(foundItems[0])

                longName = cmds.ls(listW_item, long=1) 
                
                if longName:
                    # 오브젝트가 존재하면 -root 에 추가
                    job_str += "-root {0} ".format(longName[0])
                    valid_roots += 1
                else:
                    cmds.warning(u">> 익스포트 실패 : 씬안에 {}가 존재하지 않음".format(listW_item))

            # 4. 반복문이 끝난 후, 유효한 타겟이 하나라도 있다면 '딱 한 번만' 익스포트 실행
            if valid_roots > 0:
                # 마지막에 파일 경로(-file)를 붙여줍니다.
                job_str += '-file "{0}"'.format(exportPath)

                print (u">> 최종 job_str : \n>> {}".format(job_str))

                try:
                    if os.path.isfile(exportPath):
                        os.remove(exportPath)

                    cmds.AbcExport(j=job_str)
                    print (u">> 알렘빅 익스포트 성공: {}".format(exportPath))
                    
                    # 성공했을 때 폴더 열어주기
                    if os.path.exists(exportFolderPath):
                        os.startfile(exportFolderPath)
                        
                except Exception as e:
                    print (u">> 알렘빅 익스포트 실패: {}".format(e))

    def Add_Attrs(self):
        seletedItems = self._Get_Selected_QtList(self.ui.Ctrls_LW)
        IntersectionAttrs = self._listAttrs_Intersection(seletedItems)
        IntersectionAttrs = [ x for x in IntersectionAttrs if not any(y in x for y in ["sep" , "tag"])]
        Tw = self.ui.CtrlAttrs_TW
        Tw.setRowCount(0)
        if IntersectionAttrs and seletedItems:
            data = []


            for attr in IntersectionAttrs:
                Ctrl = "{}.{}" .format(seletedItems[-1] ,attr )
                get = cmds.getAttr(Ctrl)
                element = (attr , get)
                data.append(element)

            for row , (attr , value) in enumerate(data):
                Tw.insertRow(row)
                name_item = QtWidgets.QTableWidgetItem(attr)
                value_str = ":     {0}".format(value)
                value_item = QtWidgets.QTableWidgetItem(value_str)
                name_item.setFlags(name_item.flags() ^ QtCore.Qt.ItemIsEditable)
                value_item.setFlags(value_item.flags() ^ QtCore.Qt.ItemIsEditable)



                Tw.setItem(row, 0, name_item)
                Tw.setItem(row, 1, value_item)

            Tw.resizeColumnToContents(0)

    def Add_Ctrls(self):
        seletedItem = self.ui.References_LW.selectedItems()
        if seletedItem:
            seletedItemText = seletedItem[0].text()
            items = self.ctrlsData[seletedItemText]["nHair_Ctrl"]
            items= sorted(items)
            self._Add_QtList(self.ui.Ctrls_LW ,  items)



    def Add_refList(self):
        # 기존 코드와 동일하게 작동하도록 구성
        workRefs = []
        refs = self._Get_referenceDatas()
        Pattern = r"(ch_)([0-9]+_)(.+)(_rigRN)"
        
        for i, rn in enumerate(refs):
            DataDict = {}
            Folder = None
            Search = re.search(Pattern, rn)
            if Search:
                refPath = self._Get_referencePath(rn)
                Path, ref_File = os.path.split(refPath)
                Folder = os.path.dirname(refPath)
                files = os.listdir(Folder)
                
                nHairPattern = r"(ch_)([0-9]+_)(.+)(_nHair)(\.m[ab])"
                for file in files:
                    files_search = re.search(nHairPattern, file)

                    if files_search:
                        nHairPath = os.path.join(Path, file)

                        DataDict["assetPath"] = refPath
                        DataDict["nHairPath"] = nHairPath
                        DataDict["nHairFile"] = file
                        DataDict["folderPath"] = Folder
                        

                        self.importDate[rn] = DataDict
                        
        #pprint.pprint(self.importDate)
        keyList = list(self.importDate.keys()) 
        self._Add_QtList(self.ui.References_LW, keyList)

    def set_Frame(self):
        #self._get_Frame()
        startFrame = self.ui.startFrame_DSB.value()
        endFrame = self.ui.endFrame_DSB.value()

        cmds.playbackOptions(minTime=startFrame , maxTime=endFrame)
        cmds.playbackOptions(animationStartTime= startFrame , animationEndTime = endFrame)

    def set_currentPath(self):
        self._get_scenePathData()
        self.ui.currentPath_LE.setText(self.scene_info.get("ScenePath"))

    def set_pathWindow(self ,QLineTarget,  FileSelet = False):
        if not QApplication.instance():
            App = QApplication(sys.argv)
        Options = QFileDialog.Options()

        DirSelect = "Folder"
        if FileSelet == True:
            DirSelect = "File"
            Options |= QFileDialog.ReadOnly
            
        DirPath = None
        Path = None
        if FileSelet == True:
            DirPath = QFileDialog.getOpenFileName(None , "Select {}" .format(DirSelect) , options=Options)
            Path = DirPath[0]
        else:
            DirPath = QFileDialog.getExistingDirectory(None , "Select {}" .format(DirSelect) , options=Options)
            Path = DirPath
        if DirPath:
            QLineTarget.setText( Path)  

    '''
    def _set_gradientLayout(self , ramp):

        target_attr = "{}.value".format(ramp)

        targetFrame = self.ui.mayaGrd
        if not targetFrame.layout():
            QtWidgets.QVBoxLayout(targetFrame )
        cmds.window()
        cmds.columnLayout()


        MayaGradient = cmds.gradientControl(at=target_attr)
        ptr = omui.MQtUtil.findControl(MayaGradient)
        try:
            maya_widget = wrapInstance(int(ptr), QtWidgets.QWidget)
        except:
            maya_widget = wrapInstance(long(ptr), QtWidgets.QWidget)

        targetFrame.layout().addWidget(maya_widget)
    '''
        
    #---------------------------------------------------------------------------------------------HelperFunc
    def _querySkinCluster(self , target , nodeType = "nurbsCurve"):
        returnData = None
        if cmds.objExists(target):
            cmds.select(target , hierarchy = 1)
            data = cmds.ls(sl =1 )
            data = cmds.ls(data , type = nodeType , s=1)
            if data:
                returnData = []
                for obj in data:
                    skin_clusters = cmds.listHistory(obj, pruneDagObjects=True, il=1) or []
                    sc = cmds.ls(skin_clusters, type='skinCluster')
                    #print (">>> obj" , sc)
                    if sc:
                        returnData +=sc

        return returnData

    def _checkDict(self , dictData , listData , prf = True):

        if isinstance(dictData , dict) and isinstance(listData , list):
            if all(dictData.get(x) for x in listData):
                if prf:
                    for k, v in dictData.items():
                        print ( k , v)
                return True
        return False


    def setup_table_widget(self):
        """테이블 위젯을 리스트 위젯처럼 보이도록 외형을 설정합니다."""
        for widget in [self.ui.CtrlAttrs_TW ]:
        
            widget.setColumnCount(2) # 열 개수를 2개(이름, 값)로 강제 설정
            
            # 1. 헤더와 격자선 숨기기 (가장 중요)
            widget.horizontalHeader().setVisible(False)
            widget.verticalHeader().setVisible(False)
            widget.setShowGrid(False)
            
            # 2. 선택 방식 변경 (셀 단위가 아닌 줄 단위로 선택되게)
            widget.setSelectionBehavior(QtWidgets.QAbstractItemView.SelectRows)
            
            # 3. 마지막 열(숫자 부분)이 남는 공간을 꽉 채우도록 설정
            widget.horizontalHeader().setStretchLastSection(True)



    def _get_Frame(self):
        script_content =None
        node_name = "sceneConfigurationScriptNode"
        frameData = {}
        if cmds.objExists(node_name):
            script_content = cmds.getAttr(node_name + ".before")
            if not script_content:
                script_content = cmds.getAttr(node_name + ".after")

            search = re.search(r'playbackOptions\s+([^;]+)' ,script_content)
            if search:
                options = search.group(1)
                #print (options)
                searchFindalls = re.findall(r"-(\w+)\s+([^\s]+)" , options) #[^\s]+ 는 공백이 아닌것들
                for flag, value in searchFindalls:
                    value = value.replace('"', '').replace("'", "")
                    value = float(value)
                    frameData[flag] = value
        
        if not frameData:
            full_start = cmds.playbackOptions(q=True, animationStartTime=True)
            full_end = cmds.playbackOptions(q=True, animationEndTime=True)
            #ast , aet
            frameData["ast"] =  full_start
            frameData["aet"] =  full_end


        
        self.ui.startFrame_DSB.setValue(frameData["ast"])
        self.ui.endFrame_DSB.setValue(frameData["aet"])

        if self.currentFrameBool == False:
            self.ui.StaticStartFrame_DSB.setValue(frameData["ast"])
            self.ui.StaticEndFrame_DSB.setValue(frameData["aet"])
            self.currentFrameBool = True
        
    def _set_exportFrame(self):
        staticStartFrame = self.ui.StaticStartFrame_DSB.value()
        staticEndFrame = self.ui.StaticEndFrame_DSB.value()
        staticStartFrame = staticStartFrame - 50

        self.ui.startExportFrame_DSB.setValue(staticStartFrame)
        self.ui.endExportFrame_DSB.setValue(staticEndFrame)

    def _get_scenePathData(self , check = False):
        scene_info = {"ScenePath"  : None,
                "SceneFileName" : None,
                "SceneName" : None ,
                "SceneExt" : None,
                "SceneFolderPath" : None ,
                "SceneInfo" : None , 
                "middlePath" : None ,

                "driverPath" : None ,
                "mainFolder" : None ,
                "subFolder" : None ,
                "project" : None ,
                "episode" : None , 
                "sequence" : None ,
                "cut" : None , 
                "season" : None,
                
                "alembicFolderPath" : None ,
                "alembicFileName" : None ,
                "alembicData" : [] , 
                
                }

        self.matchList = ["ScenePath"  ,
                "SceneFileName" ,
                "SceneName"  ,
                "SceneExt" ,
                "SceneFolderPath" ,
                "driverPath"  ,
                "mainFolder" ,
                "subFolder"  ,
                "project" ,
                "episode"  , 
                "middlePath" ,
                "sequence"  ,
                "cut" , 
                "season" ]


        fullPath = cmds.file(query=True, sceneName=True)
        folderPath , fileName = os.path.split(fullPath)
        sceneName , ext = os.path.splitext(fileName)
        scene_info["ScenePath"] = fullPath
        scene_info["SceneFileName"] = fileName
        scene_info["SceneFolderPath"] = folderPath
        scene_info["SceneName"] = sceneName
        scene_info["SceneExt"] = ext


        search_episode = re.search(r"(ep[0-9]+)",sceneName)
        if search_episode :
            scene_info["episode"] = search_episode.group(1)

        search_sequence = re.search(r"(sq[0-9]+)" , sceneName)
        if search_sequence:
            scene_info["sequence"] =  search_sequence.group(1)

        search_cut = re.search(r"(c[0-9]+)" , sceneName)
        if search_cut:
            scene_info["cut"] = search_cut.group(1)

        search_driverPath = re.search(r"([A-Za-z]:)", fullPath )
        if search_driverPath:
            scene_info["driverPath" ] = search_driverPath.group(1)

        search_project = re.search(r"(Project_)([a-zA-Z0-9_]+)" , fullPath  , re.IGNORECASE)
        if search_project:
            scene_info["project"] = search_project.group(2)

        search_season = re.search(r"(S[0-9]+)" , fullPath )
        if search_season:
            scene_info["season" ] = search_season.group(1)


        search_mainFolder = re.search(r"(\d{2}_[a-zA-Z0-9\-]+)" ,fullPath )
        mainFolder = ""
        if search_mainFolder:
            scene_info["mainFolder"] = search_mainFolder.group()
            mainFolder = str(search_mainFolder.group()) + r"/"

        subFolderPattern = mainFolder + r"(\d{2}_[a-zA-Z0-9\-]+)" 
        search_subFolder = re.search(subFolderPattern,fullPath )

        if search_subFolder:
            scene_info["subFolder"] = search_subFolder.group(1)

        scene_info["SceneInfo"] = "{pj}_{ep}_{sq}_{c}".format(
            pj = scene_info["project"] , ep = scene_info["episode"] , sq = scene_info["sequence"] ,c =  scene_info["cut"]
        )

        middlePath = "({dr}/Project_{pj}/{s}/{main}/{sub})/".format( pj = scene_info["project"],s = scene_info["season" ] , dr = scene_info["driverPath"] , main= scene_info["mainFolder"] ,sub = scene_info["subFolder"] ) +r"(.+)"   +  "(/{})" .format(fileName)
        #print (middlePath)
        #print (fullPath )
        search_middlePath = re.search(r"" +middlePath , fullPath )
        if search_middlePath:
            scene_info["middlePath"] = search_middlePath.group(2)

            #print (scene_info["middlePath"] )


        
        if check :
            checkF = self._checkDict(self.scene_info , self.matchList)
            if checkF:
                self.scene_info = scene_info
            else:
                self.scene_info = {}
        else:
            self.scene_info = scene_info


    def _listAttrs_Intersection(self , items):

        common_attrs = set()
        first_item = True

        for item in items:
            attrs = cmds.listAttr(item, ud=True, k=True ,l= 0 ,w =0) or []
            attr_set = set(attrs)

            if first_item:
                common_attrs = attr_set
                first_item = False
            else:
                common_attrs = common_attrs.intersection(attr_set)
                if not common_attrs:
                    break
        
        common_attrs = sorted(list(common_attrs))
        return common_attrs





    def _load_reference(self , file_path , name_space = None , cleanReturn = True):
        ref_rn_node = None

        if not os.path.exists(file_path):
            cmds.warning(u">> 파일이 존재하지 않습니다: {}".format(file_path))
            return None
        
        attrDict = {"reference" :True , "ignoreVersion" : True , "mergeNamespacesOnClash" : False, "returnNewNodes" : True}
        if name_space is None:
            Path, ref_File = os.path.split(file_path)
            file_name = ref_File.split(".")[0]
            name_space = "{}".format(file_name)

        if isinstance(name_space , self._string_type) and name_space:
            attrDict["namespace"] = name_space

        try:
            load_node = cmds.file(file_path, **attrDict)
            ref_rn_node = load_node
            if load_node and cleanReturn:
                rn_nodes = cmds.ls(load_node, type="reference")
                rn_nodes = [rn for rn in rn_nodes if "sharedReferenceNode" not in rn]
                if rn_nodes:
                    ref_rn_node = rn_nodes[0]

            return ref_rn_node
        except Exception as e:
                print (u">> 레퍼런스 로드 실패: {}".format(e))
                return None

    def _stringAttrSearchs(self,item , stringName = "tag"):
        if not cmds.objExists("{}.{}" .format(item , stringName)):
            return None
        else:
            String = cmds.getAttr("{}.{}" .format(item , stringName))
            return String

    def _Get_referenceDatas(self):
        Datas = cmds.ls("*RN", r=True, type="reference")
        return Datas or [] # None이 반환되는 것을 방지

    def _Get_referencePath(self, target, absPath=True):
        if not cmds.objectType(target) == "reference":
            raise TypeError(u">> {} 은 레퍼런스 데이터가 아닙니다 ".format(target))
        Path = cmds.referenceQuery(target, filename=True)
        if absPath:
            Path = os.path.abspath(Path)
        return Path

    def _Get_QtListItems(self, QList):
        lst = [QList.item(i).text() for i in range(QList.count())]
        return lst
    
    def _Get_Selected_QtList(self, list_widget):
        selected_objects = list_widget.selectedItems()
        text_list = [item.text() for item in selected_objects]
        return text_list
        
    def _Add_QtList(self, list_widget, item_list, clear=True, align="Left"):
        if clear:
            list_widget.clear()

        if not item_list:
            return

        work_list = item_list

        align_flag = QtCore.Qt.AlignLeft 
        
        if align == "Center":
            align_flag = QtCore.Qt.AlignHCenter
        elif align == "Right":
            align_flag = QtCore.Qt.AlignRight

        for txt in work_list:
            item = QtWidgets.QListWidgetItem(str(txt))
            item.setTextAlignment(align_flag)
            list_widget.addItem(item)