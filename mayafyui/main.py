# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import sys , os  ,json ,io  , tempfile ,pprint

try:
    from PySide6 import QtWidgets, QtCore, QtUiTools , QtGui 
    from PySide6.QtWidgets import QApplication
    
except:
    from PySide2 import QtWidgets, QtCore, QtUiTools , QtGui 
    from PySide2.QtWidgets import QApplication

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


#-------------------------------------------------------------preSetting

currentPath = os.path.dirname(os.path.abspath(__file__))
jsonPath = os.path.join(currentPath , "_prev.json")
uiPath =os.path.join(currentPath , "mayafyui.ui")
pathAppend()

#import module
from core import makeCode ,connectMayaSocket ,setPath , controlMayaCode , pysideHelper , stream , requestComfyui


#------------------------------------------------------------ui
class DesignerUI(QtWidgets.QDialog):
    def __init__(self , parent = None):
        super(DesignerUI ,self).__init__(parent) 

        self.ui =None
        self._log_stream = None

        self._previewSnapShotPath = None

        self._comfyuiBatPath = None
        self._comfyuiFolderPath = None
        self._comfyuiModelsPath = None
        self._comfyuiOutputPath = None
        self._comfyuiInputPath = None
        
        self._workFlowPath = os.path.join(currentPath , "works")
        

        self._isMayaPort = False
        self._isComfyuiPort = False

        self._mayaPort = None
        self._comfyuiPort = None
        self._host = None


        self._isPrev = None
        self._prevData = {}

        # (key, widget_name, getter, setter, default)
        self._prevMap =[
            ("host",              "setHost_Le",       "text",       "setText",  "127.0.0.1"),
            ("comfyuiPath",       "setComfyuiPath_Le","text",       "setText",    ""),

            ("mayaPort",          "setMayaPort_Sb",   "value",       "setValue", 7771),
            ("comfyuiPort",       "setComfyuiPort_Sb","value",       "setValue", 8188),

            ("snapShotScale",     "setSnapScale_Dsb", "value",       "setValue", 0.5),
            ("snapShotWidth",     "setSnapWidth_Sb",  "value",       "setValue", 1920),
            ("snapShotHeight",    "setSnapHeight_Sb", "value",       "setValue", 1080),
            ("snapShotShowGrid",  "checkShowGrid_Cb", "isChecked",   "setChecked", False),
            ("snapShotShowCurve", "checkShowCurve_Cb","isChecked",    "setChecked", False),
            ("snapShotShowJoint", "checkShowJoint_Cb","isChecked",    "setChecked", False),
            ("snapShotShowWire" , "checkShowWire_Cb", "isChecked",    "setChecked", False),
            ("snapShotShowHQ",    "checkShowHQ_Cb",   "isChecked",    "setChecked", False),

            ("comfyuiWidth",      "setWidth_Sb",        "value",        "setValue", 1920),
            ("comfyuiHeight",     "setHeight_Sb",       "value",        "setValue", 1080 ),
            ("comfyuiCFG",        "setCFG_Dsb",         "value",        "setValue", 7.0 ),
            ("comfyuiDenoise",    "setDenoise_Dsb",     "value",        "setValue", 1.0 ),
            ("comfyuiSeed",       "setSeed_Sb",         "value",        "setValue", -1),

            ("comfyui_positive_prompt" , "positivePrompt_Pte" , "toPlainText", "setPlainText"  , ""),
            ("comfyui_negative_prompt" , "negativePrompt_Pte" , "toPlainText", "setPlainText" , ""),


        ]




    def init_ui(self , path ):
        isUiPath = os.path.exists(path )

        if not isUiPath:
            print (u">> 에러 : ui 경로 찾을 수 없음" )
            return
        
        uiFile = QtCore.QFile(path)

        #QtCore.QFile = ui를 지정하기 위한 __init__ 클래스
        if not uiFile.open(QtCore.QFile.ReadOnly): #읽기 전용으로 열어보기
            print (u">> 에러 : ui 파일을 열수 없습니다.")
            return
        
        # ui XML 코드를 QUiLoader으로 재구성(코드에 맞게)
        Loader = QtUiTools.QUiLoader()
        self.ui = Loader.load(uiFile)

        uiFile.close() #열었으면 닫아야지


        # DesignerUI(QDialog)라는 빈 틀 안에 실제 UI 위젯 삽입
        # 이렇게 하면 윈도우 창의 테두리와 'X' 버튼의 권한이 DesignerUI 클래스로
        main_layout = QtWidgets.QVBoxLayout(self)
        main_layout.addWidget(self.ui)
        main_layout.setContentsMargins(0, 0, 0, 0)


        self._setup_log()
        self._setup_icons() #아이콘셋업
        self._connect_function()
        self._loadPrev()

        self._check_mayaSocket()
        self._check_comfyuiPath()
        self._check_compyfiPort()

        self._get_mayaCameras()
        self._get_checkPoints_For_widget()
        self._get_samplers_For_widget()

        pysideHelper.setDefault_QcomboBox(self.ui.selectMayaCamera_Cbb , "--select camara--")
        pysideHelper.setDefault_QcomboBox(self.ui.selectCheckPoint_Cbb , "--select checkPoint--")
        pysideHelper.setDefault_QcomboBox(self.ui.selectSampler_Cbb , "--select sampler--")

    def show_ui(self):
        self.show()

    #----------------------------------------------place in init_ui 

    def _connect_function(self):

        ## makeConnetCode
        self.ui.makeConnectCode_Btn.clicked.connect(self._savePrev)
        self.ui.makeConnectCode_Btn.clicked.connect(lambda : self._make_Connect_mayaScript(True))
        
        ## connectPort
        self.ui.connectPort_Btn.clicked.connect(self._savePrev)
        self.ui.connectPort_Btn.clicked.connect(self._check_mayaSocket)
        self.ui.connectPort_Btn.clicked.connect(self._check_comfyuiPath)
        self.ui.connectPort_Btn.clicked.connect(self._check_compyfiPort)


        ## get Data
        self.ui.connectPort_Btn.clicked.connect(self._get_mayaCameras)
        self.ui.connectPort_Btn.clicked.connect(self._get_checkPoints_For_widget)
        self.ui.connectPort_Btn.clicked.connect(self._get_samplers_For_widget)

        ## search comfyui Path
        self.ui.setComfyuiPath_Btn.clicked.connect(self.set_comfyuiFolderPath)

         # 로그 검사용

        ## load cams
        self.ui.reloadMayaCamera_Btn.clicked.connect(self._get_mayaCameras)
        
        ## snapShot
        self.ui.snapShot_Btn.clicked.connect(self.take_mayaSnapShot)

        ## Directory
        self.ui.openPreviewImage_Btn.clicked.connect(self.set_snapShotImageDirectory)
        self.ui.openPreviewImageFolder_Btn.clicked.connect(lambda : pysideHelper.open_directory(setPath.get_todayFolder(self._workFlowPath)))
        self.ui.reloadPreviewImage_Btn.clicked.connect(self.load_snapShotFolders)
        


        ## select Cbb Directory
        self.ui.previweFolder_Cbb.currentTextChanged.connect(self.load_select_SnapShotFolderData)

        ## select IconsImage
        self.ui.previewImage_Lw.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        self.ui.previewImage_Lw.itemClicked.connect(lambda : self.load_Preview(self.ui.previewImage_Lw.currentItem(),self.ui.previewSnapShotNames_Lb , self.ui.previewSnapShotResolution_Lb , self.ui.previewSnapShot_Lb ))
        self.ui.previewImage_Lw.customContextMenuRequested.connect( lambda pos: self.show_contextMenu(pos , self.ui.previewImage_Lw))


        ## comfyui
        self.ui.reloadComfyui_Btn.clicked.connect(self._get_checkPoints_For_widget)
        self.ui.reloadComfyui_Btn.clicked.connect(self._get_samplers_For_widget)


    def _setup_log(self):
        
        self._log_stream = stream.EmittingStream() #스트림 지정 변수
        # print ("sss")든 앞으로 나오는 메세지는 _textlog함수에 할당한다 라는 의미(text에 넣어라)
        self._log_stream.textWritten.connect(self._textlog) 

        # "앞으로 stdout으로 갈 거 다 self._log_stream으로 보내고, stderr도 마찬가지로."
        sys.stdout = self._log_stream #메세지를 가져온다.
        sys.stderr = self._log_stream #에러도 가져온다

        print(u">> log 스트림 설정됨") 
        

    def _textlog(self , text):
        #시그널 발사시 호춯
        self.ui.log_Pte.moveCursor(QtGui.QTextCursor.End) # 커서가 그 위치에서 끝 메모장 글쓸때 깜빡깜빡 할대 그위치
        self.ui.log_Pte.insertPlainText(text)

    def reject(self):
        self.close()
        super(DesignerUI, self).reject()

    def closeEvent(self, event):
        #스트림 원상복구
        sys.stdout = sys.__stdout__
        sys.stderr = sys.__stderr__
        
        # 터미널 출력 버퍼를 강제로 비워서 화면에 즉시 띄움 (flush)
        print(u"\n>> 프로그램 종료 중... 데이터 저장을 시작합니다.")
        sys.stdout.flush() 

        # 데이터 저장
        try:
            self._savePrev()
        except Exception as e:
            print(u">> 종료 중 저장 실패: {}".format(e))
            sys.stdout.flush()

        # 창 닫기 승인
        event.accept()
        super(DesignerUI, self).closeEvent(event)
    

    #---------------------------------------------------------------------------ui socket

    def _check_mayaSocket(self ):
        self._isMayaPort , _ = connectMayaSocket.check_mayaConnection(u"print ('pong')")


        if self._isMayaPort:
            self.ui.setMayaPort_Sb.setStyleSheet("background-color: #5DADE2;") 
            print (u">> maya port가 연결되었습니다.")
        else:
            self.ui.setMayaPort_Sb.setStyleSheet("background-color: #CD5C5C;") 
            print (u">> maya port가 연결되지 않았습니다.")


    def _check_comfyuiPath(self):
        """UI에서 ComfyUI 경로 검사 + 상태 갱신"""
        path = self.ui.setComfyuiPath_Le.text()
        isValid = self.is_valid_comfyuiPath(path)

        if isValid:
            self.ui.setComfyuiPath_Le.setStyleSheet("background-color: #5DADE2;")
            self._comfyuiFolderPath = path
            self.set_comfyuiSubPath()
            print(u">> comfyui 의 경로가 설정 되었습니다.")
        else:
            self.ui.setComfyuiPath_Le.setStyleSheet("background-color: #CD5C5C;")
            self._comfyuiFolderPath = None
            if path:
                print(u">> comfyui 의 경로가 설정 되지 않습니다.")

    def _check_compyfiPort(self):

        self._isComfyuiPort , _ = requestComfyui.check_comfyuiConnection()
        #print (check )
        #pprint.pprint(a)

        if self._isComfyuiPort:
            self.ui.setComfyuiPort_Sb.setStyleSheet("background-color: #5DADE2;")
            print(u">> comfyui Port 가 연결되었습니다.")
        else:
            self.ui.setComfyuiPort_Sb.setStyleSheet("background-color: #CD5C5C;")
            print(u">> comfyui Port 가 연결 되지 않습니다.")
    
    #-----------------------------------------------------------------------------------------check comfyuiPath 

    def is_valid_comfyuiPath(self , path):
        """순수 함수 - 경로가 유효한 ComfyUI 폴더인지만 확인"""
        if not path:
            return False

        is_portable_root = (os.path.exists(os.path.join(path, "python_embeded")) and 
                            os.path.exists(os.path.join(path, "ComfyUI", "main.py")))
        
        is_comfyui_inner = (os.path.exists(os.path.join(path, "main.py")) and 
                        os.path.exists(os.path.join(path, "nodes.py")) and
                        os.path.exists(os.path.join(path, "models")))
            
        return is_portable_root or is_comfyui_inner
        

    def set_comfyuiFolderPath(self):
        """폴더 선택 다이얼로그 → ComfyUI 경로 설정"""
        path = pysideHelper.set_existingDirectoryPath(self , currentPath )
        if not path:
            return
        self.ui.setComfyuiPath_Le.setText(path)
        self._check_comfyuiPath()  
        


    def set_comfyuiSubPath(self):
        if not self._comfyuiFolderPath:
            return
        
        if not self.is_valid_comfyuiPath(self._comfyuiFolderPath):
            print(u">> 에러 : 유효한 ComfyUI 경로가 없어 서브 경로 설정을 취소합니다.")
            return
        
        # 포터블 루트 vs ComfyUI 내부 구분
        isPortableRoot = os.path.exists(os.path.join(self._comfyuiFolderPath, "ComfyUI", "main.py"))
        
        if isPortableRoot:
            portableRoot = self._comfyuiFolderPath
            comfyuiInner = os.path.join(self._comfyuiFolderPath, "ComfyUI")
        else:
            portableRoot = os.path.dirname(self._comfyuiFolderPath)
            comfyuiInner = self._comfyuiFolderPath
        
        # models 폴더
        modelsPath = os.path.join(comfyuiInner, "models")
        if os.path.exists(modelsPath):
            self._comfyuiModelsPath = modelsPath.replace("\\", "/")
            print(u">> comfyui models 경로 :: {}".format(self._comfyuiModelsPath))
        else:
            print(u">> 에러 : comfyui models 경로 설정 실패")
        
        # output 폴더 (★ 갤러리용으로 필요!)
        outputPath = os.path.join(comfyuiInner, "output")
        if os.path.exists(outputPath):
            self._comfyuiOutputPath = outputPath.replace("\\", "/")
            print(u">> comfyui output 경로 :: {}".format(self._comfyuiOutputPath))
        
        # input 폴더 (★ 마야 스냅샷 업로드용)
        inputPath = os.path.join(comfyuiInner, "input")
        if os.path.exists(inputPath):
            self._comfyuiInputPath = inputPath.replace("\\", "/")
            print(u">> comfyui input 경로 :: {}".format(self._comfyuiInputPath))
        
        # bat 파일 (nvidia 우선, 없으면 cpu)
        nvBat = os.path.join(portableRoot, "run_nvidia_gpu.bat")
        cpuBat = os.path.join(portableRoot, "run_cpu.bat")
        
        if os.path.exists(nvBat):
            self._comfyuiBatPath = nvBat.replace("\\", "/")
            print(u">> comfyui 실행파일 :: {}".format(self._comfyuiBatPath))
        elif os.path.exists(cpuBat):
            self._comfyuiBatPath = cpuBat.replace("\\", "/")
            print(u">> comfyui 실행파일 (CPU) :: {}".format(self._comfyuiBatPath))
        else:
            self._comfyuiBatPath = None
            print(u">> 경고 : .bat 파일 없음 ")

    #---------------------------------------------------------------------------request comfyui
    def _get_checkPoints_For_widget(self):
        if not self._isComfyuiPort:
            print (u">> comfyui Port가 연결되지 않았습니다.")
            return
        
        success , data = requestComfyui.get_checkPoints()

        if not isinstance(data, list):
            print(u">> 에러 : 예상치 못한 응답 형식: {}".format(data))
            return

        if success:
            data.sort()
            #self.ui.selectCheckPoint_Cbb.clear()
            pysideHelper.setDefault_QcomboBox(self.ui.selectCheckPoint_Cbb,"---select checkPoint--- ")
            self.ui.selectCheckPoint_Cbb.addItems(data)
            print (u">> checkPoint 정보 : {}". format(data))

    def _get_samplers_For_widget(self):
        if not self._isComfyuiPort:
            print (u">> comfyui Port가 연결되지 않았습니다.")
            return
        
        success , data = requestComfyui.get_samplers()


        if not isinstance(data, list):
            print(u">> 에러 : 예상치 못한 응답 형식: {}".format(data))
            return
        if success:
            data.sort()
            pysideHelper.setDefault_QcomboBox(self.ui.selectSampler,"---select sampler--- ")
            self.ui.selectSampler_Cbb.addItems(data)
            print (u">> sampler 정보 : {} 개". format(len(data)))

    #---------------------------------------------------------------------------send To Maya

    def _get_mayaCameras(self):
        if not self._isMayaPort:
            print (u">> mayaPort가 연결되지 않았습니다.")
            return
        
        #tempfile.gettempdir() 는 임시 temp경로
        tempPath = os.path.join(tempfile.gettempdir(), "mayafyui_cameras.json").replace("\\", "/")
        code = """import maya.cmds as cmds
import json
cam_shapes = cmds.ls(type='camera')
user_shapes = [s for s in cam_shapes if not cmds.camera(s, query=True, startupCamera=True)]
with open("{p}"  , "w" ) as f:
    json.dump(user_shapes , f)
""".format(p = tempPath )
        success , data = connectMayaSocket.send_to_maya_for_jsonFile(code, tempPath, self.ui.setHost_Le.text() , self.ui.setMayaPort_Sb.value())

        if not success:
            print(u">> 에러 : 카메라 목록 가져오기 실패: {}".format(data))
            return
        if not isinstance(data, list):
            print(u">> 에러 : 예상치 못한 응답 형식: {}".format(data))
            return


        try:
            
            data.sort()
            pysideHelper.setDefault_QcomboBox(self.ui.selectMayaCamera_Cbb , "--select camara--")
            #self.ui.selectMayaCamera_Cbb.clear()
            self.ui.selectMayaCamera_Cbb.addItems(data)
            print (u">> 마야 카메라 정보 : {}". format(data))
        except Exception as e:
            print(u">> 에러 : {}".format(e))




    def _make_Connect_mayaScript(self,openFolder = False):

        fileName = "dragMayaViewPort.py"
        filePath = os.path.join(currentPath , fileName)

        currentPort = int(self.ui.setMayaPort_Sb.value())

        code  = r'''
import sys, os, json
import maya.cmds as cmds
import maya.mel as mel

def onMayaDroppedPythonFile(*args):
    PORT = {default_port}
    
    curentPath = os.path.dirname(os.path.abspath(__file__))
    jsonPath = os.path.join(curentPath, "_prev.json")
    if os.path.exists(jsonPath):
        try:
            with open(jsonPath, "r") as f:
                jsonData = json.load(f)
            PORT = int(jsonData.get("mayaPort", PORT))
        except Exception as e:
            print(">> json 읽기 실패:", e)
    
    port_addr = "localhost:{{}}".format(PORT)
    
    command_template = u"""
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import maya.cmds as cmds

port_addr = "{{port}}"

if cmds.commandPort(port_addr, q=True):
    cmds.commandPort(name=port_addr, cl=True)
    print(u">> [mayafyui] 포트 닫힘: {{port}}")
else:
    cmds.commandPort(name=port_addr, stp="python", sourceType="python")
    print(u">> [mayafyui] 포트 열림: {{port}}")
"""
    
    final_command = command_template.format(port=port_addr)
    gShelfTopLevel = mel.eval('$tmpVar=$gShelfTopLevel')
    current_shelf = cmds.tabLayout(gShelfTopLevel, query=True, selectTab=True)

    cmds.shelfButton(
        parent=current_shelf,
        annotation="mayafyui : 외부 포트 열기 ({{}})".format(PORT),
        label="mayafyui",
        image="pythonFamily.png",
        command=final_command,
        sourceType="python",
        imageOverlayLabel="comfy", 
        overlayLabelColor=(1, .25, .25)
    )

    print(u">> [mayafyui] 선반 버튼 생성 완료")
'''.format(default_port=currentPort)
    
        makeCode.makeCodeFile(filePath ,code )
        if openFolder:
            os.startfile(currentPath)
    
    
    def take_mayaSnapShot(self):
        if not self._isMayaPort:
            print(u">> 에러 : maya port가 연결되지 않았습니다.")
            return
        cam = self.ui.selectMayaCamera_Cbb.currentText()
        if not cam:
            print (u">> 에러 : 마야 카메라가 정의되지 않았습니다.")
            return

        path = setPath.get_nextSnapShot(self._workFlowPath)
        pathFolder ,fileName = os.path.split(path ) 
        width = self.ui.setSnapWidth_Sb.value()
        height = self.ui.setSnapHeight_Sb.value()
        scale = float(self.ui.setSnapScale_Dsb.value() *100.0)
        show_grid = bool(self.ui.checkShowGrid_Cb.isChecked())

        viewAttr = {
            "wireframeOnShaded" : bool(self.ui.checkShowWire_Cb.isChecked()),
            "nurbsCurves" : bool(self.ui.checkShowCurve_Cb.isChecked()),
            "jointXray" : bool(self.ui.checkShowJoint_Cb.isChecked())
        }
        show_HQ = bool(self.ui.checkShowHQ_Cb.isChecked())

        code_viewPortOption = controlMayaCode.set_viewPortOption(viewAttr ,show_HQ  )
        code_lookThru = controlMayaCode.take_lookThru(cam)
        code_snapShot = controlMayaCode.take_mayaSnapShot(path , width , height , scale ,  "jpg" ,  show_grid )

        finalCode = code_viewPortOption +  "\n" +  code_lookThru + "\n" +  code_snapShot
        
        success , response = connectMayaSocket.send_to_maya(finalCode , self.ui.setHost_Le.text() , self.ui.setMayaPort_Sb.value())
        if   success:
            self._previewSnapShotPath = pathFolder
            self.load_snapShotFolders()
            pysideHelper.add_imagesToPreviewList(self._previewSnapShotPath  ,self.ui.previewImage_Lw )
            cbb_list = self.ui.previweFolder_Cbb.count()
            list_count = self.ui.previewImage_Lw.count()
            if cbb_list > 0:
                cbb_index = cbb_list  - 1
                self.load_snapShotFolders()
                self.ui.previweFolder_Cbb.setCurrentIndex(cbb_index)
            if list_count > 0:
                last_index = list_count - 1
                self.ui.previewImage_Lw.setCurrentRow(last_index)
                last_item = self.ui.previewImage_Lw.item(last_index)
                self.load_Preview(last_item ,self.ui.previewSnapShotNames_Lb , self.ui.previewSnapShotResolution_Lb , self.ui.previewSnapShot_Lb )

            print (u">> snapShot 성공 ,경로 위치 : {}" .format(path))
        else:
            print(u">> 에러 : snapShot 실패: {}".format(response))

    





    #---------------------------------------------------------------------------control snapShot Function
            

    def set_snapShotImageDirectory(self):
        self._previewSnapShotPath = pysideHelper.set_existingDirectoryPath(self , self._workFlowPath )
        
        self.load_snapShotFolders()
        if self._previewSnapShotPath:
            pysideHelper.add_imagesToPreviewList(self._previewSnapShotPath ,self.ui.previewImage_Lw  )
        print (u">> snapShot 디텍토리 :: {}" .format(self._previewSnapShotPath))


    def load_snapShotFolders(self):
        setPath.get_todayFolder(self._workFlowPath)
        folders = [x for x in os.listdir(self._workFlowPath) if os.path.isdir(os.path.join(self._workFlowPath, x))]
        if folders:
            folders.sort()
            self.ui.previweFolder_Cbb.clear()
            self.ui.previweFolder_Cbb.addItems(folders)
        

    def load_select_SnapShotFolderData(self):
        path =os.path.join(self._workFlowPath  , self.ui.previweFolder_Cbb.currentText())
        pysideHelper.add_imagesToPreviewList(path ,self.ui.previewImage_Lw )


    def load_Preview(self , item  ,namesWidget , sizeWidget , labelWidget ):
        imagePath = item.data(QtCore.Qt.UserRole)

        fileName = item.data(QtCore.Qt.UserRole + 1)
        size_data = item.data(QtCore.Qt.UserRole + 2)
        width, height = size_data[0], size_data[1]
        

        pysideHelper.change_Label(str(fileName) ,namesWidget )
        pysideHelper.change_Label("Resolution ( {}x{} )".format(width , height) ,sizeWidget)
        pysideHelper.set_imageToLabel(imagePath , labelWidget)

    

    #---------------------------------------------------------------------------------------------------------------------------------------------ui helper
    def show_contextMenu(self ,pos , Qwidget ):
        selectItem = Qwidget.itemAt(pos)

        menu = QtWidgets.QMenu(self)
        if selectItem is None:
            return

        try:
            
            exec_file = QtGui.QAction("open", self)
            open_folder = QtGui.QAction("open folder", self)
            delete_act = QtGui.QAction("delete", self)
        except:
            
            exec_file = QtGui.QAction("open", self)
            open_folder = QtGui.QAction("open folder", self)
            delete_act = QtWidgets.QAction("delete", self)


        
        
        imagePath = selectItem.data(QtCore.Qt.UserRole)
        imageFolderPath , _ = os.path.split(imagePath) 

        delete_act.triggered.connect(lambda : pysideHelper.delete_QwidgetItems(Qwidget))
        exec_file.triggered.connect(lambda : os.startfile(imagePath))
        open_folder.triggered.connect(lambda : os.startfile(imageFolderPath ))
        menu.addAction(delete_act)
        menu.addAction(exec_file)
        menu.addAction(open_folder)

        globalPos = Qwidget.mapToGlobal(pos)
        try:
            getattr(menu, "exec")(globalPos)
        except:
            menu.exec_(globalPos)



    
    #----------------------------------------------------------------------------------------------------------------------------------------_prevData
    def _loadPrev(self):
        self._isPrev = os.path.exists(jsonPath)
    
        data = None
        if self._isPrev:
            try:
                with io.open(jsonPath, "r", encoding="utf-8") as f:
                    data = json.load(f)
            except Exception:
                print(u">> 에러 : _prev.json 데이터 읽기 실패")
        
        if data:
            self._prevData.update(data)
        
        # 위젯에 값 세팅
        # (key,      widget_name,    getter,    setter,     default)
        # ("host",   "setHost_Le",   "text",   "setText",  "127.0.0.1")
        for key,     widget_name,      _,      setter,    default in self._prevMap:
            widget = getattr(self.ui, widget_name)
            getattr(widget, setter)(self._prevData.get(key, default))

    def _savePrev(self):
        print(u">> 저장 경로: " + jsonPath)
        ## state
        # ( key,      widget_name,    getter,   setter,     default)
        # ("host",   "setHost_Le",   "text",   "setText",  "127.0.0.1")
        for key ,     widget_name ,   getter ,     _ ,         _ in self._prevMap:
            widget = getattr(self.ui ,widget_name )
            self._prevData[key] = getattr(widget ,  getter)()


        #-----------------------------------------upData
        upData = {}
        if os.path.exists(jsonPath):
            try:
                with io.open(jsonPath , "r" , encoding= "utf-8") as f:
                    upData = json.load(f)
            except Exception as e:
                print (u">> 에러 : _prev.json 데이터 읽기 실패\n>> 초기화 후 덮어쓰기 실행 ")
        upData.update(self._prevData)

        #-----------------------------------------write
        try:
            with io.open(jsonPath , "w" , encoding= "utf-8") as f:
                if sys.version_info[0] < 3:
                    json_str = json.dumps(upData, ensure_ascii=False, indent=4)
                    if isinstance(json_str, str):
                        json_str = json_str.decode('utf-8')
                    f.write(json_str)
                else:
                    json.dump(upData, f, ensure_ascii=False, indent=4)
            print (u">> _prev.json 가 저장되었습니다.")
        except Exception as e:
            print(u">> 에러 : _prev.json 저장 중 오류 발생: {}".format(e))


    def _setup_icons(self):
        
        #내장 코드 변수로 가져오기
        style = QApplication.style() 

        #아이콘 설정
        refresh_icon = style.standardIcon(QtWidgets.QStyle.SP_BrowserReload)
        openFolder_icon = style.standardIcon(QtWidgets.QStyle.SP_DirOpenIcon)
        find_icon = style.standardIcon(QtWidgets.QStyle.SP_FileDialogContentsView)
        connect_icon = style.standardIcon(QtWidgets.QStyle.SP_DriveNetIcon)
        print_icon = style.standardIcon(QtWidgets.QStyle.SP_MediaPlay)
        help_icon = style.standardIcon(QtWidgets.QStyle.SP_MessageBoxQuestion)

        iconMap = [
            ("reloadMayaCamera_Btn" , refresh_icon ),
            ("reloadPreviewImage_Btn" , refresh_icon ),
            ("reloadComfyui_Btn" , refresh_icon ),
            ("reloadCreateImage_Btn" , refresh_icon ),

            ("connectPort_Btn" , connect_icon ),

            ("createImage_Btn" , print_icon ),
            ("snapShot_Btn" , print_icon ),

            ("manual_Btn" , help_icon),

            ("openPreviewImage_Btn" , find_icon ),
            ("openCreateImage_Btn" , find_icon ),
            ("setComfyuiPath_Btn" , find_icon ),

            ("openCreateImageFolder_Btn" ,openFolder_icon ),
            ("openPreviewImageFolder_Btn" , openFolder_icon )
        ]


        for widget_name , icon in iconMap:
            widget = getattr(self.ui , widget_name )
            getattr(widget , "setIcon")(icon)

   
if __name__ == "__main__":
    print ("sys.argv",sys.argv ) #현재파일추척

    
    app = QApplication(sys.argv)
    app.setStyle("Fusion")

    mayaComfyui = DesignerUI()
    mayaComfyui.init_ui(uiPath)
    mayaComfyui.show_ui()
    sys.exit(app.exec())