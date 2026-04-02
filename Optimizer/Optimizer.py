# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.OpenMayaUI as omui
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



current_path = __file__
current_folderPath = os.path.abspath(os.path.dirname(current_path))
#print (u"현재 경로 : {}" .format(current_folderPath))

##------------------------------------------------------------------------------CoreCode
def get_skinWeights(Target_skinCluster, operator=None, threshold=0.001):

    if cmds.objectType(Target_skinCluster) != "skinCluster":
        raise ValueError(">> Invalid Input. Expected a 'skinCluster' type.")
    
    
    #if not connect_geos:
    #    raise ValueError(">> Invalid Input. Obj is not in the '{}'".format(Target_skinCluster))

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

def clean_skining( targetSkinCluster , dicts , threshold=0.001):
    IsDone = False
    if not cmds.objectType(targetSkinCluster) == "skinCluster":
        raise ValueError(">> Invalid Input. Expected a 'skinCluster' type.")
    if not isinstance(dicts , dict):
        raise ValueError(">> Invalid Input. Expected a 'dicts' type.")
    
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
                        print ("processing... workingTotal :({}/{}), currentWork : {}={}" .format(vtxCount , Total , vtx , jnt))
        print ("Done")
        IsDone = True
    except Exception as e:
        print (e)
    return IsDone 

    

def nonCntShapes(Type):
    List = []
    shapes = cmds.ls(type = Type)
    for x in shapes:
        IsInCnt = cmds.listConnections(x ,s =1)
        IsOutCnt = cmds.listConnections(x ,d =1)
        
        if not IsInCnt and not IsOutCnt:
            List.append(x)
    return List





##------------------------------------------------------------------------------UiCode
def maya_main_window():
    maya_main_window_ptr = omui.MQtUtil.mainWindow()
    return wrapInstance(int(maya_main_window_ptr), QtWidgets.QWidget)

class DesignerUI(QtWidgets.QDialog):
    def __init__(self, parent=maya_main_window()):
        super(DesignerUI, self).__init__(parent)

        
        self.Meshs = []
        self.SkinData = {}

        self.setWindowTitle("OptimizerUI")
        self.init_ui()
        self.connect_widget()





    def connect_widget(self):
        self.ui.NonCntMeshFind_Btn.clicked.connect(lambda : self.function_meshList())
        self.ui.NonCntMeshClean_Btn.clicked.connect(lambda : self.function_meshList(True))
        self.ui.NonCntMesh_LW.itemSelectionChanged.connect(lambda : self._Selects_QwidgetItems(self.ui.NonCntMesh_LW , "Meshs"))
        self.ui.NonCntMeshDelete_Btn.clicked.connect(lambda : self.function_delete_meshs())
        self.ui.WeightOptimizerFind_Btn.clicked.connect(lambda : self.function_skinClusterList())
        self.ui.WeightOptimizerClean_Btn.clicked.connect(lambda : self.function_skinClusterList( True))

        self.ui.WeightOptimizer_LW.itemSelectionChanged.connect(lambda : self.function_selects_skinData())

        
        self.ui.WeightOptimizer_Btn.clicked.connect(lambda : self.function_optimizing_skinData())

    def function_skinClusterList(self  , clear = False):
        threshold = self.ui.WeightOptimizer_DSB.value()
        SkinCluters = cmds.ls(type = "skinCluster")
        optimizingSkins = []
        if SkinCluters:
            for x in SkinCluters:
                if cmds.referenceQuery(x , isNodeReferenced=True) == False:
                    #print (">>>" , x)
                    skinData = get_skinWeights(x , "<=" , threshold)
                    Total = 0 
                    for vtx , w_info in skinData.items():
                        for jnt , w in w_info.items():
                            if not w == 0.0:
                                Total+=1
                    #Total = len(skinData.keys())
                    if Total >0 :
                        showingData = "{}: (total =  {})" .format(x , Total)
                        self.SkinData[x] = skinData
                        optimizingSkins.append(showingData)
            self._Add_QtList(self.ui.WeightOptimizer_LW ,optimizingSkins )
            self.ui.WeightOptimizerTotal_SB.setValue(len(self.SkinData))
        if clear :
            self._Add_QtList(self.ui.WeightOptimizer_LW , [] , True)
            self.SkinData = {}
            self.ui.WeightOptimizerTotal_SB.setValue(len(self.SkinData))

    def function_selects_skinData(self , SelectAll = False):
        #isSelects = False
        selects=[]
        reselts = []
        if self.SkinData:
            
            if SelectAll == False:
                selects = self._Get_Selected_QtList(self.ui.WeightOptimizer_LW)

            else: 
                self.ui.WeightOptimizer_LW.selectAll()
                selects = self._Get_Selected_QtList(self.ui.WeightOptimizer_LW)

            
            #isSelects = all( self.SkinData[x] for x in selects)
            for x in selects:
                SplitItem = x.split(":")[0]
                isValueData = self.SkinData.get(SplitItem)
                if isValueData is None or cmds.objExists(SplitItem) == False:
                    item = self.ui.WeightOptimizer_LW.findItems(x , QtCore.Qt.MatchExactly)
                    row = self.ui.WeightOptimizer_LW.row(item[0])
                    
                    self.ui.WeightOptimizer_LW.takeItem(row)
                    print (">>> {} is None" .format(SplitItem))
                    continue

                reselts.append(x.split(":")[0])




            if reselts:
                cmds.select(reselts)
                self.ui.WeightOptimizerTotal_SB.setValue(self.ui.WeightOptimizer_LW.count())


    def function_optimizing_skinData(self):
        threshold = self.ui.WeightOptimizer_DSB.value()
        BatchSize = int( self.ui.WeightOptimizerBatch_DSB.value())
        Range = 0 
        resultItems = []
        selected_items = self._Get_Selected_QtList(self.ui.WeightOptimizer_LW)

        if selected_items:
            resultItems = selected_items
        else:
            if BatchSize == 0:
                self.function_selects_skinData(True)
                resultItems = self._Get_Selected_QtList(self.ui.WeightOptimizer_LW)
            else:
                total_count = self.ui.WeightOptimizerTotal_SB.value()

                for row in range(BatchSize):
                    if row < total_count:
                        print (row)
                        item = self.ui.WeightOptimizer_LW.item(row)
                        item.setSelected(True)

                resultItems = self._Get_Selected_QtList(self.ui.WeightOptimizer_LW)

        
        if resultItems:
            #pprint.pprint(resultItems)
            #splitItems = [x.split(":")[0] for x in resultItems]
            #pprint.pprint(splitItems)

            for  x in resultItems:
                splitItem = x.split(":")[0]
                isValueData = self.SkinData.get(splitItem)
                if isValueData:
                    Process = clean_skining(splitItem ,self.SkinData[splitItem] )
                    if Process:
                        self.SkinData.pop(splitItem , None)
                        item = self.ui.WeightOptimizer_LW.findItems(x , QtCore.Qt.MatchExactly)
                        row = self.ui.WeightOptimizer_LW.row(item[0])
                    
                        self.ui.WeightOptimizer_LW.takeItem(row)
                        self.ui.WeightOptimizerTotal_SB.setValue(self.ui.WeightOptimizer_LW.count())


    ## --------------Orphan Mesh Code
    def function_meshList(self  , clear = None):
        
        Meshs = nonCntShapes("mesh")
        Meshs = cmds.ls(Meshs , long=1)

        if Meshs and clear is None:
            #self.ui.NonCntMesh_LW
            self._Add_QtList(self.ui.NonCntMesh_LW , Meshs )
            self.ui.NonCntMeshTotal_SB.setValue(len(Meshs))

        if clear:
            self._Add_QtList(self.ui.NonCntMesh_LW , [] , True)
            self.ui.NonCntMeshTotal_SB.setValue(len(Meshs))



    def function_delete_meshs(self ):
        if self.Meshs:
            cmds.delete(self.Meshs)
            self.function_meshList()
        else:
            GetData = self._Get_QtListItems(self.ui.NonCntMesh_LW)
            if GetData:
                GetData = [x for x in GetData if cmds.objExists(x)]
                cmds.delete(GetData)
                self.function_meshList(True)





    def init_ui(self):
        Ui = "Optimizer.ui"
        Ui_path = os.path.join(current_folderPath, Ui)

        if not os.path.exists(Ui_path):
            raise ValueError(u">> {} 경로에 {}가 없습니다.".format(current_folderPath, Ui))

        
        f = QtCore.QFile(Ui_path)
        f.open(QtCore.QFile.ReadOnly)
        loader = QtUiTools.QUiLoader()
        
        # 주의: parentWidget을 self로 바로 주지 말고, 변수로 받습니다.
        self.ui = loader.load(f, parentWidget=None) 
        f.close()

        # 2. [핵심] 레이아웃 생성 및 UI 삽입
        # self(현재 창)에 수직 레이아웃을 만듭니다.
        main_layout = QtWidgets.QVBoxLayout(self)
        
        # 여백을 0으로 해야 딱 맞게 들어갑니다.
        main_layout.setContentsMargins(0, 0, 0, 0) 
        
        # 불러온 UI 위젯을 레이아웃에 추가합니다.
        main_layout.addWidget(self.ui)
        
        # 3. 윈도우 설정 (사이즈 조절 가능하게)
        # Window 플래그를 주면 최소화/최대화 버튼이 생기고 리사이즈가 자유로워집니다.
        self.setWindowFlags(QtCore.Qt.Window)


    ###------------------------------------------------------------------------------HelperCode
    def _Selects_QwidgetItems(self, Qwidget , targetVar = None ):
        selects = self._Get_Selected_QtList(Qwidget)
        selects = [x for x in selects if cmds.objExists(x)]
        #self.Meshs = selectsMeshs
        if targetVar:
            setattr(self , targetVar ,selects )

        if selects:
            cmds.select(selects)
        else:
            cmds.select(cl =1)

    def _Get_QtListItems(self,QList):
        lst = []
        lst = [QList.item(i).text() for i in range(QList.count())]
        return lst

    def _Get_Selected_splitQtList(self, list_widget , SplitItem = ":" , index = 0 ):
            
        """
        QListWidget에서 선택된 아이템의 텍스트들을 리스트로 반환합니다.
        """
        selected_objects = list_widget.selectedItems()
        text_list = [str(item.text()).split(SplitItem )[index] for item in selected_objects]
        
        
        return text_list


    def _Get_Selected_QtList(self,list_widget):
        """
        QListWidget에서 선택된 아이템의 텍스트들을 리스트로 반환합니다.
        """
        selected_objects = list_widget.selectedItems()
        text_list = [item.text() for item in selected_objects]
        
        return text_list

    def _Add_QtList(self,list_widget, item_list, clear=True, align="Left"):
        """
        QListWidget에 아이템을 추가하는 함수
        :param list_widget: 대상 QListWidget
        :param item_list: 추가할 문자열 리스트
        :param clear: 기존 리스트 초기화 여부
        :param align: 정렬 방향 ("Left", "Center", "Right")
        """
        
        # 1. 초기화
        if clear:
            list_widget.clear()

        if not item_list:
            return

        ## 2. 중복 제거 (순서 유지 + 고속 처리)
        ## Python 3.7+ 에서는 이 방법이 가장 빠르고 순서도 지켜집니다.
        work_list = list(dict.fromkeys(item_list))

        # 3. 정렬 설정 (기본값: 왼쪽)
        align_flag = QtCore.Qt.AlignLeft # 기본값
        
        if align == "Center":
            align_flag = QtCore.Qt.AlignHCenter
        elif align == "Right":
            align_flag = QtCore.Qt.AlignRight

        # 4. 아이템 추가
        for txt in work_list:
            # 문자열로 변환하여 아이템 생성
            item = QtWidgets.QListWidgetItem(str(txt))
            
            # 정렬 적용
            item.setTextAlignment(align_flag)
            
            # 위젯에 추가
            list_widget.addItem(item)
            

def show():
    OptimizerUI = DesignerUI()
    OptimizerUI.show()

