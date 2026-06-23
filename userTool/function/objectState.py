# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import maya.cmds as cmds
try:
    import maya.api.OpenMaya as om2
except:
    import maya.OpenMaya as om
import os,sys


def getDistance(S, E):
    S_Pos = cmds.xform(S, q=1, t=1, ws=1)
    E_Pos = cmds.xform(E, q=1, t=1, ws=1)
    DT = ((S_Pos[0] - E_Pos[0]) ** 2 + (S_Pos[1] - E_Pos[1]) ** 2 + (S_Pos[2] - E_Pos[2]) ** 2) ** 0.5
    return DT



def getJntAxis(startJnt, endJnt):
    if not all(cmds.objectType(x) == "joint" for x in [startJnt , endJnt]):
        return None
    axis = "XYZ"
    try:
        startPos = om2.MVector(cmds.xform(startJnt, q=True, ws=True, t=True))
        endPos = om2.MVector(cmds.xform(endJnt, q=True, ws=True, t=True))

        diffV = endPos - startPos
        startMatrix = om2.MMatrix(cmds.xform(startJnt, q=True, ws=True, m=True))
        #첫번째 줄 : X의 방향
        #두 번째줄 : Y의 방향
        #세번째 줄 : Z의 방향
        #네번째 줄 : xyz translate
        startInvMatrix = startMatrix.inverse()
        # 그대로 곱하면 우주 미아가 되므로, 내 변환을 '취소'하기 위해 거꾸로 뒤집음
        # parent 원리 , 자식 행렬을 그대로 곱하면 더 멀리 감으로 역행

        aimV = diffV * startInvMatrix
        # 4. 가짜 Parent 실행
    except:
        startPosList = cmds.xform(startJnt, q=True, ws=True, t=True)
        endPosList = cmds.xform(endJnt, q=True, ws=True, t=True)
        
        startPos = om.MVector(startPosList[0], startPosList[1], startPosList[2])
        endPos = om.MVector(endPosList[0], endPosList[1], endPosList[2])

        diffV = endPos - startPos

        sel = om.MSelectionList()
        sel.add(startJnt)
        dagPath = om.MDagPath()
        sel.getDagPath(0, dagPath)
        
        # inclusiveMatrix()가 바로 xform(m=True)와 같은 월드 매트릭스
        startMatrix = dagPath.inclusiveMatrix()
        
        # 역행렬
        startInvMatrix = startMatrix.inverse()

        #  가짜 Parent 실행
        aimV = diffV * startInvMatrix

    absV = [abs(aimV.x) , abs(aimV.y) , abs(aimV.z)]
    maxValue = max(absV)
    maxIndex = absV.index(maxValue)

    return axis[maxIndex]

def setDrawObj(Target, ColorNumber):

    cmds.setAttr(Target + '.overrideEnabled', 1)
    cmds.setAttr(Target + '.overrideDisplayType', 0)
    cmds.setAttr(Target + '.overrideRGBColors', 0)
    cmds.setAttr(Target + '.overrideColor', ColorNumber)
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
    PurplePizzazz : #C800C8 : (0.784, 0 ,0.784) : 9
    MuleFawn : #8A4833 : (0.541 , 0.282 ,0.2) : 10
    Jon : #3F231F : (0.247 , 0.137 , 0.122) : 11
    TotemPole : #992600 : (0.6 , 0.149 ,0) : 12
    Red : #FF0000 : (1,0,0) : 13
    Green : #00FF00 : (0,1,0) : 14  
    Smalt : #004199 : (0,0.255,0.6) : 15 
    White : #FFFFFF : (1,1,1) : 16
    Yellow : #FFFF00 : (1,1,0) : 17
    Sky :  #64DCFF : (0.392 , 0.863 ,1) : 18
    ScreaminGreen: #43FFA3 : (0.263 , 1 ,0.639) : 19
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