# -*- coding: utf-8 -*-
import maya.cmds as cmds
import re , pprint 


attrs = [".length{}".format(x) for x in range(1,4)]

selects = cmds.ls(sl=1)


for n , x in enumerate(selects):
    search = re.search(r"(.+)(_)(Ik)",x)
    if search:
        names = search.group(1)
        print (names)
        

        plus = cmds.createNode("plusMinusAverage", n = names + "_Pm")
        for i, ax  in enumerate("XYZ"):
            lowerAx = ax.lower()
            counts = str(i+1).zfill(2)

            Jnt = "{}{}_Ik_Jnt" .format(names , counts)

            cmds.connectAttr(x + attrs[i] ,plus + ".input3D[0].input3D{}" .format(lowerAx)  ,f =1)
            cmds.setAttr(plus + ".input3D[1].input3D{}" .format(lowerAx) , 1)

            cmds.connectAttr(plus + ".output3D.output3D{}".format(lowerAx) , Jnt + ".scaleY" , f=1 )
        