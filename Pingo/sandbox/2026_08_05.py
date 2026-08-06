# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om
import re , pprint


class Ikrig:
    """Maya의 RP IK 체인에 스트레치, 볼륨, 슬라이드, 폴 벡터 기능을 구성한다.

    이 클래스는 한 번에 완성된 리그를 만드는 함수가 아니라, 여러 빌드 단계를
    순서대로 호출하는 상태 기반 빌더다. 각 단계에서 생성한 Maya 노드와 속성은
    ``stretchNodeDic``, ``volumeNodeDic``, ``poleVectorStretchNodes`` 및
    ``resultNodes``에 저장되며 다음 단계에서 다시 사용된다.

    일반적인 사용 순서::

        rig = Ikrig(joints)
        rig.setAxis("Y")
        rig.setIKHandle()
        rig.setDistance(joints[0], joints[-1])
        rig.createStretchNode("Stretch", joints, rig.CurrentDistanceNode)
        rig.connectStrerchToJoint(joints[1])

    주의:
        Maya 씬의 노드를 직접 생성하고 연결하므로 undo chunk 안에서 호출하는 것이
        안전하다. 전달하는 조인트는 부모에서 자식 순서로 정렬되어 있어야 한다.
    """

    def __init__(self , Jntlist ):
        """리그 빌드에 사용할 조인트 체인과 내부 상태 저장소를 초기화한다.

        Args:
            Jntlist (list[str]): 부모에서 자식 순서로 나열한 기존 joint 노드 목록.

        Raises:
            TypeError: 목록이 아니거나 목록 안에 joint가 아닌 노드가 포함된 경우.

        Note:
            생성자 자체는 IK나 유틸리티 노드를 만들지 않는다. 마지막의
            ``defineJntlist`` 호출만 입력을 검증하고 조인트별 결과 저장 공간을 만든다.
        """
        
        self.Jntlist = None
        self.IKs = []
        self.Distances = []
        self.Root = None
        self.ScaleDefault = None
        self.ScalingMD = None
        self.CurrentDistanceNode = None
        self.CurrentIK = None
        self.resultNodes = {}
        self.poleVectorStretchNodes = {}
        self.stretchBC = None
        self.volumeBC = None
        self.stretchDistance = None
        

        self.AxisDic = {"Axis" : "X" , "axis" : "x"}
        self.AxisOtherDic = {"Axis" : ["Y" ,"Z"] , "axis" : ["y" , "z"]}

        self.IsIKstretch = False
        self.IsIKVolume = False
        self.IsPoleVector = False
        self.IsSlide = False
        self.DistanceDic = None

        self.startDT_loc = None
        self.endDT_loc = None
        self.AttrsDicList =[]

        # 전체 체인의 스트레치 비율을 계산하는 노드와 원본 데이터를 보관한다.
        # createStretchNode에서 채워지고 connectStrerchToJoint에서 소비된다.
        self.stretchNodeDic = {
            "scaleDefault" : None,
            "distance" : None,
            "distanceLentgh" : None,
            "jointList" : None,
            "jointLength": None,
            "scalingMD" : None,
            "normalMD" : None,
            "lengthCon" : None,
            "attrSR" : None,
            "stretchBC" : None 
        }

        # 스트레치 비율의 역제곱근을 이용해 횡축 볼륨을 보정하는 노드 모음이다.
        self.volumeNodeDic = {

            "jointList" : None,
            "divMD" : None,
            "powerMD" : None,
            "offsetADL" : None,
            "attrSR" : None , 
            "volumeBC" : None,
            "stretchBC" : None ,
        }

        # 폴 벡터 로케이터, annotation, 연결된 IK 핸들을 한곳에 보관한다.
        self.poleVectorDic = {
            "obj" : None,
            "shape" : None,
            "ik" : None,
            "annotation" : None,
            "annotationShape" : None
        }

        self.stretchAttrDic = {
            "attr" : None,
            "min" : None,
            "max" : None,
            "obj" : None 
        }
        self.volumeAttrDic = {
            "attr" : None,
            "offsetAttr" : None,
            "min"  : None,
            "max"  : None,
            "obj"  : None
        }
        self.poleVectorStretchAttrDic={
            "attr" : None,
            "min"  : None,
            "max"  : None,
            "obj"  : None
        }

        self.log_messages = []
        self.defineJntlist(Jntlist , True)
        

    def defineJntlist(self , Jntlist , reset = False ):
        """조인트를 내부 체인에 등록하고 조인트별 결과 노드 슬롯을 준비한다.

        Args:
            Jntlist (list[str]): 씬에 존재하는 joint 노드 목록.
            reset (bool): True면 기존 목록과 ``resultNodes``를 비운 뒤 다시 등록한다.

        등록된 각 조인트에는 스트레치 출력(MDL), 슬라이드 합산(ADL), 볼륨 출력
        등의 결과 노드를 기록할 딕셔너리가 생성된다. 이미 등록된 조인트는 건너뛴다.
        """
        if not isinstance(Jntlist, list) or not all(cmds.objectType(x) == "joint" for x in Jntlist):
            raise TypeError("Invalid input. Expected a Existed Joint list")

        if reset:
            self.Jntlist = []
            self.resultNodes = {}
            self.log("--- Joint list has been reset. ---", True)

        for jnt in Jntlist:
            # 기존 리스트에 없는 조인트만 추가합니다.
            if jnt not in self.Jntlist:
                self.Jntlist.append(jnt)
                #IsDicNode = any(y.get("Jnt") == jnt for y in self.resultNodes)
                self.resultNodes[jnt] = {
                    "MDL": None,
                    "ADL": None,
                    "Jnt": jnt,
                    "SlideAttr": None,
                    "VolumeADL": None,
                }
                #self.resultNodes.append(resultDic)
                self.log("> Joint '{}' added to the list." .format(jnt), True)
            else:
                self.log("> Joint '{}' already exists, skipping." .format(jnt), True)

    def log(self, msg, print_now=False):
        """메시지를 누적하고, 요청된 경우 Maya Script Editor에도 즉시 출력한다."""

        self.log_messages.append(msg)
        if print_now:
            print(msg)

    def _getNodeName(self, node):
        """긴 DAG 경로에서 실제 노드 이름만 반환한다."""
        return node.rsplit("|", 1)[-1]

    def _sanitizeNodeName(self, name):
        """DAG 구분자가 생성 노드 이름에 들어가지 않도록 안전하게 치환한다."""
        return name.replace("|", "_")

    def _isRegisteredJoint(self, joint):
        """표기 방식이 달라도 같은 DAG 조인트가 내부 체인에 등록됐는지 확인한다."""
        jointLongNames = cmds.ls(joint, long = True) or []
        if not jointLongNames:
            return False

        jointLongName = jointLongNames[0]
        for registeredJoint in self.resultNodes:
            registeredLongNames = cmds.ls(registeredJoint, long = True) or []
            if registeredLongNames and registeredLongNames[0] == jointLongName:
                return True
        return False

    def insertGrp(self ,target , names = [] , match = True  , keepParent = True):
        """대상 위에 지정한 이름 순서대로 transform 그룹을 삽입한다.

        Args:
            target (str): 그룹 안으로 넣을 Maya 노드.
            names (list[str]): 안쪽에서 바깥쪽 순서로 생성할 그룹 이름.
            match (bool): 대상의 월드 행렬을 새 그룹들에 적용할지 여부.
            keepParent (bool): 가장 바깥 그룹을 대상의 기존 부모 밑에 복구할지 여부.

        Returns:
            list[str]: 생성된 그룹을 안쪽에서 바깥쪽 순서로 반환한다.
        """
        Groups =[]
        isParent = None
        matrix = None
        if keepParent:
            isParent = cmds.listRelatives(target , p =1,fullPath=1 )

        if match:
            matrix = cmds.xform(target  , q =1 , ws =1 , m = 1)
        child = None
        for x in names:
            if child is None:
                child = target 

            
            grp = cmds.createNode("transform" , n = x)
            if matrix:
                cmds.xform(grp , ws =1 ,m = matrix)
            cmds.parent(child ,grp)
            Groups.append(grp)
            child = grp

        if isParent:
            cmds.parent(Groups[-1] , isParent[0])

        return Groups

    def CreateOrGet_Loc(self,obj_or_pos , Name  = "locator" , MaxWhileCount =100): #2025-06-13 추가
        """
        주어진 오브젝트나 위치값을 기반으로 로케이터를 생성하거나,
        이미 로케이터일 경우 해당 로케이터 정보를 가져옵니다.

        Args:
            obj_or_pos (str or list or tuple): 오브젝트의 이름 또는 월드 좌표값.
            Name (str): 생성될 로케이터의 기본 이름.
            MaxWhileCount (int): 고유 이름을 찾기 위해 시도할 최대 횟수.

        Returns:
            list: [로케이터 트랜스폼 노드, 로케이터 쉐잎 노드]
        """
        string_type = None
        try:
            string_type = basestring
        except NameError:
            string_type = str
        loc = None
        shape = None
        if isinstance(obj_or_pos , string_type) and cmds.objExists(obj_or_pos):
            objType = cmds.objectType(obj_or_pos)
            if objType == "locator":
                loc = cmds.listRelatives(loc, p=1, type="transform")[0]
                shape = obj_or_pos
            if objType == "transform":
                loc = obj_or_pos
                shape = cmds.listRelatives(loc, s=1, type="locator")[0]

        if Name == "" and isinstance(obj_or_pos , string_type):
            Name = loc
        count =0
        loc_name = ""
        for i in range(MaxWhileCount):
            count = str(i) if i> 0 else ""
            temp_name = "{}{}" .format(Name , count )
            if not cmds.objExists(temp_name):
                loc_name = temp_name
                break
        if not loc_name :
            raise RuntimeError("Could not generate a unique locator name for: {}{}." .format(Name , count )) #2025-06-13 추가
        
        
        if isinstance(obj_or_pos , (list , tuple) ) and not loc and not shape:
            if isinstance(obj_or_pos , tuple):
                obj_or_pos = list(obj_or_pos)

            loc = cmds.spaceLocator(n = loc_name)[0]
            shape = cmds.listRelatives(loc , s =1)[0]
            cmds.xform(loc , ws =1 , t = obj_or_pos)
        elif isinstance(obj_or_pos ,  string_type) and not loc and not shape:
            loc = cmds.spaceLocator(n = loc_name)[0]
            shape = cmds.listRelatives(loc , s =1)[0]
            cmds.delete(cmds.parentConstraint(obj_or_pos , loc , mo = 0))

        return [loc ,shape]
    def Create_Distance(self ,startObj_or_pos , endObj_or_pos , Names = ["startlocator" , "endlocator"  , "Distance"] ):
        """
        CreateOrGet_Loc 함수 사용
        두 지점 사이에 동적인 거리 측정 노드를 생성합니다.

        이 함수는 시작점과 끝점에 로케이터를 생성하거나 찾고,
        이 두 로케이터 사이의 거리를 실시간으로 측정하는 `distanceDimension` 노드를
        생성하여 연결합니다. 이 모든 과정은 이전에 정의한 `CreateOrGet_Loc` 함수를
        활용하여 수행됩니다.

        Args:
            startObj_or_pos (str or list or tuple): 시작점으로 사용할 오브젝트의 이름 또는 월드 좌표값.
            endObj_or_pos (str or list or tuple): 끝점으로 사용할 오브젝트의 이름 또는 월드 좌표값.
            Names (list): 생성될 노드들의 기본 이름 리스트.
                        [0]: 시작 로케이터, [1]: 끝 로케이터, [2]: 거리 측정 노드 순서입니다.

        Returns:
            -dict or None: 
                딕셔너리 키
                {
                "startLoc" : startLoc ,
                "endLoc" : endLoc ,
                "startLoc_shape" : startLocShape ,
                "endLoc_shape" : endLocShape ,
                "distance_node" : DistanceShape ,
                "distance_transform" : Distance
                }
                성공 시, 생성되거나 사용된 모든 노드(로케이터, 쉐잎, 거리 노드 등)의 
                이름을 담은 딕셔너리를 반환합니다.
                로케이터 생성에 실패하면 None을 반환합니다.
        """
        
        string_typ = None
        try:
            string_type = basestring
        except NameError:
            string_type = str

        startLoc = None
        startLocShape = None
        endLoc = None
        endLocShape = None
        
        Distance = None
        DistanceShape = None
        DistanceName  = None
        DistanceShapeSuffix = "Shape"
        DistanceCount = 0
        returnDic = None

        

        startLocs = self.CreateOrGet_Loc(startObj_or_pos , Names[0])
        endLocs = self.CreateOrGet_Loc(endObj_or_pos , Names[1])
        

        if startLocs and endLocs:
            startLoc = startLocs[0]
            startLocShape = startLocs[1]
            endLoc = endLocs[0]
            endLocShape = endLocs[1]

            while True:
                DistanceName = "{}{}{}" .format(Names[2] , DistanceShapeSuffix , "" if DistanceCount == 0 else DistanceCount)
                if not cmds.objExists(DistanceName ):
                    break
                DistanceCount += 1
            DistanceShape = cmds.createNode("distanceDimShape" , n = DistanceName )
            Distance = cmds.listRelatives(DistanceShape, p =1 , type= "transform")
            Distance = cmds.rename(Distance[0] , '{}{}' .format(Names[2]  , "" if DistanceCount == 0 else DistanceCount))

            cmds.connectAttr(startLocShape + ".worldPosition[0]" , DistanceShape + ".startPoint" ,f =1)
            cmds.connectAttr(endLocShape + ".worldPosition[0]" , DistanceShape + ".endPoint" ,f =1)

            returnDic = {
                "startLoc" : startLoc ,
                "endLoc" : endLoc ,
                "startLoc_shape" : startLocShape ,
                "endLoc_shape" : endLocShape ,
                "distance_node" : DistanceShape ,
                "distance_transform" : Distance
            }
            
        return returnDic
    
    def Get_Distance(self , StartObj, EndObj , Round =3 ):
        """두 오브젝트의 월드 위치 사이 직선거리를 계산한다.

        Args:
            StartObj (str): 시작 transform.
            EndObj (str): 끝 transform.
            Round (int): 반환값의 소수점 반올림 자릿수.

        Returns:
            float: 두 월드 좌표의 유클리드 거리.
        """
        S_Pos = cmds.xform(StartObj , q =1, t =1 ,ws =1)
        E_Pos = cmds.xform(EndObj, q=1, t=1, ws=1)
        DT = round(((S_Pos[0] - E_Pos[0])**2 + (S_Pos[1] - E_Pos[1])**2 + (S_Pos[2] - E_Pos[2])**2)**0.5 , Round)
        return DT

    def uniqueName(self , Name , maxLoop = 100 ):
        """씬에 존재하지 않는 이름을 숫자 증가 방식으로 찾는다.

        입력 이름에 숫자가 있으면 해당 숫자부터 증가시키고, 숫자가 없으면 이름
        뒤에 1, 2, 3...을 붙인다. 예를 들어 ``armIK``가 이미 존재하면
        ``armIK1``을, ``armIK3``이 존재하면 ``armIK4``부터 검사한다.

        Args:
            Name (str): 검사할 기본 이름.
            maxLoop (int): 충돌을 검사할 최대 횟수.

        Returns:
            str or None: 사용 가능한 이름. 입력이 문자열이 아니면 None.
        """
        string_type = None
        try:
            string_type = basestring
        except NameError:
            string_type = str
        returnName = None
        formatName = None
        count = 0
        if isinstance(Name , string_type ):
            # Maya의 DAG 경로 구분자(|)는 노드 이름으로 사용할 수 없다.
            Name = self._sanitizeNodeName(Name)

            hasFormatPattern = r"\{.*?\}"
            hasFormat = re.search(hasFormatPattern , Name)
            
            isIntPattern = r"(.*?)([0-9]+)(.*?)"
            isInt = re.search(isIntPattern , Name)
            if isInt:
                matchs = isInt.groups()
                count = int(isInt.group(2))
                joinName = []
                for x in matchs:
                    if x == isInt.group(2):
                        x = "{}"
                        joinName.append(x)
                        continue
                    joinName.append(x)
                formatName = "".join(joinName)
            else:
                formatName = Name + "{}"
            
            for x in range(count , maxLoop + count):
                count = x if x > 0 else ""

                returnName = formatName.format("" if count == 0 else count )
                if not cmds.objExists(returnName):
                    break

        return returnName

    def setAxis(self , Axis = "X", printLog = False):
        """조인트가 뻗는 주축과 볼륨 보정에 사용할 나머지 두 축을 설정한다.

        ``AxisDic``에는 대·소문자 주축이, ``AxisOtherDic``에는 나머지 두 축이
        저장된다. 이후 translate 스트레치는 주축, scale 볼륨은 나머지 축에 연결된다.
        """

        upperAxisOtherlst = []
        lowAxisOtherlst = []

        for x in "XYZ":
            if x == Axis:
                self.AxisDic["Axis"] = x
                self.AxisDic["axis"] = x.lower()
            else:
                upperAxisOtherlst.append(x)
                lowAxisOtherlst.append(x.lower())

        self.AxisOtherDic["Axis"] = upperAxisOtherlst
        self.AxisOtherDic["axis"] = lowAxisOtherlst
        self.log("> Primary Axis : {pa}\n> Other Axis : {oa}" .format(pa =self.AxisDic["Axis"] , oa = self.AxisOtherDic["Axis"]), printLog)

    def getPoleVectorPosData(self ,first , second , third , scalar = 1):
        """3개 조인트가 만드는 평면에서 안정적인 폴 벡터 위치를 계산한다.

        첫 조인트에서 끝 조인트로 향하는 선에 중간 조인트를 투영한 뒤, 투영점에서
        중간 조인트로 향하는 수직 성분을 ``scalar``만큼 연장한다.

        Args:
            first (str): 체인의 시작 조인트.
            second (str): 굽힘 방향을 결정하는 중간 조인트.
            third (str): 체인의 끝 조인트.
            scalar (float): 중간 조인트에서 폴 벡터까지의 거리 배율.

        Returns:
            list[float]: 폴 벡터의 월드 좌표 ``[x, y, z]``.
        """
        poleVecorPos = None
        #if all(cmds.objectType(x) == "transform" in x for x in [first , second , third]):

        firstPos = cmds.xform(first , q= 1, ws =1 , t =1)
        secondPos = cmds.xform(second , q= 1, ws =1 , t =1)
        thirdPos =  cmds.xform(third , q= 1, ws =1 , t =1)

        firstVector = om.MVector(firstPos[0] , firstPos[1] ,firstPos[2])
        secondVector = om.MVector(secondPos[0], secondPos[1] , secondPos[2])
        thirdVector = om.MVector(thirdPos[0] , thirdPos[1] , thirdPos[2])

        # 시작-끝 벡터 위에 시작-중간 벡터를 투영한다.
        firstThirdVector = (thirdVector - firstVector)
        firstSecondVector = (secondVector - firstVector)

        dotProduct = firstThirdVector * firstSecondVector
        proJectLength = float(dotProduct)/(firstThirdVector.length())

        normalizeFirstThird = firstThirdVector.normal()
        proJectVector = normalizeFirstThird * proJectLength
        # 투영 성분을 제거하면 조인트 평면의 굽힘 방향만 남는다.
        arrowVector = (firstSecondVector - proJectVector) * scalar 
        poleVector = arrowVector + secondVector

        poleVecorPos = [poleVector.x , poleVector.y , poleVector.z]
        
        return poleVecorPos



    def setScaleDefault(self , ScaleDefault = None , printLog = False):
        """리그 전체 스케일을 거리 계산에 반영할 기준 transform을 지정한다.

        Args:
            ScaleDefault (str or None): 사용할 기존 transform. None이면
                ``ScaleDefault`` 계열의 고유 이름으로 새 transform을 만든다.
            printLog (bool): 처리 결과를 즉시 출력할지 여부.

        ``ScaleDefault.scaleX``는 원래 체인 길이에 곱해진다. 따라서 캐릭터의 글로벌
        스케일이 바뀌어도 정규화된 스트레치 비율이 불필요하게 변하지 않는다.
        """

        if ScaleDefault:
            if cmds.objExists(ScaleDefault):
                self.ScaleDefault = ScaleDefault
                self.log("> Using existing node for ScaleDefault : {}" .format(self.ScaleDefault) , printLog)
            else:
                self.ScaleDefault = cmds.createNode("transform" , n = self.uniqueName("ScaleDefault"))
                self.log("> Created new node for ScaleDefault: {}".format(self.ScaleDefault) , printLog)
        elif not self.ScaleDefault:
            self.ScaleDefault = cmds.createNode("transform" , n =  self.uniqueName("ScaleDefault"))
            self.log("> Created new node for ScaleDefault: {}".format(self.ScaleDefault) , printLog)


        if ScaleDefault:
            self.ScalingMD = cmds.createNode("multiplyDivide" , n = self.ScaleDefault + "_scaling_multiplyDivide" )
            cmds.connectAttr(self.ScaleDefault + ".scaleX"  , self.ScalingMD + ".input2X" , f=1)

        else:
            self.log("> ScaleDefault is already set to: {}" .format(self.ScaleDefault) , printLog)

    def setIKHandle(self ,  Name = None ,RootJnt = None,TargetJnt = None  , grpName = [] , solver =  "ikRPsolver" , printLog = False):
        """지정한 구간에 IK 핸들을 만들고 오프셋 그룹 안에 삽입한다.

        Args:
            Name (str or None): IK 핸들의 기본 이름. None이면 끝 조인트에서 파생한다.
            RootJnt (str or None): IK 시작 조인트. 생략 시 내부 목록의 첫 조인트.
            TargetJnt (str or None): IK 끝 조인트. 생략 시 내부 목록의 마지막 조인트.
            grpName (list[str]): IK 위에 삽입할 그룹 이름 목록.
            solver (str): Maya IK solver 이름. 기본값은 회전 평면용 ``ikRPsolver``.
            printLog (bool): 처리 로그의 즉시 출력 여부.

        생성 결과는 ``IKs``에 누적하고, 가장 최근 핸들은 ``CurrentIK``에 저장한다.
        """
        if RootJnt is None and TargetJnt is None:
            if len(self.Jntlist) >1 :
                RootJnt = self.Jntlist[0]
                TargetJnt= self.Jntlist[-1]

        if cmds.objExists(RootJnt) and cmds.objExists(TargetJnt):
            if Name is None:
                Name = self.uniqueName(self._getNodeName(TargetJnt) + "_ik")
            else:
                Name = self.uniqueName(Name)

            # ikHandle은 [handle, effector]를 반환하며 이 클래스는 handle만 관리한다.
            ikResult= cmds.ikHandle( sj = RootJnt , ee = TargetJnt ,n = Name  ,sol = solver  )
            IK = ikResult[0]
            print (">>>>", IK)
            #self.IKs.append(IK[0])
            Grp = None
            if not len(grpName)>0:
                grpName = ["{}_grp".format(Name)]

            if len(grpName)>0:
                Grp = self.insertGrp(IK ,grpName )
            IK_Dic = {
                "IKhandle" : IK,
                "Group" : Grp ,
                "TargetJnt" : TargetJnt
            }
            self.IKs.append(IK_Dic)
            self.CurrentIK = IK
            
            self.log("> Create IK handle : {}\n> Create IK handleGrp : {}" .format(IK_Dic["IKhandle"], IK_Dic["Group"])  ,printLog  )
        else:
            self.log("> Not Exist objs to set Ikhandle: {} , {}" .format(RootJnt , TargetJnt) , printLog )

    def addAttrStretch( self, Target , AttrName = "Stretch" , Min = 0 , Max = 10 ,printLog = False):
        """컨트롤에 스트레치 블렌드 속성을 만들고 속성 메타데이터를 저장한다.

        속성 범위는 나중에 setRange 노드에서 0~1로 정규화된다. 이미 같은 속성이
        있으면 새로 만들지 않고 기존 min/max 정보를 읽어 사용한다.
        """
        
        if cmds.objExists(Target):
            IsAttr = cmds.attributeQuery(AttrName , node = Target , exists= 1)
            if not IsAttr:
                cmds.addAttr(Target , ln = AttrName ,  at='double', min=Min, max=Max, k=True)

            # 방금 생성한 속성도 같은 호출 안에서 메타데이터를 기록할 수 있도록
            # 생성 전의 IsAttr 값을 사용하지 않고 실제 씬 상태를 다시 조회한다.
            IsAttr = cmds.attributeQuery(AttrName , node = Target , exists= 1)

            
            MinV = None
            MaxV = None
            if IsAttr:

                IsMin = cmds.attributeQuery(AttrName , node = Target , minimum=1 )
                IsMax = cmds.attributeQuery(AttrName , node= Target  , maximum=1 )
                if IsMin and IsMax:
                    self.stretchAttrDic["attr"] = AttrName
                    self.stretchAttrDic["obj"] = Target

                    
                    if IsMin:
                        MinV = cmds.attributeQuery(AttrName , node = Target  , minimum=1)
                        self.stretchAttrDic["min"] = MinV[0]
                    if IsMax:
                        MaxV = cmds.attributeQuery(AttrName , node = Target , maximum=1)
                        self.stretchAttrDic["max"] = MaxV[0]
                    self.log("> Add {tg}.{attr} stretch Attribute\n> Min : {min}\n> Max : {max}" .format(tg = Target , attr = AttrName , min = MinV , max = MaxV) ,printLog)

    def addSlide(self , Target , AttrName ,printLog = False):
        """조인트 기본 길이에 더할 키 입력용 슬라이드 속성을 생성한다."""
        if cmds.objExists(Target):
            IsAttr = cmds.attributeQuery(AttrName , node = Target , exists= 1)
            if not IsAttr:
                cmds.addAttr(Target , ln = AttrName ,  at='double', k=True)
        
        if IsAttr:
            self.log("> Add {tg}.{attr} Slide Attribute" .format(tg = Target , attr = AttrName ) ,printLog)



    def addAttrVolume(self , Target , AttrName = "Volume" , Min = 0 , Max = 10 , printLog = False):
        """볼륨 보정 블렌드 속성과 추가 오프셋 속성을 생성한다.

        ``AttrName``은 보정 강도를 0~1로 블렌드하고, 자동 생성되는
        ``AttrName_Offset``은 최종 횡축 스케일에 직접 더할 미세 조정값으로 쓰인다.
        """
        OffsetAttrName = AttrName + "_Offset"
        if cmds.objExists(Target):
            IsAttr = cmds.attributeQuery(AttrName , node = Target , exists= 1)
            OffsetAttr = cmds.attributeQuery(OffsetAttrName  , node = Target , exists= 1)
            if not IsAttr:
                cmds.addAttr(Target , ln = AttrName ,  at='double', min=Min, max=Max, k=True)
            if not OffsetAttr:
                cmds.addAttr(Target , ln = OffsetAttrName ,  at='double', k=True)           

            # attributeQuery 결과는 addAttr 이전 값이므로 생성 후 반드시 갱신한다.
            # 갱신하지 않으면 첫 호출에서는 volumeAttrDic이 전부 None으로 남는다.
            IsAttr = cmds.attributeQuery(AttrName , node = Target , exists= 1)
            OffsetAttr = cmds.attributeQuery(OffsetAttrName , node = Target , exists= 1)

            MinV = None
            MaxV = None
            if IsAttr:
                IsMin = cmds.attributeQuery(AttrName , node = Target , minimum=1 )
                IsMax = cmds.attributeQuery(AttrName , node= Target  , maximum=1)
                if IsMin and IsMax:
                    self.volumeAttrDic["attr"] = AttrName
                    self.volumeAttrDic["obj"] = Target

                    if IsMin:
                        MinV = cmds.attributeQuery(AttrName , node = Target  , minimum=1)
                        self.volumeAttrDic["min"] = MinV[0]
                    if IsMax:
                        MaxV = cmds.attributeQuery(AttrName , node = Target , maximum=1)
                        self.volumeAttrDic["max"] = MaxV[0]
            
            if OffsetAttr:
                self.volumeAttrDic["offsetAttr"] = OffsetAttrName


            self.log("> Add {tg}.{attr} volume Attribute\n> Min : {min}\n> Max : {max}" .format(tg = Target , attr = AttrName , min = MinV , max = MaxV) ,printLog)
    def addAttrPoleVectorStretch(self , Target , AttrName = "PoleVectorStretch" , Min = 0 , Max = 10 , printLog = False):
        """폴 벡터 기준 스트레치와 일반 스트레치를 전환할 블렌드 속성을 만든다."""
        if cmds.objExists(Target):
            IsAttr = cmds.attributeQuery(AttrName , node = Target , exists= 1)
            if not IsAttr:
                cmds.addAttr(Target , ln = AttrName ,  at='double', min=Min, max=Max, k=True)

            # 새로 생성한 속성도 즉시 poleVectorStretchAttrDic에 반영한다.
            IsAttr = cmds.attributeQuery(AttrName , node = Target , exists= 1)
            MinV = None
            MaxV = None
            if IsAttr:
                IsMin = cmds.attributeQuery(AttrName , node = Target , minimum=1 )
                IsMax = cmds.attributeQuery(AttrName , node= Target  , maximum=1 )
                if IsMin and IsMax:
                    self.poleVectorStretchAttrDic["attr"] = AttrName
                    self.poleVectorStretchAttrDic["obj"] = Target

                    if IsMin:
                        MinV = cmds.attributeQuery(AttrName , node = Target  , minimum=1)
                        self.poleVectorStretchAttrDic["min"] = MinV[0]
                    if IsMax:
                        MaxV = cmds.attributeQuery(AttrName , node = Target , maximum=1)
                        self.poleVectorStretchAttrDic["max"] = MaxV[0]
            self.log("> Add {tg}.{attr} poleVectorStretch Attribute\n> Min : {min}\n> Max : {max}" .format(tg = Target , attr = AttrName , min = MinV , max = MaxV) ,printLog)
    def setDistance(self,Start , End , NameList = None):
        """두 대상 사이의 동적 거리 노드를 만들고 현재 거리로 등록한다.

        Args:
            Start (str): 거리 측정 시작 오브젝트.
            End (str): 거리 측정 끝 오브젝트.
            NameList (list[str] or None): 시작 locator, 끝 locator, distance transform의
                기본 이름. 생략하면 Start/End 이름에서 자동 생성한다.

        생성된 shape는 ``CurrentDistanceNode``에, 양 끝 locator는
        ``startDT_loc``과 ``endDT_loc``에 저장된다.
        """
        if NameList is None:
            StartName = self._getNodeName(Start)
            EndName = self._getNodeName(End)
            NameList = [StartName , EndName , EndName + "End"]
        else:
            # 직접 전달된 이름에도 긴 DAG 경로가 섞일 수 있으므로 구분자를 제거한다.
            NameList = [self._sanitizeNodeName(name) for name in NameList]

        if all(cmds.objExists(x) == True for x in [Start , End]):
            StartLoc = "{}_LOC" .format(NameList[0])
            EndLoc = "{}_LOC" .format(NameList[1])
            DT = "{}" .format(NameList[2])
            DictanceDic = self.Create_Distance(Start , End , [StartLoc , EndLoc , DT])

            self.DistanceDic = DictanceDic
            self.CurrentDistanceNode =  DictanceDic["distance_node"]
            self.startDT_loc = DictanceDic["startLoc"]
            self.endDT_loc = DictanceDic["endLoc"]

            self.Distances = set(self.Distances )
            self.Distances.add(self.CurrentDistanceNode)
            self.Distances = list(self.Distances)
        else:
            raise TypeError(">> Invalid input. Expected a Existed obj")
        
    def defineDistance(self , Start , End , Distance):
        """씬에 이미 존재하는 거리 노드와 양 끝 대상을 현재 거리로 등록한다.

        새 노드를 만들지 않고 외부에서 구성한 ``distanceBetween`` 또는
        ``distanceDimShape``를 이후 스트레치 계산에 재사용할 때 사용한다.
        """
        if all(cmds.objExists(x) == True for x in [Start , End , Distance] ) and any(cmds.objectType(Distance) == y for y in ["distanceBetween" ,"distanceDimShape" ]):
            self.CurrentDistanceNode=  Distance
            self.startDT_loc = Start
            self.endDT_loc = End
        else:
            raise TypeError(">> Invalid input. Expected a Existed obj")
        



    def setSlide(self , Jnt , AttrTarget , AttrName ):
        """스트레치된 조인트 길이에 애니메이터의 슬라이드 값을 더한다.

        기존 스트레치 출력 연결을 잠시 해제하고 ``addDoubleLinear``를 삽입하여
        ``최종 translate = 스트레치 길이 + 슬라이드 값``이 되도록 다시 연결한다.

        Args:
            Jnt (str): 슬라이드를 적용할 등록된 조인트.
            AttrTarget (str): 슬라이드 속성을 소유할 컨트롤 또는 transform.
            AttrName (str): 사용할 속성 이름.
        """
        if cmds.objExists(Jnt):
            IsAttr = cmds.attributeQuery(AttrName , node = AttrTarget , exists= 1)
            

            if not IsAttr:
                self.addSlide(AttrTarget , AttrName)
            
            #IsAttr:
            #pprint.pprint (self.resultNodes)

            IsDicNode = Jnt in self.resultNodes
            #print ()

            if IsDicNode:
                MDL = self.resultNodes[Jnt]["MDL"]
                JntName = self._getNodeName(Jnt)
                ADL = cmds.createNode("addDoubleLinear" , n = JntName + "_slide_addDoubleLinear" )

                # 스트레치 MDL의 기존 직접 연결을 제거한 후 ADL을 중간에 삽입한다.
                IsCntAttr = cmds.listConnections( Jnt + ".translate{}" .format(self.AxisDic["Axis"]),s =1  , plugs=True )[-1]
                
                
                if IsCntAttr:
                    cmds.disconnectAttr(IsCntAttr , Jnt + ".translate{}" .format(self.AxisDic["Axis"]) )


                
                cmds.connectAttr("{}.{}" .format(AttrTarget , AttrName) , ADL + ".input2" , f=1)
                cmds.connectAttr("{}.{}" .format(MDL, "output")  ,ADL + ".input1" , f=1)
                cmds.connectAttr(ADL + ".output" , Jnt + ".translate{}" .format(self.AxisDic["Axis"]) , f=1)


                self.resultNodes[Jnt]["ADL"] = ADL
                self.resultNodes[Jnt]["SlideAttr"] = "{}.{}" .format(AttrTarget , AttrName)

    
    def createPoleVectorStretchNode(self , TargetJnt , inputNode = None , inputAttr = None ):
        """조인트 하나에 사용할 폴 벡터 거리 기반 스트레치 블렌드망을 만든다.

        기본 입력은 전체 체인의 ``stretchBC.outputR``이다. 별도의 ``inputNode``와
        ``inputAttr``을 주면 그 값을 일반 스트레치 입력으로 대신 사용할 수 있다.

        계산 흐름::

            pole distance / (joint original length * global scale)
                -> PoleStretchBC.color1R
            normal stretch ratio -> PoleStretchBC.color2R
            PoleVectorStretch attr -> setRange -> PoleStretchBC.blender

        실제 거리와 원본 길이 연결은 거리 노드가 정해진 뒤
        ``connectPoleVectorStretchToNode``에서 완성된다.
        """
        try:
            string_type = basestring
        except NameError:
            string_type = str

        noralizeNode = None 
        noralizeNodeAttr = None

        if not cmds.objectType(TargetJnt) == "joint":
            raise TypeError(">  Invalid <TargetJnt> input. Expected a Existed Joint list")
        if not TargetJnt in self.resultNodes:
            raise TypeError(">  Invalid <TargetJnt > input. Could not Found <TargetJnt> in <self.resultNodes.>")

        if not inputNode:
            if self.stretchNodeDic["stretchBC"]:
                noralizeNode = self.stretchNodeDic["stretchBC"]
                noralizeNodeAttr = "outputR"
            else:
                raise ValueError(">  The required node 'stretchBC' is not defined or does not exist in the scene.")
        elif inputNode and cmds.objExists("{}" .format(inputNode)):
            if inputAttr and  isinstance(inputAttr, string_type ) and cmds.objExists("{}.{}" .format(inputNode , inputAttr)):

                noralizeNode = inputNode
                noralizeNodeAttr = inputAttr
            else :
                raise TypeError(">  Invalid <inputAttr> input. Expect a Existed <{}.{}> Attr" .format(inputNode , inputAttr))
            
    
        if not self.poleVectorStretchAttrDic["obj"] and not self.poleVectorStretchAttrDic["attr"]:
            if all(cmds.objectType(x) == "joint" for x in self.Jntlist):
                self.addAttrPoleVectorStretch(self.Jntlist[0])
            else:
                raise ValueError("> Could not find the required attribute: 'poleVectorStretchAttr'")
        

        # DivMD는 폴 벡터까지의 거리 / 스케일 보정 원본 길이를 계산한다.
        TargetJntName = self._getNodeName(TargetJnt)
        DivMD = cmds.createNode("multiplyDivide" , n = TargetJntName + "_poleVectorNormalize_multiplyDivide")
        ScalingMD = cmds.createNode("multiplyDivide" , n  = TargetJntName + "_poleVector_scaling_multiplyDivide" )
        PoleStretchBC = cmds.createNode("blendColors", n  = TargetJntName + "_poleVectorStretch_blendColors" )
        AttrSR = cmds.createNode("setRange" ,  n =TargetJntName + "_poleVectorAttr_setRange")

        cmds.setAttr(DivMD + ".input1X" , 1)
        cmds.setAttr(DivMD + ".operation" , 2)

        cmds.setAttr(PoleStretchBC + ".color1R" , 1)
        cmds.setAttr(PoleStretchBC + ".color2R" , 1)
            
        cmds.setAttr(AttrSR + ".minX" , 0)
        cmds.setAttr(AttrSR + ".maxX" , 1)
        cmds.setAttr(AttrSR + ".oldMinX" , self.poleVectorStretchAttrDic["min"])
        cmds.setAttr(AttrSR + ".oldMaxX" , self.poleVectorStretchAttrDic["max"])
        
        # color1은 폴 벡터 기준 비율, color2는 기존 체인 스트레치 비율이다.
        cmds.connectAttr("{}.{}" .format(noralizeNode , noralizeNodeAttr) , PoleStretchBC + ".color2R" , f=1)
        cmds.connectAttr(ScalingMD + ".outputX" ,DivMD + ".input2X" , f=1)
        cmds.connectAttr(DivMD + ".outputX" , PoleStretchBC + ".color1R" , f=1)
        cmds.connectAttr(AttrSR + ".outValueX" ,PoleStretchBC +  ".blender" ,f =1)
        cmds.connectAttr("{}.{}" .format(self.poleVectorStretchAttrDic["obj"] , self.poleVectorStretchAttrDic["attr"]) , AttrSR + ".valueX" ,f=1 )


        self.poleVectorStretchNodes[TargetJnt] = {
            "divMD": DivMD,
            "scalingMD": ScalingMD,
            "poleStretchBC": PoleStretchBC,
            "stretchBC" : noralizeNode,
            "stretchBC_Attr" : noralizeNodeAttr,
            "MDL" : self.resultNodes[TargetJnt]["MDL"],
            "MDL_Attr" : "input1",
            "attrSR": AttrSR
        }

    def createStretchNode(self ,Name , Jntlist , DistanceNode , ScaleDefaultDate= None ):
        """체인의 현재 길이를 원본 길이로 나눈 스트레치 비율 노드망을 만든다.

        Args:
            Name (str): 생성할 유틸리티 노드들의 기본 이름.
            Jntlist (list[str]): 부모에서 자식 순서로 된 joint 체인.
            DistanceNode (str): 체인 시작과 IK 목표 사이의 동적 거리 노드 shape.
            ScaleDefaultDate (str or None): 글로벌 스케일 기준 transform. 생략 시 생성.

        계산 흐름::

            scaledRestLength = restLength * ScaleDefault.scaleX
            stretchRatio = currentDistance / scaledRestLength
            condition = stretchRatio if currentDistance > restLength else 1
            result = blend(1, condition, normalizedStretchAttribute)

        ``condition`` 때문에 목표가 원본 길이 안쪽에 있을 때 조인트가 압축되지 않고,
        Stretch 속성으로 원본 길이와 스트레치 결과를 부드럽게 전환할 수 있다.
        """

        uniqueName = self.uniqueName(Name)
        self.setScaleDefault(ScaleDefaultDate)
        self.stretchNodeDic["scaleDefault"] = self.ScaleDefault

        #pprint.pprint(self.stretchNodeDic)
        if self.stretchNodeDic["distance"] is None:
            if cmds.objectType(DistanceNode) == "distanceDimShape" or cmds.objectType(DistanceNode) == "distanceBetween":
                self.stretchNodeDic["distance"] = DistanceNode
                GetDistance = round(cmds.getAttr(self.stretchNodeDic["distance"]  + ".distance") ,3)
                self.stretchNodeDic["distanceLentgh"] = GetDistance
            else:
                raise TypeError("> Invalid <DistanceNode> input. Expected a DistanceNode  Shape")


        if self.stretchNodeDic["scaleDefault"] and self.stretchNodeDic["distance"]:
            if all(cmds.objectType(x) == "joint" for x in Jntlist) and isinstance(Jntlist , list):

                # 각 부모-자식 구간의 월드 거리를 합산해 체인의 원본 길이를 구한다.
                OldJnt = None
                TotalLength = 0
                self.stretchNodeDic["jointList"] = []
                for Jnt in Jntlist:
                    if OldJnt:
                        self.stretchNodeDic["jointList"].append(OldJnt)
                        JntLength = self.Get_Distance(OldJnt , Jnt )


                        
                        TotalLength += JntLength
                    OldJnt = Jnt
                
                self.stretchNodeDic["jointLength"] = TotalLength
                self.defineJntlist(self.stretchNodeDic["jointList"])

                # ScalingMD: 원본 길이에 글로벌 스케일을 반영한다.
                ScalingMD = cmds.createNode("multiplyDivide" , n = self.stretchNodeDic["scaleDefault"] + "_scaling_multiplyDivide")
                # NormalMD: 현재 거리 / 스케일 보정 원본 길이 = 스트레치 배율.
                NormalMD = cmds.createNode("multiplyDivide" , n =uniqueName + "_normalize_multiplyDivide")
                # LengthCon: 원본보다 짧을 때는 1을 출력해 체인 압축을 막는다.
                LengthCon = cmds.createNode("condition" , n = uniqueName + "_length_condition")
                
                # StretchBC와 AttrSR은 사용자 속성을 0~1로 바꿔 결과를 블렌드한다.
                StretchBC = cmds.createNode("blendColors" , n  = uniqueName + "_blendColors" )
                AttrSR = cmds.createNode("setRange" ,  n = uniqueName + "_setRange")


                cmds.setAttr(AttrSR + ".minX" , 0)
                cmds.setAttr(AttrSR + ".maxX" , 1)

                cmds.setAttr(ScalingMD + ".input1X" , self.stretchNodeDic["jointLength"])
                cmds.setAttr(NormalMD + ".operation" , 2)
                cmds.setAttr(LengthCon + ".operation" , 2)
                cmds.setAttr(LengthCon + ".colorIfFalseR" , 1)
                cmds.setAttr(LengthCon + ".secondTerm" , TotalLength)

                cmds.setAttr(StretchBC + ".color1R" , 1)
                cmds.setAttr(StretchBC + ".color2R" , 1)
                cmds.setAttr(StretchBC + ".blender" , 0)

                #ScalingMD
                cmds.connectAttr(self.stretchNodeDic["scaleDefault"] + ".scaleX" , ScalingMD + ".input2X" , f=1)
                #NormalMD
                cmds.connectAttr(self.stretchNodeDic["distance"]  + ".distance" , NormalMD + ".input1X" , f=1)
                cmds.connectAttr(ScalingMD + ".outputX" , NormalMD + ".input2X" , f=1)
                #LengthCon
                cmds.connectAttr(DistanceNode  + ".distance" , LengthCon + ".firstTerm" , f=1)
                cmds.connectAttr(NormalMD + ".outputX" , LengthCon + ".colorIfTrueR" , f=1)
                #StretchBC
                cmds.connectAttr(LengthCon + ".outColorR" , StretchBC + ".color1R" , f=1)

                if any(value is None for value in self.stretchAttrDic.values()):
                    self.addAttrStretch(Jntlist[0] )

                if all(value is not None for value in self.stretchAttrDic.values()):
                    cmds.setAttr(AttrSR + ".oldMinX" , self.stretchAttrDic["min"])
                    cmds.setAttr(AttrSR + ".oldMaxX" , self.stretchAttrDic["max"])
                    cmds.connectAttr(AttrSR + ".outValueX" , StretchBC + ".blender" ,f =1)
                    cmds.connectAttr("{}.{}".format(self.stretchAttrDic["obj"] , self.stretchAttrDic["attr"])  , AttrSR + ".valueX" , f=1)

                self.stretchNodeDic["scalingMD"] = ScalingMD 
                self.stretchNodeDic["normalMD"] = NormalMD
                self.stretchNodeDic["lengthCon"] = LengthCon
                self.stretchNodeDic["attrSR"] = AttrSR
                self.stretchNodeDic["stretchBC"] = StretchBC
            else:
                raise TypeError(">  Invalid <Jntlist> input. Expected a Existed Joint list")

    def createVolumeNode(self , Name  , inputNode = None , inputAttr = None ):
        """스트레치에 반비례하는 횡축 볼륨 보정 노드망을 만든다.

        Args:
            Name (str): 생성할 노드들의 기본 이름.
            inputNode (str or None): 스트레치 비율을 출력하는 노드. 생략하면
                ``stretchNodeDic['stretchBC']``를 사용한다.
            inputAttr (str or None): ``inputNode``에서 읽을 스칼라 출력 속성.

        계산 흐름::

            inverse = 1 / stretchRatio
            volumeScale = inverse ** 0.5
            blended = blend(1, volumeScale, normalizedVolumeAttribute)
            result = blended + Volume_Offset

        제곱근을 사용하는 이유는 두 횡축에 같은 스케일을 적용했을 때 면적 변화가
        길이 변화의 역수에 가까워지도록 하기 위해서다.
        """
        string_type = None
        noralizeNode = None 
        noralizeNodeAttr = None
        uniqueName = self.uniqueName(Name)
        try:
            string_type = basestring
        except NameError:
            string_type = str

        
        

        if inputNode is None:
            if self.stretchNodeDic["stretchBC"]  and  cmds.objExists(self.stretchNodeDic["stretchBC"]):
                noralizeNode = self.stretchNodeDic["stretchBC"]
                noralizeNodeAttr ="outputR" 
            else:
                raise ValueError(">  The required node 'stretchBC' is not defined or does not exist in the scene.")
        elif inputNode and cmds.objExists("{}" .format(inputNode)):
            if inputAttr and  isinstance(inputAttr, string_type ) and cmds.objExists("{}.{}" .format(inputNode , inputAttr)):

                noralizeNode = inputNode
                noralizeNodeAttr = inputAttr
            else :
                raise TypeError(">  Invalid <inputAttr> input. Expect a Existed <{}.{}> Attr" .format(inputNode , inputAttr))

        else:
            print (inputNode , inputAttr) 
            raise ValueError(">  The required node 'stretchBC' is not defined or does not exist in the scene.")

        # 별도로 볼륨 속성을 지정하지 않은 사용 사례만 기본 이름으로 보완한다.
        # addAttrVolume은 생성 직후 딕셔너리를 채우므로 사용자 지정 이름도 보존된다.
        if any(value is None for value in self.volumeAttrDic.values()):
            self.addAttrVolume(self.Jntlist[0])

        missingVolumeData = [
            key for key, value in self.volumeAttrDic.items() if value is None
        ]
        if missingVolumeData:
            raise ValueError(
                "> Volume attributes are not initialized: {}".format(
                    ", ".join(missingVolumeData)
                )
            )


        # volumeBC는 보정 없음(1)과 자동 볼륨 보정값 사이를 전환한다.
        volumeBC = cmds.createNode("blendColors" , n  = Name + "_blendColors" )
        AttrSR = cmds.createNode("setRange" ,  n = Name + "_setRange")
        DivMD = cmds.createNode("multiplyDivide" , n = Name + "_divide_multiplyDivide")
        PowerMD = cmds.createNode("multiplyDivide" , n = Name + "_power_multiplyDivide")
        OffsetADL = cmds.createNode("addDoubleLinear" , n = Name + "_offset_addDoubleLinear")

        cmds.setAttr(volumeBC + ".color1R" , 1)
        cmds.setAttr(volumeBC+ ".color2R" , 1)

        cmds.setAttr(DivMD + ".operation" , 2)  # divide: 1 / stretchRatio
        cmds.setAttr(PowerMD + ".operation" , 3) # power: inverse ** 0.5

        cmds.setAttr(DivMD + ".input1X" , 1)
        cmds.setAttr(PowerMD + ".input2X" , 0.5)

        cmds.setAttr(AttrSR + ".minX" , 0)
        cmds.setAttr(AttrSR + ".maxX" , 1)

        cmds.connectAttr("{}.{}".format(noralizeNode ,noralizeNodeAttr ) , volumeBC + ".color1R" , f=1)
        cmds.connectAttr(AttrSR + ".outValueX" , volumeBC + ".blender" ,f =1)

        cmds.connectAttr(volumeBC + ".outputR" , DivMD + ".input2X" , f= 1)
        cmds.connectAttr(DivMD + ".outputX" ,PowerMD + ".input1X" , f=1 )
        cmds.connectAttr(PowerMD + ".outputX" , OffsetADL + ".input1" , f=1)

        cmds.setAttr(AttrSR + ".oldMinX" , self.volumeAttrDic["min"])
        cmds.setAttr(AttrSR + ".oldMaxX" , self.volumeAttrDic["max"])
        cmds.connectAttr("{}.{}" .format(self.volumeAttrDic["obj"]  ,self.volumeAttrDic["attr"] ) ,AttrSR + ".valueX" , f =1 )
        cmds.connectAttr("{}.{}" .format(self.volumeAttrDic["obj"]  ,self.volumeAttrDic["offsetAttr"] ) , OffsetADL + ".input2" ,f =1 )

        self.volumeNodeDic["divMD" ] = DivMD
        self.volumeNodeDic["powerMD"] = PowerMD
        self.volumeNodeDic["offsetADL"] = OffsetADL
        self.volumeNodeDic["attrSR"] = AttrSR
        self.volumeNodeDic["volumeBC"] = volumeBC
        self.volumeNodeDic["stretchBC" ] = noralizeNode


    def connectStrerchToJoint(self , TargetJoint , Axis = None , Length = None ):
        """계산된 전체 스트레치 비율을 조인트의 주축 translate에 연결한다.

        Args:
            TargetJoint (str): 루트가 아닌 체인 구성 조인트.
            Axis (str or None): 길이가 놓인 축. 생략하면 ``setAxis``의 주축을 사용한다.
            Length (float or None): 해당 구간의 원본 길이. 생략하면 부모와의 월드
                거리를 측정하고 현재 translate 부호를 보존한다.

        각 조인트에는 ``multDoubleLinear``가 하나 생성되며 다음을 계산한다.
        ``joint.translateAxis = stretchRatio * signedOriginalLength``.
        """
        getPlusMinus = 1
        if Axis is None:
            Axis = self.AxisDic["Axis"]
        if not any(Axis == ax for ax in ["X" , "Y" , "Z"]):
            raise TypeError(">  Invalid <Axis> input. Please use one of the valid axes: X, Y, or Z.")
        

        if self.stretchNodeDic["stretchBC"]:
            if cmds.objectType(TargetJoint) == "joint":
                #FindIndex = None
                IsDicNode = TargetJoint in self.resultNodes
                #if IsDicNode:
                #    #FindIndex = next((Num for Num , i in enumerate(self.resultNodes)if i.get("Jnt") == TargetJoint), None ) 
                #    FindIndex = 

                if Length is None or not isinstance(Length , float):
                    ParentJnt = cmds.listRelatives(TargetJoint , p =1 , type = "joint", fullPath = True)
                    IsParentDic = None
                    if ParentJnt:
                        IsParentDic = self._isRegisteredJoint(ParentJnt[0])
                        if IsParentDic:
                            Length = self.Get_Distance(ParentJnt[0] ,TargetJoint )
                            getTrans = cmds.getAttr(TargetJoint + ".translate{}" .format(Axis))
                            # int() 변환은 |translate| < 1일 때 0/0을 만들므로 부호만 비교한다.
                            getPlusMinus = -1.0 if getTrans < 0 else 1.0

                        else:
                            raise ValueError("> <TargetJoint> is not in JointChain")
                    else:
                        raise ValueError("> <TargetJoint> is not in JointChain")
                
                if Length and IsDicNode:

                    # 음의 축 방향으로 배치된 체인도 유지되도록 원본 translate 부호를
                    # 길이에 곱한 뒤 스트레치 비율과 함께 MDL에 저장한다.
                    TargetJointName = self._getNodeName(TargetJoint)
                    resultMDL = cmds.createNode("multDoubleLinear" , n =  "{}_result_multDoubleLinear".format(TargetJointName))
                    self.resultNodes[TargetJoint]["MDL"] = resultMDL

                    #pprint.pprint(self.resultNodes)
                    cmds.setAttr(self.resultNodes[TargetJoint]["MDL"] + ".input2" , Length * getPlusMinus)

                    cmds.connectAttr(self.stretchNodeDic["stretchBC"] + ".outputR" , self.resultNodes[TargetJoint]["MDL"] + ".input1" ,f =1 )
                    cmds.connectAttr(self.resultNodes[TargetJoint]["MDL"] + ".output" , TargetJoint + ".translate{}" .format( Axis) , f=1 )

            else:
                raise TypeError("> Invalid <TargetJoint > input. Expected a Existed Joint")
        else:
            raise ValueError("> Not existed a 'stretchBlend Node'." )

    def connectVolumeToJoint(self , TargetJoint , AxisList = None ):
        """볼륨 보정 결과를 조인트의 주축 이외 두 scale 채널에 연결한다.

        Args:
            TargetJoint (str): 볼륨 보정을 받을 joint.
            AxisList (list[str] or tuple[str] or None): 정확히 두 개의 축. 생략하면
                ``setAxis``에서 계산한 나머지 축을 사용한다.
        """
        try:
            string_type = basestring
        except NameError:
            string_type = str

        if AxisList is None:
            AxisList = self.AxisOtherDic["Axis"]
        if not isinstance(AxisList ,  (list, tuple) ): 
            raise TypeError(">  Invalid <AxisList> input. Expected a List or Tuple ")
        
        MatchCount = sum( 1 for item in AxisList if item in ["X" , "Y" , "Z"])
        if not MatchCount ==2:
            raise ValueError(">   Invalid <AxisList> input. Expected exactly 2 elements from ['X', 'Y', 'Z']")
        
        if not cmds.objectType(TargetJoint) == "joint":
            raise TypeError("> Invalid <TargetJoint > input. Expected a Existed Joint")
        
        if self.volumeNodeDic["offsetADL"] and self.volumeAttrDic["attr"] and self.volumeAttrDic["offsetAttr"]:

            IsDicNode = TargetJoint in self.resultNodes
            if IsDicNode:

                for ax in AxisList:
                    cmds.connectAttr(self.volumeNodeDic["offsetADL"] + ".output" , TargetJoint + ".scale{}" .format(ax) , f=1)
                self.resultNodes[TargetJoint]["ADL"] = self.volumeNodeDic["offsetADL"]
        else:
            raise ValueError("> Not existed a 'volumeBlend Node'." )

    def connectPoleVectorStretchToNode(self, TargetJnt , DistanceNode  , Length = None ):
        """폴 벡터 거리 노드를 조인트별 스트레치망에 연결해 계산을 완성한다.

        Args:
            TargetJnt (str): ``createPoleVectorStretchNode``를 먼저 실행한 조인트.
            DistanceNode (str): 폴 벡터와 해당 체인 끝 사이의 거리 shape.
            Length (float or None): 구간의 원본 길이. 생략하면 부모와의 거리로 계산.

        기존의 일반 스트레치 출력이 조인트 MDL에 직접 연결되어 있다면 이를 끊고,
        폴 벡터 블렌드 결과를 대신 연결한다. 이로써 애니메이터 속성 하나로 전체 IK
        거리 방식과 폴 벡터 분할 거리 방식 사이를 전환할 수 있다.
        """
        try:
            string_type = basestring
        except NameError:
            string_type = str

        #JntLength = None

        if not cmds.objectType(TargetJnt) == "joint":
            raise TypeError(">  Invalid <TargetJnt> input. Expected a Existed Joint list")
        if not TargetJnt in self.resultNodes or not self.poleVectorStretchNodes[TargetJnt]:
            raise TypeError(">  Invalid <TargetJnt > input. Could not Found <TargetJnt> in <self.resultNodes.>")
        
        if not cmds.objectType(DistanceNode) == "distanceDimShape" or cmds.objectType(DistanceNode) == "distanceBetween":
            raise TypeError("> Invalid <DistanceNode> input. Expected a DistanceNode  Shape")
        
        if not self.ScaleDefault:
            raise ValueError("> The required node <self.ScaleDefault>")
        

        
        if Length is None or not isinstance(Length , float):
            ParentJnt = cmds.listRelatives(TargetJnt , p =1 , type = "joint", fullPath = True)
            IsParentDic = None
            if ParentJnt:
                IsParentDic = self._isRegisteredJoint(ParentJnt[0])
                if IsParentDic:
                    Length = self.Get_Distance(ParentJnt[0] ,TargetJnt )
                else:
                    raise ValueError("> <TargetJoint> is not in JointChain")
            else:
                raise ValueError("> <TargetJoint> is not in JointChain")
            
            
        
        # 스케일 보정 원본 길이와 현재 pole distance를 나눗셈 노드에 공급한다.
        cmds.setAttr(self.poleVectorStretchNodes[TargetJnt]["scalingMD"] + ".input1X" , Length)
        cmds.connectAttr(self.ScaleDefault + ".scaleX" , self.poleVectorStretchNodes[TargetJnt]["scalingMD"] + ".input2X" ,f=1)
        cmds.connectAttr(DistanceNode  + ".distance" , self.poleVectorStretchNodes[TargetJnt]["divMD"]+ ".input1X" ,f=1)

        
        #if self.poleVectorStretchNodes[TargetJnt]["MDL"]:
        sourceAttr = "{}.{}" .format(self.poleVectorStretchNodes[TargetJnt]["stretchBC"] ,self.poleVectorStretchNodes[TargetJnt]["stretchBC_Attr"] )
        destinationAttr = "{}.{}" .format(self.poleVectorStretchNodes[TargetJnt]["MDL"] , self.poleVectorStretchNodes[TargetJnt]["MDL_Attr" ])
        poleVectorBlend = self.poleVectorStretchNodes[TargetJnt]["poleStretchBC"]
        jointMDL = self.poleVectorStretchNodes[TargetJnt]["MDL"]

        IsCntAttr = cmds.listConnections(destinationAttr ,s =1 , plugs=1 )


        # 일반 stretchBC -> joint MDL 연결을 poleVector blend 출력으로 교체한다.
        cmds.disconnectAttr(sourceAttr , destinationAttr)
        cmds.connectAttr(poleVectorBlend + ".outputR" ,  self.poleVectorStretchNodes[TargetJnt]["MDL"] + ".input1" ,f=1)


        


    def createPoleVector(self , Name , posData , IkHandle  , annotationRoot = None ):
        """폴 벡터 로케이터를 만들고 IK 핸들에 poleVectorConstraint한다.

        Args:
            Name (str): 생성할 폴 벡터 로케이터의 기본 이름.
            posData (list[float] or tuple[float] or str): 월드 좌표 또는 위치를 가져올
                기존 오브젝트. 보통 ``getPoleVectorPosData``의 반환값을 전달한다.
            IkHandle (str): 연결할 기존 ``ikHandle`` 노드.
            annotationRoot (str or None): 지정하면 이 노드에서 폴 로케이터를 가리키는
                annotation을 생성한다.

        생성된 로케이터, shape, annotation 및 IK는 ``poleVectorDic``에 저장된다.
        """
        pos = None
        poleLoc = None
        poleLocShape = None
        annotation = None
        annotationShape = None

        try:
            string_type = basestring
        except NameError:
            string_type = str

        uniqueName = self.uniqueName(Name)


        if isinstance(posData  , list) or isinstance(posData  , tuple):
            if len(posData ) > 2:
                pos = posData
            else:
                raise IndexError("> Invalid <posData> input. Expected <posData> to have at least 3 items ")
        elif isinstance(posData ,  string_type) and cmds.objExists(posData ):
            pos = cmds.xform(posData , q =1 , ws =1 , t =1)[:3]

        else:
            raise TypeError("> Invalid <posData> input. Expected a valid list, tuple, or an existing obj ")
            
        if pos:
            preLoc = self.CreateOrGet_Loc(pos  , uniqueName )
            poleLoc = preLoc[0]
            poleLocShape = preLoc[-1]

            self.poleVectorDic["obj"] = poleLoc
            self.poleVectorDic["shape"] = poleLocShape
        # annotation은 선택 사항이며, 루트 쪽에 고정되고 로케이터를 가리킨다.
        if annotationRoot:
            if cmds.objExists(annotationRoot):
                annotationShape = cmds.createNode("annotationShape" , n = uniqueName + "_ANTShape")
                parentAnnotation = cmds.listRelatives( annotationShape , p =1 , type = "transform")[0]
                annotation = cmds.rename(parentAnnotation , uniqueName + "_ANT")

                cmds.pointConstraint(annotationRoot , annotation , mo= 0)

                self.poleVectorDic["annotation"] = annotation
                self.poleVectorDic["annotationShape"] = annotationShape

        if poleLocShape and annotationShape:
            cmds.connectAttr("{}.worldMatrix[0]" .format(poleLocShape) , "{}.dagObjectMatrix[0]".format(annotationShape) ,f=1)

        # 마지막으로 로케이터를 실제 RP IK의 pole vector 목표로 등록한다.
        if isinstance(IkHandle , string_type) and cmds.objectType(IkHandle) == "ikHandle" and poleLoc  :
            cmds.poleVectorConstraint(poleLoc  ,IkHandle )
            self.poleVectorDic["ik" ] = IkHandle

        else:
            raise TypeError("> Invalid <IkHandle> input. Expected a 'ikHandle'")






        








                            






            
            







                



        





                
            
                
                




            




select = cmds.ls(sl =1)

a = Ikrig(select) 
a.setIKHandle(Name = "LB_toeEnd_ik" , RootJnt =  a.Jntlist[-2] ,TargetJnt= a.Jntlist[-1] )
a.setIKHandle(Name = "LB_toe_ik" , RootJnt =  a.Jntlist[-3] ,TargetJnt= a.Jntlist[-2] )
a.setIKHandle(Name = "LB_ankle_ik" , RootJnt =  a.Jntlist[0] ,TargetJnt= a.Jntlist[2] )
a.setScaleDefault("LB_hip_ScaleDefault")
a.setAxis("Y")
pprint.pprint(a.Jntlist)

Pos = a.getPoleVectorPosData(select[0],select[1] ,select[2])

a.createPoleVector("LB_hipPoleVector_LOC" , Pos , a.CurrentIK , a.Jntlist[1])
a.addAttrStretch(a.Jntlist[0] , "stretch",0,1)
a.addAttrVolume(a.Jntlist[0] , "volume",0,1)
a.addAttrPoleVectorStretch(a.Jntlist[0] , "poleVectorStretch",0,1)
a.setDistance( a.Jntlist[0] , a.Jntlist[2] , ["LB_hip_ik_LOC" , "LB_ankle_ik_LOC" , "LB_hip_ik_distance"])

a.createStretchNode("LB_hip_ik_stretch" , a.Jntlist[:3], a.CurrentDistanceNode)
a.createVolumeNode("LB_hip_ik_volume" , a.stretchNodeDic["stretchBC"] ,  "outputR"  )

a.connectStrerchToJoint(a.Jntlist[1])
a.connectStrerchToJoint(a.Jntlist[2])
a.setSlide(a.Jntlist[1] , a.Jntlist[0]  , "kneeSlide")
a.setSlide(a.Jntlist[2] , a.Jntlist[0]  , "ankleSlide")
a.connectVolumeToJoint(a.Jntlist[1])
a.createPoleVectorStretchNode(a.Jntlist[1] )
a.createPoleVectorStretchNode(a.Jntlist[2] )
a.setDistance(a.Jntlist[0] , a.poleVectorDic["obj"] , ["LB_hipKnee_ik_LOC" , "LB_hipPoleVector_LOC" , "LB_hipKnee_ik_distance"])
PoleStartDT = a.CurrentDistanceNode
a.setDistance(a.Jntlist[2] , a.poleVectorDic["obj"], ["LB_hipPoleVector_LOC", "LB_ankleKnee_ik_LOC" , "LB_ankleKnee_ik_distancee"])
PoleEndDT = a.CurrentDistanceNode
a.connectPoleVectorStretchToNode(a.Jntlist[1] , PoleStartDT)
a.connectPoleVectorStretchToNode(a.Jntlist[2] , PoleEndDT)



#a.setVolume("Volume" , a.Jntlist[:3])
