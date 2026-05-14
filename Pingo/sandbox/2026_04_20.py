# -*- coding: utf-8 -*-
import maya.cmds as cmds


First = "innerPart_Ctrl"

selects = cmds.ls(sl =1)

for x in selects:
    cmds.parentConstraint(First ,x , mo =1)
    cmds.scaleConstraint(First , x , mo =1)