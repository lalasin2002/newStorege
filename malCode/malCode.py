import maya.cmds as cmds
import maya.mel as mel
import os , sys , pprint ,subprocess ,json ,datetime , stat

UserAutoFolderPath = os.getenv("MAYA_APP_DIR") + '/scripts/AutoSetUp'  
UserSetUpPathpy = os.getenv("MAYA_APP_DIR") + '/scripts/userSetup.py'
UserSetUpPathmel = os.getenv("MAYA_APP_DIR") + '/scripts/userSetup.mel'

if os.path.exists(UserAutoFolderPath):
    PathDir = os.listdir(UserAutoFolderPath)
    PathAbsDirlist = [ "{}/{}" .format(UserAutoFolderPath , x) for x in PathDir]

    if all(PathSys in sys.path for PathSys in PathAbsDirlist) == False:
        for Path in PathAbsDirlist:
            sys.path.append(Path )
    else:
        print ("\n>>> :: SysPathAppend")
        for x in PathAbsDirlist:
            print ("Append :: {}" .format(x))

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

def Kill_MalScript():
    KillList = ["*IGPUCS*" , "*youngsunnyeye_IGPUCS*" , "*uifiguration*" , "*breed_gene*" , "*vaccine_gene*" , '*sysytenasdasdfsadfsdaf_dsfsdfaasd*', '*PuTianTongQing*', '*daxunhuan*' , "*fuckVirus*"]
    
    String = ""
    PreDeleteList = []
    for x in KillList:
        ItemList = cmds.ls("{}" .format(x) , type = "script")
        PreDeleteList = PreDeleteList + ItemList 

    SetDeleteList  = set(PreDeleteList)
    DeleteList = list(SetDeleteList )
    print ("\n>>> ::  Kill_MalScript")
    print ("Find MalScript Count:: {}" .format(len(DeleteList)))
    if not len(DeleteList) == 0:
        print ("________________Kill Script List")
        for x in DeleteList:
            print("{} ==> Kill" .format(x))
            cmds.delete(x)

def d_reTurn_Path_listDir(LocalDirPath  , ExtendName = ""):
    
    LocalDirPath = LocalDirPath.replace("\\" , "/")
    
    PathDirlist = os.listdir(LocalDirPath)
    PathDirlist = [x for x in PathDirlist if x.endswith(ExtendName)]
    
    list = []
    for x in PathDirlist :
        AbsPath = LocalDirPath+ "/" + x
        if AbsPath:
            AbsPath = AbsPath.replace("\\" , "/")
        list.append(AbsPath)

    return list

def OpenSaveWork(FileList ,Ver , FolderPath):
    
    JsonSucessString = "_____________________________ComFile\n"
    JsonDontStrint = "_____________________________Error\n"

    BasicString = "{} :: {} >>> {}"
    OpenString ="Open"
    KillMal = "MalCode Kill"
    BackUp = "userSetUp BackUp"
    DeleteApp = "appdate Clean"
    SaveString = "Save"
    
    FixType = "mayaBinary"
    
    if Ver == "mb":
        FixType = "mayaBinary"
    elif Ver == "ma":
        FixType = 'mayaAscii' 
        
    JsonPath = FolderPath +"/WorkTime.txt"

    with open (JsonPath , "w") as f:
        f.write("")
        f.write(JsonSucessString)    

    for File in FileList:
        UserTime = datetime.datetime.now()
        CurrentTime = UserTime.strftime("%Y-%m-%d-%H:%M:%S")
        try: #OpenFile
            
            cmds.file( File, f=1, o=1, iv=1, typ=FixType , loadReferenceDepth = "all" ,  prompt = 0)
            PrintOpenString = BasicString.format(CurrentTime ,File , OpenString)
            with open (JsonPath , "a") as f:
                f.write(PrintOpenString+"\n")
            
            try: #-------------------------------------------------------UserSetUp
                CopyPasteUserSetUp()
                PrintOpenString = BasicString.format(CurrentTime  ,File ,BackUp)
                with open (JsonPath , "a") as f:
                    f.write(PrintOpenString+"\n")
            except:
                BackUp = "userSetUp Dont BackUp"
                PrintOpenString = BasicString.format(CurrentTime  ,File ,BackUp)
                JsonDontStrint += PrintOpenString +"\n"
            
            try: #--------------------------------------------------------Kill MalCode
                Kill_MalScript()
                PrintOpenString = BasicString.format(CurrentTime ,File,KillMal)
                with open (JsonPath , "a") as f:
                    f.write(PrintOpenString+"\n")
            except:
                KillMal = "MalCode Dont Kill"
                PrintOpenString = BasicString.format(CurrentTime  ,File, KillMal)
                JsonDontStrint += PrintOpenString +"\n"

            try: #-----------------------------------------------------------Delete Appdata
                RunBat()
                PrintOpenString = BasicString.format(CurrentTime  ,File,DeleteApp)
                with open (JsonPath , "a") as f:
                    f.write(PrintOpenString+"\n")
            except:
                DeleteApp= "MalCode Dont Kill"
                PrintOpenString = BasicString.format(CurrentTime  ,File,DeleteApp)
                JsonDontStrint += PrintOpenString +"\n"

            try: #----------------------------------------------------------Save
                cmds.file(save=True, type=FixType  , f=1)
                PrintOpenString = BasicString.format(CurrentTime  ,File,SaveString)
                with open (JsonPath , "a") as f:
                    f.write(PrintOpenString+"\n")
            except:
                SaveString =   "DontSave"
                PrintOpenString = BasicString.format(CurrentTime  ,File,SaveString)
                JsonDontStrint += PrintOpenString +"\n"

        except:
            OpenString = "OpenError"
            PrintOpenString = BasicString.format(CurrentTime  ,File,OpenString)
            JsonDontStrint += PrintOpenString +"\n"
        
    Data = JsonDontStrint
    pprint.pprint(Data)

    JsonPath = FolderPath +"/WorkTime.txt"
    with open (JsonPath , "a") as f:
        f.write(Data)

#--------------------------------------------------------------------------------------------------------------
try:
    PathFix = os.environ['MAYA_BATCH_PATH']
    Version = os.environ['MAYA_BATCH_VERSION']

    if not os.path.isdir(PathFix):
        raise IOError("Path from MAYA_BATCH_PATH is not a valid directory: {}".format(PathFix))

    if Version not in ["ma", "mb"]:
        raise ValueError("Version from MAYA_BATCH_VERSION must be 'ma' or 'mb'.")

    print(">>> Batch Start")
    print(">>> Path: {}".format(PathFix))
    print(">>> Version: {}".H.format(Version))

    FixVerFormat = str(".{}" .format(Version))

    StartNum = ""
    EndNum = ""

    ListDirPath = d_reTurn_Path_listDir(PathFix)
    ListDirPath = [x for x in ListDirPath if FixVerFormat in x]

    StartIndex = 0
    EndIndex = -1

    if not StartNum == "":
        for i ,x in enumerate(ListDirPath):
            if StartNum in x:
                StartIndex = i
                break

    if not EndNum == "":
        for i ,x in enumerate(ListDirPath):
            if EndNum in x:
                EndIndex= i +1
                break

    WorkList = ListDirPath[StartIndex  : EndIndex]
    if EndNum == "":
        WorkList= ListDirPath[StartIndex  : ]

    print("\n>>> Files To Process: {}".format(len(WorkList)))
    pprint.pprint(WorkList)
    print("-------------------------------------------------")

    # 메인 작업 실행
    OpenSaveWork(WorkList, Version, PathFix)

except KeyError:
    print("Error: [MAYA_BATCH_PATH] or [MAYA_BATCH_VERSION] environment variable not set.")
    print("Please run this script using the .bat file.")
    cmds.quit(force=True) 

except Exception as e:
    print("An unexpected error occurred: {}".format(e))
    cmds.quit(force=True) 

print(">>> Batch process finished successfully.")
cmds.quit(force=True)