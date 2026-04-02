import maya.cmds as cmds


def d_Match_CP(Staric, Target, Bool_Point=True, Bool_Orient=True, Bool_Scale=False):
    if Bool_Point == True:
        Po = cmds.pointConstraint(Staric, Target, mo=0)
        cmds.delete(Po)
    if Bool_Orient == True:
        Or = cmds.orientConstraint(Staric, Target, mo=0)
        cmds.delete(Or)
    if Bool_Scale == True:
        Scale = cmds.scaleConstraint(Staric, Target, mo=0)
        cmds.delete(Scale)



class c_arrange_item():
    def __init__(self, Staric, Target, Trans , Rotate, Scale, Matrix):
        self.Staric = Staric
        self.Target = Target
        self.Trans = Trans
        self.Rotate = Rotate
        self.Scale = Scale
        self.Matrix = Matrix


        pos_m = cmds.xform(self.Target, ws=1, m=1, q=1)

        if Matrix == True:
            cmds.xform(x, ws=1, m=pos_m)
        else:
            if Trans:
                cmds.delete(cmds.pointConstraint(Staric , Target ,mo =0))
            if Rotate:
                cmds.delete(cmds.orientConstraint(Staric , Targetx ,mo =0))
            if Scale:
                cmds.delete(cmds.scaleConstraint(Staric ,Target ,mo =0))


class c_arrange():
    def __init__(self, lst_Select, Trans, Rotate, Scale, Matrix):
        self.lst_Select = lst_Select[:-1]
        self.Target = lst_Select[-1]

        self.Trans = Trans
        self.Rotate = Rotate
        self.Scale = Scale
        self.Matrix = Matrix


        pos_m = cmds.xform(self.Target, ws=1, m=1, q=1)


        for x in lst_Select:
            if Matrix == True:
                cmds.xform(x, ws=1, m=pos_m)
            else:
                if Trans:
                    cmds.delete(cmds.pointConstraint(self.Target , x ,mo =0))
                if Rotate:
                    cmds.delete(cmds.orientConstraint(self.Target , x ,mo =0))
                if Scale:
                    cmds.delete(cmds.scaleConstraint(self.Target , x ,mo =0))



    def help(self):

        print ("c_arrange ([obj_list] , [trans_bool] , [rotate_bool] , [scale_bool] , [matrix_bool])")


class c_grouping():
    def __init__(self, lst_Select, parent_bool, grp_Count, grp_lst, Drt):
        self.Drt = Drt
        self.lst_Select = lst_Select
        self.grp_Count = grp_Count
        self.grp_lst = grp_lst
        self.parent_bool = parent_bool

        self.Dic = {}
        root_lst = []
        for x in lst_Select:
            lst = []

            for y in range(0, self.grp_Count):
                grp = cmds.createNode('transform', n= x + self.grp_lst[y])
                lst.append(grp)
                if y == self.grp_Count - 1:
                    root_lst.append(grp)

            for y in range(0, len(lst)):
                try:
                    cmds.parent(lst[y], lst[y + 1])
                except:
                    pass

            self.Dic[x] = lst
            pos_m = cmds.xform(x, ws=1, m=1, q=1)
            cmds.xform(lst[-1], ws=1, m=pos_m)
            cmds.parent(x, lst[0])

        if self.Drt == 1:
            for x in root_lst:
                cmds.setAttr(x + '.scaleX', -1)
        else:
            pass

        if self.parent_bool == 1:
            for x in range(0, len(lst_Select)):
                try:
                    cmds.parent(root_lst[x + 1], lst_Select[x])
                except:
                    pass
        else:
            pass


    def help(self):

        print ("c_grouping ([lst_Select] , [parent_bool] , [grp_Count] , [grp_name_list])")



class c_mir_grouping():
    def __init__(self, lst_Select, Direct):
        self.Direct = Direct
        self.lst_Select = lst_Select

        if self.Direct == "Lf":
            self.Target = "Lf"
            self.rp_Target = "Rt"
        else:
            self.Target = "Rt"
            self.rp_Target = "Lf"

        for x in lst_Select:

            Mr = cmds.createNode('transform', n='Mr_' + x)
            cmds.parent(x, Mr)

            r_Mr = cmds.duplicate(Mr, rr=1)
            r_Mr += cmds.listRelatives(r_Mr, ad=True, f=True)
            long_r_Name = cmds.ls(r_Mr, l=1)
            long_r_Name.sort()
            cmds.setAttr(r_Mr[0] + '.scaleX', -1)

            for y in long_r_Name[::-1]:
                shortname = y.rpartition("|")[-1]
                cmds.rename(y, shortname.replace(self.Target, self.rp_Target))


class c_freeze():
    def __init__(self, lst_Select, trans_bool, rotate_bool, scale_bool):
        self.lst_Select = lst_Select
        self.trans_bool = trans_bool
        self.rotate_bool = rotate_bool
        self.scale_bool = scale_bool

        for x in self.lst_Select:
            cmds.makeIdentity(x, apply=True, translate=self.trans_bool, rotate=self.rotate_bool, scale=self.scale_bool)


class c_JntCtrlShape():
    def __init__(self, lst_Select, Shape):
        self.lst_Select = lst_Select
        self.Shape = Shape

        Shape_list = cmds.listRelatives(self.Shape, s=1, type='shape')
        for x in Shape_list:
            cmds.parent(x, self.lst_Select, r=1, s=1)
        cmds.delete(self.Shape)
        cmds.setAttr(self.lst_Select + '.drawStyle', 2)

import maya.cmds as cmds



class c_ctrlShape():
    def __init__(self, input_name, ctrl_type, Normal):

        self.input_name = input_name
        self.ctrl_type = ctrl_type
        self.Normal = Normal

        # _____________________________________________________________NameSetting
        if self.input_name == '':
            nameSet = 'NoNameCtrl'

        else:
            nameSet = str(self.input_name)

        # ------------------------------------------------------------------------Shape_Plane
        if self.ctrl_type == 'Circle':
            pre_Ctrl = cmds.circle(nr=[0, 1, 0])[0]
        elif self.ctrl_type == 'Square':
            pre_Ctrl = cmds.curve(d=1, p=[(-1, 0, -1), (-1, 0, 1), (1, 0, 1), (1, 0, -1), (-1, 0, -1)])
        elif self.ctrl_type == 'Round_Square':
            pre_Ctrl = cmds.curve(d=3,
                                  p=[(-1, 0, 0), (-1, 0, 0.333), (-1, 0, 0.444), (-1, 0, 0.500), (-0.951, 0, 0.684),
                                     (-0.835, 0, 0.835), (-0.684, 0, 0.951), (-0.500, 0, 1), (-0.444, 0, 1),
                                     (-0.333, 0, 1), (0, 0, 1), (0.333, 0, 1), (0.444, 0, 1), (0.500, 0, 1),
                                     (0.684, 0, 0.951), (0.835, 0, 0.835), (0.951, 0, 0.684), (1, 0, 0.500),
                                     (1, 0, 0.444), (1, 0, 0.333), (1, 0, 0), (1, 0, -0.333), (1, 0, -0.444),
                                     (1, 0, -0.500), (0.951, 0, -0.684), (0.835, 0, -0.835), (0.684, 0, -0.951),
                                     (0.500, 0, -1), (0.444, 0, -1), (0.333, 0, -1), (0, 0, -1), (-0.333, 0, -1),
                                     (-0.444, 0, -1), (-0.500, 0, -1), (-0.684, 0, -0.951), (-0.835, 0, -0.835),
                                     (-0.951, 0, -0.684), (-1, 0, -0.500), (-1, 0, -0.444), (-1, 0, -0.333),
                                     (-1, 0, 0)])
        elif self.ctrl_type == 'Triangle':
            pre_Ctrl = cmds.curve(d=1, p=[(-1, 0, 0), (0, 0, 2), (1, 0, 0), (-1, 0, 0)])
        elif self.ctrl_type == 'Pentagon':
            pre_Ctrl = cmds.curve(d=1, p=[(-1.546818, 0, -2.047431), (-2.457441, 0, 0.831998), (0, 0, 2.831998),
                                          (2.457441, 0, 0.831998), (1.546818, 0, -2.047431), (-1.546818, 0, -2.047431)])
        elif self.ctrl_type == 'Hexagon':
            pre_Ctrl = cmds.curve(d=1, p=[(0, 0, -3), (-2.5, 0, -1.5), (-2.5, 0, 1.5), (0, 0, 3), (2.5, 0, 1.5),
                                          (2.5, 0, -1.5), (0, 0, -3)])
        elif self.ctrl_type == 'Octagon':
            pre_Ctrl = cmds.curve(d=1, p=[(-3, 0, 1), (-1, 0, 3), (1, 0, 3), (3, 0, 1), (3, 0, -1), (1, 0, -3),
                                          (-1, 0, -3), (-3, 0, -1), (-3, 0, 1)])
        elif self.ctrl_type == 'Arrow':
            pre_Ctrl = cmds.curve(d=1,
                                  p=[(0, 1.003235, 0), (0.668823, 0, 0), (0.334412, 0, 0), (0.334412, -0.167206, 0),
                                     (0.334412, -0.501617, 0), (0.334412, -1.003235, 0), (-0.334412, -1.003235, 0),
                                     (-0.334412, -0.501617, 0), (-0.334412, -0.167206, 0), (-0.334412, 0, 0),
                                     (-0.668823, 0, 0), (0, 1.003235, 0)], k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])
        elif self.ctrl_type == 'Double_Arrow':
            pre_Ctrl = cmds.curve(d=1,
                                  p=[(0, 1, 0), (1, 1, 0), (2, 1, 0), (3, 1, 0), (3, 2, 0), (4, 1, 0), (5, 0, 0),
                                     (4, -1, 0), (3, -2, 0), (3, -1, 0), (2, -1, 0), (1, -1, 0), (0, -1, 0),
                                     (-1, -1, 0), (-2, -1, 0), (-3, -1, 0), (-3, -2, 0), (-4, -1, 0), (-5, 0, 0),
                                     (-4, 1, 0), (-3, 2, 0), (-3, 1, 0), (-2, 1, 0), (-1, 1, 0), (0, 1, 0), ],
                                  k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,
                                     22, 23, 24])
        elif self.ctrl_type == 'Multi_Arrow':
            pre_Ctrl = cmds.curve(d=1,
                                  p=[(1, 0, 1), (3, 0, 1), (3, 0, 2), (5, 0, 0), (3, 0, -2), (3, 0, -1), (1, 0, -1),
                                     (1, 0, -3), (2, 0, -3), (0, 0, -5), (-2, 0, -3), (-1, 0, -3), (-1, 0, -1),
                                     (-3, 0, -1), (-3, 0, -2), (-5, 0, 0), (-3, 0, 2), (-3, 0, 1), (-1, 0, 1),
                                     (-1, 0, 3), (-2, 0, 3), (0, 0, 5), (2, 0, 3), (1, 0, 3), (1, 0, 1), ],
                                  k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,
                                     22, 23, 24])
        elif self.ctrl_type == 'Plus':
            pre_Ctrl = cmds.curve(d=1, p=[(-1, 0, -3), (1, 0, -3), (1, 0, -1), (3, 0, -1), (3, 0, 1), (1, 0, 1),
                                          (1, 0, 3), (-1, 0, 3), (-1, 0, 1), (-3, 0, 1), (-3, 0, -1), (-1, 0, -1),
                                          (-1, 0, -3)], k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])


        # ------------------------------------------------------------------------Shape_Sign
        elif self.ctrl_type == 'Sign_Circle':
            pre_Ctrl = cmds.curve(d=1, p=[(0, 0, 0), (0, 0, -2)])
            Ctrl_s01 = cmds.circle(nr=[0, 1, 0])
            Ctrl_s01_s = cmds.listRelatives(Ctrl_s01[0], s=1, type='shape')

            lst_cv = cmds.ls(Ctrl_s01[0] + '.cv[*]', fl=1)
            cmds.move(0, 0, -3, lst_cv, os=1, r=1)
            cmds.parent(Ctrl_s01_s[0], pre_Ctrl, r=1, s=1)
            cmds.delete(Ctrl_s01[0])
        elif self.ctrl_type == 'Sign_Square':
            pre_Ctrl = cmds.curve(d=1, p=(
                [(0, 0, 0), (0, 0, -2), (-1, 0, -2), (-1, 0, -4), (1, 0, -4), (1, 0, -2), (0, 0, -2)]))
        elif self.ctrl_type == 'Sign_Diamond':
            pre_Ctrl = cmds.curve(d=1, p=([(0, 0, 0), (0, 0, -2), (-1, 0, -3), (0, 0, -4), (1, 0, -3), (0, 0, -2)]))
        elif self.ctrl_type == 'Sign_Rdsquare':
            pre_Ctrl = cmds.curve(d=1, p=[(0, 0, 0), (0, 0, -1)])
            Ctrl_s01 = cmds.curve(d=5,
                                  k=[0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
                                     19, 20, 20, 20, 20, 20],
                                  p=[(0.0956857, 0, -2.000022), (-0.287057, 0, -2.000065), (0.574114, 0, -2.00013),
                                     (-0.736092, 0, -1.980352), (-1.022575, 0, -2.257156),
                                     (-0.993616, 0, -2.482056), (-1.003987, 0, -2.999998), (-0.994634, 0, -3.51795),
                                     (-1.019773, 0, -3.742832), (0.742791, 0, -4.019674), (-0.517964, 0, -3.994865),
                                     (0, 0, -4.00345), (1.019773, 0, -3.742832), (0.994634, 0, -3.51795),
                                     (1.003987, 0, -2.999998), (0.993616, 0, -2.482056), (1.022575, 0, -2.257156),
                                     (0.736092, 0, -1.980352), (0.574114, 0, -2.00013), (0.287057, 0, -2.000065),
                                     (0.0956857, 0, -2.000022), (0, 0, -2)])
            lst_cv = cmds.ls(Ctrl_s01[0] + '.cv[*]', fl=1)
            cmds.move(0, 0, -3, lst_cv, os=1, r=1)

            Ctrl_s01_s = cmds.listRelatives(Ctrl_s01, s=1, type='shape')
            cmds.parent(Ctrl_s01_s[0], pre_Ctrl, r=1, s=1)
            cmds.delete(Ctrl_s01)
        elif self.ctrl_type == 'Orbs':
            pre_Ctrl = cmds.circle(nr=[0, 1, 0])[0]
            Ctrl_s01 = cmds.circle(nr=[0, 0, 1])[0]
            Ctrl_s02 = cmds.circle(nr=[1, 0, 0])[0]

            Ctrl_s01_s = cmds.listRelatives(Ctrl_s01, s=1, type='shape')
            Ctrl_s02_s = cmds.listRelatives(Ctrl_s02, s=1, type='shape')

            lst_cv_s01 = cmds.ls(Ctrl_s01 + '.cv[*]', fl=1)
            lst_cv_s02 = cmds.ls(Ctrl_s02 + '.cv[*]', fl=1)




            cmds.parent(Ctrl_s01_s[0], pre_Ctrl, r=1, s=1)
            cmds.parent(Ctrl_s02_s[0], pre_Ctrl, r=1, s=1)

            cmds.delete(Ctrl_s01, Ctrl_s02)


        elif self.ctrl_type == 'Cube':
            pre_Ctrl = cmds.curve(d=1, p=[(1, 1, 1), (1, 1, -1), (-1, 1, -1), (-1, 1, 1), (1, 1, 1), (1, -1, 1),
                                          (1, -1, -1), (1, 1, -1), (-1, 1, -1), (-1, -1, -1), (1, -1, -1),
                                          (-1, -1, -1), (-1, -1, 1), (-1, 1, 1), (-1, -1, 1), (1, -1, 1)],
                                  k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])

        elif self.ctrl_type == 'Diamond':
            pre_Ctrl = cmds.curve(d=1, p=[(0, 1, 0), (-1, 0.00278996, 6.18172e-08), (0, 0, 1), (0, 1, 0),
                                          (1, 0.00278996, 0), (0, 0, 1), (1, 0.00278996, 0), (0, 0, -1), (0, 1, 0),
                                          (0, 0, -1), (-1, 0.00278996, 6.18172e-08), (0, -1, 0), (0, 0, -1),
                                          (1, 0.00278996, 0), (0, -1, 0), (0, 0, 1)],
                                  k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])
        elif self.ctrl_type == 'Hard_Ring':
            pre_Ctrl = cmds.curve(d=1, p=[(-0.707107, 0.0916408, 0.707107), (0, 0.0916408, 1), (0, -0.0916408, 1),
                                          (-0.707107, -0.0916408, 0.707107), (-0.707107, 0.0916408, 0.707107),
                                          (-1, 0.0916408, 0), (-1, -0.0916408, 0),
                                          (-0.707107, -0.0916408, 0.707107), (-1, -0.0916408, 0),
                                          (-0.707107, -0.0916408, -0.707107), (-0.707107, 0.0916408, -0.707107),
                                          (-1, 0.0916408, 0), (-0.707107, 0.0916408, -0.707107), (0, 0.0916408, -1),
                                          (0, -0.0916408, -1), (-0.707107, -0.0916408, -0.707107),
                                          (-0.707107, 0.0916408, -0.707107), (-0.707107, -0.0916408, -0.707107),
                                          (0, -0.0916408, -1), (0.707107, -0.0916408, -0.707107),
                                          (0.707107, 0.0916408, -0.707107), (0, 0.0916408, -1),
                                          (0.707107, 0.0916408, -0.707107), (1, 0.0916408, 0), (1, -0.0916408, 0),
                                          (0.707107, -0.0916408, -0.707107), (1, -0.0916408, 0),
                                          (0.707107, -0.0916408, 0.707107), (0.707107, 0.0916408, 0.707107),
                                          (1, 0.0916408, 0), (0.707107, 0.0916408, 0.707107), (0, 0.0916408, 1),
                                          (0, -0.0916408, 1), (0.707107, -0.0916408, 0.707107)],
                                  k=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,
                                     22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33])
        elif self.ctrl_type == 'Soft_Ring':
            pre_Ctrl = cmds.circle(nr=[0, 1, 0])[0]
            # 0.0916408
            Ctrl_s01 = cmds.circle(nr=[0, 1, 0])

            Ctrl_s02 = cmds.curve(d=1, p=[(0, -0.0916408, 1), (0, 0.0916408, 1)])
            Ctrl_s03 = cmds.curve(d=1, p=[(0, -0.0916408, -1), (0, 0.0916408, -1)])
            Ctrl_s04 = cmds.curve(d=1, p=[(1, -0.0916408, 0), (1, 0.0916408, 0)])
            Ctrl_s05 = cmds.curve(d=1, p=[(-1, -0.0916408, 0), (-1, 0.0916408, 0)])

            lst_cv_s01 = cmds.ls(pre_Ctrl + '.cv[*]', fl=1)
            lst_cv_s02 = cmds.ls(Ctrl_s01[0] + '.cv[*]', fl=1)
            cmds.move(0, -0.0916408, 0, lst_cv_s01, r=1, os=1)
            cmds.move(0, 0.0916408, 0, lst_cv_s02, r=1, os=1)

            Ctrl_s01_s = cmds.listRelatives(Ctrl_s01, s=1, type='shape')
            Ctrl_s02_s = cmds.listRelatives(Ctrl_s02, s=1, type='shape')
            Ctrl_s03_s = cmds.listRelatives(Ctrl_s03, s=1, type='shape')
            Ctrl_s04_s = cmds.listRelatives(Ctrl_s04, s=1, type='shape')
            Ctrl_s05_s = cmds.listRelatives(Ctrl_s05, s=1, type='shape')

            cmds.parent(Ctrl_s01_s[0], pre_Ctrl, r=1, s=1)
            cmds.parent(Ctrl_s02_s[0], pre_Ctrl, r=1, s=1)
            cmds.parent(Ctrl_s03_s[0], pre_Ctrl, r=1, s=1)
            cmds.parent(Ctrl_s04_s[0], pre_Ctrl, r=1, s=1)
            cmds.parent(Ctrl_s05_s[0], pre_Ctrl, r=1, s=1)

            cmds.delete(Ctrl_s01, Ctrl_s02, Ctrl_s03, Ctrl_s04, Ctrl_s05)

        elif self.ctrl_type == 'Rdcube':
            pre_Ctrl = cmds.curve(d=3,
                                  p=[(-1, -0.25, 0), (-1, -0.25, 0.333), (-1, -0.25, 0.444), (-1, -0.25, 0.500),
                                     (-0.951, -0.25, 0.684), (-0.835, -0.25, 0.835), (-0.684, -0.25, 0.951),
                                     (-0.500, -0.25, 1), (-0.444, -0.25, 1), (-0.333, -0.25, 1), (0, -0.25, 1),
                                     (0.333, -0.25, 1), (0.444, -0.25, 1), (0.500, -0.25, 1), (0.684, -0.25, 0.951),
                                     (0.835, -0.25, 0.835), (0.951, -0.25, 0.684), (1, -0.25, 0.500),
                                     (1, -0.25, 0.444), (1, -0.25, 0.333), (1, -0.25, 0), (1, -0.25, -0.333),
                                     (1, -0.25, -0.444), (1, -0.25, -0.500), (0.951, -0.25, -0.684),
                                     (0.835, -0.25, -0.835), (0.684, -0.25, -0.951), (0.500, -0.25, -1),
                                     (0.444, -0.25, -1), (0.333, -0.25, -1), (0, -0.25, -1), (-0.333, -0.25, -1),
                                     (-0.444, -0.25, -1), (-0.500, -0.25, -1), (-0.684, -0.25, -0.951),
                                     (-0.835, -0.25, -0.835), (-0.951, -0.25, -0.684), (-1, -0.25, -0.500),
                                     (-1, -0.25, -0.444), (-1, -0.25, -0.333), (-1, -0.25, 0)])
            Ctrl_s01 = cmds.curve(d=3, p=[(-1, 0.25, 0), (-1, 0.25, 0.333), (-1, 0.25, 0.444), (-1, 0.25, 0.500),
                                          (-0.951, 0.25, 0.684), (-0.835, 0.25, 0.835), (-0.684, 0.25, 0.951),
                                          (-0.500, 0.25, 1), (-0.444, 0.25, 1), (-0.333, 0.25, 1), (0, 0.25, 1),
                                          (0.333, 0.25, 1), (0.444, 0.25, 1), (0.500, 0.25, 1),
                                          (0.684, 0.25, 0.951), (0.835, 0.25, 0.835), (0.951, 0.25, 0.684),
                                          (1, 0.25, 0.500), (1, 0.25, 0.444), (1, 0.25, 0.333), (1, 0.25, 0),
                                          (1, 0.25, -0.333), (1, 0.25, -0.444), (1, 0.25, -0.500),
                                          (0.951, 0.25, -0.684), (0.835, 0.25, -0.835), (0.684, 0.25, -0.951),
                                          (0.500, 0.25, -1), (0.444, 0.25, -1), (0.333, 0.25, -1), (0, 0.25, -1),
                                          (-0.333, 0.25, -1), (-0.444, 0.25, -1), (-0.500, 0.25, -1),
                                          (-0.684, 0.25, -0.951), (-0.835, 0.25, -0.835), (-0.951, 0.25, -0.684),
                                          (-1, 0.25, -0.500), (-1, 0.25, -0.444), (-1, 0.25, -0.333),
                                          (-1, 0.25, 0)])

            Ctrl_s02 = cmds.curve(d=1, p=[(-0.829, 0.25, 0.829), (-0.829, -0.25, 0.829)])
            Ctrl_s03 = cmds.curve(d=1, p=[(0.829, 0.25, -0.829), (0.829, -0.25, -0.829)])
            Ctrl_s04 = cmds.curve(d=1, p=[(-0.829, 0.25, -0.829), (-0.829, -0.25, -0.829)])
            Ctrl_s05 = cmds.curve(d=1, p=[(0.829, 0.25, 0.829), (0.829, -0.25, 0.829)])

            Ctrl_s01_s = cmds.listRelatives(Ctrl_s01, s=1, type='shape')
            Ctrl_s02_s = cmds.listRelatives(Ctrl_s02, s=1, type='shape')
            Ctrl_s03_s = cmds.listRelatives(Ctrl_s03, s=1, type='shape')
            Ctrl_s04_s = cmds.listRelatives(Ctrl_s04, s=1, type='shape')
            Ctrl_s05_s = cmds.listRelatives(Ctrl_s05, s=1, type='shape')

            cmds.parent(Ctrl_s01_s[0], pre_Ctrl, r=1, p=1)
            cmds.parent(Ctrl_s02_s[0], pre_Ctrl, r=1, p=1)
            cmds.parent(Ctrl_s03_s[0], pre_Ctrl, r=1, p=1)
            cmds.parent(Ctrl_s04_s[0], pre_Ctrl, r=1, p=1)
            cmds.parent(Ctrl_s05_s[0], pre_Ctrl, r=1, p=1)

            cmds.delete(Ctrl_s01[0], Ctrl_s02[0], Ctrl_s03[0], Ctrl_s04[0], Ctrl_s05[0])

        # ------------------------------------------------------------------------Shape_Text

        elif self.ctrl_type == 'Vis':
            pre_Ctrl = cmds.createNode('transform')
            Text = cmds.textCurves(ch=0, f="Times New Roman", t='VIS')[0]
            Find = cmds.listRelatives(Text, children=True, type='transform')
            for t in Find:
                Find_01 = cmds.listRelatives(t, c=1, type='transform')[0]
                Find_s = cmds.listRelatives(Find_01, s=1, type='shape')[0]

                cmds.parent(Find_s, pre_Ctrl, r=1, p=1)
            cmds.delete(Text)
        else:
            pre_Ctrl = cmds.circle(nr=[0, 1, 0])[0]
        # ------------------------------------------------------------------------Ctrl_Normal
        lst_cv_Ctrl = cmds.ls(pre_Ctrl + '.cv[*]', fl=1)
        if self.Normal == 'X':
            cmds.rotate(0, 0, 90, lst_cv_Ctrl, r=1, os=1)
        elif self.Normal == 'Y':
            cmds.rotate(0, 90, 0, lst_cv_Ctrl, r=1, os=1)
        elif self.Normal == 'Z':
            cmds.rotate(90, 0, 0, lst_cv_Ctrl, r=1, os=1)
        else:
            pass

        Ctrl = pre_Ctrl
        # ---------------------------------------------------------------------------reName
        rn = cmds.rename(Ctrl, nameSet)

        Find_rn_s = cmds.listRelatives(rn, s=1, type='shape')

        for x in range(0, len(Find_rn_s)):
            num = x + 1

            cmds.rename(Find_rn_s[x], nameSet + 'Shape' + str(num))

        self.Ctrl = rn


class c_freeze():
    def __init__(self, lst_Select, trans_bool, rotate_bool, scale_bool):
        self.lst_Select = lst_Select
        self.trans_bool = trans_bool
        self.rotate_bool = rotate_bool
        self.scale_bool = scale_bool

        for x in self.lst_Select:
            if self.trans_bool == 1:
                cmds.makeIdentity(x, apply=True, translate=True)
            else:
                pass

            if self.rotate_bool == 1:
                cmds.makeIdentity(x, apply=True, rotate=True)
            else:
                pass

            if self.scale_bool == 1:
                cmds.makeIdentity(x, apply=True, scale=True)
            else:
                pass


class c_cluster():
    def __init__(self, lst_Select, selHandle_bool):
        self.lst_Select = lst_Select
        self.selHandle_bool = selHandle_bool

        split = self.lst_Select[0].split('.')
        Geo = cmds.listRelatives(split[0], path =1 )[0]

        print ('Geo>>>', Geo)

        Cls = cmds.cluster(self.lst_Select, n='Cls_' + Geo)

        if self.selHandle_bool == 1:
            cmds.setAttr(Cls[1] + '.displayHandle', 1)
        else:
            pass


class c_insert_joint():
    def __init__(self, lst_Select, normal, count):
        self.lst_Select = lst_Select
        self.normal = normal
        self.count = count

        lst_Jnt = []
        list = []

        for x in lst_Select:
            if cmds.objectType(x) == 'joint':
                lst_Jnt.append(x)
            else:
                pass

        for i, x in enumerate(lst_Jnt):
            c = cmds.listRelatives(x, c=1, type='joint')

            self.normal_set(c[0], self.normal)
            rg = cmds.getAttr(c[0] + self.GetAttr)

            div = rg / (self.count + 1)

            ins_list = []

            for y in range(0, self.count):
                ins_Jnt = cmds.insertJoint(x)
                ins_list.append(ins_Jnt)

                for z in range(0, len(ins_list)):
                    cmds.setAttr(ins_list[z] + self.GetAttr, div)
                    cmds.setAttr(c[0] + self.GetAttr, div)

    def normal_set(self, target, normal):
        self.target = target
        self.normal = normal
        if self.normal == 'X':
            self.GetAttr = '.translateX'
        elif self.normal == 'Y':
            self.GetAttr = '.translateY'
        elif self.normal == 'Z':
            self.GetAttr = '.translateZ'
        elif self.normal == 'Auto':
            lst_range = []

            GetX = cmds.getAttr(self.target + '.translateX')
            GetY = cmds.getAttr(self.target + '.translateY')
            GetZ = cmds.getAttr(self.target + '.translateZ')

            lst_range.append(GetX)
            lst_range.append(GetY)
            lst_range.append(GetZ)

            value = max(lst_range)

            if value == GetX:
                self.GetAttr = '.translateX'
            elif value == GetY:
                self.GetAttr = '.translateY'
            else:
                self.GetAttr = '.translateZ'


class c_create_Jnt():
    def __init__(self, lst_Select, Name, AimVector, UpVector, ObjVector, ObjRot_Target):
        Axis = ['X', 'Y', 'Z']
        self.Name = Name
        self.lst_Select = lst_Select
        self.AimVector = AimVector
        self.UpVector = UpVector
        self.ObjVector = ObjVector
        self.ObjRot_Target = ObjRot_Target

        self.lst = []

        pre_list = []
        for x in range(0, len(self.lst_Select)):
            name_split = self.lst_Select[x].split('_')
            if 'loc' == name_split[0]:
                del name_split[0]
            elif 'Guide' == name_split[0]:
                del name_split[0]
            else:
                pass
            if self.Name == '':
                pass
            else:
                name_split.insert(0, self.Name)
            name_split.insert(0, 'Jnt')
            Rename = "_".join(name_split)

            cmds.select(cl=1)
            Jnt = cmds.joint(n=Rename)
            cmds.setAttr(Jnt + '.displayLocalAxis', 1)

            Tr = cmds.createNode('transform', n='grp_' + Jnt)
            cmds.parent(Jnt, Tr)

            Pos = cmds.xform(lst_Select[x], ws=1, q=1, t=1)
            cmds.xform(Tr, ws=1, t=Pos)

            self.lst.append(Jnt)

        join_list = "_".join(self.lst)

        if 'Ankle' in join_list:
            Fix_list = [x for x in self.lst if 'Ankle' in x]

            Fix_index = self.lst.index(Fix_list[0])
            for x in range(0, Fix_index + 1):
                p = cmds.listRelatives(self.lst[x], p=1, type='transform')[0]

                if x == Fix_index:

                    pos_r = cmds.xform(self.lst[x - 1], q=1, ro=1, ws=1)
                    cmds.xform(p, ws=1, ro=pos_r)
                else:
                    Aim = cmds.aimConstraint(self.lst[x + 1], p, weight=1, aim=self.AimVector, u=self.UpVector,
                                             wu=self.ObjVector, wuo=self.ObjRot_Target, wut='objectrotation', mo=0)
                    cmds.delete(Aim[0])
                cmds.parent(self.lst[x], w=1)
                cmds.delete(p)

            for x in range(Fix_index + 1, len(self.lst)):
                p = cmds.listRelatives(self.lst[x], p=1, type='transform')[0]

                if x == len(self.lst) - 1:

                    pos_r = cmds.xform(self.lst[x - 1], q=1, ro=1, ws=1)
                    cmds.xform(p, ws=1, ro=pos_r)
                else:
                    Aim = cmds.aimConstraint(self.lst[x + 1], p, weight=1, aim=(0, 0, 1), u=(0, 1, 0), wu=(0, 1, 0),
                                             wuo=self.ObjRot_Target, wut='objectrotation', mo=0)
                    cmds.delete(Aim[0])
                cmds.parent(self.lst[x], w=1)
                cmds.delete(p)

            for x in range(0, len(self.lst[x])):
                try:
                    cmds.parent(self.lst[x + 1], self.lst[x])
                except:
                    pass



        else:
            for x in range(0, len(self.lst)):
                p = cmds.listRelatives(self.lst[x], p=1, type='transform')[0]

                if x == len(self.lst) - 1:

                    pos_r = cmds.xform(self.lst[x - 1], q=1, ro=1, ws=1)
                    cmds.xform(p, ws=1, ro=pos_r)
                else:

                    Aim = cmds.aimConstraint(self.lst[x + 1], p, weight=1, aim=self.AimVector, u=self.UpVector,
                                             wu=self.ObjVector, wuo=self.ObjRot_Target, wut='objectrotation',
                                             mo=0)
                    cmds.delete(Aim[0])

                cmds.parent(self.lst[x], w=1)
                cmds.delete(p)

            for x in range(0, len(self.lst)):
                try:
                    cmds.parent(self.lst[x + 1], self.lst[x])
                except:
                    pass


class c_coloring():
    def __init__(self, lst_Select, shape_bool, Color):
        self.lst_Select = lst_Select
        self.Color = Color
        self.shape_bool = shape_bool

        for x in self.lst_Select:
            if self.shape_bool == 1:
                target = cmds.listRelatives(x, s=1, type='shape')[0]
            else:
                target = x

            cmds.setAttr(target + '.overrideEnabled', 1)
            if self.Color < 1.0:
                cmds.setAttr(target + '.overrideRGBColors', 1)
                cmds.setAttr(target + '.drawOverride.overrideColorRGB.overrideColorR', self.Color)
                cmds.setAttr(target + '.drawOverride.overrideColorRGB.overrideColorG', self.Color)
                cmds.setAttr(target + '.drawOverride.overrideColorRGB.overrideColorB', self.Color)
            else:
                cmds.setAttr(target + '.overrideRGBColors', 0)
                cmds.setAttr(target + '.overrideColor', self.Color)

        # b = 1.000
        # g75 = 0.171
        # g50 = 0.341
        # w = 16.000

        # blue = 6.000
        # violet = 9.000
        # cyan = 18.000
        # yellos = 17.000
        # red = 13.000
        # navy = 5.000
        # charcoal = 2.000
        # brown = 4
        # dark_green = 7.000
        # indigo = 8
        # forestGreen = 10
        # Ebony_brown = 11
        # Marron_glace = 12
        # Oregano_green = 14
        # electric_blue = 15


class c_copy_paste_keyframe():
    def __init__(self, copy_target, paste_target, copy_start_frame, copy_end_frame, frame_offset):
        self.copy_end_frame = copy_end_frame
        self.copy_start_frame = copy_start_frame
        self.copy_target = copy_target
        self.paste_target = paste_target
        self.frame_offset = int(frame_offset)

        cp = cmds.copyKey(self.copy_target, t=(self.copy_start_frame, self.copy_end_frame))
        cmds.pasteKey(paste_target, to=self.frame_offset)


class c_JntFoli():
    def __init__(self, lst_Select, normal, size):
        self.lst_Select = lst_Select
        self.normal = normal
        self.size = size

        self.lst_Foli = []
        self.lst_PN = []

        if self.normal == 'X':
            nor_lst = [1, 0, 0]
        elif self.normal == 'Y':
            nor_lst = [0, 1, 0]
        else:
            nor_lst = [0, 0, 1]

        for x in lst_Select:
            PN = cmds.polyPlane(ax=nor_lst, n='PN_Foli_' + x, sx=1, sy=1, w=self.size, h=self.size)

            pos_t = cmds.xform(x, ws=1, t=1, q=1)
            pos_r = cmds.xform(x, ws=1, ro=1, q=1)

            cmds.xform(PN[0], ws=1, t=pos_t)
            cmds.xform(PN[0], ws=1, ro=pos_r)

            Foli = cmds.createNode('follicle', n='Foli_' + x + 'Shape')

            Tf = cmds.listRelatives(Foli, ap=1, type='transform')
            PN_shp = cmds.listRelatives(PN[0], s=1, type='mesh')

            cmds.connectAttr(Foli + '.outTranslate', Tf[0] + '.translate', f=1)
            cmds.connectAttr(Foli + '.outRotate', Tf[0] + '.rotate', f=1)

            cmds.connectAttr(PN_shp[0] + '.outMesh', Foli + '.inputMesh')
            cmds.connectAttr(PN_shp[0] + '.worldMatrix[0]', Foli + '.inputWorldMatrix')

            cmds.setAttr(Foli + '.parameterU', 0.5)
            cmds.setAttr(Foli + '.parameterV', 0.5)

            grp = cmds.listRelatives(x, p=1, type='transform')
            prime = cmds.listRelatives(grp, p=1, type='transform')

            try:
                cmds.parentConstraint(Tf[0], grp, mo=1)
            except:
                pass

            self.lst_PN.append(PN[0])
            self.lst_Foli.append(Tf[0])

        g_Foli = cmds.group(self.lst_Foli, n='grp_All_Foli_' + lst_Select[0])
        g_PN = cmds.group(self.lst_PN, n='grp_All_PN_' + lst_Select[0])


class c_CFME():
    def __init__(self, name, parameter):
        self.name = name
        self.parameter = parameter
        self.sel = cmds.ls(sl=1, fl=1)

        print (self.sel)
        split_fl = self.sel[0].split(".")
        pre_num = re.findall(r'\d+', split_fl[-1])[0]
        Tobj = cmds.listRelatives(split_fl[0], s=1, type='mesh')[0]

        num = float(pre_num)

        MD = cmds.createNode('multiplyDivide', n='MD_index_' + self.name)
        CFME = cmds.createNode('curveFromMeshEdge', n='CFME_' + self.name)
        POCIF = cmds.createNode('pointOnCurveInfo', n='POCIF_' + self.name)
        Loc = cmds.spaceLocator(n='locPOCIF_' + self.name)

        cmds.connectAttr(MD + '.outputX', CFME + '.edgeIndex[0]', f=1)
        cmds.connectAttr(Tobj + '.worldMesh[0]', CFME + '.inputMesh', f=1)
        cmds.connectAttr(CFME + '.outputCurve', POCIF + '.inputCurve', f=1)
        cmds.connectAttr(POCIF + '.position', Loc[0] + '.translate', f=1)

        cmds.setAttr(MD + '.input1X', num)
        cmds.setAttr(POCIF + '.turnOnPercentage', 1)
        cmds.setAttr(POCIF + '.parameter', self.parameter)


class c_rivet():
    def __init__(self):
        self.list = []

        def chunker(lst, value):
            return (lst[x:x + value] for x in xrange(0, len(lst), value))

        self.sel = cmds.ls(sl=1, fl=1, tr=0)

        pre_Geo = self.sel[0].split(".")
        pre_GeoShape = cmds.listRelatives(pre_Geo[0], s=1)

        Geo = pre_GeoShape[0]

        Geo_list = cmds.ls(Geo + '*', s=1)
        Geo_Check = "_".join(Geo_list)

        if 'Orig' in Geo_Check:
            Orig_list = [x for x in Geo_list if 'Orig' in x]
            GeoOrig = Orig_list[0]
        else:
            du = cmds.duplicate(Geo)
            du_Shape = cmds.listRelatives(du, s=1)

            cmds.parent(du_Shape[0], pre_Geo[0], r=1, s=1)
            cmds.delete(du)

            GeoOrig = cmds.rename(du_Shape[0], Geo + '_Orig')
            cmds.setAttr(GeoOrig + '.intermediateObject', 1)

        cmds.select(cl=1)

        UVpin = cmds.createNode('uvPin', n='Uvp_' + Geo)
        cmds.connectAttr(Geo + '.worldMesh[0]', UVpin + '.deformedGeometry', f=1)
        cmds.connectAttr(GeoOrig + '.worldMesh[0]', UVpin + '.originalGeometry', f=1)

        for Num, x in enumerate(self.sel):

            cmds.select(x)
            POS_fl = cmds.ls(sl=1, fl=1)
            POS = cmds.xform(POS_fl[0], q=1, t=1, ws=1)
            split = x.split(".")

            facePOS = []
            POS_loc = cmds.spaceLocator(n='locUVpos_' + split[0])[0]
            UVpin_loc = cmds.spaceLocator(n='locUVpin_' + split[0])[0]

            if "f" in split[1]:
                list = []
                for num, y in enumerate(chunker(POS, 3)):
                    loc = cmds.spaceLocator(n='prefix_' + split[0] + '_' + str(num + 1))

                    cmds.xform(loc[0], t=y, ws=1)
                    list.append(loc[0])

                cons_P = cmds.pointConstraint(list, POS_loc, mo=0)
                cmds.delete(cons_P, list)

            elif "vtx" in split[1]:

                cmds.xform(POS_loc, t=POS, ws=1)
            de = cmds.createNode('decomposeMatrix', n='prefix_DPmtx_' + POS_loc)
            Node = cmds.createNode('closestPointOnMesh', n='prefix_NPOC_' + POS_loc)

            cmds.connectAttr(Geo + '.worldMesh[0]', Node + '.inMesh', f=1)
            cmds.connectAttr(Geo + '.worldMatrix[0]', Node + '.inputMatrix', f=1)
            cmds.connectAttr(de + '.outputTranslate', Node + '.inPosition', f=1)
            cmds.connectAttr(POS_loc + '.worldMatrix[0]', de + '.inputMatrix', f=1)

            getU = cmds.getAttr(Node + '.parameterU')
            getV = cmds.getAttr(Node + '.parameterV')

            cmds.delete(de, Node, POS_loc)

            # cmds.addAttr(UVpin_loc , longName = 'normal_Axis', at = 'enum' , k =1 , en = 'X:Y:Z:-X:-Y:-Z' )
            # cmds.addAttr(UVpin_loc, longName='tangent_Axis', at='enum', k=1, en='X:Y:Z:-X:-Y:-Z')

            cmds.addAttr(UVpin_loc, longName='coordinateU', defaultValue=0, keyable=True)
            cmds.addAttr(UVpin_loc, longName='coordinateV', defaultValue=0, keyable=True)

            cmds.setAttr(UVpin_loc + '.coordinateU', getU)
            cmds.setAttr(UVpin_loc + '.coordinateV', getV)
            # cmds.setAttr(UVpin_loc + '.normal_Axis', 0)
            # cmds.setAttr(UVpin_loc + '.tangent_Axis', 1)

            cmds.connectAttr(UVpin_loc + '.coordinateU', UVpin + '.coordinate[{0}].coordinateU'.format(Num), f=1)
            cmds.connectAttr(UVpin_loc + '.coordinateV', UVpin + '.coordinate[{0}].coordinateV'.format(Num), f=1)

            # cmds.setAttr(UVpin + '.coordinate[{0}].coordinateU'.format(Num), getU)
            # cmds.setAttr(UVpin + '.coordinate[{0}].coordinateV'.format(Num), getV)

            cmds.connectAttr(UVpin + '.outputMatrix[{0}]'.format(Num), UVpin_loc + '.offsetParentMatrix', f=1)

            self.list.append(UVpin_loc)


class c_muti_scale():
    def __init__(self, Target_Start, Target_End, lst_Select, Transform):
        self.Target_Start = Target_Start
        self.Target_End = Target_End
        self.lst_Select = lst_Select
        self.Transform = Transform
        Axis = ['X', 'Y', 'Z']
        sAxis = ['x', 'y', 'z']

        total = 1.0
        Div = total / (len(self.lst_Select) - 1)

        for x in range(0, len(self.lst_Select)):
            Value = Div * x
            r_Value = 1.0 - Value
            try:
                if self.Transform == 1:
                    Target = cmds.listRelatives(self.lst_Select[x], p=1, type='transform')[0]
                else:
                    Target = self.lst_Select[x]
            except:
                Target = self.lst_Select[x]

            if x == 0:
                for y in range(0, len(Axis)):
                    cmds.connectAttr(self.Target_Start + '.scale' + Axis[y], Target + '.scale' + Axis[y],f=1)
            elif x == len(self.lst_Select) - 1:
                for y in range(0, len(Axis)):
                    cmds.connectAttr(self.Target_End + '.scale' + Axis[y], Target + '.scale' + Axis[y],f=1)
            else:
                MD_S = cmds.createNode('multiplyDivide', n='MD_ScaleVulue_' + self.Target_Start + str(x))
                MD_E = cmds.createNode('multiplyDivide', n='MD_ScaleVulue_' + self.Target_End + str(x))
                PM_Sum = cmds.createNode('plusMinusAverage',
                                         n='PM_ScaleSum_' + self.Target_Start + '_' + self.Target_End + str(x))

                for y in range(0, len(Axis)):
                    cmds.setAttr(MD_S + '.input2' + Axis[y], r_Value)
                    cmds.setAttr(MD_E + '.input2' + Axis[y], Value)

                    cmds.connectAttr(self.Target_Start + '.scale' + Axis[y], MD_S + '.input1' + Axis[y], f=1)
                    cmds.connectAttr(self.Target_End + '.scale' + Axis[y], MD_E + '.input1' + Axis[y], f=1)

                    cmds.connectAttr(MD_S + '.output' + Axis[y], PM_Sum + '.input3D[0].input3D' + sAxis[y], f=1)
                    cmds.connectAttr(MD_E + '.output' + Axis[y], PM_Sum + '.input3D[1].input3D' + sAxis[y], f=1)

                    cmds.connectAttr(PM_Sum + '.output3D' + sAxis[y], Target + '.scale' + Axis[y], f=1)


class c_JntBend():
    def __init__(self, Target_Crv, Name, JntCount, AimVector, UpVector, ObjVector, ObjRot_Target, Drt):
        self.Drt = Drt
        self.Axis = ['X', 'Y', 'Z']
        self.sAxis = ['x', 'y', 'z']
        self.Name = Name
        self.JntCount = JntCount
        self.Target_Crv = Target_Crv
        self.AimVector = AimVector
        self.UpVector = UpVector
        self.ObjVector = ObjVector
        self.ObjRot_Target = ObjRot_Target
        grp_lst = ["_Grp", "_GG", "_Prime", "_Grp_Prime"]

        if self.AimVector == (1,0,0):
            skip = 'x'
        elif self.AimVector == (0,1,0):
            skip = 'y'
        else:
            skip = 'z'

        pre_Crv_Base = cmds.duplicate(self.Target_Crv, n='Crv_Staric_{}'.format(self.Name))
        Kp0_Crv = cmds.rebuildCurve(pre_Crv_Base[0], ch=1, d=3, s=self.JntCount - 1, rpo=1, end=1, kr=0, kt=0, kcp=0,
                                    kep=1)
        list_cv = cmds.ls(Kp0_Crv[0] + '.cv[*]', fl=1)
        cmds.delete(list_cv[1], list_cv[-2])
        Crv_Base = cmds.rebuildCurve(Kp0_Crv, ch=1, d=3, s=self.JntCount - 1, rpo=1, end=1, kr=0, kt=0, kcp=1, kep=1)

        Crv_ArcBend = cmds.duplicate(Crv_Base, n='Crv_ArcBend_{}'.format(self.Name))
        Crv_Volume = cmds.rename(self.Target_Crv, 'Crv_Volume_{}'.format(self.Name))

        Fs_Crv_Base = cmds.listRelatives(Crv_Base, s=1, type='shape')[0]
        Fs_Crv_ArcBend = cmds.listRelatives(Crv_ArcBend, s=1, type='shape')[0]
        Fs_Crv_Volume = cmds.listRelatives(Crv_Volume, s=1, type='shape')[0]

        F_POCIF = cmds.createNode('pointOnCurveInfo', n='POCIF_FrontPOS_{}'.format(self.Name))
        B_POCIF = cmds.createNode('pointOnCurveInfo', n='POCIF_BackPOS_{}'.format(self.Name))

        F_POCIF_TGT = cmds.spaceLocator(n='locPOS_Front_{}'.format(self.Name))
        B_POCIF_TGT = cmds.spaceLocator(n='locPOS_Back_{}'.format(self.Name))

        cmds.connectAttr(Fs_Crv_Volume + '.worldSpace', F_POCIF + '.inputCurve', f=1)
        cmds.connectAttr(Fs_Crv_Volume + '.worldSpace', B_POCIF + '.inputCurve', f=1)

        cmds.connectAttr(F_POCIF + '.position', F_POCIF_TGT[0] + '.translate', f=1)
        cmds.connectAttr(B_POCIF + '.position', B_POCIF_TGT[0] + '.translate', f=1)

        cmds.setAttr(F_POCIF + '.parameter', 0)
        cmds.setAttr(B_POCIF + '.parameter', 1)

        cmds.setAttr(F_POCIF + '.turnOnPercentage', 1)
        cmds.setAttr(B_POCIF + '.turnOnPercentage', 1)

        Get_F_POS = cmds.xform(F_POCIF_TGT[0], q=1, ws=1, t=1)
        Get_B_POS = cmds.xform(B_POCIF_TGT[0], q=1, ws=1, t=1)
        cmds.delete(F_POCIF, B_POCIF)
        cmds.xform(F_POCIF_TGT[0], ws=1, t=Get_F_POS)
        cmds.xform(B_POCIF_TGT[0], ws=1, t=Get_B_POS)

        cmds.setAttr(F_POCIF_TGT[0] + '.visibility', 0)
        cmds.setAttr(B_POCIF_TGT[0] + '.visibility', 0)

        cmds.setAttr(Crv_Volume + '.visibility', 0)
        # cmds.setAttr(Crv_Base + '.visibility', 0)
        # ---------------------------------------------------------------------------------------------

        self.grp_nonStaric = cmds.createNode('transform', n='locStaric_' + self.Name)
        self.grp_loc_Setting = cmds.createNode('transform', n='Setting_loc_' + self.Name)
        self.grp_Jnt_Setting = cmds.createNode('transform', n='Setting_Jnt_' + self.Name)
        self.grp_nonParent = cmds.createNode('transform', n='nonParent_' + self.Name)
        self.grp_Setting = cmds.createNode('transform', n='Setting_Arc_' + self.Name)

        list_locNPOC = []
        list_locPOCIF = []
        list_locPoint = []
        list_locPrePoint = []
        list_locResult = []

        self.list_Jnt = []
        list_JntTwist = []

        total = 1.0
        Div = total / (self.JntCount - 1)

        for x in range(0, self.JntCount):
            Value = Div * x
            r_Value = 1.0 - Value

            cmds.select(cl=1)
            Jnt = cmds.joint(n='JntArc_{}'.format(self.Name + str(x + 1)))
            cmds.select(cl=1)
            JntTwist = cmds.joint(n='JntTwist_{}'.format(self.Name + str(x + 1)))

            locNPOC = cmds.spaceLocator(n='locNPOC_StaricPOS_{}'.format(self.Name + str(x + 1)))
            locPOCIF = cmds.spaceLocator(n='locPOCIF_{}'.format(self.Name + str(x + 1)))
            locPoint = cmds.spaceLocator(n='locPoint_{}'.format(self.Name + str(x + 1)))
            locPrePoint = cmds.spaceLocator(n='locPrePoint_{}'.format(self.Name + str(x + 1)))
            locResult = cmds.spaceLocator(n='loc_rs_Arc_{}'.format(self.Name + str(x + 1)))

            DPM = cmds.createNode('decomposeMatrix', n='DPM_StaricPOS_{}'.format(self.Name + str(x + 1)))
            NPOC = cmds.createNode('nearestPointOnCurve', n='NPOC_StaricPOS_{}'.format(self.Name + str(x + 1)))
            POCIF = cmds.createNode('pointOnCurveInfo', n='POCIF_ArcBend_{}'.format(self.Name + str(x + 1)))

            cmds.connectAttr(locNPOC[0] + '.worldMatrix[0]', DPM + '.inputMatrix', f=1)
            cmds.connectAttr(DPM + '.outputTranslate', NPOC + '.inPosition', f=1)
            cmds.connectAttr(Fs_Crv_Base + '.worldSpace', NPOC + '.inputCurve', f=1)
            cmds.connectAttr(Fs_Crv_ArcBend + '.worldSpace', POCIF + '.inputCurve', f=1)
            cmds.connectAttr(NPOC + '.parameter', POCIF + '.parameter', f=1)
            cmds.connectAttr(POCIF + '.position', locPOCIF[0] + '.translate', f=1)

            cmds.setAttr(POCIF + '.turnOnPercentage', 1)
            cmds.setAttr(locNPOC[0] + '.visibility', 0)
            CP01 = cmds.pointConstraint(F_POCIF_TGT[0], B_POCIF_TGT[0], locNPOC[0], mo=0)
            # CP02 = cmds.pointConstraint(F_POCIF_TGT[0], B_POCIF_TGT[0], locPoint[0], mo=0)
            cmds.tangentConstraint(Crv_ArcBend, locPOCIF[0], aim=self.AimVector, u=self.UpVector, wut='objectrotation',
                                   wu=self.ObjVector,
                                   wuo=self.ObjRot_Target)

            cmds.setAttr(CP01[0] + '.{}W0'.format(F_POCIF_TGT[0]), r_Value)
            cmds.setAttr(CP01[0] + '.{}W1'.format(B_POCIF_TGT[0]), Value)
            # cmds.setAttr(CP02[0] + '.{}W0'.format(F_POCIF_TGT[0]), Value)
            # cmds.setAttr(CP02[0] + '.{}W1'.format(B_POCIF_TGT[0]), r_Value)

            cmds.parent(locNPOC[0], locPOCIF[0], self.grp_nonStaric)
            cmds.parent(locPrePoint[0], locPoint[0], self.grp_loc_Setting)

            cmds.delete(CP01[0])

            list_locPOCIF.append(locPOCIF[0])
            list_locNPOC.append(locNPOC[0])
            list_locPoint.append(locPoint[0])
            list_locPrePoint.append(locPrePoint[0])
            list_locResult.append(locResult[0])
            self.list_Jnt.append(Jnt)
            list_JntTwist.append(JntTwist)

        self.Start = cmds.spaceLocator(n='locStart_' + self.Name)
        self.Middle = cmds.spaceLocator(n='locMiddle_' + self.Name)
        self.End = cmds.spaceLocator(n='locEnd_' + self.Name)

        c_arrange_item(F_POCIF_TGT[0], self.Start[0], 0, 0, 0, 1)
        c_arrange_item(B_POCIF_TGT[0], self.End[0], 0, 0, 0, 1)
        c_arrange_item(F_POCIF_TGT[0], self.Middle[0], 0, 1, 0, 0)

        self.Start_grp = c_grouping([self.Start[0]], 0, 3, grp_lst, self.Drt)
        self.Middle_grp = c_grouping([self.Middle[0]], 0, 3, grp_lst, self.Drt)
        self.End_grp = c_grouping([self.End[0]], 0, 3, grp_lst, self.Drt)

        cmds.pointConstraint(F_POCIF_TGT[0], B_POCIF_TGT[0], self.Middle_grp.Dic[self.Middle[0]][-1], mo=0)
        cmds.parentConstraint(list(self.Start_grp.Dic.keys())[0], F_POCIF_TGT[0], mo=1)
        cmds.parentConstraint(list(self.End_grp.Dic.keys())[0], B_POCIF_TGT[0], mo=1)
        Aim_CP = cmds.aimConstraint(list(self.End_grp.Dic.keys())[0], self.Middle_grp.Dic[self.Middle[0]][-2],
                                    aim=self.AimVector,
                                    u=self.UpVector, wu=self.ObjVector, wut="objectrotation",
                                    wuo=list(self.Start_grp.Dic.keys())[0],
                                    mo=1)

        for x in range(0, len(self.Axis)):
            cmds.setAttr(Aim_CP[0] + '.offset' + self.Axis[x], 0)

        for x in range(0, len(list_locPoint)):
            DPM = cmds.createNode('decomposeMatrix', n='DPM_PointPOS_{}'.format(self.Name + str(x + 1)))
            Fs_Point = cmds.listRelatives(list_locPoint[x], s=1, type='shape')

            c_arrange_item(list_locPOCIF[x], list_locPoint[x], 0, 0, 0, 1)
            cmds.connectAttr(list_locPoint[x] + '.worldMatrix[0]', DPM + '.inputMatrix', f=1)
            cmds.connectAttr(DPM + '.outputTranslate', Fs_Crv_ArcBend + '.controlPoints[{}]'.format(x), f=1)

        J_total = len(list_locPrePoint)
        if J_total % 2 == 0:

            J_Div = (len(list_locPrePoint) / 2)
            Div = total / (J_Div)
            lst = []
            r_lst = []
            for x in range(0, len(list_locPrePoint)):
                if x < J_Div:
                    lst.append(list_locPrePoint[x])
                else:
                    r_lst.append(list_locPrePoint[x])

            r_lst.reverse()

            for x in range(0, len(lst)):
                if x == 0:
                    Value = 0
                elif x == len(lst) - 1:
                    Value = 1
                Val = Div * x
                r_Value = 1.0 - Val
                PO = cmds.pointConstraint(list(self.Start_grp.Dic.keys())[0], list(self.Middle_grp.Dic.keys())[0],
                                          lst[x], mo=0)

                cmds.setAttr(PO[0] + '.' + list(self.Start_grp.Dic.keys())[0] + 'W0', r_Value)
                cmds.setAttr(PO[0] + '.' + list(self.Middle_grp.Dic.keys())[0] + 'W1', Value)

                MD_S = cmds.createNode('multiplyDivide',
                                       n='MD_ScaleVulue_' + list(self.Start_grp.Dic.keys())[0] + str(x))
                MD_E = cmds.createNode('multiplyDivide',
                                       n='MD_ScaleVulue_' + list(self.Middle_grp.Dic.keys())[0] + str(x))
                PM_Sum = cmds.createNode('plusMinusAverage',
                                         n='PM_ScaleSum_' + list(self.Start_grp.Dic.keys())[0] + '_' +
                                           list(self.Middle_grp.Dic.keys())[0] + str(x))

                for y in range(0, len(self.Axis)):
                    cmds.setAttr(MD_S + '.input2' + self.Axis[y], r_Value)
                    cmds.setAttr(MD_E + '.input2' + self.Axis[y], Val)

                    cmds.connectAttr(list(self.Start_grp.Dic.keys())[0] + '.scale' + self.Axis[y],
                                     MD_S + '.input1' + self.Axis[y], f=1)
                    cmds.connectAttr(list(self.Middle_grp.Dic.keys())[0] + '.scale' + self.Axis[y],
                                     MD_E + '.input1' + self.Axis[y], f=1)

                    cmds.connectAttr(MD_S + '.output' + self.Axis[y], PM_Sum + '.input3D[0].input3D' + self.sAxis[y],
                                     f=1)
                    cmds.connectAttr(MD_E + '.output' + self.Axis[y], PM_Sum + '.input3D[1].input3D' + self.sAxis[y],
                                     f=1)

                    cmds.connectAttr(PM_Sum + '.output3D' + self.sAxis[y], lst[x] + '.scale' + self.Axis[y], f=1)

            for x in range(0, len(r_lst)):
                if x == 0:
                    Value = 0
                else:
                    Value = 1
                Val = Div * x
                r_Value = 1.0 - Val
                PO = cmds.pointConstraint(list(self.End_grp.Dic.keys())[0], list(self.Middle_grp.Dic.keys())[0],
                                          r_lst[x], mo=0)
                cmds.setAttr(PO[0] + '.' + list(self.End_grp.Dic.keys())[0] + 'W0', r_Value)
                cmds.setAttr(PO[0] + '.' + list(self.Middle_grp.Dic.keys())[0] + 'W1', Value)

                MD_S = cmds.createNode('multiplyDivide', n='MD_ScaleVulue_' + list(self.End_grp.Dic.keys())[0] + str(x))
                MD_E = cmds.createNode('multiplyDivide',
                                       n='MD_ScaleVulue_' + list(self.Middle_grp.Dic.keys())[0] + str(x))
                PM_Sum = cmds.createNode('plusMinusAverage', n='PM_ScaleSum_' + list(self.End_grp.Dic.keys())[0] + '_' +
                                                               list(self.Middle_grp.Dic.keys())[0] + str(x))

                for y in range(0, len(self.Axis)):
                    cmds.setAttr(MD_S + '.input2' + self.Axis[y], r_Value)
                    cmds.setAttr(MD_E + '.input2' + self.Axis[y], Val)

                    cmds.connectAttr(list(self.End_grp.Dic.keys())[0] + '.scale' + self.Axis[y],
                                     MD_S + '.input1' + self.Axis[y], f=1)
                    cmds.connectAttr(list(self.Middle_grp.Dic.keys())[0] + '.scale' + self.Axis[y],
                                     MD_E + '.input1' + self.Axis[y],
                                     f=1)

                    cmds.connectAttr(MD_S + '.output' + self.Axis[y], PM_Sum + '.input3D[0].input3D' + self.sAxis[y],
                                     f=1)
                    cmds.connectAttr(MD_E + '.output' + self.Axis[y], PM_Sum + '.input3D[1].input3D' + self.sAxis[y],
                                     f=1)

                    cmds.connectAttr(PM_Sum + '.output3D' + self.sAxis[y], r_lst[x] + '.scale' + self.Axis[y], f=1)


        else:
            J_Div = (len(list_locPrePoint) / 2)
            Div = total / (J_Div)
            lst = []
            r_lst = []

            for x in range(0, len(list_locPrePoint)):
                if x < J_Div:
                    lst.append(list_locPrePoint[x])
                elif x == J_Div:
                    pass
                else:
                    r_lst.append(list_locPrePoint[x])

            r_lst.reverse()

            for x in range(0, len(lst)):
                if x == 0:
                    Value = 1
                else:
                    Value = 0
                Val = Div * x
                r_Value = 1.0 - Val
                PO = cmds.pointConstraint(list(self.Start_grp.Dic.keys())[0], list(self.Middle_grp.Dic.keys())[0],
                                          lst[x], mo=0)

                cmds.setAttr(PO[0] + '.' + list(self.Start_grp.Dic.keys())[0] + 'W0', r_Value)
                cmds.setAttr(PO[0] + '.' + list(self.Middle_grp.Dic.keys())[0] + 'W1', Value)

                MD_S = cmds.createNode('multiplyDivide', n='MD_ScaleVulue_' + list(self.End_grp.Dic.keys())[0] + str(x))
                MD_E = cmds.createNode('multiplyDivide',
                                       n='MD_ScaleVulue_' + list(self.Middle_grp.Dic.keys())[0] + str(x))
                PM_Sum = cmds.createNode('plusMinusAverage', n='PM_ScaleSum_' + list(self.End_grp.Dic.keys())[0] + '_' +
                                                               list(self.Middle_grp.Dic.keys())[0] + str(x))

                for y in range(0, len(self.Axis)):
                    cmds.setAttr(MD_S + '.input2' + self.Axis[y], r_Value)
                    cmds.setAttr(MD_E + '.input2' + self.Axis[y], Val)

                    cmds.connectAttr(list(self.Start_grp.Dic.keys())[0] + '.scale' + self.Axis[y],
                                     MD_S + '.input1' + self.Axis[y], f=1)
                    cmds.connectAttr(list(self.Middle_grp.Dic.keys())[0] + '.scale' + self.Axis[y],
                                     MD_E + '.input1' + self.Axis[y],
                                     f=1)

                    cmds.connectAttr(MD_S + '.output' + self.Axis[y], PM_Sum + '.input3D[0].input3D' + self.sAxis[y],
                                     f=1)
                    cmds.connectAttr(MD_E + '.output' + self.Axis[y], PM_Sum + '.input3D[1].input3D' + self.sAxis[y],
                                     f=1)

                    cmds.connectAttr(PM_Sum + '.output3D' + self.sAxis[y], lst[x] + '.scale' + self.Axis[y], f=1)

            for x in range(0, len(r_lst)):
                Value = Div * x
                r_Value = 1.0 - Value
                PO = cmds.pointConstraint(list(self.End_grp.Dic.keys())[0], list(self.Middle_grp.Dic.keys())[0],
                                          r_lst[x], mo=0)
                cmds.setAttr(PO[0] + '.' + list(self.End_grp.Dic.keys())[0] + 'W0', r_Value)
                cmds.setAttr(PO[0] + '.' + list(self.Middle_grp.Dic.keys())[0] + 'W1', Value)

                MD_S = cmds.createNode('multiplyDivide', n='MD_ScaleVulue_' + list(self.End_grp.Dic.keys())[0] + str(x))
                MD_E = cmds.createNode('multiplyDivide',
                                       n='MD_ScaleVulue_' + list(self.Middle_grp.Dic.keys())[0] + str(x))
                PM_Sum = cmds.createNode('plusMinusAverage', n='PM_ScaleSum_' + list(self.End_grp.Dic.keys())[0] + '_' +
                                                               list(self.Middle_grp.Dic.keys())[0] + str(x))

                for y in range(0, len(self.Axis)):
                    cmds.setAttr(MD_S + '.input2' + self.Axis[y], r_Value)
                    cmds.setAttr(MD_E + '.input2' + self.Axis[y], Val)

                    cmds.connectAttr(list(self.End_grp.Dic.keys())[0] + '.scale' + self.Axis[y],
                                     MD_S + '.input1' + self.Axis[y], f=1)
                    cmds.connectAttr(list(self.Middle_grp.Dic.keys())[0] + '.scale' + self.Axis[y],
                                     MD_E + '.input1' + self.Axis[y],
                                     f=1)

                    cmds.connectAttr(MD_S + '.output' + self.Axis[y], PM_Sum + '.input3D[0].input3D' + self.sAxis[y],
                                     f=1)
                    cmds.connectAttr(MD_E + '.output' + self.Axis[y], PM_Sum + '.input3D[1].input3D' + self.sAxis[y],
                                     f=1)

                    cmds.connectAttr(PM_Sum + '.output3D' + self.sAxis[y], r_lst[x] + '.scale' + self.Axis[y], f=1)

            cmds.pointConstraint(list(self.Middle_grp.Dic.keys())[0], list_locPrePoint[J_Div], mo=0)
            for y in range(0, len(self.Axis)):
                cmds.connectAttr(list(self.Middle_grp.Dic.keys())[0] + '.scale' + self.Axis[y],
                                 list_locPrePoint[J_Div] + '.scale' + self.Axis[y], f=1)

        self.list_Jnt.sort()
        for x in range(0, len(list_locPoint)):
            CP = cmds.pointConstraint(list_locPrePoint[x], list_locPoint[x], mo=1)
            for y in range(0, len(self.Axis)):
                cmds.setAttr(CP[0] + '.offset' + self.Axis[y], 0)

            pre_grp = cmds.group(self.list_Jnt[x])
            pre_grp01 = cmds.group(list_JntTwist[x])
            c_arrange_item(list_locPoint[x], pre_grp, 1, 1, 0, 0)
            c_arrange_item(list_locPoint[x], pre_grp01, 1, 1, 0, 0)
            cmds.parent(self.list_Jnt[x], w=1)
            cmds.parent(list_JntTwist[x], w=1)
            cmds.delete(pre_grp)
            cmds.delete(pre_grp01)

            c_arrange_item(list_locPoint[x], list_locResult[x], 1, 1, 0, 0)

        self.grp_loc_rs = c_grouping(list_locResult, 1, 3, grp_lst, 0)
        cmds.parent(self.grp_loc_rs.Dic[list_locResult[0]][-1], self.grp_loc_Setting)
        rs_lst = list(self.grp_loc_rs.Dic.keys())
        rs_lst.sort()

        for x in range(0, len(list_locPoint)):
            locTGT = cmds.spaceLocator(n = 'locTGT_' + list_locPOCIF[x] )[0]
            grp_locTGT = cmds.group(locTGT , n =  locTGT + '_Grp')
            c_arrange_item(self.grp_loc_rs.Dic[list_locResult[x]][-1] , grp_locTGT , 1,1,0,0)
            cmds.setAttr(locTGT + '.visibility' , 0)
            cmds.parent(grp_locTGT , list_locPOCIF[x])
            cmds.parentConstraint(locTGT, self.grp_loc_rs.Dic[list_locResult[x]][-1], mo=1 ,sr = skip)

            cmds.parentConstraint(rs_lst[x], self.list_Jnt[x], mo=0)

        for x in range(0, len(self.list_Jnt)):
            try:
                cmds.parent(self.list_Jnt[x + 1], self.list_Jnt[x])
                cmds.parent(list_JntTwist[x + 1], list_JntTwist[x])
            except:
                pass

        cmds.parent(self.list_Jnt[0], list_JntTwist[0], self.grp_Jnt_Setting)

        Fs_F_POCIF_TGT = cmds.listRelatives(F_POCIF_TGT[0], s=1, type='shape')
        Fs_B_POCIF_TGT = cmds.listRelatives(B_POCIF_TGT[0], s=1, type='shape')
        DPM_F_POCIF_TGT = cmds.createNode('decomposeMatrix', n='DPM_{}'.format(F_POCIF_TGT[0]))
        DPM_B_POCIF_TGT = cmds.createNode('decomposeMatrix', n='DPM_{}'.format(B_POCIF_TGT[0]))

        cmds.connectAttr(F_POCIF_TGT[0] + '.worldMatrix[0]', DPM_F_POCIF_TGT + '.inputMatrix', f=1)
        cmds.connectAttr(B_POCIF_TGT[0] + '.worldMatrix[0]', DPM_B_POCIF_TGT + '.inputMatrix', f=1)
        cmds.connectAttr(DPM_F_POCIF_TGT + '.outputTranslate', Fs_Crv_Volume + '.controlPoints[0]', f=1)
        cmds.connectAttr(DPM_B_POCIF_TGT + '.outputTranslate', Fs_Crv_Volume + '.controlPoints[1]', f=1)

        # ----------------------------------------------------------------------------------------------------Volume
        self.ScaleDefault = cmds.spaceLocator(n='self.ScaleDefault_' + self.Name)
        IF_Volume_Crv = cmds.createNode('curveInfo', n='IF_Volume_' + self.Name)
        MD_Volume_Scale = cmds.createNode('multiplyDivide', n='MD_Volume_Scale_' + self.Name)
        MD_Volume = cmds.createNode('multiplyDivide', n='MD_Volume_' + self.Name)
        MD_Volume_Div = cmds.createNode('multiplyDivide', n='MD_Volume_Div_' + self.Name)
        MD_Volume_Power = cmds.createNode('multiplyDivide', n='MD_Volume_Power_' + self.Name)
        BC_Volume = cmds.createNode('blendColors', n='BC_Volume_' + self.Name)

        cmds.addAttr(list(self.Middle_grp.Dic.keys())[0], longName='Volume_sw', defaultValue=0, minValue=0, maxValue=1,
                     keyable=True)
        c_arrange_item(F_POCIF_TGT[0], self.ScaleDefault[0], 0, 0, 0, 1)

        cmds.setAttr(MD_Volume + '.operation', 2)
        cmds.setAttr(MD_Volume_Div + '.operation', 2)
        cmds.setAttr(MD_Volume_Div + '.input1X', 1)
        cmds.setAttr(MD_Volume_Power + '.operation', 3)
        cmds.setAttr(MD_Volume_Power + '.input2X', 0.5)
        cmds.setAttr(BC_Volume + '.color2R', 1)

        cmds.connectAttr(Fs_Crv_Volume + '.worldSpace[0]', IF_Volume_Crv + '.inputCurve', f=1)
        cmds.connectAttr(IF_Volume_Crv + '.arcLength', MD_Volume + '.input1X', f=1)

        get = cmds.getAttr(IF_Volume_Crv + '.arcLength')

        cmds.setAttr(MD_Volume_Scale + '.input1X', get)
        cmds.connectAttr(self.ScaleDefault[0] + '.scaleX', MD_Volume_Scale + '.input2X', f=1)
        cmds.connectAttr(MD_Volume_Scale + '.outputX', MD_Volume + '.input2X', f=1)
        cmds.connectAttr(MD_Volume + '.outputX', MD_Volume_Div + '.input2X', f=1)
        cmds.connectAttr(MD_Volume_Div + '.outputX', MD_Volume_Power + '.input1X', f=1)
        cmds.connectAttr(MD_Volume_Power + '.outputX', BC_Volume + '.color1R', f=1)
        cmds.connectAttr(list(self.Middle_grp.Dic.keys())[0] + '.Volume_sw', BC_Volume + '.blender', f=1)

        for x in range(0, len(list_JntTwist)):
            MDscale = cmds.createNode('multiplyDivide', n='MD_Scale_Sum_' + self.Name + str(x))
            if x == 0:
                pass
            elif x == len(list_JntTwist) - 1:
                pass
            else:
                for y in range(0, len(self.Axis)):
                    cmds.setAttr(MDscale + '.input1' + self.Axis[y], 1)
                    cmds.setAttr(MDscale + '.input2' + self.Axis[y], 1)

                if self.AimVector == (1, 0, 0):
                    cmds.connectAttr(BC_Volume + '.outputR',list(self.grp_loc_rs.Dic.keys())[x] + '.scaleY')
                    cmds.connectAttr(BC_Volume + '.outputR', list(self.grp_loc_rs.Dic.keys())[x] + '.scaleZ')
                elif self.AimVector == (-1, 0, 0):
                    cmds.connectAttr(BC_Volume + '.outputR',list(self.grp_loc_rs.Dic.keys())[x] + '.scaleY')
                    cmds.connectAttr(BC_Volume + '.outputR', list(self.grp_loc_rs.Dic.keys())[x] + '.scaleZ')
                elif self.AimVector == (0, 1, 0):
                    cmds.connectAttr(BC_Volume + '.outputR',list(self.grp_loc_rs.Dic.keys())[x] + '.scaleX')
                    cmds.connectAttr(BC_Volume + '.outputR', list(self.grp_loc_rs.Dic.keys())[x] + '.scaleZ')
                elif self.AimVector == (0, -1, 0):
                    cmds.connectAttr(BC_Volume + '.outputR', list(self.grp_loc_rs.Dic.keys())[x] + '.scaleX')
                    cmds.connectAttr(BC_Volume + '.outputR', list(self.grp_loc_rs.Dic.keys())[x] + '.scaleZ')
                elif self.AimVector == (0,0,1):
                    cmds.connectAttr(BC_Volume + '.outputR',list(self.grp_loc_rs.Dic.keys())[x] + '.scaleX')
                    cmds.connectAttr(BC_Volume + '.outputR', list(self.grp_loc_rs.Dic.keys())[x] + '.scaleY')
                else:
                    cmds.connectAttr(BC_Volume + '.outputR',list(self.grp_loc_rs.Dic.keys())[x] + '.scaleX')
                    cmds.connectAttr(BC_Volume + '.outputR', list(self.grp_loc_rs.Dic.keys())[x] + '.scaleY')
            for y in range(0, len(self.Axis)):
                cmds.connectAttr(list(self.grp_loc_rs.Dic.keys())[x] + '.scale' + self.Axis[y],
                                 MDscale + '.input2' + self.Axis[y], f=1)
                cmds.connectAttr(list_locPrePoint[x] + '.scale' + self.Axis[y], MDscale + '.input1' + self.Axis[y], f=1)

                cmds.connectAttr(MDscale + '.output' + self.Axis[y], self.list_Jnt[x] + '.scale' + self.Axis[y], f=1)

        IK_TV = cmds.ikHandle(n='IKSplineArc_' + self.Name, sj=list_JntTwist[0], c=Crv_Volume, ee=list_JntTwist[-1],
                              sol='ikSplineSolver', ccv=False, pcv=False)

        cmds.setAttr(self.grp_nonParent + '.visibility', 0)
        cmds.setAttr(self.grp_loc_Setting + '.visibility', 0)
        cmds.setAttr(list_JntTwist[0] + '.visibility', 0)

        cmds.parent(F_POCIF_TGT[0], B_POCIF_TGT[0], self.grp_loc_Setting)
        cmds.parent(Crv_Base, Crv_Volume, Crv_ArcBend, self.grp_nonStaric, self.ScaleDefault[0], IK_TV[0],
                    self.grp_nonParent)
        cmds.parent(self.Start_grp.Dic[self.Start[0]][-1], self.Middle_grp.Dic[self.Middle[0]][-1],
                    self.End_grp.Dic[self.End[0]][-1], self.grp_loc_Setting, self.grp_Jnt_Setting, self.grp_Setting)

        # -----------------------------------------------------------------------------------------------------Twist
        cmds.setAttr(IK_TV[0] + '.dTwistControlEnable', 1)
        cmds.setAttr(IK_TV[0] + '.dWorldUpType', 4)
        cmds.connectAttr(list(self.Start_grp.Dic.keys())[0] + '.worldMatrix[0]', IK_TV[0] + '.dWorldUpMatrix', f=1)
        cmds.connectAttr(list(self.End_grp.Dic.keys())[0] + '.worldMatrix[0]', IK_TV[0] + '.dWorldUpMatrixEnd', f=1)

        if self.AimVector == (1, 0, 0):
            cmds.setAttr(IK_TV[0] + '.dForwardAxis', 0)
            skip01 = ["y" , "z"]

        elif self.AimVector == (0, 1, 0):
            cmds.setAttr(IK_TV[0] + '.dForwardAxis', 2)
            skip01 = ["x", "z"]
        elif self.AimVector == (0, 0, 1):
            cmds.setAttr(IK_TV[0] + '.dForwardAxis', 4)
            skip01 = ["x", "y"]
        elif self.AimVector == (-1, 0, 0):
            cmds.setAttr(IK_TV[0] + '.dForwardAxis', 1)
            skip01 = ["y" , "z"]

        elif self.AimVector == (0, -1, 0):
            cmds.setAttr(IK_TV[0] + '.dForwardAxis', 3)
            skip01 = ["x", "z"]
        else:
            cmds.setAttr(IK_TV[0] + '.dForwardAxis', 5)
            skip01 = ["x", "y"]


        if self.UpVector == (1, 0, 0):
            cmds.setAttr(IK_TV[0] + '.dWorldUpAxis', 6)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorX', 1)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorY', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorZ', 0)

            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndX', 1)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndY', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndZ', 0)
        elif self.UpVector == (0, 1, 0):
            cmds.setAttr(IK_TV[0] + '.dWorldUpAxis', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorX', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorY', 1)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorZ', 0)

            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndX', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndY', 1)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndZ', 0)
        elif self.UpVector == (0, 0, 1):
            cmds.setAttr(IK_TV[0] + '.dWorldUpAxis', 3)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorX', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorY', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorZ', 1)

            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndX', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndY', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndZ', 1)
        elif self.UpVector == (-1, 0, 0):
            cmds.setAttr(IK_TV[0] + '.dWorldUpAxis', 7)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorX', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorY', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorZ', 1)

            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndX', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndY', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndZ', 1)
        elif self.UpVector == (0, -1, 0):
            cmds.setAttr(IK_TV[0] + '.dWorldUpAxis', 1)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorX', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorY', 1)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorZ', 0)

            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndX', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndY', 1)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndZ', 0)
        elif self.UpVector == (0, 0, -1):
            cmds.setAttr(IK_TV[0] + '.dWorldUpAxis', 4)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorX', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorY', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorZ', 1)

            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndX', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndY', 0)
            cmds.setAttr(IK_TV[0] + '.dWorldUpVectorEndZ', 1)

        list_T = []
        list_T_Fix =[]
        for x in range(0, len(list_JntTwist)):
            locTwist = cmds.spaceLocator(n='locTwist_{}'.format(self.Name + str(x + 1)))
            grp_locTwist = cmds.createNode('transform', n='grp_' + locTwist[0])
            locTwistFix = cmds.spaceLocator(n='locTwistFix_{}'.format(self.Name + str(x + 1)))
            grp_locTwistFix = cmds.createNode('transform', n='grp_' + locTwistFix[0])

            cmds.parent(locTwist[0] ,grp_locTwist)
            cmds.parent(locTwistFix[0], grp_locTwistFix)
            c_arrange_item(list_JntTwist[x], grp_locTwist, 1, 1, 0, 0)
            c_arrange_item(list_JntTwist[x], grp_locTwistFix, 1, 1, 0, 0)
            cmds.parent(grp_locTwistFix , grp_locTwist , self.grp_loc_Setting)

            cmds.parentConstraint(list_JntTwist[x], locTwist[0], mo=1)

            list_T.append(locTwist[0])
            list_T_Fix.append(locTwistFix[0])

        for x in range(0 ,len(list_T_Fix)):
            try:
                p = cmds.listRelatives(list_T_Fix[x+1] , p = 1 , type = 'transform')[0]
                cmds.parent(p , list_T_Fix[x] )

            except:
                pass

            cmds.orientConstraint(list_T[x] , list_T_Fix[x] , mo =1 ,skip = skip01 )


        for x in range(0, len(list_JntTwist)):
            try:
                for y in range(0, len(self.Axis)):
                    cmds.connectAttr(list_T_Fix[x] + '.rotate' + self.Axis[y],
                                     list(self.grp_loc_rs.Dic.keys())[x] + '.rotate' + self.Axis[y])
            except:
                pass




class c_IK_Arc():
    def __init__(self, lst_Select, Name ,size ,AimVector, UpVector, ObjVector, ObjRot_Target, Drt):
        self.Drt = Drt
        self.size = size
        self.Axis = ['X', 'Y', 'Z']
        self.sAxis = ['x', 'y', 'z']
        self.lst_Select = lst_Select
        self.Name = Name
        self.AimVector = AimVector
        self.UpVector = UpVector
        self.ObjVector = ObjVector
        self.ObjRot_Target = ObjRot_Target
        grp_lst = ["set_", "grp_", "prime_", "grp_prime_"]
        lst_Crv_name = ['Arc','Staric' , 'Default']

        ReName = 'IK_'+ self.Name


        lst_Crv_pos = [(cmds.xform(x, q=1, t=1, ws=1)) for x in self.lst_Select]
        lst_Crv_Base = [(cmds.curve(d=1, p=lst_Crv_pos, n='Crv_' + lst_Crv_name[x] + '_' + Name)) for x in
                        range(0, len(lst_Crv_name))]

        lst_Pre_Crv = [(cmds.rebuildCurve(lst_Crv_Base[x], ch=1, d=3, s=len(self.lst_Select) - 1, rpo=1, end=1, kr=0, kt=0, kcp=0,kep=1)[0]) for x in range(0,len(lst_Crv_name))]

        for x in range(0,len(lst_Pre_Crv)):
            cmds.setAttr(lst_Pre_Crv[x] + '.visibility' , 0)

            lst_Crv_cv = cmds.ls(lst_Pre_Crv[x] + '.cv[*]', fl=1)
            cmds.delete(lst_Crv_cv[1], lst_Crv_cv[-2])

        lst_Crv = [(cmds.rebuildCurve(lst_Pre_Crv[x], ch=1, d=3, s=len(self.lst_Select) - 1, rpo=1, end=1, kr=0, kt=0, kcp=1, kep=1, tol=0)[0])
                   for x in range(0, len(lst_Crv_name))]

        Crv_Arc = lst_Crv[0]
        Crv_Staric = lst_Crv[1]
        Crv_Default = lst_Crv[2]

        self.ScaleDefault = cmds.spaceLocator(n = 'ScaleDefault_' + ReName )[0]

        pre_Shp_Crv_Staric = cmds.listRelatives(Crv_Staric, s=1, type='shape')[0]
        pre_Shp_Crv_Arc = cmds.listRelatives(Crv_Arc, s=1, type='shape')[0]
        pre_Shp_Crv_Default = cmds.listRelatives(Crv_Default, s=1, type='shape')[0]

        Shp_Crv_Staric = cmds.rename(pre_Shp_Crv_Staric, Crv_Staric + 'shape')
        Shp_Crv_Arc = cmds.rename(pre_Shp_Crv_Arc, Crv_Arc + 'shape')
        Shp_Crv_Default = cmds.rename(pre_Shp_Crv_Default, Crv_Default + 'shape')

        cmds.setAttr(Crv_Staric + '.visibility' , 0)

        lst_loc_Point = []

        total = 1.0
        Div = total / (len(self.lst_Select) - 1)


        lst_JntPre = c_create_Jnt(self.lst_Select , 'Pre_' + ReName ,self.AimVector ,self.UpVector , self.ObjVector ,self.ObjRot_Target )

        splineIK = cmds.ikHandle(Crv_Arc, n = 'IKSpline_Pre_' + self.Name, sol = 'ikSplineSolver', ccv = False, pcv = False, sj =lst_JntPre.lst[0], ee = lst_JntPre.lst[-1], c = Crv_Arc)

        if self.AimVector == (1,0,0):
            ShpAxis = 'X'
            VScale1 = 'Y'
            VScale2 = 'Z'
        elif self.AimVector == (-1,0,0):
            ShpAxis = 'X'
            VScale1 = 'Y'
            VScale2 = 'Z'
        elif self.AimVector == (0,1,0):
            ShpAxis = 'Y'
            VScale1 = 'X'
            VScale2 = 'Z'
        elif self.AimVector == (0,-1,0):
            ShpAxis = 'Y'
            VScale1 = 'X'
            VScale2 = 'Z'
        elif self.AimVector == (0,0,1):
            ShpAxis = 'Z'
            VScale1 = 'X'
            VScale2 = 'Y'
        elif self.AimVector == (0,0,-1):
            ShpAxis = 'Z'
            VScale1 = 'X'
            VScale2 = 'Y'
        else:
            ShpAxis = 'X'
            VScale1 = 'Y'
            VScale2 = 'Z'

        if 'root' in self.lst_Select[0]:
            lst_name = ['root' , 'splne' , 'chest']
        else:
            lst_name = [ReName + '1', ReName + '2', ReName + '3']
        self.Start_Ctrl = c_ctrlShape( 'IK_' + lst_name[0] + '_Ctrl', 'Cube', ShpAxis)
        self.Middle_Ctrl = c_ctrlShape('IK_' + lst_name[1]+ '_Ctrl', 'Cube', ShpAxis)
        self.End_Ctrl = c_ctrlShape('IK_'+ lst_name[2]+ '_Ctrl', 'Cube', ShpAxis)

        cmds.addAttr(self.Middle_Ctrl.Ctrl , longName='Stretch_switch', defaultValue=0, minValue=0, maxValue=10, keyable=True)
        cmds.addAttr(self.Middle_Ctrl.Ctrl, longName='Volume_switch', defaultValue=0, minValue=0, maxValue=10, keyable=True)
        cmds.addAttr(self.Middle_Ctrl.Ctrl, longName='Volume_Offset', defaultValue=0, keyable=True)

        cmds.setAttr(self.Middle_Ctrl.Ctrl +'.Volume_Offset' , l =1 , k =0)

        self.grp_Start = c_grouping([self.Start_Ctrl.Ctrl], 0, 4, grp_lst , self.Drt)
        self.grp_Middle = c_grouping([self.Middle_Ctrl.Ctrl], 0, 4, grp_lst , self.Drt)
        self.grp_End = c_grouping([self.End_Ctrl.Ctrl], 0, 4, grp_lst , self.Drt)

        c_arrange_item(self.lst_Select[0] , list(self.grp_Start.Dic.values())[0][-1], 1, 1, 0, 0)
        c_arrange_item(self.lst_Select[-1], list(self.grp_End.Dic.values())[0][-1], 1, 1, 0, 0)
        cmds.pointConstraint(self.Start_Ctrl.Ctrl, self.End_Ctrl.Ctrl , list(self.grp_Middle.Dic.values())[0][-1] , mo = 0)
        cmds.aimConstraint(list(self.grp_End.Dic.keys())[0], list(self.grp_Middle.Dic.values())[0][-1],aim=self.AimVector,u=self.UpVector, wu=self.ObjVector, wut="objectrotation",wuo=list(self.grp_Start.Dic.keys())[0], mo=0)

        MD_Cal = cmds.createNode('multiplyDivide' , n = 'MD_Cal_{}' .format(ReName))
        cmds.setAttr(MD_Cal + '.input2X' , 0.1)
        cmds.setAttr(MD_Cal + '.input2Y', 0.1)
        cmds.connectAttr(self.Middle_Ctrl.Ctrl + '.Stretch_switch' , MD_Cal + '.input1X' ,f =1)
        cmds.connectAttr(self.Middle_Ctrl.Ctrl + '.Volume_switch', MD_Cal + '.input1Y', f=1)

        All_Staric = cmds.createNode('transform' , n = 'All_Staric_{}' .format(ReName))
        All_loc = cmds.createNode('transform', n='All_loc_{}'.format(ReName))
        self.All = cmds.createNode('transform', n='All_Setting_{}'.format(ReName))
        self.nonParent = cmds.createNode('transform', n='nonParent_{}'.format(ReName))

        cv_tgt_list = []
        cv_tgt_list.append(self.Start_Ctrl.Ctrl)
        cv_tgt_list.append(self.Middle_Ctrl.Ctrl)
        cv_tgt_list.append(self.End_Ctrl.Ctrl)

        for x in range(0,len(cv_tgt_list)):
            cv = cmds.ls(cv_tgt_list[x] + '.cv[*]' , fl = 1)
            cmds.select(cv)
            cmds.scale((self.size ), (self.size), (self.size ), r=1, ocp=1)


        lst_POCIF_Staric = []
        lst_POCIF_Default = []
        lst_POCIF_rs = []
        lst_loc_Pre = []
        lst_locresult = []

        for y in range(0, len(self.Axis)):
            cmds.connectAttr(self.End_Ctrl.Ctrl + '.scale' + self.Axis[y], lst_JntPre.lst[-1] + '.scale' + self.Axis[y],
                             f=1)
        for x in range(0, len(self.lst_Select)):
            Value = Div * x
            r_Value = 1.0 - Value
            #-----------------------------------------------------------------------------------point and scale
            locStaric = cmds.spaceLocator(n='locStaric_' + ReName + str(x + 1))
            locPoint = cmds.spaceLocator(n = 'locPoint_' + ReName + str(x + 1))
            locPrePoint = cmds.spaceLocator(n='locPrePoint_' + ReName + str(x + 1))
            locrs = cmds.spaceLocator(n='locresult_' + ReName + str(x + 1))

            cmds.parent(locStaric , All_Staric)
            cmds.select(cl=1)
            # JntTwist = cmds.joint(n='JntTwist_{}'.format(Name + str(x + 1)))

            Pos_cv = cmds.xform(Crv_Arc + '.cv[{}]'.format(str(x)) , ws =1 , t =1 ,q =1)

            cmds.xform(locPoint[0] , ws =1 , t =Pos_cv)

            c_arrange_item(self.lst_Select[x], locStaric[0], 1, 1, 0, 0)
            c_arrange_item(self.lst_Select[x], locPrePoint[0], 1, 1, 0, 0)
            c_arrange_item(self.lst_Select[x], locrs[0], 1, 1, 0, 0)

            lst_loc_Pre.append(locPrePoint[0])
            lst_locresult.append(locrs[0])



            S_Value = Div * x
            r_S_Value = 1.0 - S_Value
            if len(self.lst_Select)%2 == 0:
                mid_val = len(self.lst_Select) / 2

                MD_S = cmds.createNode('multiplyDivide', n='MD_Scale_S_{}'.format(ReName + str(x + 1)))
                MD_E = cmds.createNode('multiplyDivide', n='MD_Scale_M_{}'.format(ReName + str(x + 1)))
                PM_r = cmds.createNode('plusMinusAverage', n='PM_Scale_rs_{}'.format(ReName + str(x + 1)))
                if x<2:
                    PO = cmds.pointConstraint(self.Start_Ctrl.Ctrl , self.Middle_Ctrl.Ctrl , locPrePoint[0] , mo =0)

                    cmds.setAttr(PO[0] + '.' + self.Start_Ctrl.Ctrl + 'W0' , r_S_Value)
                    cmds.setAttr(PO[0] + '.' + self.Middle_Ctrl.Ctrl + 'W1', S_Value)

                    for y in range(0,len(self.Axis)):
                        cmds.setAttr(MD_S + '.input2' + self.Axis[y] , r_S_Value)
                        cmds.setAttr(MD_E + '.input2' + self.Axis[y], S_Value)
                        cmds.connectAttr(self.Start_Ctrl.Ctrl + '.scale' + self.Axis[y] , MD_S + '.input1' + self.Axis[y] ,f =1)
                        cmds.connectAttr(self.Middle_Ctrl.Ctrl + '.scale' + self.Axis[y],MD_E + '.input1' + self.Axis[y], f=1)
                        cmds.connectAttr(MD_S + '.output' + self.Axis[y] ,PM_r + '.input3D[0].input3D' + self.sAxis[y] ,f =1)
                        cmds.connectAttr(MD_E + '.output' + self.Axis[y], PM_r + '.input3D[1].input3D' + self.sAxis[y],f=1)

                        cmds.connectAttr(PM_r + '.output3D.output3D' + self.sAxis[y] , locPrePoint[0] + '.scale' + self.Axis[y] ,f =1)
                    if 0 < x < (len(self.lst_Select)-1):
                        cmds.setAttr(PO[0] + '.' + self.Middle_Ctrl.Ctrl + 'W1', 1)
                else:

                    PO = cmds.pointConstraint(self.End_Ctrl.Ctrl, self.Middle_Ctrl.Ctrl, locPrePoint[0], mo=0)

                    cmds.setAttr(PO[0] + '.' + self.End_Ctrl.Ctrl + 'W0' , S_Value)
                    cmds.setAttr(PO[0] + '.' + self.Middle_Ctrl.Ctrl + 'W1',r_S_Value)

                    for y in range(0, len(self.Axis)):
                        cmds.setAttr(MD_S + '.input2' + self.Axis[y], S_Value)
                        cmds.setAttr(MD_E + '.input2' + self.Axis[y], r_S_Value)

                        cmds.connectAttr(self.End_Ctrl.Ctrl + '.scale' + self.Axis[y] , MD_S + '.input1' + self.Axis[y] ,f =1)
                        cmds.connectAttr(self.Middle_Ctrl.Ctrl + '.scale' + self.Axis[y],MD_E + '.input1' + self.Axis[y], f=1)
                        cmds.connectAttr(MD_S + '.output' + self.Axis[y] ,PM_r + '.input3D[0].input3D' + self.sAxis[y] ,f =1)
                        cmds.connectAttr(MD_E + '.output' + self.Axis[y], PM_r + '.input3D[1].input3D' + self.sAxis[y],f=1)

                        cmds.connectAttr(PM_r + '.output3D.output3D' + self.sAxis[y] , locPrePoint[0] + '.scale' + self.Axis[y] ,f =1)
                    if 0 < x < (len(self.lst_Select)-1):
                        cmds.setAttr(PO[0] + '.' + self.Middle_Ctrl.Ctrl + 'W1', 1)

            else:
                mid_val = ((len(self.lst_Select)-1) / 2)
                if x == mid_val:
                    cmds.pointConstraint(self.Middle_Ctrl.Ctrl , locPrePoint[0], mo=0)
                    for y in range(0,len(self.Axis)):
                        cmds.connectAttr(self.Middle_Ctrl.Ctrl + '.scale' + self.Axis[y], locPrePoint[0] + '.scale' + self.Axis[y], f=1)
                elif x < mid_val:
                    MD_S = cmds.createNode('multiplyDivide', n='MD_Scale_S_{}'.format(ReName + str(x + 1)))
                    MD_E = cmds.createNode('multiplyDivide', n='MD_Scale_M_{}'.format(ReName + str(x + 1)))
                    PM_r = cmds.createNode('plusMinusAverage', n='PM_Scale_rs_{}'.format(ReName + str(x + 1)))

                    PO = cmds.pointConstraint(self.Start_Ctrl.Ctrl, self.Middle_Ctrl.Ctrl, locPrePoint[0], mo=0)
                    cmds.setAttr(PO[0] + '.' + self.Start_Ctrl.Ctrl + 'W0' , r_S_Value)
                    cmds.setAttr(PO[0] + '.' + self.Middle_Ctrl.Ctrl + 'W1', S_Value)

                    for y in range(0,len(self.Axis)):
                        cmds.setAttr(MD_S + '.input2' + self.Axis[y] , r_S_Value)
                        cmds.setAttr(MD_E + '.input2' + self.Axis[y], S_Value)
                        cmds.connectAttr(self.Start_Ctrl.Ctrl + '.scale' + self.Axis[y] , MD_S + '.input1' + self.Axis[y] ,f =1)
                        cmds.connectAttr(self.Middle_Ctrl.Ctrl + '.scale' + self.Axis[y],MD_E + '.input1' + self.Axis[y], f=1)
                        cmds.connectAttr(MD_S + '.output' + self.Axis[y] ,PM_r + '.input3D[0].input3D' + self.sAxis[y] ,f =1)
                        cmds.connectAttr(MD_E + '.output' + self.Axis[y], PM_r + '.input3D[1].input3D' + self.sAxis[y],f=1)
                    if 0 < x < (len(self.lst_Select)-1):
                        cmds.setAttr(PO[0] + '.' + self.Middle_Ctrl.Ctrl + 'W1', 1)
                else:
                    MD_S = cmds.createNode('multiplyDivide', n='MD_Scale_S_{}'.format(ReName + str(x + 1)))
                    MD_E = cmds.createNode('multiplyDivide', n='MD_Scale_M_{}'.format(ReName + str(x + 1)))
                    PM_r = cmds.createNode('plusMinusAverage', n='PM_Scale_rs_{}'.format(ReName + str(x + 1)))

                    PO = cmds.pointConstraint(self.End_Ctrl.Ctrl, self.Middle_Ctrl.Ctrl, locPrePoint[0], mo=0)
                    cmds.setAttr(PO[0] + '.' + self.End_Ctrl.Ctrl + 'W0' , S_Value)
                    cmds.setAttr(PO[0] + '.' + self.Middle_Ctrl.Ctrl + 'W1',r_S_Value)

                    for y in range(0, len(self.Axis)):
                        cmds.setAttr(MD_S + '.input2' + self.Axis[y], S_Value)
                        cmds.setAttr(MD_E + '.input2' + self.Axis[y], r_S_Value)

                        cmds.connectAttr(self.End_Ctrl.Ctrl + '.scale' + self.Axis[y] , MD_S + '.input1' + self.Axis[y] ,f =1)
                        cmds.connectAttr(self.Middle_Ctrl.Ctrl + '.scale' + self.Axis[y],MD_E + '.input1' + self.Axis[y], f=1)
                        cmds.connectAttr(MD_S + '.output' + self.Axis[y] ,PM_r + '.input3D[0].input3D' + self.sAxis[y] ,f =1)
                        cmds.connectAttr(MD_E + '.output' + self.Axis[y], PM_r + '.input3D[1].input3D' + self.sAxis[y],f=1)

                        cmds.connectAttr(PM_r + '.output3D.output3D' + self.sAxis[y] , locPrePoint[0] + '.scale' + self.Axis[y] ,f =1)
                    if 0 < x < (len(self.lst_Select)-1):
                        cmds.setAttr(PO[0] + '.' + self.Middle_Ctrl.Ctrl + 'W1', 1)

            cmds.pointConstraint(locPrePoint[0] , locPoint[0] , mo = 1)
            cmds.parent(locPrePoint[0] , locPoint[0] , All_loc )
            #------------------------------------------------------------------------------------Arc_stretch

            DPM_Point = cmds.createNode('decomposeMatrix', n='DPM_PointPOS_{}'.format(ReName + str(x + 1)))
            DPM = cmds.createNode('decomposeMatrix', n='DPM_StaricPOS_{}'.format(ReName + str(x + 1)))
            POCIF_Staric = cmds.createNode('pointOnCurveInfo', n='POCIF_Staric_{}'.format(ReName + str(x + 1)))
            POCIF_Default = cmds.createNode('pointOnCurveInfo', n='POCIF_Default_{}'.format(ReName + str(x + 1)))
            POCIF_rs = cmds.createNode('pointOnCurveInfo', n='POCIF_result_{}'.format(ReName + str(x + 1)))
            NPOC = cmds.createNode('nearestPointOnCurve', n='NPOC_POS_{}'.format(ReName + str(x + 1)))

            lst_loc_Point.append(locPoint[0])
            lst_loc_Pre.append(locPrePoint[0])
            lst_POCIF_Staric.append(POCIF_Staric)
            lst_POCIF_Default.append(POCIF_Default)
            lst_POCIF_rs.append(POCIF_rs)

            cmds.setAttr(POCIF_Default + '.turnOnPercentage', 1)
            cmds.setAttr(POCIF_Staric + '.turnOnPercentage', 1)
            cmds.setAttr(POCIF_rs + '.turnOnPercentage', 1)

            if x > 0:
                DTB_Staric = cmds.createNode('distanceBetween', n='DTB_Staric_{}'.format(ReName + str(x)))
                DTB_result = cmds.createNode('distanceBetween' , n = 'DTB_result_{}'.format(ReName + str(x)))
                DTB_Default = cmds.createNode('distanceBetween', n='DTB_Default_{}'.format(ReName + str(x)))
                MD_Scale = cmds.createNode('multiplyDivide', n='MD_Scale_Arc_{}'.format(ReName + str(x)))
                #MD_Staric_Scale = cmds.createNode('multiplyDivide', n='MD_Staric_Scale_Arc_{}'.format(ReName + str(x)))


                cmds.connectAttr(lst_POCIF_Staric[x] + '.position', DTB_Staric + '.point2', f=1)
                cmds.connectAttr(lst_POCIF_rs[x] + '.position' , DTB_result + '.point2' ,f =1)
                cmds.connectAttr(lst_POCIF_Default[x] + '.position', DTB_Default + '.point2', f=1)
                cmds.connectAttr(lst_POCIF_Staric[x-1] + '.position', DTB_Staric + '.point1', f=1)
                cmds.connectAttr(lst_POCIF_rs[x-1] + '.position' , DTB_result + '.point1' ,f =1)
                cmds.connectAttr(lst_POCIF_Default[x-1] + '.position', DTB_Default + '.point1', f=1)

                MD_Div = cmds.createNode('multiplyDivide' , n = 'MD_Div_Arc_{}'.format(ReName + str(x)))
                MD_result = cmds.createNode('multiplyDivide', n='MD_result_Arc_{}'.format(ReName + str(x)))
                BC_st = cmds.createNode('blendColors' , n = 'BC_stretch_Arc_{}' .format(ReName + str(x)))

                cmds.connectAttr(self.ScaleDefault + '.scaleX'  , MD_Scale + '.input2X' ,f =1)
                #cmds.connectAttr(self.ScaleDefault + '.scaleX', MD_Staric_Scale + '.input2X', f=1)
                #cmds.connectAttr(DTB_Staric + '.distance' , MD_Staric_Scale + '.input1X', f=1)


                cmds.setAttr(MD_Div + '.operation' ,2)

                cmds.connectAttr(MD_Scale + '.outputX' , BC_st + '.color2R',f =1)
                cmds.connectAttr(MD_Cal + '.outputX' , BC_st + '.blender' ,f =1)

                cmds.connectAttr(DTB_result + '.distance' , MD_Div + '.input1X' ,f =1)
                cmds.connectAttr(DTB_Default + '.distance', MD_Div + '.input2X', f=1)

                cmds.connectAttr(MD_Div + '.outputX', MD_result  + '.input1X', f=1)
                cmds.connectAttr(DTB_Staric + '.distance', MD_result  + '.input2X', f=1)

                cmds.connectAttr(MD_result + '.outputX' , BC_st + '.color1R' ,f =1)
                cmds.connectAttr(BC_st + '.outputR' , lst_JntPre.lst[x] + '.translate' + ShpAxis,f =1)

            cmds.connectAttr(Shp_Crv_Arc + '.worldSpace[0]', POCIF_rs + '.inputCurve', f=1)
            cmds.connectAttr(Shp_Crv_Default + '.worldSpace[0]', POCIF_Default + '.inputCurve', f=1)
            cmds.connectAttr(Shp_Crv_Staric + '.worldSpace[0]' , POCIF_Staric + '.inputCurve' , f=1)
            cmds.connectAttr(Shp_Crv_Staric + '.worldSpace[0]' , NPOC + '.inputCurve' ,f =1)
            cmds.connectAttr(locStaric[0] + '.worldMatrix[0]', DPM + '.inputMatrix', f=1)
            cmds.connectAttr(DPM + '.outputTranslate' , NPOC + '.inPosition' , f =1)

            cmds.connectAttr(NPOC + '.result.parameter' , POCIF_Staric + '.parameter' ,f =1)
            cmds.connectAttr(POCIF_Staric + '.parameter' , POCIF_rs  + '.parameter' ,f =1)
            cmds.connectAttr(POCIF_Staric+ '.parameter', POCIF_Default + '.parameter' )

            cmds.connectAttr(locPoint[0] + '.worldMatrix[0]', DPM_Point + '.inputMatrix', f=1)
            cmds.connectAttr(DPM_Point + '.outputTranslate' , Shp_Crv_Arc +'.controlPoints[{}]' .format(str(x)))

            if x>0:
                Get = cmds.getAttr(MD_result + '.input2X')
                cmds.setAttr(MD_Scale + '.input1X', Get)

            #----------------------------------------------------------------------------------Volume
            if len(self.lst_Select)-1>x>0:
                MD_volume_PreDiv = cmds.createNode('multiplyDivide', n='MD_Volume_DivPre_{}' .format(ReName + str(x)))
                MD_volume_Div = cmds.createNode('multiplyDivide', n='MD_Volume_Div_{}' .format(ReName + str(x)))
                MD_volume_Power = cmds.createNode('multiplyDivide', n='MD_Volume_Power_{}' .format(ReName + str(x)))
                PM_volume_Offset = cmds.createNode('plusMinusAverage' , n = 'PM_Volume_{}' .format(ReName + str(x)))
                BC_Volume = cmds.createNode('blendColors', n='BC_Volume_{}'.format(ReName + str(x)))

                cmds.setAttr(MD_volume_PreDiv + '.operation' ,2)
                cmds.setAttr(MD_volume_Div + '.operation', 2)
                cmds.setAttr(MD_volume_Power + '.operation', 3)
                cmds.setAttr(MD_volume_Div + '.input1X', 1)
                cmds.setAttr(MD_volume_Power + '.input2X' , 0.500)
                cmds.setAttr(BC_Volume + '.color2R' , 1)

                cmds.connectAttr(BC_st + '.outputR', MD_volume_PreDiv + '.input1X', f=1)
                cmds.connectAttr(MD_Scale + '.outputX' , MD_volume_PreDiv + '.input2X' ,f=1)

                cmds.connectAttr(MD_volume_PreDiv + '.outputX' , MD_volume_Div + '.input2X' , f=1)
                cmds.connectAttr(MD_volume_Div + '.outputX' , MD_volume_Power + '.input1X' ,f =1)

                cmds.connectAttr(MD_volume_Power + '.outputX' , PM_volume_Offset + '.input1D[0]' ,f =1)
                cmds.connectAttr(self.Middle_Ctrl.Ctrl + '.Volume_Offset', PM_volume_Offset + '.input1D[0]', f=1)
                cmds.connectAttr(MD_volume_Power + '.outputX', PM_volume_Offset  + '.input1D[1]', f=1)
                cmds.connectAttr(PM_volume_Offset + '.output1D' , BC_Volume + '.color1R' ,f =1)

                cmds.connectAttr(MD_Cal + '.outputY' , BC_Volume + '.blender' , f =1)

                cmds.connectAttr(BC_Volume + '.outputR' , lst_JntPre.lst[x] + '.scale' + VScale1 ,f =1)
                cmds.connectAttr(BC_Volume + '.outputR', lst_JntPre.lst[x] + '.scale' + VScale2, f=1)


        #------------------------------------------------------------------------------------------------Twist
        cmds.setAttr(splineIK[0] + '.dTwistControlEnable', 1)
        cmds.setAttr(splineIK[0] + '.dWorldUpType', 4)
        cmds.connectAttr(list(self.grp_Start.Dic.keys())[0] + '.worldMatrix[0]', splineIK[0] + '.dWorldUpMatrix', f=1)
        cmds.connectAttr(list(self.grp_End.Dic.keys())[0] + '.worldMatrix[0]', splineIK[0] + '.dWorldUpMatrixEnd', f=1)

        if self.AimVector == (1, 0, 0):
            cmds.setAttr(splineIK[0] + '.dForwardAxis', 0)
        elif self.AimVector == (0, 1, 0):
            cmds.setAttr(splineIK[0] + '.dForwardAxis', 2)
        elif self.AimVector == (0, 0, 1):
            cmds.setAttr(splineIK[0] + '.dForwardAxis', 4)
        elif self.AimVector == (-1, 0, 0):
            cmds.setAttr(splineIK[0] + '.dForwardAxis', 1)
        elif self.AimVector == (0, -1, 0):
            cmds.setAttr(splineIK[0] + '.dForwardAxis', 3)
        else:
            cmds.setAttr(splineIK[0] + '.dForwardAxis', 5)

        if self.UpVector == (1, 0, 0):
            cmds.setAttr(splineIK[0] + '.dWorldUpAxis', 6)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorX', 1)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorY', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorZ', 0)

            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndX', 1)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndY', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndZ', 0)
        elif self.UpVector == (0, 1, 0):
            cmds.setAttr(splineIK[0] + '.dWorldUpAxis', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorX', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorY', 1)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorZ', 0)

            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndX', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndY', 1)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndZ', 0)
        elif self.UpVector == (0, 0, 1):
            cmds.setAttr(splineIK[0] + '.dWorldUpAxis', 3)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorX', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorY', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorZ', 1)

            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndX', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndY', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndZ', 1)
        elif self.UpVector == (-1, 0, 0):
            cmds.setAttr(splineIK[0] + '.dWorldUpAxis', 7)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorX', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorY', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorZ', 1)

            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndX', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndY', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndZ', 1)
        elif self.UpVector == (0, -1, 0):
            cmds.setAttr(splineIK[0] + '.dWorldUpAxis', 1)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorX', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorY', 1)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorZ', 0)

            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndX', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndY', 1)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndZ', 0)
        elif self.UpVector == (0, 0, -1):
            cmds.setAttr(splineIK[0] + '.dWorldUpAxis', 4)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorX', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorY', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorZ', 1)

            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndX', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndY', 0)
            cmds.setAttr(splineIK[0] + '.dWorldUpVectorEndZ', 1)

        #-------------------------------------------------------------------------------------------------Parent
        self.lst_rs_set = c_grouping(lst_locresult , 0 , 4 , grp_lst , self.Drt)
        self.lst_Jnt = c_create_Jnt(self.lst_Select , ReName ,self.AimVector ,self.UpVector , self.ObjVector ,self.ObjRot_Target )

        cmds.setAttr( All_loc + '.visibility' , 0)
        cmds.setAttr( lst_JntPre.lst[0]  + '.visibility', 0)
        cmds.setAttr( self.lst_Jnt.lst[0] + '.visibility', 0)
        cmds.setAttr(self.nonParent + '.visibility', 0)

        cmds.parent(All_Staric , Crv_Staric , Crv_Arc, splineIK[0],self.nonParent)
        cmds.parent(self.ScaleDefault ,Crv_Default , list(self.grp_Start.Dic.values())[0][-1] , list(self.grp_Middle.Dic.values())[0][-1],list(self.grp_End.Dic.values())[0][-1],lst_JntPre.lst[0] , All_loc , self.lst_Jnt.lst[0] , self.All)

        for x in range(0,len(self.lst_Select)):
            if x == len(self.lst_Select)-1:
                cmds.pointConstraint(lst_JntPre.lst[x], list(self.lst_rs_set.Dic.values())[x][-1], mo=1)
            else:
                cmds.parentConstraint(lst_JntPre.lst[x] , list(self.lst_rs_set.Dic.values())[x][-1] , mo =1)
            cmds.pointConstraint(list(self.lst_rs_set.Dic.keys())[x] , self.lst_Jnt.lst[x] , mo =1 )
            cmds.orientConstraint(list(self.lst_rs_set.Dic.keys())[x], self.lst_Jnt.lst[x], mo=1)
            cmds.parentConstraint(self.lst_Jnt.lst[x] , self.lst_Select[x] , mo = 1)

            MD = cmds.createNode('multiplyDivide', n='MD_result_Scale_{}' .format(ReName + str(x)))

            for y in range(0,len(self.Axis)):
                cmds.connectAttr(lst_JntPre.lst[x]+'.scale' + self.Axis[y] , MD + '.input1' + self.Axis[y] ,f =1)
                cmds.connectAttr(lst_loc_Pre[x] + '.scale' + self.Axis[y] ,  MD + '.input2' + self.Axis[y] ,f =1)

                cmds.connectAttr(MD + '.output' + self.Axis[y] , list(self.lst_rs_set.Dic.keys())[x] + '.scale' + self.Axis[y], f =1)
                cmds.connectAttr(list(self.lst_rs_set.Dic.keys())[x] + '.scale' + self.Axis[y],self.lst_Jnt.lst[x]  + '.scale' + self.Axis[y], f=1)
                cmds.connectAttr(self.lst_Jnt.lst[x]  + '.scale' + self.Axis[y] , self.lst_Select[x] + '.scale' + self.Axis[y] ,f =1)


            cmds.parent(list(self.lst_rs_set.Dic.values())[x][-1] , All_loc)

        self.chest_root = list(self.lst_rs_set.Dic.keys())[-1]
        cmds.orientConstraint(self.Start_Ctrl.Ctrl , lst_locresult[0], mo =1)
        cmds.orientConstraint(self.End_Ctrl.Ctrl, lst_locresult[-1],mo =1)






















































































