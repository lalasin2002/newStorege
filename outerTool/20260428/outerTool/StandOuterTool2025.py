# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import sys , os ,re ,json ,io

sep ="\n" + "_____"*5
DefaultVersion = 2020
UiName = "StandOuterTool.ui"


# 플러그인 로딩 스킵
os.environ["MAYA_SKIP_USERSETUP_PY"] = "1"
os.environ["MAYA_NO_STANDALONE_MSG"] = "1"
os.environ["MAYA_MODULE_PATH"] = ""

if sys.version_info[0] < 3:
    text_type = unicode
else:
    text_type = str

#-------------------------------------------------------------------------------------------------Step 1

print ("\n")
print ( r">> [진행 1] : 마야 버젼확인...")
# mayapy버젼 가져오기(bat 파일에서 실행할때 )
version = None
app_path = sys.executable # 현재 사용하고있는 파이썬 전체 경로
search = re.search(r"Maya(\d{4})" , app_path , re.IGNORECASE) #re.IGNORECASE :: 대소문자 무시 re.Flag
if search:
    version = int(search.group(1)) # 버젼 문자열 추출뒤 int타입으로

if version:
    print (r">> [마야 버젼] : {}" .format(version))
else:
    version = DefaultVersion
    print (r">> [마야 버젼] : 버젼을 확인할수 없어 , 기본값 "+ "({})" .format(DefaultVersion) + r"로 지정 ")



#-------------------------------------------------------------------------------------------------Step 2
print ("\n")
print (r">> [진행 2] : Pyside 모듈 & QApplication 임포트...")

sys.app = None
try:
    if version >= 2025:
        from PySide6 import QtWidgets, QtCore, QtUiTools , QtGui
        #from PySide6.QtGui import QAction
        from PySide6.QtWidgets import QApplication, QFileDialog
    else:
        from PySide2 import QtWidgets, QtCore, QtUiTools , QtGui
        #from PySide2.QtWidgets import QAction
        from PySide2.QtWidgets import QApplication, QFileDialog


    if not QtWidgets.QApplication.instance(): #QApplication 이 있는지 확인 코딩내 (instance() 메서드 ::  있는지 없는지 역할) , QApplication 하나만있어야함
        sys.app = QtWidgets.QApplication(sys.argv)  #sys.argv는 프로그램 바깥에서 프로그램 시작전의 옵션을 말함 , 현재 sys.argv는 *경로*를 말함
                                                    #sys.app 메서드가 아닌 , sys라는 모듈에 app이라고 변수화 해서 넣은것 sys.Maya 이렇게 임의의 이름으로도 됨 
                                                    # 전문용어로 Monkey Patching / 동적속성할당이라고 함
                                                    # Monkey Patching를 한이유 중복 변수이름 방지 , 사실 math.app / re.app 이렇게 해도됨

                                                    #전문적이유 
                                                    # 이유 1: 마야 2020의 공격적인 GC(청소부)로부터 app 변수가 삭제되는 것을 방지 (수명 연장)
                                                    # 이유 2: 전역 모듈인 sys에 등록하여 어디서든 접근 가능하게 함
    else:
        sys.app = QtWidgets.QApplication.instance() #QApplication 이미 있다면 sys.app에 들어가라

    if sys.app:
        print (r">> [진행 성공] : QApplication 생성")

except ImportError as e:
    print (r">> [에러] : Pyside 임포트 실패\n" , sep , e ,sep)
    sys.exit()

class SilenceOutput:
    """
    운영체제 레벨(C++)의 표준 출력(stdout)과 에러(stderr)를 
    잠시 꺼버리는 컨텍스트 매니저
    """
    def __init__(self):
        self.null_fds = [os.open(os.devnull, os.O_RDWR) for x in range(2)]
        self.save_fds = [os.dup(1), os.dup(2)]

    def __enter__(self):
        # 1과 2번(표준출력/에러)을 Null 장치로 연결
        os.dup2(self.null_fds[0], 1)
        os.dup2(self.null_fds[1], 2)

    def __exit__(self, *_):
        # 원래대로 복구
        os.dup2(self.save_fds[0], 1)
        os.dup2(self.save_fds[1], 2)
        # 열었던 파일 핸들 닫기
        for fd in self.null_fds + self.save_fds:
            os.close(fd)


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

#-------------------------------------------------------------------------------------------------Step 3
print ("\n")
print ( r">> [진행 3] : 마야엔진 시동중...")

try:
    import maya.standalone #StandAlone 가져오기 
    maya.standalone.initialize(name='python') #StandAlone에서 파이썬 설정으로 가져와라
    import maya.cmds as cmds
    if not cmds.pluginInfo("renderSetup", q=True, loaded=True):
        try:
            cmds.loadPlugin("renderSetup", quiet=True)
            print(">> [정보] Render Setup 플러그인 로드 완료")
        except:
            pass

    # (이전 조치) 아놀드 역시 로드 상태 유지
    if not cmds.pluginInfo("mtoa", q=True, loaded=True):
        try:
            cmds.loadPlugin("mtoa", quiet=True)
        except:
            pass
    import maya.OpenMayaUI as omui
    import maya.mel as mel
    print (r">> [진행 성공] : initialize 성공")
except Exception as e:
    print (r">> [에러] : initialize 실패함\n",sep , e , sep)
    sys.exit()

    
#-------------------------------------------------------------------------------------------------Step 4
print ("\n")
print ( r">> [진행 4] : 경로 sys.path 설정중...")
try:
    current_path = __file__
except NameError:
    current_path = sys.argv[0]

current_folderPath = os.path.abspath(os.path.dirname(current_path))
current_uiAbsPath = os.path.join(current_folderPath , UiName)
setting_json_path = os.path.join(current_folderPath, "_prefer.json")



if current_folderPath not in sys.path:
    sys.path.append(current_folderPath)

if current_folderPath in sys.path:
    print (r">> [진행 성공] : 해당폴더 " + "({})".format(current_folderPath) + r"sys.path 설정됨")
else:
    raise ValueError ( r">> [에러] : 해당 폴더 경로 특정 실패")

#-------------------------------------------------------------------------------------------------Step 5
print ("\n")
print( r">> [진행 5] ui 설정 및 여는중...")

#------------------------------------------------------------------------------------------------Def

def sceneOpen(Path):
    #with SilenceOutput():
    log = None
    errorLog = None
    count = 0 
    errorCount = 0 
    try :
        cmds.file(Path , open = True , force = True , prompt=False , executeScriptNodes=False,loadReferenceDepth='none')
        log = u""
        log += u">> [sceneOpen] : 해당씬 오픈 성공\n"
        count += 1
    except Exception as e:
        errorLog = u""
        errorLog += u">> [sceneOpen] : !! 오픈 에러 !!\n"
        errorLog += u">> [sceneOpen] 상세에러 내용 : {}\n".format(e)
        errorCount += 1
    Log_data = { "deleteLog" : log ,"errorLog" : errorLog ,  "deleteCount" : count , "errorCount" : errorCount }
    return Log_data



def sceneSave(SaveAsPath = None , FileType = 'mayaBinary'):
    if SaveAsPath is None:
        cmds.file(save=True, force=True)
    else:
        cmds.file(rename = SaveAsPath)
        cmds.file(save=True, type=FileType)


def backup_UI_Config():
    config_node = "uiConfigurationScriptNode"
    backup_data = None
            
    if cmds.objExists(config_node):
        try:
            backup_data = cmds.getAttr("{}.before".format(config_node))
        except:
            pass
                                                                                
    return backup_data

def restore_UI_Config(backup_data , node_name = "backUp_uiConfigurationScriptNode"):
    log = None
    errorlog = None

    if not backup_data:
        log = u""
        log += u">> [UI Restore] : 백업된 UI 설정이 없어 건너뜁니다.\n"     
        return { "deleteLog" : log ,"errorLog" : errorlog}                                                               
    if not cmds.objExists(node_name):
        cmds.scriptNode(n=node_name, scriptType=1, sourceType="mel")
                                                                                                                                                
    try:
        # 혹시 이미 존재하면 삭제 (중복 방지)
        if cmds.objExists(node_name):
            cmds.delete(node_name)
            
        # 2. 커스텀 스크립트 노드 생성
        # scriptType=2 (GUI Open) : 사람이 창으로 열 때만 실행됨 (랜더팜 오류 방지)
        # sourceType="mel" : uiConfigurationScriptNode의 원본 데이터는 MEL입니다.
        cmds.scriptNode(
            name=node_name,
            scriptType=2, 
            sourceType="mel",
            beforeScript=backup_data
        )
        log = u""
        log += ">> [UI Restore] : UI 설정을 '{}' 노드에 안전하게 박제했습니다.\n".format(node_name)
        return { "deleteLog" : log ,"errorLog" : errorlog}  
    except Exception as e:
        errorlog = u""
        errorlog += ">> [UI Restore] !! 복구실패 !!\n".format(e)
        errorlog += ">> [UI Restore] 상세내용 : {}\n".format(e)
        return { "deleteLog" : log ,"errorLog" : errorlog}  

def nonCntShapes(Type):
    List = []
    shapes = cmds.ls(type = Type)
    for x in shapes:
        IsInCnt = cmds.listConnections(x ,s =1)
        IsOutCnt = cmds.listConnections(x ,d =1)
        
        if not IsInCnt and not IsOutCnt:
            List.append(x)
    return List

def deleteUnusedNodes():
    log = None
    errorLog = None

    try:
        mel.eval('source "MLdeleteUnused.mel"; MLdeleteUnused;')
        log = u">> [delete UnusedNode] : 고아 Node 모두 제거 \n"
    except Exception as e:
        errorLog = u">> [delete UnusedNode] !! 제거실패 !!\n"
        errorLog += u">> [delete UnusedNode] 상세내용 {}\n".format(e)

    return {"deleteLog" : log ,"errorLog" : errorLog }


def kill_MalScript(List , DisableReference = True):
    deleteCount = 0
    disableCount = 0
    errorCount = 0
    deleteSt = None
    disableSt = None
    errorLog = None
    Dict = { "deleteLog" : deleteSt , "disableLog" : disableSt , "errorLog" : errorLog , "deleteCount" : deleteCount ,"disableCount" : disableCount , "errorCount" : errorCount}

    ScriptNodes = cmds.ls(List , type = "script")
    if not ScriptNodes:
        return Dict


    for node in ScriptNodes:
        if cmds.lockNode(node, q=True, lock=True)[0]:
            cmds.lockNode(node, lock=False)
        try:
            cmds.delete(node)
            deleteSt = u""
            deleteSt += u">> [kill_malwareCode] : 멀웨어코드 제거 >> {}\n" .format(node)
            deleteCount += 1
        except:
            try:
                disableSt = u"" 
                cmds.setAttr("{n}.scriptType".format(node) , 0 )
                cmds.setAttr("{n}.before".format(node) , "" , type = "string")
                cmds.setAttr("{n}.after".format(node) , "" , type = "string")
                disableSt += u">> [kill_malwareCode] : 멀웨어코드 비활성화 >> {}\n" .format(node)
                disableCount += 1
            except Exception as e:
                errorLog = u""
                errorLog += u">> [kill_malwareCode] : !! 멀웨어코드 삭제 및 비활성화 실패 !! >> {}\n" .format(node)
                errorLog += u">> [kill_malwareCode] 상세내용 : {}\n" .format(e)
                errorCount += 1
    Dict = { "deleteLog" : deleteSt , "disableLog" : disableSt , "errorLog" : errorLog , "deleteCount" : deleteCount ,"disableCount" : disableCount , "errorCount" : errorCount}

    return Dict

def get_skinWeights(Target_skinCluster, operator=None, threshold=0.001):
    if cmds.objectType(Target_skinCluster) != "skinCluster":
        raise ValueError(">> Invalid Input. Expected a 'skinCluster' type.")
    
    #데이터 수집 시작
    Dicts = {}
    connect_geos = cmds.skinCluster(Target_skinCluster, query=True, geometry=True)
    if connect_geos :
        connect_geos = [x for x in connect_geos if  cmds.objectType(x) == "mesh"]
        Jnts = cmds.skinCluster(Target_skinCluster, query=True, influence=True)
        for shp in connect_geos:
            vtx_count = cmds.polyEvaluate(shp, vertex=True)
            for i in range(vtx_count):
                vtx = "{}.vtx[{}]".format(shp, i)
                skinData = {} # 버텍스마다 초기화
                val = cmds.skinPercent(Target_skinCluster, vtx, query=True, value=True)

                if not val:
                        continue

                for Jnt, w in zip(Jnts, val):
                    is_match = False
                    
                    if operator is None: # 조건 없으면 무조건 통과
                        is_match = True
                    elif operator == '<' and w < threshold:
                        is_match = True
                    elif operator == '<=' and w <= threshold:
                        is_match = True
                    elif operator == '>' and w > threshold:
                        is_match = True
                    elif operator == '>=' and w >= threshold:
                        is_match = True
                    elif operator == '==' and abs(w - threshold) < 0.00001:
                        is_match = True
                    
                    if is_match and not w == 0.0:
                        skinData[Jnt] = w
                #조건에 맞는 데이터가 하나라도 있을 때만 Dicts에 추가
                if skinData:
                    Dicts[vtx] = skinData
    return Dicts

def clean_skining( targetSkinCluster , dicts , threshold=0.001 , raiseBool = False):
    Dict = {}
    st =u""
    IsDone = False
    if not cmds.objectType(targetSkinCluster) == "skinCluster":
        if raiseBool:
            raise ValueError(">> Invalid Input. Expected a 'skinCluster' type.")
        else:
            return
    if not isinstance(dicts , dict):
        if raiseBool:
            raise ValueError(">> Invalid Input. Expected a 'dicts' type.")
        else:
            return
    Total = 0
    try:
        for vtx , w_info in dicts.items():
            for jnt , w in w_info.items():
                if not w == 0.0:
                    Total+=1
        vtxCount = 0
        for vtx , w_info in dicts.items():
            tv_list = []
            for jnt , w in w_info.items():
                #GetValue = cmds.skinPercent(targetSkinCluster , vtx , query=True, value=True)
                #print (jnt , GetValue)
                if w == 0.0:
                    continue
                else:
                    if w <= threshold :
                        tv_list.append((jnt, 0.0) )
                        cmds.skinPercent(targetSkinCluster , vtx , transformValue= tv_list , normalize=1)
                        vtxCount += 1
                        st +="processing... workingTotal :({}/{}), currentWork : {}={}\n" .format(vtxCount , Total , vtx , jnt)
                        
        st +="Done"
        IsDone = True
    except:
        IsDone = False
    return IsDone , st




class DesignerUI(QtWidgets.QDialog):
    def __init__(self , parent = None):
        super(DesignerUI ,self).__init__(parent) 

        self._Pattern = None
        self._Hierarchy = False

        self._SearchTypes = None
        self._skinThreshold = None

        self._SaveType = None
        self._SaveFormat = None
        self._SaveRun = None
        self._SaveAsName = None

        self._IsKillMalwave = None
        self._IsDeleteScriptJob = None
        self._IsDeleteUnusedNodes = None
        self._IsDeleteOrphanShapes = None
        self._IsCleanUpSkinWeight = None

        self._IsCleanUserSetUp = None
        self._IsDelete_Bad_maya_secure = None

        #--
        self._workDone = None
        self._successCount = None
        self._errorCount = None

        #--"maya_secure_system", "MayaSecureSystem"
        self._mel_keyword =  ["IGPUCS" , "youngsunnyeye_IGPUCS"  , "breed_gene" , "vaccine_gene" , 'sysytenasdasdfsadfsdaf_dsfsdfaasd', 'PuTianTongQing', 'daxunhuan' , "fuckVirus" , "maya_secure_system" , "MayaSecureSystem" , "leukocyte"]
        self._malwareNames = [ "*{}*" .format(x) for x in self._mel_keyword]
        #--


        # 1. UI 파일 로드
        self.init_ui(current_uiAbsPath)
        self.connect_widget()
        self.load_settings()
        self.get_Hierarchy() 
        self.get_Pattern() 


    def closeEvent(self, event):
        self.save_settings() # 닫기 전에 저장 함수 호출
        super(DesignerUI, self).closeEvent(event)
    def save_settings(self):
        settings = {}
        
        # 1. 텍스트 필드 (LineEdit)
        settings["search_text"] = self.ui.SearchLE.text()
        settings["except_text"] = self.ui.ExceptLE.text()
        settings["orphan_text"] = self.ui.OrphanMeshsLE.text()
        settings["save_name"] = self.ui.SaveAsNameLE.text()
        settings["other_text"] = self.ui.DeleteOtherTE.toPlainText()

        # 2. 숫자 필드 (SpinBox)
        settings["skin_threshold"] = self.ui.skinThresholdDSB.value()

        # 3. 체크박스 (CheckBox) - True/False 저장
        settings["hierarchy"] = self.ui.HierarchyCB.isChecked()
        settings["del_orphan_shp_cb"] = self.ui.Delete_OrphanShapes_CB.isChecked() # 멀웨어
        settings["del_script_job"] = self.ui.Delete_ScriptJob_CB.isChecked()
        settings["del_unused"] = self.ui.Delete_unusedNodes_CB.isChecked()
        settings["del_orphan_real"] = self.ui.deleteOrphanShpCB.isChecked() # 진짜 고아쉐입
        settings["clean_skin"] = self.ui.CleanUp_SkinWeight_CB.isChecked()
        settings["del_other"] =self.ui.DeleteOther_CB.isChecked()

        settings["del_mayaSecureSys"] = self.ui.Delete_mulwareFile_CB.isChecked()
        settings["clean_useSetUp"] = self.ui.CleanUserSetUp_CB.isChecked()

        # 4. 라디오 버튼 (RadioButton)
        settings["ma_type"] = self.ui.maType_RB.isChecked()
        settings["mb_type"] = self.ui.mbType_RB.isChecked()
        settings["save_type"] = self.ui.SaveType_RB.isChecked()
        settings["save_as_type"] = self.ui.SaveAsType_RB.isChecked()

        # JSON 파일로 저장
        try:
            with open(setting_json_path, 'w') as f:
                json.dump(settings, f, indent=4)
            print(">> [설정 저장] : settings.json 저장 완료")
        except Exception as e:
            print(">> [설정 저장 실패] : {}".format(e))
    def load_settings(self):
        if not os.path.exists(setting_json_path):
            return # 파일 없으면 패스

        try:
            with open(setting_json_path, 'r') as f:
                settings = json.load(f)

            # .get("키이름", 기본값) 을 써야 키가 없어도 에러가 안남
            
            # 1. 텍스트 복구
            self.ui.SearchLE.setText(settings.get("search_text", ""))
            self.ui.ExceptLE.setText(settings.get("except_text", ""))
            self.ui.OrphanMeshsLE.setText(settings.get("orphan_text", ""))
            self.ui.SaveAsNameLE.setText(settings.get("save_name", ""))
            self.ui.DeleteOtherTE.setPlainText(settings.get("other_text", ""))

            # 2. 숫자 복구
            self.ui.skinThresholdDSB.setValue(settings.get("skin_threshold", 0.001))

            # 3. 체크박스 복구
            self.ui.HierarchyCB.setChecked(settings.get("hierarchy", False))
            self.ui.Delete_OrphanShapes_CB.setChecked(settings.get("del_orphan_shp_cb", False))
            self.ui.Delete_ScriptJob_CB.setChecked(settings.get("del_script_job", False))
            self.ui.Delete_unusedNodes_CB.setChecked(settings.get("del_unused", False))
            self.ui.deleteOrphanShpCB.setChecked(settings.get("del_orphan_real", False))
            self.ui.CleanUp_SkinWeight_CB.setChecked(settings.get("clean_skin", False))
            self.ui.DeleteOther_CB.setChecked(settings.get("del_other", False))

            self.ui.Delete_mulwareFile_CB.setChecked(settings.get("del_mayaSecureSys", False))
            self.ui.CleanUserSetUp_CB.setChecked(settings.get("clean_useSetUp", False))

            # 4. 라디오 버튼 복구
            self.ui.maType_RB.setChecked(settings.get("ma_type", False))
            self.ui.mbType_RB.setChecked(settings.get("mb_type", True)) # 기본값 mb
            self.ui.SaveType_RB.setChecked(settings.get("save_type", False))
            self.ui.SaveAsType_RB.setChecked(settings.get("save_as_type", False))

            print(">> [설정 로드] : 이전 설정을 불러왔습니다.")

        except Exception as e:
            print(">> [설정 로드 실패] : {}".format(e))

    def normalOutputWritten(self, text):

        cursor = self.ui.LogTE.textCursor()
        cursor.movePosition(QtGui.QTextCursor.End)
        cursor.insertText(text)
        self.ui.LogTE.setTextCursor(cursor)
        self.ui.LogTE.ensureCursorVisible()

    def errorOutputWritten(self, text):
        cursor = self.ui.LogTE.textCursor()
        cursor.movePosition(QtGui.QTextCursor.End)
        
        # 빨간색 꾸미기
        fmt = QtGui.QTextCharFormat()
        fmt.setForeground(QtGui.QColor("red"))
        cursor.setCharFormat(fmt)
        
        cursor.insertText(text)
        self.ui.LogTE.setTextCursor(cursor)
        self.ui.LogTE.ensureCursorVisible()

    def init_ui(self , path):
        if not os.path.exists(path):
            print (r">> [진행 실패] : ui정보 명확하지않음")
            return
        f = QtCore.QFile(path)
        f.open(QtCore.QFile.ReadOnly) 
        loader = QtUiTools.QUiLoader()
        self.ui = loader.load(f , parentWidget=self)
        f.close()

        layout = QtWidgets.QVBoxLayout(self)
        layout.setContentsMargins(0, 0, 0, 0) 
        layout.addWidget(self.ui)
        
        self.setWindowFlags(QtCore.Qt.Window)
        self.setWindowTitle("StandTool")
        self.resize(self.ui.size())

    def show_context_menu(self , Qwidget,  pos):
        menu = QtWidgets.QMenu(self)
        if version >= 2025:
            # Maya 2025 (PySide6) -> QtGui에 있음
            delete_act = QtGui.QAction("제거", self)
        else:
            # Maya 2024 이하 (PySide2) -> QtWidgets에 있음
            delete_act = QtWidgets.QAction("제거", self)
        delete_act.triggered.connect(lambda : self._delete_QwidgetItems(Qwidget))
        menu.addAction(delete_act)
        globalPos = Qwidget.mapToGlobal(pos)
        if version >= 2025:
            getattr(menu, "exec")(globalPos)
        else:
            menu.exec_(globalPos)

            
    def connect_widget(self):
        # 괄호 없는지 확인!
        self.ui.SearchLE.textChanged.connect(self.get_Pattern) 
        self.ui.ExceptLE.textChanged.connect(self.get_Pattern)
        self.ui.HierarchyCB.stateChanged.connect(self.get_Hierarchy) 

        self.ui.PathList.setAcceptDrops(True)
        self.ui.PathList.installEventFilter(self)
        self.ui.PathList.customContextMenuRequested.connect(lambda pos :self.show_context_menu(self.ui.PathList, pos))
        self.ui.resetBtn.clicked.connect(lambda : self.reset_listWidget(self.ui.PathList))
        self.ui.RunBtn.clicked.connect(self.funcRun)
        #self.ui.pushButton.clicked.connect(self.test)


    # ------------------------------------------------------------------
    def saveFormat(self , Path):
        if self.ui.maType_RB.isChecked():
            self._SaveType = "mayaAscii"
            self._SaveFormat = ".ma"
        if self.ui.mbType_RB.isChecked():
            self._SaveType = "mayaBinary"
            self._SaveFormat = ".mb"
        

        if self._SaveFormat:
            SaveNames = self.ui.SaveAsNameLE.text()
            if not "{fileName}" in SaveNames:
                SaveNames = "{fileName}"
            FileName , ext = os.path.splitext(Path)
            SaveNames = SaveNames.format(fileName = FileName)
            #print (">> ", SaveNames)
            
            self._SaveAsName = SaveNames + self._SaveFormat

    def clean_userSetUp(self , delete_KeyWords = ["maya_secure_system", "MayaSecureSystem" ]):
        count = 0
        errorCount = 0
        log = None
        errorlog = None


        user_scripts_dir = cmds.internalVar(userScriptDir=True)
        user_setup_path = os.path.join(user_scripts_dir, "userSetup.py")

        if not os.path.exists(user_setup_path):
            log = u""
            log += u">> [clene userSetUp] : userSetup.py 존재하지않음 \n"
            count +=1
            Log_data = {"deleteLog" : log ,"errorLog" : errorlog , "deleteCount" : count , "errorCount" : errorCount }
            return Log_data
        try:
            with io.open(user_setup_path, "r", encoding="utf-8") as f:
                lines = f.readlines()
            
            # 키워드가 포함되지 않은 줄만 필터링
            new_lines = [line for line in lines if not any(key in line for key in delete_KeyWords)]
            
            if len(lines) == len(new_lines):
                log = u""
                log += u" >>  [clene userSetUp] : userSetup.py에서 제거할 악성 코드를 발견하지 못했습니다.\n"
            else:
                with open(user_setup_path, "w", encoding="utf-8") as f:
                    f.writelines(new_lines)
                log = u""
                log += u">> [clene userSetUp] : 문제되는 코드제거 완료 \n"
            count +=1
        except Exception as e:
            errorlog = u""
            errorlog += ">> [clene userSetUp] : !! 제거 실패 !! \n"
            errorlog += u"   상세 에러: {}\n".format(text_type(e))
            errorCount +=1
        Log_data = {"deleteLog" : log ,"errorLog" : errorlog , "deleteCount" : count , "errorCount" : errorCount }
        return Log_data
    
    def kill_malware_module_files(self , target_file="maya_secure_system.py"):
        log = ""
        errorlog = ""
        count = 0
        errorCount = 0

        maya_exe = sys.executable.replace('\\', '/')
        maya_root = '/'.join(maya_exe.split('/')[:-2])
        possible_dirs = [
        "{}/Python/Lib/site-packages".format(maya_root),   # Maya 2023+
        "{}/Python37/Lib/site-packages".format(maya_root), # Maya 2022
        cmds.internalVar(userScriptDir=True).replace('\\', '/') # User Scripts
        ]
        found_any = False
        for directory in possible_dirs:
            full_path = os.path.join(directory, target_file)
        
            if os.path.exists(full_path):
                found_any = True
                try:
                    os.remove(full_path)
                    log += u">> [remove malware] : 악성 파일 삭제 완료 - {0}\n".format(full_path)
                    count +=1
                except Exception as e:
                    errorlog += u">> [remove malware] : !! 삭제 실패 !! - {0}\n".format(full_path)
                    errorlog += u"   원인: {0}\n".format(text_type(e))
                    errorlog += u"   (팁: Maya를 관리자 권한으로 실행하거나 직접 해당 경로에서 삭제해야 합니다.)\n"
                    errorCount +=1
        if not found_any:
            log += u">> [remove malware] : 삭제할 악성 파일({0})이 발견되지 않았습니다.\n".format(target_file)

        Log_data = {"deleteLog" : log ,"errorLog" : errorlog , "deleteCount" : count , "errorCount" : errorCount }
        return Log_data
            
    def delete_orphanShape(self):
        typeText = self.ui.OrphanMeshsLE.text()
        count = 0
        errorCount = 0
        log = None
        errorlog = None
        
        if typeText:
            typeTextSplit = typeText.split(",")
            typeTextSplit = [x.strip() for x in typeTextSplit if x.strip()]
            self._SearchTypes = typeTextSplit
        
        if self._SearchTypes:
            works = []
            for typeString in self._SearchTypes:
                typeString = text_type(typeString)
                Shps = nonCntShapes(typeString)
                works +=Shps
            if works:
                for x in works:
                    cmds.lockNode(x, lock=False)
                    try:
                        log = u""
                        log += u">> [delete_orphan] : 제거성공 >> {}\n".format(x)
                        cmds.delete(x)
                        count +=1
                    except Exception as e:
                        errorlog = u""
                        errorlog += u">> [delete_orphan] : !! 제거실패 !! >> {}\n".format(x)
                        errorlog += u">> [delete_orphan] 상세내용 : {}\n" .format(e)
                        errorCount +=1
        else:
            log += ">> [delete_orphan] : 고아 쉐입을 찾지못했습니다\n"
        
        Log_data = {"deleteLog" : log ,"errorLog" : errorlog , "deleteCount" : count , "errorCount" : errorCount }
        return Log_data
        
    def cleanUp_skinWeight(self):
        
        log = None
        errorlog = None
        count = 0
        errorCount = 0

        skinClusters = cmds.ls(type = "skinCluster")
        for skinC in skinClusters:
            Dict = get_skinWeights(skinC)
            if Dict:
                IsDone , log = clean_skining(skinC , Dict , self.ui.skinThresholdDSB.value() )
                if IsDone:
                    log += u""
                    log += u">> [cleanUp skinWeight] : 스킨정리 완료 >> {}\n".format(skinC)
                    count +=1
                else:
                    errorlog = u""
                    errorlog += u">> [cleanUp skinWeight] : !! 스킨정리 실패 !! >> {}\n".format(skinC)
                    errorCount +=1
        Log_data = {"deleteLog" : log ,"errorLog" : errorlog , "deleteCount" : count , "errorCount" : errorCount }
        return Log_data
        
    def delete_scriptJob(self , PatternsList ):
        count = 0
        errorCount = 0
        log = None
        errorlog = None

        jobs = cmds.scriptJob(listJobs=True)
        if not jobs:
            jobs = []
        for job in jobs:
            is_infected = False
            for pattern in PatternsList :
                clean_pattern = pattern.replace('*', '')
                if clean_pattern and (clean_pattern in job):
                    is_infected = True
                    break
            if is_infected:
                try:
                    job_parts = job.split(':', 1)
                    job_id = int(job_parts[0].strip())
                    cmds.scriptJob(kill=job_id, force=True)
                    count+=1
                    log = u""
                    log += u">> [delete scriptJob] : 제거 >> {}\n".format(job )
                except:
                    errorCount +=1
                    errorlog = u""
                    errorlog += u">> [delete scriptJob] : !! 제거실패 !! >> {}\n".format(job )

        Log_data = {"deleteLog" : log ,"errorLog" : errorlog , "deleteCount" : count , "errorCount" : errorCount }  
        return Log_data
    



    
    def delete_otherNodes(self):
        count = 0
        errorCount = 0
        log = None
        errorlog = None
        SearchType = None

        workType = self.ui.DeleteOtherTE.toPlainText()
        typeTextSplit = workType .split(",")
        if typeTextSplit:
            typeTextSplit = [x.strip() for x in typeTextSplit if x.strip()]
            SearchType = typeTextSplit

        if typeTextSplit:
            for element in SearchType:
                nodes = cmds.ls("*{}*" .format(element))

                for x in nodes:
                    try:
                        cmds.lockNode(x , l = 0)
                        cmds.delete(x)
                        count +=1
                        log = u""
                        log += u">> [delete other ] : 제거 >> {}\n".format(x )
                    except Exception as e:
                        errorCount+=1
                        errorlog = u""
                        errorlog += u">> [delete other] : !! 제거에러  !!>> {}\n".format(x )
                        errorlog += u">> [delete other] 상세내용 : {}\n".format(e)
        Log_data = {"deleteLog" : log ,"errorLog" : errorlog , "deleteCount" : count , "errorCount" : errorCount }  
        return Log_data

    def funcRun(self):
        Logs = u""
        errorLogs = u""
        errorTitle = u""
        DisableLogs = ""

        successCount = 0
        errorCount = 0
        global_errorCount = 0

        self._IsKillMalwave = self.ui.Delete_OrphanShapes_CB.isChecked()
        self._IsDeleteScriptJob = self.ui.Delete_ScriptJob_CB.isChecked()
        self._IsDeleteUnusedNodes = self.ui.Delete_unusedNodes_CB.isChecked()
        self._IsDeleteOrphanShapes = self.ui.deleteOrphanShpCB.isChecked()
        self._IsCleanUpSkinWeight = self.ui.CleanUp_SkinWeight_CB.isChecked()
        self._IsDeleteOther = self.ui.DeleteOther_CB.isChecked()

        self._IsCleanUserSetUp = self.ui.CleanUserSetUp_CB.isChecked()
        self._IsDelete_Bad_maya_secure = self.ui.Delete_mulwareFile_CB.isChecked()



        self.ui.PathList.selectAll()
        Paths = self._get_Selected_QtList(self.ui.PathList)
        melware_data = None
        script_data = None
        unused_log = None
        orphan_data = None
        cleanSkin_data = None
        other_data = None
        Total = len(Paths)

        LogsList= []
        ErrorList = []
        tasks = [
            (u"멀웨어 스크립트", self._IsKillMalwave, lambda: kill_MalScript(self._malwareNames)),
            (u"멀웨어 ScriptJob", self._IsDeleteScriptJob, lambda: self.delete_scriptJob(self._malwareNames)),
            (u"멀웨어 백도어 파일", self._IsDelete_Bad_maya_secure, lambda: self.kill_malware_module_files()),
            (u"userSetup 오염", self._IsCleanUserSetUp, lambda: self.clean_userSetUp(self._mel_keyword)),
            (u"미사용 고아 노드", self._IsDeleteUnusedNodes, lambda: deleteUnusedNodes()), 
            (u"고아 쉐입(Shape)", self._IsDeleteOrphanShapes, lambda: self.delete_orphanShape()),
            (u"스킨 웨이트 찌꺼기", self._IsCleanUpSkinWeight, lambda: self.cleanUp_skinWeight()),
            (u"기타 지정 노드", self._IsDeleteOther, lambda: self.delete_otherNodes()) # DeleteOther 누락분 추가
        ]
        #tasks.append((True , sceneOpen))


        summary_report = {}

        if Paths:
            for  i , path in enumerate (Paths):
                uiconfig = None
                errorSubs = ""

                # 현재 파일에서 문제가 있었는지 체크하는 플래그
                file_has_issue = False 
                detected_issues = [] # 이 파일에서 발견된 문제 리스트
              
                Logs += u">> {}. 작업시작 : {}\n" .format( i, path)
                errorTitle = "\n>> 에러대상 파일 : {}\n" .format(path)

                if os.path.exists(path):
                    try:
                        rs_nodes = cmds.ls(type='renderSetup')
                        for node in rs_nodes:
                            cmds.lockNode(node, lock=False)
                    except:
                        pass


                    try: 
                        cmds.file(path , open = True , force = True , prompt=False , executeScriptNodes=False,loadReferenceDepth='none')
                        uiconfig =  backup_UI_Config()
                    except Exception as e:
                        errorSubs += u">> [openScene] !! 씬오픈 에러 !!\n"
                        errorSubs += u">> [openScene] 상세내용 : {}\n".format(e)
                        pass
                    
                    for task_name, Istask , task_func in tasks:
                        try:
                            res = task_func()
                            if Istask == True:

                                if res.get("deleteLog") : 
                                    Logs += res["deleteLog"]
                                if res.get("disableLog") :
                                    Logs += res["disableLog"]
                                if res.get("errorLog"):
                                    Logs += res["errorLog"]

                                task_success = res.get("deleteCount", 0) + res.get("disableCount", 0)
                                successCount += task_success


                                #successCount += res.get("deleteCount", 0)
                                #successCount += res.get("disableCount", 0)
                                if task_success > 0:
                                    file_has_issue = True
                                    detected_issues.append(task_name)

                        except Exception as e:
                            errorSubs += u">> [작업 실행 에러] 예상치 못한 오류 발생!\n"
                            errorSubs += u">> 상세내용 : {}\n".format(text_type(e))
                            #errorSubs += res.get("errorLog" , e)
                            #errorCount += 1
                    
                    restoreUiTask = restore_UI_Config(uiconfig)
                    Logs += restoreUiTask.get("deleteLog")

                    if self.ui.SaveType_RB.isChecked():
                        sceneSave(None)
                    elif self.ui.SaveAsType_RB.isChecked():
                        self.saveFormat(path)
                        sceneSave(self._SaveAsName , self._SaveType)

                    
                    if errorSubs != "":
                        global_errorCount += 1
                        errorLogs += errorTitle
                        errorLogs += errorSubs
                        detected_issues.append(u"시스템/오픈 에러 발생")
                        file_has_issue = True

                    
                    if file_has_issue:
                        summary_report[path] = detected_issues

                
                if Logs != "":
                    Logs += "____"*10 + "\n"
                    Logs += u">> [ 최종 실행 결과 ] \n"
                    Logs += u">> 총 검사 파일 : {} 개\n" .format(Total)
                    Logs += u">> 수정/삭제된 총 항목 수 : {} 개\n" .format(successCount) 
                    Logs += u">> 에러 발생 파일 수 : {} 개\n" .format(global_errorCount)
                    Logs += "____"*10 + "\n"
                Logs += u">> [ 문제 파일 요약 리포트 ] (None 모드 검사 시 유용)\n"
                
                if not summary_report:
                    Logs += u">> 모든 파일이 깨끗합니다.\n"
                else:
                    Logs += u">> 총 {}개의 파일에서 문제점/쓰레기 노드가 발견되었습니다.\n\n".format(len(summary_report))
                    for problem_path, issues in summary_report.items():
                        Logs += u"  파일 : {}\n".format(problem_path)
                        Logs += u"     - 발견 항목 : {}\n\n".format(u", ".join(issues))
                Logs += "____"*10 + "\n"
                
                print(Logs)
                    

            if errorLogs != "":
                errorLogs += "____"*10 + "\n"
                errorLogs += u">>---- 에러 발생 상세 요약 ---- <<\n"
                errorLogs += "____"*10 + "\n"
                errorLogs += u">> 에러 파일 숫자 {}/{}\n".format(global_errorCount , Total)

                print(errorLogs)


        else:
            print (">> [실행] : 작업한 경로가 없습니다.\n")

    def eventFilter(self, source, event): 
            # 1. 갱신 (패턴과 체크박스 상태를 최신으로 가져옴)
            self.get_Pattern()
            self.get_Hierarchy()

            if source == self.ui.PathList:
                # [A] 드래그 진입
                if event.type() == QtCore.QEvent.DragEnter:
                    if event.mimeData().hasUrls():
                        event.accept()
                        return True
                    else:
                        event.ignore()
                        return False

                # [B] 드롭 (Drop)
                if event.type() == QtCore.QEvent.Drop:
                    urls = event.mimeData().urls()
                    if urls:
                        file_paths = []
                        for url in urls:
                            # [수정 1] 가져오자마자 무조건 슬래시(/)로 변환! (마야/정규식 국룰)
                            local_path = url.toLocalFile().replace("\\", "/")

                            # 패턴이 있든 없든 일단 검사 시작
                            if self._Hierarchy and os.path.isdir(local_path):
                                # [상황 1] 하위 폴더 검색 (Hierarchy 체크 + 폴더임)
                                for root, dirs, files in os.walk(local_path):
                                    for file_name in files:
                                        # [수정 2] 합치고 나서도 슬래시(/)로 변환!
                                        full_path = os.path.join(root, file_name).replace("\\", "/")
                                        
                                        # 패턴 검사
                                        if self._check_path_match(full_path):
                                            file_paths.append(full_path)
                            else:
                                # [상황 2] 그냥 파일이거나, 하위검색 안 함
                                if self._check_path_match(local_path):
                                    file_paths.append(local_path)

                        # 결과 처리
                        if file_paths:
                            file_paths.sort()
                            self._add_QtList(self.ui.PathList, None, clear=True)
                            self._add_QtList(self.ui.PathList, file_paths, clear=False)
                            
                            # 로그 출력 (보기 좋게 정리)
                            print("\n")
                            for x in file_paths:
                                print(">>     path : " + text_type(x))
                            print (r">> [리스트 등록 완료]")
                        else:
                            print ("\n")
                            print(r">> [리스트 관리] : 조건에 맞는 파일이 없습니다.")
                        
                        return True
                
            return super(DesignerUI, self).eventFilter(source, event)

   # ------------------------------------------------------------------
   # [보조] 매칭 로직 분리 (코드가 너무 깊어져서 따로 뺌)
   # ------------------------------------------------------------------
   
    def _check_path_match(self, path_str):
       # 패턴이 없으면 무조건 통과
       if not self._Pattern:
           return True
           
       try:
           if re.search(self._Pattern, path_str):
               return True
       except Exception:
           pass # 정규식 에러나면 무시 (혹은 True로 해서 다 받거나)
           
       return False

    def get_Pattern(self, *args):
       #^((?!/rig/|_backup|.mayaSwatches).)*
        MainString = "^"
        SearchStr = self.ui.SearchLE.text()
        ExceptStr = self.ui.ExceptLE.text()
        if ExceptStr:
           splitExcept = ExceptStr.split(",")
           splitExcept = [x.strip() for x in splitExcept if x.strip()]
           if splitExcept :
               joinExcept = "|".join(splitExcept)
               MainString += "(?!.*({}))".format(joinExcept)
        
        MainString += ".*" 
       
       
        if SearchStr:
            MainString += SearchStr

        self.ui.PatternLE.setText(MainString)
        Pattern = self.ui.PatternLE.text()
        if Pattern:
            self._Pattern = Pattern
        if Pattern == "":
            self._Pattern = None

    def get_Hierarchy(self,*args):
       self._Hierarchy = self.ui.HierarchyCB.checkState()

    def reset_listWidget(self ,Qwidget):
       self._add_QtList(Qwidget, None)
       print ("\n")
       print (r">> [리스트 관리] : 리스트 초기화 됨")




   #------------------------------------------------------------------HelperFunc
    def _delete_QwidgetItems(self , Qwidget):

       selects = Qwidget.selectedItems()
       if not selects:
           return
       st = "\n"
       for item in selects:
           row = Qwidget.row(item)
           Qwidget.takeItem(row)
           st += ">>     path : {}\n".format(text_type(item.text()))
           del item
       print (st)
       print (r">> [리스트 관리] : 위 파일들 제거됨")

    def _selects_QwidgetItems(self, Qwidget, targetVar=None):
       selects = self._Get_Selected_QtList(Qwidget)
       selects = [x for x in selects if cmds.objExists(x)]
       if targetVar: setattr(self, targetVar, selects)
       if selects: 
           cmds.select(selects)
       else: 
           cmds.select(cl=1)

    def _get_Selected_QtList(self, list_widget):
       return [item.text() for item in list_widget.selectedItems()]
   
    def _add_QtList(self, list_widget, item_list, clear=True, align="Left"):
       if clear: 
           list_widget.clear()
       if not item_list: 
           return
       
       work_list = []
       seen = set()
       for item in item_list:
           if item not in seen:
               work_list.append(item)
               seen.add(item)

       align_flag = QtCore.Qt.AlignLeft 
       if align == "Center": align_flag = QtCore.Qt.AlignHCenter
       elif align == "Right": align_flag = QtCore.Qt.AlignRight

       for txt in work_list:
           item = QtWidgets.QListWidgetItem(text_type(txt))
           item.setTextAlignment(align_flag)
           list_widget.addItem(item)






#-------------------------------------------------------------------------------------------------Step 6




def show():
    #if __name__ == "__main__":
    try:
        print(">> [DEBUG] 메인 윈도우 생성 시작...")
        window = DesignerUI()
        
        print(">> [DEBUG] 윈도우 show() 호출...")
        window.show() # 일단 창을 띄움 (성공 확인됨)
        
        # -------------------------------------------------------
        # [로그 시스템 연결] - 창이 뜬 다음 실행
        # -------------------------------------------------------
        print(">> [DEBUG] 로그 시스템 연결 시도...")
        
        try:
            # 1. 납치범 생성
            sys.stdout = EmittingStream()
            sys.stderr = EmittingStream()
            
            # 2. 연결 (함수 이름만 깔끔하게 전달)
            sys.stdout.textWritten.connect(window.normalOutputWritten)
            sys.stderr.textWritten.connect(window.errorOutputWritten)
            
            print(">> [DEBUG] : 로그 연결 성공 (cmd -> logWidget)")
            
        except Exception as log_error:
            
            sys.stdout = sys.__stdout__
            sys.stderr = sys.__stderr__
            print(">> [경고] 로그 연결 실패. 콘솔 모드로 작동")
            print(log_error)
        # -------------------------------------------------------

        print(">> [DEBUG] 메인 루프 진입...")
        if version>=2025:
            sys.exit(getattr(sys.app, "exec")())
        else:
            sys.exit(sys.app.exec_())

    except Exception as e:
        import traceback
        traceback.print_exc()
        import time
        print(r">> [에러] 30초 뒤에 종료")
        time.sleep(30)