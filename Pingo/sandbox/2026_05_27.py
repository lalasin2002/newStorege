import maya.cmds as cmds
def d_Constraint_With_Cnt_Scale(Staric , Target , MainTain = True):
    Constraint = None
    Constraint = cmds.parentConstraint(Staric , Target , mo = MainTain)
    cmds.scaleConstraint(Staric , Target , mo = MainTain)
    #for x in "XYZ":

    #    cmds.connectAttr('{}.scale{}' .format(Staric, x) ,'{}.scale{}' .format(Target ,x),f =1)

    return Constraint[0]






try:
    cmds.undoInfo(openChunk= 1)
    alp = "A"

    tasks = [("ropeMain{}_Ctrl" , "ClawRoot{}_constraint"),
            ("clawBody{}_Ctrl" , "Claw{}_Geos" ) ,
            ("claw{}_setting_Ctrl" , "ClawCenter{}_Geos" ),
            ("claw{}_FKa01_Ctrl" , "Up_Finger{}02_Geo_Grp") , 
            ("claw{}_FKa02_Ctrl" , "Dn_Finger{}02_Geo_Grp"),
            ("claw{}_FKb01_Ctrl" , "Up_Finger{}01_Geo_Grp"),
            ("claw{}_FKb02_Ctrl" , "Dn_Finger{}01_Geo_Grp"),
            ("claw{}_FKc01_Ctrl" , "Up_Finger{}03_Geo_Grp"),
            ("claw{}_FKc02_Ctrl" , "Dn_Finger{}03_Geo_Grp")
    ]

    for ctrl , target in tasks:
        ctrl = ctrl.format(alp)
        target = target.format(alp)

        isObj = all(cmds.objExists(o) == True for o in [ctrl , target] )
        if isObj:
            d_Constraint_With_Cnt_Scale(ctrl ,target)
finally:
    cmds.undoInfo(closeChunk=1)

