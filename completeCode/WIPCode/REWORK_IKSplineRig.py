# -*- coding: utf-8 -*-
import maya.cmds as cmds
from collections import OrderedDict



class setIKspline:
    def __init__(self , Joints , Crv = None ):


        self.string_type = None
        try:
            self.string_type = basestring
        except NameError:
            self.string_type = str



        self.Jntlist = None
        self.Crv = None
        self.CrvShape = None
        self.Cvs = None
        self.IK = None
        self.AxisDic = {"Axis" : "X" , "axis" : "x"}
        self.AxisOtherDic = {"Axis" : ["Y" ,"Z"] , "axis" : ["y" , "z"]}
        self.ScaleDefault = None

        
        self._stretchAttrDic = { "attr" : None , "min" : None , "max" : None , "applyJnts" :  None}
        self._volumeAttrDic = {"stretchNode" : None , "offsetAttr" : None ,"attr" : None , "min" : None, "max" : None , "applyJnts" :  None}
        self._attrDic  = {"stretch" :self._stretchAttrDic , "volume" :self._volumeAttrDic   }


        if isinstance(Joints , list) and all(cmds.objectType(x) == "joint" for x in Joints):
            self.Jntlist = Joints
        else:
            raise TypeError("Invalid {} input. Expected a Existed Joint list".format(Joints))

        if Crv and isinstance(Crv , self.string_type):
            self.Crv ,self.CrvShape = self._findDefineType(Crv , "nurbsCurve")
            if self.Crv is None or self.CrvShape is None:
                raise TypeError("Invalid {} input. Expected a Existed nurbsCurve".format(Crv ))

        
    def addJoint(self , Joint):
        if isinstance(Joint , self.string_type) and cmds.objectType(Joint) == "joint":
            self.Jntlist.append(Joint)
        if isinstance(Joint , list) and all(cmds.objectType(x) == "joint" for x in Joint):
            self.Jntlist += Joint

    def setAxis(self , Axis = "X"):
        '''
        [메서드 설명]
        - setAxis : 조인트체인의 주 방향을 설정하는 메서드로 스트래치 및 볼륨메에 필수적
            - Axis : 주방향 매개변수 오로지 XYZ 중 하나만
        
        '''

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

    def setScaleDefault(self , item = "scaleDefault"):
        scaleDefault = None

        if not isinstance(item , self.string_type):
            raise TypeError("Invalid {} input. Exoected a Existed 'string'Type object." .format(item))
        if not cmds.objExists(item):
            scaleDefault = cmds.createNode("transform" , n = item)
        else:
            scaleDefault = item
        
        if not cmds.objExists(scaleDefault + ".scaleX"):
            raise TypeError("Invalid {} input. Expected an object with a 'scaleX' attribute".format(item))
        
        self.ScaleDefault = scaleDefault


    def setAttr(self ,dataType = "stretch" , target = None ,  attrName = "stretch" , Min =0 , Max = 10 ) :

        attrManager = None
        minV = None
        maxV = None
        if target is None:
            attrManager = self.Jntlist[0]
        else:
            if isinstance(target , self.string_type) and cmds.objExists(target):
                attrManager = target
            else:
                raise TypeError("Invalid {} input. Expected a Existed 'string'Type object." .format(target))

        IsAttr = cmds.attributeQuery(attrName , node= attrManager  , exists=1)
        if not IsAttr:
            if Min and Max:
                cmds.addAttr(attrManager , ln = attrName , at='double' , min = Min , max = Max, k =1 )
            if Min is None and Max is None:
                cmds.addAttr(attrManager , ln = attrName , at='double' ,  k =1 )


        IsMin = cmds.attributeQuery(attrName , node= attrManager   ,minExists=1)
        IsMax = cmds.attributeQuery(attrName , node= attrManager  , maxExists=1)
        if IsMin and IsMax :
            minV = cmds.attributeQuery(attrName , node = attrManager   , minimum=1)
            maxV = cmds.attributeQuery(attrName , node = attrManager   , maximum=1)

            if dataType == "stretch" or dataType == "volume" :
                self._attrDic[dataType]["attr"] = "{}.{}" .format(target , attrName)
                self._attrDic[dataType]["min"] = minV
                self._attrDic[dataType]["max"] = maxV

        if IsMin is None and IsMax is None:
            if dataType == "volumeOffset":
                self._attrDic[dataType]["offsetAttr"] = "{}.{}" .format(target ,attrName)
                pass

    def curve(self , name , degree = 3 , keepLength = True):
        
        if not isinstance(name , self.string_type ):
            raise ("Invalid {} input. Expected a 'string'Type object." .format(name))

        transform , shape = self._findDefineType(name , "nurbsCurve")
        spans = None

        if transform is None and shape is None:
            if degree <=3:
                spans = len(self.Jntlist) + 1
                if spans < 3:
                    raise TypeError("Invalid joint count for generating a curve.")
            if degree == 1:
                spans = len(self.Jntlist)
                if spans < 2:
                    raise TypeError("Invalid joint count for generating a curve.")
                
            Pos = [tuple(cmds.xform(x , q =1 , ws =1, t=1 )) for x in self.Jntlist]
            transform = cmds.curve(n = name , p = Pos , d = degree)
            shape = cmds.listRelatives(transform , s =1)[0]

        if shape and keepLength:
            shape = cmds.rebuildCurve(shape , rt =0 , s = spans , d = degree , end = 1 , kep =1 , kcp = 0  , rpo =1 , kr =1 , ch = 0)

        Cvs = cmds.ls(transform + ".cv[*]" , fl =1)
        self.Cvs = cmds.filterExpand(Cvs , sm = 28, expand=True)
        self.Crv = transform
        self.CrvShape = shape
    def _isCv(self, target):
        
        isCv = cmds.filterExpand(target, sm=28, expand=True)
        return bool(isCv)


    def jointDistance(self, start , end , crv = None ,  Names =[None , None ,None]):

        if crv is None:
            crv = self.CrvShape
        
        IsStart = self._defineObject(start)
        IsEnd = self._defineObject(end)

        startName = self._uniqueName(Names[0])
        endName = self._uniqueName(Names[1])
        distanceName =self._uniqueName(Names[2])

        if Names[0] is None:
            startName = self._uniqueName(start + "_POCIF")
        if Names[1] is None:
            endName = self._uniqueName(end + "_POCIF")
        if Names[2] is None:
            distanceName = self._uniqueName("distance")

        startPos = cmds.xform(start , ws =1, q =1 , t =1)
        endPos = cmds.xform(end , ws =1, q =1 , t =1)

        startParameter = self._get_pararmeterCurve(startPos , crv)
        endParameter = self._get_pararmeterCurve(endPos , crv)

        startPOCIF = self._createPocifNode(startName , crv ,startParameter )
        endPOCIF = self._createPocifNode(endName , crv ,endParameter )

        distance = cmds.createNode("distanceBetween" , n = distanceName)

        for ax in "XYZ":
            cmds.connectAttr(startPOCIF + ".position{}" .format(ax) ,distance + ".point1{}" .format(ax) ,f =1)
            cmds.connectAttr(endPOCIF + ".position{}" .format(ax) ,distance + ".point2{}" .format(ax) ,f =1)
        
        Dict = {"distance" : distance ,"start" : startPOCIF , "end" : endPOCIF}
        return Dict


    def _createPocifNode(Name, CrvName="", Parameter=0, TurnOnPercentage=True):
        """
        'pointOnCurveInfo' 노드를 생성하고, 매개변수 및 백분율 모드를 설정합니다.
        선택적으로 주어진 커브에 연결합니다.

        Args:
            Name (str): 생성할 'pointOnCurveInfo' 노드의 이름.
            CrvName (str, optional): 연결할 커브의 이름. 비어 있으면 연결하지 않습니다.
            Parameter (float, optional): 'parameter' 속성에 설정할 값. 기본값은 0.
            TurnOnPercentage (bool, optional): 'turnOnPercentage' 속성을 활성화할지 여부. 기본값은 True.

        Returns:
            str: 생성된 'pointOnCurveInfo' 노드의 이름.
        """
        POCIF = cmds.createNode('pointOnCurveInfo', n=Name)
        cmds.setAttr("{}.turnOnPercentage".format(POCIF), TurnOnPercentage)
        cmds.setAttr("{}.parameter".format(POCIF), Parameter)

        if cmds.objExists(CrvName):
            cmds.connectAttr("{}.worldSpace[0]".format(CrvName), "{}.inputCurve".format(POCIF), f=1)

        return POCIF



    def _get_pararmeterCurve(self , obj_or_pos , Curve ):
        """
        지정한 오브젝트의 위치 또는 좌표값(list, tuple)에서 가장 가까운 커브의 파라미터 값을 찾아 반환합니다.

        Args:
            obj_or_pos (str or list or tuple): 
                - 파라미터를 찾을 기준 위치가 되는 오브젝트의 이름 (예: "curve1")
                - 또는 3D 월드 공간 좌표 (예: [1.0, 2.0, 3.0] 또는 (1.0, 2.0, 3.0))
            
            Curve (str): 
                - 대상이 되는 커브의 이름 (transform 또는 nurbsCurve shape 이름 모두 가능)

        Returns:
            float: 계산된 커브 파라미터 값. 실패 시 None을 반환할 수 있습니다.
            
        Raises:
            TypeError: 입력값이 유효하지 않을 경우 에러를 발생시킵니다.
        """
        string_type = None
        try:
            string_type = basestring
        except NameError:
            string_type = str

        Position = None
        CrvShp = None
        Parameter = None
        if cmds.objExists(Curve):
            CurveType = cmds.objectType(Curve)

            if CurveType == "transform":
                IsShp = cmds.listRelatives(Curve , s =1  ,type = "nurbsCurve")
                if IsShp:
                    CrvShp = IsShp[0]
            if CurveType == "nurbsCurve":
                CrvShp = Curve
        else:
            raise TypeError (">> Invaild input. Expected a Curve")
        

        if isinstance(obj_or_pos , string_type) and cmds.objExists(obj_or_pos) and Curve:

            PosNode = cmds.createNode("transform")
            cmds.delete(cmds.pointConstraint(obj_or_pos , PosNode , mo = 0))
            Position = cmds.xform(PosNode , ws =1 , t = 1 , q =1)

            cmds.delete(PosNode)
        elif isinstance(obj_or_pos , (list , tuple)) and len(obj_or_pos) == 3 and all(isinstance(x, (int, float)) for x in obj_or_pos):
            Position = obj_or_pos
        else:
            raise TypeError (">> Invalid input. Expected a tuple like (0, 0, 0) or a list/tuple of such tuples.")

        if Position:
            nearestPointOnCrv = cmds.createNode("nearestPointOnCurve")
            for i , x in enumerate("XYZ"):
                cmds.setAttr(nearestPointOnCrv + ".inPosition{}" .format(x) , Position[i])

            cmds.connectAttr(CrvShp + ".worldSpace[0]" , nearestPointOnCrv + ".inputCurve" , f=1)
            Parameter = cmds.getAttr(nearestPointOnCrv + ".parameter")
            if Parameter:
                cmds.delete(nearestPointOnCrv)

            return Parameter
        
    def _findDefineType(self, target, nodeType):
        """
        (내부 헬퍼) 주어진 이름과 타입으로 트랜스폼과 셰이프 노드를 안정적으로 찾아 반환합니다.

        `target`으로 트랜스폼 이름이 들어오든 셰이프 이름이 들어오든, 
        항상 (트랜스폼, 셰이프) 쌍을 튜플로 반환합니다.

        :param str target: 찾을 노드의 이름입니다.
        :param str or list nodeType: 찾을 노드의 타입. 단일 타입은 문자열, 복수 타입은 리스트로 지정합니다.
        :return: tuple: `(트랜스폼_이름, 셰이프_이름)`을 반환합니다. 실패 시 `(None, None)`.
        :주의점: `nucleus`처럼 셰이프가 없는 노드는 `(노드_이름, 노드_이름)` 형태로 반환될 수 있습니다.
        """
        if not target or not cmds.objExists(target):
            return None, None

        if not isinstance(nodeType, list):
            nodeType = [nodeType]

        transform_node = None
        shape_node = None

        if any(cmds.objectType(target, isAType=nt) for nt in nodeType):
            shape_node = target
            parents = cmds.listRelatives(shape_node, parent=True, fullPath=True)
            if parents:
                transform_node = parents[0]
            else:
                transform_node = shape_node
        
        elif cmds.objectType(target, isAType='transform'):
            transform_node = target
            shapes = cmds.listRelatives(transform_node, shapes=True, fullPath=True) or []
            for shp in shapes:
                if any(cmds.objectType(shp, isAType=nt) for nt in nodeType):
                    shape_node = shp
                    break
        
        return transform_node, shape_node




    def _defineObject(self, target, raiseBool=False):
        """
        (내부 헬퍼) 입력된 오브젝트가 문자열인지, 씬에 실제로 존재하는지 검사합니다.
        """
        returnItem = None
        
        if not isinstance(target, self._string_type):
            if raiseBool:
                variableType = type(target).__name__
                raise TypeError("> Invalid type for '{var}'. Expected a string, but got {varType}.".format(var=str(target), varType=variableType))
            return returnItem
            
        
        if not cmds.objExists(target):
            if raiseBool:
                raise ValueError("> Object '{}' does not exist in the scene.".format(target))
            return returnItem
            
        returnItem = target
        return returnItem
    
    def _uniqueName(self , Name , maxLoop = 100 ):
        """
        Maya 씬 내에서 고유한 이름을 생성합니다.

        주어진 이름을 기반으로, 이미 존재하는 경우 숫자 접미사를 붙여
        중복되지 않는 새 이름을 찾아 반환합니다.

        Args:
            Name (str): 기본으로 사용할 이름 문자열.
            maxLoop (int, optional): 고유 이름을 찾기 위해 시도할 최대 반복 횟수. 기본값은 100.

        Returns:
            str: Maya 씬 내에서 고유성이 보장된 이름.
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