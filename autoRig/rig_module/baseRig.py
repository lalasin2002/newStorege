# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om
import  os,copy ,json , re


from autoRig_config import AUTO_RIG_ROOT, GUIDE_RIGS_PATH
from tools import controlAttribute , controlObject , naming , createObject , match , grouping


