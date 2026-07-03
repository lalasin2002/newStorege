//Maya ASCII 2022 scene
//Name: Shp_3D_Pyramid.ma
//Last modified: Wed, Jun 17, 2026 12:29:45 PM
//Codeset: 949
requires maya "2022";
requires "mtoa" "4.2.1";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202102181415-29bfc1879c";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 19045)";
fileInfo "UUID" "26E98447-4CD3-F0B5-435D-5DBFF1A7A8AE";
createNode transform -n "Shp_3D_Pyramid";
	rename -uid "374531BD-476B-15B6-FC2F-B9A46AAF3506";
createNode nurbsCurve -n "Shp_3D_PyramidShape" -p "Shp_3D_Pyramid";
	rename -uid "0F61879C-46C4-4505-E208-B4AF2582CF88";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 15 0 no 3
		16 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
		16
		0.00021391361107238053 1 -0.00021391361107238053
		-0.00021391361107238053 1 -0.00021391361107238053
		-0.00021391361107238053 1 0.00021391361107238053
		0.00021391361107238053 1 0.00021391361107238053
		0.00021391361107238053 1 -0.00021391361107238053
		1 -1 -1
		-1 -1 -1
		-0.00021391361107238053 1 -0.00021391361107238053
		-0.00021391361107238053 1 0.00021391361107238053
		-1 -1 1
		-1 -1 -1
		-1 -1 1
		1 -1 1
		0.00021391361107238053 1 0.00021391361107238053
		1 -1 1
		1 -1 -1
		;
createNode transform -s -n "persp";
	rename -uid "D5988C1E-4695-8E80-D4F2-DC858618FF27";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 6.2121888451440883 2.4786003751433281 10.277792542950632 ;
	setAttr ".r" -type "double3" -5.7383527296034682 31.000000000000146 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "5C58F98E-4E2D-B1DB-FB22-249E07794317";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 11.998087284388893;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "D6C93852-4108-ADFB-DF64-CBB9FBF5CD45";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "4EB8D120-4781-23F7-CB3C-FB9A7E279D2A";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "A20734BE-45B0-C6F4-5CD2-0C880F5FFB45";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "8733BD3B-49C5-1DBF-3E42-EC8B7D8392A7";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "8516B778-4262-685C-41BC-F78DD4AA13CC";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "F359082C-4DF7-6084-BEA7-008F461E4DC3";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 6.3642342685102449;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "0695A7B0-41CA-DD8A-F79E-F383122E5D0B";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager1";
	rename -uid "B4657367-4738-2C84-4219-AEA07C117422";
createNode poseInterpolatorManager -n "poseInterpolatorManager1";
	rename -uid "00BC9043-4823-F903-3DA4-48A81F194A25";
createNode displayLayerManager -n "layerManager";
	rename -uid "976D019E-4E47-085D-FE2B-7699EFDCE9F2";
createNode displayLayer -n "defaultLayer";
	rename -uid "1C5060AB-4EA5-7529-BE7D-A083C512469A";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "18C9833A-487A-4059-47E9-DD8061ADEDCE";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "CEE304CE-49A6-CA13-CA73-C1A55E6DBFE7";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "B916F8C2-4A94-94B5-8E36-5D8CFE1F2420";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "ADD6DE09-4213-2FE7-DC7B-05A98893A32B";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "2BE58E00-4631-538E-27E8-A5B1ABC257DA";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr ".ren" -type "string" "arnold";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya-legacy/config.ocio";
	setAttr ".vtn" -type "string" "sRGB gamma (legacy)";
	setAttr ".vn" -type "string" "sRGB gamma";
	setAttr ".dn" -type "string" "legacy";
	setAttr ".wsn" -type "string" "scene-linear Rec 709/sRGB";
	setAttr ".ovt" no;
	setAttr ".povt" no;
	setAttr ".otn" -type "string" "sRGB gamma (legacy)";
	setAttr ".potn" -type "string" "sRGB gamma (legacy)";
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
// End of Shp_3D_Pyramid.ma
