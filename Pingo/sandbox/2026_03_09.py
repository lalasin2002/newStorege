# -*- coding: utf-8 -*-


import maya.cmds as cmds
import re , pprint  ,sys ,os


path = r"D:\Code\MayaCode\completeCode"
Abspath = os.path.abspath(path)
if not Abspath in sys.path:
    sys.path.append(Abspath)

import Def



        

print (sys.path[-1])

select = cmds.ls(sl =1)

for i, x in enumerate(select):
    search = re.search(r"([a-zA-Z0-9]+)(_Geo)",x)

    if search:
        names = search.group(1)
        Ctrl = Def.CreateNode.d_MeshFeatureEdge_Ctrl(x , names + "_Ctrl" , 20 ,1.25 )

        Def.MatchObject.match_ConstraintObject(Ctrl , x)

        

