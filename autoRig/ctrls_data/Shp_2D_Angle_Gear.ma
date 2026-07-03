//Maya ASCII 2022 scene
//Name: Shp_2D_Angle_Gear.ma
//Last modified: Wed, Jun 17, 2026 12:29:43 PM
//Codeset: 949
requires maya "2022";
requires "mtoa" "4.2.1";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202102181415-29bfc1879c";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 19045)";
fileInfo "UUID" "65E1DFAB-428F-B49D-9E4F-17967774B587";
createNode transform -n "Shp_2D_Angle_Gear";
	rename -uid "CF48DFB8-4554-62AD-13AD-D88DF4B6455A";
createNode nurbsCurve -n "Shp_2D_Angle_GearShape" -p "Shp_2D_Angle_Gear";
	rename -uid "E62EAEB3-4527-138E-DD31-3FAC90C025D8";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 36 0 no 3
		37 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29 30 31 32 33 34 35 36
		37
		-0.087155742747658166 0 -0.99619469809174555
		-0.24244464299978791 0.13212239476637799 -0.9026057228488551
		-0.39559692119601841 0.13212239476637799 -0.84686287301977248
		-0.57357643499632993 1.6407155574130131e-17 -0.81915202880451554
		-0.70710680627267986 2.8651293105015635e-17 -0.70710677373810982
		-0.76635599550360145 0.13212239476637799 -0.53575908933387439
		-0.84784660328015193 0.13212239476637799 -0.3946131730313327
		-0.96592582291258933 8.0579289828595858e-17 -0.25881905611235595
		-0.99619467496859126 1.0119891064862781e-16 -0.087155745684642738
		-0.93189087959465156 0.13212239476637799 0.082025522431941611
		-0.9035894626906058 0.13212239476637799 0.24253070908379981
		-0.90630778179962945 4.0189389300567522e-16 0.42261827199695107
		-0.81915202880451554 4.1221922463270514e-16 0.57357643499632993
		-0.66159367032400218 0.13212239476637799 0.66167976682783691
		-0.5367428291756251 0.13212239476637799 0.7664420615876133
		-0.42261826309541561 4.1221922463270514e-16 0.90630777155217368
		-0.25881905611235595 3.1812312861561297e-16 0.96592582291258933
		-0.081939459094010042 0.13212239476637799 0.93197692405851396
		0.081041782590191333 0.13212239476637799 0.93197694567866329
		0.25881904397959232 3.4426775344468261e-16 0.96592580300720465
		0.42261827199695107 4.0189389300567522e-16 0.90630778179962945
		0.53584512984269961 0.13212239476637799 0.76644204989510312
		0.66069602698608665 0.13212239476637799 0.66167973640801392
		0.81915204130987385 2.2983474047114951e-16 0.57357646234947135
		0.90630777155217368 4.1221922463270514e-16 0.42261826309541561
		0.90269180754440215 0.13212239476637799 0.24253072042793372
		0.9309931842167638 0.13212239476637799 0.082025525178021919
		0.99619469809174555 3.6739402930577075e-16 -0.087155742747658166
		0.96592580300720465 1.0119891064862781e-16 -0.25881904397959232
		0.84694893910378466 0.13212239476637799 -0.39461318135426826
		0.76545831005335296 0.13212239476637799 -0.53575906375868765
		0.70710677373810982 4.3745899989842548e-17 -0.70710680627267986
		0.57357646234947135 2.8651293105015635e-17 -0.81915204130987385
		0.39469923911534466 0.13212239476637799 -0.84686286343840123
		0.24154698058618385 0.13212239476637799 -0.90260574146038997
		0.087155745684642738 1.8605136589083586e-18 -0.99619467496859126
		-0.087155742747658166 0 -0.99619469809174555
		;
createNode transform -s -n "persp";
	rename -uid "FA02B3E9-4C4F-0BFF-3DD7-C1ACF070B7E1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 28 21 28 ;
	setAttr ".r" -type "double3" -27.938352729602379 44.999999999999972 -5.172681101354183e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "57341BBA-4D0F-3322-D5D7-D7BA6718BB34";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 44.82186966202994;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "035078CB-484B-0C87-EE24-718CBF5B7005";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "8EE26769-4550-B837-2268-C29191A4F5C8";
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
	rename -uid "15A706FF-4D23-61E6-F429-8CA446A621B0";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "F4D18A97-4EFC-616B-2040-67ADE1299270";
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
	rename -uid "8D24D03F-44D0-1C85-9227-C0AC5FB32A6D";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "7D93C51D-4743-394D-8B8A-D18E3A963E88";
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
	rename -uid "E812EB72-44C3-9A46-371D-C689A3383BB6";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager1";
	rename -uid "DEAF1553-4BE5-697F-DB2A-8ABB8D926B1F";
createNode poseInterpolatorManager -n "poseInterpolatorManager1";
	rename -uid "2B05D1AE-413E-FFA5-F366-C48EA1B4491F";
createNode displayLayerManager -n "layerManager";
	rename -uid "6AF299F2-476D-3453-9B04-6EAB39AD789E";
createNode displayLayer -n "defaultLayer";
	rename -uid "9F6690DF-422F-FF36-A87E-70B96910872F";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "BEE7077A-4C1E-EA10-128E-CD99BF9604F4";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "4C1887F5-4D0C-0EFC-2FF7-74BDF47FE56D";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "23797A84-4DE4-6D4B-186B-55AACBECD11F";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "79CE4758-4EC6-35DC-D26E-0880A272A426";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "69D7802B-4953-EF4A-A03A-7C993889D670";
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
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
// End of Shp_2D_Angle_Gear.ma
