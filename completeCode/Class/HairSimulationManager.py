# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om
import re, pprint

class HairSimulationManager:
    def __init__(self , TimeNode="time1"):
        """
        클래스를 초기화하고 시뮬레이션 데이터 구조를 설정합니다.
        
        Maya 씬의 기본 시간 노드('time1')를 찾아보고, 클래스 내부에서 사용할 
        시뮬레이션 데이터 관리용 딕셔너리(`sim_data`)를 생성합니다.

        :param str TimeNode: 시뮬레이션에 사용할 시간 노드의 이름입니다.
        :return: None
        :주의점: 특별한 경우가 아니면 Maya의 기본 'time1' 노드를 사용하는 것이 일반적입니다.
        """
        self.string_type = None
        try:
            self.string_type = basestring
        except NameError:
            self.string_type = str

        self.NucleusName = None
        self.TimeNode = TimeNode

        self._Nucleus  = None
        self._HairSystem = None

        self.sim_data = {
        "nucleus": None,
        "hair_systems": {},
        "follicles": {},
        "time_node": self.TimeNode
        }

    def setHairsystems(self, HairSystemName=None, NucleusName=None):
        """
        Hair System과 Nucleus 노드를 준비하고 연결하는 전체 과정을 처리합니다.
        
        지정한 이름의 노드가 씬에 없으면 새로 생성하며, 
        생성된 노드들을 `cntSimulationNode`를 통해 자동으로 연결합니다.

        :param str HairSystemName: 설정할 Hair System의 이름입니다.
        :param str NucleusName: 설정할 Nucleus의 이름입니다.
        :return: None
        :주의점: 이 메서드는 노드 생성과 연결을 모두 처리하는 고수준 함수입니다. 
                 잘못된 이름 입력 시 ValueError가 발생할 수 있습니다.
        """
        if not cmds.objExists(HairSystemName):
            transform = cmds.createNode("transform", name=HairSystemName)
            cmds.createNode("hairSystem", name=HairSystemName + "Shape", parent=transform)
        
        if not cmds.objExists(NucleusName):
            cmds.createNode("nucleus", name=NucleusName)

        hs_transform, hs_shape = self._findDefineType(HairSystemName, "hairSystem")
        cmds.setAttr(hs_shape + ".active" , True)
        nucleus = None
        if cmds.objectType(NucleusName) == "nucleus":
            nucleus = NucleusName

        if not hs_shape:
            raise ValueError(">> '{}'에서 'hairSystem' 셰이프를 찾을 수 없습니다.".format(HairSystemName))
        if not nucleus:
            raise ValueError(">> '{}'에서 'nucleus' 노드를 찾을 수 없습니다.".format(NucleusName))

        self.sim_data["nucleus"] = nucleus

        if hs_shape not in self.sim_data["hair_systems"]:
            self.sim_data["hair_systems"][hs_shape] = {
                "transform": hs_transform,
                "follicles": [] 
            }
        
        self.sim_data["time_node"] = self.TimeNode

        self.cntSimulationNode(hs_shape, nucleus, self.TimeNode)

    def cntSimulationNode(self, HairSystem, Nucleus, TimeNode="time1"):
        """
        Hair System과 Nucleus, Time 노드 간의 어트리뷰트를 직접 연결합니다.
        
        시뮬레이션에 필요한 각 노드의 `currentTime`, `currentState`, `nextState` 등의 
        핵심 어트리뷰트들을 연결하여 시뮬레이션이 작동하도록 설정합니다.

        :param str HairSystem: 연결할 Hair System 셰이프 노드의 이름입니다.
        :param str Nucleus: 연결할 Nucleus 노드의 이름입니다.
        :param str TimeNode: 연결할 Time 노드의 이름입니다.
        :return: None
        :주의점: 이 함수는 이미 존재하는 노드들을 직접 연결하는 저수준 함수입니다. 
                 노드가 존재하지 않으면 에러가 발생합니다.
        """
        if not cmds.objExists(TimeNode):
            self.TimeNode = cmds.createNode("time", name=self.uniqueName(TimeNode))
            self.Dic["time"] = self.TimeNode

        _, hair_system_shape = self._findDefineType(HairSystem, "hairSystem")
        if not hair_system_shape:
            raise ValueError(">> Failed to find a 'hairSystem' shape from '{}'.".format(HairSystem))

        nucleus_node = None
        if cmds.objectType(Nucleus) == "nucleus":
            nucleus_node = Nucleus

        if not nucleus_node:
            raise ValueError(">> Failed to find a 'nucleus' node from '{}'.".format(Nucleus))

        if TimeNode is not None:
            cmds.connectAttr("{}.outTime".format(TimeNode), "{}.currentTime".format(hair_system_shape), force=True)
            cmds.connectAttr("{}.outTime".format(TimeNode), "{}.currentTime".format(nucleus_node), force=True)

        FindIndex = cmds.getAttr("{}.inputActive".format(nucleus_node), size=True)

        cmds.connectAttr("{}.currentState".format(hair_system_shape), "{}.inputActive[{}]".format(nucleus_node, FindIndex), force=True)
        cmds.connectAttr("{}.startState".format(hair_system_shape), "{}.inputActiveStart[{}]".format(nucleus_node, FindIndex), force=True)
        cmds.connectAttr("{}.outputObjects[{}]".format(nucleus_node, FindIndex), "{}.nextState".format(hair_system_shape), force=True)
        cmds.connectAttr("{}.startFrame".format(nucleus_node), "{}.startFrame".format(hair_system_shape), force=True)

        print(u">> Successfully connected '{}' to '{}'.".format(hair_system_shape, nucleus_node))

    def cntFollicle(self, follicle_name, hair_system_name):
        """
        지정된 Follicle을 Hair System에 연결합니다.
        
        Follicle의 `outHair`를 Hair System의 `inputHair`에, 
        Hair System의 `outputHair`를 Follicle의 `currentPosition`에 연결하고
        이 연결 정보를 `sim_data`에 기록합니다.

        :param str follicle_name: 연결할 Follicle 노드의 이름 (트랜스폼 또는 셰이프).
        :param str hair_system_name: 연결될 Hair System 노드의 이름 (트랜스폼 또는 셰이프).
        :return: None
        :주의점: 연결 전에 Follicle과 Hair System이 모두 `sim_data`에 등록되어 있어야
                 정상적으로 관계가 기록됩니다.
        """
        _, follicle_shape = self._findDefineType(follicle_name, "follicle")
        _, hair_system_shape = self._findDefineType(hair_system_name, "hairSystem")

        if not (follicle_shape and hair_system_shape):
            print(">> Error: Follicle or HairSystem not found.")
            return

        next_hair_index = cmds.getAttr(hair_system_shape + ".inputHair", size=True)
        next_output_index = cmds.getAttr(hair_system_shape + ".outputHair", size=True)

        cmds.connectAttr(follicle_shape + ".outHair", "{}.inputHair[{}]".format(hair_system_shape, next_hair_index), f=True)
        cmds.connectAttr("{}.outputHair[{}]".format(hair_system_shape, next_output_index), follicle_shape + ".currentPosition", f=True)

        if hair_system_shape in self.sim_data["hair_systems"]:
            if follicle_shape not in self.sim_data["hair_systems"][hair_system_shape]["follicles"]:
                self.sim_data["hair_systems"][hair_system_shape]["follicles"].append(follicle_shape)

        if follicle_shape in self.sim_data["follicles"]:
            self.sim_data["follicles"][follicle_shape]["parent_hairSystem"] = hair_system_shape

        print(">> Successfully connected '{}' to '{}'.".format(follicle_shape, hair_system_shape))

    def Follicle(self, FollicleName, Pos=None, Geo=None):
        """
        Follicle 노드를 생성하고, 위치 지정 및 지오메트리 부착을 처리합니다.
        
        지정한 이름의 Follicle이 없으면 새로 생성합니다. 
        `Pos`와 `Geo`가 주어지면, 해당 지오메트리 표면의 `Pos`와 가장 가까운 지점에
        Follicle을 부착합니다.

        :param str FollicleName: 생성할 Follicle의 이름입니다.
        :param list or tuple Pos: Follicle의 월드 좌표 `(x, y, z)` 입니다.
        :param str Geo: Follicle을 부착할 지오메트리(mesh 또는 nurbsSurface)의 이름입니다.
        :return: None
        :주의점: `Geo`에 부착 시 `Pos`를 지정하지 않으면 UV (0.5, 0.5)에 생성됩니다.
                 정확한 위치에 부착하려면 `Pos`와 `Geo`를 함께 제공해야 합니다.
        """
        foliTrf, foliShp = self._findDefineType(FollicleName, "follicle")
        
        if not foliShp:
            NodeName = self.uniqueName(FollicleName)
            foliShp = cmds.createNode("follicle", n=NodeName + "Shape")
            parent_trf = cmds.listRelatives(foliShp, p=1, type="transform")[0]
            foliTrf = cmds.rename(parent_trf, NodeName)
        
        GeoShp = None
        CrvShp = None
        CrvTrf = None
        
        if Pos:
            if not isinstance(Pos, (list, tuple)) or len(Pos) < 3:
                raise TypeError(">> Invalid Pos input. Expected a list or tuple with 3 numbers.")
            if not all(isinstance(x, (int, float)) for x in Pos):
                raise TypeError(">> Invalid Pos input. Components must be numbers.")
            cmds.xform(foliTrf, ws=1, t=Pos)

        if Geo:
            geo_types = ["mesh", "nurbsSurface"]
            for geo_type in geo_types:
                _, GeoShp = self._findDefineType(Geo, geo_type)
                if GeoShp:
                    break

        if GeoShp and foliShp:
            TypeGeoShp = cmds.objectType(GeoShp)
            CntAttr = {"GeoAttr" : None , "FollicleAttr" : None , "GeoMatrix" : ".worldMatrix[0]"  , "FollicleMatrix" : ".inputWorldMatrix"  }
            NOPNAttr = {"GeoAttr" : None , "NOPNMesh" : None , "GeoMatrix" : ".worldMatrix[0]" , "NOPNMatrix" : ".inputMatrix"  }
            NPOOType = None
            GetU = 0.5
            GetV = 0.5
            if TypeGeoShp == "mesh":
                CntAttr["GeoAttr"] = ".outMesh"
                CntAttr["FollicleAttr" ] = ".inputMesh"
                NPOOType = "closestPointOnMesh"
                NOPNAttr["GeoAttr"] = ".worldMesh[0]"
                NOPNAttr["NOPNMesh"] = ".inMesh"
            elif TypeGeoShp == "nurbsSurface":
                CntAttr["GeoAttr"] = ".local"
                CntAttr["FollicleAttr"] = ".inputSurface"
                NPOOType = "closestPointOnSurface"
                NOPNAttr["GeoAttr"] = ".local"
                NOPNAttr["NOPNMesh"] = ".inputSurface"
            
            if CntAttr["GeoAttr"]:
                cmds.connectAttr(GeoShp + CntAttr["GeoAttr"], foliShp + CntAttr["FollicleAttr"], f=1)
                cmds.connectAttr(GeoShp + CntAttr["GeoMatrix"], foliShp + CntAttr["FollicleMatrix"], f=1)

            if Pos and NPOOType:
                NPON = cmds.createNode(NPOOType, n=NodeName + "_NPON")
                cmds.connectAttr(GeoShp + NOPNAttr["GeoAttr"], NPON + NOPNAttr["NOPNMesh"], f=1)
                if NPOOType == "nurbsSurface":
                    cmds.connectAttr(GeoShp + NOPNAttr["GeoMatrix"], NPON + NOPNAttr["NOPNMatrix"], f=1)

                for i, ax in enumerate("XYZ"):
                    cmds.setAttr(NPON + ".inPosition" + ax, Pos[i])

                GetU = cmds.getAttr(NPON + ".result.parameterU")
                GetV = cmds.getAttr(NPON + ".result.parameterV")
                cmds.delete(NPON)

                cmds.setAttr(foliShp + ".parameterU", GetU)
                cmds.setAttr(foliShp + ".parameterV", GetV)

        foliTrf , foliShp = self._findDefineType( foliTrf , "follicle")
        Foli_infoDic =  {"transform" : foliTrf  , "attached_geo" : GeoShp , "input_curve" : None , "simulation_curve" : None , "parent_hairSystem" : None}
        
        self.sim_data["follicles"][foliShp] = Foli_infoDic

    def setSimulationCurve(self , Follicle , inPutCrv ,  outPutCrv = None):
        """
        Follicle에 시작(Input) 커브를 연결하고, 시뮬레이션 결과(Output) 커브를 생성합니다.

        `inPutCrv`는 시뮬레이션의 시작 형태를 결정하며, `outPutCrv`가 지정되면
        `inPutCrv`를 복제하여 시뮬레이션 결과가 적용될 새로운 커브를 만듭니다.

        :param str Follicle: 커브를 연결할 Follicle 노드의 이름입니다.
        :param str inPutCrv: 시뮬레이션 시작 형태로 사용할 커브의 이름입니다.
        :param str outPutCrv: (선택 사항) 생성될 결과 커브의 이름입니다.
        :return: None
        :주의점: `outPutCrv`를 지정하지 않으면 시뮬레이션 결과가 보이지 않습니다. 
                 시뮬레이션 된 헤어(커브)를 확인하려면 반드시 `outPutCrv` 이름을 지정해야 합니다.
        """
        SimCrv = None

        if not isinstance(Follicle , self.string_type):
            raise TypeError(">> Invalid input. Expected a string for the 'Follicle' argument.")
        
        if not isinstance(inPutCrv, self.string_type):
            raise TypeError(">> Invalid input. Expected a string for the 'inPutCrv' argument.")
        
        InputCrvTf , InPutCrvShape= self._findDefineType(inPutCrv ,  "nurbsCurve")
        FoliTf , Foli = self._findDefineType(Follicle , "follicle")

        if Foli and InPutCrvShape:
            cmds.connectAttr(InPutCrvShape + ".local", Foli + ".startPosition", f=1)
            cmds.connectAttr(InputCrvTf+ ".worldMatrix[0]", Foli + ".startPositionMatrix", f=1)
            if Foli in self.sim_data["follicles"]:
                self.sim_data["follicles"][Foli]['input_curve'] = InPutCrvShape
        
        if not outPutCrv is None :
            print (InputCrvTf)
            if InputCrvTf:
                if not isinstance(outPutCrv, self.string_type):
                    raise TypeError(">> Invalid input. Expected a string for the 'outPutCrv' argument.")
                else:
                    print ("sht")
                    outPutCrvName= self.uniqueName(outPutCrv)
                    DupilcateCrv = cmds.duplicate( InputCrvTf , n = outPutCrvName , rc =1)[0]

                    PreSimCrvTf , PreSimCrv = self._findDefineType(DupilcateCrv ,  "nurbsCurve")
                    
                    cmds.connectAttr(Foli + ".outCurve" , PreSimCrv  + ".create" , f=1)
                    if Foli in self.sim_data["follicles"]:
                        self.sim_data["follicles"][Foli]["simulation_curve"] = PreSimCrv

    def showData(self):
        """
        현재 클래스가 관리 중인 `sim_data`의 내용을 콘솔에 보기 쉽게 출력합니다.
        
        디버깅 목적으로 사용되며, 현재 어떤 노드들이 어떻게 연결되어 있는지
        내부 데이터를 통해 확인할 수 있습니다.

        :return: None
        """
        ExtraString = ""
        printString = "\n\n"
        printString += "---"*10 + "simData" + "---" *10
    
        printString += "\n"
        for rootKey , rootValue in self.sim_data.items():
            if any (rootKey == r for r in ['follicles' , 'hair_systems']):
                ExtraString += "> {} =\n" .format(rootKey)

                for middleKey , middleValue in self.sim_data[rootKey ].items():
                    ExtraString += "> " + " "*12 + ">> {} =\n".format(middleKey )

                    for endKey ,endValue in self.sim_data[rootKey][middleKey].items():
                        ExtraString += "> " + " "*24 + ">> {} = {}\n" .format(endKey  , endValue)
                ExtraString += "\n"

            else:
                printString += "> {} = {}\n" .format(rootKey , rootValue)
        printString += ExtraString
        printString += "---"*20 + "-"*7
        print (printString)

    #______________HELPER FUNCTION_______________________#

    def queryNode(self, Target, ShapeBool=True, Index=0):
        """
        Target 노드를 쿼리하여 트랜스폼 또는 셰이프 노드를 반환합니다.
        
        `ShapeBool` 값에 따라 셰이프 노드를 우선적으로 찾거나, 
        주어진 Target 노드 이름을 그대로 반환합니다.

        :param str Target: 쿼리할 노드의 이름입니다.
        :param bool ShapeBool: 셰이프 노드를 쿼리할지 여부입니다. True이면 셰이프를 찾습니다.
        :param int or None Index: 여러 셰이프 중 반환할 셰이프의 인덱스입니다. None이면 전체를 리스트로 반환합니다.
        :return: str or list or None: 찾은 노드의 이름. 못 찾으면 None을 반환합니다.
        :주의점: 하나의 트랜스폼에 여러 셰이프가 있을 경우, `Index`로 원하는 셰이프를
                 정확히 지정해야 합니다.
        """
        returnNode = None

        if not isinstance(Target, self.string_type):
            raise TypeError(">> Invalid input. Expected a string for the 'Target' argument.")
        
        if not cmds.objExists(Target):
            raise ValueError(">> Node '{}' does not exist.".format(Target))
        
        if ShapeBool:
            shapes = []

            if "shape" in cmds.nodeType(Target, inherited=True):
                shapes = [Target]
            else:
                shapes = cmds.listRelatives(Target, shapes=True, fullPath=True)

            if not shapes:
                raise ValueError(">> No shapes found for node '{}'.".format(Target))
            if Index is None:
                returnNode = shapes
            
            elif isinstance(Index, int):
                if 0 <= Index < len(shapes):
                    returnNode = shapes[Index]
                else:
                    raise IndexError(">> Index {} is out of range. Node '{}' has {} shapes (0 to {})."
                                     .format(Index, Target, len(shapes), len(shapes)-1))
            else:
                raise TypeError(">> Index must be an integer or None, not {}.".format(type(Index)))
        else:
            returnNode = Target

        return returnNode

    def _defineNode(self, Node, Type, variable_name_str):
        """
        (내부 헬퍼) 지정된 타입의 노드를 찾아 클래스 변수에 동적으로 할당합니다.
        
        `setattr`를 사용하여 `variable_name_str`로 지정된 이름의 클래스 변수에
        찾은 노드(`TargetNode`)의 이름을 할당합니다.

        :param str Node: 찾을 노드의 이름입니다.
        :param str Type: 찾을 노드의 타입입니다. (예: 'mesh', 'follicle')
        :param str variable_name_str: 값을 할당할 클래스 변수의 이름(문자열)입니다.
        :return: None
        """
        if not isinstance(variable_name_str, self.string_type):
            raise TypeError(">> Invalid input. Expected a string for 'variable_name_str'.")

        transform_node, shape_node = self._findDefineType(Node, Type)

        TargetNode = shape_node

        if TargetNode is None:
            raise ValueError(">> Could not find a node of type '{}' from target '{}'.".format(Type, Node))

        if not hasattr(self, variable_name_str):
            raise AttributeError(">> This class has no attribute named '{}'.".format(variable_name_str))

        try:
            setattr(self, variable_name_str, TargetNode)
            print(u">> Success: self.{} assigned to '{}'.".format(variable_name_str, TargetNode))
        except Exception as e:
            raise RuntimeError(">> Failed to set attribute '{}': {}".format(variable_name_str, e))

    def defineFoli(self , Follicle , HairSystem = None):
        """
        (내부 헬퍼) Follicle 정보를 `sim_data` 딕셔너리에 정의하거나 업데이트합니다.

        씬의 노드 연결 상태를 직접 조회하여 `sim_data`의 내용을 갱신합니다.
        
        :param str Follicle: 정보를 정의할 Follicle 노드의 이름입니다.
        :param str HairSystem: (선택 사항) Follicle과 연결된 Hair System의 이름입니다.
        :return: None
        """
        if not isinstance(Follicle , self.string_type):
            raise TypeError(">> Invalid input. Expected a string for the 'Follicle' argument.")
        ExistFoli = cmds.objExists(Follicle)
        if not ExistFoli:
            raise ValueError(">> '{}'  does not exist." .format(Follicle))
        TargetFoliTf , TargetFoli = self._findDefineType(Follicle , "follicle")
        TargetHairSystemTf , TargetHairSystem = self._findDefineType(HairSystem , "hairSystem")

        if TargetFoli in self.sim_data["follicles"] and TargetHairSystem:
            self.sim_data["follicles"][TargetFoli]["parent_hairSystem"] = TargetHairSystem
        else:
            self.sim_data["follicles"][TargetFoli] = {"transform" : TargetFoliTf ,"attached_geo" : None , "input_curve": None ,   "simulation_curve" : None  , "parent_hairSystem" : TargetHairSystem}

            IsMeshCnt = cmds.listConnections(TargetFoli + ".inputMesh" , s =1, d=0)
            IsSurFaceCnt = cmds.listConnections(TargetFoli + ".inputSurface" , s =1, d=0)
            IsCurveCnt = cmds.listConnections(TargetFoli + ".startPosition" , s =1, d=0)
            IsOutCurveCnt = cmds.listConnections(TargetFoli + ".outCurve" , s =0 , d =1)
            IsHairSystemCnt =cmds.listConnections(TargetFoli + ".currentPosition", s =1, d=0)

            if IsMeshCnt:
                self.sim_data["follicles"][TargetFoli]["attached_geo" ] = IsMeshCnt[0]
            if IsSurFaceCnt:
                self.sim_data["follicles"][TargetFoli]["attached_geo" ] = IsSurFaceCnt[0]
            if IsCurveCnt :
                self.sim_data["follicles"][TargetFoli]["input_curve"] = IsCurveCnt[0]
            if IsOutCurveCnt:
                self.sim_data["follicles"][TargetFoli]["simulation_curve" ] = IsOutCurveCnt[0]
            if IsHairSystemCnt:
                self.sim_data["follicles"][TargetFoli]["parent_hairSystem" ] = IsHairSystemCnt[0]

    def defineHairSystem(self,HairSystem , Follicle = None):
        """
        (내부 헬퍼) Hair System 정보를 `sim_data` 딕셔너리에 정의하거나 업데이트합니다.
        
        씬의 노드 연결 상태를 직접 조회하여 `sim_data`의 내용을 갱신합니다.

        :param str HairSystem: 정보를 정의할 Hair System 노드의 이름입니다.
        :param str Follicle: (선택 사항) Hair System과 연결된 Follicle의 이름입니다.
        :return: None
        """
        if not isinstance(HairSystem , self.string_type):
            raise TypeError(">> Invalid input. Expected a string for the 'HairSystem' argument.")
        ExistHairSystem = cmds.objExists(HairSystem)
        if not ExistHairSystem:
            raise ValueError(">> '{}'  does not exist." .format(HairSystem))
        TargetHairSystemTf , TargetHairSystem = self._findDefineType(HairSystem , "hairSystem")
        TargetFoliTf , TargetFoli = self._findDefineType(Follicle , "follicle")

        if TargetHairSystem in self.sim_data["hair_systems"] and TargetFoli:
            self.sim_data["hair_systems"][TargetHairSystem]["follicles"].append(TargetFoli)
        else:
            self.sim_data["hair_systems"][TargetHairSystem] = {"transform": None , "follicles" :  []}
            self.sim_data["hair_systems"][TargetHairSystem]["transform"] = TargetHairSystemTf
            IsFollicleCnt = cmds.listConnections(TargetHairSystem  + ".outputHair" , s =0  ,d=1 )
            if IsFollicleCnt:
                for x in IsFollicleCnt:
                    self.sim_data["hair_systems"][TargetHairSystem]["follicles"].append(x)

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
            return (None, None)

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

            print (" >> {}" .format(transform_node))
            shapes = cmds.listRelatives(transform_node, shapes=True, fullPath=True) or []
            for shp in shapes:
                if any(cmds.objectType(shp, isAType=nt) for nt in nodeType):
                    shape_node = shp
                    break
        
        return transform_node, shape_node

    def uniqueName(self, Name, maxLoop=100):
        """
        (내부 헬퍼) 씬에서 중복되지 않는 유니크한 노드 이름을 생성하여 반환합니다.
        
        'object1'이 존재하면 'object2'를 반환하고, 'obj_001'이 존재하면 'obj_002'처럼
        패딩을 유지하여 이름을 생성합니다.

        :param str Name: 기본으로 사용할 이름입니다.
        :param int maxLoop: 유니크한 이름을 찾기 위해 시도할 최대 횟수입니다.
        :return: str: 씬에 존재하지 않는 새로운 이름.
        :주의점: `maxLoop` 횟수 안에 유니크한 이름을 찾지 못하면 마지막으로 시도한 이름을
                 반환하므로, 이름이 중복될 가능성이 있습니다.
        """
        try:
            string_type = basestring
        except NameError:
            string_type = str
        
        if not isinstance(Name, string_type):
            return None
        
        if not cmds.objExists(Name):
            return Name

        returnName = None
        formatName = Name + "{}"
        start_count = 1
        
        isIntPattern = r"(.+?)([0-9]+)$"
        isInt = re.search(isIntPattern, Name)
        
        if isInt:
            name_prefix = isInt.group(1)
            found_number = int(isInt.group(2))
            
            padding = len(isInt.group(2))
            formatName = name_prefix + "{:0%dd}" % padding
            start_count = found_number + 1
            
        for i in range(start_count, maxLoop + start_count):
            try_name = formatName.format(i)
            
            if not cmds.objExists(try_name):
                return try_name
        
        return try_name


HairSys = HairSimulationManager()
HairSys.setHairsystems("hairSystem" , "nucleus")

HairSys.Follicle("Foli" , (0,0,0) )
HairSys.cntFollicle("Foli" ,"hairSystem"  )
HairSys.setSimulationCurve("Foli" , "xgGuide564_tempCurve1_Test" , "Test")
#HairSys.showData()
#pprint.pprint(HairSys.sim_data)
