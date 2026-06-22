# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import sys , os  ,json ,io  , tempfile ,pprint , subprocess ,re

try:
    from PySide6 import QtWidgets, QtCore, QtUiTools , QtGui 
    from PySide6.QtWidgets import QApplication ,QHeaderView
    
except:
    from PySide2 import QtWidgets, QtCore, QtUiTools , QtGui 
    from PySide2.QtWidgets import QApplication ,QHeaderView


##-----------------------------------------------------------------------------------preSetting
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


currentPath = os.path.dirname(os.path.abspath(__file__))
#Json = writable_path( "_prev.json")
uiPath =resource_path( "resizeImgManager.ui")
pathAppend()

from core import connectMayaSocket , controlImage , pysideHelper , stream , makeCode , mayaCommend


#------------------------------------------------------------ui
class DesignerUI(QtWidgets.QWidget):
    def __init__(self , parent = None):
        super(DesignerUI ,self).__init__(parent) 
        self.ui =None
        self._log_stream = None


        self._isPrev = None
        self._prevData = {}
        self._prevJsonPath = writable_path( "_prev.json")
        # (key, widget_name, getter, setter, default)
        self._prevMap =[
            ("port",          "mayaPort_Sb",       "value",        "setValue",        7772),
            ("width",         "resizeWidth_Sb",    "value",        "setValue",        512),
            ("height",        "resizeHeight_Sb",   "value",        "setValue",        512),
            ("saveName",      "saveName_Le",       "text",         "setText" ,        "resize_{name}.jpg"),
            ("pattern" ,      "fileNamePattern_Le","text",         "setText" ,        "(.+)(_dif)(\.jpg)"),
            ("createNodeName","createNodeName_Le", "text",         "setText" ,        "{resizeImgName}"),

            ("openFolder",    "openFolder_Chb",    "isChecked",    "setChecked",       True),
            ("checkMakeNode", "makeNode_Chb",      "isChecked",    "setChecked",       False),
            ("nodeType",      "nodeType_Cbb",      "currentText",  "setCurrentText" , ""),
            ("createNodeType","createNodeType_Cbb","currentText",  "setCurrentText" , "")
        ]

        self._isPrevShader = None
        self._shaderData = {}
        self._shaderBasicData = {
                                    "shaderAttr": {
                                        "RedshiftMaterial": ".diffuse_color"
                                    },
                                    "createShadingNodes" : ["lambert" , "blinn"]

                                }
        self._shaderJsonPath = writable_path("_shaderData.json")
        #--------------------------
        self._isMayaPort = False
        self._is_log_expanded =False
        self._is_table_expanded = False
        self._toggleForTable = False
        self._prev_main_size = None


    def _load_shaderAttr_json(self):
        
        self._isPrevShader = os.path.exists(self._shaderJsonPath)
        data = None
        if self._isPrevShader:
            try:
                with io.open(self._shaderJsonPath) as f:
                    data = json.load(f)
            except Exception:
                    print(u">> 에러 : _shaderData.json 데이터 읽기 실패")

        if data:
            self._shaderData.update(data)
            keys = self._shaderBasicData["shaderAttr"].keys()
            #keys.sort()
            self.ui.nodeType_Cbb.clear()
            self.ui.nodeType_Cbb.addItems(keys)
            
    def _save_shaderAttr_json(self):
        pass
        if not self._shaderData:
            self._shaderData =  self._shaderBasicData["shaderAttr"]
        upData ={}
        if os.path.exists(self._shaderJsonPath):
            try:
                with io.open(self._shaderJsonPath , "r" , encoding= "utf-8") as f:
                    upData = json.load(f)
            except Exception as e:
                print (u">> 에러 : _shaderData.json 데이터 읽기 실패\n>> 초기화 후 덮어쓰기 실행 ")
        upData.update(self._shaderData)
        try:
            with io.open(self._shaderJsonPath , "w" , encoding= "utf-8") as f:
                if sys.version_info[0] < 3:
                    json_str = json.dumps(upData, ensure_ascii=False, indent=4)
                    if isinstance(json_str, str):
                        json_str = json_str.decode('utf-8')
                    f.write(json_str)
                else:
                    json.dump(upData, f, ensure_ascii=False, indent=4)
            print (u">> _shaderData.json 가 저장되었습니다.")
        except Exception as e:
            print(u">> 에러 : _shaderData.json 저장 중 오류 발생: {}".format(e))

    def _load_createNodeType_json(self):
        self._isPrevShader = os.path.exists(self._shaderJsonPath)
        data = None
        if self._isPrevShader:
            try:
                with io.open(self._shaderJsonPath) as f:
                    data = json.load(f)
            except Exception:
                    print(u">> 에러 : _shaderData.json 데이터 읽기 실패")
        if data:
            self._shaderData.update(data)
            nodes = self._shaderBasicData["createShadingNodes"]
            self.ui.createNodeType_Cbb.clear()
            self.ui.createNodeType_Cbb.addItems(nodes)

    #----------------------------------------------------------------------load Ui
    def init_ui(self, path):
        isUiPath = os.path.exists(path )

        if not isUiPath:
            print (u">> 에러 : ui 경로 찾을 수 없음" )
            return
        

        #QtCore.QFile = ui를 지정하기 위한 __init__ 클래스
        uiFile = QtCore.QFile(path)
        
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


        #------------------------------Exec uiFunction
        self._preSet_table()
        self._setup_log()
        self._setup_icon()
        self._loadPrev()
        self._load_shaderAttr_json()
        self._load_createNodeType_json()
        self._connect_widget()
        self._check_mayaProt()

    #----------------------------------------------------------------------connect widget

    def _connect_widget(self):
        #state
        self.ui.makeConnectCode_Btn.clicked.connect(self._savePrev)
        self.ui.makeConnectCode_Btn.clicked.connect(lambda : self.make_connectMayaCode(True))
        self.ui.connectMayaPort_Btn.clicked.connect(self._check_mayaProt)

        #find data
        self.ui.reload_organizeData_Btn.clicked.connect(self.get_mayaSelectedShaderData)
        self.ui.reload_organizeData_Btn.clicked.connect(self.select_all_tableItems)
        self.ui.clean_organizeData_Btn.clicked.connect(lambda : self.ui.organizeData_Tb.clearContents())
        self.ui.clean_organizeData_Btn.clicked.connect(lambda : self.ui.organizeData_Tb.setRowCount(0))
        self.ui.organizeData_Btn.clicked.connect(self.filter_noneItem)

        self.ui.open_organizeData_Btn.clicked.connect(self.expend_tableLayout)

        self.ui.selectAll_organizeData_Btn.clicked.connect(self.select_all_tableItems)

        #clear data
        self.ui.setFolderPath_Btn.clicked.connect(lambda : self.set_directoryPath(self.ui.folderPath_Le))
        self.ui.setFolderPath_Btn.clicked.connect(lambda : print (u">> 디렉토리 설정됨 : {}".format(self.ui.folderPath_Le.text())))


        #log
        self.ui.openLogPte_Btn.clicked.connect(self.expend_logLayout)
        self.ui.clearLogPte_Btn.clicked.connect(lambda : self.ui.log_Pte.clear())

        self.ui.log_Pte.installEventFilter(self)
        self.ui.organizeData_Tb.installEventFilter(self)
        #build 
        self.ui.build_Btn.clicked.connect( self.build)

        #manual
        self.ui.info_Btn.clicked.connect( self.open_Manual)
    #----------------------------------------------------------------------Function
    def select_all_tableItems(self):
        if self._toggleForTable == False:
            self.ui.organizeData_Tb.selectAll()
            self._toggleForTable = True
        else:
            self.ui.organizeData_Tb.clearSelection()
            self._toggleForTable = False

    def open_Manual(self):
        manualPath = resource_path("manual/manual.html") 
        if os.path.exists(manualPath):
            os.startfile(manualPath)

    def make_node_for_resize(self , success_data):
        nodeNameTemplete = self.ui.createNodeName_Le.text()
        nodeType = self.ui.createNodeType_Cbb.currentText()
        if not "{resizeImgName}" in nodeNameTemplete:
            print(">> 에러 : node name 에 '{resizeImgName}'이 없습니다.")
            return
        
        print(">> 마야로 노드 생성 코드를 일괄 조립합니다...")

        headCode_master = ""
        bodyCode_master = ""

        ''' 참고
        data = {
        "shaderEngine": engine,
        "fileNode": final_fileNode,
        "shaderNode": final_shaderPlug if final_shaderPlug else (shaders[0] if shaders else None),
        "imgName": imgName,
        "imgPath": imgPath,
        "imgDirPath": imgDirPath,
        "cnted_rsshader" : cnted_rsshader,
        "cnted_shader" : cnted_shader
        }'''


        for item in success_data: # _resize_workerThead >> _on_build_finished >> 에서 가져온 데이터

            disconnect_code =""
            connect_code =""
            


            orig_data = item["orig_data"]
            resizeImg_path = item["resize_path"]
            shader_engine = orig_data.get("shaderEngine")



            imgName, _ = os.path.splitext(orig_data.get("imgName", "unknown"))
            new_shader_name = nodeNameTemplete.format(resizeImgName=imgName + "_{}".format(nodeType.capitalize()))
            new_file_name = nodeNameTemplete.format(resizeImgName=imgName + "_File")
            new_p2t_name = nodeNameTemplete.format(resizeImgName=imgName + "_P2t")

            #----------------------------------------------------------------------헤더 및 newShader
            HeaderCode , create_shadingBodyCode = mayaCommend.create_shadingNode(
                new_shader_name , new_file_name , new_p2t_name , nodeType
                )
            
            headCode_master = HeaderCode 
            bodyCode_master += create_shadingBodyCode
            #----------------------------------------------------------------------newFile 경로 삽입
            _ , setAttr_BodyCode = mayaCommend.setAttrData(
                new_file_name + ".fileTextureName" , resizeImg_path ,{"type":"string"}
                )
            
            bodyCode_master += setAttr_BodyCode

            #----------------------------------------------------------------------disconnect 
            if orig_data.get("cnted_rsshader"):
                _ , disconnect_rsBodyCode = mayaCommend.disconnect_nodes(
                    orig_data.get("cnted_rsshader")[0] , orig_data.get("cnted_rsshader")[1]
                    )
                disconnect_code += disconnect_rsBodyCode

            if orig_data.get("cnted_shader"):
                _ , disconnect_BodyCode = mayaCommend.disconnect_nodes(
                    orig_data.get("cnted_shader")[0] , orig_data.get("cnted_shader")[1]
                    )
                disconnect_code += disconnect_BodyCode

            #----------------------------------------------------------------------connect 
            if shader_engine:
                old_shader_out = None
                if orig_data.get("cnted_rsshader"):
                    old_shader_out = orig_data.get("cnted_rsshader")[0]
                elif orig_data.get("cnted_shader"):
                    old_shader_out = orig_data.get("cnted_shader")[0]

                # 2. 찾은 기존 쉐이더를 렌더링용(rsSurfaceShader)으로 강제 이사시킵니다.
                if old_shader_out:
                    _ , connect_rsShader_to_RsSurfaceShader_BodyCode = mayaCommend.connect_nodes(
                        old_shader_out , shader_engine + ".rsSurfaceShader"
                    )
                    connect_code += connect_rsShader_to_RsSurfaceShader_BodyCode

                # 3. 빈 자리(surfaceShader)에 리사이즈 텍스처를 문 새로운 쉐이더를 꽂아 뷰포트를 최적화합니다.
                _ , connect_newShader_to_SurfaceShader_BodyCode = mayaCommend.connect_nodes(
                    new_shader_name + ".outColor" , shader_engine + ".surfaceShader"
                )
                connect_code += connect_newShader_to_SurfaceShader_BodyCode

            bodyCode_master += disconnect_code + connect_code

        final_maya_code = headCode_master + "\n" + bodyCode_master

        dummy_json_path = os.path.join(tempfile.gettempdir(), "dummy.json").replace("\\", "/") # 임시파일로 
        make_dummy_json_code = """
import json
with open('{}', 'w') as f:
    json.dump({{"status": "ok"}}, f)
""".format(dummy_json_path)
        final_maya_code += make_dummy_json_code

        success, data = connectMayaSocket.send_to_maya_for_jsonFile(
            final_maya_code, 
            dummy_json_path, 
            "127.0.0.1", 
            self.ui.mayaPort_Sb.value())
        


        if success:
            print(">> 마야 노드 생성 및 연결 작업이 완료되었습니다!")
        else:
            print(">> 에러 : 마야 노드 생성 통신 실패: {}".format(data))




    def build(self ):

        #----
        workData = self.get_selectedTableItems()
        renamefile = self.ui.saveName_Le.text()
        resizeWidth, resizeHeight = self.ui.resizeWidth_Sb.value(), self.ui.resizeHeight_Sb.value()
        dirPath = self.ui.folderPath_Le.text()

        # 방어 로직
        if not dirPath:
            print(">> 에러 : folder path 가 설정되지 않았습니다.")
            return 
        if not os.path.exists(dirPath):
            print(">> 에러 : {}의 경로가 존재하지않습니다.".format(dirPath))
            return 
        if not "{name}" in renamefile:
            print(">> 에러 : saveName 에 '{name}'이 없습니다.")
            return 
        if not workData:
            print(">> 에러 : 선택된 아이템이 없습니다.")
            return

        print(">> 리사이즈 작업을 백그라운드에서 시작합니다...")

        # 1. 스레드 객체 생성 (인자들을 다 싸서 넘겨줌) #쓰레드는 드럽게 어려워 ㅅㅂ

        self._toggle_ui_lock(is_locked=True)
        self.ui.execProcess_Pb.setValue(0)
        self.worker_thread = stream.thread(
            target_func=self._resize_workerThead,
            workData=workData,
            dirPath=dirPath,
            renamefile=renamefile,
            resizeWidth=resizeWidth,
            resizeHeight=resizeHeight
        )

        # 2. 스레드의 신호를 받을 UI 내부 함수 연결
        self.worker_thread.progress_signal.connect(self.ui.execProcess_Pb.setValue)
        self.worker_thread.finished_signal.connect(self._on_build_finished)
        self.worker_thread.error_signal.connect(self._on_build_error)

        # 3. 스레드 출발!
        self.worker_thread.start()




    def get_selectedTableItems(self):
        selected_cells = self.ui.organizeData_Tb.selectedItems()
        if not selected_cells:
            print (u">> 테이블의 아이템이 선택되지 않았습니다.")
            return []
        
        #SelectRows 모드라서 한 줄을 누르면 0~3열이 모두 잡히기 때문
        selected_rows = list(set([item.row() for item in selected_cells]))
        selected_rows.sort()
        st = ""

        result_data = []
        for row in selected_rows:
            main_item = self.ui.organizeData_Tb.item(row, 0)

            if main_item :
                objName = main_item.data(QtCore.Qt.UserRole)
                objData = main_item.data(QtCore.Qt.UserRole + 1)
                ## 테이블 위젯의 QtCore.Qt.UserRole데이서 >>  Json(딕셔너리) 데이터로
                objData["ui_row_index"] = row #ui업데이트 및 노드만들기
                result_data.append(objData)
                
                st += ">> [선택됨] row {} : {}\n".format(row, objName)
                st += "     - 경로 : {}\n" .format(objData.get("imgPath"))
        print (st)
        return result_data


    def expend_tableLayout(self):
        if not self._is_table_expanded:
            
            self.ui.organizeData_Tb.setWindowFlags(QtCore.Qt.Window)
            self.ui.organizeData_Tb.setWindowTitle("Item Table")
            self.ui.organizeData_Tb.resize(1300, 400)
            self.ui.organizeData_Tb.show()
            self.ui.organizeData_Gb.setMinimumHeight(0)
            self.ui.organizeData_Gb.setMaximumHeight(0)
            self.ui.organizeData_Gb.setVisible(False)
            self._is_table_expanded = True
            #QApplication.processEvents()
            QApplication.processEvents()
            self.resize(self.width(), 0)
        else:
            self.ui.organizeData_Tb.setWindowFlags(QtCore.Qt.Widget)
            if self.ui.organizeData_Gb.layout() is not None:
                self.ui.organizeData_Gb.layout().insertWidget(0, self.ui.organizeData_Tb)
            else:
                print(">> 에러: organizeData_Gb에 레이아웃이 설정되어 있지 않습니다.")
            self.ui.organizeData_Tb.show()
            self.ui.organizeData_Gb.setMinimumHeight(0)
            self.ui.organizeData_Gb.setMaximumHeight(16777215)
            self.ui.organizeData_Gb.setVisible(True)
            self._is_table_expanded = False


    def expend_logLayout(self):
        if not self._is_log_expanded:
            
            # 플래그를 Window로 변경하여 레이아웃에서 완전히 분리 (팝업)
            self.ui.log_Pte.setWindowFlags(QtCore.Qt.Window)
            self.ui.log_Pte.setWindowTitle("Log Viewer")
            self.ui.log_Pte.resize(600, 400)
            self.ui.log_Pte.show()
            self.ui.log_Gb.setMinimumHeight(60)
            self.ui.log_Gb.setMaximumHeight(60)
            self._is_log_expanded = True
            QApplication.processEvents()
            self.resize(self.width(), 0)
            
        else:
            # 팝업 상태 해제 (Widget으로 복귀)
            self.ui.log_Pte.setWindowFlags(QtCore.Qt.Widget)
            if self.ui.log_Gb.layout() is not None:
                self.ui.log_Gb.layout().insertWidget(0, self.ui.log_Pte)

            else:
                print(">> 에러: log_Gb에 레이아웃이 설정되어 있지 않습니다.")
            self.ui.log_Pte.show()
            self.ui.log_Gb.setMinimumHeight(125)
            self.ui.log_Gb.setMaximumHeight(125)
            self._is_log_expanded = False



    def set_directoryPath(self, target_widget):
        path = pysideHelper.set_existingDirectoryPath(self.ui , target_widget.text())
        if path:
            target_widget.setText(path)

    def filter_noneItem(self):
        #range(4 = start, -1 = end, -1 = + (-1씩)) ==> 4, 3, 2, 1, 0
        for row in range(self.ui.organizeData_Tb.rowCount() - 1, -1, -1):
            img_item = self.ui.organizeData_Tb.item(row, 1)
            if img_item is None or img_item.text() == "None":
                self.ui.organizeData_Tb.removeRow(row)


    def get_mayaSelectedShaderData(self):
        #print (self._shaderData)

        currentSelectShader = self._shaderData['shaderAttr'][self.ui.nodeType_Cbb.currentText()]
        pattern = self.ui.fileNamePattern_Le.text()
        if not currentSelectShader:
            raise ValueError(">> 에러 : shader type이 설정되지 않습니다.")
        

        tempPath = os.path.join(tempfile.gettempdir() , "selectedShaderData.json").replace("\\", "/")
        code = ""
        prefixCode , exportJsonCode = mayaCommend.set_JsonPath( tempPath , "jsonData")
        print (">>> currentSelectShader" , currentSelectShader)
        headCode , bodyCode = mayaCommend.get_selectedMayaShaderData(currentSelectShader , pattern)
        sentToMayaCode = headCode + bodyCode
        code += prefixCode
        code += sentToMayaCode
        code += exportJsonCode

        #pprint.pprint(code)

        success , data = connectMayaSocket.send_to_maya_for_jsonFile(code , tempPath ,"127.0.0.1" , self.ui.mayaPort_Sb.value() )
        
        #print (success , data)


        if not success:
            print(u">> 에러 : data 가져오기 실패: {}".format(data))
            return
        if not isinstance(data, dict):
            print(u">> 에러 : 예상치 못한 응답 형식: {}".format(data))
            return
        dirPath = None
        try:
            #  마야에서 넘어온 원본 data에서 중복되는 쉐이더 엔진을 걸러냅니다!
            filtered_data = {}
            for objects, objData in data.items():
                engine = objData.get("shaderEngine")
                
                
                if engine:
                    if engine not in filtered_data:
                        filtered_data[engine] = (objects, objData)
                else:
                    # 만약 엔진 정보가 없는 불량 노드라면
                    print(">> [스킵] 쉐이딩 그룹이 없는 불량 노드: {}".format(objects))
                    continue
            # 이제 테이블은 중복이 완벽하게 제거된 filtered_data의 개수만큼만 생성됩니다.
            rowCount = len(filtered_data)
            self.ui.organizeData_Tb.clearContents()
            self.ui.organizeData_Tb.setRowCount(rowCount)
            
            row_idx = 0 # rowCount 대신 테이블 줄 번호를 추적할 안전한 변수
            
            # data.items() 대신, 필터링이 끝난 filtered_data.values()에서 꺼내옵니다.
            for engine_key, (objects, objData) in filtered_data.items():

                if dirPath is None:
                    img_dir = objData.get("imgDirPath")
                    if img_dir and os.path.exists(img_dir):
                        dirPath = img_dir
                    
                reNaming = objects
                if "|" in objects:
                    splitObjects = objects.split("|")
                    reNaming = "...|{}".format(splitObjects[-1])
                    
                # (옵션) UI에서 작업자가 헷갈리지 않도록 이름 뒤에 엔진 이름을 붙여주면 아주 직관적입니다!
                reNaming = "{} [{}]".format(reNaming, engine_key)

                item = QtWidgets.QTableWidgetItem(reNaming)

                item.setData(QtCore.Qt.UserRole, objects)  
                item.setData(QtCore.Qt.UserRole + 1, objData)  

                self.ui.organizeData_Tb.setItem(row_idx, 0, item)
                
                item_img = QtWidgets.QTableWidgetItem(str(objData.get("imgName", None)))
                self.ui.organizeData_Tb.setItem(row_idx, 1, item_img)

                cnted_shader = QtWidgets.QTableWidgetItem(str(objData.get("cnted_shader", None)))
                self.ui.organizeData_Tb.setItem(row_idx, 2, cnted_shader)

                cnted_rsshader = QtWidgets.QTableWidgetItem(str(objData.get("cnted_rsshader", None)))
                self.ui.organizeData_Tb.setItem(row_idx, 3, cnted_rsshader)
                
                row_idx += 1

            print(u">> mayaShaderData 가져옴 (중복 제거 완료!): 총 {}개".format(rowCount))

        except Exception as e:
            print(u">> 에러 : shaderData 가져오기 실패\n {}".format(e))
            
        if dirPath:
            self.ui.folderPath_Le.setText(dirPath)
            print(u">> 디렉토리 설정됨 : {}".format(dirPath))


    def make_connectMayaCode(self ,openFolder = False):

        fileName = "dragMayaViewPort.py"
        filePath = writable_path(fileName)

        currentPort = int(self.ui.mayaPort_Sb.value())
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
            PORT = int(jsonData.get("port", PORT))
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
    print(u">> [resizeManager] 포트 닫힘: {{port}}")
else:
    cmds.commandPort(name=port_addr, stp="python", sourceType="python")
    print(u">> [resizeManager] 포트 열림: {{port}}")
"""
    
    final_command = command_template.format(port=port_addr)
    gShelfTopLevel = mel.eval('$tmpVar=$gShelfTopLevel')
    current_shelf = cmds.tabLayout(gShelfTopLevel, query=True, selectTab=True)

    cmds.shelfButton(
        parent=current_shelf,
        annotation="resizeManager : 외부 포트 열기 ({{}})".format(PORT),
        label="resizeManager",
        image="pythonFamily.png",
        command=final_command,
        sourceType="python",
        imageOverlayLabel="resize", 
        overlayLabelColor=(1, .25, .25)
    )

    print(u">> [resizeManager] 선반 버튼 생성 완료")
'''.format(default_port=currentPort)
    
        makeCode.makeCodeFile(filePath ,code )
        if openFolder:
            real_dir = os.path.dirname(filePath) 
            os.startfile(real_dir)
            

    #----------------------------------------------------------------------checkPort

    def _check_mayaProt(self):
        self._isMayaPort , _ =connectMayaSocket.check_mayaConnection("print ('pong')" , "127.0.0.1" ,self.ui.mayaPort_Sb.value() )

        if self._isMayaPort:
            self.ui.mayaPort_Sb.setStyleSheet("background-color: #5DADE2;") 
            print (u">> maya port가 연결되었습니다.")
        else:
            self.ui.mayaPort_Sb.setStyleSheet("background-color: #CD5C5C;") 
            print (u">> maya port가 연결되지 않았습니다.")

    #----------------------------------------------------------------------stream
    def eventFilter(self, obj, event):
        
        if obj == self.ui.log_Pte and event.type() == QtCore.QEvent.Close:
            # 1. 닫기 이벤트를 무시(취소)합니다. (안 그러면 창이 숨겨집니다)
            event.ignore()
            # 2. 우리가 만든 복귀 함수를 강제로 실행시킵니다.
            self.expend_logLayout()
            return True
        if obj == self.ui.organizeData_Tb and event.type() == QtCore.QEvent.Close:
            event.ignore()
            self.expend_tableLayout()
            return True

            
        return super(DesignerUI, self).eventFilter(obj, event)

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
            self._save_shaderAttr_json()
        except Exception as e:
            print(u">> 종료 중 저장 실패: {}".format(e))
            sys.stdout.flush()

        # 창 닫기 승인
        event.accept()
        super(DesignerUI, self).closeEvent(event)


    def _textlog(self , text):
        #시그널 발사시 호춯
        self.ui.log_Pte.moveCursor(QtGui.QTextCursor.End) # 커서가 그 위치에서 끝 메모장 글쓸때 깜빡깜빡 할대 그위치
        self.ui.log_Pte.insertPlainText(text)

    def _setup_log(self):
        
        self._log_stream = stream.EmittingStream() #스트림 지정 변수
        # print ("sss")든 앞으로 나오는 메세지는 _textlog함수에 할당한다 라는 의미(text에 넣어라)
        self._log_stream.textWritten.connect(self._textlog) 

        # "앞으로 stdout으로 갈 거 다 self._log_stream으로 보내고, stderr도 마찬가지로."
        sys.stdout = self._log_stream #메세지를 가져온다.
        sys.stderr = self._log_stream #에러도 가져온다

        print(u">> log 스트림 설정됨") 

    def _resize_workerThead(self,workData, dirPath, renamefile, resizeWidth, resizeHeight, progress_callback=None, is_running_check=None):

        workTotal = len(workData)
        result_list = [] #반환할거


        for idx, data in enumerate(workData):
            # 사용자가 취소 버튼을 눌렀는지 체크
            if is_running_check and not is_running_check():
                return {"status": "cancel", "msg": ">> 작업이 취소되었습니다.", "result_data": []}

            if data.get("imgPath"):
                imgName, ext = os.path.splitext(data.get("imgName"))
                renameSaveimg = renamefile.format(name=imgName)
                resultSavePath = os.path.join(dirPath, renameSaveimg).replace("\\", "/")

                resizeWork = controlImage.resizeImage(data.get("imgPath"), resizeWidth, resizeHeight)
                
                if resizeWork is not None:
                    print(">> 리사이즈 성공 : {}".format(data.get("imgName")))
                    saveResize = controlImage.saveImage(resizeWork, resultSavePath)
                    
                    if saveResize:
                        print(">> 리사이즈 저장완료 :\n    - {}".format(resultSavePath))

                        result_list.append({"is_success": True,
                                            "orig_data": data,
                                            "resize_path" : resultSavePath,
                                            "error_msg": None
                                            })
                    else: #저장이 안될경우
                        result_list.append({
                            "is_success": False,
                            "orig_data": data,
                            "resize_path": None,
                            "error_msg": u"이미지 저장 실패 (경로/권한 문제)"
                        })
                else: #resizeWork이 안될경우
                    result_list.append({
                        "is_success": False,
                        "orig_data": data,
                        "resize_path": None,
                        "error_msg": u"이미지 리사이즈 실패 (손상된 원본)"
                    })



            #
            if progress_callback:
                percent = int(((idx + 1) / float(workTotal)) * 100)
                progress_callback(percent)

        return {"status": "done", "msg": ">> 모든 리사이즈 작업이 완료되었습니다!", "result_data": result_list}
    


    def _on_build_finished(self, result_dict):
        """스레드가 모든 작업을 끝내면 자동으로 실행됩니다."""
        self._toggle_ui_lock(is_locked=False)

        #print(result_msg) #old

        status = result_dict.get("status")
        msg = result_dict.get("msg")
        result_list = result_dict.get("result_data", [])


        if status == "done" and result_list: #_resize_workerThead에서 패키징한거
            print(">> UI 데이터 업데이트를 시작합니다...")

            success_data = [] #마야 노드생성을 위한 데이터

            for item in result_list:
                orig_data = item["orig_data"]
                is_success = item["is_success"]
                resizeImg_path = item["resize_path"]
                error_msg = item["error_msg"]

                target_row = orig_data.get("ui_row_index")

                if target_row is not None:
                    main_item = self.ui.organizeData_Tb.item(target_row, 0)

                    if is_success:
                        newData = {"new_imgPath": resizeImg_path} ## 딕셔너리 이유는 나중을 위해서라도...
                        main_item.setData(QtCore.Qt.UserRole + 2, newData) 

                        main_item.setBackground(QtGui.QColor(46, 160, 67, 50))
                        success_data.append(item) ## 잊지 말자 item은 딕셔너리다 

                    else:
                        main_item.setBackground(QtGui.QColor(205, 92, 92, 50))
                        print(">> [실패] row {}: {}".format(target_row, error_msg))

            if success_data and self.ui.makeNode_Chb.isChecked():
                self.make_node_for_resize(success_data)
        if self.ui.openFolder_Chb.isChecked():
            os.startfile(self.ui.folderPath_Le.text())



    def _on_build_error(self, err):
        """스레드 내부에서 에러가 터졌을 때 실행됩니다."""
        # 에러가 나도 일단 UI는 다시 풀어줘야 합니다.
        self._toggle_ui_lock(is_locked=False)
        print(">> 스레드 에러 발생:\n{}".format(err))

    def _toggle_ui_lock(self, is_locked):
        """
        is_locked가 True면 UI를 잠그고(비활성화), False면 다시 풉니다.
        """
        # setEnabled는 True일 때 켜지므로, is_locked의 반대값
        state = not is_locked
        
        
        self.ui.build_Btn.setEnabled(state)
        self.ui.setting_Gb.setEnabled(state)
        self.ui.organizeData_Gb.setEnabled(state)

    #----------------------------------------------------------------------load ui functionOption
    def _preSet_table(self):
        self.ui.organizeData_Tb.verticalHeader().setDefaultSectionSize(15)
        self.ui.organizeData_Tb.horizontalHeader().setDefaultSectionSize(80)
        self.ui.organizeData_Tb.horizontalHeader().setSectionResizeMode(QHeaderView.ResizeToContents)
        self.ui.organizeData_Tb.setSelectionBehavior(QtWidgets.QAbstractItemView.SelectRows)
        

    def reject(self):
        self.close()
        super(DesignerUI, self).reject()

    def show_ui(self):
        self.show()

    def _loadPrev(self):
        self._isPrev = os.path.exists(self._prevJsonPath)
    
        data = None
        if self._isPrev:
            try:
                with io.open(self._prevJsonPath, "r", encoding="utf-8") as f:
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
            getattr(widget, setter)(value)
            #if "_Cbb" in widget_name:
            #    self._pendingComboValues[widget_name] = value
            #else:
            #    getattr(widget, setter)(value)

    def _savePrev(self):
        print(u">> 저장 경로: " + self._prevJsonPath)


        # ( key,      widget_name,    getter,   setter,     default)
        for key ,     widget_name ,   getter ,     _ ,        _ in self._prevMap:
            widget = getattr(self.ui ,widget_name )
            self._prevData[key] = getattr(widget ,  getter)()

        #-----------------------------------------upData
        upData = {}
        if os.path.exists(self._prevJsonPath):
            try:
                with io.open(self._prevJsonPath , "r" , encoding= "utf-8") as f:
                    upData = json.load(f)
            except Exception as e:
                print (u">> 에러 : _prev.json 데이터 읽기 실패\n>> 초기화 후 덮어쓰기 실행 ")
        upData.update(self._prevData)

        #-----------------------------------------write
        try:
            with io.open(self._prevJsonPath , "w" , encoding= "utf-8") as f:
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


    def _setup_icon(self):
        style = QApplication.style() 

        find_inco = style.standardIcon(QtWidgets.QStyle.SP_FileDialogContentsView)
        refresh_icon = style.standardIcon(QtWidgets.QStyle.SP_BrowserReload)
        openFolder_icon = style.standardIcon(QtWidgets.QStyle.SP_DirOpenIcon)
        connect_icon = style.standardIcon(QtWidgets.QStyle.SP_DriveNetIcon)
        help_icon = style.standardIcon(QtWidgets.QStyle.SP_MessageBoxQuestion)
        trash_icon = style.standardIcon(QtWidgets.QStyle.SP_TrashIcon)
        openLayout_icon = style.standardIcon(QtWidgets.QStyle.SP_TitleBarMaxButton)

        iconMapTasks = [
            ("info_Btn"                 ,help_icon      ),
            ("connectMayaPort_Btn"      ,connect_icon   ),
            ("reload_organizeData_Btn"  ,find_inco   ),
            ("clean_organizeData_Btn"   ,trash_icon     ),
            ("setFolderPath_Btn"        ,openFolder_icon),
            ("openLogPte_Btn"           ,openLayout_icon),
            ("open_organizeData_Btn"    ,openLayout_icon),
            ("clearLogPte_Btn"          ,trash_icon     ),
            ("organizeData_Btn"         ,refresh_icon  )

        ]

        for widget_name , icon in iconMapTasks:
            widget = getattr(self.ui , widget_name)
            getattr(widget , "setIcon")(icon)












if __name__ == "__main__":
    print (">> sys.argv :",sys.argv ) 
    app = QApplication(sys.argv )
    app.setStyle("Fusion")
    resizeImgManager = DesignerUI()
    resizeImgManager.init_ui(uiPath)
    resizeImgManager.show_ui()
    sys.exit(app.exec())