//Maya ASCII 2022 scene
//Name: Shp_2D_Soft_Square.ma
//Last modified: Wed, Jun 17, 2026 12:29:44 PM
//Codeset: 949
requires maya "2022";
requires "mtoa" "4.2.1";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202102181415-29bfc1879c";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 19045)";
fileInfo "UUID" "FFEEA6B1-45B6-55DD-CC10-A18F036D41A3";
createNode transform -n "Shp_2D_Soft_Square";
	rename -uid "FA19B56A-45B5-4550-1B3C-C8A1B5247468";
createNode nurbsCurve -n "Shp_2D_Soft_SquareShape" -p "Shp_2D_Soft_Square";
	rename -uid "3DA46815-4EAA-A985-260C-959FB497295D";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 38 0 no 3
		43 0 0 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
		 26 27 28 29 30 31 32 33 34 35 36 37 38 38 38
		41
		0 0 1
		0.33300000000000002 0 1
		0.44400000000000001 0 1
		0.5 0 1
		0.68400000000000005 0 0.95099999999999996
		0.83499999999999996 0 0.83499999999999996
		0.95099999999999996 0 0.68400000000000005
		1 0 0.5
		1 0 0.44400000000000001
		1 0 0.33300000000000002
		1 0 0
		1 0 -0.33300000000000002
		1 0 -0.44400000000000001
		1 0 -0.5
		0.95099999999999996 0 -0.68400000000000005
		0.83499999999999996 0 -0.83499999999999996
		0.68400000000000005 0 -0.95099999999999996
		0.5 0 -1
		0.44400000000000001 0 -1
		0.33300000000000002 0 -1
		0 0 -1
		-0.33300000000000002 0 -1
		-0.44400000000000001 0 -1
		-0.5 0 -1
		-0.68400000000000005 0 -0.95099999999999996
		-0.83499999999999996 0 -0.83499999999999996
		-0.95099999999999996 0 -0.68400000000000005
		-1 0 -0.5
		-1 0 -0.44400000000000001
		-1 0 -0.33300000000000002
		-1 0 0
		-1 0 0.33300000000000002
		-1 0 0.44400000000000001
		-1 0 0.5
		-0.95099999999999996 0 0.68400000000000005
		-0.83499999999999996 0 0.83499999999999996
		-0.68400000000000005 0 0.95099999999999996
		-0.5 0 1
		-0.44400000000000001 0 1
		-0.33300000000000002 0 1
		0 0 1
		;
createNode transform -s -n "persp";
	rename -uid "DE016E40-477D-7213-57B4-42A545F707B4";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 28 21 28 ;
	setAttr ".r" -type "double3" -27.938352729602379 44.999999999999972 -5.172681101354183e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "6A050E83-48E1-63B5-77BE-62BB6D59D5D3";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 44.82186966202994;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "907C110D-47B9-2A09-2EEF-ED9100BB12A1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "DEB4E4A4-4290-DE17-0AFA-EC908487C337";
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
	rename -uid "F2E12656-4C93-6F8F-1B25-F7980D00A784";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "B5974428-422A-706B-34FD-28988EA52E16";
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
	rename -uid "99D202BC-42A4-24DE-92E1-19AAB045433F";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "B745F79F-4217-DB41-DC8A-8F80C9C68A2C";
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
	rename -uid "A5190FDE-48A6-73CC-9B7F-A1B22FCBEA2A";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager1";
	rename -uid "E20839F5-4CA2-79D5-4117-30B20F57C8E9";
createNode poseInterpolatorManager -n "poseInterpolatorManager1";
	rename -uid "F6D6ACBB-477E-B1D2-B2CD-899506C2527C";
createNode displayLayerManager -n "layerManager";
	rename -uid "BD7ACD6D-412C-2BCB-EB35-85BC63E68022";
createNode displayLayer -n "defaultLayer";
	rename -uid "BBA155E2-4091-B2F6-CDB8-AEA95570C189";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "04C1485B-45FD-0B39-8000-CEA1C5951AEA";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "8F8C3BF1-4D4E-5204-8E59-3BA0D9FD1F30";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "4E966C73-4047-0407-BBFE-F8A3D77C21D5";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "DA85A360-4933-3C81-BF9A-A9B3BC0E69D0";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "4119173A-4A9D-F000-F4A3-74A761EFFB8C";
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
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
// End of Shp_2D_Soft_Square.ma
