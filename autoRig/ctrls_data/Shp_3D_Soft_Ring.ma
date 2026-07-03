//Maya ASCII 2022 scene
//Name: Shp_3D_Soft_Ring.ma
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
fileInfo "UUID" "DA7861CE-4761-E0A6-DDCE-A5AF3D08E029";
createNode transform -n "Shp_3D_Soft_Ring";
	rename -uid "30F085B3-4CC6-0203-331F-DD832EC2CFB7";
createNode nurbsCurve -n "Shp_3D_Soft_RingShape" -p "Shp_3D_Soft_Ring";
	rename -uid "3FF6C1E2-40A6-B338-95A5-7B9AE2104012";
	setAttr -k off ".v";
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[0:10]" -type "double3" -1.5672232497824492 -0.091640799999999994 
		1.1102230246251565e-16 -1.1081941875543877 -0.091640799999999994 1.1081941875543877 
		1.1102230246251565e-16 -0.091640799999999994 1.5672232497824488 1.1081941875543881 
		-0.091640799999999994 1.1081941875543881 1.567223249782449 -0.091640799999999994 
		0 1.1081941875543884 -0.091640799999999994 -1.1081941875543884 -1.1102230246251565e-16 
		-0.091640799999999994 -1.5672232497824488 -1.1081941875543879 -0.091640799999999994 
		-1.1081941875543884 0 0 0 0 0 0 0 0 0;
createNode nurbsCurve -n "Shp_3D_Soft_RingShape1" -p "Shp_3D_Soft_Ring";
	rename -uid "870B69C1-44CB-18A8-304A-748D2ACED290";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-0.7836116248912246 0.091640800000000036 -0.78361162489122449
		-1.1081941875543877 0.091640800000000064 -6.7857323231109122e-17
		-0.78361162489122438 0.091640800000000036 0.78361162489122449
		-5.7448982375248304e-17 0.091640799999999994 1.1081941875543881
		0.78361162489122449 0.091640799999999953 0.78361162489122449
		1.1081941875543884 0.091640799999999925 1.1100856969603225e-16
		0.78361162489122438 0.091640799999999953 -0.78361162489122449
		1.511240500779959e-16 0.091640799999999994 -1.1081941875543881
		-0.7836116248912246 0.091640800000000036 -0.78361162489122449
		-1.1081941875543877 0.091640800000000064 -6.7857323231109122e-17
		-0.78361162489122438 0.091640800000000036 0.78361162489122449
		;
createNode nurbsCurve -n "Shp_3D_Soft_RingShape2" -p "Shp_3D_Soft_Ring";
	rename -uid "E8AF950E-4D87-3C3C-5A96-BB8DA88B890A";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 -0.091640799999999994 1
		0 0.091640799999999994 1
		;
createNode nurbsCurve -n "Shp_3D_Soft_RingShape3" -p "Shp_3D_Soft_Ring";
	rename -uid "65E0A35C-4334-4EA3-6415-7FA2A7E89CAD";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 -0.091640799999999994 -1
		0 0.091640799999999994 -1
		;
createNode nurbsCurve -n "Shp_3D_Soft_RingShape4" -p "Shp_3D_Soft_Ring";
	rename -uid "C3EFD02F-4113-B7E1-D2B7-1FAADE70CA73";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		1 -0.091640799999999994 0
		1 0.091640799999999994 0
		;
createNode nurbsCurve -n "Shp_3D_Soft_RingShape5" -p "Shp_3D_Soft_Ring";
	rename -uid "49802596-4A06-A0BF-A745-B9B509C5BA3C";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-1 -0.091640799999999994 0
		-1 0.091640799999999994 0
		;
createNode transform -s -n "persp";
	rename -uid "E715B2F3-4141-433F-67C0-C6BFF0613BCE";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 28 21 28 ;
	setAttr ".r" -type "double3" -27.938352729602379 44.999999999999972 -5.172681101354183e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "10A3EFF7-4DF9-4B36-BE72-D0A27D172C6E";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 44.82186966202994;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "8F8C69F1-475E-8C93-2660-3D95003F049D";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "CF2411BB-463F-CC22-82FA-7AB04FE3250F";
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
	rename -uid "0FC81EDB-4974-1260-3C82-21806F461D42";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "1B3C8BA1-43D3-9859-A7FA-0E8D207C054F";
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
	rename -uid "0FCFB027-41EA-FCCA-A1E2-518647105C38";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "4DD866DE-44C5-B98D-EE50-0E876230DE96";
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
createNode makeNurbCircle -n "makeNurbCircle7";
	rename -uid "EACB5D1F-4D48-BDDA-A475-42A102CA2EBC";
	setAttr ".nr" -type "double3" 0 1 0 ;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "6BA53C68-4755-B344-947A-2392E2BD1E97";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager1";
	rename -uid "FB915C3E-4736-4B74-FF4A-CC963A302376";
createNode poseInterpolatorManager -n "poseInterpolatorManager1";
	rename -uid "403B5008-4DB9-0C1C-2271-EBA6BA1A779F";
createNode displayLayerManager -n "layerManager";
	rename -uid "139885C4-4B2F-28FA-AEAE-52B4D80DCF77";
createNode displayLayer -n "defaultLayer";
	rename -uid "0469457E-4A4B-FDEA-EB2F-2C97571F9BC1";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "2F91B885-4AFD-4DEA-D0C5-94B9DDC688A5";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "B50C17C9-4BDE-C0E8-802C-A0A5C1899108";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "77C91D1B-4948-254E-0335-F1B6C1290A2D";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "E66F8E53-4E72-B9C6-2685-C89BBB5AC47C";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "A8008F33-4471-73E4-D583-AB828921612D";
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
connectAttr "makeNurbCircle7.oc" "Shp_3D_Soft_RingShape.cr";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
// End of Shp_3D_Soft_Ring.ma
