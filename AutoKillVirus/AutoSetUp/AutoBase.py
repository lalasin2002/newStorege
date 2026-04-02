# -*- coding: utf-8 -*-

import maya.cmds as cmds
import maya.mel as mel
import datetime , pprint , getpass,os , sys ,subprocess ,stat 


User = getpass.getuser()
Version = cmds.about(version=True)
AbsDir = "C:/Users/{}/Documents/maya" .format(User)
MAYA_App_Path = os.getenv("MAYA_APP_DIR")

UserAutoFolderPath = '{}/scripts/AutoSetUp'  .format(AbsDir)
UserSetUpPathpy = '{}/scripts/userSetup.py' .format(AbsDir)
UserSetUpPathmel ='{}/scripts/userSetup.mel' .format(AbsDir)

ScriptPath = "{}/scripts" .format(AbsDir)
ScriptMayaVPath = "{}/{}/scripts" .format(AbsDir , Version)


if os.path.exists(UserAutoFolderPath):
    PathDir = os.listdir(UserAutoFolderPath)
    PathAbsDirlist = [ "{}/{}" .format(UserAutoFolderPath , x) for x in PathDir]

    #pprint.pprint(sys.path)
    if all(PathSys in sys.path for PathSys in PathAbsDirlist) == False:
        for Path in PathAbsDirlist:
            sys.path.append(Path )
    else:
        print ("\n>>> :: SysPathAppend")
        for x in PathAbsDirlist:

            print ("Append :: {}" .format(x))



def MalScriptJobKill(EventName , ProTectList ):
    lst =cmds.scriptJob(listJobs=True)
    lst = [x for x in lst if EventName in x]
    lst = [x for x in lst if not any (y in x for y in ProTectList )]
    
    if len(lst)>0:
        for x in lst:
            ScriptJobNum = int(x.split(":")[0])
            cmds.scriptJob( force =1 , kill = ScriptJobNum)
            
            print ("___________________________________KillScriptJob")
            print (">>> {}\n" .format(x))


def RunBat():
    BatFolderPath = "{}/BatFile" .format(UserAutoFolderPath )
    
    BatFilePathList = ["{}/{}" .format(BatFolderPath , x) for x in os.listdir(BatFolderPath)]

    if len(BatFilePathList) > 0:
        print ("\n>>> :: RunBat")
        for x in BatFilePathList:
            subprocess.call([x])
            print ("Run :: {}" .format(x))

def CopyPasteUserSetUp():
    BackUpPath = "{}/BackUpUserSetUp/__BackUp_userSetup.mel" .format(UserAutoFolderPath)
    String = ""
    print ("\n>>> :: CopyPasteUserSetUp")
    with open(BackUpPath , "r" ) as ReadFile:
        String = ReadFile.read()


    if os.path.exists(UserSetUpPathpy):
        os.remove(UserSetUpPathpy)
    
    if os.path.exists(UserSetUpPathmel):
        os.chmod(UserSetUpPathmel , stat.S_IWRITE)
        UserSetUpString = ""
        with open(UserSetUpPathmel , "r" ) as UserSetUpFile:
            UserSetUpString =  UserSetUpFile.read()
        
        if not String == UserSetUpString:
            with open(UserSetUpPathmel , "w" ) as UserSetUpFile:
                UserSetUpFile.write(String)

            print ("UserSetUp Updata :: {}" .format(UserSetUpPathmel))
        else:

            print ("UserSetUp is the same as BackUp_UserSetUp ")
    else:
        UserCreatePath = cmds.internalVar(userAppDir=True) + 'scripts/userSetup.mel'
        with open(UserCreatePath , "w") as f:
            f.writelines(String)

        print ("Create useSetUp :: {}" .format(UserSetUpPathmel))


def DeleteScriptFile(Path , DeleteList = ["fuckVirus" , "breed_gene", "vaccine_gene"] ,PrintFunc = True):

    AbsPath = os.path.abspath(Path)
    ExistPath = os.path.exists(AbsPath)
    PrintString = "\n>>> :: Search Malicious File :: {}\n" .format(AbsPath)
    Count = 0

    

    if ExistPath:
        DirFileList = os.listdir(AbsPath)

        if len(DirFileList) > 0 :
            for File in DirFileList:
                if any( DeleteItem in File for DeleteItem in DeleteList):
                    DeletePath = os.path.join(Path , File)
                    DeletePath = os.path.abspath(DeletePath)
                    PrintString += "{} ==> Delete\n" .format(DeletePath)
                    os.remove(DeletePath)
                    Count += 1

    if PrintFunc and Count >0 :
        PrintString += "Delete File Total :: {}\n" .format(Count)
    else:
        PrintString += "not Find Malicious File\n"
    print (PrintString )


def Kill_MalScript():

    KillList = ["*IGPUCS*" , "*youngsunnyeye_IGPUCS*" , "*uifiguration*" , "*breed_gene*" , "*vaccine_gene*" , '*sysytenasdasdfsadfsdaf_dsfsdfaasd*', '*PuTianTongQing*', '*daxunhuan*' , "*fuckVirus*"]
    
    String = ""
    PreDeleteList = []
    for x in KillList:
        try:
            ItemList = cmds.ls("{}" .format(x) , type = "script")
            PreDeleteList = PreDeleteList + ItemList 
        except:
            print (">>> {} is lock" .format(x) )
            pass

    SetDeleteList  = set(PreDeleteList)
    DeleteList = list(SetDeleteList )
    print ("\n>>> ::  Kill_MalScript")
    print ("Find MalScript Count:: {}" .format(len(DeleteList)))
    if not len(DeleteList) == 0:
        print ("________________Kill Script List")
        for x in DeleteList:
            print("{} ==> Kill" .format(x))
            cmds.delete(x)


def RunAll():
    print ("\n\n\n\n#----------------------------------SaveEvent-----------------------------------")

    scene_path = cmds.file(q=True, sceneName=True)
    if scene_path == "":
        scene_path = None
    print ("Current File :: {}" .format(scene_path))

    MalScriptJobKill('SceneSaved' , ['RunAll()'])
    DeleteScriptFile(ScriptPath)
    DeleteScriptFile(ScriptMayaVPath)
    Kill_MalScript()
    CopyPasteUserSetUp()
    RunBat()
    #Kill_MalScript()

    print ("\n#------------------------------------------------------------------------------------\n\n")

#RunAll()   
cmds.scriptJob(event=["SceneSaved" , "RunAll()"] , protected=True)
cmds.scriptJob(event=["SceneOpened" , "RunAll()"] , protected=True)

