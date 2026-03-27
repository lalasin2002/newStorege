# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import google.generativeai as genai
import sys , os ,re ,json ,io ,time
from PySide6 import QtWidgets, QtCore, QtUiTools , QtGui
from PySide6.QtWidgets import QApplication, QFileDialog



def pathAppend(log = True):
    # __file__ 현재 작업중인 파일 위치
    #os.path.dirname (경로)의 메인폴더 위치
    st = u"-----"*2 + "{}" + u"-----"*2 +"\n"
    st = st.format("pathAppend")
    CurrentDir = os.path.dirname(os.path.abspath(__file__))
    if not CurrentDir in sys.path:
        sys.path.append(CurrentDir)
        st+= "sys.path 등록 : {}\n".format(CurrentDir)
    else:
        st+= "sys.path 이미등록됨 : {}\n".format(CurrentDir)

    if log:
        print (st)
pathAppend()
import gemini_server #같은 폴더 mayaMCP 임으로
from mcpTool import objectTransform  #mayaMCP/mcpTool임으로 



#---------------------------------------------------------기본설정 prev데이터 로드 

version = 2020

api = None
curentPath = os.path.dirname(os.path.abspath(__file__))
jsonPath = os.path.join(curentPath , "_prev.json")
uiPath =os.path.join(curentPath , "mayaMCP.ui")


class ai_worker(QtCore.QThread):
    """
    AI API 통신을 백그라운드에서 처리하여 UI 멈춤을 방지하는 스레드 클래스
    """
    # 스레드 작업 완료 시 데이터를 전달할 시그널 정의
    finished_signal = QtCore.Signal(str , list)
    error_signal = QtCore.Signal(str)
    
    def __init__(self, order, api_key, model, tool_list, user_prompt , history):
        """
        AI_Worker 초기화 및 통신에 필요한 변수 할당
        Args:
            -order       (str): 사용자 질문 내용
            -api_key     (str): 제미나이 API 키
            -model       (str): 선택된 AI 모델명
            -tool_list   (list): AI가 사용할 툴 리스트
            -user_prompt (str): 시스템 프롬프트(사전 설정)
        Returns:
            없음(None)
        """
        super(ai_worker, self).__init__()
        self.order = order
        self.api_key = api_key
        self.model = model
        self.tool_list = tool_list
        self.user_prompt = user_prompt
        self.history = history
    def run(self):
        """
        스레드가 시작되면 별도의 백그라운드 환경에서 실행되는 메인 로직
        Args:
            없음
        Returns:
            없음(None)
        """
        try:
            # 시간이 오래 걸리는 서버 요청을 여기서 처리 (UI는 멈추지 않음)
            ask , history = gemini_server.request_to_ai(
                self.order, self.api_key, self.model, self.tool_list, self.user_prompt ,self.history
            )
            # 작업이 성공적으로 끝나면 메인 UI로 결과값을 쏘아 보냄
            self.finished_signal.emit(ask , history)
        except Exception as e:
            # 에러 발생 시 에러 메세지를 메인 UI로 보냄
            self.error_signal.emit(str(e))




class mayaMCP_UI(QtCore.QObject):
    """
    gemini 채팅 UI 구성
    """
    def __init__(self, uiPath ):
        super(mayaMCP_UI, self).__init__()
        self.ui = None
        self.apiKey = None
        self.version = None
        self.model = None
        self.modelList = None
        self.jsonPath = None
        self.userPrompt = None

        self.base_string = None
        self.currentOrder = None
        self.aiMsg = None
        self.toolList = None
        self.threadWorker = None
        self.history = None 


        try:
            self.base_string = basestring
        except NameError:
            self.base_string = str

        self.load_ui( uiPath )
        if self.ui:
            self.connect_widget()
            # Event 메서드
            self.ui.userMsg_Pte.installEventFilter(self)
            self.ui.installEventFilter(self)
    def load_ui(self , uiPath):
        """
        UI 파일을 읽어와 self.ui에 인스턴스화
        Args:
            -uiPath (str): 로드할 UI 파일 경로
        Returns:
            없음(None)
        """
        isUiPath = os.path.exists(uiPath)
        if not isUiPath:
            print (u"에러 : ui 경로를 찾을 수 없음")
            return
        
        #QtCore.QFile = ui를 지정하기 위한 __init__ 클래스
        uiFile = QtCore.QFile(uiPath)

            # 읽기 전용으로 열어보기
        if not uiFile.open(QtCore.QFile.ReadOnly): 
            print (u"에러 : ui 파일을 열수없습니다.")
            return
        
        # ui XML 코드를 QUiLoader으로 재구성(코드에 맞게)
        Loader = QtUiTools.QUiLoader()
        self.ui = Loader.load(uiFile)

        # 재구성이후 닫기(생성완료)
        uiFile.close()



    def connect_widget(self):
        """
        UI 위젯들의 시그널과 슬롯(메서드) 연결
        Args:
            없음
        Returns:
            없음(None)
        """
        
        self.ui.reLoad_apiModel_Btn.clicked.connect(lambda : self.get_api_models(self.ui.apiKey_Le.text()))
        self.ui.userMsg_Btn.clicked.connect(self.process_chat)




    def get_apiData(self ,jsonPath ):
        """
        이전 세팅값(json) 불러오기
        Args:
            -jsonPath (str): json 파일 경로
        Returns:
            없음(None)
        """
        _prevData = None
        if os.path.exists(jsonPath):
            try:
                with open(jsonPath , "r", encoding='UTF-8-sig') as jsonFile:
                    _prevData = json.load(jsonFile)
            except Exception as e:
                print (u"_prev데이터 확인불가 : {}" .format(e))
        
            self.jsonPath = jsonPath

        if _prevData:
            self.version = _prevData.get("version")
            self.apiKey = _prevData.get("apiKey")
            self.model = _prevData.get("defaultModel")
            self.modelList = _prevData.get("modelList")
            self.userPrompt = _prevData.get("userPrompt")




    def set_apiData(self):
        """
        불러온 세팅값을 UI 위젯에 반영
        Args:
            없음
        Returns:
            없음(None)
        """
        if self.apiKey:
            self.ui.apiKey_Le.setText(self.apiKey)
        if self.modelList:
            self.ui.select_ApiModel_CBb.addItems(self.modelList)
        if self.model:
            self._set_comboText(self.ui.select_ApiModel_CBb ,self.model )
        if self.userPrompt:
            self.ui.aiUserPrompt_Pte.setPlainText(self.userPrompt)

            



    def get_api_models(self , api):
        """
        제미나이 서버에서 사용 가능한 모델 리스트 호출
        Args:
            -api (str): 구글 제미나이 API 키
        Returns:
            없음(None)
        """
        modelList = []
        isApi = isinstance(api , self.base_string)
        
        if isApi:
            try:
                print (u"제미나이 모델 목록을 서버에서 불러오는 중...")
                genai.configure(api_key=api)
                #genai.list_models():
                modelList =[ x.name.replace("models/", "") for x in genai.list_models() if 'generateContent' in x.supported_generation_methods ]

                if modelList:
                    modelList.sort()
                    self.ui.select_ApiModel_CBb.clear()
                    self.ui.select_ApiModel_CBb.addItems(modelList)
                    print ("self.model : " , self.model)
                    if self.model:
                        self._set_comboText(self.ui.select_ApiModel_CBb ,self.model )

                    print (u"모델 목록 업데이트 완료.")


            except Exception as e:
                print (u"모델 목록 로드 에러 : {}".format(e))
        else:
            print (u"API의 문자열이 아닙니다.")

    def get_toolModule(self , List):
        """
        AI가 사용할 도구 목록 정리
        Args:
            -List (list, tuple, str, callable): 추가할 툴 이름, 함수 또는 리스트
        Returns:
            없음(None)
        """
        toolList = []
        
        # 리스트나 튜플 형태로 여러 개가 들어오면 풀어서 넣음
        if isinstance(List, (list, tuple)):
            toolList.extend(List)
        # 단일 함수나 문자열이면 그냥 리스트에 하나 추가함
        else:
            if List: # List가 비어있지 않은 경우에만
                toolList.append(List)
        
        self.toolList = toolList
        print (u"툴 리스트 등록 완료: {}".format(self.toolList))

    def process_chat(self):
        """
        사용자 입력부터 AI 통신 시작까지의 일련의 과정 처리
        Args:
            없음
        Returns:
            없음(None)
        """
        user_text = self.ui.userMsg_Pte.toPlainText().strip()
        if not user_text:
            return

        # 사용자 메세지
        self.send_meg(user_text, joiner_str=u"User", align="right", color="#FFFFFF", clean=True)
        #print ("유저 응답" , self.apiKey)
        
        # 명령(process_chat) -> 파견 세팅 및 출발(send_request_ai) -> 백그라운드 서버 통신 대기 -> 귀환 후 UI 업데이트(receive_ai_msg / error)
        self.send_request_ai(self.currentOrder)
        #print ("진행")


    def send_request_ai(self , order ):
        """
        워커 스레드를 생성하여 gemini 서버로 통신 작업을 넘김
        Args:
            -order (str): 사용자 질문 내용
        Returns:
            없음(None)
        """
        ask = None
        self.apiKey = self.ui.apiKey_Le.text()
        self.model = self.ui.select_ApiModel_CBb.currentText()
        self.userPrompt = self.ui.aiUserPrompt_Pte.toPlainText()


        if not self.toolList:
            self.aiMsg = (u"-----"* 2 + u"ai 가 쓸 tool이 없습니다" + u"-----"* 2)
            self.send_meg(self.aiMsg , "system" ,"center", "#7a7a7a" )
            return
        
        if not order or not isinstance(order , self.base_string):
            self.aiMsg = (u"-----"* 2 + u"사용자의 메세지가 없습니다" + u"-----"* 2)
            self.send_meg(self.aiMsg , "system" ,"center", "#7a7a7a" )
            return


        print ("send_request_ai" , u"통신시작")
        # 응답 될때까지 비활성화
        self.ui.userMsg_Pte.setEnabled(False)
        self.ui.userMsg_Btn.setEnabled(False)

        
        thread_mag = u"-----"* 2+ u"ai 응답대기 중"  + u"-----"*2
        self.send_meg(thread_mag , "system" ,"center", "#7a7a7a" )
        self.threadWorker = ai_worker(order , self.apiKey ,self.model , self.toolList , self.userPrompt , self.history )

        # 응답 (finished_signal , error_signal) 시 활성화 연결 , self.receive_ai_msg작동하는게 아닌 신호가 울리면(인자 X)
        self.threadWorker.finished_signal.connect(self.receive_ai_msg)
        self.threadWorker.error_signal.connect(self.receive_ai_error)

        self.threadWorker.start()# 일한다 쓰레드

    def receive_ai_msg(self , msg , history):
        """
        스레드로부터 정상적인 답변을 받았을 때 UI에 출력 및 원상복구
        Args:
            -msg (str): AI의 최종 응답 내용
        Returns:
            없음(None)
        """

        self.history = history
        print ("receive_ai_msg" , u"통신완료")
        self.send_meg(msg, joiner_str=u"AI", align="left", color="#7a7a7a", clean=False)
        self.ui.userMsg_Pte.setEnabled(True)
        self.ui.userMsg_Btn.setEnabled(True)
        self.ui.userMsg_Pte.setFocus()
        thread_mag = u"-----"* 2+ u"ai 응답 완료"  + u"-----"*2
        self.send_meg(thread_mag , "system" ,"center" )

    def receive_ai_error(self, err_msg):
        """
        스레드 통신 중 에러 발생 시 UI에 알림 및 원상복구
        Args:
            -err_msg (str): 발생한 에러 메세지
        Returns:
            없음(None)
        """
        print(u"통신에러: {}".format(err_msg))
        thread_mag = u"-----"* 2+ u"ai 응답 에러"  + u"-----"*2
        error_details = u"{}\n\nDetails:\n{}".format(thread_mag, err_msg)

        self.send_meg(error_details, joiner_str=u"system", align="center", color="#ff5555", clean=False)
        
        self.ui.userMsg_Pte.setEnabled(True)
        self.ui.userMsg_Btn.setEnabled(True)
        self.ui.userMsg_Pte.setFocus()   


    def send_meg(self, msg , joiner_str = u"User" , align = u"right" ,color = "#FFFFFF" ,clean = True):
        """
        채팅 창에 포맷팅된 메시지를 출력하고 입력창을 비웁니다.
        Args:
            -msg        (str): 사용자가 입력한 메시지 내용
            -joiner_str (str): 메시지 발신자 이름 (기본값: User)
            -align      (str): 텍스트 정렬 방향 (예: right, left)
            -color      (str): 텍스트 폰트 색상 헥사코드
            -clean      (bool): 메시지 전송 후 입력창(userMsg_Pte) 초기화 여부
        Returns:
            없음(None)
        """
        divText = u""
        isStr = isinstance(msg , self.base_string)
        if not isStr:
            print (u"잘못된 양식의 메세지입니다")
            return
        
        formatted_msg = msg.replace("\n", "<br>")
        # <p> 태그를 이용해 정렬 버그 수정
        # HTML 태그에서는 정렬(align) 속성을 완전히 뺍니다. (순수 내용과 색상만 지정)
        # QTextBrowser ::  MS 워드처럼 복잡한 구조를 가진 문서 ,문제는 정말 기본적인 것만 사용 (align 안됨)


        if joiner_str.lower() == u"system":
            html_text = u"<font color='{col}'>{m}</font>".format(
                col=color,
                m=formatted_msg
            )
        else:
            html_text = u"<font color='{col}'><b>{jnr} ::</b><br>{m}</font>".format(
                col=color,
                jnr=joiner_str,
                m=formatted_msg
            )

        if joiner_str and msg:
            cursor = self.ui.chatText_Tb.textCursor() # QTextBrowser.textCursor() = MS워드문서 구조의 편집 도구 (메모장 깜빡거리는 그 커서임)
            cursor.movePosition(QtGui.QTextCursor.End) # 커서 이동 , QTextBrowser에 쓰여진 문서의 맨마지막부분 이동 (why : 새 채팅 메시지를 추가할 때, 항상 기존 대화의 맨 마지막에 이어서 써야 하기 때문 )
            
            # QTextBrowser.document() = 채팅창이 내부적으로 가지고 있는 '워드 문서' 객체 그 자체를 의미
            # .isEmpty = 비어 있는지를 확인
            if not self.ui.chatText_Tb.document().isEmpty():

                # .insertBlock() = '\n'과 비슷해 보이지만, 실제로는 '문단 나누기'를 수행하는 구조적인 명령
                # 이게 없으면 새 메시지가 이전 문단에 달라붙어 하나의 문단이 =  "`insertBlock`이 없으면 새 메시지가 이전 문단에 합쳐져서 서식이 엉망이 된다"
                cursor.insertBlock()
                
            #.insertHtml =  텍스트 삽입
            #.insertText() 텍스트를 '있는 그대로' 삽입 => 모든 특수문자나 태그를 일반 글자로 취급
            #.insertHtml()  'HTML 문법으로 해석해서' 삽입합니다. <b>, <font>, <br> 같은 태그를 써서 삽입
            cursor.insertHtml(html_text)
            
            
            block_format = QtGui.QTextBlockFormat() # 문단을 수정하기 위한 클래스 (align)/ 일종의 스타일 규격서 역할
            if align == u"right":
                # QtGui.QTextBlockFormat() .setAlignment 메서드로 옵션 수정 / 나중에 커서가 있는 문단에 대입
                block_format.setAlignment(QtCore.Qt.AlignRight)  
            elif align == u"center":
                block_format.setAlignment(QtCore.Qt.AlignCenter)
            else:
                block_format.setAlignment(QtCore.Qt.AlignLeft)
                
            # mergeBlockFormat  = 현재 커서 문단에 QtGui.QTextBlockFormat() 설정 대입 
            cursor.mergeBlockFormat(block_format)
            
            
            self.ui.chatText_Tb.setTextCursor(cursor)
            
            if joiner_str == u"User":
                self.currentOrder = msg

        if clean:
            self.ui.userMsg_Pte.clear()

    def eventFilter(self, obj, event):
        """
        위젯에서 발생하는 이벤트를 가로채서 특정 동작 수행 (엔터키 제어)
        Args:
            -obj   (QObject): 이벤트가 발생한 대상 위젯
            -event (QEvent): 발생한 이벤트 객체
        Returns:
            이벤트 차단 여부(bool) - True일 경우 이벤트 중단
        """
        if obj == self.ui.userMsg_Pte and event.type() == QtCore.QEvent.KeyPress:

            # 눌린 키가 Enter(Return) 키인지 확인
            if event.key() == QtCore.Qt.Key_Return or event.key() == QtCore.Qt.Key_Enter:
                # Shift 키가 같이 눌렸는지 확인 (Shift + Enter는 줄바꿈 허용)
                if event.modifiers() == QtCore.Qt.ShiftModifier:
                    return False # 원래 동작(줄바꿈)을 수행하도록 통과시킴
                else:
                    # 엔터키만 눌렸다면 전송 함수 실행 후 이벤트 강제 종료 (줄바꿈 방지)

                    self.process_chat()

                    return True
        if obj == self.ui and event.type() == QtCore.QEvent.Close:
            self.save_apiData()
            return False

                
        # 지정한 이벤트가 아니라면 원래대로 작동하게 둠
        try:
            return super(mayaMCP_UI, self).eventFilter(obj, event) 
        except RuntimeError:
        # 창이 닫히는 과정에서 C++ 객체가 이미 파괴되었다면 조용히 넘어갑니다.
            return False     

    def save_apiData(self):
        """
        UI 종료 시 현재 세팅값을 JSON 파일에 덮어쓰기
        Args:
            없음
        Returns:
            없음
        """

        
        self.apiKey = self.ui.apiKey_Le.text() 
        self.model = self.ui.select_ApiModel_CBb.currentText()
        self.modelList = self._get_comboItems(self.ui.select_ApiModel_CBb)
        self.userPrompt = self.ui.aiUserPrompt_Pte.toPlainText()
        
        saveData = {"version" : self.version,
                    "apiKey" : self.apiKey ,
                    "defaultModel" : self.model,
                    "modelList"  : self.modelList,
                    "userPrompt"  : self.userPrompt
        }

        #if os.path.exists(self.jsonPath):
        try:
            with open(self.jsonPath, "w", encoding='UTF-8-sig') as jsonFile:
                json.dump(saveData, jsonFile, indent=4 ,  ensure_ascii=False)
            print (u"설정값 저장 완료: _prev.json")
        except Exception as e:
            print (u"설정값 저장 실패: {}".format(e))

    #--------------------------------------헬퍼함수

    def _get_comboItems(self,Qcombo): 
        """
        콤보박스의 모든 텍스트 아이템 가져오기
        Args:
            -Qcombo (QComboBox): 대상 콤보박스 위젯
        Returns:
            아이템 리스트(list)
        """
        return [Qcombo.itemText(i) for i in range(Qcombo.count())]

    def _set_comboText(self,Qcombo , text):
        """
        콤보박스의 현재 텍스트 지정하기
        Args:
            -Qcombo (QComboBox): 대상 콤보박스 위젯
            -text (str): 지정할 텍스트
        Returns:
            없음(None)
        """

        Qcombo.setCurrentText(text)


    def show_ui(self):
        """
        self.ui가 존재할 경우 화면에 띄우기
        Args:
            없음
        Returns:
            없음(None)
        """
        if self.ui:
            self.ui.show()




if __name__ == "__main__":
    # 스탠드얼론 QApplication으로 일종의 엔진 할당/관리자
    # sys.argv = 현재 파일 /옵션 내용
    print ("sys.argv",sys.argv )
    app = QApplication(sys.argv) 
    app.setStyle("Fusion")

    ui = mayaMCP_UI(uiPath)
    ui.get_apiData(jsonPath)
    ui.set_apiData()
    ui.get_toolModule(objectTransform)
    #ui.get_api_models(ui.apiKey)
    ui.show_ui()

    # 작동 코드 루프 , sys.exit() ui닫을때 셧다운
    # 어디를? app.exec() = 현재 경로 코딩 작동루프 를 
    sys.exit(app.exec()) 
