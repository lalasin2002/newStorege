# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om
import re


class CrvSkinDistributor:
    def __init__(self, items ):
        '''
        Crv에 여러조인트의 스킨값을 균일하게 넣기위한 클래스\n
        
        =======================메서드 설명========================\n
        =\n
        __init__ : 조인트 리스트를 지정하는 메서드\n
        InputCrv : 커브를 지정하기위한 메서드\n
        GetItemParameter : 커브위의 오브젝트의 파라미터를 구하는 메서드 \n
        ReBuildCrvParameter : 지정 커브의 minValue , maxValue 가 0 ,1 이 아닐경우 사용 \n

        Calculate : 조인트 리스트 , 커브가 지정되었으면 SkinParcent를 구하기위한 계산 \n
        Skinning : 커브에 조인트를 스키닝하고 계산된 스킨값을 넣음 \n

        =\n
        =======================배개변수 설명========================\n

        item :: 조인트 리스트 를 넣는 매개변수 최소 요소 2개 이상 \n
        
        '''

        self.items = None
        self.Crv = None
        self.CrvShp = None
        self.SkinData = None
        self.SkinCluterNode = None

        if isinstance(items , list):
            if len(items ) > 1 and any(cmds.objectType(x) == "joint" for x in items):
                self.items = items

    def InputCrv(self , Crv):
        '''
        Crv :: 커브오브젝트 매개변수\n
        Transform 이든 shape이든 \n
        결과적으로 "nurbsCurve" 맞다면 무얼넣어도 상관없음\n

        '''

        if cmds.objectType(Crv) == "transform":
            ShpFinds = cmds.listRelatives(Crv , s =1)
            if ShpFinds:
                if cmds.objectType(ShpFinds[0]) == "nurbsCurve":
                    self.Crv = Crv
                    self.CrvShp = ShpFinds[0]
                
        if cmds.objectType(Crv) == "nurbsCurve":
            self.CrvShp = Crv
            TransformFinds = cmds.listRelatives(Crv , p =1)
            if TransformFinds:
                if cmds.objectType(TransformFinds[0]) == "transform":
                    self.Crv = TransformFinds[0]

    def Calculate(self , Print = True):
        '''
        __init__ , InputCrv 메서드에 의해 지정된 조인트리스트, 커브를 대상으로\n
        스킨값 계산하는 메서드\n
        =\n
        Print :: 스크립트 에디터에 스킨값을 출력하기위한 변수임 Flase시 출력하지 않음 \n
        
        '''

        self.SkinData = OrderedDict()
        Cvlist = cmds.ls(self.Crv + ".cv[*]" , fl =1)
        Cvlist = [x for x in Cvlist]

        
        OldItemParam = None
        OldItem = None
        
        for NewItem in self.items :
            NewItemParam = self.GetItemParameter(NewItem , self.CrvShp)
            if OldItem:
                OldItemParam = self.GetItemParameter(OldItem, self.CrvShp)
                #OldCvParam = None
                CvCount = 0
                for  i, Cv in enumerate(Cvlist):
                    NewCvParam = self.GetItemParameter(Cv , self.CrvShp)
                    if OldItemParam <= NewCvParam <=NewItemParam:
                        DiffParam = round( NewItemParam - OldItemParam ,3)
                        
                        if DiffParam == 0:
                            RebuildCvParam = 0 
                        else:
                            RebuildCvParam = round((NewItemParam -  NewCvParam) /DiffParam , 3)
                        
                        r_RebuildCvParam = 1.0 - RebuildCvParam
                        self.SkinData[Cv] = [(OldItem  , RebuildCvParam) , ( NewItem, r_RebuildCvParam)]


            OldItem = NewItem
        
        if Print :
            StringForPrint ="> SkinData :: {} to {} \n" .format(self.items , self.CrvShp)
            for x ,y in self.SkinData.items():
                StringForPrint += "   Cv =  {}  Values = {} \n" .format(x ,y)

            print (StringForPrint )

    def Skinning(self):
        '''
        계산된 스킨 데이터를 대상으로 스키닝됨
        
        '''

        SkinCluterNode = None
        if isinstance(self.SkinData , dict) and self.items and self.CrvShp:
            SkinCluterNode = cmds.skinCluster(self.items , self.CrvShp )[0]

            for Cv , Values in self.SkinData.items():
                cmds.skinPercent(SkinCluterNode , Cv , transformValue= Values)

        self.SkinCluterNode = SkinCluterNode
        return self.SkinCluterNode

    def ReBuildCrvParameter(self):
        if self.CrvShp:
            RebuildCrv = cmds.rebuildCurve(self.CrvShp , kr = 0 ,end =1 , kcp =1 )[0]
            getMin = cmds.getAttr(RebuildCrv + ".minValue")
            getMax = cmds.getAttr(RebuildCrv + ".maxValue")

            if getMin == 0 and getMax == 1:
                FindShp = cmds.listRelatives(RebuildCrv , s =1)[0]
                self.CrvShp =  FindShp
            
    @staticmethod
    def GetItemParameter( item, CrvShp ,roundCount =3 ):
        '''
        item :: 오브젝트 \n
        CrvShp :: 커브"쉐입" \n
        roundCount :: 파라미터값 반환시 소수점 제한수 기본 3 \n

        =\n

        반환시 오로지 파라미터값만 반환\n
        
        
        '''

        Get = None

        if cmds.objExists(item) and CrvShp:

            Pos = cmds.xform(item , ws =1 , q =1, t =1)
            NPOC = cmds.createNode("nearestPointOnCurve" , n = "{}_Cal_NPOC" .format("__PreSet"))
            for i, Axis in enumerate("XYZ"):
                cmds.setAttr(NPOC + ".inPosition{}" .format(Axis) , Pos[i])

            cmds.connectAttr(CrvShp + ".worldSpace[0]" , NPOC + ".inputCurve" ,f =1)
            Get = round( cmds.getAttr(NPOC + ".parameter" ) ,roundCount )

            cmds.delete(NPOC)

        return Get 


class matchAimParent:
    def __init__(self ,Target ):
        """
        클래스를 초기화하고 조준(aim)할 대상 객체(Target) 리스트를 설정합니다.
        
        입력된 Target이 문자열이면 리스트에 추가하고, 리스트이면 self.Targets에 할당합니다.
        이 객체들은 향후 Build() 메서드에서 순차적으로 서로를 조준하게 됩니다.

        :param str or list Target: 처음에 설정할 객체 또는 객체 리스트.
                                   객체 이름(str)이나 이름의 리스트(list)여야 합니다.
        :return: None
        :주의점: 씬에 존재하지 않는 객체 이름이 포함되면 리스트에 추가되지 않습니다.
        """
        self.Targets = []
        self.AimVector = None
        self.WorldVector  = None

        self.UnpackDic = {}

        try:
            self.string_type = basestring
        except NameError:
            self.string_type = str
        
        # (주석 처리된 Crv 관련 코드는 생략)

        if isinstance(Target , self.string_type) and cmds.objExists(Target) == True:
            self.Targets.append(Target)

        if isinstance(Target , list) and all(cmds.objExists(x)== True for x in Target ):
            self.Targets = Target

    def add_Target(self, Target):
        """
        초기화 이후에 조준할 대상 객체를 self.Targets 리스트에 추가합니다.

        :param str or list Target: 추가할 객체 또는 객체 리스트.
        :return: None
        :주의점: 씬에 존재하지 않는 객체는 추가되지 않습니다.
        """
        if isinstance(Target , self.string_type) and cmds.objExists(Target) == True:
            self.Targets.append(Target)
        if isinstance(Target , list) and all(cmds.objExists(x)== True for x in Target ):
            self.Targets += Target

    def set_AimVector(self , AimVector = (1,0,0)):
        """
        객체가 대상을 조준할 때 사용할 '조준 축(aimVector)'을 설정합니다.
        
        예를 들어 (1,0,0)은 X축이 대상을 향하도록 설정합니다.

        :param tuple AimVector: 3개의 숫자(int or float)로 이루어진 튜플 (x, y, z).
        :return: None
        :주의점: 기본값은 (1,0,0)입니다.
        """
        # (참고) 현재 코드의 유효성 검사 로직에 버그가 있을 수 있으나,
        # 사용자의 원본 코드를 그대로 유지합니다.

        self._validate_vector(AimVector , "AimVector")
        self.UnpackDic["aimVector"] = AimVector
        # old Code
        '''
        if not (isinstance(AimVector , tuple) and len(AimVector) ==3 and all(isinstance(x , (float, int) ) for x in AimVector)):
            raise TypeError("Invalid input. Expected a tuple of 3 floats.")
        else:
            self.UnpackDic["aimVector"] = AimVector
        '''


    def set_UpVector(self , UpVector = (0,1,0)):
        """
        객체가 대상을 조준할 때 '위'를 가리킬 '업 축(upVector)'을 설정합니다.
        
        예를 들어 (0,1,0)은 Y축이 '위' 방향을 향하도록 설정합니다.

        :param tuple UpVector: 3개의 숫자(int or float)로 이루어진 튜플 (x, y, z).
        :return: None
        :주의점: 기본값은 (0,1,0)입니다.
        """
        self._validate_vector(UpVector , "UpVector")
        self.UnpackDic["upVector"]= UpVector 

        # oldCode
        '''
        if not (isinstance(UpVector , tuple) and len(UpVector) ==3  and all(isinstance(x , (float, int) ) for x in UpVector)):
            raise TypeError("Invalid input. Expected a tuple of 3 floats.")
        else:
            self.UnpackDic["upVector"]= UpVector 
        '''
            
    def set_WorldVector(self , WorldVector = (0,1,0)):
        """
        '업 축'이 참조할 '월드 업 벡터(worldUpVector)'를 설정합니다.
        
        `set_Type`이 'vector' 또는 'scene'일 때 사용됩니다.

        :param tuple WorldVector: 3개의 숫자(int or float)로 이루어진 튜플 (x, y, z).
        :return: None
        :주의점: 기본값은 (0,1,0) (월드 Y축)입니다.
        """
        self._validate_vector(WorldVector , "WorldVector")
        self.UnpackDic["worldUpVector"] = WorldVector
        '''
        if not isinstance(WorldVector , tuple) and len(WorldVector) ==3  and all(isinstance(x , (float, int) ) for x in WorldVector):
            raise TypeError("Invalid input. Expected a tuple of 3 floats.")
        else:
            self.UnpackDic["worldUpVector"] = WorldVector
        '''

    def set_Type(self , Type = "scene" , Object = None):
        """
        '업 벡터'를 계산할 방식(worldUpType)을 설정합니다.
        
        'scene' (기본값): 월드 업 벡터를 사용합니다.
        'object': 다른 객체의 원점을 업 벡터로 사용합니다. (Object 매개변수 필요)
        'objectrotation': 다른 객체의 회전축을 업 벡터로 사용합니다. (Object 매개변수 필요)
        'vector': `set_WorldVector`로 지정한 벡터를 직접 사용합니다.
        'none': 업 벡터를 사용하지 않습니다.

        :param str Type: 'scene', 'object', 'objectrotation', 'vector', 'none' 중 하나.
        :param str Object: (선택 사항) Type이 'object' 또는 'objectrotation'일 때 
                           참조할 객체의 이름입니다.
        :return: None
        """
        isTypes = [ "scene" , "object" , "objectrotation"  ,"vector" , "none" ]
        if not Type in isTypes:
            raise TypeError("Invalid Type. Must be one of 'scene', 'object', 'objectrotation', 'vector', or 'none'.")
        
        self.UnpackDic["worldUpType"] = Type
        if Type in ["object", "objectrotation"]:
            if Object is None:
                raise ValueError(u"Type이 '{}'일 때는 Object가 필요합니다.".format(Type))
            if not cmds.objExists(Object):
                raise ValueError(u"{}가 존재하지 않습니다.".format(Object))
            self.UnpackDic["worldUpObject"] = Object



        #if cmds.objExists(Object) and Type in ["object", "objectrotation"]: # 'object' 타입도 Object가 필요합니다.
        #    self.UnpackDic["worldUpObject"] = Object

    def set_Option(self, **kwargs):
        """
        Maya의 `aimConstraint` 명령에 필요한 추가 옵션들을 자유롭게 설정합니다.
        
        `set_AimVector` 등에서 다루지 않는 `aimConstraint`의 다른 모든 키워드 인자(kwargs)를
        (예: `weight=0.5`) 설정할 수 있습니다.

        :param kwargs: `aimConstraint` 명령에서 사용할 키워드 인자들.
        :return: None
        :예시: `set_Option(weight=0.5, offset=(0, 10, 0))`
        """
        self.UnpackDic.update(kwargs)

    def build(self , ParentBool = False):
        """
        설정된 옵션을 바탕으로 `self.Targets` 리스트의 객체들을 순차적으로 조준시킵니다.
        
        각 객체가 리스트의 다음 객체를 바라보도록 회전값을 "굽습니다(bake)".
        임시 그룹과 `aimConstraint`를 생성했다가 삭제하는 방식으로 작동합니다.
        마지막 객체는 그 직전 객체의 회전값을 그대로 복사받습니다.

        :param bool ParentBool: (선택 사항) False(기본값)이면 회전만 시키고, 
                               True이면 회전 작업이 끝난 후 객체들을 순서대로 
                               부모-자식 계층 구조로 연결합니다(체인 구조).
        :return: None
        :주의점: 이 메서드는 `self.Targets`에 포함된 모든 객체의 실제 회전(rotate) 값을 
                 직접 수정합니다.
        """
        self.UnpackDic["maintainOffset"] = False

        OldTarget = None
        OldGrp = None
        Grps = []
        Grp = None
        for i , Target in enumerate(self.Targets):
            Grp = cmds.createNode("transform" , n = "{}_Grp" .format(Target))
            cmds.delete(cmds.parentConstraint(Target , Grp , mo =0))
            cmds.parent(Target , Grp)
            Grps.append(Grp)
            
            
            if OldGrp:
                # 이전 객체의 '그룹'이 현재 객체를 조준하도록 설정
                AimC = cmds.aimConstraint(Target ,OldGrp ,**self.UnpackDic )
                # aimConstraint를 삭제하여 회전값만 남김 (굽기)
                cmds.delete(AimC)
                
            if OldTarget:
                # 마지막 객체에 도달했을 때
                if i == len(self.Targets)-1:
                    # 마지막 그룹이 직전 그룹의 회전값을 복사하도록 함
                    for  n , ax in enumerate("XYZ"):
                        Get = cmds.getAttr(OldGrp + ".rotate{}" .format(ax))
                        cmds.setAttr("{}.rotate{}"  .format(Grp , ax) , Get )
            
            OldTarget = Target
            OldGrp = Grp
            
        # 원본 객체들을 다시 월드로 빼냄
        cmds.parent(self.Targets , w =1)
        # 임시로 사용했던 그룹들 삭제
        cmds.delete(Grps)
            
            
        if ParentBool:
            # 객체들을 순서대로 부모-자식 계층으로 연결
            Old = None
            for x in self.Targets:
                if Old:
                    cmds.parent(x , Old)
                Old  = x

    def _validate_vector(self , vec , nameString):
        if not isinstance(vec, tuple):
            raise TypeError(u"{}는 tuple이어야 합니다.".format(nameString))
        if len(vec) != 3:
            raise ValueError(u"{}는 길이 3이어야 합니다.".format(nameString))
        if not all(isinstance(x, (int, float)) and not isinstance(x, bool) for x in vec):
            raise TypeError(u"{}의 요소는 int/float이어야 합니다.".format(nameString))
        


def get_pocif_translate(crv , parameter , turnOffPecentage = True):

    data = []
    CrvShp = None
    if cmds.objExists(crv):
        CurveType = cmds.objectType(crv)

        if CurveType == "transform":
            IsShp = cmds.listRelatives(crv , s =1  ,type = "nurbsCurve")
            if IsShp:
                CrvShp = IsShp[0]
        if CurveType == "nurbsCurve":
            CrvShp = crv
    else:
        raise TypeError (">> Invaild input. Expected a Curve")
    

    pocif = cmds.createNode("pointOnCurveInfo")
    cmds.connectAttr(CrvShp + ".worldSpace[0]" , pocif + ".inputCurve" ,f =1)
    cmds.setAttr("{}.turnOnPercentage".format(pocif) , turnOffPecentage)
    cmds.setAttr("{}.parameter".format(pocif)  , parameter)

    for ax in "XYZ":
        getValue = cmds.getAttr("{}.position{}".format(pocif , ax))

        data.append(getValue)
    if data:
        cmds.delete(pocif)
    return data

def GetMeshVtx_SequencePos(FirstVtxs , ConversionTuple = True):
    """메쉬 버텍스 시작점 부터 시퀀스 대로 중심점 Pos 가져오기"""
    Mesh = None
    MeshTF = None
    AllVtx = None
    TatalRange = 0
    RenturnList = []
    if any("vtx" in x for x in FirstVtxs): 
        MeshTF = FirstVtxs[0].split(".")[0]
        if cmds.objExists(MeshTF):
            Mesh = cmds.listRelatives(MeshTF , s =1 , type = "mesh")[0]
            
        if cmds.objExists(Mesh):
            AllVtx = cmds.ls("{}.vtx[*]" .format(MeshTF) , fl =1 )

            SearcheList = []
            Add = FirstVtxs
            Current = FirstVtxs
            while  len(SearcheList) < len(AllVtx) :

                cmds.select(Add )
                mel.eval('PolySelectTraverse 1')
                Add = cmds.ls(sl =1 ,fl =1)
                SearcheList += Add 
                SearcheList = list(set(SearcheList))
                TatalRange +=1

                if len(SearcheList) == len(AllVtx):
                    break
            TatalRange = TatalRange+ 1
            SearcheList = []
            Add = FirstVtxs
            Current = FirstVtxs

            for x in range(TatalRange):

                Cls = cmds.cluster(Current)
                PointTf = cmds.createNode("transform" ,  n = "PreSet_{}{}_Tf" .format(MeshTF[0] , TatalRange))
                CP = cmds.parentConstraint(Cls[-1] , PointTf , mo = 0)
                Pos = cmds.xform(PointTf ,q =1,  ws =1, t =1)

                if ConversionTuple:
                    Pos = tuple(Pos)
                RenturnList.append(Pos)
                cmds.delete(CP)
                cmds.delete(Cls)
                cmds.delete(PointTf)


                
                cmds.select(Add )
                mel.eval('PolySelectTraverse 1')
                Add = cmds.ls(sl =1 ,fl =1)
                Current = list(set(Add) -  set(SearcheList))
                SearcheList += Add 
                SearcheList = list(set(SearcheList))
                
        return RenturnList


def Grping(Target , Count , Grp_Suffix = ["_Grp" , "_Offset" , "_Prime" , '_GrpPrime']):
    """
    주어진 대상 오브젝트에 대해 여러 개의 그룹을 생성하고 계층화합니다.
    생성된 그룹은 대상 오브젝트의 위치에 스냅된 후, 대상 오브젝트는 가장 안쪽 그룹의 자식이 됩니다.

    Args:
        Target (str): 그룹 계층을 생성할 대상 오브젝트의 이름.
        Count (int): 생성할 그룹의 개수 (Grp_Suffix 리스트의 처음부터 Count 만큼 사용).
        Grp_Suffix (list, optional): 생성할 그룹의 이름에 사용될 접미사 리스트.
                                     기본값은 ["_Grp", "_Offset", "_Prime", "_GrpPrime"].

    Returns:
        list: 생성된 그룹의 리스트 (바깥쪽 그룹부터 안쪽 그룹 순서).
    """

    Count = int(Count) # Count를 정수로 변환
    Groups =[] # 생성된 그룹들을 저장할 리스트
    Parent_Group = None # 이전 그룹을 저장하여 계층을 구축

    # 지정된 Count 만큼 그룹 생성 및 계층화
    for i , x in enumerate(Grp_Suffix[:Count]):
        Group = cmds.createNode("transform" , n = "{}{}" .format(Target ,x)) # 그룹 노드 생성

        if Parent_Group:
            cmds.parent( Parent_Group ,Group ) # 이전 그룹을 현재 그룹의 자식으로 설정 (바깥쪽에서 안쪽으로)
        Parent_Group = Group # 현재 그룹을 이전 그룹으로 업데이트
        Groups.append(Group) # 생성된 그룹을 리스트에 추가

    # 가장 바깥쪽 그룹을 대상 오브젝트의 위치에 스냅하고 제약 조건 삭제
    cmds.delete(cmds.parentConstraint(Target, Groups[-1]))
    # 대상 오브젝트를 가장 안쪽 그룹의 자식으로 설정
    cmds.parent(Target ,  Groups[0])

    return  Groups


cmds.undoInfo(openChunk=1)
try:
    num = 3
    spans = (num *4) - 3
    names = "overHeat_thirdPipeB"
    curveNames = names + "_Crv"
    Pos = GetMeshVtx_SequencePos(cmds.ls(sl =1,fl =1))
    Crv = cmds.curve(p = Pos , n = curveNames )

    cmds.rebuildCurve(Crv ,constructionHistory=False , replaceOriginal=True ,rebuildType=0 , degree=3 , keepControlPoints= 0 , keepRange= 0 ,spans=spans   )



    aimSetTarget = []
    for i in  range(num):
        count = str(i+1).zfill(2)
        parameter = 1.0/(num -1) * i 
        pos = get_pocif_translate(Crv , parameter )
        
        cmds.select(cl=1)
        Jnt = cmds.joint(n = names + count + "_Ctrl" )
        cmds.xform(Jnt , ws =1 , t = pos)
        aimSetTarget.append(Jnt)


    a = matchAimParent(aimSetTarget)
    a.set_AimVector((0,0,1))
    a.set_UpVector((0,1,0))
    a.set_WorldVector((0,1,0))
    a.set_Type("objectrotation", aimSetTarget[0])
    a.build()

    skining = CrvSkinDistributor(aimSetTarget)
    skining.InputCrv(Crv)
    skining.Calculate()
    skining.Skinning()

    #aimSetTarget.reverse()
    parents = None
    for x in aimSetTarget:
        Grp  = Grping(x , 2)
        if parents:
            cmds.parent(Grp[-1] , parents)

        parents = x
finally:
    cmds.undoInfo(closeChunk=1)
        
        
        
        
        
        