# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import sys , os  ,json ,io  , tempfile ,pprint , subprocess , random ,time

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

def resource_path(relative_path):
    """리소스 파일의 절대 경로 반환 (.py 실행 / .exe 실행 둘 다 지원)"""
    if hasattr(sys, '_MEIPASS'):
        # PyInstaller로 빌드된 exe 실행 중
        base_path = sys._MEIPASS
    else:
        # 일반 Python 스크립트로 실행 중
        base_path = os.path.dirname(os.path.abspath(__file__))
    return os.path.join(base_path, relative_path)

def writable_path(relative_path):
    """쓰기 가능 경로 (.py: 프로젝트 폴더, .exe: exe가 있는 폴더)"""
    if hasattr(sys, '_MEIPASS'):
        base_path = os.path.dirname(sys.executable)  # exe가 있는 폴더
    else:
        base_path = os.path.dirname(os.path.abspath(__file__))
    return os.path.join(base_path, relative_path)

#-------------------------------------------------------------preSetting

currentPath = os.path.dirname(os.path.abspath(__file__))
jsonPath = writable_path( "_prev.json")
uiPath =resource_path( "mayafyui.ui")
pathAppend()

#import module
from core import makeCode ,connectMayaSocket ,setPath , controlMayaCode , pysideHelper , stream , requestComfyui , ollamaHelper


#------------------------------------------------------------ui
class DesignerUI(QtWidgets.QWidget):
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
        
        self._workFlowPath = writable_path( "works")
        self._comfyuiTempletePath = resource_path("_comfyuiTemplete.json") 
        self._comfyuiRequestData = None

        self._positive_prompt = ""
        self._negative_prompt = ""

        self._uploadImagePath = None
        self._uploadImageName = None


        self._isMayaPort = False
        self._isComfyuiPort = False

        self._mayaPort = None
        self._comfyuiPort = None
        self._host = None


        self._isPrev = None
        self._prevData = {}
        self._pendingComboValues = {}
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
            ("comfyuiStep",       "setStep_Sb" ,        "value",        "setValue", 20),

            ("comfyuiCheckPoint", "selectCheckPoint_Cbb","currentText" , "setCurrentText" , ""),
            ("comfyuiSampler",    "selectSampler_Cbb",   "currentText" , "setCurrentText" , ""),

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
        
        self.ui.progress_Pb.setVisible(False)

        self._check_mayaSocket()
        self._check_comfyuiPath()
        self._check_compyfiPort()

        pysideHelper.setDefault_QcomboBox(self.ui.selectMayaCamera_Cbb , "--select camara--")
        pysideHelper.setDefault_QcomboBox(self.ui.selectCheckPoint_Cbb , "--select checkPoint--")
        pysideHelper.setDefault_QcomboBox(self.ui.selectSampler_Cbb , "--select sampler--")

        self._get_mayaCameras()
        self._get_checkPoints_For_widget()
        self._get_samplers_For_widget()

        self.load_snapShotFolders()
        self.load_select_comfyuiImageFolderData()
        

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
        #if self._comfyuiBatPath:
        #    self.ui.connectPort_Btn.clicked.connect(self.exec_comfyui)

        self.ui.execComfyui_Btn.clicked.connect(self.exec_comfyui)
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

        self.ui.openCreateImage_Btn.clicked.connect(self.set_comfyuiImageDirectory)
        self.ui.openCreateImageFolder_Btn.clicked.connect(lambda : pysideHelper.open_directory(self._comfyuiOutputPath))
        #self.ui.reloadCreateImage_Btn.clicked.connect(self.load_select_comfyuiImageFolderData)


        


        ## select Cbb Directory
        self.ui.previweFolder_Cbb.currentTextChanged.connect(self.load_select_SnapShotFolderData)

        ## select IconsImage snapShot
        self.ui.previewImage_Lw.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        self.ui.previewImage_Lw.itemClicked.connect(lambda : self.load_Preview(self.ui.previewImage_Lw.currentItem(),self.ui.previewSnapShotNames_Lb , self.ui.previewSnapShotResolution_Lb , self.ui.previewSnapShot_Lb ))
        self.ui.previewImage_Lw.customContextMenuRequested.connect( lambda pos: self.show_contextMenu(pos , self.ui.previewImage_Lw))

        ## select Icons comfyui Image
        self.ui.createImage_Lw.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)
        self.ui.createImage_Lw.itemClicked.connect(lambda : self.load_Preview(self.ui.createImage_Lw.currentItem(),self.ui.createdImageNames_Lb , self.ui.createdImageResolution_Lb ,self.ui.createdImage_Lb  ))
        self.ui.createImage_Lw.customContextMenuRequested.connect( lambda pos: self.show_contextMenu(pos , self.ui.createImage_Lw))



        ## comfyui
        self.ui.reloadComfyui_Btn.clicked.connect(self._get_checkPoints_For_widget)
        self.ui.reloadComfyui_Btn.clicked.connect(self._get_samplers_For_widget)


        ## prompt 
        self.ui.convertPrompt_Btn.clicked.connect(self.convert_prompt)

        ##create
        self.ui.createImage_Btn.clicked.connect(self.edit_comfyuiTemplete)
        self.ui.createImage_Btn.clicked.connect(self.create_image)
        self.ui.createImage_Btn.clicked.connect(self.load_select_comfyuiImageFolderData)


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

    def exec_comfyui(self):
        #print (u">> 테스트 : {}".format(self._check_comfyuiPath))
        if not self._comfyuiBatPath:
            print(u">> comfyui 경로가 지정되지않습니다.")
            return
        
        if not os.path.exists(self._comfyuiBatPath):
            print(u">> comfyui batch 경로가 존재하지않습니다.")
            return
        
        bat_dir = os.path.dirname(self._comfyuiBatPath)
        try:
            subprocess.Popen(
                [self._comfyuiBatPath],
                cwd=bat_dir,                                # ★ 작업 디렉토리 명시
                creationflags=subprocess.CREATE_NEW_CONSOLE # ★ 새 cmd 창에서 실행
            )
            print(u">> ComfyUI 실행 시작: {}".format(self._comfyuiBatPath))
        except Exception as e:
            print(u">> 실행 실패: {}".format(e))

    def convert_prompt(self):
        positivePrompt = self.ui.positivePrompt_Pte.toPlainText()
        negativePrompt = self.ui.negativePrompt_Pte.toPlainText()
        positive_tags = ""
        negative_tags = ""
        positiveSystem = '''You are a Stable Diffusion prompt translator. Convert the user's description (any language, especially Korean) into comma-separated English keywords for Stable Diffusion.

**Core principle: TRANSLATE, do NOT EMBELLISH.**
- Convert ONLY what the user explicitly said. Do not invent details.
- If the user did not mention hair, do not add hair keywords.
- If the user did not mention weather, do not add weather keywords.
- If the user did not mention clothing, do not add clothing keywords.
- Keep it minimal. 8-15 keywords is normal. 20+ is suspicious.

**Format rules:**
- Output ONLY keywords, no explanation, no preamble, no quotes, no newlines.
- Use Danbooru-style tags when applicable: 1girl, 1boy, solo, anime style.
- If a person is mentioned, start with 1girl or 1boy.
- Order: subject -> style -> appearance(only if specified) -> pose(only if specified) -> background(only if specified).
- Append at the very end: masterpiece, best quality, highly detailed

**Examples:**

Input: 파란 머리 여학생, 학교 옥상
Output: 1girl, solo, blue hair, school uniform, rooftop, anime style, masterpiece, best quality, highly detailed

Input: 포스트 아포칼립스 도시, 폐허 건물들, 어두운 하늘
Output: post-apocalyptic city, ruined buildings, dark sky, anime style, masterpiece, best quality, highly detailed

Input: 검을 든 기사
Output: 1boy, solo, knight, holding sword, anime style, masterpiece, best quality, highly detailed
'''
        negativeSystem = '''You are a Stable Diffusion NEGATIVE prompt translator.
The user describes what they do NOT want in the image. Convert to English negative keywords.

**Core principle: TRANSLATE only what the user said.** Do not invent.

**Format rules:**
- Output ONLY keywords, comma-separated.
- No explanations, no full sentences.
- Convert specific concepts to standard SD tags:
  - "이상한 손" / "손 이상함" -> bad hands, missing fingers, extra fingers
  - "흐릿함" / "blurry" -> blurry
  - "이상한 얼굴" -> deformed face, bad anatomy
- Always append at the end: worst quality, low quality, normal quality, lowres, watermark, signature

Example input: 이상한 손, 흐릿함
Output: bad hands, missing fingers, extra fingers, blurry, worst quality, low quality, normal quality, lowres, watermark, signature

Example input: (빈 입력)
Output: worst quality, low quality, normal quality, lowres, watermark, signature, bad anatomy, bad hands, blurry
'''

        if not positivePrompt and not negativePrompt:
            print(u">> 변환할 프롬프트가 없습니다.")
            return
        
        self.ui.progress_Pb.setValue(0)
        self.ui.progress_Pb.setVisible(True)
        self.ui.convertPrompt_Btn.setEnabled(False)
        print(u">> 프롬프트 변환 시작...")

        


        self._convertThread = stream.thread(ollamaHelper.request_promptBoth , positivePrompt, positiveSystem,
        negativePrompt, negativeSystem)


        self._convertThread.progress_signal.connect(self.on_convert_progress)
        self._convertThread.finished_signal.connect(self.on_convert_finished)
        self._convertThread.error_signal.connect(self.on_convert_error)

        self._convertThread.start()

        



    def edit_comfyuiTemplete(self):
        isJson = os.path.exists(self._comfyuiTempletePath)
        selectedItem = self.ui.previewImage_Lw.currentItem()

        if not isJson:
            print(u">> 에러 : 워크플로우 파일 경로를 찾을 수 없습니다.")
            return
        templeteData = None
        try:
            with io.open(self._comfyuiTempletePath , "r" ,encoding="utf-8" ) as f:
                templeteData = json.load(f)
        except Exception as e:
            print(u">> 에러 : 워크플로우 JSON 로드 실패: {}".format(e))
            return False
        
        if not templeteData:
            print(u">> 에러 : 워크플로우 파일이 비어있거나 훼손되었습니다.")
            return False
        
        if not selectedItem:
            print(u">> 에러 : 입력 이미지(스냅샷)가 선택되지 않았습니다.")
            return False
        
        self._uploadImagePath = selectedItem.data(QtCore.Qt.UserRole)
        self._uploadImageName = selectedItem.data(QtCore.Qt.UserRole + 1)

        if not self._uploadImagePath or not os.path.exists(self._uploadImagePath):
            print(u">> 에러 : 선택된 이미지 경로가 유효하지 않습니다.")
            return False

        try:
            ## 체크포인트
            # 3. 체크포인트 / 샘플러
            ckpt = self.ui.selectCheckPoint_Cbb.currentText()
            sampler = self.ui.selectSampler_Cbb.currentText()

            if "select" not in ckpt.lower():
                templeteData["1"]["inputs"]["ckpt_name"] = ckpt
            if "select" not in sampler.lower():
                templeteData["2"]["inputs"]["sampler_name"] = sampler
                templeteData["17"]["inputs"]["sampler_name"] = sampler  # ★ 2차도 동일 샘플러

            # 4. KSampler 옵션 (1차)
            ui_seed = int(self.ui.setSeed_Sb.value())
            if ui_seed == -1:
                final_seed = random.randint(1, 1125899906842624)
            else:
                final_seed = ui_seed
            
            templeteData["2"]["inputs"]["seed"] = final_seed
            templeteData["2"]["inputs"]["steps"] = int(self.ui.setStep_Sb.value())
            templeteData["2"]["inputs"]["cfg"] = float(self.ui.setCFG_Dsb.value())
            templeteData["2"]["inputs"]["denoise"] = float(self.ui.setDenoise_Dsb.value())

            # ★ KSampler (2차, Hires Fix) 동기화
            templeteData["17"]["inputs"]["seed"] = final_seed  # 같은 시드 → 일관성 유지
            templeteData["17"]["inputs"]["cfg"] = float(self.ui.setCFG_Dsb.value())
            # steps와 denoise는 2차용 고정 (15 steps, 0.4 denoise)
            # 이건 워크플로우 JSON 기본값 그대로 사용

            # 5. 프롬프트
            positive_text = self._positive_prompt or self.ui.positivePrompt_Pte.toPlainText()
            negative_text = self._negative_prompt or self.ui.negativePrompt_Pte.toPlainText()
            templeteData["3"]["inputs"]["text"] = positive_text
            templeteData["4"]["inputs"]["text"] = negative_text

            # 6. 입력 이미지 (LoadImage 노드 9)
            templeteData["9"]["inputs"]["image"] = self._uploadImageName

            # 7. ★ 입력 리사이즈 (ImageScale 노드 15) - UI의 width/height 적용
            templeteData["15"]["inputs"]["width"] = int(self.ui.setWidth_Sb.value())
            templeteData["15"]["inputs"]["height"] = int(self.ui.setHeight_Sb.value())
            # ※ 출력 해상도는 자동으로 1.5배가 됩니다 (LatentUpscaleBy 노드 16)
            pprint.pprint(self._comfyuiRequestData)


        except KeyError as e:
            print(u">> 에러 : JSON 노드 구조나 키가 매핑 파일과 다릅니다 : {}".format(e))
            return False
        
        self._comfyuiRequestData = templeteData
        return True

    def request_comfyui(self , host , port , progress_callback=None, is_running_check=None):

        if not self._comfyuiRequestData:
            print(u">> 에러 : 워크플로우 데이터가 없습니다.")
            return ""
        if not self._uploadImagePath:
            print(u">> 에러 : 업로드할 이미지가 없습니다.")
            return ""
        
        if progress_callback:
            progress_callback(5)

        #-----------------------------------------------------------------------------------------# 
        #이때 경로self._uploadImageName 경로 올림
        print(u">> 입력 이미지 업로드 중: {}".format(self._uploadImageName))
        success, response = requestComfyui.upload_image(self._uploadImagePath, host, port)
        if not success:
            print(u">> 에러 : 이미지 업로드 실패: {}".format(response))
            return ""
        
        if progress_callback:
            progress_callback(15)
        if is_running_check and not is_running_check():
            return ""
        #-----------------------------------------------------------------------------------------작업 현황 
        print(u">> 워크플로우 큐(queue) 등록 중...")
        success, response = requestComfyui.queue_prompt(self._comfyuiRequestData, host, port)
        if not success:
            print(u">> 에러 : 큐 등록 실패: {}".format(response))
            return ""
        #-----------------------------------------------------------------------------------------prompt_id 가져오기
        prompt_id = response.get("prompt_id")
        if not prompt_id:
            print(u">> 에러 : prompt_id를 받지 못함: {}".format(response))
            return ""
        print(u">> 큐 등록 완료, prompt_id: {}".format(prompt_id))

        if progress_callback:
            progress_callback(25)

        max_wait = 600  # 초
        poll_interval = 1.0
        elapsed = 0
        fake_percent = 25.0

        total_fake_range = 90 - 25  # 25 → 90
        fake_increment = total_fake_range / float(max_wait) 

        while elapsed < max_wait:
            if is_running_check and not is_running_check():
                print(u">> 작업 취소됨")
                return ""
            time.sleep(poll_interval)
            elapsed += poll_interval

            if fake_percent < 90:
                fake_percent += fake_increment
                if progress_callback:
                    progress_callback(int(fake_percent))

            success, data = requestComfyui.get_history(prompt_id, host, port)
            if not success:
                continue  # 잠시 후 재시도

            if prompt_id in data:
                entry = data[prompt_id]
                outputs = entry.get("outputs", {})
                
                # SaveImage 노드 (ID "7") 의 출력에서 파일명 추출
                saveNode = outputs.get("7", {})
                images = saveNode.get("images", [])
                if not images:
                    print(u">> 에러 : 결과 이미지 없음")
                    return ""
                
                firstImage = images[0]
                filename = firstImage.get("filename", "")
                subfolder = firstImage.get("subfolder", "")
                
                if progress_callback:
                    progress_callback(100)
                
                print(u">> 생성 완료: {}".format(filename))
                # subfolder가 있을 수도 있으니 같이 리턴
                return os.path.join(subfolder, filename) if subfolder else filename
            

    def create_image(self):
        if not self._isComfyuiPort:
            print(u">> 에러 : ComfyUI Port가 연결되지 않았습니다.")
            return
        
        CheckTemplete = self.edit_comfyuiTemplete()
        if not CheckTemplete:
            return
        
        #프로세스 바 활성 & 버튼 잠그기
        self.ui.progress_Pb.setValue(0)
        self.ui.progress_Pb.setVisible(True)
        self.ui.createImage_Btn.setEnabled(False)
        self.ui.convertPrompt_Btn.setEnabled(False)

        # 쓰레딩
        host = self.ui.setHost_Le.text()
        port = self.ui.setComfyuiPort_Sb.value()

        print(u">> ComfyUI 이미지 생성 시작...")
        self._createThread = stream.thread(
            self.request_comfyui,
            host, port
        )
        self._createThread.progress_signal.connect(self.on_create_progress)
        self._createThread.finished_signal.connect(self.on_create_finished)
        self._createThread.error_signal.connect(self.on_create_error)
        self._createThread.start()




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

            saved = self._pendingComboValues.pop("selectCheckPoint_Cbb", None)
            #get 으로 하면 → 한 번 복원 후에도 dict에 값이 남아있음 → reload 누를 때마다 또 복원하려 함
            #pop 으로 하면 → 꺼내면서 제거 → 딱 한 번만 복원

            if saved:
                idx = self.ui.selectCheckPoint_Cbb.findText(saved)
                if idx >= 0:
                    self.ui.selectCheckPoint_Cbb.setCurrentIndex(idx)


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
            pysideHelper.setDefault_QcomboBox(self.ui.selectSampler_Cbb,"---select sampler--- ")
            self.ui.selectSampler_Cbb.addItems(data)
            print (u">> sampler 정보 : {} 개". format(len(data)))
            saved = self._pendingComboValues.pop("selectSampler_Cbb", None)
            #get 으로 하면 → 한 번 복원 후에도 dict에 값이 남아있음 → reload 누를 때마다 또 복원하려 함
            #pop 으로 하면 → 꺼내면서 제거 → 딱 한 번만 복원

            if saved:
                idx = self.ui.selectSampler_Cbb.findText(saved)
                if idx >= 0:
                    self.ui.selectSampler_Cbb.setCurrentIndex(idx)

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

        code  = r'''# -*- coding: utf-8 -*-
from __future__ import unicode_literals
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

    #---------------------------------------------------------------------------control snapShot UI
            
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



    def set_comfyuiImageDirectory(self):
        self._comfyuiOutputPath = pysideHelper.set_existingDirectoryPath(self , self.ui.setComfyuiPath_Le.text() or "" )
        self.load_select_comfyuiImageFolderData

        print (u">> snapShot 디텍토리 :: {}" .format(self._comfyuiOutputPath))

    def load_select_comfyuiImageFolderData(self):
        if self._comfyuiOutputPath:
            pysideHelper.add_imagesToPreviewList(self._comfyuiOutputPath , self.ui.createImage_Lw , "ComfyUI_" , "_.png")



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
        for key, widget_name, _, setter, default in self._prevMap:
            widget = getattr(self.ui, widget_name)
            value = self._prevData.get(key, default)

            if "_Cbb" in widget_name:
                self._pendingComboValues[widget_name] = value
            else:
                getattr(widget, setter)(value)




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


    #---------------------------------------------------------------------thread def
    
    def on_convert_progress(self, value):
        self.ui.progress_Pb.setValue(value)

    def on_convert_finished(self, result):
        parts = result.split("|||")
        self._positive_prompt = parts[0] if len(parts) > 0 else ""
        self._negative_prompt = parts[1] if len(parts) > 1 else ""

        print(u">> 변환 완료")
        print(u">> Positive: {}".format(self._positive_prompt))
        print(u">> Negative: {}".format(self._negative_prompt))
        self.ui.positivePrompt_Pte.setPlainText(self._positive_prompt)
        self.ui.negativePrompt_Pte.setPlainText(self._negative_prompt)

        self.ui.progress_Pb.setValue(100)
        self.ui.convertPrompt_Btn.setEnabled(True)

        QtCore.QTimer.singleShot(1000, self.reset_progress)

    def on_convert_error(self, err_msg):
        print(u">> 변환 에러: {}".format(err_msg))
        self.ui.progress_Pb.setValue(0)
        self.ui.convertPrompt_Btn.setEnabled(True)


    def reset_progress(self):
        """진행 끝나고 살짝 뒤에 호출 — 100% 보여준 후 깔끔하게 0으로"""
        self.ui.progress_Pb.setValue(0)

    def on_create_progress(self, value):
        self.ui.progress_Pb.setValue(value)

    def on_create_finished(self, resultFilename):
        self.ui.createImage_Btn.setEnabled(True)
        self.ui.convertPrompt_Btn.setEnabled(True)
        if not resultFilename:
            print(u">> 이미지 생성 실패 (빈 결과)")
            self.ui.progress_Pb.setValue(0)
            QtCore.QTimer.singleShot(1000, self.reset_progress)
            return
        
        self.ui.progress_Pb.setValue(100)
        
        if self._comfyuiOutputPath:
            resultPath = os.path.join(self._comfyuiOutputPath, resultFilename)
            print(u">> 결과 이미지: {}".format(resultPath))
            # 결과 갤러리 갱신은 다음 단계
        
        QtCore.QTimer.singleShot(1000, self.reset_progress)
        self.load_select_comfyuiImageFolderData()
        list_count = self.ui.createImage_Lw.count()
        if list_count > 0:
            last_index = list_count - 1
            self.ui.createImage_Lw.setCurrentRow(last_index)
            last_item= self.ui.createImage_Lw.item(last_index)
            self.load_Preview(self.ui.createImage_Lw.currentItem(),self.ui.createdImageNames_Lb , self.ui.createdImageResolution_Lb ,self.ui.createdImage_Lb  )
        
        


    def on_create_error(self, err_msg):
        print(u">> 생성 에러: {}".format(err_msg))
        self.ui.progress_Pb.setValue(0)
        self.ui.createImage_Btn.setEnabled(True)
        self.ui.convertPrompt_Btn.setEnabled(True)

if __name__ == "__main__":
    print ("sys.argv",sys.argv ) #현재파일추척

    
    app = QApplication(sys.argv)
    app.setStyle("Fusion")

    mayaComfyui = DesignerUI()
    mayaComfyui.init_ui(uiPath)
    mayaComfyui.show_ui()
    sys.exit(app.exec())