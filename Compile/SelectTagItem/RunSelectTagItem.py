import maya.cmds as cmds
import maya.OpenMayaUI as omui
import maya.mel as mel
import getpass, sys, re, os, json ,math
PythonV = sys.version
Version = cmds.about(version=True)
User = getpass.getuser()
Folder = 'SelectTagItem'
UI_File = 'SelectTagItem.ui'


def d_PathBasic(User  , Folder):
    Path = r"C:/Users/{}/Documents/maya/scripts/{}".format(User, Folder)
    return Path
Path =d_PathBasic(User  , Folder)
print(sys.path[-1])
if not Path  in sys.path:
    sys.path.append(Path)

from SelectTagItem import *
Run()
