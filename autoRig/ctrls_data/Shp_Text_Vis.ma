//Maya ASCII 2022 scene
//Name: Shp_Text_Vis.ma
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
fileInfo "UUID" "651812B6-4C03-D567-2CE8-0EB6A002BAA9";
createNode transform -n "Shp_Text_Vis";
	rename -uid "AB0D47FF-4751-D74B-2AFB-B3A9B821F64C";
createNode nurbsCurve -n "Shp_Text_VisShape" -p "Shp_Text_Vis";
	rename -uid "BD7412D3-432A-3C16-5F67-CB8CE50C006A";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 7 2 no 3
		8 0 1 2 3 4 5 6 7
		8
		-0.94264831066131582 1.2635058546066278 0
		-1.1466433668136586 1.2635058546066278 0
		-0.67690285921096771 0 0
		-0.48793758630752565 0 0
		-0.036506916582584363 1.2635058546066278 0
		-0.21955405712127676 1.2635058546066278 0
		-0.57514831066131544 0.25830000400543218 0
		-0.94264831066131582 1.2635058546066278 0
		;
createNode nurbsCurve -n "Shp_Text_VisShape1" -p "Shp_Text_Vis";
	rename -uid "FDD8047E-4FE9-C37E-1C7F-EEBB61F393F2";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 2 no 3
		5 0 1 2 3 4
		5
		0.33101031303405759 0.93640914916992168 0
		0.13270786464214321 0.93640914916992168 0
		0.13270786464214321 0 0
		0.33101031303405759 0 0
		0.33101031303405759 0.93640914916992168 0
		;
createNode nurbsCurve -n "Shp_Text_VisShape2" -p "Shp_Text_Vis";
	rename -uid "A0A66D96-464E-173E-E8C1-6B9975E6DC04";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 2 no 3
		5 0 1 2 3 4
		5
		0.33101031303405759 1.2635058546066278 0
		0.13270786464214321 1.2635058546066278 0
		0.13270786464214321 1.0660537719726555 0
		0.33101031303405759 1.0660537719726555 0
		0.33101031303405759 1.2635058546066278 0
		;
createNode nurbsCurve -n "Shp_Text_VisShape3" -p "Shp_Text_Vis";
	rename -uid "09CD30BB-4D37-68FE-EDB5-339F69327553";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 73 2 no 3
		74 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54
		 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73
		74
		0.95504011631011954 0.95589918136596652 0
		0.88318887233734122 0.9513867616653443 0
		0.81916484355926533 0.93786692619323753 0
		0.76291615962982207 0.91532235145568852 0
		0.71447726726531979 0.88377026081085164 0
		0.67551442623138436 0.84435620784759502 0
		0.64767647266387884 0.79819094896316489 0
		0.63098062992095927 0.74532650470733641 0
		0.62540947437286321 0.68571080446243282 0
		0.64019632816314642 0.60252649068832331 0
		0.68453926563262901 0.52975539922714199 0
		0.75845571041107185 0.46743222713470467 0
		0.86194586277008023 0.41553967595100411 0
		0.96776156902313248 0.37485870480537414 0
		1.0096573877334594 0.34872148275375353 0
		1.0395953893661494 0.31973802566528303 0
		1.0575409269332878 0.28787356138229336 0
		1.0635284471511834 0.25314546346664418 0
		1.0609599637985223 0.22947273373603824 0
		1.0532541131973256 0.2077438026666642 0
		1.0404110956192021 0.18797604382038113 0
		1.0224311113357536 0.17013472259044632 0
		1.0004070425033564 0.15538264095783225 0
		0.9754325723648074 0.14484794139862053 0
		0.94752532482147167 0.13853058636188495 0
		0.91666747570037821 0.13643058836460104 0
		0.85507314205169671 0.14141158103942864 0
		0.78514831066131574 0.1563371980190276 0
		0.70691040515899628 0.18124216139316554 0
		0.62032437801361018 0.21609173655509939 0
		0.62032437801361018 0.036793389469385124 0
		0.70385586261749256 0.011801652945578098 0
		0.77995907306671119 -0.0060396698489785169 0
		0.84863440990447991 -0.016765290051698679 0
		0.9098986959457398 -0.020323140174150454 0
		0.98298221111297623 -0.015272728353738786 0
		1.049418511390686 -8.677686564624312e-05 0
		1.1091905736923215 0.025182646214961996 0
		1.1622979974746697 0.060604960620403284 0
		1.2058426523208607 0.10392397195100789 0
		1.2369434309005731 0.1529529082775114 0
		1.2556003332138055 0.20767439603805546 0
		1.2618309831619254 0.26808842897415158 0
		1.2581343698501579 0.31585042834281901 0
		1.2470441293716428 0.35946450233459487 0
		1.2285434389114369 0.39894794940948475 0
		1.2026665449142453 0.43430084466934171 0
		1.1681467294692989 0.46706778287887563 0
		1.1237689447402952 0.49881078243255633 0
		1.0695161676406852 0.5295297932624814 0
		1.0054054212570187 0.55922481536865198 0
		0.92638645648956286 0.59244301557540846 0
		0.87886741161346449 0.61642814397811818 0
		0.84493759632110532 0.64260003805160493 0
		0.82456236362457269 0.67095874786376941 0
		0.81777656078338623 0.70148679971694916 0
		0.82008469104766846 0.72241743564605698 0
		0.82700948238372818 0.7411785292625428 0
		0.83855073451995843 0.75782235145568855 0
		0.85470864772796629 0.77229668140411345 0
		0.87496251583099349 0.78402899265289294 0
		0.89882607936859149 0.79241161108016955 0
		0.92626489162445047 0.79744463682174649 0
		0.95731359958648654 0.79911079645156857 0
		1.0014831018447872 0.79657691001892061 0
		1.055649161338805 0.78894055366516092 0
		1.1198468255996699 0.77623637437820414 0
		1.1940408468246453 0.75844709873199467 0
		1.1940408468246453 0.92545789718627924 0
		1.1519713926315298 0.93356288909912077 0
		1.0942475080490106 0.94333394050598141 0
		1.0421987199783325 0.95031080245971689 0
		0.99579058170318624 0.95449337482452401 0
		0.95504011631011954 0.95589918136596652 0
		;
createNode transform -s -n "persp";
	rename -uid "BFFBE07D-44E3-3C3B-26B1-F5935DE5B291";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 28 21 28 ;
	setAttr ".r" -type "double3" -27.938352729602379 44.999999999999972 -5.172681101354183e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "B0345E74-4B13-6092-31B5-91B4F9138474";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 44.82186966202994;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "A34C5C72-456B-5D70-A645-7D8A83809FA2";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "5CBCECC5-41E9-9B10-276A-5CA3EA6A318E";
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
	rename -uid "4ACD51D2-4593-CE2A-8D9F-60AD02A61FE5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "C69DE721-4D25-B783-8806-17A98519148B";
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
	rename -uid "4FF983EE-4759-BF2C-7109-EAA287B98BBE";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "7509453A-47C3-03E8-9BDF-7B9B2459AECB";
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
	rename -uid "42C3A289-4A1F-B048-E4DE-D88FE00C73E2";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager1";
	rename -uid "F74A9269-40BE-85CB-99C2-FA940F373043";
createNode poseInterpolatorManager -n "poseInterpolatorManager1";
	rename -uid "2566472B-46CD-BE2B-3433-90AA44F8CD52";
createNode displayLayerManager -n "layerManager";
	rename -uid "B05FC49C-4DE0-A108-44BF-B48360111E3E";
createNode displayLayer -n "defaultLayer";
	rename -uid "1B409C70-4532-0FFE-283D-35B72921D84D";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "CFAAE0D2-408E-35C4-2B10-F88A75F8F9E1";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "CE1E38F0-49E6-4CAE-A836-D19EBBCDB39C";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "9601EF3E-4F7A-06E6-38B2-898F7A99DD98";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "D582C4C1-4D7E-4888-531A-5BB7A8BAD563";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "0B2ECC65-4BE7-DA89-E0B1-DCBC49EC6C7A";
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
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
// End of Shp_Text_Vis.ma
