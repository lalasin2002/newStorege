# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel


a = [".rsSurfaceShader" ,".surfaceShader" ]

def getCntedNodeFromShaderEngine(engineNdoe , cnted = True  , plug = True ):
    if not cmds.objectType(engineNdoe) == "shadingEngine":
        return []
    unpack = { "s" : True , "d" : False  , "p" : plug , "c" :cnted   }
    
    searchTarget = "{}{}".format(engineNdoe)
    cntItmes = cmds.listConnections(searchTarget , **unpack ) or []
    return cntItmes


def create_shadingNode(nodeName, nodeType = "lambert", cntfile = []):
    # ex ) cntfile :
    #["{}.outColor".format(fileName) , "{}.color".format(lambertName)]
    shadingNode = cmds.shadingNode(nodeType, asShader=True, name=nodeName)

    if cntfile and len(cntfile)>1:
        isSource = cmds.objExists(cntfile[0])
        isDestination = cmds.objExists(cntfile[1])
        if isSource  and isDestination:
            cmds.connectAttr(cntfile[0] , cntfile[1] , f=1)

    return shadingNode
        
def create_file(nodeName , p2tName = None):
    fileNode = cmds.shadingNode("file", asTexture=True, isColorManaged=True, name=nodeName)
    p2t = None
    if p2tName:
        p2t = cmds.shadingNode("place2dTexture",n= p2tName, asUtility=True)
        tasks = [
                ("{}.coverage", "{}.coverage"),
                ("{}.translateFrame", "{}.translateFrame"),
                ("{}.rotateFrame", "{}.rotateFrame"),
                ("{}.mirrorU", "{}.mirrorU"),
                ("{}.mirrorV", "{}.mirrorV"),
                ("{}.stagger", "{}.stagger"),
                ("{}.wrapU", "{}.wrapU"),
                ("{}.wrapV", "{}.wrapV"),
                ("{}.repeatUV", "{}.repeatUV"),
                ("{}.offset", "{}.offset"),
                ("{}.rotateUV", "{}.rotateUV"),
                ("{}.noiseUV", "{}.noiseUV"),
                ("{}.vertexUvOne", "{}.vertexUvOne"),
                ("{}.vertexUvTwo", "{}.vertexUvTwo"),
                ("{}.vertexUvThree", "{}.vertexUvThree"),
                ("{}.vertexCameraOne", "{}.vertexCameraOne"),
                ("{}.outUV", "{}.uv"),
                ("{}.outUvFilterSize", "{}.uvFilterSize")
                ]
        for source , destination in tasks:
            cmds.connectAttr(source.format(p2t) , destination.format(fileNode),f =1)

    return fileNode , p2t





lambertName = "test"
fileName = "testFile"
p2t = "testP2t"
cnt = ["{}.outColor".format(fileName) , "{}.color".format(lambertName)]


file = create_file(fileName , p2t)
lambert = create_shadingNode(lambertName , "lambert" , cnt)
