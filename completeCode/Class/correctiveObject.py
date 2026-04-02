import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om
import re ,pprint

class correctiveObject:
    """
    'Corrective (보정)' 오브젝트 셋업을 관리하는 클래스입니다.
    
    이 클래스의 주 목적은 startObject와 endObject (예: 상박, 하박 조인트)의
    관계를 기반으로 target (예: 팔꿈치 보정 조인트)을 구동하는 리깅 시스템을
    자동으로 구축하는 것입니다.
    
    핵심 로직:
    1. 두 개의 헬퍼 로케이터(positionLoc, rotateLoc)를 생성합니다.
    2. 이 로케이터들을 startObject와 endObject 사이에 구속(parentConstraint)합니다.
    3. 'build' 시점의 두 로케이터 사이의 벡터를 '기준 축'으로 저장합니다.
    4. 씬이 움직일 때, 헬퍼 로케이터의 현재 위치를 기반으로
       '기준 축' 방향으로 얼마나 이동했는지 수학적 노드 네트워크(dot product 등)를 통해 계산합니다.
    5. 이 계산된 값(보통 스칼라 값)을 target 오브젝트의 상위 그룹(_correctiveGrp)의
       Translate 값으로 연결하여 보정 조인트가 자동으로 움직이게 만듭니다.
    
    사용 예시:
    # 1. 초기화 (운전자가 될 두 오브젝트 지정)
    Test = correctiveObject("L_Leg_2_Add_Jnt" , "L_Knee_Jnt")
    # 2. 구동될 타겟과 그룹 설정 (타겟: 보정 조인트)
    Test.defineCorrectiveTarget("L_Knee_Corrective_Jnt")
    # 3. 계산에 사용할 헬퍼 로케이터 지정
    Test.defineCorrectiveObjects("L_Knee_PositionLoc" , "L_Knee_RotateLoc")
    # 4. 전체 시스템 빌드 (노드 네트워크 생성 및 연결)
    Test.build()
    """
    
    def __init__(self , startObject , endObject):
        """
        클래스 초기화
        
        Args:
            startObject (str): 시스템을 구동할 첫 번째 오브젝트 (예: 허벅지 조인트)
            endObject (str): 시스템을 구동할 두 번째 오브젝트 (예: 종아리 조인트)
        """

        self._string_type = None # 파이썬 2/3 호환용 문자열 타입
        self.target = None # 구동될 타겟 오브젝트 (예: L_Knee_Corrective_Jnt)
        self._correctiveGrp = None # 타겟의 바로 상위 그룹 (노드 네트워크의 출력이 연결됨)
        self.mainGrp = None # 전체 시스템의 최상위 그룹
        self.positionLoc = None # 계산에 사용될 헬퍼 로케이터 1
        self.rotateLoc = None # 계산에 사용될 헬퍼 로케이터 2
        self._Dict = None # 생성된 노드 네트워크 정보를 담을 딕셔너리
        
        # Python 2/3 호환성을 위해 basestring 시도
        try:
            self._string_type = basestring
        except NameError:
            self._string_type = str

        # 시작/끝 오브젝트가 실제로 존재하는지 확인하고 저장
        self.startObject =self._defineObject(startObject , True)
        self.endObject =self._defineObject(endObject, True)


    def defineCorrectiveTarget(self, target , correctiveGrp = None,  MainGrp = None):
        """
        구동될 '타겟' 오브젝트와 그 상위 계층(그룹)을 정의합니다.
        
        Args:
            target (str): 보정될 오브젝트 (예: 조인트)
            correctiveGrp (str, optional): 타겟의 상위 보정 그룹. 없으면 자동 생성.
            MainGrp (str, optional): 전체 시스템의 최상위 그룹. 없으면 자동 생성.
        """

        # 타겟 오브젝트가 존재하는지 확인
        self.target = self._defineObject(target , True)

        # 사용자가 그룹을 제공했는지 확인
        if correctiveGrp:
            self._correctiveGrp = self._defineObject(correctiveGrp)
        if MainGrp:
            self.mainGrp = self._defineObject(MainGrp)

        # 그룹이 제공되지 않았다면, 타겟 기준으로 새로 생성
        if self._correctiveGrp is None:
            # _Grping(target, Count, Suffix, ParentBool)
            self._correctiveGrp = self._Grping(target , 1 ,["_correctiveGrp"] , False )[0]
        if self.mainGrp is None:
            self.mainGrp = self._Grping(target , 1 , ["_mainGrp"] , False)[0] # [0] 추가 (list 반환)

        # 계층 구조 설정: MainGrp > _correctiveGrp > target
        try: 
            cmds.parent(self._correctiveGrp ,self.mainGrp )
            cmds.parent(self.target  ,self._correctiveGrp)
        except:
            # 이미 올바른 부모-자식 관계일 경우 에러가 날 수 있으므로 pass
            pass
        
        # MainGrp의 방향을 startObject의 방향과 일치시킴 (시스템의 기준 방향 설정)
        cmds.delete(cmds.orientConstraint(self.startObject ,self.mainGrp  ,mo =0))

        # 타겟 오브젝트에 min/max 클램프용 어트리뷰트 추가
        if self.target:
            self._addAttrForTarget(self.target)


    def createCorrectiveObjects(self ,position = None  , rotate = None , prePositionName = None , preRotateName = None):
        """
        [헬퍼 메서드] 헬퍼 로케이터(positionLoc, rotateLoc)를 생성합니다.
        
        위치/이름을 지정하지 않으면 startObject/endObject의 위치에
        이름을 붙여 자동으로 생성합니다.
        
        Args:
            position (list/tuple/str, optional): positionLoc의 위치 또는 기존 로케이터 이름.
            rotate (list/tuple/str, optional): rotateLoc의 위치 또는 기존 로케이터 이름.
            prePositionName (str, optional): positionLoc의 커스텀 이름.
            preRotateName (str, optional): rotateLoc의 커스텀 이름.
        """
        positionLoc = None
        rotateLoc = None
        positionPos = None
        rotatePos = None
        positionName =None
        rotateName  = None

        # 1. 로케이터 이름 결정
        if prePositionName is None:
            positionName = self._uniqueName(self.startObject + "_positionLoc") 
        elif isinstance(prePositionName , self._string_type):
            positionName = self._uniqueName(prePositionName)
            
        if preRotateName  is None:
            rotateName   = self._uniqueName(self.endObject + "_rotateLoc")
        elif isinstance(preRotateName , self._string_type):
            rotateName = self._uniqueName(preRotateName )

        # 2. positionLoc 생성/지정
        if position is None:
            # 기본값: startObject의 월드 위치
            positionPos = cmds.xform(self.startObject , ws =1 ,t =1 ,q =1)
            positionLoc = self._CreateOrGet_Loc(positionPos ,positionName )[0]
        elif isinstance(position ,(list , tuple) ):
            # 사용자가 위치 (list) 지정
            if len(position) >= 3:
                positionLoc = self._CreateOrGet_Loc(position ,positionName )[0]
            else:
                raise IndexError("> Invalid 'Data Type' input. Expected 'Data Type' to have at least 3 items ")
        elif isinstance(position , self._string_type) and cmds.objExists(position):
            # 사용자가 기존 오브젝트 이름 (str) 지정
            positionLoc = position

        # 3. rotateLoc 생성/지정
        if rotate is None:
            # 기본값: endObject의 월드 위치
            rotatePos = cmds.xform(self.endObject , ws =1 , t =1 ,q =1)
            rotateLoc = self._CreateOrGet_Loc(rotatePos ,rotateName)[0]
        elif isinstance(rotate ,(list , tuple) ):
            if len(rotate) >= 3:
                rotateLoc = self._CreateOrGet_Loc(rotate,rotateName)[0]
            else:
                raise IndexError("> Invalid 'Data Type' input. Expected 'Data Type' to have at least 3 items ")
        elif isinstance(rotate, self._string_type) and cmds.objExists(rotate):
            rotateLoc = rotate

        # 4. 두 로케이터가 모두 준비되면, defineCorrectiveObjects 호출
        if positionLoc and rotateLoc:
            self.defineCorrectiveObjects(positionLoc , rotateLoc)          


    def defineCorrectiveObjects(self, positionLoc , rotateLoc ):
        """
        헬퍼 로케이터(positionLoc, rotateLoc)를 클래스에 등록하고 계층 구조에 포함시킵니다.
        사용자 예제에서 이 함수를 직접 호출했습니다.
        """

        self.positionLoc = self._defineObject(positionLoc, True)
        self.rotateLoc = self._defineObject(rotateLoc , True)

        # 계층 구조 설정: positionLoc > rotateLoc
        positionChild = cmds.listRelatives(self.positionLoc , c =1) or [] # None 방지
        if not self.rotateLoc in positionChild:
            cmds.parent(self.rotateLoc , self.positionLoc)
            
        # positionLoc을 그룹화하여 컨트롤하기 쉽게 만듦
        positionGrp = self._Grping(self.positionLoc , 1)
        
        # 이 positionGrp을 mainGrp의 자식으로 넣음
        if self.mainGrp:
            mainChild = cmds.listRelatives(self.mainGrp ,c =1) or [] # None 방지
            if not positionGrp[0] in mainChild:
                cmds.parent(positionGrp[0] , self.mainGrp)





    def createNodeSetting(self , positionDotName  , normalDotName ,intersectionDvName , distanceMdName , clampName  = None):
        """
        핵심 수학 노드 네트워크를 생성합니다.
        
        이 네트워크는 두 벡터의 Dot Product(내적)와 나누기, 곱하기를 조합하여
        최종적으로 _correctiveGrp를 구동할 translate 값을 계산합니다.
        
        Args:
            positionDotName (str): 'positionDot' (vectorProduct) 노드 이름
            normalDotName (str): 'normalDot' (vectorProduct) 노드 이름
            intersectionDvName (str): 'intersectionDv' (multiplyDivide) 노드 이름
            distanceMdName (str): 'distanceMd' (multiplyDivide) 노드 이름
            clampName (str, optional): 'clamp' 노드 이름. (제공되면 클램프 기능 추가)
        """
        NameList= [positionDotName , normalDotName , intersectionDvName , distanceMdName ]
        positionDot = None
        normalDot = None
        intersectionDv = None
        distanceMd = None
        clampNode= None

        # 생성된 노드 정보와 주요 어트리뷰트 경로를 저장할 딕셔너리
        Dict = { 
            "positionDot" :  None ,
            "normalDot" : None ,
            "clamp": None  ,
            "intersectionDv" : None ,
            "distanceMd" : None ,
            "outNode" : None , # 최종 출력을 담당하는 노드
            "outNode_output" : None , # 최종 출력 어트리뷰트
            "positionDot_input1" : None ,
            "positionDot_input2" : None ,
            "normalDot_input1" : None ,
            "normalDot_input2" : None ,
            "distanceDv_input1" : None,
            "clampMin_output" : None , # (버그 수정) clampMin_input
            "clampMax_output" : None  # (버그 수정) clampMax_input
            }
        
        #### 1. 입력값 검증 (이름들이 문자열인지)
        if clampName:
            NameList.append(clampName)

        for nameString in NameList:
            if not isinstance(nameString , self._string_type ):
                variableType = type(nameString).__name__
                raise TypeError("> Invalid type for '{var}'.Expected a string, but got {varType} (value: {var})" .format(var = str(nameString), varType = variableType)   ) 
        
        #### 2. 노드 생성 (또는 기존 노드 가져오기)
        
        # positionDot (Dot Product 용)
        positionDot =  self._existType(positionDotName ,"vectorProduct" )
        if positionDot is None:
            positionDot = cmds.createNode("vectorProduct", n = self._uniqueName(positionDotName) )
        
        # normalDot (Dot Product 용)
        normalDot = self._existType(normalDotName ,"vectorProduct" )
        if normalDot is None:
            normalDot = cmds.createNode("vectorProduct",n = self._uniqueName(normalDotName) )

        # intersectionDv (Divide 용)
        intersectionDv = self._existType(intersectionDvName, "multiplyDivide")
        if intersectionDv is None:
            intersectionDv = cmds.createNode("multiplyDivide",n = self._uniqueName(intersectionDvName) )

        # distanceMd (Multiply 용)
        distanceMd = self._existType(distanceMdName ,"multiplyDivide")
        if distanceMd is None:
            distanceMd = cmds.createNode("multiplyDivide",n = self._uniqueName(distanceMdName) )

        # clamp (범위 제한용, 옵션)
        if clampName:
            clampNode = self._existType(clampName , "clamp")
            if clampNode is None:
                clampNode = cmds.createNode("clamp",n = self._uniqueName(clampName) )

        #### 3. 딕셔너리에 노드 정보 저장
        Dict["positionDot" ] = positionDot 
        Dict["normalDot" ] = normalDot
        Dict["intersectionDv"] = intersectionDv
        Dict["distanceMd"] = distanceMd
        
        # 기본 출력은 distanceMd
        Dict["outNode"] = distanceMd
        Dict["outNode_output"] = "{}.output" .format(distanceMd)

        # clamp가 있다면, clamp 관련 정보 갱신
        if clampName:
            Dict["clamp"] = clampNode
            Dict["clampMin_input"] = "{}.min" .format(clampNode) # 이름 수정 (input)
            Dict["clampMax_input"] = "{}.max" .format(clampNode) # 이름 수정 (input)
            # 최종 출력 노드를 clamp로 변경
            Dict["outNode"] = Dict["clamp"]
            Dict["outNode_output"] = "{}.output".format(clampNode)

        # 연결에 사용할 입력 어트리뷰트 경로 저장
        Dict["positionDot_input1"] = "{}.input1" .format(positionDot )
        Dict["positionDot_input2"] = "{}.input2" .format(positionDot )
        Dict["normalDot_input1"] = "{}.input1" .format(normalDot )
        Dict["normalDot_input2"] = "{}.input2" .format(normalDot)
        Dict["distanceDv_input1"] = "{}.input1".format(distanceMd)

        #### 4. 노드 기본값 설정
        # vectorProduct: operation 1 = Dot Product
        cmds.setAttr(positionDot + ".operation" ,1)
        cmds.setAttr(normalDot +".operation" ,1)
        cmds.setAttr(positionDot + ".normalizeOutput" , 0 )
        cmds.setAttr(normalDot + ".normalizeOutput" , 0 )

        # multiplyDivide: operation 2 = Divide, operation 1 = Multiply
        cmds.setAttr(intersectionDv + ".operation" ,2) # 나누기
        cmds.setAttr(distanceMd + ".operation" ,1) # 곱하기
        
        #### 5. 노드 간 내부 연결
        # (positionDot.out / normalDot.out)
        cmds.connectAttr(positionDot + ".output" , intersectionDv + ".input1" , f=1 )
        cmds.connectAttr(normalDot + ".output" , intersectionDv + ".input2" , f=1 )

        # (결과값) * (distanceMd.input1)
        cmds.connectAttr(intersectionDv + ".output" , distanceMd + ".input2" ,f =1 )

        # (옵션) clamp 연결
        if clampNode:
            cmds.connectAttr(distanceMd + ".output" , clampNode + ".input"  , f =1)

        # 완성된 딕셔너리를 self._Dict에 저장
        self._Dict = Dict


    def build(self):
        """
        모든 컴포넌트를 조립하고 연결하여 시스템을 완성합니다.
        
        1. 헬퍼 로케이터(positionLoc, rotateLoc)의 현재(빌드) 위치를 기준으로
           '기준 축' 벡터 (diff_unitV)를 계산합니다.
        2. 노드 네트워크가 없으면 createNodeSetting()을 호출하여 생성합니다.
        3. 헬퍼 로케이터들이 startObject/endObject를 따라다니도록 
           parentConstraint를 설정합니다.
        4. 헬퍼 로케이터의 .translate를 노드 네트워크의 입력으로 연결합니다.
        5. '기준 축' 벡터를 노드 네트워크의 고정 입력으로 설정합니다.
        6. 타겟에 추가했던 min/max 어트리뷰트를 clamp 노드에 연결합니다.
        7. 노드 네트워크의 최종 출력을 _correctiveGrp.translate에 연결합니다.
        """
        positionV = None
        RotateV = None
        if self.positionLoc and self.rotateLoc :
            # 1. '기준 축' 계산
            positionPos = cmds.xform(self.positionLoc , q =1 ,ws =1 ,t =1)
            rotatePos = cmds.xform(self.rotateLoc , q =1 ,ws =1 , t =1)

            positionV = om.MVector(positionPos[0] , positionPos[1] , positionPos[2])
            RotateV = om.MVector(rotatePos[0] , rotatePos[1] , rotatePos[2])

            diffV = (positionV - RotateV) # 기준 벡터
            diff_unitV = diffV.normal()   # 기준 축 (방향, 크기 1)
            diff_pos = [diff_unitV.x , diff_unitV.y ,diff_unitV.z] # 리스트로 변환
            
            pprint.pprint(self._Dict) # 디버깅용
            
            # 2. 노드 네트워크 생성 (없을 경우)
            if self._Dict is None:
                NameSuffixs =["_positionVPT" , "_normalVPT" , "_intersectionDv"  , "_distanceMd" , "_clamp" ]
                nodeNames = []
                for suffix in NameSuffixs:
                    NameSet = self._uniqueName(self.target + suffix )
                    nodeNames.append(NameSet)
                print (nodeNames)
                self.createNodeSetting(nodeNames[0] , nodeNames[1] , nodeNames[2] , nodeNames[3] , nodeNames[4] )
            
            # 디버깅용
            pprint.pprint(self._Dict) 
            
            # 3. 헬퍼 로케이터 구속
            # startObject와 endObject의 중간쯤을 따라다니도록 설정
            cmds.parentConstraint(self.startObject , self.endObject , self.positionLoc , mo =1 , skipRotate=["x","y","z"])
            cmds.parentConstraint(self.startObject , self.endObject , self.rotateLoc , mo =1 , skipRotate=["x","y","z"])

            # 4. 노드 네트워크 입력 연결 (움직이는 값)
            cmds.connectAttr(self.positionLoc +".translate" , self._Dict["positionDot_input1"],f =1)
            cmds.connectAttr(self.rotateLoc + ".translate" , self._Dict["positionDot_input2"],f =1)
            cmds.connectAttr(self.rotateLoc + ".translate" , self._Dict["normalDot_input2"],f =1)
            
            RGBs = "RGB" # clamp 노드는 min/max가 R,G,B 어트리뷰트로 되어 있음
            
            # 5. min/max 어트리뷰트 연결 및 '기준 축' 설정 (고정값)
            for i, ax in enumerate("XYZ"):
                # 5a. 타겟의 min/max 어트리뷰트를 clamp 노드에 연결
                cmds.connectAttr(self.target + ".min{}" .format(ax) , "{}{}" .format(self._Dict["clampMin_input"] , RGBs[i]) ,f =1)
                cmds.connectAttr(self.target + ".max{}" .format(ax) , "{}{}" .format(self._Dict["clampMax_input"] , RGBs[i]) ,f =1)
                
                # 5b. '기준 축' (diff_pos)을 노드 네트워크의 고정 입력으로 설정
                cmds.setAttr( "{}{}" .format(self._Dict["normalDot_input1"] ,ax) ,diff_pos[i] )
                cmds.setAttr( "{}{}" .format(self._Dict["distanceDv_input1"] ,ax) ,diff_pos[i] )
            
            print (self._correctiveGrp) # 디버깅
            
            # 6. 최종 출력 연결
            # 노드 네트워크의 최종 출력(_Dict["outNode_output"])을
            # _correctiveGrp.translate에 연결
            cmds.connectAttr(self._Dict["outNode_output"] , self._correctiveGrp+ ".translate" , f=1)


    # =================================================================
    # (이하 헬퍼/유틸리티 메서드)
    # =================================================================
    def _addAttrForTarget(self , target):
        """
        (내부 헬퍼) 타겟 오브젝트에 min/max 어트리뷰트를 추가합니다.
        (minX, maxX, minY, maxY, minZ, maxZ)
        이 어트리뷰트들은 나중에 clamp 노드와 연결되어 구동 범위를 제한합니다.
        """
        workTarget = self._defineObject(target , True)

        if workTarget:
            # min/max와 XYZ를 조합하여 어트리뷰트 이름 생성
            for attr in ["min" , "max"]:
                for ax in "XYZ":
                    AttrName = "{}{}".format(attr , ax)
                    # 어트리뷰트가 이미 있는지 확인
                    AttrFind = cmds.attributeQuery(AttrName , node=target , exists=1)
                    if not AttrFind:
                        # 없으면 keyable(k=1) 속성으로 추가
                        cmds.addAttr(target , ln = AttrName ,  attributeType='double' ,k =1)

    def _existType(self, target , targetType , checkShape=False ,raiseBool = False):
        """
        (내부 헬퍼) 오브젝트가 존재하는지, 그리고 올바른 타입인지 확인합니다.
        checkShape=True 이면, 트랜스폼의 쉐입 노드 타입을 검사합니다.
        
        *참고: 원본 코드의 로직 버그를 수정했습니다. (checkShape=True 일 때
         'transform' 타입이 아닌 'mesh' 등을 바로 검사할 수 있도록 수정)
        """
        # 1. 문자열 타입 확인
        if not isinstance(target , self._string_type):
            variableType = type(target).__name__
            raise TypeError("> Invalid type for '{var}'.Expected a string, but got {varType} (value: {var})" .format(var = str(target), varType = variableType)   ) 
        
        # 2. 존재 여부 확인
        if not cmds.objExists(target):
            if raiseBool:
                raise ValueError("> {} does not exist." .format(target))
            return None
        
        # 3. 타입 확인 (로직 수정됨)
        if checkShape:
            # 3a. 쉐입 노드 타입 검사
            targetMainType = cmds.objectType(target)
            if targetMainType != 'transform':
                if raiseBool:
                    raise TypeError("> {} is not a transform (is '{}'), so shape check failed.".format(target, targetMainType))
                return None

            shapes = cmds.listRelatives(target, shapes=True, path=True) or []
            foundShape = False
            shapeTypes = [] 

            for shape in shapes:
                shapeType = cmds.objectType(shape)
                shapeTypes.append(shapeType)
                if shapeType == targetType:
                    foundShape = True
                    break 
            
            if not foundShape:
                if raiseBool:
                    if not shapeTypes:
                        raise TypeError("> {} has no shapes. Expected shape type '{}'.".format(target, targetType))
                    else:
                        raise TypeError("> {} has shapes of type {}, but not the expected '{}'".format(target, list(set(shapeTypes)), targetType))
                return None
        else:
            # 3b. 기본 노드 타입 검사
            currentType = cmds.objectType(target)
            if not currentType == targetType:
                if raiseBool:
                    raise TypeError("> {} is wrong type. Expected '{}', but got '{}'".format(target, targetType, currentType))
                return None
        
        # 모든 검사 통과
        return target

    def _defineObject(self , target , raiseBool = False):
        """
        (내부 헬퍼) 오브젝트가 문자열이고, 씬에 존재하는지 간단히 확인합니다.
        _existType 보다 가벼운 버전의 검사기입니다.
        """
        returnItem = None
        # 1. 문자열 타입 확인
        if not isinstance(target ,self._string_type):
            if raiseBool:
                variableType = type(target).__name__
                raise TypeError("> Invalid type for '{var}'.Expected a string, but got {varType} (value: {var})" .format(var = str(target), varType = variableType)   ) 
            return returnItem
        # 2. 존재 여부 확인
        if not cmds.objExists( target):
            if raiseBool:
                raise ValueError("> {} does not exist." .format(target))
            return returnItem
            
        returnItem =  target
        return returnItem
         
    def _Grping(self, target, Count, Grp_Suffix=["_Grp", "_Offset", "_Prime", '_GrpPrime'] ,ParentBool =  True,  reverseBool = False):
        """
        (내부 헬퍼) 타겟 오브젝트를 기준으로 그룹 계층을 생성합니다.
        
        이 함수는 그룹을 '안쪽'부터 '바깥쪽' 순서로 생성합니다.
        (예: Grp1 생성 -> Grp2 생성 -> Grp1을 Grp2에 페어런트)
        
        결과 계층: Grp_Suffix[Count-1] > ... > Grp_Suffix[1] > Grp_Suffix[0]
        
        Args:
            target (str): 기준이 될 오브젝트
            Count (int): 생성할 그룹 수
            Grp_Suffix (list): 그룹 이름 접미사 리스트
            ParentBool (bool): True이면, 최종적으로 target을 가장 안쪽 그룹(Groups[0])에 페어런트.
            reverseBool (bool): True이면, 반환되는 리스트를 [바깥쪽...안쪽] 순으로 뒤집음.
            
        Returns:
            list: 생성된 그룹 리스트. 기본값은 [안쪽, ..., 바깥쪽] 순서.
        """
        
        # --- 검증 시작 ---
        if not isinstance(target, self._string_type):
            variableType = type(target).__name__
            raise TypeError("> Invalid type for 'target'.Expected a string, but got {varType} (value: {var})".format(var=str(target), varType=variableType))
        if not isinstance(Count, int):
            variableType = type(Count).__name__
            raise TypeError("> Invalid type for 'Count'.Expected a int, but got {varType} (value: {var})".format(var=str(Count), varType=variableType))
        if not isinstance(Grp_Suffix, (list, tuple)):
            variableType = type(Grp_Suffix).__name__
            raise TypeError("> Invalid type for 'Grp_Suffix'.Expected a list or tuple, but got {varType} (value: {var})".format(var=str(Grp_Suffix), varType=variableType))
        if len(Grp_Suffix) < Count:
            raise ValueError("> 'Grp_Suffix' list is too short. Need {need} items, but only found {found}.".format(need=Count, found=len(Grp_Suffix)))
        if not cmds.objExists(target):
            raise ValueError("> {} does not exist.".format(target))
        # --- 검증 끝 ---
        
        Groups = []   # 생성된 그룹을 저장할 리스트 (안쪽 -> 바깥쪽 순)
        Parent_Group = None # 직전에 생성된 그룹 (다음 그룹의 자식이 됨)

        # Count 만큼 루프
        for i, x in enumerate(Grp_Suffix[:Count]):
            # 1. 새 그룹 생성
            Group = cmds.createNode("transform", n= self._uniqueName("{}{}".format(target, x)))

            # 2. 이전에 생성한 그룹(Parent_Group)이 있다면, 
            #    새로 만든 그룹(Group)의 자식으로 넣음
            if Parent_Group:
                cmds.parent(Parent_Group, Group)  
            
            # 3. 방금 만든 그룹(Group)을 다음 루프를 위해 Parent_Group으로 지정
            Parent_Group = Group  
            Groups.append(Group) # 리스트에 추가
            
        # 최종 계층: Groups[-1] > ... > Groups[1] > Groups[0]
        
        # 가장 바깥쪽 그룹(Groups[-1])을 target의 위치/방향으로 스냅
        cmds.delete(cmds.parentConstraint(target, Groups[-1]))
        
        if ParentBool :
            # target을 가장 안쪽 그룹(Groups[0])의 자식으로 넣음
            cmds.parent(target, Groups[0])
            
        if reverseBool:
            # 리스트를 뒤집음 (바깥쪽 -> 안쪽 순)
            Groups = Groups[::-1]
            
        return Groups
    
    def _CreateOrGet_Loc(self,obj_or_pos , Name  = "locator" , MaxWhileCount =100):
        """
        (내부 헬퍼) 로케이터를 생성하거나, 이미 존재하면 해당 로케이터를 반환합니다.

        *참고: 원본 코드의 버그를 수정했습니다. (objType이 "locator"일 때 
         None 변수를 참조하던 문제 수정)
        
        Args:
            obj_or_pos (str or list or tuple): 오브젝트 이름 또는 월드 좌표 [x,y,z]
            Name (str): 생성 시 사용할 이름
        
        Returns:
            list: [locator_transform, locator_shape]
        """
        string_type = self._string_type # __init__에서 설정한 값 사용
        
        loc = None
        shape = None
        
        # 1. 입력이 문자열이고, 존재하는 오브젝트일 경우
        if isinstance(obj_or_pos , string_type) and cmds.objExists(obj_or_pos):
            objType = cmds.objectType(obj_or_pos)
            
            if objType == "locator":
                # 입력이 쉐입 노드일 경우
                # (버그 수정) None이었던 'loc' 대신 'obj_or_pos'를 사용
                loc = cmds.listRelatives(obj_or_pos, p=1, type="transform")[0]
                shape = obj_or_pos
            elif objType == "transform":
                # 입력이 트랜스폼 노드일 경우
                locShape = cmds.listRelatives(obj_or_pos, s=1, type="locator")
                if locShape:
                    loc = obj_or_pos
                    shape = locShape[0]
            # (만약 로케이터가 아닌 다른 오브젝트면 loc, shape은 None으로 유지됨)

        # 2. 고유 이름 생성
        if Name == "" and isinstance(obj_or_pos , string_type):
            Name = loc # 이미 로케이터였다면 해당 이름을 사용
            
        count = 0
        loc_name = ""
        # 이름이 중복되지 않도록 숫자 suffix 붙여가며 확인
        for i in range(MaxWhileCount):
            count_str = str(i) if i > 0 else ""
            temp_name = "{}{}" .format(Name , count_str ) # (수정) count -> count_str
            if not cmds.objExists(temp_name):
                loc_name = temp_name
                break
        if not loc_name :
            raise RuntimeError("Could not generate a unique locator name for: {}{}" .format(Name , count_str )) # (수정) count -> count_str
        
        
        # 3. 로케이터 생성 (loc, shape이 여전히 None일 경우)
        if not loc and not shape:
            if isinstance(obj_or_pos , (list , tuple) ):
                # 입력이 좌표 [x,y,z] 였을 경우
                if isinstance(obj_or_pos , tuple):
                    obj_or_pos = list(obj_or_pos)

                loc = cmds.spaceLocator(n = loc_name)[0]
                shape = cmds.listRelatives(loc , s =1)[0]
                cmds.xform(loc , ws =1 , t = obj_or_pos) # 해당 좌표로 이동
                
            elif isinstance(obj_or_pos ,  string_type):
                # 입력이 오브젝트 이름이었을 경우 (로케이터는 아니었음)
                loc = cmds.spaceLocator(n = loc_name)[0]
                shape = cmds.listRelatives(loc , s =1)[0]
                # 해당 오브젝트 위치/방향으로 스냅
                cmds.delete(cmds.parentConstraint(obj_or_pos , loc , mo = 0))

        return [loc ,shape]

    def _uniqueName(self, Name, maxLoop=100):
        """
        (내부 헬퍼) 씬에서 중복되지 않는 유니크한 노드 이름을 생성하여 반환합니다.
        
        'object1'이 존재하면 'object2'를 반환하고, 'obj_001'이 존재하면 'obj_002'처럼
        숫자 패딩(padding)을 유지하여 이름을 생성합니다.
        """
        string_type = self._string_type # __init__에서 설정한 값 사용
        
        if not isinstance(Name, string_type):
            return None
        
        # 1. 현재 이름이 사용 가능하면 바로 반환
        if not cmds.objExists(Name):
            return Name

        # 2. 이름 뒤에 숫자가 있는지 정규식으로 확인
        isIntPattern = r"(.+?)([0-9]+)$"
        isInt = re.search(isIntPattern, Name)
        
        start_count = 1
        formatName = Name + "{}" # 기본 포맷 (예: "obj" -> "obj1")
        
        if isInt:
            # 숫자가 있다면 (예: "obj_001")
            name_prefix = isInt.group(1) # "obj_"
            found_number = int(isInt.group(2)) # 1
            
            padding = len(isInt.group(2)) # 3 (패딩 길이 "001")
            # 패딩을 유지하는 포맷 (예: "obj_{:03d}")
            formatName = name_prefix + "{:0%dd}" % padding 
            start_count = found_number + 1 # 2부터 시작
        
        # 3. maxLoop 만큼 시도
        try_name = Name # 기본값
        for i in range(start_count, maxLoop + start_count):
            try_name = formatName.format(i)
            
            if not cmds.objExists(try_name):
                return try_name # 유니크한 이름 찾음
        
        # maxLoop까지 모두 실패하면 마지막 시도한 이름을 반환 (에러 대신)
        return try_name

# =================================================================
# 테스트 실행 코드
# =================================================================

Test = correctiveObject("L_Elbow_2_Add_Jnt" , "L_Wrist_Jnt")
Test.defineCorrectiveTarget("L_WristUp_Jnt")
Test.defineCorrectiveObjects("L_Elbow_position" , "L_Wrist_position")
Test.build()