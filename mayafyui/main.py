# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import sys , os ,re ,json ,io  , tempfile , datetime

try:
    from PySide6 import QtWidgets, QtCore, QtUiTools , QtGui 
    from PySide6.QtWidgets import QApplication, QFileDialog
    
except:
    from PySide2 import QtWidgets, QtCore, QtUiTools , QtGui 
    from PySide2.QtWidgets import QApplication, QFileDialog

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
if sys.version_info[0] < 3:
    text_type = unicode
else:
    text_type = str

currentPath = os.path.dirname(os.path.abspath(__file__))
jsonPath = os.path.join(currentPath , "_prev.json")
uiPath =os.path.join(currentPath , "mayafyui.ui")


pathAppend()

#import module
from core import makeCode ,connectSocket ,setPath , controlMayaCode


#-------------------------------------------------------------
class EmittingStream(QtCore.QObject):
    textWritten = QtCore.Signal(text_type) 

    def __init__(self):
        super(EmittingStream, self).__init__()
        '''
        self.ignore_keywords = [
            "Arnold",           # 아놀드 렌더러 로그
            "oiio",             # OpenImageIO 로그
            "qt.svg",           # Qt 아이콘 에러
            "loading metadata", # 아놀드 메타데이터 로딩
            "loading plugins",  # 플러그인 로딩 잡다한 소리
            "Global variable",  # 멜 스크립트 전역 변수 경고 (imageFormats.mel 등)
            "NVLink",           # 그래픽카드 관련
            "rlm",              # 라이센스 관련
            "running on",       # 아놀드 실행 정보
        ]
        '''

        self._writing = False 

    def write(self, text):
        # EmittingStream 사용중인지 확인
        if self._writing:
            return
        
        #if text.strip(): 
        #    for keyword in self.ignore_keywords:
        #        if keyword in text:
        #            return # 그냥 무시하고 함수 끝냄
        self._writing = True
        try:
            # 내용이 있을 때만 신호 발사
            if text: 
                self.textWritten.emit(text)
            
            # [중요] 원래 콘솔(cmd)에도 찍어줌 (UI가 죽어도 cmd에선 보이게)
            sys.__stdout__.write(text)
            
        except Exception:
            # 혹시 에러나면 원래 콘솔에라도 뱉음
            sys.__stdout__.write(text)
            
        finally:
            # 3. 다 썼으니 깃발 내리기
            self._writing = False

    def flush(self):
        pass


#------------------------------------------------------------ui
class DesignerUI(QtWidgets.QDialog):
    def __init__(self , parent = None):
        super(DesignerUI ,self).__init__(parent) 

        self.ui =None
        self._log_stream = None
        self._previewSnapShotPath = None
        self._workFlowPath = os.path.join(currentPath , "works")
        


        self._isMayaPort = False
        self._isComfyuiPort = False

        self._mayaPort = None
        self._comfyuiPort = None
        self._host = None


        self._isPrev = None
        self._prevData = {
            "mayaPort" : None,
            "comfyuiPort" :None,
            "host" : None,
            "snapShotScale" : None ,
            "snapShotWidth" : None , 
            "snapShotHeight" : None ,
            "snapShotShowGrid" : False 

        }


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
        self._get_mayaCameras()
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
        self.ui.connectPort_Btn.clicked.connect(self._get_mayaCameras)

         # 로그 검사용

        ## load cams
        self.ui.reloadMayaCamera_Btn.clicked.connect(self._get_mayaCameras)
        
        ## snapShot
        self.ui.snapShot_Btn.clicked.connect(self.take_mayaSnapShot)

        ## Directory
        self.ui.openPreviewImage_Btn.clicked.connect(self.set_snapShotImageDirectory)
        self.ui.openPreviewImageFolder_Btn.clicked.connect(lambda : self._open_directory(setPath.get_todayFolder(self._workFlowPath)))
        self.ui.reloadPreviewImage_Btn.clicked.connect(lambda : self._add_imagesToPreviewList(setPath.get_todayFolder(self._workFlowPath) ,self.ui.previewImage_Lw ))

        ## select IconsImage
        self.ui.previewImage_Lw.itemClicked.connect(lambda : self.load_Preview(self.ui.previewImage_Lw.currentItem(),self.ui.previewSnapShotNames_Lb , self.ui.previewSnapShotResolution_Lb , self.ui.previewSnapShot_Lb ))


    def _setup_log(self):
        
        self._log_stream = EmittingStream() #스트림 지정 변수
        # print ("sss")든 앞으로 나오는 메세지는 _textlog함수에 할당한다 라는 의미(text에 넣어라)
        self._log_stream.textWritten.connect(self._textlog) 

        # "앞으로 stdout으로 갈 거 다 self._log_stream으로 보내고, stderr도 마찬가지로."
        sys.stdout = self._log_stream #메세지를 가져온다.
        sys.stderr = self._log_stream #에러도 가져온다


        if self._log_stream:
            print(u">> log 스트림 설정됨") 
        

    def _textlog(self , text):
        #시그널 발사시 호춯
        self.ui.log_Te.moveCursor(QtGui.QTextCursor.End) # 커서가 그 위치에서 끝 메모장 글쓸때 깜빡깜빡 할대 그위치
        self.ui.log_Te.insertPlainText(text)

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
    def _setup_icons(self):
        
        #내장 코드 변수로 가져오기
        style = QApplication.style() 

        #아이콘 설정
        refresh_icon = style.standardIcon(QtWidgets.QStyle.SP_BrowserReload)
        open_icon = style.standardIcon(QtWidgets.QStyle.SP_DirOpenIcon)
        find_icon = style.standardIcon(QtWidgets.QStyle.SP_FileDialogContentsView)
        connect_icon = style.standardIcon(QtWidgets.QStyle.SP_DriveNetIcon)
        print_icon = style.standardIcon(QtWidgets.QStyle.SP_MediaPlay)
        help_icon = style.standardIcon(QtWidgets.QStyle.SP_MessageBoxQuestion)

        #refresh
        self.ui.reloadMayaCamera_Btn.setIcon(refresh_icon)
        self.ui.reloadPreviewImage_Btn.setIcon(refresh_icon)
        self.ui.reloadComfyui_Btn.setIcon(refresh_icon)
        self.ui.reloadCreateImage_Btn.setIcon(refresh_icon)
        #connect
        self.ui.connectPort_Btn.setIcon(connect_icon)
        #print
        self.ui.createImage_Btn.setIcon(print_icon)
        self.ui.snapShot_Btn.setIcon(print_icon)
        #help
        self.ui.manual_Btn.setIcon(help_icon)
        #find
        self.ui.openPreviewImage_Btn.setIcon(find_icon)
        self.ui.openCreateImage_Btn.setIcon(find_icon)
        #open
        self.ui.openCreateImageFolder_Btn.setIcon(open_icon)
        self.ui.openPreviewImageFolder_Btn.setIcon(open_icon)

    #--------------------------------------------ui function

    def _check_mayaSocket(self ):
        self._isMayaPort , mayaResponse = connectSocket.check_mayaConnection(u"print ('pong')")
        if self._isMayaPort:
            self.ui.setMayaPort_Sb.setStyleSheet("background-color: #5DADE2;") #소프트 스틸 블루
            print (u">> maya port가 연결되었습니다.")
        if self._isMayaPort == False:
            self.ui.setMayaPort_Sb.setStyleSheet("background-color: #CD5C5C;") #인디안 레드
            print (u">> maya port가 연결되지 않았습니다.")

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
        success , data = connectSocket.send_to_maya_for_jsonFile(code, tempPath, self.ui.setHost_Le.text() , self.ui.setMayaPort_Sb.value())

        try:
            print (u">> 마야 카메라 정보 : {}". format(data))
            self.ui.selectMayaCamera_Cbb.clear()
            self.ui.selectMayaCamera_Cbb.addItems(data)
        except Exception as e:
            print(u">> 에러 :: {}".format(e))


    def _loadPrev(self):
        #작업예정
        self._isPrev = os.path.exists(jsonPath)

        data = None
        if self._isPrev:
            try:
                with io.open(jsonPath , "r" , encoding= "utf-8") as f:
                    data = json.load(f)
            except Exception as e:
                print (u">> 에러 :: _prev.json 데이터 읽기 실패")
        if data:
            self._prevData = data
            ## state
            self.ui.setHost_Le.setText(self._prevData.get("host" ,"127.0.0.1" ))
            self.ui.setMayaPort_Sb.setValue(self._prevData.get("mayaPort" ,7771 ))
            self.ui.setComfyuiPort_Sb.setValue(self._prevData.get("comfyuiPort" , 8188))

            ## maya
            self.ui.setSnapScale_Dsb.setValue(self._prevData.get("snapShotScale" , 0.5))
            self.ui.setSnapWidth_Sb.setValue(self._prevData.get("snapShotWidth" , 1920))
            self.ui.setSnapHeight_Sb.setValue(self._prevData.get("snapShotHeight" , 1080))
            self.ui.checkShowGrid_Cb.setChecked(self._prevData.get("snapShotShowGrid",False ))






    def _savePrev(self):
        #self._host = self.ui.setHost_Le.text()
        #self._mayaPort = self.ui.setMayaPort_Le_Le.text()
        #self._comfyuiPort = self.ui.setComfyuiPort_Le.text()
        print(u">> 저장 경로: " + jsonPath)
        ## state
        self._prevData["host"] = self.ui.setHost_Le.text()
        self._prevData["mayaPort"] = int(self.ui.setMayaPort_Sb.value())
        self._prevData["comfyuiPort"] = int(self.ui.setComfyuiPort_Sb.value())

        ## maya
        self._prevData["snapShotScale"] = float(self.ui.setSnapScale_Dsb.value())
        self._prevData["snapShotWidth"] = int(self.ui.setSnapWidth_Sb.value())
        self._prevData["snapShotHeight"] = int(self.ui.setSnapHeight_Sb.value())
        self._prevData["snapShotShowGrid" ] = bool(self.ui.checkShowGrid_Cb.isChecked())

        upData = {}

        if os.path.exists(jsonPath):
            try:
                #print ("ext")
                with io.open(jsonPath , "r" , encoding= "utf-8") as f:
                    upData = json.load(f)
            except Exception as e:
                print (u">> 에러 : _prev.json 데이터 읽기 실패\n>> 초기화 후 덮어쓰기 실행 ")
        upData.update(self._prevData)

        print ("upData" , upData)

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

    def _make_Connect_mayaScript(self,openFolder = False):

        fileName = "dragMayaViewPort.py"
        filePath = os.path.join(currentPath , fileName)

        code =r'''# -*- coding: utf-8 -*-
import sys, os, json
import maya.cmds as cmds
import maya.mel as mel

def onMayaDroppedPythonFile(*args):
    curentPath = os.path.dirname(os.path.abspath(__file__))
    jsonPath = os.path.join(curentPath, "_prev.json")
    PORT = 7771
    jsonData = None
    
    if os.path.exists(jsonPath):
        try:
            with open(jsonPath, "r") as f:
                jsonData = json.load(f)
            
            # get 사용 시 기본값(Fallback) 추가
            PORT = int(jsonData.get("mayaPort", 7771))
        except Exception as e:
            print(">> json 읽기 실패:", e)
    
    port_addr = "localhost:{}".format(PORT)
    
    command_template = u"""
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import maya.cmds as cmds

port_addr = "{port}"

# 토글 동작
if cmds.commandPort(port_addr, q=True):
    cmds.commandPort(name=port_addr, cl=True)
    print(u">> [mayafyui] 포트 닫힘: {port}")
else:
    cmds.commandPort(name=port_addr, stp="python", sourceType="python")
    print(u">> [mayafyui] 포트 열림: {port}")
"""
    
    final_command = command_template.format(port=port_addr)
    gShelfTopLevel = mel.eval('$tmpVar=$gShelfTopLevel')
    current_shelf = cmds.tabLayout(gShelfTopLevel, query=True, selectTab=True)

    cmds.shelfButton(
        parent=current_shelf,
        annotation="mayafyui : 외부 포트 열기 ({})".format(PORT),
        label="mayafyui",
        image="pythonFamily.png",
        command=final_command,
        sourceType="python",
        imageOverlayLabel="comfy", 
        overlayLabelColor=(1, .25, .25)
    )

    print(u">> [mayafyui] 선반 버튼 생성 완료")
'''
        makeCode.makeCodeFile(filePath ,code )
        if openFolder:
            os.startfile(currentPath)
    
    
    def take_mayaSnapShot(self):
        cam = self.ui.selectMayaCamera_Cbb.currentText()
        if cam is None:
            raise (u">> 에러 : 마야 카메라가 정의 되이 않았습니다.")

        path = setPath.get_nextSnapShot(self._workFlowPath)
        pathFolder ,fileName = os.path.split(path ) 
        width = self.ui.setSnapWidth_Sb.value()
        height = self.ui.setSnapHeight_Sb.value()
        scale = float(self.ui.setSnapScale_Dsb.value() *100.0)
        show_grid = self.ui.checkShowGrid_Cb.isChecked()

        code_lookThru = controlMayaCode.take_lookThru(cam)
        code_snapShot = controlMayaCode.take_mayaSnapShot(path , width , height , scale ,  "jpg" ,  show_grid )

        finalCode = code_lookThru + "\n" +  code_snapShot
        
        succcess , response = connectSocket.send_to_maya(finalCode , self.ui.setHost_Le.text() , self.ui.setMayaPort_Sb.value())
        if succcess:
            self._previewSnapShotPath = pathFolder
            self._add_imagesToPreviewList(self._previewSnapShotPath  ,self.ui.previewImage_Lw )
            list_count = self.ui.previewImage_Lw.count()
            if list_count > 0:
                last_index = list_count - 1
                self.ui.previewImage_Lw.setCurrentRow(last_index)
                last_item = self.ui.previewImage_Lw.item(last_index)
                self.load_Preview(last_item ,self.ui.previewSnapShotNames_Lb , self.ui.previewSnapShotResolution_Lb , self.ui.previewSnapShot_Lb )
            
            print (u">> snapShot 성공 ,경로 위치 :: {}" .format(path))
            

    def set_snapShotImageDirectory(self):
        self._previewSnapShotPath = self._set_directoryPath(self._workFlowPath )
        if self._previewSnapShotPath:
            self._add_imagesToPreviewList(self._previewSnapShotPath ,self.ui.previewImage_Lw  )
        print (u">> snapShot 디텍토리 :: {}" .format(self._previewSnapShotPath))





    def load_Preview(self , item  ,namesWidget , sizeWidget , labelWidget ):
        imagePath = item.data(QtCore.Qt.UserRole)

        fileName = item.data(QtCore.Qt.UserRole + 1)
        size_data = item.data(QtCore.Qt.UserRole + 2)
        width, height = size_data[0], size_data[1]
        

        self._change_Label(str(fileName) ,namesWidget )
        self._change_Label("Resolution ( {}x{} )".format(width , height) ,sizeWidget)
        self._set_imageToLabel(imagePath , labelWidget)


    #------------------------------------------------------------ui helper
    def _add_imagesToPreviewList(self ,path , widget , prefix="snap_", ext=".jpg"):
        widget.clear()
        
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


    def _set_imageToLabel(self , path , widget):
        pixmap = QtGui.QPixmap(path)
        # 라벨 위젯의 현재 사이즈에 맞게 스케일링 (안티앨리어싱 적용)
        scaled_pixmap = pixmap.scaled(
            widget.size(),
            QtCore.Qt.KeepAspectRatio,
            QtCore.Qt.SmoothTransformation
        )
        widget.setPixmap(scaled_pixmap)


    def _change_Label(self , templete  , widget ):
        widget.setText(templete )

    def _set_directoryPath(self ,path  ,string = "select folder" ):
        options = QFileDialog.getExistingDirectory(self, string , path)
        return options
    
    def _open_directory(self , path):
        isPath = os.path.exists(path)
        if isPath == False:
            os.mkdir(path) 
        os.startfile(path)
        


if __name__ == "__main__":
    print ("sys.argv",sys.argv ) #현재파일추척

    
    app = QApplication(sys.argv)
    app.setStyle("Fusion")

    mayaComfyui = DesignerUI()
    mayaComfyui.init_ui(uiPath)
    mayaComfyui.show_ui()
    sys.exit(app.exec())