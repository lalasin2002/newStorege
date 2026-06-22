# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om
import re

curve = "StructureB_Crv"
curveShape = None

shpCurve = cmds.listRelatives(curve, s =1 )
if shpCurve:
    curveShape = shpCurve[0]


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
    return data






