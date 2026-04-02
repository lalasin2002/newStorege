# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om
import re , pprint



class setFKIK:
    def __init__(self ):
        string_type = None
        try:
            string_type = basestring
        except NameError:
            string_type = str

        self.Axis = ["X" , "Y" , "Z"]
        self.RGB = ['R' , 'G' , 'B']
        self.Is_FKIK_switch = False
        self.switchItem = None
        self.switchAttr = None
        #self.switchSetRange = None
        self.blendNode = None

        self.setRangeData = {
            "node" : None ,
            "OldMin" : None,
            "OldMax" : None,
            "Cnt_source": None
        }




    def createSetRangeAttr(self , Name = None , min = None , max = None):
        if Name is None:
            Name = "FKIK_blend_SR" 

        uniqueName = self.uniqueName(Name)
        setRange = cmds.createNode("setRange" , n = uniqueName )

        if all (isinstance(varSR , float) for varSR in [min , max] ):
            cmds.setAttr(setRange + ".oldMinX" , min)
            cmds.setAttr(setRange + ".oldMaxX" , max)

        cmds.setAttr(setRange + ".minX" , 0 )
        cmds.setAttr(setRange + ".maxX" , 1)

        self.setRangeData["node"] = setRange

    def createBlendNode(self ,Name = None ):
        if Name is None:
            Name = "FKIK_blendColor" 
        uniqueName = self.uniqueName(Name)

        blendColor = cmds.createNode("blendColors" , n = uniqueName)

        [cmds.setAttr("{}.color1{}" .format(blendColor , ax) , 0) for ax in "RGB" ]
        [cmds.setAttr("{}.color2{}" .format(blendColor , ax) , 0) for ax in "RGB" ]

        cmds.setAttr("{}.color2R" .format(blendColor) , 1 )
        cmds.setAttr("{}.color1G" .format(blendColor) , 1 )

        self.blendNode = blendColor


    def defineAttrData(self , Item , Attr , setRangeNode= None ):
        if setRangeNode is None:
            self.createSetRangeAttr()
        elif cmds.objExists(setRangeNode) and cmds.objectType(setRangeNode) == "setRange":
            self.setRangeData["node"] = setRangeNode
        else:
            raise ValueError("> not define SetRangeNode.")
        
        if cmds.objExists("{}.{}" .format(Item , Attr)):
            IsMin = cmds.attributeQuery(Attr , node = Item  , minimum=1 )
            IsMax = cmds.attributeQuery(Attr , node= Item   , maximum=1)
            if IsMin and IsMax:
                self.setRangeData["OldMin"] = IsMin[0]
                self.setRangeData["OldMax"] = IsMax[0]
                
                self.setRangeData["Cnt_source"] = "{}.{}" .format(Item , Attr)

                self.switchItem = Item
                self.switchAttr = Attr

                cmds.setAttr(self.setRangeData["node"] + ".OldMinX"  ,self.setRangeData["OldMin"] )
                cmds.setAttr(self.setRangeData["node"] + ".OldMaxX"  ,self.setRangeData["OldMax"] )

                cmds.setAttr(self.setRangeData["node"] + ".minX" , 0 )
                cmds.setAttr(self.setRangeData["node"] + ".maxX" , 1)
            else:
                raise ValueError("> Invalid input for <{}.{}>. The attribute must include 'min' and 'max' values.".format(Item , Attr))
        
        else:
            raise ValueError("> Invalid input <{}.{}>. It is not Exist" .foramt(Item , Attr))

    def connectSetRange(self):
        if self.switchItem and self.switchAttr and self.setRangeData["node"]:
            cmds.connectAttr("{}.{}" .format(self.switchItem , self.switchAttr) ,self.setRangeData["node"] + ".valueX" )
            cmds.connectAttr("{}.{}" .format(self.switchItem , self.switchAttr) ,self.setRangeData["node"] + ".valueY" )

    def connectBlendColor()



    def setFKIK(self , FK_item , IK_item , FKIK_item , scaling = True , reverseCnt = False):
        string_type = None
        try:
            string_type = basestring
        except NameError:
            string_type = str

        if not all(isinstance(item , string_type) for item in [FK_item , IK_item , FKIK_item] ) and all(cmds.objectType(item) == "joint" for item in [FK_item , IK_item , FKIK_item]):
            raise TypeError("> Invalid input for item. Expected 'joint' type")
        
        if self.setRangeData["node"] and self.switchItem and self.switchAttr:
            CP = cmds.parentConstraint(FK_item , IK_item , FKIK_item , mo = 1)[0]

            Blend1Attr =   "{}.{}W0" .format(CP , FK_item)
            Blend2Attr =   "{}.{}W1" .format(CP , IK_item)

            if reverseCnt:
                Blend1Attr =   "{}.{}W0" .format(CP , IK_item)
                Blend2Attr =   "{}.{}W1" .format(CP , FK_item) 

            

            




    def uniqueName(self , Name , maxLoop = 100 ):
            string_type = None
            try:
                string_type = basestring
            except NameError:
                string_type = str
            returnName = None
            formatName = None
            count = 0
            if isinstance(Name , string_type ):

                hasFormatPattern = r"\{.*?\}"
                hasFormat = re.search(hasFormatPattern , Name)
                
                isIntPattern = r"(.*?)([0-9]+)(.*?)"
                isInt = re.search(isIntPattern , Name)
                if isInt:
                    matchs = isInt.groups()
                    count = int(isInt.group(2))
                    joinName = []
                    for x in matchs:
                        if x == isInt.group(2):
                            x = "{}"
                            joinName.append(x)
                            continue
                        joinName.append(x)
                    formatName = "".join(joinName)
                else:
                    formatName = Name + "{}"
                
                for x in range(count , maxLoop + count):
                    count = x if x > 0 else ""

                    returnName = formatName.format("" if count == 0 else count )
                    if not cmds.objExists(returnName):
                        break

            return returnName