//Maya ASCII 2022 scene
//Name: Shp_2D_Gear.ma
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
fileInfo "UUID" "51F472AA-4E9A-A77C-D174-AFA1DADF3D15";
createNode transform -n "Shp_2D_Gear";
	rename -uid "C0B690AE-4F79-4961-AADB-619C7A869583";
createNode nurbsCurve -n "Shp_2D_GearShape" -p "Shp_2D_Gear";
	rename -uid "8B297B14-4327-FDC0-E8E4-2DB1BF3B057E";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 72 0 no 3
		73 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54
		 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72
		73
		-0.087155742747658166 0 -0.99619469809174555
		-0.082797955610275267 0.15000000000000005 -0.94638496318715837
		-0.24587809178061265 0.15000000000000005 -0.91762951285684435
		-0.25881904397959232 2.7907704883625394e-19 -0.96592580300720465
		-0.42261827199695107 1.1078286428086432e-18 -0.90630778179962945
		-0.40148735839710348 0.15000000000000005 -0.860992392709648
		-0.54489761324651353 0.15000000000000005 -0.77819442736428979
		-0.57357643499632993 2.4610733361195212e-18 -0.81915202880451554
		-0.70710680627267986 4.2976939657523477e-18 -0.70710677373810982
		-0.67175146595904589 0.15000000000000005 -0.67175143505120449
		-0.77819443924438014 0.15000000000000005 -0.54489763923199785
		-0.81915204130987385 6.5618849984763846e-18 -0.57357646234947135
		-0.90630777155217368 9.1848513943887651e-18 -0.42261826309541561
		-0.86099238297456515 0.15000000000000005 -0.40148734994064483
		-0.91762953176695994 0.15000000000000005 -0.24587810330673809
		-0.96592582291258933 1.2086893474289389e-17 -0.25881905611235595
		-0.99619467496859126 1.517983659729418e-17 -0.087155745684642738
		-0.9463849412201617 0.15000000000000005 -0.082797958400410585
		-0.94638496318715837 0.15000000000000005 0.082797955610275475
		-0.99619469809174555 5.5109104395865646e-17 0.087155742747658388
		-0.96592580300720465 5.8019893414435641e-17 0.25881904397959232
		-0.91762951285684435 0.15000000000000005 0.24587809178061265
		-0.860992392709648 0.15000000000000005 0.40148735839710348
		-0.90630778179962945 6.028408395085134e-17 0.42261827199695107
		-0.81915202880451554 6.1832883694905803e-17 0.57357643499632993
		-0.77819442736428979 0.15000000000000005 0.54489761324651353
		-0.67175143505120449 0.15000000000000005 0.67175146595904589
		-0.70710677373810982 6.2619230701956263e-17 0.70710680627267986
		-0.57357646234947135 6.2619230701956263e-17 0.81915204130987385
		-0.54489763923199785 0.15000000000000005 0.77819443924438014
		-0.40148734994064483 0.15000000000000005 0.86099238297456515
		-0.42261826309541561 6.1832883694905803e-17 0.90630777155217368
		-0.25881905611235595 4.7718469292341971e-17 0.96592582291258933
		-0.24587810330673809 0.15000000000000005 0.91762953176695994
		-0.082797958400410585 0.15000000000000005 0.9463849412201617
		-0.087155745684642738 5.8019893414435641e-17 0.99619467496859126
		0.087155742747658166 5.5109104395865646e-17 0.99619469809174555
		0.082797955610275267 0.15000000000000005 0.94638496318715837
		0.24587809178061265 0.15000000000000005 0.91762951285684435
		0.25881904397959232 5.1640163016702433e-17 0.96592580300720465
		0.42261827199695107 6.028408395085134e-17 0.90630778179962945
		0.40148735839710348 0.15000000000000005 0.860992392709648
		0.54489761324651353 0.15000000000000005 0.77819442736428979
		0.57357643499632993 4.3463180906128292e-17 0.81915202880451554
		0.70710680627267986 6.2619230701956263e-17 0.70710677373810982
		0.67175146595904589 0.15000000000000005 0.67175143505120449
		0.77819443924438014 0.15000000000000005 0.54489763923199785
		0.81915204130987385 3.4475211070672448e-17 0.57357646234947135
		0.90630777155217368 6.1832883694905803e-17 0.42261826309541561
		0.86099238297456515 0.15000000000000005 0.40148734994064483
		0.91762953176695994 0.15000000000000005 0.24587810330673809
		0.96592582291258933 6.028408395085134e-17 0.25881905611235595
		0.99619467496859126 5.8019893414435641e-17 0.087155745684642738
		0.9463849412201617 0.15000000000000005 0.082797958400410585
		0.94638496318715837 0.15000000000000005 -0.082797955610275267
		0.99619469809174555 5.5109104395865646e-17 -0.087155742747658166
		0.96592580300720465 1.517983659729418e-17 -0.25881904397959232
		0.91762951285684435 0.15000000000000005 -0.24587809178061265
		0.860992392709648 0.15000000000000005 -0.40148735839710348
		0.90630778179962945 1.2086893474289389e-17 -0.42261827199695107
		0.81915202880451554 9.1848513943887651e-18 -0.57357643499632993
		0.77819442736428979 0.15000000000000005 -0.54489761324651353
		0.67175143505120449 0.15000000000000005 -0.67175146595904589
		0.70710677373810982 6.5618849984763846e-18 -0.70710680627267986
		0.57357646234947135 4.2976939657523477e-18 -0.81915204130987385
		0.54489763923199785 0.15000000000000005 -0.77819443924438014
		0.40148734994064483 0.15000000000000005 -0.86099238297456515
		0.42261826309541561 2.4610733361195212e-18 -0.90630777155217368
		0.25881905611235595 1.1078286428086432e-18 -0.96592582291258933
		0.24587810330673809 0.15000000000000005 -0.91762953176695994
		0.082797958400410585 0.15000000000000005 -0.9463849412201617
		0.087155745684642738 2.7907704883625394e-19 -0.99619467496859126
		-0.087155742747658166 0 -0.99619469809174555
		;
createNode transform -s -n "persp";
	rename -uid "CC262F29-4409-4E02-2D34-22BE6EA606F4";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 28 21 28 ;
	setAttr ".r" -type "double3" -27.938352729602379 44.999999999999972 -5.172681101354183e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "71F8BDF9-4B55-4A9D-DA56-ADBE0657EF97";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 44.82186966202994;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "71AC9B25-45CC-9B8A-15B0-E7B5ABFED6B5";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "C15E9FC7-4B44-8714-F739-F2B0464C803E";
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
	rename -uid "5CF35FDE-46BA-2503-3381-1A9BD2BD6AB3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "501BD223-4437-A286-E631-51889DE4458D";
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
	rename -uid "A17274C2-4B70-2C10-D5D5-C6A96EC15FB6";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "26AE3F35-497E-A6AC-9497-5F8C913A34DF";
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
	rename -uid "A3CBD882-4486-AA44-2849-E59D5D62A72A";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager1";
	rename -uid "7F98C58C-4981-B9AB-6BB8-6688B072E88A";
createNode poseInterpolatorManager -n "poseInterpolatorManager1";
	rename -uid "E7C92BAB-4664-1C3F-53CC-33A9E75AB47A";
createNode displayLayerManager -n "layerManager";
	rename -uid "AC45310C-4191-6BC5-B8DF-F9BF08C1076C";
createNode displayLayer -n "defaultLayer";
	rename -uid "EF32B892-44C3-B840-69D3-238F540EB645";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "26C26E21-4DA3-6A45-D174-B7BAB279F137";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "5B81744D-4C8F-4910-D146-248E26BB5AC1";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "B57A8B94-4167-1DDE-FD81-82819B7B24C7";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "A775BC74-4AE2-459A-276B-4DAA28FD2C60";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "309E7A6F-49BC-FE28-7547-E88DC2A97D1D";
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
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
// End of Shp_2D_Gear.ma
