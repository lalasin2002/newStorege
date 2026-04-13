# -*- coding: utf-8 -*-
import maya.cmds as cmds
import getpass, sys, re, os, json , pprint , inspect ,math , importlib
import maya.OpenMaya as om
from PySide2.QtWidgets import QApplication, QFileDialog  ,QListWidgetItem , QWidget
from PySide2 import QtCore, QtWidgets, QtUiTools, QtGui 
from functools import partial
from collections import OrderedDict



# ----------------------------------------------------------------------------------------ObjAarrge
def d_Match_CP(Staric, Target, Bool_Point=True, Bool_Orient=True, Bool_Scale=False):
    ''' 
    Constraint maintainoffset = False 를 이용한 오브젝트 매치 \n
    Staric :: Constrain의 Parent 오브젝트 \n
    Target :: Constrain를 받고자 하는 오브젝트 \n
    
    각 Bool_(Point , Orient , Scale) 은 Constrain의 타입사용을 의미함
    '''
    if Bool_Point == True:
        Po = cmds.pointConstraint(Staric, Target, mo=0)
        cmds.delete(Po)
    if Bool_Orient == True:
        Or = cmds.orientConstraint(Staric, Target, mo=0)
        cmds.delete(Or)
    if Bool_Scale == True:
        Scale = cmds.scaleConstraint(Staric, Target, mo=0)
        cmds.delete(Scale)



def d_Match_Xform(Staric, Target, Bool_Trans=True, Bool_Rotate=True, Bool_Scale=False):
    '''
    cmds.xform 를 이용한 오브젝트 매치 \n
    __________________________________________________________________________\n
    Staric :: cmds.xform으로 정보를 가져올(Query) 할 오브젝트 \n
    Target :: 가져온(Query) 정보를 넣을 오브젝트  \n
    
    각 Bool_(Trans , Orient , Scale) ::  가져올 타입을 의미함 
    '''
    
    
    Trans = cmds.xform(Staric, ws=1, q=1, t=1)
    Rotate = cmds.xform(Staric, ws=1, q=1, ro=1)
    Scale = cmds.xform(Staric, ws=1, q=1, s=1)

    if Bool_Trans == True:
        cmds.xform(Target, t=Trans)
    if Bool_Rotate == True:
        cmds.xform(Target, ro=Rotate)
    if Bool_Scale == True:
        cmds.xform(Target, s=Scale)



def d_Match_XformMtx(Staric, Target):
    '''
    cmds.xform 를 이용해서 메트릭스로 오브젝트 매치 \n
    __________________________________________________________________________\n
    Staric :: cmds.xform으로 정보를 가져올(Query) 할 오브젝트 \n
    Target :: 가져온(Query) 정보를 넣을 오브젝트  \n
    
    오로지 오브젝트의 매트릭스를 가져오기에 사용에 주의
    '''
    POS = cmds.xform(Staric, q=1, m=1, ws=1)
    cmds.xform(Target, m=POS)
    

def d_Match_CP_Jnt(Staric, Target, Bool_Point=True, Bool_Orient=True, Bool_Scale=False):
    '''
    조인트를 매치 기능 \n
    기능 자체는 d_Match_CP와 동일하나  Orient정보를 JointOrient에 입력되도록 설계함 \n
    원리는 해당  Target의 조인트에 그룹 만들엇 이동후 해체 \n
    __________________________________________________________________________\n
    Target :: 조인트 오브젝트만 적용됨
    각 Bool_(Trans , Orient , Scale) ::  가져올 타입을 의미함 
    '''
    
    if cmds.objectType(Target) == 'joint':
        Axis = ["X" , "Y" , "Z"]
        Grp = cmds.createNode('transform', n='{}_PreFix'.format(Target))
        CP = cmds.parentConstraint(Target , Grp, mo=0)
        cmds.delete(CP)

        cmds.parent(Target, Grp)

        if Bool_Point == True:
            Point = cmds.pointConstraint(Staric, Grp)
            cmds.delete(Point)
        if Bool_Orient == True:
            Orient = cmds.orientConstraint(Staric, Grp)
            cmds.delete(Orient)
        if Bool_Scale == True:
            Scale = cmds.scaleConstraint(Staric, Grp)
            cmds.delete(Scale)

        for x in Axis:
            cmds.setAttr(Target + '.rotate{}' .format(x) , 0)

        cmds.parent(Target, w=1)
        cmds.delete(Grp)
        
        

def d_Match_Obj_PointOn_Crv(Target , Crv , Parameter , CrvKrBool=False):
    '''
    오브젝트를 Crv에 매치하는 기능 \n
    Crv 에 Parameter의 값에 따라 오브젝트의 translate를 위치시킴 \n
    반환값은 Target \n
    __________________________________________________________________________\n
    Target :: 위치시킬 오브젝트 \n
    Crv ::  Target를 붙을 Crv 오브젝트 transform , nurbsCurve 타입 모두 사용가능 \n
    Parameter :: Target를 붙을때 Crv가 가진 위치 시킬 길이값 \n
    CrvKrBool :: True시 Crv의 전체 길이 값을 0에서 1 값으로 환산함 이경우 Parameter도 0에서 1 값으로 조정 필수 \n
    
    '''
    
    
    CV = cmds.ls(Crv + '.cv[*]', fl=1)
    Spans = len(CV)
    Degree = cmds.getAttr(Crv + ".degree")
    if CrvKrBool == False:
        Crv = cmds.rebuildCurve(Crv, ch=1, rpo=1, kt=0, kr=0, kcp=1, d=Degree)[0]

    DuCrv = cmds.duplicate(Crv, n=Crv + '_Fix')[0]
    DuCrvShp = cmds.listRelatives(DuCrv, s=1)[0]
    GetDegree = cmds.getAttr(DuCrvShp + ".degree")
    if GetDegree > 2:
        DuCrv_CV = cmds.ls(DuCrv + '.cv[*]', fl=1)
        cmds.delete(DuCrv_CV[-2])
        cmds.delete(DuCrv_CV[1])
        DuCrv = cmds.rebuildCurve(DuCrv, ch=1, kr=0, kcp=1, d=Degree)[0]
    PreFixCrv = cmds.rebuildCurve(DuCrv, ch=1, rpo=1, rt=0, end=0, kcp=1, kt=0, d=1, kr=0, s=Spans)[0]

    if cmds.objectType(Crv) == 'transform':
        Crv = cmds.listRelatives(Crv, s=1)[0]
        FixCrv = cmds.listRelatives(PreFixCrv, s=1)[0]

    FixPOICFLoc = cmds.spaceLocator(n=Target + '_FIx_POICF_loc')[0]
    FixPOICF = cmds.createNode('pointOnCurveInfo', n=Target + '_Fix_POCIF')
    POICF = cmds.createNode('pointOnCurveInfo', n=Target + '_POCIF')
    NPOC = cmds.createNode('nearestPointOnCurve', n=Target + '_Fix_NPOC')
    FixDM = cmds.createNode('decomposeMatrix', n=Target + '_Fix_DM')

    cmds.setAttr(FixPOICF + '.parameter', Parameter)
    cmds.setAttr(FixPOICF + '.turnOnPercentage', 1)
    cmds.setAttr(POICF + '.turnOnPercentage', 1)

    cmds.connectAttr(FixCrv + '.worldSpace[0]', FixPOICF + '.inputCurve', f=1)
    cmds.connectAttr(Crv + '.worldSpace[0]', POICF + '.inputCurve', f=1)
    cmds.connectAttr(Crv + '.worldSpace[0]', NPOC + '.inputCurve', f=1)

    cmds.connectAttr(FixPOICF + '.position', FixPOICFLoc + '.translate', f=1)
    cmds.connectAttr(FixPOICFLoc + '.worldMatrix[0]', FixDM + '.inputMatrix', f=1)
    cmds.connectAttr(FixDM + '.outputTranslate', NPOC + '.inPosition', f=1)
    cmds.connectAttr(NPOC + '.result.parameter', POICF + '.parameter', f=1)

    GetParameter = cmds.getAttr(NPOC + '.parameter')
    cmds.delete(FixPOICF)
    cmds.delete(NPOC)
    # cmds.delete(FixDM)
    cmds.delete(FixPOICFLoc)

    cmds.connectAttr(POICF + '.result.position ', Target + '.translate', f=1)
    cmds.setAttr(POICF + '.parameter', GetParameter)
    cmds.delete(PreFixCrv)

    Target_Pos = cmds.xform(Target, q=1, ws =1, t =1)
    cmds.delete(POICF)
    cmds.xform(Target , ws= 1, t =Target_Pos)


    return Target

def d_Match_Obj_Tangt_Crv(Target , Crv , AimTuple , UpTuple , WupTuple , Vector = ''):
    '''
    오브젝트를 Crv에 TangentConstrain으로 매치 하는 기능 \n
    오브젝트 튜플 자료형 (X,Y,Z)  AimTuple , UpTuple , WupTuple 변형인자를 가짐  \n
    __________________________________________________________________________\n
    Target :: 적용시킬 오브젝트 \n
    Crv ::  Target를 붙을 Crv 오브젝트 transform , nurbsCurve 타입 모두 사용가능 \n
    AimTuple :: TangentConstrain의 AimVector 튜플값 \n
    UpTuple :: TangentConstrain의 UpVector 튜플값 \n
    WuTuple :: TangentConstrain의 World Up Vector 튜플값 \n
    Vector :: TangentConstrain의 World up Type 값 적지 않을시 "vector"를 기본값으로 가짐 \n
    Vector Type 은  "scene", "object", "objectrotation", "vector" 있음 \n
    
    '''

    if Vector == '':
        TG = cmds.tangentConstraint(Crv, Target, aim=AimTuple, u=UpTuple, wu=WupTuple, wut="vector")[0]
    else:
        TG = cmds.tangentConstraint(Crv, Target, aim=AimTuple, u=UpTuple, wu=WupTuple, wuo=Vector, wut = "objectrotation")[0]

    cmds.delete(TG)


def d_Match_Jnt_Tangt_Crv(Target , Crv , AimTuple , UpTuple , WupTuple , Vector = ''):
    '''
    조인트를 Crv에 TangentConstrain으로 매치 하는 기능 \n
    조인트 튜플 자료형 (X,Y,Z)  AimTuple , UpTuple , WupTuple 변형인자를 가짐  \n
    __________________________________________________________________________\n
    Target :: 적용시킬 조인트 \n
    Crv ::  Target를 붙을 Crv 오브젝트 transform , nurbsCurve 타입 모두 사용가능 \n
    AimTuple :: TangentConstrain의 AimVector 튜플값 \n
    UpTuple :: TangentConstrain의 UpVector 튜플값 \n
    WuTuple :: TangentConstrain의 World Up Vector 튜플값 \n
    Vector :: TangentConstrain의 World up Object 값 적지 않을시 "vector"를 기본값으로 가짐 \n

    
    
    '''

    if cmds.objectType(Target) == "joint":
        Grp = cmds.createNode('transform' , n = "PreFix_" + Target)
        CP = cmds.parentConstraint(Target,Grp)[0]
        cmds.delete(CP)
        cmds.parent(Target, Grp)

        if Vector == '':
            TG = cmds.tangentConstraint(Crv, Grp, aim=AimTuple, u=UpTuple, wu=WupTuple, wut="vector")[0]
        else:
            TG = cmds.tangentConstraint(Crv, Grp, aim=AimTuple, u=UpTuple, wu=WupTuple, wuo=Vector,
                                        wut="objectrotation")[0]

        cmds.parent(Target , w =1)
        cmds.delete(Grp)
        cmds.delete(TG)



def d_Match_AimAxis(Staric, Target ,AimTuple, UpTuple, WorldUpTuple, Vector = ""):
    '''
    오브젝트를 AimConStrain으로  매치 하는 기능 \n
    오브젝트 튜플 자료형 (X,Y,Z)  AimTuple , UpTuple , WupTuple 변형인자를 가짐  \n
    반환값은 Target \n
    __________________________________________________________________________\n

    Staric :: Aim Parent 오브젝트 \n
    Target :: 적용시킬 오브젝트 \n
    Crv ::  Target를 붙을 Crv 오브젝트 transform , nurbsCurve 타입 모두 사용가능 \n
    AimTuple :: AimConStrain의 AimVector 튜플값 \n
    UpTuple :: AimConStrain의 UpVector 튜플값 \n
    WuTuple :: AimConStrain의 World Up Vector 튜플값 \n
    Vector :: AimConStrain의 World up Type 값 적지 않을시 "vector"를 기본값으로 가짐 \n
    
    '''
    try:
        WorldUpType = "vector"
        PreGrp = cmds.createNode('transform' , n = "PreFix_" + Target)
        
            
        
        CP = cmds.parentConstraint(Target , PreGrp)[0]
        cmds.delete(CP)
        cmds.parent(Target , PreGrp)
        if cmds.objExists(Vector) == True:
            WorldUpType = "objectrotation"
            Aim = cmds.aimConstraint(Staric , PreGrp , aim=AimTuple, u=UpTuple, wu=WorldUpTuple, wuo=Vector, wut=WorldUpType)[0]
        else:
            Aim = cmds.aimConstraint(Staric , PreGrp , aim=AimTuple, u=UpTuple, wu=WorldUpTuple, wut=WorldUpType)[0]
        cmds.delete(Aim)
        cmds.parent(Target , w=1)
        cmds.delete(PreGrp)

        return Target
    except:
        pass

# -----------------------------------------------------------------------------------------------------------------Make Node

def d_Jnt(Name , CP_Target = None):
    cmds.select(cl =1)
    Jnt = cmds.joint(n = Name )
    if not CP_Target is None:
        PreGrp = cmds.createNode('transform', n=Jnt + "_PreGrp")
        cmds.parent(Jnt, PreGrp)
        CP = cmds.parentConstraint(CP_Target, PreGrp)

        cmds.parent(Jnt, w=1)
        cmds.delete(CP)
        cmds.delete(PreGrp)

    return Jnt

def d_Create_Node(name, nodeTyp='transform'):
    node = cmds.createNode(nodeTyp, n=name)
    return node


def d_Create_BcNode(Name):
    node = cmds.createNode('blendColors', n=Name)
    for x in "RGB":
        cmds.setAttr(node + ".color1{}" .format(x) ,0 )
        cmds.setAttr(node + ".color2{}" .format(x) ,0 )
    return node


def d_Create_SrNode(Name):
    node = cmds.createNode('setRange', n=Name)
    return node


def d_Create_MdNode(Name, operation=1):
    node = cmds.createNode('multiplyDivide', n=Name)
    cmds.setAttr(node + '.operation', operation)
    return node


def d_Create_MDLNode(Name, Input_Value=0):
    node = cmds.createNode('multDoubleLinear', n=Name)
    cmds.setAttr(node + '.input2', Input_Value)
    return node


def d_Create_ADLNode(Name, Input_Value=0):
    node = cmds.createNode('addDoubleLinear', n=Name)
    cmds.setAttr(node + '.input2', Input_Value)
    return node


def d_Create_DmNode(Name, Target, input='inputMatrix'):
    node = cmds.createNode('decomposeMatrix', n=Name)
    cmds.connectAttr(Target + '.worldMatrix', node + '.inputMatrix')
    return node


def d_Create_ConNode(Name, operation=0):
    node = cmds.createNode('condition', n=Name)
    cmds.setAttr(node + '.operation', operation)
    return node

def d_Create_CrvInfoNode(Name , Crv = None):
    node = cmds.createNode('curveInfo', n = Name)
    if Crv:
        Shp = Crv
        if not cmds.objectType(Crv) == "nurbsCurve":
            Shp = cmds.listRelatives(Crv ,s =1)[0]
        cmds.connectAttr(Shp + '.worldSpace[0]' , node + '.inputCurve' ,f=1)
    return node

def d_Create_POCIF(Name , CrvName = "" , Parameter = 0, TurnOnPercentage = True):
    ReturnTgt = None
    POCIF = cmds.createNode('pointOnCurveInfo' , n = Name)
    
    
    cmds.setAttr(POCIF  + ".turnOnPercentage", TurnOnPercentage)
    cmds.setAttr(POCIF  + '.parameter', Parameter)
    if cmds.objExists(CrvName) == True:
        cmds.connectAttr(CrvName + ".worldSpace[0]" , POCIF + '.inputCurve', f=1)    
    
    return POCIF

def d_Create_NPOC(Name , CrvName = "" , inPositionTGT = "" , inPositionAttrName = "translate"):

    
    NPOC = cmds.createNode("nearestPointOnCurve" , n = Name )
    if cmds.objExists(CrvName) == True:
        cmds.connectAttr(CrvName + ".worldSpace[0]" , NPOC + '.inputCurve', f=1)
    if cmds.objExists(inPositionTGT) == True:
        if cmds.attributeQuery(inPositionAttrName , node = inPositionTGT , ex =1):
            for Axis in "XYZ":
                cmds.connectAttr("{}.{}{}".format(inPositionTGT , inPositionAttrName , Axis) ,  "{}.inPosition{}".format(NPOC , Axis) , f=1)
    return NPOC


def d_Duplicate_Obj(RootTarget , Type , AnyObj_lst = None):
    Worklst = None
    resultlst = []
    Du = cmds.duplicate(RootTarget , rc =1)
    Hi_Dulst = d_Set_Hierarchy_TypeLst(Du[0] , Type)
    cmds.parent(Hi_Dulst , w =1)
    Worklst = Hi_Dulst
    if AnyObj_lst:
        notlst = d_Set_AnyNot_Lst(Hi_Dulst ,AnyObj_lst )
        lst = d_Set_AnyLst(Hi_Dulst , AnyObj_lst)
        cmds.delete(notlst)
        Worklst = lst
    Parent_Tgt = None
    for i, x in enumerate(Worklst):
        if Parent_Tgt:
            cmds.parent(x , Parent_Tgt)
        
        if len(AnyObj_lst) <= i:
            cmds.delete(x)
        else:
            Parent_Tgt = x
            resultlst.append(x)
    return resultlst



def d_Create_Curve(Name , Poslist , degree =1 ):

    Crv = cmds.curve(n = Name , p = Poslist , d= 1)
    reCrv = cmds.rebuildCurve(Crv , ch =1  , rpo =1 , rt = 0 , end = 1 , kr = 0, kcp = 0 , kep =1 , kt =0 , s= len(Poslist) ,d =degree )
    Shp = cmds.listRelatives(Crv , s= 1)
    ReName = cmds.rename("{}Shape" .format(Name) , Shp[0] )
    return reCrv

def d_Create_Loc(Name , ShpScale =1 , NolistBool = True):
    ReturnTgt = None
    Loc = cmds.spaceLocator(n = Name)[0]
    Shp = cmds.listRelatives(Loc , s =1)[0]
    for x in "XYZ":                
        cmds.setAttr(Shp  + ".localScale{}" .format(x) ,ShpScale )

    if NolistBool:
        ReturnTgt = Loc
    else:
        ReturnTgt = [Loc , Shp]
        
    return ReturnTgt 
        

        
def d_Create_ANT(Name , CP_Target = None , Cnt_Target  = None , NonSelect = True ):
    ReTurn_lst = None
    Node = cmds.createNode("annotationShape" , n = Name + "Shape")
    Find_Transform = cmds.listRelatives(Node , p =1)[0]
    TransForm = cmds.rename(Find_Transform , "{}" .format(Name))
    
    if NonSelect :
        cmds.setAttr(Node + ".overrideEnabled" , 1)
        cmds.setAttr(Node + ".overrideDisplayType" ,2)
    
    if Cnt_Target :
        cmds.connectAttr("{}.{}" .format(Cnt_Target , "worldMatrix[0]") , "{}.{}" .format(Node , "dagObjectMatrix[0]" ,f =1) )
    if CP_Target:
        cmds.pointConstraint(CP_Target , TransForm  , mo =0)
        
    ReTurn_lst = [TransForm , Node]
    
    return ReTurn_lst


def d_Create_TextCrv(Name , TextString ,CenterPivotBool = True , FontSizePt = 27.8 , Font = "Lucida Sans Unicode"):
    FontOption = "{}, {}pt" .format(Font , str(FontSizePt))
    Text = cmds.textCurves( n = "__PreFix__{}" .format(Name) , t = TextString ,f = FontOption)[0]
    DulicateText = cmds.duplicate(Text , n = Name ,rc =1)[0]
    cmds.delete(Text)
    
    ChildTransform = cmds.listRelatives(DulicateText  ,ad =1,c =1,  type = "transform")
    ChildCrv = cmds.listRelatives(DulicateText  ,ad =1,c =1  , type = "nurbsCurve")
    for x in ChildTransform:
        cmds.makeIdentity(x ,apply = 1,  s= 1, t =1, r =1)
    
    
    for i, x in enumerate(ChildCrv):
        cmds.parent(x , DulicateText  ,r =1, s =1)
        RE = cmds.rename(x , "{}{}shape" .format(Name , str(i+1)))
        
        
    cmds.delete(ChildTransform )
    
    if CenterPivotBool:
       center = cmds.objectCenter(DulicateText, gl = True)
       
       CV = cmds.ls("{}*shape.cv[*]" .format(Name) ,fl =1 )
       cmds.select(CV)
       cmds.move( -center[0] ,0 ,0 , r =1 , os =1 , wd =1 )
       
    return DulicateText
# --------------------------------------------------------------------------------------------------------------AddAttr
def d_Add_MatrixAttr(Target, LongName , CntTarget = None):
    Attr = cmds.attributeQuery(LongName, node=Target, exists=True)
    if not Attr == True:
        cmds.addAttr(Target , ln = LongName , at = "matrix", k=1 )
        GetAttr = LongName
        if CntTarget:
            cmds.connectAttr(CntTarget + '.worldMatrix' , "{}.{}" .format(Target , GetAttr))

        return GetAttr


def d_Add_StringAttr(Target, LongName, String):
    Attr = cmds.attributeQuery(LongName, node=Target, exists=True)
    if not Attr == True:
        cmds.addAttr(Target, ln=LongName, dt="string")
        cmds.setAttr('{}.{}'.format(Target, LongName), String, type="string")
        GetAttr = LongName
        return GetAttr


def d_Add_FloatAttr(Target, LongName, Min, Max):
    Attr = cmds.attributeQuery(LongName, node=Target, exists=True)
    if not Attr == True:
        cmds.addAttr(Target, ln=LongName, min=Min, max=Max, at='double', k=1)
        GetAttr = LongName
        return GetAttr


def d_Add_FloatOffsetAttr(Target, LongName):
    Attr = cmds.attributeQuery(LongName, node=Target, exists=True)
    if not Attr == True:
        cmds.addAttr(Target, ln=LongName, at='double', k=1)
        GetAttr = LongName
        return GetAttr


def d_Add_IntAttr(Target, LongName, Min, Max):
    Attr = cmds.attributeQuery(LongName, node=Target, exists=True)
    if not Attr == True:
        cmds.addAttr(Target, ln=LongName, at='long', min=Min, max=Max, k=1)
        GetAttr = LongName
        return GetAttr


def d_Add_IntOffsetAttr(Target, LongName):
    Attr = cmds.attributeQuery(LongName, node=Target, exists=True)
    if not Attr == True:
        cmds.addAttr(Target, ln=LongName, at='long', k=1)
        GetAttr = LongName
        return GetAttr


def d_Add_BoolAttr(Target, LongName):
    Attr = cmds.attributeQuery(LongName, node=Target, exists=True)
    if not Attr == True:
        cmds.addAttr(Target, ln=LongName, at='bool', k=1)
        GetAttr = LongName
        return GetAttr


def d_Add_EnumAttr(Target, LongName, Enum_List):
    Attr = cmds.attributeQuery(LongName, node=Target, exists=True)
    if not Attr == True:
        EnumString = ":".join(Enum_List)
        cmds.addAttr(Target, ln=LongName, en=EnumString, at='enum', k=1)
        GetAttr = LongName
        return GetAttr


def d_Add_SeparatorAttr(Target, LongName, EnumString):
    Attr = cmds.attributeQuery(LongName, node=Target, exists=True)
    if not Attr == True:
        cmds.addAttr(Target, ln=LongName, nn="_______________", en=EnumString, at='enum', k=1)
        GetAttr = LongName
        cmds.setAttr('{}.{}'.format(Target, LongName), k=0, cb=1)
        return GetAttr


def d_Query_EnumAttrItem(Target, LongName):
    Attr = cmds.attributeQuery(LongName, node=Target, exists=True)
    if Attr == True:
        Eunm = cmds.attributeQuery(LongName, node=Target, listEnum=True)
        EunmList = Eunm[0].split(":")

        return EunmList


def d_Query_AttrValue(Target, LongName):
    Attr = cmds.attributeQuery(LongName, node=Target, exists=True)
    if Attr == True:
        Dic = {}
        Min = cmds.attributeQuery(LongName, node=Target, minimum=True)
        Max = cmds.attributeQuery(LongName, node=Target, maximum=True)
        Current = cmds.getAttr('{}.{}'.format(Target, LongName))
        Dic["Min"] = Min[0]
        Dic["Max"] = Max[0]
        Dic["Current"] = Current
        return Dic


def d_Delete_Attr(Target, LongName):
    Attr = cmds.attributeQuery(LongName, node=Target, exists=True)
    if Attr == True:
        AttrName = '{}.{}'.format(Target, LongName)
        cmds.deleteAttr(AttrName)


# --------------------------------------------------------------------------------------------------------------Attr
'''
def d_SetLimitAttr(Target , LongName , Value , Limit = 0):
    Attr = cmds.attributeQuery(LongName, node=Target, exists=True)
    if Attr == True:

'''

def JntWeightCls(Name , Jnt , Geo  ):
    xformJnt = cmds.xform(Jnt , q =1 , ws = 1, t =1)
    skin_cluster_nodes = mel.eval('findRelatedSkinCluster("{}")'.format(Geo))
    num_vertices = cmds.polyEvaluate(Geo, vertex=True)
    all_vtxs = ["{}.vtx[{}]" .format(Geo , i ) for i in range(num_vertices)]
    joint_weights  = []
    for x in all_vtxs:
        joint_weight = cmds.skinPercent(skin_cluster_nodes, x, transform=Jnt, query=True, value=True)
        joint_weights.append(joint_weight)
        
    cmds.select(all_vtxs)
    ClsInfo = cmds.cluster( n = "{}".format(Name))
    ClsNode = ClsInfo[0]
    ClsHandle = ClsInfo[1]
    ClsShape = cmds.listRelatives(ClsHandle , s =1 )[0]

    for  i , x in enumerate ("XYZ"):
        cmds.setAttr(ClsShape + ".origin{}" .format(x) , xformJnt[i])
        cmds.setAttr(ClsHandle + ".rotatePivot{}" .format(x) , xformJnt[i])

    for  i , x in enumerate(joint_weights):
        FixWeight = round(x ,3)
        if  0.0 == x:
            FixWeight = 0   
        cmds.percent(ClsNode , all_vtxs[i] ,v = FixWeight )

    return [ClsHandle , ClsNode ]

def d_TransLimit(item , min = -10 , max = 10):
    cmds.transformLimits(item , tx = (min , max) , ty =(min , max) , tz = (min , max) , etx = (1,1) , ety = (1,1) , etz = (1,1)  )
    



def d_Parent_Obj( ChildTargetList ):
    ParentTarget = None
    for i, x in enumerate(ChildTargetList):
        if ParentTarget:
            cmds.parent(x , ParentTarget)
        ParentTarget = x
        
def d_Connect_BasicAttr(Staric , Target , TransBool = True , RotateBool = True , ScaleBool = True):

    AttrMapping = {'.translate': TransBool,'.rotate': RotateBool,'.scale': ScaleBool}

    for Attr , Bool in AttrMapping.items():
        if Bool:
            for x in "XYZ":
                try:
                    cmds.connectAttr(Staric + Attr + x  , Target + Attr + x , f =1)
                except:
                    pass

def d_Cnt_ObjUserAttr(Static , Target  , ErrorPrint = True):
    
    StaticAttrs = cmds.listAttr(Static , k =1 , ud =1)
    PrintErrorSting = "\n"
    
    for x in StaticAttrs:
        TargetAttrFind = cmds.attributeQuery(x , node= Target ,ex =1 )
        if TargetAttrFind:
            CntStaticAttr = "{}.{}" .format(Static , x)
            CntTargetAttr = "{}.{}" .format(Target, x)
            try:
                cmds.connectAttr(CntStaticAttr ,CntTargetAttr  ,f =1 )
            except:
                PrintErrorSting += "ErrorCnt :: {}\n" .format(CntTargetAttr)
    if ErrorPrint:
        print (PrintErrorSting)   

def d_Cnt_Copy_CustomAttr(Staric , Target , Min = None , Max = None , Exact_lst = None ):
    Staric_listAttr = cmds.listAttr(Staric , k =1 , ud =1)
    AttrSet = Target + ".{}"
    Attr_Min_info = False
    Attr_Max_info = False
    Attr_Target_Type_info = None
    if Exact_lst:
        Staric_listAttr = d_Set_AnyLst(Staric_listAttr , Exact_lst)

    for x in Staric_listAttr:
        if cmds.attributeQuery(x , node = Target , exists =1) == True:
            Attr_Target_Type_info = cmds.getAttr("{}.{}" .format(Target , x) , type =1)

        Attr_Type_info = cmds.getAttr("{}.{}" .format(Staric , x) , type =1)
        Attr_Min_info = cmds.attributeQuery(x, node=Staric, minExists=1)
        if Attr_Min_info == True:
            Query_Min =  cmds.attributeQuery(x, node=Staric, min=1)[0]

        Attr_Max_info = cmds.attributeQuery(x, node=Staric, maxExists=1)
        if Attr_Max_info == True:
            Query_Max = cmds.attributeQuery(x, node=Staric, max=1)[0]

        if Attr_Type_info == "enum":
            Query_Staric_Enumlst = cmds.attributeQuery(x, node=Staric, listEnum=True)[0]
            if cmds.attributeQuery(x , node = Target , exists =1) == True:
                if Attr_Target_Type_info == Attr_Type_info:
                    Query_Target_Enumlst = cmds.attributeQuery(x, node=Target, listEnum=True)[0]
                    Split_Staric_Enumlst = Query_Staric_Enumlst.split(":")
                    Split_Target_Enumlst = Query_Target_Enumlst.split(":")

                    if sorted(Split_Staric_Enumlst) == sorted(Split_Target_Enumlst):
                        print ("enum OK")

            else:
                cmds.addAttr(Target , at = Attr_Type_info , ln = x , k =1 , en = Query_Staric_Enumlst)
                #d_Add_EnumAttr(Target , x , Query_Staric_Enumlst)
        elif Attr_Min_info and Attr_Max_info:
            if Attr_Min_info and  Min is None:
                Min = Query_Min
            if Attr_Max_info and Max is None:
                Max = Query_Max

            if cmds.attributeQuery(x , node = Target , exists =1):
                if Attr_Target_Type_info == Attr_Type_info:
                    if Min:
                        cmds.addAttr("{}.{}".format(Target, x), e=1,hasMinValue=Attr_Min_info ,  minValue=Min)
                    if Max:
                        cmds.addAttr("{}.{}".format(Target, x), e=1,hasMaxValue= Attr_Max_info ,  maxValue=Max)
            else:
                cmds.addAttr(Target, at=Attr_Type_info, ln=x, k=1)
                cmds.addAttr("{}.{}".format(Target, x), e=1, hasMinValue=Attr_Min_info, hasMaxValue=Attr_Max_info)
                if Min:
                    cmds.addAttr("{}.{}".format(Target, x), e=1,hasMaxValue= 1 ,minValue=Min)
                if Max:
                    cmds.addAttr("{}.{}".format(Target, x), e=1,hasMaxValue= 1, maxValue=Max)

        elif Attr_Min_info or Attr_Max_info and not  Attr_Min_info == Attr_Max_info:
            print(x, Attr_Min_info ,Attr_Max_info )

            if cmds.attributeQuery(x, node=Target, exists=1):
                if Attr_Target_Type_info == Attr_Type_info:
                    if Attr_Min_info :
                        cmds.addAttr("{}.{}".format(Target, x), e=1, hasMinValue=Attr_Min_info, minValue=Query_Min)
                    if Attr_Max_info:
                        cmds.addAttr("{}.{}".format(Target, x), e=1,hasMaxValue=Attr_Max_info , maxValue=Query_Max)
            else:
                cmds.addAttr(Target, at=Attr_Type_info, ln=x, k=1)
                if Attr_Min_info:
                    cmds.addAttr("{}.{}".format(Target, x), e=1, hasMinValue=Attr_Min_info, minValue=Query_Min)
                if Attr_Max_info:
                    cmds.addAttr("{}.{}".format(Target, x), e=1, hasMaxValue=Attr_Max_info, maxValue=Query_Max)
        else:
            if cmds.attributeQuery(x , node = Target , exists =1):
                pass
            else:
                cmds.addAttr(Target, at=Attr_Type_info, ln=x, k=1)

    Target_listAttr = cmds.listAttr(Target, k=1, ud=1)
    if Exact_lst:
        Target_listAttr = d_Set_AnyLst(Target_listAttr , Exact_lst)
    for x in Staric_listAttr:
        Attr_Type_info = cmds.getAttr("{}.{}".format(Staric, x), type=1)
        Attr_Min_info = cmds.attributeQuery(x, node=Staric, minExists=1)
        if Attr_Min_info:
            Query_Min =  cmds.attributeQuery(x, node=Staric, min=1)[0]

        Attr_Max_info = cmds.attributeQuery(x, node=Staric, maxExists=1)
        if Attr_Max_info:
            Query_Max = cmds.attributeQuery(x, node=Staric, max=1)[0]

        for t in  Target_listAttr:
            Attr_Target_Type_info = cmds.getAttr("{}.{}".format(Target, x), type=1)
            if x == t and Attr_Type_info == Attr_Target_Type_info:
                if not any(Attr_Type_info == x for x in ['enum' , 'bool']):
                    if Attr_Min_info and Attr_Max_info:
                        if Min is None:
                            Min = Query_Min

                        if Max is None:
                            Max = Query_Max

                        if Attr_Min_info == 0 and Min is None:
                            if Attr_Max_info == 0 and Max is None:
                                cmds.connectAttr("{}.{}" .format(Target , t), "{}.{}" .format(Staric , x) ,f =1)
                        else:
                            Driver = "{}.{}" .format(Target ,t)
                            Driven = "{}.{}" .format(Staric ,x)
                            cmds.setDrivenKeyframe(Driven, cd  = Driver , dv = Min , v =  Query_Min  , itt="linear", ott="linear" )
                            cmds.setDrivenKeyframe(Driven, cd=Driver, dv=Max, v=Query_Max, itt="linear", ott="linear")
                    else:
                        cmds.connectAttr("{}.{}".format(Target, t), "{}.{}".format(Staric, x), f=1)
                else:
                    cmds.connectAttr("{}.{}".format(Target, t), "{}.{}".format(Staric, x), f=1)





def d_Plus_JntRo_To_Orient(TargetJnt , OrientX_Bool=True, OrientY_Bool=True , OrientZ_Bool=True):
    if cmds.objectType(TargetJnt) == "joint":
        Query_Orient = cmds.xform(TargetJnt ,q=1 , ro =1)
        cmds.rotate(0,0,0,TargetJnt)
        if OrientX_Bool == True:
            Get = cmds.getAttr(TargetJnt+ '.jointOrientX')
            cmds.setAttr(TargetJnt+ '.jointOrientX' ,Get + Query_Orient[0])
        if OrientY_Bool == True:
            Get = cmds.getAttr(TargetJnt + '.jointOrientY')
            cmds.setAttr(TargetJnt + '.jointOrientY',Get +  Query_Orient[1])
        if OrientZ_Bool == True:
            Get = cmds.getAttr(TargetJnt + '.jointOrientZ')
            cmds.setAttr(TargetJnt + '.jointOrientZ',Get + Query_Orient[2])

        return Query_Orient

def d_Convert_JntRo_To_Orient(TargetJnt , OrientX_Bool=True, OrientY_Bool=True , OrientZ_Bool=True):
    if cmds.objectType(TargetJnt) == "joint":
        Query_Orient = cmds.xform(TargetJnt ,q=1 , ro =1)
        cmds.rotate(0,0,0,TargetJnt)
        if OrientX_Bool == True:
            cmds.setAttr(TargetJnt+ '.jointOrientX' , Query_Orient[0])
        if OrientY_Bool == True:
            cmds.setAttr(TargetJnt + '.jointOrientY', Query_Orient[1])
        if OrientZ_Bool == True:
            cmds.setAttr(TargetJnt + '.jointOrientZ', Query_Orient[2])

        return Query_Orient

def d_Set_Vector_Attr(Target, Attr, Value):
    Axis = ['X', 'Y', 'Z']

    for x in Axis:
        cmds.setAttr(Target + '.{}{}'.format(Attr, x), Value)


def d_Set_HideLock_Vector_Attr(item, lock=True, TurnOnKeyable= False):
    if TurnOnKeyable :
        KeyableBool = True
    else:
        KeyableBool = False
    Axis = ['X', 'Y', 'Z']
    Attr = ['.translate', '.rotate', '.scale']
    try:
        for y in Attr:
            for z in Axis:
                
                cmds.setAttr(item + y + z, keyable=KeyableBool)
                cmds.setAttr(item + y + z, channelBox = TurnOnKeyable)
                cmds.setAttr(item + y + z,  lock=lock )
    except:
        pass


def d_Cnt_Match_Attr(Staric, Target):
    SAttrlist = cmds.listAttr(Staric, k=1, ud=1)
    TAttrlist = cmds.listAttr(Target, k=1, ud=1)

    for x in SAttrlist:
        for y in TAttrlist:
            if x == y:
                cmds.connectAttr('{}.{}'.format(Staric, x), '{}.{}'.format(Target, y), f=1)


def d_Set_Paramater_MultiScale(StartTagert , EndTarget , ApplyTargertList , SkipAxis = None):

    Axis = "XYZ"
    if SkipAxis:
        Axis = Axis.replace(SkipAxis , "")

    if len(ApplyTargertList)> 1:
        Count = len(ApplyTargertList)
        Div = 1.0/(Count-1)

        for i, x in enumerate(ApplyTargertList):
            StartValue = Div*i
            EndValue = 1 - (Div*i)

            StartMD = cmds.createNode("multiplyDivide" , n = "{}_StartScale_MD" .format(x) )
            EndMD = cmds.createNode("multiplyDivide" , n = "{}_EndScale_MD" .format(x) )
            PM = cmds.createNode("plusMinusAverage" , n = "{}_Scale_PM" .format(x) )

            for y in Axis:
                IfCnt = cmds.listConnections( "{}.scale{}" .format(x , y) , source=True, destination=False)
                if IfCnt is None:
                    cmds.setAttr(StartMD + ".input2{}".format(y) , StartValue  )
                    cmds.setAttr(EndMD + ".input2{}".format(y) , EndValue )

                    cmds.connectAttr(StartTagert + ".scale{}" .format(y) , StartMD + ".input1{}" .format(y) ,f =1)
                    cmds.connectAttr(EndTarget + ".scale{}" .format(y) , EndMD + ".input1{}" .format(y) ,f =1)

                    LowAxis = y.lower()

                    cmds.connectAttr(StartMD + ".output{}" .format(y) , PM + ".input3D[0].input3D{}".format(LowAxis) ,f =1 )
                    cmds.connectAttr(EndMD + ".output{}" .format(y) , PM + ".input3D[1].input3D{}".format(LowAxis) ,f =1 )
                    cmds.connectAttr(PM + ".output3D.output3D{}" .format(LowAxis) , x + ".scale{}" .format(y) ,f =1)


def d_Set_Multi_Scale(Staric , TargetList):

    Node = cmds.createNode("plusMinusAverage" , n = Staric + "_Scale_PM")
    Worklst = TargetList
    LastNum = len(TargetList)
    for i, x in enumerate(Worklst):
        cmds.connectAttr(x  + ".scale" , Node + ".input3D[{}]" .format(i) ,f =1)
    for x in "xyz":
        cmds.setAttr(Node  + ".input3D[{a}].input3D{b}" .format(a =  LastNum +1 ,b = x) , -LastNum +1  )
    cmds.connectAttr(Node + ".output3D" , Staric + ".scale" ,f =1)

def d_Set_All_ObjVis(Type='locator', Turn_Bool=False):
    All = cmds.ls(type=Type)

    for x in All:
        cmds.setAttr(x + '.visibility', Turn_Bool)


def d_Set_Auto_ObjVis(Target):
    if cmds.getAttr(Target + '.visibility') == 0:
        cmds.setAttr(Target + '.visibility', 1)
    else:
        cmds.setAttr(Target + '.visibility', 0)


def d_Set_ObjVis(Target, Turn_Bool=True):
    cmds.setAttr(Target + '.visibility', Turn_Bool)


def d_Add_JntLebal(Target, Lebal, Side='M'):
    if Side == 'M':
        JntSide = 0
    elif Side == 'L':
        JntSide = 1
    elif Side == 'R':
        JntSide = 2
    else:
        JntSide = 3

    if cmds.objectType(Target) == 'joint':
        cmds.setAttr(Target + '.side', JntSide)
        cmds.setAttr(Target + '.type', 18)
        cmds.setAttr(Target + '.drawLabel', 1)
        cmds.setAttr(Target + '.otherType', Lebal, type="string")

    if JntSide == 0:
        ReturnSide = 'Center'
    elif JntSide == 1:
        ReturnSide = 'Left'
    elif JntSide == 2:
        ReturnSide = 'Right'
    else:
        ReturnSide = 'None'

    ReTurnString = cmds.getAttr(Target + '.otherType')
    return [ReturnSide, ReTurnString]

def d_Get_lattice_Pt(lattice):
    lattice_shape = cmds.listRelatives(lattice, shapes=True)[0]
    
    s_div, t_div, u_div = cmds.getAttr(lattice_shape + '.sDivisions'), cmds.getAttr(lattice_shape + '.tDivisions'), cmds.getAttr(lattice_shape + '.uDivisions')
    
    points = []
    for s in range(s_div):
        for t in range(t_div):
            for u in range(u_div):
                pt = cmds.pointPosition('{lattice_s}.pt[{st}][{tt}][{ut}]' .format(lattice_s = lattice_shape , st =s  , tt = t , ut =u) )
                points.append(pt)
    
    return points

def d_Get_MeshvtxSquence_PosList(FirstVtxs , ConversionTuple = True):
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

# -------------------------------------------------------------------------------------------------------------------Data Type


# --------------------------------------------------------------------------------------------------------------------CreateJnt &Obj

def d_Change_Shp(Staric, Target, JntDraw_Bool=True, DulicateBool=False):
    if DulicateBool == 1:
        StaricObj = cmds.duplicate(Staric, n='{}_{}'.format('PreFix', Staric))[0]
    else:
        StaricObj = Staric

    StaricShp = cmds.listRelatives(StaricObj, s=1)
    TargetShp = cmds.listRelatives(Target, s=1)
    if len(TargetShp) > 0:
        cmds.delete(TargetShp)

    for x in range(len(StaricShp)):
        cmds.parent(StaricShp[x], Target, s=1, r=1)
        cmds.rename(StaricShp[x], Target + 'Shape{}'.format(str(x + 1)))

    if JntDraw_Bool == 1:
        if cmds.objectType(Target) == 'joint':
            cmds.setAttr(Target + '.drawStyle', 2)

    TargetShp = cmds.listRelatives(Target, s=1)
    if TargetShp is None:
        return None
    return TargetShp


def d_Set_ColorShp(Target, ColorNumber):
    Shp = cmds.listRelatives(Target, s=1)

    for x in Shp:
        cmds.setAttr(x + '.overrideEnabled', 1)
        cmds.setAttr(x + '.overrideDisplayType', 0)
        cmds.setAttr(x + '.overrideRGBColors', 0)
        cmds.setAttr(x + '.overrideColor', ColorNumber)
    '''    
    Name == Hex == RGB == Index

    Boulder : #787878 (0.471, 0.471, ,0.471) : 0
    Black : #000000 : (0,0,0) : 1
    Silver : #BFBFBF: (0.75 ,0.75 ,0.75) : 2
    Gray  : #808080 : (0.5,0.5,0.5) : 3
    Monza : #CC0033 :  (0.8, 0, 0.2) : 4
    Stratos : #000460 : (0 , 0.001 , 0.117) : 5
    Blue : #0000FF : (0,0,1) : 6
    Crusoe : #004619 : (0, 0.065 , 0.001) : 7
    Tolopea : #260043 : (0.149 , 0 ,0.263)  : 8
    Purple Pizzazz : #C800C8 : (0.784, 0 ,0.784) : 9
    MuleFawn : #8A4833 : (0.541 , 0.282 ,0.2) : 10
    Jon : #3F231F : (0.247 , 0.137 , 0.122) : 11
    TotemPole : #992600 : (0.6 , 0.149 ,0) : 12
    Red : #FF0000 : (1,0,0) : 13
    Green : #00FF00 : (0,1,0) : 14
    Smalt : #004199 : (0,0.255,0.6) : 15 
    White : #FFFFFF : (1,1,1) : 16
    Yellow : #FFFF00 : (1,1,0) : 17
    Sky :  #64DCFF : (0.392 , 0.863 ,1) : 18
    Screamin' Green: #43FFA3 : (0.263 , 1 ,0.639) : 19
    Sundown : #FFB0B0 : (1,0.69,0.69) : 20
    HarvestGold : #E4AC79 : (0.894 ,0.675,0.475) : 21
    LaserLemon : #FFFF63 : (1,1,0.388) : 22
    GreenHaze : #009954 : (0,0.6,0.329) :23
    Copper : #A16A30 : (0.631 , 0.416 , 0.188) : 24
    yellowgreen : #9EA130 : (0.62 , 0.631 ,0.188) :25
    Sushi : #68A130 : (0.408 , 0.631 , 0.188) :26
    Sea Green : #30A15D (0.188 , 0.631, 0.365 ) : 27
    Keppel : #30A1A1 : (0.188 , 0.631 , 0.631) :28
    Azure : #3067A1 : (0.188, 0.404 , 0.631) :29
    RoyalPurple : #6F30A1 : (0.435 , 0.188 , 0.631) :30 
    RoyalHeath : #A1306A (0.631 , 0.188 , 0.416) :31

    '''

#-----------------------------------------------------------------------------------------------------------------------Rig


def d_Create_DisTance(Start , End , Name):
    St = None
    Et = None
    Dislst = None
    Loclst = None
    if Start and End:
        Dis = cmds.createNode("distanceDimShape" , n = '{}{}' .format(Name +"_DT", "Shape"))
        DisTr = cmds.listRelatives(Dis , p = 1 ,type = "transform")[0]
        DisTr = cmds.rename(DisTr , Name + "_DT")
        Dislst = [DisTr , Dis]

        StartLoc = cmds.spaceLocator(n = Name + "_DTStart_loc")
        EndLoc = cmds.spaceLocator(n=Name + "_DTEnd_loc")
        StartLocShp = cmds.listRelatives(StartLoc ,s=1)[0]
        EndLocShp = cmds.listRelatives(EndLoc ,s=1)[0]

        CP1 = cmds.parentConstraint(Start ,StartLoc[0])
        CP2 = cmds.parentConstraint(End , EndLoc[0])

        cmds.delete(CP1 )
        cmds.delete(CP2)

        cmds.connectAttr(StartLocShp + '.worldPosition[0]' , Dislst[1] + '.startPoint' ,f=1)
        cmds.connectAttr(EndLocShp + '.worldPosition[0]', Dislst[1] + '.endPoint', f=1)

        Loclst = [StartLoc[0] ,EndLoc[0] ]

        return  Dislst , Loclst

def d_Set_StretchIKSpline_Dic(Jntlst , Pattern , SuffixName = "" , FrontAxis = "Z"):


    rePattern = r"{}" .format(Pattern)
    Dic = {}
    ScaleDefault = None
    IK = None
    Crv  = None
    CrvShp = None
    ScaleAxis = ["X" , "Y" , "Z"]
    ScaleAxisIndex = ScaleAxis.index(FrontAxis)
    ScaleAxis.pop(ScaleAxisIndex )

    if len(Jntlst)> 1 :
        POS = [ tuple(cmds.xform(x , ws =1 , q =1, t =1))    for x in Jntlst]
        Search = re.search( rePattern, Jntlst[0] )
        if Search:
            Name = Search.group() +  SuffixName
            ScaleDefault = cmds.spaceLocator(n = Name + "_ScaleDefualt")[0]

            Crv = cmds.curve(p = POS , d =1 , n = Name + "_Crv" )
            CrvShp = cmds.listRelatives(Crv , s =1 )[0]
            cmds.rebuildCurve(Crv , kr = 0 ,d =3)
            cmds.delete(CrvShp + ".cv[1]")
            cmds.delete(CrvShp + ".cv[{}]" .format(len(Jntlst)-1))
            cmds.rebuildCurve(Crv , kr = 0,end =1 , rt = 0 ,kcp = 1, kep =1,rpo =1 ,ch =1 ,d =3 , s =len(Jntlst) +1)

            if not cmds.attributeQuery("Stretch", node=Jntlst[0], exists=True):
                cmds.addAttr(Jntlst[0] , ln = "Stretch" ,at='double', k=1 , min =0 ,max = 1)
            if not cmds.attributeQuery("Volume", node=Jntlst[0], exists=True):
                cmds.addAttr(Jntlst[0] , ln = "Volume" ,at='double', k=1 , min =0 ,max = 1)
            if not cmds.attributeQuery("VolumeOffset", node=Jntlst[0], exists=True):
                cmds.addAttr(Jntlst[0] , ln = "VolumeOffset" ,at='double', k=1 )

            IK = cmds.ikHandle( n =Name  + "_IKHD" , sj = Jntlst[0] , ee = Jntlst[-1] ,roc =1 , c = CrvShp ,ccv =0, sol ="ikSplineSolver"  )

            Div = 1.0/(len(Jntlst)+1)
            ScaleMDs = []
            OldPOCIF = None
            for i, x in enumerate(Jntlst):
                #Parameter = Div * i
                GetParameter = None

                NPOC = cmds.createNode("nearestPointOnCurve" , n = Name + "_{}_NPOC" .format(i+1))
                POCIF = cmds.createNode("pointOnCurveInfo", n = Name + "_{}_POCIF" .format(i+1))


                cmds.setAttr(POCIF + ".turnOnPercentage", 1)

                cmds.connectAttr(CrvShp + ".worldSpace[0]" , NPOC + ".inputCurve" , f=1)
                cmds.connectAttr(CrvShp + ".worldSpace[0]" , POCIF + ".inputCurve" , f=1)

                for AxisIndex , Axis in enumerate("XYZ"):
                    cmds.setAttr(NPOC + ".inPosition{}" .format(Axis) , POS[i][AxisIndex])
                    GetParameter = cmds.getAttr(NPOC + ".parameter")


                cmds.delete(NPOC )
                cmds.setAttr(POCIF + ".parameter" , GetParameter)


                if OldPOCIF:
                    GetAxisTransV = cmds.getAttr(x + ".translate{}" .format(FrontAxis ))
                    DTB = cmds.createNode("distanceBetween" , n =  Name + "_{}_DTB" .format(i))
                    ScaleMD = cmds.createNode("multiplyDivide" , n = Name + "_{}_Scaling_MD" .format(i))
                    BC = cmds.createNode("blendColors" , n = Name + "_{}_Stretch_BC" .format(i))

                    cmds.setAttr(BC + ".color2R" , GetAxisTransV)
                    cmds.connectAttr(ScaleMD + ".outputX" , BC + ".color1R" ,f =1)
                    cmds.connectAttr(Jntlst[0] + ".Stretch" , BC + ".blender",f =1)
                
                    cmds.setAttr(ScaleMD + ".operation" , 2)
                    cmds.connectAttr( DTB + ".distance" , ScaleMD + ".input1X" ,f =1)
                    cmds.connectAttr(ScaleDefault + ".scaleX" , ScaleMD + ".input2X" ,f =1)

                    cmds.connectAttr(OldPOCIF + ".position" , DTB + ".point1", f=1)
                    cmds.connectAttr(POCIF + ".position" , DTB + ".point2" ,f =1)

                    cmds.connectAttr(BC + ".outputR" , x + ".translate{}" .format(FrontAxis) ,f =1)

                    if not i == len(Jntlst)-1:

                        NormalMD = cmds.createNode("multiplyDivide" , n = Name + "_{}_VolumeNormal_MD" .format(i))
                        DivVolumeMD = cmds.createNode("multiplyDivide" , n = Name + "_{}_VolumeDiv_MD" .format(i))
                        PowerMD = cmds.createNode("multiplyDivide" , n = Name + "_{}_VolumePower_MD" .format(i))
                        VolumeBC = cmds.createNode("blendColors" , n = Name + "_{}_Volume_BC" .format(i))
                        ADL = cmds.createNode("addDoubleLinear", n = Name + "_{}_VolumeAdd_ADL" .format(i))


                        cmds.setAttr(NormalMD + ".input2X" , GetAxisTransV)
                        cmds.setAttr(NormalMD   + ".operation" , 2)
                        cmds.setAttr(DivVolumeMD  + ".input1X" ,1)
                        cmds.setAttr(DivVolumeMD  + ".operation" , 2)
                        cmds.setAttr(PowerMD   + ".operation" , 3)
                        cmds.setAttr(PowerMD   + ".input2X"  , 0.5)
                        cmds.setAttr(VolumeBC + ".color2R" ,1)

                        cmds.connectAttr(ScaleMD + ".outputX" , NormalMD + ".input1X" ,f=1)
                        cmds.connectAttr(NormalMD + ".outputX" , DivVolumeMD + ".input2X" ,f =1)

                        cmds.connectAttr(DivVolumeMD + ".outputX" , PowerMD + ".input1X" ,f =1)
                        cmds.connectAttr( PowerMD + ".outputX" , VolumeBC + ".color1R" ,f =1)
                        cmds.connectAttr(Jntlst[0] + ".Volume" ,VolumeBC + ".blender",f =1)
                        cmds.connectAttr(VolumeBC + ".outputR" , ADL + ".input1" ,f =1)
                        cmds.connectAttr(Jntlst[0] + ".VolumeOffset" , ADL + ".input2" ,f =1)

                        for Axis in ScaleAxis:
                            cmds.connectAttr(ADL + ".output" , x + ".scale{}" .format(Axis) ,f =1)
                OldPOCIF = POCIF
                
    Dic["Jntlst"] = Jntlst
    Dic["AttrJnt"] = Jntlst[0]
    Dic["IK"] = IK
    Dic["Crv"] = [Crv , CrvShp]
    Dic["ScaleDefualt"] = ScaleDefault

    return Dic


def d_Set_StretchIK_Dic(Jntlst ,Pattern , PVStretchTgt = None  , ScaleDefaultTgt = None ):
    rePattern = r"{}" .format(Pattern)
    Dic = {}

    ADL_MD_lst = []
    DisTanceShplst = []
    DisTancelst = []
    PVst_BC_lst = None
    PVstretchDTShp = None
    LocStartPVDT = None
    LocEndPVDT = None
    LocMiddlePVDT = None

    PlusMinus = 1
    if all(cmds.objectType(x) == "joint" for x in Jntlst) and len(Jntlst) >1:
        # --------------------------------------------------------------------------Setting Default Name
        Start = Jntlst[0]
        End = Jntlst[-1]
        StartMatch = re.search(rePattern, Start)
        DefaultName = StartMatch.groups(0)[0]
        # --------------------------------------------------------------------------Query Jnt Axis
        Axis = d_Query_JntAxis(Jntlst[0], Jntlst[1])
        NotPrimaryAxis = [x for x in "XYZ" if not x == Axis ]

        # --------------------------------------------------------------------------Query JntTranslate Value -1 or 1
        GetAttrTrans = cmds.getAttr(Jntlst[1] + '.translate{}'.format(Axis))
        PlusMinus = GetAttrTrans / abs(GetAttrTrans)

        # --------------------------------------------------------------------------Create Distance Node & Query Linear Distance
        Basic_Distancelst, LocDT_lst = d_Create_DisTance(Start, End, DefaultName)

        DisLinear = 0
        Behind_Jnt =None
        for x in Jntlst:
            if Behind_Jnt:
                dis = d_Cal_Distance(Behind_Jnt , x)
                DisLinear = DisLinear + dis
            Behind_Jnt = x

        GetDis = cmds.getAttr(Basic_Distancelst[-1] + '.distance')
        DisTotal = DisLinear

        # --------------------------------------------------------------------------Create Distance Node for PoleVector Stretch
        if PVStretchTgt and len(Jntlst) == 3:
            StartPV_Distancelst , LocStartPVDT_lst = d_Create_DisTance(Start , PVStretchTgt  , DefaultName + "_Start_PVst")
            EndPV_Distancelst, LocEndPVDT_lst = d_Create_DisTance( PVStretchTgt , End, DefaultName + "_End_PVst")

            PVstretchDTShp = [StartPV_Distancelst[-1] , EndPV_Distancelst[-1]]
            LocMiddlePVDT = [LocStartPVDT_lst[-1] ,LocEndPVDT_lst[0] ]
            LocStartPVDT = LocStartPVDT_lst[0]
            LocEndPVDT = LocEndPVDT_lst[-1]

            DisTancelst.append(StartPV_Distancelst[0])
            DisTanceShplst.append(StartPV_Distancelst[1])
            DisTancelst.append(EndPV_Distancelst[0])
            DisTanceShplst.append(EndPV_Distancelst[1])

            PVst_BC_lst = []

        DisTancelst.append(Basic_Distancelst[0])
        DisTanceShplst.append(Basic_Distancelst[1])
        # --------------------------------------------------------------------------Setting ScaleDefault for Stretch & Volume
        if ScaleDefaultTgt is None:
            ScaleDefaultTgt = d_Create_Node("{}{}" .format(DefaultName , "_Stretch_ScaleDefault"))

        #--------------------------------------------------------------------------Create BasicNode Stretcht & Volume
        DivMD = d_Create_MdNode("{}{}".format(DefaultName , "_St_Div_MD"),2)
        ScaleMD = d_Create_MdNode("{}{}".format(DefaultName , "_St_Scale_MD") ,1)
        BC = d_Create_BcNode("{}{}".format(DefaultName , "_St_BC"))
        Con = d_Create_ConNode("{}{}".format(DefaultName , "_St_Con"),3)

        VolumeDivMD = d_Create_MdNode("{}{}".format(DefaultName , "_Volume_Div_MD"),2)
        VolumePowerMD = d_Create_MdNode("{}{}".format(DefaultName , "_Volume_Power_MD"),3)
        VolumeBC = d_Create_BcNode("{}{}".format(DefaultName , "_Volume_BC"))
        VolumeADL = d_Create_ADLNode("{}{}" .format(DefaultName ,  "_Volume_Add_ADL") ,1)

        cmds.setAttr(VolumeBC + '.blender' , 0 )
        cmds.setAttr(VolumeBC + '.color2R', 1)
        cmds.setAttr(VolumePowerMD + ".input2X", 0.5)
        cmds.setAttr(VolumeDivMD + '.input1X' , 1)

        cmds.connectAttr(VolumeDivMD + '.outputX' , VolumePowerMD + '.input1X' ,f =1)
        cmds.connectAttr(VolumePowerMD + '.outputX' ,VolumeBC + '.color1R', f=1 )
        cmds.connectAttr(VolumeBC + '.outputR' , VolumeADL + '.input1' , f=1)
        cmds.connectAttr(BC + '.outputR' , VolumeDivMD + '.input2X' ,f= 1)

        cmds.setAttr(ScaleMD + '.input1X', GetDis)
        cmds.setAttr(ScaleMD + '.input1Y', DisTotal)
        cmds.setAttr(Con + '.colorIfFalseR' , 1)
        cmds.setAttr(BC + '.color2R' , 1)
        cmds.setAttr(BC + '.blender' , 0 )

        cmds.connectAttr(Basic_Distancelst[-1] + '.distance' , Con + '.firstTerm',f =1)
        cmds.connectAttr(ScaleMD + '.outputY' , Con +'.secondTerm', f=1)
        cmds.connectAttr(DivMD + '.outputX' , Con + '.colorIfTrueR', f=1)
        cmds.connectAttr(Con + '.outColorR' , BC + '.color1R' ,f=1)

        cmds.connectAttr(ScaleDefaultTgt + '.scaleX' , ScaleMD + '.input2X' ,f=1)
        cmds.connectAttr(ScaleDefaultTgt + '.scaleX', ScaleMD + '.input2Y', f=1)
        cmds.connectAttr(Basic_Distancelst[-1] + '.distance' ,DivMD + '.input1X' ,f=1)
        cmds.connectAttr(ScaleMD + '.outputY' , DivMD + '.input2X' ,f=1)
        # --------------------------------------------------------------------------Rig Stretch
        for i ,x in enumerate(Jntlst[1:]):
            JntMatch = re.search(rePattern, x)
            JntMatchName = JntMatch.groups(0)[0]
            GetTranslate = cmds.getAttr(x + '.translate{}' .format(Axis))

            RsMDL = d_Create_MDLNode("{}{}" .format(JntMatchName , "_St_Rs_MD") , GetTranslate)
            AddMD = d_Create_MDLNode("{}{}".format(JntMatchName, "_St_Add_MD"), GetTranslate)
            RsADL = d_Create_ADLNode("{}{}" .format(JntMatchName , "_St_Rs_ADL") , 0 )

            cmds.connectAttr(AddMD + '.output' , RsADL + '.input1' , f=1)
            cmds.connectAttr(BC + '.outputR' , RsMDL + '.input1' ,f=1 )
            ADL_MD_lst.append(AddMD)

            if PVStretchTgt and len(Jntlst) == 3:
                PVstBC = d_Create_BcNode("{}{}".format(JntMatchName , "_PVst_BC"))
                PVstMD = d_Create_MdNode("{}{}".format(JntMatchName , "_PVst_MD") , 2)
                PVstPlusMinusMDL = d_Create_MDLNode("{}{}".format(JntMatchName , "_PVst_PM_MD") , PlusMinus)

                cmds.setAttr(PVstBC + '.blender', 0)
                cmds.connectAttr(PVstretchDTShp[i] + '.distance' , PVstPlusMinusMDL + '.input1',f=1 )
                cmds.connectAttr(PVstPlusMinusMDL +  '.output', PVstMD + '.input1X', f=1)
                cmds.connectAttr(ScaleDefaultTgt + '.scaleX' ,PVstMD + '.input2X' ,f=1 )

                cmds.connectAttr(PVstMD + '.outputX', PVstBC + '.color1R', f=1)
                cmds.connectAttr(RsMDL + '.output', PVstBC + '.color2R', f=1)

                cmds.connectAttr(PVstBC + '.outputR' , RsADL + '.input2' , f=1 )
                PVst_BC_lst.append(PVstBC)
            else:
                cmds.connectAttr(RsMDL + '.output', RsADL + '.input2', f=1)

            cmds.connectAttr(RsADL + '.output' , x + '.translate{}' .format(Axis) ,f =1)


        # --------------------------------------------------------------------------Rig Volume
        for i,x in enumerate(Jntlst[1:-1]):
            for y in NotPrimaryAxis:
                cmds.connectAttr(VolumeADL + '.output' , x + '.scale{}' .format(y),f =1)

        # --------------------------------------------------------------------------SettingAttr
        [cmds.setAttr(x + '.visibility' , 0 ) for x in DisTancelst]
        [cmds.setAttr(x + '.visibility', 0) for x in cmds.ls("*_loc" , type = "transform")]


        StretchAttr = d_Add_FloatAttr(Start, "Stretch" , 0 ,1)
        VolumeAttr = d_Add_FloatAttr(Start, "Volume" , 0 ,1)
        VolumeOffsetAttr = d_Add_FloatOffsetAttr(Start , "VolumeOffset")
        Attr_lst =[StretchAttr , VolumeAttr , VolumeOffsetAttr  ]

        for i ,x in enumerate(Jntlst[1:]):
            Pattern_Set = r"_([A-Za-z]+)_"
            Match_Set = re.search(Pattern_Set ,x)
            ExName = Match_Set.groups(1)[0]

            print (ExName)

            Attr = d_Add_FloatOffsetAttr(Start , "{}_{}" .format(ExName , "Slide"))
            cmds.connectAttr("{}.{}_{}" .format(Start , ExName , "Slide") , ADL_MD_lst[i] + ".input1" , f=1)
            Attr_lst.append(Attr)

        cmds.connectAttr("{}.{}" .format(Start , StretchAttr) , BC + '.blender',f=1)
        cmds.connectAttr("{}.{}" .format(Start , VolumeAttr) , VolumeBC + '.blender',f=1)
        cmds.connectAttr("{}.{}" .format(Start , VolumeOffsetAttr)  , VolumeADL + '.input2' ,f =1 )
        if PVStretchTgt and len(Jntlst) == 3:
            PV_StretchAttr = d_Add_FloatAttr(Start, "PV_Stretch", 0, 1)
            Attr_lst.append(PV_StretchAttr)
            for x in PVst_BC_lst:
                cmds.connectAttr("{}.{}" .format(Start , PV_StretchAttr)  , x + '.blender',f=1)

        # --------------------------------------------------------------------------Setting Dictionary
        Dic["ScaleDefault"] = ScaleDefaultTgt
        Dic["Stretch_BC"] = BC
        Dic["Volume_BC"] = VolumeBC
        Dic["Volume_ADL"] = VolumeADL
        Dic["Stretch_Start_Loc"] = LocDT_lst[0]
        Dic["Stretch_End_Loc"] = LocDT_lst[-1]
        Dic["Stretch_ADL_MD"] = ADL_MD_lst

        Dic["PVStretch_BC"] = PVst_BC_lst
        Dic["PVStretch_Start_Loc"] = LocStartPVDT
        Dic["PVStretch_End_Loc"] = LocEndPVDT
        Dic["PVStretch_Middle_Loc"] = LocMiddlePVDT
        Dic["Distance"] = DisTancelst
        Dic["Distance_Shp"] = DisTanceShplst
        Dic["AttrTarget"] = Start
        Dic["Attr"] = Attr_lst
        # --------------------------------------------------------------------------Return
        return Dic
    
def d_Create_PNFoli(Name  , Target = None , PNSize = 1  , Axis = (0,0,1) , U_Value= 0.5  , V_Value = 0.5 ):
    ReTurn_lst = []
    
    node = cmds.createNode("follicle" , n =  Name + "Shape")
    Find_Transform = cmds.listRelatives(node , p =1, type = 'transform')[0]
    Transform = cmds.rename(Find_Transform , Name)
    
    PN = cmds.polyPlane( n = "{}{}".format(Name , "_PN")   , h = PNSize  , w = PNSize  , sx =1 , sy =1 ,ax =Axis)
    Shp_PN = cmds.listRelatives(PN  , s =1 , type = "mesh")[0]
    
    cmds.connectAttr("{}.outTranslate".format(node  ) , "{}.translate" .format(Transform ) ,f =1)
    cmds.connectAttr("{}.outRotate".format(node  ) , "{}.rotate" .format(Transform ) ,f =1)
    cmds.connectAttr("{}.worldMatrix[0]".format(Shp_PN) ,"{}.inputWorldMatrix".format(node  ) ,f =1 )
    cmds.connectAttr("{}.worldMesh[0]".format(Shp_PN) ,"{}.inputMesh".format(node  ) ,f =1 )
    
    cmds.setAttr("{}.parameterU" .format(node) ,U_Value )
    cmds.setAttr("{}.parameterV" .format(node) ,V_Value )
    
    if Target:
        CP = cmds.parentConstraint(Target , PN , mo =0)[0]
        cmds.delete(CP)
    
    ReTurn_lst = [Transform , node , PN]
    
    return ReTurn_lst

def d_Query_Jnt_SeDrAngleAxis(StartJnt, MiddleJnt, EndJnt):
    lst = [StartJnt, MiddleJnt, EndJnt]
    loclst = [cmds.spaceLocator(n='{}_{}'.format(x, "_Cal_loc"))[0] for x in lst]
    CPlst = [cmds.parentConstraint(lst[i], x, mo=0)[0] for i, x in enumerate(loclst)]
    cmds.delete(CPlst)
    AngleA, AngleB, AngleC = d_Cal_TriAngle(loclst[0], loclst[1], loclst[2])
    cmds.delete(loclst)
    MiddleJntOrient = [cmds.getAttr(MiddleJnt + '.jointOrient{}'.format(x)) for x in "XYZ"]

    Axis = None
    for i, x in enumerate("XYZ"):
        Cal = abs(180 - abs(MiddleJntOrient[i]))
        if int(Cal) == int(AngleB):
            Axis = x

    return Axis



def d_Set_FixMirror_Jnts(Target):
    lst = []
    Mr = None
    if type(Target) == list and all(cmds.objectType(x) == "joint" for x in Target):
        Parent_Target = None
        cmds.parent(Target , w =1)
        for i ,x in enumerate(Target[:]):
            Jnt = x

            FixGrp_OrientPos = [ cmds.getAttr(Jnt + '.jointOrient{}' .format(x)) for i , x in enumerate("XYZ")]
            OrientFix = []

            FixGrp = cmds.createNode('transform' , n = "{}{}" .format(str(Jnt ) , "_FixGrp"))
            CP = cmds.parentConstraint(Jnt , FixGrp)[0]
            cmds.delete(CP)
            cmds.parent(Jnt  , FixGrp)

            cmds.scale(-1,-1,-1, FixGrp)

            if Parent_Target:
                cmds.parent(Jnt  , Parent_Target)
                cmds.delete(FixGrp)
            else:
                Mr = cmds.rename(FixGrp, Jnt + "_MrOffset")
            Parent_Target = Jnt
            lst.append(Jnt)
        return lst , Mr

def d_Constraint_With_Cnt_Scale(Staric , Target , MainTain = True):
    Constraint = None
    Constraint = cmds.parentConstraint(Staric , Target , mo = MainTain)
    for x in "XYZ":

        cmds.connectAttr('{}.scale{}' .format(Staric, x) ,'{}.scale{}' .format(Target ,x),f =1)

    return Constraint[0]






def d_Insert_Jnt(Name, TargetLst, StartIndex, Count, InverseAxisBool=False):
    if all(cmds.nodeType(x) == "joint" for x in TargetLst):
        Result = []
        if StartIndex == len(TargetLst):
            Result = None
            return Result
        else:
            def Query_JntAxis(StartJnt, EndJnt):
                Axis = "XYZ"
                Start_Pos = cmds.xform(StartJnt, q=1, ws=1, t=1)
                End_Pos = cmds.xform(EndJnt, q=1, ws=1, t=1)

                Crv = cmds.curve(n="StartEnd_Crv", p=(Start_Pos, End_Pos), d=1)
                CrvShp = cmds.listRelatives(Crv, s=1)[0]
                loc = cmds.spaceLocator(n="StartEnd_loc")[0]
                POICF = cmds.createNode('pointOnCurveInfo', n="POS_POICF")
                DM = cmds.createNode('decomposeMatrix', n="POS_DM")

                cmds.setAttr(POICF + ".turnOnPercentage", 1)
                cmds.connectAttr(CrvShp + '.worldSpace[0]', POICF + '.inputCurve', f=1)
                cmds.connectAttr(POICF + '.position', loc + '.translate', f=1)
                cmds.setAttr(POICF + '.parameter', 1)

                loc_Pos = cmds.xform(loc, q=1, ws=1, t=1)
                cmds.delete(POICF)
                cmds.delete(Crv)
                cmds.xform(loc, t=loc_Pos, ws=1)
                cmds.parent(loc, StartJnt)

                loc_Current_Pos = cmds.xform(loc, q=1, t=1, r=1)
                DisTance = Cal_Distance(StartJnt, loc)
                AimAxis = None

                Decimal = 5
                Re_DisTance = "{:.{}f}".format(DisTance, Decimal)

                for i, x in enumerate(Axis):
                    Re_Pos_Date = "{:.{}f}".format(abs(loc_Current_Pos[i]), Decimal)
                    if Re_DisTance == Re_Pos_Date:
                        AimAxis = x

                        break
                cmds.delete(loc)
                return AimAxis

            def Cal_Distance(S, E):
                S_Pos = cmds.xform(S, q=1, t=1, ws=1)
                E_Pos = cmds.xform(E, q=1, t=1, ws=1)
                DT = ((S_Pos[0] - E_Pos[0]) ** 2 + (S_Pos[1] - E_Pos[1]) ** 2 + (S_Pos[2] - E_Pos[2]) ** 2) ** 0.5
                return DT

            def Cal_ParameterValue(Total, Parameter):
                Value = Total * Parameter
                return Value

            def Cal_Parmeter(Total, Value):
                Parameter = Value / Total
                return Parameter

            def Set_UniqueName(BaseName):
                Suffix = 1
                NewName = BaseName
                while cmds.objExists(NewName):
                    NewName = "{}_{}".format(BaseName, Suffix)
                    Suffix += 1
                return NewName

            StartJnt = TargetLst[StartIndex]
            EndJnt = TargetLst[StartIndex + 1]

            Axis = Query_JntAxis(StartJnt, EndJnt)
            Total_Distance = Cal_Distance(StartJnt, EndJnt)

            Range = Count + 2

            Div = 1.0 / (Range - 1)

            UpperParent = None
            DownerChild = None
            lst = TargetLst

            if DownerChild is None:
                DownerChild = EndJnt

            for x in range(Count):
                FixName = Set_UniqueName(Name)
                Number = x + 1
                Parameter = Div * Number
                cmds.select(cl=1)

                # --
                Jnt = cmds.joint(n=FixName)
                Grp = cmds.group(Jnt, n="Fix_" + Jnt)
                CP = cmds.parentConstraint(StartJnt, Grp)[0]
                cmds.parent(Jnt, w=1)
                cmds.delete(CP)
                cmds.delete(Grp)
                cmds.parent(Jnt, StartJnt)
                cmds.rotate(0, 0, 0, Jnt)
                # --

                Jnt_Pos_Value = Cal_ParameterValue(Total_Distance, Parameter)
                if InverseAxisBool == True:
                    Jnt_Pos_Value = -1 * Jnt_Pos_Value

                cmds.setAttr('{}.translate{}'.format(Jnt, Axis), Jnt_Pos_Value)
                cmds.parent(DownerChild, Jnt)

                if UpperParent is None:
                    UpperParent = Jnt
                else:
                    cmds.parent(Jnt, UpperParent)

                Index_Sum = StartIndex + x
                lst.insert(Index_Sum, Jnt)
            return lst

def d_Insert_NameFmt_Jnt(Name, TargetLst, StartIndex, Count, InverseAxisBool=False):
    if all(cmds.nodeType(x) == "joint" for x in TargetLst):
        Result = []
        if StartIndex == len(TargetLst):
            Result = None
            return Result
        else:
            def Query_JntAxis(StartJnt, EndJnt):
                Axis = "XYZ"
                Start_Pos = cmds.xform(StartJnt, q=1, ws=1, t=1)
                End_Pos = cmds.xform(EndJnt, q=1, ws=1, t=1)

                Crv = cmds.curve(n="StartEnd_Crv", p=(Start_Pos, End_Pos), d=1)
                CrvShp = cmds.listRelatives(Crv, s=1)[0]
                loc = cmds.spaceLocator(n="StartEnd_loc")[0]
                POICF = cmds.createNode('pointOnCurveInfo', n="POS_POICF")
                DM = cmds.createNode('decomposeMatrix', n="POS_DM")

                cmds.setAttr(POICF + ".turnOnPercentage", 1)
                cmds.connectAttr(CrvShp + '.worldSpace[0]', POICF + '.inputCurve', f=1)
                cmds.connectAttr(POICF + '.position', loc + '.translate', f=1)
                cmds.setAttr(POICF + '.parameter', 1)

                loc_Pos = cmds.xform(loc, q=1, ws=1, t=1)
                cmds.delete(POICF)
                cmds.delete(Crv)
                cmds.xform(loc, t=loc_Pos, ws=1)
                cmds.parent(loc, StartJnt)

                loc_Current_Pos = cmds.xform(loc, q=1, t=1, r=1)
                DisTance = Cal_Distance(StartJnt, loc)
                AimAxis = None

                Decimal = 5
                Re_DisTance = "{:.{}f}".format(DisTance, Decimal)

                for i, x in enumerate(Axis):
                    Re_Pos_Date = "{:.{}f}".format(abs(loc_Current_Pos[i]), Decimal)
                    if Re_DisTance == Re_Pos_Date:
                        AimAxis = x

                        break
                cmds.delete(loc)
                return AimAxis

            def Cal_Distance(S, E):
                S_Pos = cmds.xform(S, q=1, t=1, ws=1)
                E_Pos = cmds.xform(E, q=1, t=1, ws=1)
                DT = ((S_Pos[0] - E_Pos[0]) ** 2 + (S_Pos[1] - E_Pos[1]) ** 2 + (S_Pos[2] - E_Pos[2]) ** 2) ** 0.5
                return DT

            def Cal_ParameterValue(Total, Parameter):
                Value = Total * Parameter
                return Value

            def Cal_Parmeter(Total, Value):
                Parameter = Value / Total
                return Parameter

            def Set_UniqueName_Fmt(BaseName):
                Suffix = 1
                NewName = BaseName
                while cmds.objExists(NewName):
                    NewName = BaseName.format(Suffix)
                    Suffix += 1
                return NewName

            StartJnt = TargetLst[StartIndex]
            EndJnt = TargetLst[StartIndex + 1]

            Axis = Query_JntAxis(StartJnt, EndJnt)
            Total_Distance = Cal_Distance(StartJnt, EndJnt)

            Range = Count + 2

            Div = 1.0 / (Range - 1)

            UpperParent = None
            DownerChild = None
            lst = TargetLst

            if DownerChild is None:
                DownerChild = EndJnt

            for x in range(Count):
                #FixName = Set_UniqueName_Fmt(Name)
                Number = x + 1
                Parameter = Div * Number
                cmds.select(cl=1)

                # --
                Jnt = cmds.joint(n=Name.format(Number))
                Grp = cmds.group(Jnt, n="Fix_" + Jnt)
                CP = cmds.parentConstraint(StartJnt, Grp)[0]
                cmds.parent(Jnt, w=1)
                cmds.delete(CP)
                cmds.delete(Grp)
                cmds.parent(Jnt, StartJnt)
                cmds.rotate(0, 0, 0, Jnt)
                # --

                Jnt_Pos_Value = Cal_ParameterValue(Total_Distance, Parameter)
                if InverseAxisBool == True:
                    Jnt_Pos_Value = -1 * Jnt_Pos_Value

                cmds.setAttr('{}.translate{}'.format(Jnt, Axis), Jnt_Pos_Value)
                cmds.parent(DownerChild, Jnt)
                if UpperParent:
                    cmds.parent(Jnt, UpperParent)
                UpperParent = Jnt


                Index_Sum = StartIndex + Number
                lst.insert(Index_Sum, Jnt)
            return lst




def d_Query_JntAxis(StartJnt , EndJnt):
    Axis = "XYZ"
    Start_Pos = cmds.xform(StartJnt, q=1 , ws =1, t =1)
    End_Pos = cmds.xform(EndJnt, q=1 , ws =1, t =1)

    Crv = cmds.curve(n = "StartEnd_Crv" ,p = (Start_Pos , End_Pos) , d =1)
    CrvShp = cmds.listRelatives(Crv , s= 1)[0]
    loc = cmds.spaceLocator( n = "StartEnd_loc")[0]
    POICF = cmds.createNode('pointOnCurveInfo' , n = "POS_POICF")
    DM = cmds.createNode('decomposeMatrix' , n = "POS_DM")


    cmds.setAttr(POICF + ".turnOnPercentage" ,1)
    cmds.connectAttr(CrvShp + '.worldSpace[0]', POICF + '.inputCurve' ,f =1)
    cmds.connectAttr(POICF + '.position' , loc + '.translate' ,f=1)
    cmds.setAttr(POICF + '.parameter' , 1)

    loc_Pos = cmds.xform(loc,q= 1, ws =1 , t=1)
    cmds.delete(POICF)
    cmds.delete(Crv)
    cmds.xform(loc , t = loc_Pos , ws =1)
    cmds.parent(loc, StartJnt)
    def Cal_Distance(S, E ):
        S_Pos = cmds.xform(S , q =1, t =1 ,ws =1)
        E_Pos = cmds.xform(E, q=1, t=1, ws=1)
        DT = ((S_Pos[0] - E_Pos[0])**2 + (S_Pos[1] - E_Pos[1])**2 + (S_Pos[2] - E_Pos[2])**2)**0.5
        return DT
    loc_Current_Pos = cmds.xform(loc,q=1 ,t =1, r=1)
    DisTance = Cal_Distance(StartJnt , loc)
    AimAxis =None

    Decimal = 5
    Re_DisTance = "{:.{}f}".format(DisTance, Decimal)

    for i,x in enumerate(Axis):
        Re_Pos_Date = "{:.{}f}".format(abs(loc_Current_Pos[i]), Decimal)
        if Re_DisTance == Re_Pos_Date:
            AimAxis = x

            break
    cmds.delete(loc)
    return  AimAxis


def d_Query_Jnt_SeDrAxis(StartJnt, MiddleJnt):
    import random
    lst = [StartJnt, MiddleJnt]
    Dulst = []
    Parent_Tgt = None
    for x in lst:
        cmds.select(cl =1)
        Jnt = cmds.joint(n = "{}_FindSeDr_" .format(x))
        Grp = cmds.group(Jnt , n = "{}_Grp" .format(Jnt))
        CP = cmds.parentConstraint(x , Grp)[0]
        cmds.delete(CP)
        cmds.parent(Jnt , w =1)
        if Parent_Tgt:
            cmds.parent(Jnt , Parent_Tgt)
        Parent_Tgt = Jnt
        cmds.delete(Grp)
        Dulst.append(Jnt)
    
    PrimaryAxis = d_Query_JntAxis(Dulst[0] , Dulst [1])
    
    loc = cmds.spaceLocator(n = "Pre_Find_SeDr_loc")[0]
    CP = cmds.parentConstraint(Dulst[-1]  , loc)[0]
    cmds.delete(CP)
    
    cmds.parent(loc , Dulst[-1])
    
    All_Axis = ["X" , "Y" , "Z"]
    PrimaryAxis_index = All_Axis.index(PrimaryAxis)
    All_Axis.pop(PrimaryAxis_index)
    rand_int = random.randint(0, 1)
    PreSeDrAxis = All_Axis[rand_int]
    
    GetRotate = cmds.getAttr(Dulst[0] + ".rotate{}" .format(PrimaryAxis))
    
    cmds.setAttr(Dulst[0] + ".rotate{}" .format(PreSeDrAxis) ,GetRotate +  90)
    SeDrDisTance = d_Cal_Distance(Dulst[1], loc)
    cmds.parent(loc , Dulst[0])
    cmds.setAttr(Dulst[0] + ".rotate{}" .format(PreSeDrAxis) , GetRotate)
    
    Pos = cmds.xform(loc , q =1, t= 1)
    
    Decimal = 5
    SeDrDisTance = "{:.{}f}" .format(SeDrDisTance , Decimal)

    Find_PreSeDrAxis = None
    for i , x in enumerate("XYZ"):
        PosValue = "{:.{}f}" .format(abs(Pos[i]) , Decimal)
        
        if PosValue == SeDrDisTance and not x == PrimaryAxis:
            Find_PreSeDrAxis = x 
    cmds.delete(Dulst)
    SeDr_Axis = None
    for x in "XYZ":
        if not PrimaryAxis == x and not Find_PreSeDrAxis == x:
            SeDr_Axis =x
    return SeDr_Axis




def d_Set_Parent_Objs(TargetLst):
    lst = []
    Parent_item = None
    for x in TargetLst:
        if Parent_item:
            cmds.parent(x, Parent_item)
        Parent_item = x
        lst.append(x)
    return lst


def d_Create_MirrorJnt(TargetJnt, Search , Replace, Use_Parent =True):
    Search_Replace_lst = [Search, Replace]
    Parent_Target = None
    if Use_Parent ==True:
        Parent_Target = cmds.listRelatives(TargetJnt, p=1)[0]

    cmds.select(cl =1)
    PreMrRoot = cmds.joint(n = "PreFixRoot_" + TargetJnt )

    cmds.parent(TargetJnt , PreMrRoot)
    cmds.mirrorJoint(TargetJnt , myz =1 , mirrorBehavior = 1, sr = Search_Replace_lst )

    cmds.parent(TargetJnt, w=1)

    cmds.select(TargetJnt ,hi =1)
    L_Jnt_lst = cmds.ls(sl =1 , type = 'joint')
    cmds.select(PreMrRoot, hi=1)
    R_Jnt_lst = cmds.ls(sl=1, type='joint')[1:]
    cmds.parent(R_Jnt_lst[0], w=1)
    cmds.delete(PreMrRoot)


    if Use_Parent == True:
        if not Parent_Target is None:
            cmds.parent(L_Jnt_lst[0] , R_Jnt_lst[0] , Parent_Target)

    return L_Jnt_lst , R_Jnt_lst


def d_Grping(Target , Count):
    Grp_Suffix = ["_Grp" , "_Offset" , "_Prime" , '_GrpPrime']
    Count = int(Count)
    Groups =[]
    Parent_Group = None
    for i , x in enumerate(Grp_Suffix[:Count]):
        Group = cmds.createNode("transform" , n = "{}{}" .format(Target ,x))

        if Parent_Group:
            cmds.parent( Parent_Group ,Group )
        Parent_Group = Group
        Groups.append(Group)
    cmds.delete(cmds.parentConstraint(Target, Groups[-1]))
    cmds.parent(Target ,  Groups[0])

    return  Target , Groups

def d_Grping_Mirror(Name , Item , DirectNameList):
    MrGrp = cmds.createNode("transform" , n = Name)
    cmds.parent(Item , MrGrp)
    
    
    Dulicate_MrGrp = cmds.duplicate(MrGrp , n = MrGrp.replace(DirectNameList[0] , DirectNameList[1]) , rc =1 )
    cmds.select(Dulicate_MrGrp[0] , hi =1)
    All_Child_List = cmds.ls(sl =1)
    All_Child_List = [x for x in All_Child_List if not cmds.objectType(x) == "nurbsCurve" ]
    
     
    for i , x in  enumerate(All_Child_List):
        ReName = x.replace(DirectNameList[0] , DirectNameList[1])
        if ReName.endswith("1"):
            ReName = ReName[:-1]

        uniqueName = ReName
        ReNameObj = cmds.rename(x ,  uniqueName)
        
    cmds.setAttr(Dulicate_MrGrp[0] + ".scaleX" , -1)


def d_Set_Obj_On_Crv(Target, Crv, Parameter=0, CrvKrBool=False):
    CV = cmds.ls(Crv + '.cv[*]', fl=1)
    Spans = len(CV)
    Degree = cmds.getAttr(Crv + ".degree")
    if CrvKrBool == False:
        Crv = cmds.rebuildCurve(Crv, ch=1, rpo=1, kt=0, kr=0, kcp=1, d=Degree)[0]

    DuCrv = cmds.duplicate(Crv, n=Crv + '_Fix')[0]
    DuCrvShp = cmds.listRelatives(DuCrv, s=1)[0]
    GetDegree = cmds.getAttr(DuCrvShp + ".degree")
    if GetDegree > 2:
        DuCrv_CV = cmds.ls(DuCrv + '.cv[*]', fl=1)
        cmds.delete(DuCrv_CV[-2])
        cmds.delete(DuCrv_CV[1])
        DuCrv = cmds.rebuildCurve(DuCrv, ch=1, kr=0, kcp=1, d=Degree)[0]
    PreFixCrv = cmds.rebuildCurve(DuCrv, ch=1, rpo=1, rt=0, end=0, kcp=1, kt=0, d=1, kr=0, s=Spans)[0]

    if cmds.objectType(Crv) == 'transform':
        Crv = cmds.listRelatives(Crv, s=1)[0]
        FixCrv = cmds.listRelatives(PreFixCrv, s=1)[0]

    FixPOICFLoc = cmds.spaceLocator(n=Target + '_FIx_POICF_loc')[0]
    FixPOICF = cmds.createNode('pointOnCurveInfo', n=Target + '_Fix_POCIF')
    POICF = cmds.createNode('pointOnCurveInfo', n=Target + '_POCIF')
    NPOC = cmds.createNode('nearestPointOnCurve', n=Target + '_Fix_NPOC')
    FixDM = cmds.createNode('decomposeMatrix', n=Target + '_Fix_DM')

    cmds.setAttr(FixPOICF + '.parameter', Parameter)
    cmds.setAttr(FixPOICF + '.turnOnPercentage', 1)
    cmds.setAttr(POICF + '.turnOnPercentage', 1)

    cmds.connectAttr(FixCrv + '.worldSpace[0]', FixPOICF + '.inputCurve', f=1)
    cmds.connectAttr(Crv + '.worldSpace[0]', POICF + '.inputCurve', f=1)
    cmds.connectAttr(Crv + '.worldSpace[0]', NPOC + '.inputCurve', f=1)

    cmds.connectAttr(FixPOICF + '.position', FixPOICFLoc + '.translate', f=1)
    cmds.connectAttr(FixPOICFLoc + '.worldMatrix[0]', FixDM + '.inputMatrix', f=1)
    cmds.connectAttr(FixDM + '.outputTranslate', NPOC + '.inPosition', f=1)
    cmds.connectAttr(NPOC + '.result.parameter', POICF + '.parameter', f=1)

    GetParameter = cmds.getAttr(NPOC + '.parameter')

    cmds.delete(FixPOICF)
    cmds.delete(NPOC)
    # cmds.delete(FixDM)
    cmds.delete(FixPOICFLoc)

    cmds.connectAttr(POICF + '.result.position ', Target + '.translate', f=1)
    cmds.setAttr(POICF + '.parameter', GetParameter)
    cmds.delete(PreFixCrv)
    return Target


def d_Create_Loc_On_Crv(Name, Crv, Parameter=0, CrvKrBool=True):
    CV = cmds.ls(Crv + '.cv[*]', fl=1)
    Spans = len(CV)
    Degree = cmds.getAttr(Crv + ".degree")
    if CrvKrBool == False:
        Crv = cmds.rebuildCurve(Crv, ch=1, kr=0, kcp=1, rt=1, d=Degree)[0]

    DuCrv = cmds.duplicate(Crv, n=Crv + '_Fix', rr=1)[0]
    DuCrvShp = cmds.listRelatives(DuCrv, s=1)[0]

    GetDegree = cmds.getAttr(DuCrvShp + ".degree")
    if GetDegree > 2:
        DuCrv_CV = cmds.ls(DuCrv + '.cv[*]', fl=1)
        cmds.delete(DuCrv_CV[-2])
        cmds.delete(DuCrv_CV[1])
        DuCrv = cmds.rebuildCurve(DuCrv, kr=0, kcp=1, d=Degree)[0]
    PreFixCrv = cmds.rebuildCurve(DuCrv, ch=1, rpo=1, rt=0, end=0, kcp=1, kt=0, d=1, kr=0, s=Spans)[0]

    if cmds.objectType(Crv) == 'transform':
        Crv = cmds.listRelatives(Crv, s=1)[0]
        FixCrv = cmds.listRelatives(PreFixCrv, s=1)[0]

    Loc = cmds.spaceLocator(n=Name + '_POICF_loc')[0]
    FixPOICFLoc = cmds.spaceLocator(n=Name + '_FIx_POICF_loc')[0]
    FixPOICF = cmds.createNode('pointOnCurveInfo', n=Name + '_Fix_POCIF')
    POICF = cmds.createNode('pointOnCurveInfo', n=Name + '_POCIF')
    NPOC = cmds.createNode('nearestPointOnCurve', n=Name + '_Fix_NPOC')
    FixDM = cmds.createNode('decomposeMatrix', n=Name + '_Fix_DM')

    cmds.setAttr(FixPOICF + '.parameter', Parameter)
    cmds.setAttr(FixPOICF + '.turnOnPercentage', 1)
    cmds.setAttr(POICF + '.turnOnPercentage', 1)

    cmds.connectAttr(FixCrv + '.worldSpace[0]', FixPOICF + '.inputCurve', f=1)
    cmds.connectAttr(Crv + '.worldSpace[0]', POICF + '.inputCurve', f=1)
    cmds.connectAttr(Crv + '.worldSpace[0]', NPOC + '.inputCurve', f=1)

    cmds.connectAttr(FixPOICF + '.position', FixPOICFLoc + '.translate', f=1)
    cmds.connectAttr(FixPOICFLoc + '.worldMatrix[0]', FixDM + '.inputMatrix', f=1)
    cmds.connectAttr(FixDM + '.outputTranslate', NPOC + '.inPosition', f=1)
    cmds.connectAttr(NPOC + '.result.parameter', POICF + '.parameter', f=1)

    GetParameter = cmds.getAttr(NPOC + '.parameter')

    cmds.delete(FixPOICF)
    cmds.delete(NPOC)
    # cmds.delete(FixDM)
    cmds.delete(FixPOICFLoc)

    cmds.connectAttr(POICF + '.result.position ', Loc + '.translate', f=1)
    cmds.setAttr(POICF + '.parameter', GetParameter)
    cmds.delete(PreFixCrv)

    return Loc


def d_Tangt_Constraint(Target , Crv , AimTuple ,UpTuple, WorldUpTuple, VectorObj):
    TG = cmds.tangentConstraint(Crv , Target , aim = AimTuple , u = UpTuple , wu = WorldUpTuple , wuo = VectorObj  , wut = "objectrotation")[0]
    if TG is None or len(TG) == 0:
        return None
    return TG

def d_Tangt_Constraint_For_Lst(TargetLst , Crv , AimTuple ,UpTuple, WorldUpTuple, VectorObj):
    lst = []
    for x in TargetLst:
        TG = cmds.tangentConstraint(Crv, x, aim=AimTuple, u=UpTuple, wu=WorldUpTuple, wuo=VectorObj, wut="objectrotation")[0]
        lst.append(TG)
    if  lst is None or len(lst) == 0:
        return None
    return lst


def d_Create_CvFix_Crv(TargetLst, Name, DegreeCount=3):
    Poslst = []
    for x in TargetLst:
        Pos = cmds.xform(x, q=1, t=1, ws=1)
        Tuple = tuple(Pos)

        Poslst.append(Tuple)

    Crv = cmds.curve(d=1, p=Poslst, n=Name)
    Total =len(TargetLst)
    AddSpan =0
    KepBool = 0
    if DegreeCount > 1:
        AddSpan = 3
        KepBool = 1
        
    Spans = Total - AddSpan 
    
    FixCrv = cmds.rebuildCurve(Crv , ch =1     ,kr =0  ,kcp =1  ,kep =KepBool  ,kt =0  ,s =Spans ,d =DegreeCount  ,tol= 0.01)[0]


    return FixCrv


def d_Create_MatchCV_LocsOnCrv(TargetCrv , Name , ReturnDicBool = False):

    ReturnLst = []
    ReturnPOCIF = []
    ReturnPoss = []
    ReturnDic = {}
    CVs = cmds.ls(TargetCrv + '.cv[*]', fl=1)

    ShpCrv = TargetCrv 
    if cmds.objectType(TargetCrv) == "transform":
        ShpCrv = cmds.listRelatives(TargetCrv , s=1)[0]


    for i , Cv in enumerate(CVs):
        CV_Pos = cmds.xform(Cv ,q= 1, ws =1 , t =1 )
        NPOC = cmds.createNode('nearestPointOnCurve', n=Name + '_{}_Fix_NPOC'.format(str(i + 1)))
        POCIF = cmds.createNode('pointOnCurveInfo', n=Name + '_{}_POCIF'.format(str(i+ 1)))
        Loc = cmds.spaceLocator(n=Name + '_{}_POCIF_loc'.format(str(i + 1)))[0]
        

        cmds.connectAttr(ShpCrv + ".worldSpace[0]" , POCIF  + '.inputCurve', f=1)
        cmds.connectAttr(ShpCrv + ".worldSpace[0]" , NPOC + '.inputCurve', f=1)

        for AxisCount , Axis in enumerate("XYZ"):
            cmds.setAttr(NPOC + ".inPosition{}" .format(Axis) ,CV_Pos[AxisCount] )
        
        GetParameter = cmds.getAttr(NPOC + ".parameter" )
        cmds.setAttr(POCIF + '.turnOnPercentage', 1)
        cmds.setAttr(POCIF + ".parameter" ,GetParameter )
        cmds.connectAttr(POCIF + '.result.position ', Loc + '.translate', f=1)
        cmds.delete(NPOC)


        ReturnLst.append(Loc[0])
        if ReturnDicBool:
            ReturnPOCIF.append(POCIF)
    
    if ReturnDicBool:
        ReturnDic["Locs"] = ReturnLst
        ReturnDic["POCIFs"] = ReturnPOCIF
        ReturnDic["ShpCrv"] = ShpCrv
        ReturnDic["Pos"] = ReturnPoss
        return ReturnDic
    else:
        return ReturnLst




def d_Create_Locs_On_Crv(TargetCrv, CreatCount, Name, CrvKrBool = False):
    CV = cmds.ls(TargetCrv + '.cv[*]', fl=1)
    Spans = len(CV)
    Degree = cmds.getAttr(TargetCrv + ".degree")
    if CrvKrBool == False:
        TargetCrv = cmds.rebuildCurve(TargetCrv,ch =1, kr=0, kcp=1, rt =1,d=Degree)[0]

    DuCrv = cmds.duplicate(TargetCrv, n=Name + '_Fix')[0]
    DuCrvShp = cmds.listRelatives(DuCrv ,s =1)[0]
    GetDegree = cmds.getAttr(DuCrvShp + ".degree")
    if GetDegree > 2:
        DuCrv_CV = cmds.ls(DuCrv + '.cv[*]', fl=1)
        cmds.delete(DuCrv_CV[-2])
        cmds.delete(DuCrv_CV[1])

        DuCrv = cmds.rebuildCurve(DuCrv, kr=0, kcp=1, d=Degree)[0]
    PreFixCrv = cmds.rebuildCurve(DuCrv, ch=1, rpo=1, rt=0, end=0, kcp=1, kt=0, d=1, s=Spans)[0]


    Div = 1.0 / (CreatCount - 1)
    lst = []
    node_lst = []
    if cmds.objectType(TargetCrv) == 'transform':
        TargetCrv = cmds.listRelatives(TargetCrv ,s =1)[0]
        FixCrv = cmds.listRelatives(PreFixCrv  ,s =1)[0]

    for x in range(CreatCount):
        Value = Div * x
        Loc = cmds.spaceLocator(n=Name + '_{}_POICF_loc'.format(str(x + 1)))[0]
        FixPOICFLoc = cmds.spaceLocator(n=Name + '_{}_FIx_POICF_loc'.format(str(x + 1)))[0]

        FixPOICF = cmds.createNode('pointOnCurveInfo', n=Name + '_{}_Fix_POCIF'.format(str(x + 1)))
        POICF = cmds.createNode('pointOnCurveInfo', n=Name + '_{}_POCIF'.format(str(x + 1)))
        NPOC = cmds.createNode('nearestPointOnCurve', n=Name + '_{}_Fix_NPOC'.format(str(x + 1)))
        FixDM = cmds.createNode('decomposeMatrix', n=Name + '_{}_Fix_DM'.format(str(x + 1)))

        cmds.setAttr(FixPOICF + '.parameter', Value)
        cmds.setAttr(FixPOICF + '.turnOnPercentage', 1)
        cmds.setAttr(POICF + '.turnOnPercentage', 1)

        cmds.connectAttr(FixCrv + '.worldSpace[0]', FixPOICF + '.inputCurve', f=1)
        cmds.connectAttr(TargetCrv + '.worldSpace[0]', POICF + '.inputCurve', f=1)
        cmds.connectAttr(TargetCrv + '.worldSpace[0]', NPOC + '.inputCurve', f=1)

        cmds.connectAttr(FixPOICF + '.position', FixPOICFLoc + '.translate', f=1)
        cmds.connectAttr(FixPOICFLoc + '.worldMatrix[0]', FixDM + '.inputMatrix', f=1)
        cmds.connectAttr(FixDM + '.outputTranslate', NPOC + '.inPosition', f=1)
        cmds.connectAttr(NPOC + '.result.parameter', POICF + '.parameter', f=1)

        GetParameter = cmds.getAttr(NPOC + '.parameter')

        cmds.delete(FixPOICF)
        cmds.delete(NPOC)
        # cmds.delete(FixDM)
        cmds.delete(FixPOICFLoc)

        cmds.connectAttr(POICF + '.result.position ', Loc + '.translate', f=1)
        cmds.setAttr(POICF + '.parameter', GetParameter)
        lst.append(Loc)
        node_lst.append(POICF)

    cmds.delete(PreFixCrv)
    return lst


def d_Create_Locs_NameFmt_On_Crv(TargetCrv, CreatCount, Name, CrvKrBool=False):
    CV = cmds.ls(TargetCrv + '.cv[*]', fl=1)
    Spans = len(CV)
    Degree = cmds.getAttr(TargetCrv + ".degree")
    FixName = Name.format('')  # 여기서 Name 변수를 포맷팅

    if CrvKrBool == False:
        TargetCrv = cmds.rebuildCurve(TargetCrv,ch =1, kr=0, kcp=1, rt =1,d=Degree)[0]

    DuCrv = cmds.duplicate(TargetCrv, n=FixName + '_Fix')[0]
    DuCrvShp = cmds.listRelatives(DuCrv ,s =1)[0]
    GetDegree = cmds.getAttr(DuCrvShp + ".degree")
    if GetDegree > 2:
        DuCrv_CV = cmds.ls(DuCrv + '.cv[*]', fl=1)
        cmds.delete(DuCrv_CV[-2])
        cmds.delete(DuCrv_CV[1])

        DuCrv = cmds.rebuildCurve(TargetCrv, kr=0, kcp=1, d=Degree)[0]
    PreFixCrv = cmds.rebuildCurve(DuCrv, ch=1, rpo=1, rt=0, end=0, kcp=1, kt=0, d=1, s=Spans)[0]


    Div = 1.0 / (CreatCount - 1)
    locators = []
    node_list = []

    if cmds.objectType(TargetCrv) == 'transform':
        TargetCrv = cmds.listRelatives(TargetCrv, s=1)[0]
        FixCrv = cmds.listRelatives(PreFixCrv, s=1)[0]

    for x in range(CreatCount):
        FixName = Name.format(x + 1)  # 여기서 Name 변수를 포맷팅
        Value = Div * x

        Loc = cmds.spaceLocator(n=FixName + '_POICF_loc')[0]
        FixPOICFLoc = cmds.spaceLocator(n=FixName + '_FIx_POICF_loc')[0]
        FixPOICF = cmds.createNode('pointOnCurveInfo', n=FixName + '_Fix_POCIF')
        POICF = cmds.createNode('pointOnCurveInfo', n=FixName + '_POCIF')
        NPOC = cmds.createNode('nearestPointOnCurve', n=FixName + '_Fix_NPOC')
        FixDM = cmds.createNode('decomposeMatrix', n=FixName + '_Fix_DM')

        cmds.setAttr(FixPOICF + '.parameter', Value)
        cmds.setAttr(FixPOICF + '.turnOnPercentage', 1)
        cmds.setAttr(POICF + '.turnOnPercentage', 1)

        cmds.connectAttr(FixCrv + '.worldSpace[0]', FixPOICF + '.inputCurve', f=1)
        cmds.connectAttr(TargetCrv + '.worldSpace[0]', POICF + '.inputCurve', f=1)
        cmds.connectAttr(TargetCrv + '.worldSpace[0]', NPOC + '.inputCurve', f=1)

        cmds.connectAttr(FixPOICF + '.position', FixPOICFLoc + '.translate', f=1)
        cmds.connectAttr(FixPOICFLoc + '.worldMatrix[0]', FixDM + '.inputMatrix', f=1)
        cmds.connectAttr(FixDM + '.outputTranslate', NPOC + '.inPosition', f=1)
        cmds.connectAttr(NPOC + '.result.parameter', POICF + '.parameter', f=1)

        GetParameter = cmds.getAttr(NPOC + '.parameter')

        cmds.delete(FixPOICF)
        cmds.delete(NPOC)
        cmds.delete(FixPOICFLoc)

        cmds.connectAttr(POICF + '.result.position ', Loc + '.translate', f=1)
        cmds.setAttr(POICF + '.parameter', GetParameter)
        locators.append(Loc)
        node_list.append(POICF)

    cmds.delete(PreFixCrv)
    return locators

def d_Create_Locs_Each_CV(TargetCrv, Name, CrvKrBool = True):
    CV = cmds.ls(TargetCrv + '.cv[*]', fl=1)
    Spans = len(CV)
    Degree = cmds.getAttr(TargetCrv + ".degree")
    if CrvKrBool == 1:
        TargetCrv = cmds.rebuildCurve(TargetCrv,ch =1, kr=0, kcp=1, rt =1,d=Degree)[0]
    DuCrv = cmds.duplicate(TargetCrv, n=Name + '_Fix')[0]
    FixCrv = cmds.rebuildCurve(DuCrv, ch=1, rpo=1, rt=0, end=0, kcp=1, kt=0, d=1, s=Spans)[0]

    Div = 1.0 / (Spans - 1)

    lst = []
    node_lst = []
    for x in range(Spans):
        Value = Div * x
        Loc = cmds.spaceLocator(n=Name + '_{}_POICF_loc'.format(str(x + 1)))[0]
        FixPOICFLoc = cmds.spaceLocator(n=Name + '_{}_FIx_POICF_loc'.format(str(x + 1)))[0]

        FixPOICF = cmds.createNode('pointOnCurveInfo', n=Name + '_{}_Fix_POCIF'.format(str(x + 1)))
        POICF = cmds.createNode('pointOnCurveInfo', n=Name + '_{}_POCIF'.format(str(x + 1)))
        NPOC = cmds.createNode('nearestPointOnCurve', n=Name + '_{}_Fix_NPOC'.format(str(x + 1)))
        FixDM = cmds.createNode('decomposeMatrix', n=Name + '_{}_Fix_DM'.format(str(x + 1)))

        cmds.setAttr(FixPOICF + '.parameter', Value)
        cmds.setAttr(FixPOICF + '.turnOnPercentage', 1)
        cmds.setAttr(POICF + '.turnOnPercentage', 1)

        cmds.connectAttr(FixCrv + '.worldSpace[0]', FixPOICF + '.inputCurve', f=1)
        cmds.connectAttr(TargetCrv + '.worldSpace[0]', POICF + '.inputCurve', f=1)
        cmds.connectAttr(TargetCrv + '.worldSpace[0]', NPOC + '.inputCurve', f=1)

        cmds.connectAttr(FixPOICF + '.position', FixPOICFLoc + '.translate', f=1)
        cmds.connectAttr(FixPOICFLoc + '.worldMatrix[0]', FixDM + '.inputMatrix', f=1)
        cmds.connectAttr(FixDM + '.outputTranslate', NPOC + '.inPosition', f=1)
        cmds.connectAttr(NPOC + '.result.parameter', POICF + '.parameter', f=1)

        GetParameter = cmds.getAttr(NPOC + '.parameter')

        cmds.delete(FixPOICF)
        cmds.delete(NPOC)
        # cmds.delete(FixDM)
        cmds.delete(FixPOICFLoc)

        cmds.connectAttr(POICF + '.result.position ', Loc + '.translate', f=1)
        cmds.setAttr(POICF + '.parameter', GetParameter)
        lst.append(Loc)
        node_lst.append(POICF)

    cmds.delete(FixCrv)
    return lst

def d_Create_Locs_NameFmt_Each_CV(TargetCrv, Name):
    CV = cmds.ls(TargetCrv + '.cv[*]', fl=1)
    Spans = len(CV)
    FixName = Name.format('')
    DuCrv = cmds.duplicate(TargetCrv, n=Name + '_Fix')[0]
    FixCrv = cmds.rebuildCurve(DuCrv, ch=1, rpo=1, rt=0, end=0, kcp=1, kt=0, d=1, s=Spans)[0]

    Div = 1.0 / (Spans - 1)

    lst = []
    node_lst = []
    for x in range(Spans):
        Value = Div * x
        FixName = Name.format(x+1)
        Loc = cmds.spaceLocator(n=FixName + '_POICF_loc')[0]
        FixPOICFLoc = cmds.spaceLocator(n=FixName + '_Fix_POICF_loc')[0]

        FixPOICF = cmds.createNode('pointOnCurveInfo', n=FixName + '_Fix_POCIF')
        POICF = cmds.createNode('pointOnCurveInfo', n=FixName + '_POCIF')
        NPOC = cmds.createNode('nearestPointOnCurve', n=FixName + '_Fix_NPOC')
        FixDM = cmds.createNode('decomposeMatrix', n=FixName + '_Fix_DM')

        cmds.setAttr(FixPOICF + '.parameter', Value)
        cmds.setAttr(FixPOICF + '.turnOnPercentage', 1)
        cmds.setAttr(POICF + '.turnOnPercentage', 1)

        cmds.connectAttr(FixCrv + '.worldSpace[0]', FixPOICF + '.inputCurve', f=1)
        cmds.connectAttr(TargetCrv + '.worldSpace[0]', POICF + '.inputCurve', f=1)
        cmds.connectAttr(TargetCrv + '.worldSpace[0]', NPOC + '.inputCurve', f=1)

        cmds.connectAttr(FixPOICF + '.position', FixPOICFLoc + '.translate', f=1)
        cmds.connectAttr(FixPOICFLoc + '.worldMatrix[0]', FixDM + '.inputMatrix', f=1)
        cmds.connectAttr(FixDM + '.outputTranslate', NPOC + '.inPosition', f=1)
        cmds.connectAttr(NPOC + '.result.parameter', POICF + '.parameter', f=1)

        GetParameter = cmds.getAttr(NPOC + '.parameter')

        cmds.delete(FixPOICF)
        cmds.delete(NPOC)
        # cmds.delete(FixDM)
        cmds.delete(FixPOICFLoc)

        cmds.connectAttr(POICF + '.result.position ', Loc + '.translate', f=1)
        cmds.setAttr(POICF + '.parameter', GetParameter)
        lst.append(Loc)
        node_lst.append(POICF)

    cmds.delete(FixCrv)
    return lst


def d_Create_JntChain(TargetLst, Name, AimTuple, UpTuple, WorldUpTuple, VectorObj, ParentBool=True):
    PreLst = []
    JntLst = []
    for x in range(len(TargetLst)):
        cmds.select(cl=1)
        Jnt = cmds.joint(n='{}_{}_Jnt'.format(Name, str(x + 1)))
        PreGrp = cmds.group(Jnt, n='{}_PreGrp'.format(Jnt))

        CP = cmds.parentConstraint(TargetLst[x], PreGrp)
        cmds.delete(CP)

        PreLst.append(PreGrp)
        JntLst.append(Jnt)
        cmds.select(cl=1)
    for x in range(len(TargetLst)):
        try:
            if x == len(TargetLst) - 1:
                Or = cmds.orientConstraint(PreLst[x - 1], PreLst[x], mo=0)
                cmds.delete(Or)
            else:
                Aim = cmds.aimConstraint(JntLst[x + 1], PreLst[x], aim=AimTuple, u=UpTuple, wu=WorldUpTuple,
                                         wuo=VectorObj, wut="objectrotation")
                cmds.delete(Aim)
        except:
            pass

        cmds.parent(JntLst[x], w=1)
    cmds.delete(PreLst)

    if ParentBool == True:
        for x in range(len(JntLst)):
            try:
                cmds.parent(JntLst[x + 1], JntLst[x])
            except:
                pass
    return JntLst

def d_Create_NameFmt_JntChain(TargetLst, Name, AimTuple, UpTuple, WorldUpTuple, VectorObj, ParentBool=True):
    PreLst = []
    JntLst = []
    for x in range(len(TargetLst)):
        cmds.select(cl=1)
        FixName = Name.format(x+1)
        Jnt = cmds.joint(n=FixName)
        PreGrp = cmds.group(Jnt, n='{}_PreGrp'.format(Jnt))

        CP = cmds.parentConstraint(TargetLst[x], PreGrp)
        cmds.delete(CP)

        PreLst.append(PreGrp)
        JntLst.append(Jnt)
        cmds.select(cl=1)
    for x in range(len(TargetLst)):
        try:
            if x == len(TargetLst) - 1:
                Or = cmds.orientConstraint(PreLst[x - 1], PreLst[x], mo=0)
                cmds.delete(Or)
            else:
                Aim = cmds.aimConstraint(JntLst[x + 1], PreLst[x], aim=AimTuple, u=UpTuple, wu=WorldUpTuple,
                                         wuo=VectorObj, wut="objectrotation")
                cmds.delete(Aim)
        except:
            pass

        cmds.parent(JntLst[x], w=1)
    cmds.delete(PreLst)

    if ParentBool == True:
        for x in range(len(JntLst)):
            try:
                cmds.parent(JntLst[x + 1], JntLst[x])
            except:
                pass
    return JntLst


# ---------------------------------------------------------------------------------------------------------------------Cluster

def d_Query_ObjVtx(Obj):
    Pattern = r'\[(\d+)\]'
    VtxLst = cmds.ls(sl=1, fl=1)
    Com = re.compile(Pattern)
    Match = Com.search(VtxLst[0])

    Lst = []
    for x in VtxLst:
        Match = Com.search(x)
        if Match:
            Target = Match.group(1)
            Lst.append(Target)

    return Lst


def d_Cluter_PatternVtx(Object, Vtx_lst):
    Vtx_lst = [Object + '.vtx[{}]'.format(y) for y in Vtx_lst]
    Cluter = cmds.cluster(Vtx_lst)
    cmds.setAttr(Cluter[-1] + '.displayHandle', 1)

    return Cluter


# -------------------------------------------------------------------------------------------------------Skin
def d_Set_Component_Skin(Target , SkinTarget , RenderReSet = True):
    Target = cmds.listRelatives(Target ,s =1)
    SkinTarget = cmds.listRelatives(SkinTarget ,s =1)
    Query = None
    
    if len(Target) >= 1 and len(SkinTarget)  >= 1:
        Target =Target[0]
        SkinTarget =SkinTarget[0]
        Diclst = []
        Skin_Dic = {}   
        Tgt_Dic = {} 
        if RenderReSet:
            lstAttr = ['castsShadows', 'receiveShadows', 'holdOut', 'motionBlur', 'primaryVisibility', 'smoothShading', 'visibleInReflections', 'visibleInRefractions', 'doubleSided']
            try:
                for x in range(len(lstAttr)):
                    SkinTgtGetValue = cmds.getAttr('{}.{}'.format(SkinTarget, lstAttr[x]))
                    TgtGetValue = cmds.getAttr('{}.{}'.format(Target, lstAttr[x]))
                    SkinAttr = "{}.{}" .format(SkinTarget , lstAttr[x])
                    TgtAttr = "{}.{}" .format(Target , lstAttr[x])
                    
                    Skin_Dic[SkinAttr] = SkinTgtGetValue
                    Tgt_Dic[TgtAttr] = TgtGetValue
                Diclst = [Skin_Dic , Tgt_Dic] 
            except:
                pass
            
        cmds.select(cl =1)
        Jnt = cmds.joint(n = "Pre_{}_CONT_Jnt" .format(Target))
        Skin = cmds.skinCluster(Jnt , Target)
        cmds.select(Target)
        cmds.select( SkinTarget , add = True )
        cmds.skinCluster(Skin[0] ,e =1, dr =4 , ps =0 ,tsb =1 , ug =1,  wt =0 ,ns = 10 ,ai = SkinTarget ,  dt  =1 )
        Query = cmds.listConnections("{}.basePoints[1]" .format(Skin[0]) , d =1 )[0]

        cmds.setAttr("{}.weightList[0].weights[0]" .format(Skin[0]) , 0)
        cmds.setAttr("{}.weightList[0].weights[1]" .format(Skin[0]) , 1)
        cmds.skinCluster(Skin[0] , e =1 , ri = Jnt)
        cmds.delete(Jnt )
        cmds.setAttr( "{}.useComponents".format(Skin[0]) , 1)

        if len(Diclst) >=1:
            for Dic in Diclst:
                #pprint.pprint(Dic)
                try:
                    for Key , Value in Dic.items():
                        cmds.setAttr("{}" .format( Key) , Value)    
                except:
                    pass
    return Query


def d_Skin(Jnt, Object):
    cmds.select(Jnt, r=1)
    cmds.select(Object, add=1)
    cmds.skinCluster(tsb=1)


def d_Skin_ObjLst(JntLst, ObjLst):
    for x in range(len(JntLst)):
        cmds.select(JntLst[x], r=1)
        cmds.select(ObjLst[x], add=1)
        cmds.skinCluster(tsb=1)


def d_Copy_Skin(Staric, Target, skinType='closestPoint'):
    if skinType == '':
        skinType = 'closestPoint'

    BindJnt = cmds.skinCluster(Staric, q=1, wi=1)
    cmds.select(BindJnt)
    cmds.skinCluster(BindJnt, Target, tsb=1)
    cmds.copySkinWeights(Staric, Target, nm=1, sa=skinType, ia=('closestJoint', 'oneToOne'))


def d_Info_Skin_Percent(obj):
    Dic = {}
    Shp = cmds.listRelatives(obj, s=1)[0]
    skinCluter = cmds.listConnections(Shp, type='skinCluster')[0]
    vtxs = cmds.ls(obj + '.vtx[*]', fl=1)

    for x in vtxs:
        weight = cmds.skinPercent(skinCluter, x, q=1, value=1, ignoreBelow=0.001)
        Jnt = cmds.skinPercent(skinCluter, x, q=1, transform=None)
        for y in range(len(Jnt) - 1):
            if len(weight) == 1:
                weight.append(0)
        list = []

        for y in range(len(Jnt)):
            Tu = []
            Tu.append(Jnt[y])
            Tu.append(weight[y])
            Tu = tuple(Tu)
            list.append(Tu)

        Dic[x] = list
    return Dic


def d_Info_SkinWeight(obj):
    Dic = {}
    Shp = cmds.listRelatives(obj, s=1)[0]
    skinCluter = cmds.listConnections(Shp, type='skinCluster')[0]
    vtxs = cmds.ls(obj + '.vtx[*]', fl=1)

    for x in vtxs:
        weight = cmds.skinPercent(skinCluter, x, q=1, value=1, ignoreBelow=0.001)
        Jnt = cmds.skinPercent(skinCluter, x, q=1, transform=None)
        for y in range(len(Jnt) - 1):
            if len(weight) == 1:
                weight.append(0)
        Dic[x] = weight
    return Dic


# ------------------------------------------------------------------------------------------Search OBJ

def d_Set_AnyLst(TargetLst, in_Lst):
    Lst = [x for x in TargetLst if any(y in x for y in in_Lst)]
    return Lst

def d_Set_AnyNot_Lst(TargetLst, in_Lst):
    Lst = [x for x in TargetLst if not any(y in x for y in in_Lst)]
    return Lst


def d_Set_AnyLst_CostomDef(TargetLst, in_Lst, InDef):
    Lst = [x for x in TargetLst if any(y in x for y in in_Lst) and InDef(x)]
    return Lst


def d_Find_Match_Attr_Index(TargetLst , AttrName , String):

    Find = [x for x in TargetLst if cmds.getAttr(x + '.{}' .format(AttrName)) == String]
    if Find is None:
        return None
    else:
        Find = Find[0]
        Index = TargetLst.index(Find)

        return Index
def d_Find_Match_Lebal_Index(TargetLst , Label):

    Find = [x for x in TargetLst if cmds.getAttr(x + '.otherType' ) ==Label]
    if Find is None:
        return None
    else:
        Find = Find[0]
        Index = TargetLst.index(Find)

        return Index


def d_is_Attr_Match_String(Obj, AttrName, String):
    if cmds.objExists(Obj) == True:
        Attr = cmds.attributeQuery(AttrName, node=Obj, exists=True)
        if Attr == True:
            GetAttr = cmds.getAttr('{}.{}'.format(Obj, AttrName))
            if GetAttr == String:
                return True
            else:
                return False


def d_Find_Match_Attr_Obj(Obj, AttrName, String):
    if cmds.objExists(Obj) == True:
        Attr = cmds.attributeQuery(AttrName, node=Obj, exists=True)
        if Attr == True:
            GetAttr = cmds.getAttr('{}.{}'.format(Obj, AttrName))
            if GetAttr == String:
                return Obj
    return None

def d_Find_Match_Attr_ObjLst(TargetLst, AttrName, AttrStringLst, SortLst=None, reverse_Bool=False):
    Prelst = [x for x in TargetLst if cmds.attributeQuery(AttrName, node=x, exists=True) == True]
    lst = [x for x in Prelst if any(cmds.getAttr('{}.{}'.format(x, AttrName)) == y for y in AttrStringLst)]

    if SortLst is None:
        sorted_lst = sorted(lst, key=lambda x: AttrStringLst.index(cmds.getAttr('{}.{}'.format(x, AttrName))))
    else:
        sorted_lst = sorted(lst, key=lambda x: next((i for i, y in enumerate(SortLst) if y in x), len(SortLst)),
                            reverse=reverse_Bool)

    if sorted_lst is None or len(sorted_lst) == 0:
        return None
    return sorted_lst


def d_isFind_Match_Attr_Obj(Obj, AttrName, String):
    if d_is_Attr_Match_String(Obj, AttrName, String) == True:
        FindObj = d_Find_Match_Attr_Obj(Obj, AttrName, String)
        return FindObj


def d_Query_ObjAttr(Obj, AttrName):
    if cmds.objExists(Obj) == True:
        Attr = cmds.attributeQuery(AttrName, node=Obj, exists=True)
        if Attr == True:
            GetAttr = cmds.getAttr('{}.{}'.format(Obj, AttrName))
            return GetAttr


def d_is_Lebal_Match_Jnt(Jnt, LebalName):
    if cmds.objExists(Jnt) == True:
        Attr = cmds.attributeQuery("otherType", node=Jnt, exists=True)
        if Attr == True:
            GetAttr = cmds.getAttr('{}.{}'.format(Jnt, "otherType"))
            if GetAttr == LebalName:
                return True
            else:
                return False


def d_Find_Lebal_Match_Jnt(Jnt, LebalName):
    if cmds.objExists(Jnt) == True:
        Attr = cmds.attributeQuery("otherType", node=Jnt, exists=True)
        if Attr == True:
            GetAttr = cmds.getAttr('{}.{}'.format(Jnt, "otherType"))
            if GetAttr == LebalName:
                return Jnt


def d_isFind_Lebal_Match_Jnt(Jnt, LebalName):
    if d_is_Lebal_Match_Jnt(Jnt, LebalName) == True:
        FindJnt = d_Find_Lebal_Match_Jnt(Jnt, LebalName)
        return FindJnt


def d_Query_JntLebal(Jnt):
    if cmds.objExists(Jnt) == True:
        Attr = cmds.attributeQuery("otherType", node=Jnt, exists=True)
        if Attr == True:
            GetAttr = cmds.getAttr('{}.{}'.format(Jnt, "otherType"))
            return GetAttr


def d_Find_Match_Lebal_Jnts_In_lst(TargetLst, LebalLst, SortLst=None, reverse_Bool=False):
    lst = [x for x in TargetLst if cmds.objectType(x) == 'joint' and any(cmds.getAttr('{}.otherType'.format(x)) == y for y in LebalLst)]
    if SortLst is None:
        sorted_lst = sorted(lst, key=lambda x: LebalLst.index(cmds.getAttr('{}.otherType'.format(x))))
    else:
        sorted_lst = sorted(lst, key=lambda x: next((i for i, y in enumerate(SortLst) if y in x), len(SortLst)),
                            reverse=reverse_Bool)

    if sorted_lst is None or len(sorted_lst) == 0:
        return None
    return sorted_lst


def d_Find_Jnt_In_LabelLst(TargetLst, LebalLst, Custom_Sort_Bool=True):
    lst = [x for x in TargetLst if
           cmds.objectType(x) == 'joint' and any(y in cmds.getAttr('{}.otherType'.format(x)) for y in LebalLst)]

    def Custom_Sort(item):
        prefix, numeric = "", ""
        for x in item:
            if x.isdigit():
                numeric += x
            else:
                prefix += x
        return (prefix, int(numeric) if numeric else 0)

    if Custom_Sort_Bool == True:
        return_lst = sorted(lst, key=Custom_Sort)
    else:
        return_lst = lst

    if return_lst is None or len(lst) == 0:
        return None

    return return_lst

def d_Filter_Objs_in_Range_By_AttrString(TargetLst , AttrName ,Start_Attr_String , End_Attr_String ):
    Start = [ x for x in TargetLst if cmds.getAttr('{}.{}'.format(x , AttrName)) == Start_Attr_String]
    End = [ x for x in TargetLst if cmds.getAttr('{}.{}'.format(x , AttrName)) == End_Attr_String]
    Start_Index = TargetLst.index(Start[0])
    End_Index = TargetLst.index(End[0])

    cmds.select(Start[0] ,hi =1)
    Hilst = cmds.ls(sl =1)
    Hilst_Start = [x for x in Hilst if ('{}.{}'.format(x , AttrName)) == Start_Attr_String]
    Hilst_End = [x for x in Hilst if ('{}.{}'.format(x , AttrName)) == End_Attr_String]
    cmds.select(cl =1)

    Hilst_Start_Index = Hilst.index( Hilst_Start[0])
    Hilst_End_Index = Hilst.index( Hilst_End[0])

    lst = Hilst[Hilst_Start_Index:Hilst_End_Index+1]
    return lst

def d_Find_Match_Lebal_Jnt_In_lst(TargetLst , Label):
    Item = None
    try:
        Item = [x for x in TargetLst if cmds.getAttr('{}.otherType'.format(x)) == Label][0]
    except:
        pass
    return Item


def d_Filter_Jnts_In_Range_By_Lebal(TargetLst, StartLebal, EndLabel, StartElmentReTargt_Bool=False):
    Start = [x for x in TargetLst if cmds.getAttr('{}.otherType'.format(x)) == StartLebal]
    End = [x for x in TargetLst if cmds.getAttr('{}.otherType'.format(x)) == EndLabel]
    lst = TargetLst
    Start_Index = TargetLst.index(Start[0])
    End_Index = TargetLst.index(End[0])
    if StartElmentReTargt_Bool == True:
        cmds.select(Start[0], hi=1)
        lst = cmds.ls(sl=1, type='joint')
        Hilst_Start = [x for x in lst if cmds.getAttr('{}.otherType'.format(x)) == StartLebal]
        Hilst_End = [x for x in lst if cmds.getAttr('{}.otherType'.format(x)) == EndLabel]
        cmds.select(cl=1)

        Start_Index = lst.index(Hilst_Start[0])
        End_Index = lst.index(Hilst_End[0])

    lst = lst[Start_Index:End_Index + 1]
    return lst

def d_Filter_Objs_by_AttrString(TargetList, attribute_long_name, attribute_string, forward_slice=True):
    index_num = None

    for i, obj in enumerate(TargetList):
        if cmds.attributeQuery(attribute_long_name, node=obj, exists=True) and cmds.getAttr('{}.{}'.format(obj, attribute_string)) == True:
            index_num = i
            break

    if index_num is None:
        return None

    if forward_slice:
        filtered_list = TargetList[index_num:]
    else:
        filtered_list = TargetList[:index_num]

    return filtered_list

def d_Sort_Lst(TargetLst, SortLst, reverse_Bool=False):
    sorted_lst = sorted(TargetLst, key=lambda x: next((i for i, y in enumerate(SortLst) if y in x), len(SortLst)),
                        reverse=reverse_Bool)
    if sorted_lst is None or len(sorted_lst) == 0:
        return None

    return sorted_lst


def d_Set_TypeLst(TargetLst , Type = "transform"):
    lst = [x for x in TargetLst if cmds.objectType(x) == Type]
    return lst

def d_Set_Hierarchy_Lst(Target):
    cmds.select(Target , hi =1)
    lst = cmds.ls(sl =1)
    cmds.select(cl=1)
    return lst

def d_Set_Hierarchy_TypeLst(Target , Type = "transform"):
    cmds.select(Target, hi=1)
    lst = cmds.ls(sl=1 ,type = Type)
    lst = [x for x in lst if cmds.objectType(x) == Type]
    cmds.select(cl =1)
    return lst

def d_Get_Parent_Lst(Target):
    ParentPath = cmds.listRelatives(Target, parent=True, fullPath=True) or []
    Parent_lst = ParentPath[0].split("|")
    Parent_lst = [x for x in Parent_lst if not x == ""]
    Parent_lst = [x for x in Parent_lst if x]

    if Parent_lst is None or len(Parent_lst) == 0:
        return None
    return Parent_lst

# ------------------------------------------------------------------------------------------RenderSet

def d_Query_RenderSet(Obj):
    lstAttr = ['castsShadows', 'receiveShadows', 'holdOut', 'motionBlur', 'primaryVisibility', 'smoothShading',
               'visibleInReflections', 'visibleInRefractions', 'doubleSided']

    Dic = {}
    for x in range(len(lstAttr)):
        GetValue = cmds.getAttr('{}.{}'.format(Obj, lstAttr[x]))
        Dic[lstAttr[x]] = GetValue
    return Dic


def d_Set_RenderSet_From_Dic(Obj, AttrDic):
    for Attr, Value in AttrDic.items():
        cmds.setAttr(Obj + '.{}'.format(Attr), Value)


def d_Set_DefaultRenderSet(Obj):
    cmds.setAttr(Obj + '.castsShadows', 1)
    cmds.setAttr(Obj + '.receiveShadows', 1)
    cmds.setAttr(Obj + '.motionBlur', 1)
    cmds.setAttr(Obj + '.primaryVisibility', 1)
    cmds.setAttr(Obj + '.smoothShading', 1)
    cmds.setAttr(Obj + '.visibleInReflections', 1)
    cmds.setAttr(Obj + '.visibleInRefractions', 1)
    cmds.setAttr(Obj + '.doubleSided', 1)

def d_Get_Shader(Obj , Type = "lambert"):
    WorkItme = Obj
    ShadingEngine = None
    Shader = None
    if cmds.objectType(WorkItme) == "transform":
        if cmds.listRelatives(WorkItme , c =1):
            WorkItme = cmds.listRelatives(WorkItme , c =1)[0]

    if cmds.objectType(WorkItme) in ["mesh", "nurbsCurve"]:
        ShadingEngine = cmds.listConnections(WorkItme , type="shadingEngine")
        if ShadingEngine and len(ShadingEngine)>0:
            ShadingEngine = ShadingEngine[0]

    if ShadingEngine:
        Shader = cmds.listConnections(ShadingEngine , s= 1 , d =0  ,  t = Type)
    
    return Shader


#-------------------------------------------------------------------------------------------------------------Cal

def d_Get_MeshvtxSquence_PosList(FirstVtxs , ConversionTuple = True):
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



def d_Get_PoleVector_Pos(Root , Middle , End , Scalar = 1):
    
    RootPos = cmds.xform(Root , q= 1, ws =1 , t =1)
    MiddlePos = cmds.xform(Middle , q= 1, ws =1 , t =1)
    EndPos =  cmds.xform(End , q= 1, ws =1 , t =1)
    
    RootVector = om.MVector(RootPos[0] , RootPos[1] , RootPos[2])
    MiddleVector = om.MVector(MiddlePos[0] , MiddlePos[1] , MiddlePos[2])
    EndVector = om.MVector(EndPos[0] , EndPos[1] , EndPos[2])
    
    
    RootEnd_Vector = (EndVector - RootVector)
    RootMiddle_Vector = (MiddleVector- RootVector)
    
    DotP = RootEnd_Vector * RootMiddle_Vector
    
    ProJect_Length= float(DotP)/float(RootEnd_Vector.length())
    
    Normalize_RootEnd = RootEnd_Vector.normal()
    
    ProJ_Vector = Normalize_RootEnd * ProJect_Length
    
    Arrow_Vector = (RootMiddle_Vector  - ProJ_Vector) *  Scalar
    
    Pole_Vector = Arrow_Vector + MiddleVector
    

    Pole_Vecotor_Pos = [Pole_Vector.x , Pole_Vector.y , Pole_Vector.z]
    return Pole_Vecotor_Pos


def d_Cal_SineCycle_Parameter_lst(TargetLst):
    if type(TargetLst) ==list and len(TargetLst)>2:
        if len(TargetLst) % 2 == 0:
            DivCounter = int(len(TargetLst)/2)
        else:
            DivCounter = int(len(TargetLst)/2)+1

        HalfLst = TargetLst[:DivCounter]
        Div = 1.0/(len(HalfLst)-1)
        Range = len(HalfLst)
        
        FirstParameterLst =[]
        
        for x in range(Range):
            Value = Div* x
            FirstParameterLst.append(Value)
            print (Value)
            
        SecondParameterLst = list(reversed(FirstParameterLst))
        if len(TargetLst) % 2 == 1:
            SecondParameterLst = SecondParameterLst[1:]

        lst = FirstParameterLst + SecondParameterLst
        return lst

def d_Number(StartNumber  , Padding = 0 ):
    NuberSting = None
    NuberSting = str(StartNumber).zfill(Padding)

    return NuberSting
    
        
def d_Cal_ParameterValue(Total, Parameter):
    Value = Total * Parameter
    return Value

def d_Cal_Parmeter(Total, Value):
    Parameter = Value / Total
    return Parameter

def d_Cal_Distance(StartObj, EndObj ):
    S_Pos = cmds.xform(StartObj , q =1, t =1 ,ws =1)
    E_Pos = cmds.xform(EndObj, q=1, t=1, ws=1)
    DT = ((S_Pos[0] - E_Pos[0])**2 + (S_Pos[1] - E_Pos[1])**2 + (S_Pos[2] - E_Pos[2])**2)**0.5
    return DT

def d_Cal_TriAngle(StartTgt , Middle_Tgt , EndTgt):
    POS_Start = cmds.xform(StartTgt , q =1, ws =1 , t =1)
    POS_Middle = cmds.xform( Middle_Tgt, q =1, ws =1 , t =1)
    POS_End = cmds.xform(EndTgt , q =1, ws =1 , t =1)

    DT_StartMiddle = ((POS_Start[0] - POS_Middle[0])**2 + (POS_Start[1] - POS_Middle[1])**2 + (POS_Start[2] - POS_Middle[2])**2)**0.5
    DT_MiddleEnd = ((POS_Middle[0] - POS_End[0]) ** 2 + (POS_Middle[1] - POS_End[1]) ** 2 + (POS_Middle[2] - POS_End[2]) ** 2) ** 0.5
    DT_StartEnd = ((POS_Start[0] - POS_End[0]) ** 2 + (POS_Start[1] - POS_End[1]) ** 2 + (POS_Start[2] - POS_End[2]) ** 2) ** 0.5

    CosStart = (DT_StartEnd**2 + DT_StartMiddle**2 - DT_MiddleEnd**2)/(2 * DT_StartEnd * DT_StartMiddle)
    CosMiddle = (DT_MiddleEnd**2 + DT_StartMiddle**2 - DT_StartEnd**2)/(2 * DT_MiddleEnd * DT_StartMiddle)

    AngleCosStart = math.acos(CosStart)
    AngleCosMiddle = math.acos(CosMiddle)

    AngleStart_Deg = math.degrees(AngleCosStart)
    AngleMiddle_Deg = math.degrees(AngleCosMiddle)
    AngleEnd_Deg = 180 - (AngleStart_Deg +AngleMiddle_Deg)

    #print (AngleStart_Deg)
    #print (AngleMiddle_Deg)
    #print (AngleEnd_Deg)

    return AngleStart_Deg , AngleMiddle_Deg , AngleEnd_Deg







# -----------------------------------------------------------------------------------------------------------Path

def d_Find_Elm_Path(FullPath , Element):

    normalized_path = os.path.normpath(FullPath)
    PathDir, FileName = os.path.split(normalized_path)
    PathDir_splst = PathDir.split(os.sep)

    RePath = ''

    for x in PathDir_splst:
        RePath = os.path.join( RePath , x)
        if x == Element:
            break
    FixPath = os.path.normpath( RePath)
    if FixPath.startswith("C:"):
        FixPath = FixPath.replace("C:", "C:\\", 1)
    return  FixPath

def d_importFile(Path):
    cmds.file(Path, i=1, namespace=":", mergeNamespacesOnClash=True, ignoreVersion=True, options="v=0;")


def d_PathBasic(User, Version, Folder):
    # This Def is Old
    Path = "C:/Users/{}/Documents/maya/{}/scripts/{}".format(User, Version, Folder)
    return Path


def d_PathDir():
    import inspect, os
    currentPath = inspect.getfile(inspect.currentframe())
    DirPath = os.path.dirname(currentPath)
    return DirPath


def d_PathSysModule(Path):
    Module_Path = Path
    Dir_Path = os.path.dirname(Path)
    sys.path.append(Module_Path)
    sys.path.append(Dir_Path)


#-----------------------------------------------------------------------------------------------------------------------

def d_Return_lst_QtListViewItem(QList):
    lst = []
    lst = [QList.item(i).text() for i in range(QList.count())]
    return lst


def d_Add_lst_QtListViewItem(QList , ItemLst , Clear = True , Align = "" ):
    Worklst = []
    QAlign = None
    item =None
    if Align == "Left" or Align ==  "":
        QAlign = QtCore.Qt.AlignLeft
    if Align == "Center":
        QAlign = QtCore.Qt.AlignHCenter
    if Align == "Right":
        QAlign = QtCore.Qt.AlignRight
    
    if type(ItemLst) == list and len(ItemLst) > 0:
        Worklst =  [x for i ,x in enumerate(ItemLst ) if x not in ItemLst[:i]]
    if Clear:
        QList.clear()
    
    
    for x in Worklst:
        item = QListWidgetItem(str(x))
        item.setTextAlignment(QAlign)

        QList.addItem(item)