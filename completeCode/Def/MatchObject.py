# -*- coding: utf-8 -*-
import maya.cmds as cmds

def match_ConstraintObject(Staric, Target, Bool_Point=True, Bool_Orient=True, Bool_Scale=False):
    ''' 
    Constraint maintainoffset = False 를 이용한 오브젝트 매치 \n
    Staric :: Constrain의 Parent 오브젝트 \n
    Target :: Constrain를 받고자 하는 오브젝트 \n
    
    각 Bool_(Point , Orient , Scale) 은 Constrain의 타입사용을 의미함
    '''
    if Bool_Point == True:
        Po = cmds.pointConstraint(Staric, Target, mo=0)q
        cmds.delete(Po)
    if Bool_Orient == True:
        Or = cmds.orientConstraint(Staric, Target, mo=0)
        cmds.delete(Or)
    if Bool_Scale == True:
        Scale = cmds.scaleConstraint(Staric, Target, mo=0)
        cmds.delete(Scale)

def match_PointOnCrv(Target , Crv ,Parameter , Percentage = 1 ):
    CrvShp = None
    if cmds.objectType(Crv) == "transform":
        Shp = cmds.listRelatives(Crv , s =1 , type = "nurbsCurve")
        if Shp:
            CrvShp = Shp[0]
        else:
            raise ValueError("Crv is not Curve ")
    if cmds.objectType(Crv) == "nurbsCurve":
        CrvShp = Crv

    POICF = cmds.createNode('pointOnCurveInfo', n=Target + '_POCIF')
    
    cmds.setAttr(POICF + '.turnOnPercentage',  Percentage )
    cmds.setAttr(POICF + '.parameter', Parameter)
    cmds.connectAttr(CrvShp + '.worldSpace[0]', POICF + '.inputCurve', f=1)
    cmds.connectAttr(POICF + '.result.position ', Target + '.translate', f=1)
    Target_Pos = cmds.xform(Target, q=1, ws =1, t =1)
    cmds.delete(POICF)
    cmds.xform(Target , ws= 1, t =Target_Pos)

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
        if not isinstance(AimVector , tuple) and len(AimVector) ==3 and all(isinstance(x , (float, int) ) for x in AimVector):
            raise TypeError("Invalid input. Expected a tuple of 3 floats.")
        else:
            self.UnpackDic["aimVector"] = AimVector

    def set_UpVector(self , UpVector = (0,1,0)):
        """
        객체가 대상을 조준할 때 '위'를 가리킬 '업 축(upVector)'을 설정합니다.
        
        예를 들어 (0,1,0)은 Y축이 '위' 방향을 향하도록 설정합니다.

        :param tuple UpVector: 3개의 숫자(int or float)로 이루어진 튜플 (x, y, z).
        :return: None
        :주의점: 기본값은 (0,1,0)입니다.
        """
        if not isinstance(UpVector , tuple) and len(UpVector) ==3  and all(isinstance(x , (float, int) ) for x in UpVector):
            raise TypeError("Invalid input. Expected a tuple of 3 floats.")
        else:
            self.UnpackDic["upVector"]= UpVector 
            
    def set_WorldVector(self , WorldVector = (0,1,0)):
        """
        '업 축'이 참조할 '월드 업 벡터(worldUpVector)'를 설정합니다.
        
        `set_Type`이 'vector' 또는 'scene'일 때 사용됩니다.

        :param tuple WorldVector: 3개의 숫자(int or float)로 이루어진 튜플 (x, y, z).
        :return: None
        :주의점: 기본값은 (0,1,0) (월드 Y축)입니다.
        """
        if not isinstance(WorldVector , tuple) and len(WorldVector) ==3  and all(isinstance(x , (float, int) ) for x in WorldVector):
            raise TypeError("Invalid input. Expected a tuple of 3 floats.")
        else:
            self.UnpackDic["worldUpVector"] = WorldVector

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
        if cmds.objExists(Object) and Type in ["object", "objectrotation"]: # 'object' 타입도 Object가 필요합니다.
            self.UnpackDic["worldUpObject"] = Object

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