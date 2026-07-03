//Maya ASCII 2022 scene
//Name: Shp_2D_Multi_Arrow.ma
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
fileInfo "UUID" "CAE024D9-4F38-616F-C566-97A52099B14C";
createNode transform -n "Shp_2D_Multi_Arrow";
	rename -uid "DC350122-48F6-64DE-AC61-4F857C3FC598";
createNode nurbsCurve -n "Shp_2D_Multi_ArrowShape" -p "Shp_2D_Multi_Arrow";
	rename -uid "D75FF3D7-4EB0-0C7B-25A8-CFABF386EB76";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 24 0 no 3
		25 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
		25
		-0.20000000000000001 0 -0.20000000000000001
		-0.20000000000000001 0 -0.60000000000000009
		-0.40000000000000002 0 -0.60000000000000009
		0 0 -1
		0.40000000000000002 0 -0.60000000000000009
		0.20000000000000001 0 -0.60000000000000009
		0.20000000000000001 0 -0.20000000000000001
		0.60000000000000009 0 -0.20000000000000001
		0.60000000000000009 0 -0.40000000000000002
		1 0 0
		0.60000000000000009 0 0.40000000000000002
		0.60000000000000009 0 0.20000000000000001
		0.20000000000000001 0 0.20000000000000001
		0.20000000000000001 0 0.60000000000000009
		0.40000000000000002 0 0.60000000000000009
		0 0 1
		-0.40000000000000002 0 0.60000000000000009
		-0.20000000000000001 0 0.60000000000000009
		-0.20000000000000001 0 0.20000000000000001
		-0.60000000000000009 0 0.20000000000000001
		-0.60000000000000009 0 0.40000000000000002
		-1 0 0
		-0.60000000000000009 0 -0.40000000000000002
		-0.60000000000000009 0 -0.20000000000000001
		-0.20000000000000001 0 -0.20000000000000001
		;
createNode transform -s -n "persp";
	rename -uid "A2768B10-4D3A-6356-C8EE-10B5203DD218";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 28 21 28 ;
	setAttr ".r" -type "double3" -27.938352729602379 44.999999999999972 -5.172681101354183e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "3136375D-40DE-A11A-D0FF-38B633F9091A";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 44.82186966202994;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "CEA4FFC6-4696-4B65-01E9-CC9C3EDCA308";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "4C4E22F9-490C-D09E-9C23-62A633980323";
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
	rename -uid "F73D5191-48AB-45BB-8798-199B8A5CCBD4";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "43AD3017-48B0-8FCD-4B8B-99A39A8D5ADF";
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
	rename -uid "495668FD-4DF0-C99B-9A76-4EB9C4AE59B3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "3C0934B3-4075-FF50-1D08-29ADA3F8022D";
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
	rename -uid "438B4660-496F-A05F-3658-2F8DB721C2E8";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager1";
	rename -uid "11746112-45F3-E9B5-8F7E-089FCE789B11";
createNode poseInterpolatorManager -n "poseInterpolatorManager1";
	rename -uid "D8AE5C71-4B3B-A4AC-5275-10A190F3C9B4";
createNode displayLayerManager -n "layerManager";
	rename -uid "A28C1084-4125-1B4D-2B69-E4A5C02EA3E4";
createNode displayLayer -n "defaultLayer";
	rename -uid "24FF6552-4359-00C7-3EBC-DD8987212748";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "88D9FB0D-4FA4-8AFB-92D9-10AF383881E0";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "8F555B9C-4103-9168-0FE1-C4A379CAB25D";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "95FB2D56-43E0-AA85-C139-B9B52DB997C8";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "FC4C8906-4416-014A-288E-0FA63423FC69";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "850FF8E5-474B-AFAA-DECB-27941A9948DC";
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
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
// End of Shp_2D_Multi_Arrow.ma
