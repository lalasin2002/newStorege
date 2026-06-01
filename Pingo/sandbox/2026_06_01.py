# -*- coding: utf-8 -*-
import maya.cmds as cmds





def doTasks(charNameSpace = "ch_136_zop_rig:" , assetNameSpace = "pr_136_dollShoes_rig:"):

    tasks = { "{}{}_Leg_2_Add_Jnt" : "{}{}_Leg_2_Add_follow_loc",
            "{}{}_Knee_Jnt" : "{}{}_Knee_follow_loc",
            "{}{}_Knee_1_Add_Jnt" : "{}{}_Knee_1_Add_follow_loc",
            "{}{}_Knee_2_Add_Jnt" : "{}{}_Knee_2_Add_follow_loc",
            "{}{}_Ankle_Jnt" : "{}{}_Ankle_follow_loc" ,
            "{}{}_Ball_Jnt" : "{}{}_Ball_follow_loc" ,
            "{}{}_ToeEnd_Jnt" : "{}{}_ToeEnd_follow_loc"
            }



    tatal = ""
    success = "___________________________\n"
    error = "___________________________\n"
    successCount = 0 
    errorCount = 0
    for ax in "LR":
        for charItem , assetItem in tasks.items():
            
            resultCharItem = charItem.format(charNameSpace ,ax )
            resultAssetItem = assetItem.format(assetNameSpace ,ax )

            isExists = all(cmds.objExists(x) for x in [resultCharItem , resultAssetItem])
            if isExists:
                successCount +=1 
                cmds.parentConstraint(resultCharItem , resultAssetItem)
                success += u">> {} connect {} : {}\n".format(successCount  , resultCharItem, resultAssetItem)
            else:
                errorCount += 1
                error += u">> {} error {} : {}\n".format(errorCount , resultCharItem, resultAssetItem)


    success += "____>> success count : {}\n".format(successCount)
    tatal += success
    if errorCount > 0:
        tatal += error
        tatal += "____>> error count : {}\n".format(errorCount)
    print (tatal)



try:
    cmds.undoInfo(openChunk=1)
    doTasks()
finally:
    cmds.undoInfo(closeChunk=1)