# -*- coding: utf-8 -*-
import maya.cmds as cmds

def match_constraintObject( target , parentTgt, Bool_Point=True, Bool_Orient=True, Bool_Scale=False , deleteConstraint = True):
    ''' 
    Constraint maintainoffset = False 를 이용한 오브젝트 매치 \n
    target :: Constrain의 Parent 오브젝트 \n
    parentTgt :: Constrain를 받고자 하는 오브젝트 \n
    
    각 Bool_(Point , Orient , Scale) 은 Constrain의 타입사용을 의미함
    '''
    if Bool_Point == True:
        Po = cmds.pointConstraint( parentTgt , target, mo=0)
        if deleteConstraint:
            cmds.delete(Po)
    if Bool_Orient == True:
        Or = cmds.orientConstraint( parentTgt, target, mo=0)
        if deleteConstraint:
            cmds.delete(Or)
    if Bool_Scale == True:
        Scale = cmds.scaleConstraint( parentTgt , target, mo=0)
        if deleteConstraint:
            cmds.delete(Scale)


def match_parentConstraint(target ,parentTgt, deleteConstraint = True):
    constraint = cmds.parentConstraint(parentTgt, target , mo =0)
    if deleteConstraint:
        cmds.delete(constraint)
    
def match_xform(target , parentTgt , t = True , ro = True , s = True , extra = None):
    attrs = {}
    if extra is None:
        extra = {"ws": True}
    
    if t:
        pos = cmds.xform(parentTgt , q =1 , t =1 , **extra)
        if all(x == 0 for x in pos):
            pos = cmds.xform(parentTgt , q =1 , pivots=1 , **extra)[:3]
        attrs["t"] = pos
    if ro:
        roData = cmds.xform(parentTgt , q =1 , ro =1 ,**extra)
        attrs["ro"] = roData
    if s:
        scaleData = cmds.xform(parentTgt , q =1 , s =1 , **extra)
        attrs["s"] = scaleData

    
    cmds.xform(target , **extra , **attrs )




    