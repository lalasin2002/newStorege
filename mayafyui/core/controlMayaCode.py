# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import json , os ,io

def take_lookThru(cam):
    code = """
import maya.cmds as cmds
cam = {c}
try:
    cmds.lookThru(cam)
    cmds.refresh(force=True, cv=True)
except Exception as e:
    print (e)
""".format(c = repr(cam))
    return code

def take_mayaSnapShot(path , width , height , scale , ext =  "jpg"  , showGrid=False):
    maya_percent = float(scale * 100.0)
    attrUnpack = {
            "format" : "image" ,
            "compression" : ext,
            "widthHeight" : [width ,height] ,
            "percent" : scale,
            "viewer" : False , 
            "offScreen" : False , 
            "showOrnaments" : showGrid,
            "completeFilename" :  path 
            }

    code = """
import maya.cmds as cmds
import os

currentFrame = cmds.currentTime(query=True)
unpack = {attr}
unpack["startTime"] = currentFrame
unpack["endTime"] = currentFrame
try:
    result = cmds.playblast(**unpack)
except Exception as e:
    print (e)
""".format(attr = repr(attrUnpack))
    return  code
    
