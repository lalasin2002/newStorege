# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import os, time, shutil, re,json ,pprint,sys



selects = cmds.ls(sl =1)






JntRoot = 'pageTurnA01_Ctrl'

for i ,x in enumerate(selects):
    Alp = chr(66+i)
    dulicate = cmds.duplicate(JntRoot , renameChildren=1)
    cmds.delete(cmds.pointConstraint(x,dulicate , mo = 0 ))

    
    cmds.select(JntRoot , hierarchy=1)
    hierarchyJnts = cmds.ls(sl =1 , type = "joint")
    for jnt in hierarchyJnts:
        replaceNames = jnt.replace("pageTurnA" , "pageTurn{}" .format(Alp))
        replaceNamesFix = replaceNames.replace("Jnt1" , "Jnt")
        cmds.rename(jnt ,replaceNamesFix )






'''
for i , x in enumerate(selects):
    Alp = chr(65+i)
    names = "pageTurn{}_Crv" .format(Alp )
    cmds.rename(x , names)


count = 0
'''
'''
for i , x in enumerate(selects):
    
    count +=1
    num = str(count).zfill(2)
    
    names = "pageTurnA{}_Jnt" .format(num)

    print (names)

    cmds.rename(x , names)
'''
    
