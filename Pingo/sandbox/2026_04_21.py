# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import os, time, shutil, re,json ,pprint,sys
import maya.OpenMaya as om
#gluingParameter_MDL

cvs = cmds.ls("glueIk_function_Crv.cv[*]" , fl =1)
count = len(cvs)

div = 1.0/(count -1)

st = ""
Min = 0
Max = 0

firstPos = cmds.xform(cvs[0] ,ws =1 , q =1 , t =1)
TotalLentgh = 28.336
firstV = om.MVector(firstPos[0],firstPos[1],firstPos[2])
for i , x in enumerate(cvs[1:]):
    secondPos = cmds.xform(x , ws =1 , q= 1, t =1)
    secondV = om.MVector(secondPos[0],secondPos[1] , secondPos[2])

    diffV = secondV - firstV
    distance = diffV.length()

    norlize = round(distance/TotalLentgh , 3)
    Max = norlize

    st += "float $funcSt{n} =  setRangeFunc($parameter , {min} , {max} , 0 , 1);\n".format(n = i , min = Min , max = Max)

    Min = Max

print (st)

'''
for i , x in enumerate(cvs):
    st += "glue_BND.inputTarget[1].inputTargetGroup[0].targetWeights[{}] = $func{};\n".format(i)
print (st)
'''