//Maya ASCII 2022 scene
//Name: Shp_3D_Orbs.ma
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
fileInfo "UUID" "92915A57-4A47-E9B0-7FBA-648DDA93E6C6";
createNode transform -n "Shp_3D_Orbs";
	rename -uid "3A329AB9-413E-A011-3BA5-5EBDE48A5E98";
createNode nurbsCurve -n "Shp_3D_OrbsShape" -p "Shp_3D_Orbs";
	rename -uid "4E965432-424A-2795-6EEE-029E2C50123D";
	setAttr -k off ".v";
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[0:10]" -type "double3" -1.5672232497824492 0 1.1102230246251565e-16 
		-1.1081941875543877 0 1.1081941875543877 1.1102230246251565e-16 0 1.5672232497824488 
		1.1081941875543881 0 1.1081941875543881 1.567223249782449 0 0 1.1081941875543884 
		0 -1.1081941875543884 -1.1102230246251565e-16 0 -1.5672232497824488 -1.1081941875543879 
		0 -1.1081941875543884 0 0 0 0 0 0 0 0 0;
createNode nurbsCurve -n "Shp_3D_OrbsShape1" -p "Shp_3D_Orbs";
	rename -uid "C7153365-406C-BA09-2DEA-AF96685925D4";
	setAttr -k off ".v";
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[0:10]" -type "double3" -0.78361162489122449 0 -0.78361162489122449 
		-6.7857323231109122e-17 0 -6.7857323231109122e-17 0.78361162489122449 0 0.78361162489122449 
		1.1081941875543881 0 1.1081941875543881 0.78361162489122449 0 0.78361162489122449 
		1.1100856969603225e-16 0 1.1100856969603225e-16 -0.78361162489122449 0 -0.78361162489122449 
		-1.1081941875543881 0 -1.1081941875543881 0 0 0 0 0 0 0 0 0;
createNode nurbsCurve -n "Shp_3D_OrbsShape2" -p "Shp_3D_Orbs";
	rename -uid "957ACBCE-4D23-53B8-B1F8-AFB17C2FF0D4";
	setAttr -k off ".v";
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[0:10]" -type "double3" -0.7836116248912246 -1.1102230246251565e-16 
		0.78361162489122449 -1.1081941875543877 -1.1081941875543877 6.7857323231109122e-17 
		-0.78361162489122438 -1.5672232497824488 -0.78361162489122449 1.0408340855860843e-17 
		-1.1081941875543884 -1.1081941875543881 0.78361162489122449 0 -0.78361162489122449 
		1.1081941875543884 1.1081941875543884 -1.1100856969603225e-16 0.78361162489122438 
		1.5672232497824488 0.78361162489122449 8.3266726846886753e-17 1.1081941875543884 
		1.1081941875543881 0 0 0 0 0 0 0 0 0;
createNode transform -s -n "persp";
	rename -uid "E595564A-4BC5-B9C9-5857-76B908DF494C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 28 21 28 ;
	setAttr ".r" -type "double3" -27.938352729602379 44.999999999999972 -5.172681101354183e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "4CA6D76D-491A-DAF6-6B7A-B29E3B0F8CF1";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 44.82186966202994;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "401C4DB0-4EC5-6373-A0FF-B69E1AA4868D";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "C48E9F6B-4CD2-4EEE-EDBB-BC9DAD798B45";
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
	rename -uid "2A0FE05E-4547-FFBE-D429-9C8F5B6B1D51";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "8C978C75-41DF-1FFF-C6EB-59B4F74CDB38";
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
	rename -uid "7D91BB1A-41FD-1284-7CA9-1E8A4C2E731D";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "910D8B54-4FD9-1027-4D9E-C1ADA0D7CB48";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode makeNurbCircle -n "makeNurbCircle4";
	rename -uid "22B908DA-4726-7B33-E46F-E59CBA4765AD";
	setAttr ".nr" -type "double3" 0 1 0 ;
createNode makeNurbCircle -n "makeNurbCircle5";
	rename -uid "DD16F1CE-44FD-388A-2C33-D9A0DA300A8F";
createNode makeNurbCircle -n "makeNurbCircle6";
	rename -uid "3E3B2F4B-4FDD-C35E-8FBF-39971632C834";
	setAttr ".nr" -type "double3" 1 0 0 ;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "A45CCAF8-4E2B-5BE8-8D81-859E139ACC42";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager1";
	rename -uid "2573AC2D-4932-98A9-8B4A-69BECD36D099";
createNode poseInterpolatorManager -n "poseInterpolatorManager1";
	rename -uid "B4420EA7-4FEE-A19E-2F78-63BF1574CC36";
createNode displayLayerManager -n "layerManager";
	rename -uid "C8AB8791-4E36-DBC0-9F9E-F6A6418D0F05";
createNode displayLayer -n "defaultLayer";
	rename -uid "C018B8D6-4669-81C1-300E-DE97B2F66268";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "93C7EDAA-49FC-4EBB-2EA5-47BF49E597A7";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "B286BBC5-4AAC-38B9-9590-E5BB70C65868";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "214714D9-4B20-5B6A-47C9-8799FAFC4324";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "33C16B92-4BA1-5C27-0AAD-2EAD538CAC4F";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "C0C5485A-415C-C010-1D8A-CD8CC2CE267F";
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
connectAttr "makeNurbCircle4.oc" "Shp_3D_OrbsShape.cr";
connectAttr "makeNurbCircle5.oc" "Shp_3D_OrbsShape1.cr";
connectAttr "makeNurbCircle6.oc" "Shp_3D_OrbsShape2.cr";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
// End of Shp_3D_Orbs.ma
