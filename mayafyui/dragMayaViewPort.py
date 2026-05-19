# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import sys, os, json
import maya.cmds as cmds
import maya.mel as mel

def onMayaDroppedPythonFile(*args):
    PORT = 7771
    
    curentPath = os.path.dirname(os.path.abspath(__file__))
    jsonPath = os.path.join(curentPath, "_prev.json")
    if os.path.exists(jsonPath):
        try:
            with open(jsonPath, "r") as f:
                jsonData = json.load(f)
            PORT = int(jsonData.get("mayaPort", PORT))
        except Exception as e:
            print(">> json 읽기 실패:", e)
    
    port_addr = "localhost:{}".format(PORT)
    
    command_template = u"""
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import maya.cmds as cmds

port_addr = "{port}"

if cmds.commandPort(port_addr, q=True):
    cmds.commandPort(name=port_addr, cl=True)
    print(u">> [mayafyui] 포트 닫힘: {port}")
else:
    cmds.commandPort(name=port_addr, stp="python", sourceType="python")
    print(u">> [mayafyui] 포트 열림: {port}")
"""
    
    final_command = command_template.format(port=port_addr)
    gShelfTopLevel = mel.eval('$tmpVar=$gShelfTopLevel')
    current_shelf = cmds.tabLayout(gShelfTopLevel, query=True, selectTab=True)

    cmds.shelfButton(
        parent=current_shelf,
        annotation="mayafyui : 외부 포트 열기 ({})".format(PORT),
        label="mayafyui",
        image="pythonFamily.png",
        command=final_command,
        sourceType="python",
        imageOverlayLabel="comfy", 
        overlayLabelColor=(1, .25, .25)
    )

    print(u">> [mayafyui] 선반 버튼 생성 완료")
