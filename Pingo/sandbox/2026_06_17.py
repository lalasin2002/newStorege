# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import maya.cmds as cmds
import os 



transData = [5,5,5]
orientData = [-35.264 , 45 , 0 ]
farClip = 1000000
widthHeight = [256, 256]
dirpath = r"D:\Code\MayaCode\userTool\ctrlsData"
dirpath = os.path.abspath(dirpath).replace("\\", "/")

files = [x for x in os.listdir(dirpath) if x.endswith(".ma")]


for x in files:
    print (dirpath , x)



for filename in files:
    path = os.path.join(dirpath , filename)
    path = path.replace("\\", "/")
    savePath = path.replace(".ma" , ".jpg")
    
    cmds.file(path,open=1, force=True , type="mayaAscii", ignoreVersion=True)

    

    cmds.xform("persp" , ws =1 , t= transData)
    cmds.xform("persp" ,ws = 1 , ro = orientData)
    cmds.setAttr("persp.farClipPlane", farClip)

    curves= cmds.ls(type = "nurbsCurve")
    transform = cmds.listRelatives(curves, p =1)




    shotAttr = {
        "wireframeOnShaded": False,
        "nurbsCurves": True,
        "jointXray": False
    }
    panel = cmds.getPanel(withFocus=True)
    if cmds.getPanel(typeOf=panel) != 'modelPanel':
        panels = cmds.getPanel(type='modelPanel')
        if panels:
            panel = panels[0]
    try:
        cmds.modelEditor(panel,e =1 ,  **shotAttr )
        cmds.refresh(force=True) 
    except Exception as e:
        print( e)

    cmds.select(transform)
    cmds.viewFit(fitFactor=0.8)



    attrUnpack = {
                "format" : "image" ,
                "compression" : "jpg",
                "widthHeight" : widthHeight ,
                "percent" : 100.0,
                "viewer" : False , 
                "offScreen" : False , 
                "showOrnaments" : True,
                "completeFilename" :  savePath
                }
    cmds.playblast(**attrUnpack)
