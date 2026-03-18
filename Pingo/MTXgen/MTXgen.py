# -*- coding: utf-8 -*-
import maya.cmds as cmds
import maya.mel as mel
import os, time, shutil, re, json, pprint, sys

version_str = cmds.about(apiVersion=True)

class XgenData:
    """
    씬 내의 캐릭터 및 XGen 레퍼런스 데이터를 분석하고 연결을 관리하는 메인 클래스입니다.
    """
    def __init__(self):
        """
        초기화 및 기초 변수, 씬 경로 설정
        Args:
            없음
        Returns:
            없음
        """
        try:
            self._string_type = basestring
        except NameError:
            self._string_type = str
            
        self.chaAsset_referenceData = {}
        self.sceneInfo = {}
        self.jsonData = {}

        scenePathName = cmds.file(q=True, sceneName=True)
        path, file = os.path.split(scenePathName)

        self.scenePath = path
        self.sceneName = file
        self.fullpath = scenePathName
        self.pathRoot = "{dr}/Project_{project}/{season}/{main}/{sub}{addDir}"
        
    def connect_xGenData(self, TargetRnNode, searchFace="Face_Geo_finSet", searchCurve="sim_curve_G"):
        """
        XGen 데이터와 캐릭터 데이터를 분석하여 필요한 블렌드쉐입 노드를 생성하고 연결합니다.
        Args:
            -TargetRnNode (str): 연결 대상이 되는 XGen 레퍼런스 노드 이름
            -searchFace   (str): 검색할 페이스 지오메트리 키워드
            -searchCurve  (str): 검색할 커브 키워드
        Returns:
            없음
        """
        print (u"\n>> _______________[xgen 데이터 캐릭터 연결]")
        nameBulid = None
        characterRN = None
        xgenFace = None
        xgenCurve = None
        
        if isinstance(TargetRnNode, self._string_type) and not cmds.objExists(TargetRnNode):
            error_msg = u">> 연결을 위한 xGen 데이터 : {} 가 존재하지않습니다".format(TargetRnNode)
            raise ValueError(error_msg)
        
        pattern = r"^(ch_\d+_[^_]+)"
        search = re.search(pattern, TargetRnNode)
        if search and self.chaAsset_referenceData:
            nameBulid = search.group(1)
            for k, v in self.chaAsset_referenceData.items():
                if nameBulid in k:
                    characterRN = k
                    break

        if not characterRN or not cmds.objExists(characterRN):
            raise ValueError(u">> 연결 대상인 캐릭터 데이터 : {} 가 존재하지않습니다".format(characterRN))
            
        try:
            xgenNodes = cmds.referenceQuery(TargetRnNode, nodes=True, dagPath=True)
        except RuntimeError:
            return

        xgenNodes = cmds.ls(xgenNodes, type="transform")
        xgenFace = None
        xgenCurve = None

        for node in xgenNodes:
            if searchFace in node:
                xgenFace = node
            if searchCurve in node:
                xgenCurve = node
            if xgenFace and xgenCurve:
                break
                
        self.chaAsset_referenceData[characterRN]["xGenFace"] = xgenFace
        self.chaAsset_referenceData[characterRN]["xGenCurve"] = xgenCurve
        
        targetFace = self.chaAsset_referenceData[characterRN].get("targetFace")
        targetCurve = self.chaAsset_referenceData[characterRN].get("targetCurve")

        checkText = ""
        checkText += u">> {} xgen 커브 : {}\n".format(nameBulid, xgenCurve)
        checkText += u">> {} xgen 페이스 : {}\n".format(nameBulid, xgenFace)
        checkText += u">> {} 캐릭터 커브 : {}\n".format(nameBulid, targetFace)
        checkText += u">> {} 캐릭터 페이스 : {}\n".format(nameBulid, targetCurve)
        print (checkText)
        
        if not all([xgenFace, xgenCurve, targetFace, targetCurve]):
            print (u">> 누락된 데이터가 존재 합니다 , 위 요건 중 None를 확인하십시오")
            #return
        
        CntCurveBlsh = "{}_xgenCurveCnt".format(nameBulid)
        CntFaceBlsh = "{}_xgenFaceCnt".format(nameBulid)
        
        CntAttrCurve = "{}.{}".format(CntCurveBlsh, targetCurve)
        CntAttrFace = "{}.{}".format(CntFaceBlsh, targetFace)

        # Face
        if not cmds.objExists(CntFaceBlsh):
            CntFaceBlsh = cmds.blendShape( targetFace ,xgenFace, n=CntFaceBlsh)[0]
        # Curve
        if not cmds.objExists(CntCurveBlsh):
            CntCurveBlsh = cmds.blendShape( targetCurve, xgenCurve, n=CntCurveBlsh)[0]

        if CntFaceBlsh:
            listAttr = cmds.listAttr(CntFaceBlsh + ".w", m=True)
            if listAttr:
                cmds.setAttr("{}.{}".format(CntFaceBlsh, listAttr[0]), 1)
            
        if CntCurveBlsh:
            listAttr = cmds.listAttr(CntCurveBlsh + ".w", m=True)
            if listAttr:
                
                cmds.setAttr("{}.{}".format(CntCurveBlsh, listAttr[0]), 1)

    def refer_xGenFile(self, TargetRnNode):
        """
        데이터 사전을 기반으로 XGen 파일을 씬에 레퍼런스로 로드합니다.
        Args:
            -TargetRnNode (str): XGen 파일을 로드할 대상 캐릭터 레퍼런스 노드 이름
        Returns:
            생성되거나 매칭된 XGen 레퍼런스 노드 이름(str) 또는 없을 경우 None
        """
        print (u"\n>> _______________[xgen 파일 레퍼런스]")

        xGenReferenceNode = None
        if isinstance(TargetRnNode, self._string_type) and not cmds.objExists(TargetRnNode):
            error_msg = u">> {} 가 존재하지않습니다".format(TargetRnNode)
            raise ValueError(error_msg)
        
        if self.chaAsset_referenceData.get(TargetRnNode):
            xGenPath = self.chaAsset_referenceData[TargetRnNode].get("xGenPath")
        
            if not xGenPath:
                print (u">> {} 의 XGen 파일 경로가 데이터에 존재하지 않습니다.".format(TargetRnNode))
                return None
                
            xGenReferenceNode = self._find_reference_by_path(xGenPath)
            
            if not xGenReferenceNode:
                xGenReferenceNode = self._load_reference(xGenPath)
            else:
                print (u">> {} 레퍼런스 데이터는 이미 존재합니다".format(xGenReferenceNode))
                
            if xGenReferenceNode:
                self.chaAsset_referenceData[TargetRnNode]["xGenFile"] = xGenReferenceNode

        print (u">> xgen 파일 레퍼런스 결과\n>> xgen 레퍼런스 :: {}".format(xGenReferenceNode))
        return xGenReferenceNode

    def get_chaReferenceData(self):
        """
        씬 내의 캐릭터 레퍼런스를 검색하여 경로 및 주요 노드(Face, Curve 등) 정보를 사전에 저장합니다.
        Args:
            없음
        Returns:
            없음
        """
        print (u"\n>> _______________[캐릭터 데이터 가져오기]")
        references = self._get_referenceDatas()
        charaterPattern = r"^(ch_\d+_.+)_rig"
        dictData = {}
        
        for Rn in references:
            if re.search(r"Blsh", Rn):
                 continue
                 
            search = re.search(charaterPattern, Rn)
            referencePath = None
            directoryPath = None
            mainGrp = None
            
            if search:
                dictData[Rn] = {"path": None, 
                                "xGenCurve": None,
                                "collison": None, 
                                "mainGrp": None, 
                                "center": None,
                                "directory": None,
                                "xGenPath": None,
                                "xGenFile": None, 
                                "xGenFace": None,
                                "assetFile": None,
                                "ext": None,
                                "assetName": None,
                                "targetFace": None,
                                "targetCurve": None,
                                "xGenFaceBlsh": None,
                                "xGenCurveBlsh": None
                                }
                matchString = search.group(0).replace("_rig", "")
                dictData[Rn]["assetName"] = matchString
                referencePath = self._get_referencePath(Rn)

                if referencePath:
                    _path, fileName = os.path.split(referencePath)
                    _fileName, ext = os.path.splitext(fileName)
                    directoryPath = os.path.dirname(referencePath)
                    directoryFiles = os.listdir(directoryPath)
                    xGenFileNonExt = "{}_xgen".format(matchString)

                    for f in directoryFiles:
                        if any(f.endswith(_ext) for _ext in [".ma", ".mb"]) and xGenFileNonExt in f:
                            dictData[Rn]["xGenPath"] = os.path.join(directoryPath, f).replace("\\", "/")
                            break

                    referencePath = referencePath.replace("\\", "/")
                    directoryPath = directoryPath.replace("\\", "/")
                    dictData[Rn]["directory"] = directoryPath
                    dictData[Rn]["path"] = referencePath
                    dictData[Rn]["assetFile"] = fileName
                    dictData[Rn]["ext"] = ext       

                    nodes = cmds.referenceQuery(Rn, nodes=True, dagPath=True)
                    nodes = cmds.ls(nodes, type="transform")
                    top_nodes = cmds.ls(nodes, assemblies=True)
                    if top_nodes:
                        dictData[Rn]["mainGrp"] = top_nodes[0]

                    for t in nodes:
                        result = self._stringAttrSearchs(t)
                        if result == "face":
                            dictData[Rn]["targetFace"] = t
                        if result == "CollisionCnt":
                            dictData[Rn]["collison"] = t
                        if result == "inputCrvCnt":
                            dictData[Rn]["targetCurve"] = t
                        if result == "headCenterCnt":
                            dictData[Rn]["center"] = t

        self.chaAsset_referenceData = dictData
        pprint.pprint(self.chaAsset_referenceData)

    def load_jsonData(self, path=None, passBool=True):
        """
        지정된 경로나 씬 정보를 바탕으로 Json 파이프라인 데이터를 로드합니다.
        Args:
            -path     (str): 로드할 Json 파일의 절대 경로 (기본값: None)
            -passBool (bool): 경로가 없을 때 에러 발생 여부 결정 (True면 패스, False면 에러 발생)
        Returns:
            없음
        """
        print (u"\n>> _______________[json 데이터 가져오기]")
        self.define_pathData()
        loadData = None
        
        if path is None:
            if self.sceneInfo:
                default_drive = self.sceneInfo.get("driverPath")
                default_project = self.sceneInfo.get("project")
                default_season = self.sceneInfo.get("season")
                default_main = "03_Main-Production"
                default_sub = "02_Animation"
                default_ep = self.sceneInfo.get("episode")
                default_sq = self.sceneInfo.get("sequence")
                default_cut = self.sceneInfo.get("cut")

                default_jsonFile = "{project}_{ep}_{sq}_{cut}_ani_fin.json".format(
                    project=default_project,
                    ep=default_ep,
                    sq=default_sq,
                    cut=default_cut
                )
                pathRoot = self.pathRoot.format(
                    dr=default_drive,
                    project=default_project,
                    season=default_season,
                    main=default_main,
                    sub=default_sub,
                    addDir="/{}".format(self.sceneInfo.get("episode"))
                )
                
                isDir = os.path.exists(pathRoot)
                if isDir:
                    for dirPath, dirName, fileName in os.walk(pathRoot):
                        if default_jsonFile in fileName:
                            path = os.path.join(dirPath, default_jsonFile)
                            break
        
        if path is None or not isinstance(path, self._string_type) or not os.path.exists(path):
            errorText = u">> {} 는 현재 찾을수없는 경로입니다".format(path)
            if passBool:
                errorText += u"\n Json파일을 확인할수없으므로 패스합니다."
                print (errorText)
            else:
                raise ValueError(errorText)

        if path:
            try:
                with open(path, "r") as jsonFile:
                    loadData = json.load(jsonFile)
            except Exception as e:
                print (u">> json파일 읽기 실패 원인: {}".format(str(e)))
                pass

            if not isinstance(loadData, dict):
                errorText = u">> 아래 경로의 json파일이 dict 자료형이 아니거나 훼손되어있습니다\n"
                errorText += u">> {}".format(path)
                raise ValueError(errorText)
                
        self.jsonData = loadData
        if loadData:
            print (u">> JSON 데이터를 성공적으로 로드했습니다.")

    def define_pathData(self):
        """
        현재 작업 중인 씬의 경로를 분석하여 프로젝트, 에피소드, 컷 등의 정보를 추출합니다.
        Args:
            없음
        Returns:
            없음
        """
        print (u"\n>> _______________[현재 파일 정보 가져오기]")
        if not self.fullpath:
            print (u">> 현재 씬이 저장되어 있지 않아 경로 데이터를 추출할 수 없습니다.")
            return

        if self.sceneName and self.scenePath:
            scene_info = {"ScenePath": None,
                "SceneFileName": None,
                "SceneName": None,
                "SceneExt": None,
                "SceneFolderPath": None,
                "SceneInfo": None, 
                "driverPath": None,
                "mainFolder": None,
                "subFolder": None,
                "project": None,
                "episode": None, 
                "sequence": None,
                "cut": None, 
                "season": None}
            
            folderPath, fileName = os.path.split(self.fullpath)
            sceneName, ext = os.path.splitext(fileName)
            scene_info["ScenePath"] = self.fullpath
            scene_info["SceneFileName"] = fileName
            scene_info["SceneFolderPath"] = folderPath
            scene_info["SceneName"] = sceneName
            scene_info["SceneExt"] = ext
              
            search_episode = re.search(r"(ep[0-9]+)", self.sceneName)
            if search_episode:
                 scene_info["episode"] = search_episode.group(1)
                 
            search_sequence = re.search(r"(sq[0-9]+)", self.sceneName)
            if search_sequence:
                scene_info["sequence"] = search_sequence.group(1)
                
            search_cut = re.search(r"(c[0-9]+)", self.sceneName)
            if search_cut:
                scene_info["cut"] = search_cut.group(1)
                
            search_driverPath = re.search(r"([A-Za-z]:)", self.fullpath)
            if search_driverPath:
                scene_info["driverPath"] = search_driverPath.group(1)
                
            search_project = re.search(r"(Project_)([a-zA-Z0-9_]+)", self.fullpath, re.IGNORECASE)
            if search_project:
                scene_info["project"] = search_project.group(2)
                
            search_season = re.search(r"(S[0-9]+)", self.fullpath)
            if search_season:
                scene_info["season"] = search_season.group(1)

            search_mainFolder = re.search(r"(\d{2}_[a-zA-Z0-9\-]+)", self.fullpath)
            if search_mainFolder:
                scene_info["mainFolder"] = search_mainFolder.group()

            scene_info["SceneInfo"] = "{pj}_{ep}_{sq}_{c}".format(
                        pj=scene_info["project"], ep=scene_info["episode"], sq=scene_info["sequence"], c=scene_info["cut"]
                    )
            self.sceneInfo = scene_info

            print (u">> 현재 파일 정보 ")
            pprint.pprint(self.sceneInfo)

    # ------------------------------------------------------------
    # helper
    # ------------------------------------------------------------

    def _get_referencePath(self, target, absPath=True):
        """
        레퍼런스 노드의 실제 파일 경로를 반환합니다.
        Args:
            -target  (str): 레퍼런스 노드 이름
            -absPath (bool): 절대 경로로 반환할지 여부 (기본값: True)
        Returns:
            파일 경로 문자열(str) 또는 실패 시 None
        """
        Path = None
        if not cmds.objectType(target) == "reference":
            raise TypeError(u">> {} 은 레퍼런스 데이터가 아닙니다 ".format(target))
        try:
            Path = cmds.referenceQuery(target, filename=True)
        except:
            Path = None
            
        if absPath and Path:
            Path = os.path.abspath(Path)
        return Path

    def _get_referenceDatas(self, clean=True):
        """
        씬 내의 모든 레퍼런스 노드 리스트를 가져옵니다.
        Args:
            -clean (bool): sharedReferenceNode 및 손상된 레퍼런스를 필터링할지 여부 (기본값: True)
        Returns:
            레퍼런스 노드 이름 리스트(list)
        """
        Datas = []
        refers = cmds.ls(type="reference")
        refers = [r for r in refers if r != "sharedReferenceNode"]

        if not clean:
            return refers
            
        for ref in refers:
            try:
                cmds.referenceQuery(ref, filename=True)
            except RuntimeError:
                continue
            else:
                Datas.append(ref)
                
        return Datas or []

    def _stringAttrSearchs(self, item, stringName="tag"): 
        """
        오브젝트의 특정 String 어트리뷰트 값을 검색하여 반환합니다.
        Args:
            -item       (str): 검색할 오브젝트 이름
            -stringName (str): 검색할 어트리뷰트 이름 (기본값: "tag")
        Returns:
            어트리뷰트 값(str) 또는 없을 경우 None
        """
        if not cmds.objExists("{}.{}".format(item, stringName)):
            return None
        else:
            String = cmds.getAttr("{}.{}".format(item, stringName))
            return String
            
    def _load_reference(self, file_path, name_space=None, cleanReturn=True):
        """
        지정된 마야 파일을 씬에 레퍼런스로 로드합니다.
        Args:
            -file_path   (str): 로드할 파일의 절대 경로
            -name_space  (str): 부여할 네임스페이스 (기본값: None, None일 경우 파일명 사용)
            -cleanReturn (bool): 로드 완료 후 정확한 레퍼런스 노드 이름을 반환할지 여부 (기본값: True)
        Returns:
            생성된 레퍼런스 노드 이름(str) 또는 실패 시 None
        """
        ref_rn_node = None

        if not os.path.exists(file_path):
            cmds.warning(u">> 파일이 존재하지 않습니다: {}".format(file_path))
            return None
        
        attrDict = {"reference": True, "ignoreVersion": True, "mergeNamespacesOnClash": False, "returnNewNodes": True}
        if name_space is None:
            Path, ref_File = os.path.split(file_path)
            file_name = ref_File.split(".")[0]
            name_space = "{}".format(file_name)

        if isinstance(name_space, self._string_type) and name_space:
            attrDict["namespace"] = name_space

        try:
            load_node = cmds.file(file_path, **attrDict)
            ref_rn_node = load_node
            if load_node and cleanReturn:
                rn_nodes = cmds.ls(load_node, type="reference")
                rn_nodes = [rn for rn in rn_nodes if "sharedReferenceNode" not in rn]
                if rn_nodes:
                    ref_rn_node = rn_nodes[0]

            return ref_rn_node
        except Exception as e:
            print (u">> 레퍼런스 로드 실패: {}".format(e))
            return None
            
    def _checkDict(self, dictData, listData, prf=True):
        """
        딕셔너리 내에 특정 키 리스트가 모두 존재하는지 검사합니다.
        Args:
            -dictData (dict): 검사 대상 딕셔너리
            -listData (list): 확인하고자 하는 키(Key) 리스트
            -prf      (bool): True일 경우 검사된 항목을 출력 (기본값: True)
        Returns:
            모두 존재하면 True, 하나라도 없으면 False (bool)
        """
        if isinstance(dictData, dict) and isinstance(listData, list):
            if all(dictData.get(x) for x in listData):
                if prf:
                    for k, v in dictData.items():
                        print (u"{} : {}".format(k, v))
                return True
        return False
    
    def _find_reference_by_path(self, targetPath):
        """
        입력된 경로와 동일한 레퍼런스 노드가 씬 내에 있는지 검색하여 반환
        Args:
            -targetPath (str): 찾고자 하는 레퍼런스 파일의 절대 경로
        Returns:
            레퍼런스 노드 이름(str) 또는 없을 경우 None
        """
        references = cmds.ls(type="reference")

        for ref in references:
            if ref == "sharedReferenceNode":
                continue

            try:
                ref_path = cmds.referenceQuery(ref, filename=True)
            except:
                continue

            if os.path.normpath(ref_path) == os.path.normpath(targetPath):
                return ref

        return None



# --- 실행 예시 ---
tasks = { "ch_100_blossom_rigRN": "ch_100_blossom_xgenRN" , "ch_100_darkPrince_rigRN" : "ch_100_darkPrince_xgenRN" , "ch_100_darkPrinceBlack_rigRN" : "ch_100_darkPrince_xgenRN"}
xGen = None
for chaRN , XgenRN in tasks.items():
    xGen = XgenData()
    xGen.define_pathData()
    xGen.get_chaReferenceData()

    isReference = cmds.objExists(chaRN)
    if isReference:
        xGen.refer_xGenFile(chaRN)
        xGen.connect_xGenData(XgenRN)


