//Maya ASCII 2022 scene
//Name: Shp_3D_Hard_Ring.ma
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
fileInfo "UUID" "CE606F4B-4FE1-10AA-9327-6B991966C712";
createNode transform -n "Shp_3D_Hard_Ring";
	rename -uid "02D68EAD-43AD-EB69-B617-AFBCFA1F254A";
createNode nurbsCurve -n "Shp_3D_Hard_RingShape" -p "Shp_3D_Hard_Ring";
	rename -uid "C9EB7ADA-45EA-D521-27B0-E1B33C2096C1";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 33 0 no 3
		34 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29 30 31 32 33
		34
		0.70710700000000004 0.091640799999999994 0.70710700000000004
		1 0.091640799999999994 0
		1 -0.091640799999999994 0
		0.70710700000000004 -0.091640799999999994 0.70710700000000004
		0.70710700000000004 0.091640799999999994 0.70710700000000004
		0 0.091640799999999994 1
		0 -0.091640799999999994 1
		0.70710700000000004 -0.091640799999999994 0.70710700000000004
		0 -0.091640799999999994 1
		-0.70710700000000004 -0.091640799999999994 0.70710700000000004
		-0.70710700000000004 0.091640799999999994 0.70710700000000004
		0 0.091640799999999994 1
		-0.70710700000000004 0.091640799999999994 0.70710700000000004
		-1 0.091640799999999994 0
		-1 -0.091640799999999994 0
		-0.70710700000000004 -0.091640799999999994 0.70710700000000004
		-0.70710700000000004 0.091640799999999994 0.70710700000000004
		-0.70710700000000004 -0.091640799999999994 0.70710700000000004
		-1 -0.091640799999999994 0
		-0.70710700000000004 -0.091640799999999994 -0.70710700000000004
		-0.70710700000000004 0.091640799999999994 -0.70710700000000004
		-1 0.091640799999999994 0
		-0.70710700000000004 0.091640799999999994 -0.70710700000000004
		0 0.091640799999999994 -1
		0 -0.091640799999999994 -1
		-0.70710700000000004 -0.091640799999999994 -0.70710700000000004
		0 -0.091640799999999994 -1
		0.70710700000000004 -0.091640799999999994 -0.70710700000000004
		0.70710700000000004 0.091640799999999994 -0.70710700000000004
		0 0.091640799999999994 -1
		0.70710700000000004 0.091640799999999994 -0.70710700000000004
		1 0.091640799999999994 0
		1 -0.091640799999999994 0
		0.70710700000000004 -0.091640799999999994 -0.70710700000000004
		;
createNode transform -s -n "persp";
	rename -uid "EFB9B0B3-4193-03CF-440D-D4A7B84F48A0";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 28 21 28 ;
	setAttr ".r" -type "double3" -27.938352729602379 44.999999999999972 -5.172681101354183e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "69C3AE52-45DD-3861-F81E-7084C986FDFD";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 44.82186966202994;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "CB57B400-4739-DC25-2B64-EDA814FF4A1C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "DAE6AD0C-4E9B-53CF-45B7-22A2BA197FFF";
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
	rename -uid "CF7A56FC-45A6-BDED-30EC-D0824F2EF28C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "0942CB28-40E9-213A-4C21-B9804B22984B";
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
	rename -uid "FD16ED39-4187-29B5-D976-549AF4C318E3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "004A7CD7-4912-819A-4B39-FAAF91ED54AB";
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
createNode lightLinker -s -n "lightLinker1";
	rename -uid "4497813A-42FC-D18B-9B7F-88ADDC5D49D0";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager1";
	rename -uid "47377F4C-4146-0EC1-EC21-EF8D5378644D";
createNode poseInterpolatorManager -n "poseInterpolatorManager1";
	rename -uid "6543F23E-4658-7937-ED0A-58A22EA37D1F";
createNode displayLayerManager -n "layerManager";
	rename -uid "43D548BE-44DE-0CA6-B752-DF8BE68B6712";
createNode displayLayer -n "defaultLayer";
	rename -uid "5C1A9C8C-4509-22C0-5708-F7A58520BB6D";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "80124EEE-4E88-8DD0-6EF9-3DAC500D6876";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "032DD760-44C4-AF0E-0FE7-3CA415FD6317";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "D5207C90-4DB9-65BF-C798-3191E3397EDC";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "2B083A3B-445F-EDFB-0AD2-EBADCF0C6A8D";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "04A298D8-4732-D6DF-389F-719906B7E280";
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
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
// End of Shp_3D_Hard_Ring.ma
