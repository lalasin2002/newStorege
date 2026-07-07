//Maya ASCII 2022 scene
//Name: guide_quad_root.ma
//Last modified: Mon, Jul 06, 2026 04:37:16 PM
//Codeset: 949
requires maya "2022";
requires -nodeType "VRaySettingsNode" -dataType "VRaySunParams" -dataType "vrayFloatVectorData"
		 -dataType "vrayFloatVectorData" -dataType "vrayIntData" "vrayformaya" "Unknown";
requires "mtoa" "5.0.0.4";
currentUnit -l centimeter -a degree -t film;
fileInfo "vrayBuild" "6.00.03 990e52f";
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202303271415-baa69b5798";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 19045)";
fileInfo "UUID" "694AB9C4-4F18-4AAF-72F7-F2A56CB81E8D";
createNode transform -s -n "persp";
	rename -uid "E98F2045-41CF-383A-1CE8-38B73E6C7918";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 54.993120515668686 48.494272893144306 -6.8911786844614014 ;
	setAttr ".r" -type "double3" -26.73835272958333 91.000000000004718 -7.6333312355124402e-14 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "2AC9D49C-4FB1-6C91-B00F-20B93A1B746F";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 60.477238873128009;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "AD0B0878-418C-62EA-829D-319DFF219FC1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "7EA0BBE2-46BE-2449-0F25-F68A998FDD25";
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
	rename -uid "F1651509-4DCB-5777-50D5-779BD3A16663";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "1F3F4646-4467-989E-363D-E69C39687FF9";
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
	rename -uid "F9C8F567-4683-9354-2706-44B4951E094E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 33.58374107073967 4.2914073770164691 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "296BF61A-4FA3-3103-C3AE-D1B4098E2382";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 131.52488509420809;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -n "root_nonParent";
	rename -uid "32B077C1-4EE4-5706-8EC1-EA96F01D924D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
createNode transform -n "neck_Crv" -p "root_nonParent";
	rename -uid "7F835C6E-4ED5-EADC-02AC-A08133A1C975";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "neck";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "neck_type";
	setAttr ".rig_side" -type "string" "C";
createNode nurbsCurve -n "neck_CrvShape" -p "neck_Crv";
	rename -uid "92FEEFA1-4299-DB9D-4692-F6AEF3C10091";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		3 2 0 no 3
		7 0 0 0 0.5 1 1 1
		5
		0 23 11.5
		0 24 11.916250000000002
		0 26 12.75
		0 27.999999999999996 13.583750000000002
		0 29 14
		;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "neck";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "neck_type";
	setAttr ".rig_side" -type "string" "C";
createNode nurbsCurve -n "neck_CrvShape1Orig" -p "neck_Crv";
	rename -uid "EDFC0EE6-41AC-26C1-EAA6-0598EFC80ED1";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr -s 2 ".gtag";
	setAttr ".gtag[0].gtagnm" -type "string" "cluster1";
	setAttr ".gtag[0].gtagcmp" -type "componentList" 1 "cv[1]";
	setAttr ".gtag[1].gtagnm" -type "string" "cluster2";
	setAttr ".gtag[1].gtagcmp" -type "componentList" 1 "cv[3]";
	setAttr ".cc" -type "nurbsCurve" 
		3 2 0 no 3
		7 0 0 0 0.5 1 1 1
		5
		0 45 0
		0 46.000000001728473 0
		0 47.999999999999943 0
		0 49.999999998271583 0
		0 51 0
		

		"gtag" 2
		"cluster1" 1 "cv[1]"
		"cluster2" 1 "cv[3]";
createNode transform -n "chest_Crv" -p "root_nonParent";
	rename -uid "65941274-4BD6-4E71-060B-15AA80D9AD82";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "chest";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
createNode nurbsCurve -n "chest_CrvShape" -p "chest_Crv";
	rename -uid "E18A63C5-4162-AB9F-B8B0-288C3E8F9E71";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 6 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		3 3 0 no 3
		8 0 0 0 0.33333333333333331 0.66666666666666663 1 1 1
		6
		0 22 -10
		0 21.997560656372066 -7.7755600000000005
		0 22 -3.3200000000000003
		-0.07342204270015884 21.999999999999503 3.3200000000000003
		-0.024449540219152896 22.002441250976396 7.7755599999999987
		0 22 10
		;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "chest";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
createNode transform -n "root_mirror";
	rename -uid "BB037801-45CD-2BDD-7A90-40948BB40BF6";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".t" -type "double3" 0 22 -10 ;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "root_type";
createNode transform -n "root_loc_Grp" -p "root_mirror";
	rename -uid "5F265CF3-4724-95A8-00B2-02AC9A340E8F";
createNode transform -n "root_loc" -p "root_loc_Grp";
	rename -uid "3E3FD532-496F-2DC4-CF29-2A81729136B6";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -k true -sn "insertJnt" -ln "insertJnt" -min 0 -at "long";
	setAttr ".ove" yes;
	setAttr ".ovc" 16;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "root";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "root_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "C";
	setAttr -k on ".insertJnt" 4;
createNode locator -n "root_locShape" -p "root_loc";
	rename -uid "9B6E059A-4C98-BECF-0974-3393CF632A3B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "splne2_loc_Grp" -p "root_loc";
	rename -uid "D5BBF632-4C42-3600-BEFB-B88FDC2B9EAB";
createNode transform -n "splne2_loc" -p "splne2_loc_Grp";
	rename -uid "A9B673C3-41EB-13DF-681A-DB81841A91F2";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".t" -type "double3" -0.07342204270015884 -4.9737991503207013e-13 0 ;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "splne2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "root_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "C";
createNode locator -n "splne2_locShape" -p "splne2_loc";
	rename -uid "17863E37-44EC-909D-E42F-37BA67903EED";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode pointConstraint -n "splne2_loc_Grp_pointConstraint1" -p "splne2_loc_Grp";
	rename -uid "CAA92E3D-4E0D-4B5A-3CB1-E99FAEBB3EF7";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_root_locW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_chest_locW1" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" 0 36.652 0 ;
	setAttr -k on ".w0" 0.334;
	setAttr -k on ".w1" 0.666;
createNode transform -n "splne1_loc_Grp" -p "root_loc";
	rename -uid "03C46C3C-420D-DC82-D3DE-A09643C8859F";
createNode transform -n "splne1_loc" -p "splne1_loc_Grp";
	rename -uid "61B9F5BB-45E7-FECA-BAF1-65AC7E410574";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "splne1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "root_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "C";
createNode locator -n "splne1_locShape" -p "splne1_loc";
	rename -uid "9BDD4978-420A-E12A-F036-0B84CAFFF286";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode pointConstraint -n "splne1_loc_Grp_pointConstraint1" -p "splne1_loc_Grp";
	rename -uid "7D139799-4AC2-16FE-ACD4-5F8B86B633D6";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_root_locW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_chest_locW1" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" 0 29.348000000000003 0 ;
	setAttr -k on ".w0" 0.666;
	setAttr -k on ".w1" 0.334;
createNode transform -n "neckRoot_loc_Grp" -p "root_loc";
	rename -uid "FD793313-4242-AEF3-8464-F29CFA93FF7F";
createNode transform -n "neckRoot_loc" -p "neckRoot_loc_Grp";
	rename -uid "C8CBD832-4146-9793-777D-2CA173BF4C74";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "neckRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "neck_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "C";
createNode locator -n "neckRoot_locShape" -p "neckRoot_loc";
	rename -uid "DD20F9A3-40A4-F3C9-E68F-3FA5314CEEBF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "neckRootExtra_loc_Grp" -p "neckRoot_loc";
	rename -uid "3F0F1D5E-4BBE-5ABC-61AC-58A95C62BABF";
createNode transform -n "neckRootExtra_loc" -p "neckRootExtra_loc_Grp";
	rename -uid "DA51EAF0-4F1A-9C0A-F8ED-43ADDA2C2E29";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "chest";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "neck_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "C";
createNode locator -n "neckRootExtra_locShape" -p "neckRootExtra_loc";
	rename -uid "FFC6A147-47BE-0AFC-D6ED-B6A1D64F7969";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "neckRootExtra_loc_Grp_pointConstraint1" -p "neckRootExtra_loc_Grp";
	rename -uid "10A961B7-40BF-C265-0ACD-6181BCC82C9C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_neckRoot_locW0" -dv 1 -min 
		0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_neck_locW1" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".o" -type "double3" 0 0.00099999999999766942 0 ;
	setAttr ".rst" -type "double3" 0 46 0 ;
	setAttr -k on ".w0" 0.667;
	setAttr -k on ".w1" 0.333;
createNode transform -n "neckEndExtra_loc_Grp" -p "neckRoot_loc";
	rename -uid "F2923AF7-4C4F-D675-426C-3B9B861634FC";
createNode transform -n "neckEndExtra_loc" -p "neckEndExtra_loc_Grp";
	rename -uid "DFB9BFD4-4E2E-3ADE-D0FC-2792E40495B6";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "neckEnd";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "neck_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "C";
createNode locator -n "neckEndExtra_locShape" -p "neckEndExtra_loc";
	rename -uid "1B5A7FE6-40AF-BEBE-30B5-96B64AB8110B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "neckEndExtra_loc_Grp_pointConstraint1" -p "neckEndExtra_loc_Grp";
	rename -uid "9D430691-4EED-645B-A6D9-FDA007F67E99";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_neck_locW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_neckEnd_locW1" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".o" -type "double3" 0 -0.0010000000000047748 0 ;
	setAttr ".rst" -type "double3" 0 50 0 ;
	setAttr -k on ".w0" 0.333;
	setAttr -k on ".w1" 0.667;
createNode transform -n "neckEnd_loc_Grp" -p "neckRoot_loc";
	rename -uid "741A0674-44D8-A914-323E-ED8B94658960";
	setAttr ".t" -type "double3" 0 6 2.5 ;
createNode transform -n "neckEnd_loc" -p "neckEnd_loc_Grp";
	rename -uid "3C15D887-4273-C2DA-2244-75866412FA64";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "neckEnd";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "neck_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "C";
createNode locator -n "neckEnd_locShape" -p "neckEnd_loc";
	rename -uid "79794180-485E-C96A-04A6-E098AEB1A961";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "neckRoot_vector_Grp" -p "neckRoot_loc";
	rename -uid "EC1A814B-439E-1E6C-9E2E-9085EDF90B1A";
createNode transform -n "neckRoot_vector" -p "neckRoot_vector_Grp";
	rename -uid "3F4E2448-4C02-6E0D-A035-269F027A3FA0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "neckRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "neck_type";
	setAttr ".rig_side" -type "string" "C";
createNode nurbsCurve -n "neckRoot_vectorShape" -p "neckRoot_vector";
	rename -uid "27CD6502-4552-B1AD-B701-CC9057AD26B0";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-1.6653345369377348e-16 0 0.49999999999999983
		-1.6653345369377348e-16 0.5 -3.6977854932234928e-32
		1.6653345369377348e-16 0 -0.49999999999999983
		3.3306690738754696e-16 0 -0.99999999999999967
		-3.3306690738754696e-16 1 -7.3955709864469857e-32
		-3.3306690738754696e-16 0 0.99999999999999967
		-1.6653345369377348e-16 0 0.49999999999999983
		;
createNode aimConstraint -n "neckRoot_vector_Grp_aimConstraint1" -p "neckRoot_vector_Grp";
	rename -uid "65892559-4FD6-039D-E794-269DB70333AB";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_neck_locW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".a" -type "double3" 0 1 0 ;
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr -k on ".w0";
createNode transform -n "neck_loc_Grp" -p "neckRoot_loc";
	rename -uid "353BD92A-46A8-DC68-A0DD-11A648F60EA2";
createNode transform -n "neck_loc" -p "neck_loc_Grp";
	rename -uid "90932617-46CC-FE78-BA0F-E485A350BFB1";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "neck";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "neck_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "C";
createNode locator -n "neck_locShape" -p "neck_loc";
	rename -uid "BEF061A5-47E2-7969-B932-DD93C86A03E6";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "neck_loc_Grp_pointConstraint1" -p "neck_loc_Grp";
	rename -uid "C59F3DE6-42D5-6A8B-4380-32893D91D729";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_neckRoot_locW0" -dv 1 -min 
		0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_neckEnd_locW1" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".rst" -type "double3" 0 48 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode parentConstraint -n "neckRoot_loc_Grp_parentConstraint1" -p "neckRoot_loc_Grp";
	rename -uid "A57EA30E-4863-44EC-48A8-99A3F4E6FAFB";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "chest_locW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 0 1 1.4999999999999982 ;
	setAttr ".rst" -type "double3" 0 1 31.5 ;
	setAttr -k on ".w0";
createNode transform -n "chest_loc_Grp" -p "root_loc";
	rename -uid "8DC482D6-4DE0-5B1C-8914-2EBB6C8B331B";
	setAttr ".t" -type "double3" 0 0 20 ;
createNode transform -n "chest_loc" -p "chest_loc_Grp";
	rename -uid "649567CA-41AE-ED71-6741-C4A3ADA35EBB";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "chest";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "root_type";
	setAttr ".rig_index" -type "string" "3";
	setAttr ".rig_side" -type "string" "C";
createNode locator -n "chest_locShape" -p "chest_loc";
	rename -uid "E4FC0FC5-448A-F9E6-1152-A3830F411B42";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "chestExtra_loc_Grp" -p "root_loc";
	rename -uid "984A7306-4A1C-AAD4-9FE0-E4B6585A2386";
createNode transform -n "chestExtra_loc" -p "chestExtra_loc_Grp";
	rename -uid "50B5EF52-494C-44C6-D81C-86B1DE05991A";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "chest";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "root_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "C";
createNode locator -n "chestExtra_locShape" -p "chestExtra_loc";
	rename -uid "97FACD23-4249-172F-DC29-DE97B7164CD4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "chestExtra_loc_Grp_pointConstraint1" -p "chestExtra_loc_Grp";
	rename -uid "83F140BF-4EEC-8AD7-D0F8-D0B4119D9D74";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_splne2_locW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_chest_locW1" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".o" -type "double3" 0 0.0024412509765596724 0 ;
	setAttr ".rst" -type "double3" 0 41.555557250976562 0 ;
	setAttr -k on ".w0" 0.333;
	setAttr -k on ".w1" 0.667;
createNode transform -n "rootExtra_loc_Grp" -p "root_loc";
	rename -uid "51E7319C-40BD-63C0-CC46-15B70580637E";
createNode transform -n "rootExtra_loc" -p "rootExtra_loc_Grp";
	rename -uid "73E15950-4136-12C3-A6D1-F8B1B6CB763E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "root";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "root_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "C";
createNode locator -n "rootExtra_locShape" -p "rootExtra_loc";
	rename -uid "693234FA-4647-6E26-EF7E-10A0D6211AFF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "rootExtra_loc_Grp_pointConstraint1" -p "rootExtra_loc_Grp";
	rename -uid "BADAF22B-4AA4-2CB5-5C5E-20A920A7CCAE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_root_locW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_splne1_locW1" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -s 2 ".tg";
	setAttr ".o" -type "double3" 0 -0.0024393436279339653 0 ;
	setAttr ".rst" -type "double3" 0 24.44444465637207 0 ;
	setAttr -k on ".w0" 0.667;
	setAttr -k on ".w1" 0.333;
createNode transform -n "root_vector_Grp" -p "root_loc";
	rename -uid "28ECE944-42B6-1DC7-D3A3-FAAC095DC02A";
createNode transform -n "root_vector" -p "root_vector_Grp";
	rename -uid "1C309548-4F81-D01E-39C9-EC83C3FD9687";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "root";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
createNode nurbsCurve -n "root_vectorShape" -p "root_vector";
	rename -uid "3D7EAE15-4721-EA88-38EE-0D8CE869B006";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-1.6653345369377348e-16 -0.49999999999999989 -1.6653345369377348e-16
		-1.6653345369377348e-16 -1.6653345369377348e-16 0.50000000000000011
		1.6653345369377348e-16 0.49999999999999989 1.6653345369377348e-16
		3.3306690738754696e-16 0.99999999999999978 3.3306690738754696e-16
		-3.3306690738754696e-16 -3.3306690738754696e-16 1.0000000000000002
		-3.3306690738754696e-16 -0.99999999999999978 -3.3306690738754696e-16
		-1.6653345369377348e-16 -0.49999999999999989 -1.6653345369377348e-16
		;
createNode aimConstraint -n "root_vector_Grp_aimConstraint1" -p "root_vector_Grp";
	rename -uid "8FE3C858-4A2E-3775-18AA-F9982C158597";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_rootExtra_locW0" -dv 1 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".a" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0 0 45.000000000000007 ;
	setAttr -k on ".w0";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "D5AF66B8-4657-844B-E01F-DD94647BA014";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "99DD882D-4668-4CC7-140A-93951F23861B";
createNode displayLayer -n "defaultLayer";
	rename -uid "287D8167-4032-53EE-4996-8685FE0C83E8";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "1BE51640-4EE3-0BD3-7D2B-E48C04AAB0E0";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "F04BB8FA-4375-B4F3-1D64-59B7C4140232";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager1";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer1";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager4";
	rename -uid "FDD317AA-4F76-156F-25BE-1788B194617C";
createNode poseInterpolatorManager -n "poseInterpolatorManager4";
	rename -uid "35BC129B-459D-C73F-EA02-4EAA604BC06D";
createNode renderLayerManager -n "renderLayerManager2";
	rename -uid "2204E19E-4CC0-AAF8-3205-5FA0D67F8C04";
createNode renderLayer -n "defaultRenderLayer2";
	rename -uid "6817F74C-491A-16D8-CF48-E1A2A60FB2C6";
	setAttr ".g" yes;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "1C8CB6ED-4099-E7D1-64C9-5FA3913E0A01";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode VRaySettingsNode -s -n "vraySettings";
	rename -uid "DCA96DA6-4277-70F2-0AA3-1B93A6F67364";
	setAttr ".sver" 1;
	setAttr ".gi" yes;
	setAttr ".rfc" yes;
	setAttr ".pe" 2;
	setAttr ".se" 3;
	setAttr ".cmph" 60;
	setAttr ".csdu" 0;
	setAttr ".cfile" -type "string" "";
	setAttr ".cfile2" -type "string" "";
	setAttr ".casf" -type "string" "";
	setAttr ".casf2" -type "string" "";
	setAttr ".st" 3;
	setAttr ".msr" 6;
	setAttr ".aaft" 3;
	setAttr ".aafs" 2;
	setAttr ".dma" 24;
	setAttr ".dam" 1;
	setAttr ".pt" 0.0099999997764825821;
	setAttr ".pmt" 0;
	setAttr ".sd" 1000;
	setAttr ".ss" 0.01;
	setAttr ".pfts" 20;
	setAttr ".ufg" yes;
	setAttr ".fnm" -type "string" "";
	setAttr ".lcfnm" -type "string" "";
	setAttr ".asf" -type "string" "";
	setAttr ".lcasf" -type "string" "";
	setAttr ".urtrshd" yes;
	setAttr ".rtrshd" 2;
	setAttr ".lightCacheType" 1;
	setAttr ".ifile" -type "string" "";
	setAttr ".ifile2" -type "string" "";
	setAttr ".iasf" -type "string" "";
	setAttr ".iasf2" -type "string" "";
	setAttr ".pmfile" -type "string" "";
	setAttr ".pmfile2" -type "string" "";
	setAttr ".pmasf" -type "string" "";
	setAttr ".pmasf2" -type "string" "";
	setAttr ".dmcstd" yes;
	setAttr ".dmculs" no;
	setAttr ".dmcsat" 0.004999999888241291;
	setAttr ".cmtp" 6;
	setAttr ".cmao" 2;
	setAttr ".cg" 2.2000000476837158;
	setAttr ".mtah" yes;
	setAttr ".rgbcs" -1;
	setAttr ".suv" 0;
	setAttr ".srflc" 1;
	setAttr ".srdml" 0;
	setAttr ".seu" yes;
	setAttr ".gormio" yes;
	setAttr ".gocle" yes;
	setAttr ".gopl" 2;
	setAttr ".gopv" yes;
	setAttr ".gopvgs" 1;
	setAttr ".wi" 960;
	setAttr ".he" 540;
	setAttr ".aspr" 1.7777780294418335;
	setAttr ".productionGPUResizeTextures" 0;
	setAttr ".autolt" 0;
	setAttr ".jpegq" 100;
	setAttr ".vfbOn" yes;
	setAttr ".vfbSA" -type "Int32Array" 1055 0 4212 1 4200 0 1
		 4192 1700143739 1869181810 825893486 1632379436 1936876921 578501154 1936876886 577662825 573321530 1935764579 574235251
		 1953460082 1881287714 1701867378 1701409906 2067407475 1919252002 1852795251 741423650 1835101730 574235237 1696738338 1818386798
		 1949966949 744846706 1886938402 577007201 1818322490 573334899 1634760805 1650549870 975332716 1702195828 1931619453 1814913653
		 1919252833 1530536563 1818436219 577991521 1751327290 779317089 1886611812 1132028268 1701999215 1869182051 573317742 1886351984
		 1769239141 975336293 1702240891 1869181810 825893486 1634607660 975332717 1936278562 2036427888 1919894304 1952671090 577662825
		 1852121644 1701601889 1920219682 573334901 1634760805 975332462 1702195828 2019893804 1684955504 1701601889 1920219682 573334901
		 1718579824 577072233 573321786 1869641829 1701999987 774912546 1931619376 1600484961 1600284530 1835627120 1986622569 975336293
		 1936482662 1763847269 1717527395 577072233 740434490 1667459362 1869770847 1701603686 1952539743 1849303649 745303157 1667459362
		 1852142175 1953392996 578055781 573321274 1886088290 1852793716 1715085942 1702063201 1668227628 1717530473 577072233 977478202
		 1869762607 1835102823 1818838560 1093628773 1685025909 795571045 1635344717 842149938 1936028207 1668445551 1328509797 760170819
		 1718513507 796092265 1635344717 842149938 1717920813 1953264993 1852793647 778529126 1869177711 1864510498 1601136995 1869377379
		 1634759538 975332707 1864510517 1601136995 1886611812 1685676396 1667855973 809116261 1668227628 1985965929 1953981801 1936613746
		 1836216166 741358114 1768124194 1634951023 1852401014 1734438249 1715085925 1702063201 1931619453 1814913653 1919252833 1530536563
		 1818436219 577991521 1751327290 779317089 778462578 1920298867 1868981603 1919247468 1881287714 1701867378 1701409906 2067407475
		 1919252002 1852795251 741423650 1835101730 574235237 1920298835 540697955 574768978 1852121644 1701601889 1920219682 573334901
		 1634760805 975332462 1936482662 1696738405 1851879544 1818386788 1715085925 1702063201 1818370604 1600417381 1701080941 741358114
		 1634758434 2037672291 774978082 1931619376 1601662824 1986359920 578250089 1970435130 1931619429 1952408434 577073273 746401850
		 1651864354 2036427821 577991269 578509626 1935764579 574235251 1868654691 1701981811 1768697446 1836345447 740456553 1869770786
		 1953654128 577987945 1981971258 1769173605 975335023 1847733297 577072481 1766597178 1299474535 740456553 1634624802 577072226
		 1818322490 573334899 1634760805 975332462 1936482662 1696738405 1851879544 1818386788 1949966949 2103801202 1970479660 1634479458
		 1936876921 1566259746 578497661 1935764579 574235251 1868654691 1701981811 1868770918 1936683117 577074281 1919951404 1919250543
		 1936025972 578501154 1936876918 577662825 573321530 1701667182 1126316578 1869639023 1702127987 1696738338 1818386798 1715085925
		 1702063201 2019893804 1684955504 1634089506 744846188 1886938402 1633971809 577072226 1970435130 1646406757 1684956524 1685024095
		 809116261 1886331436 1953063777 825893497 573321262 2003789939 1701998687 2003134838 1920219682 746415477 1651864354 2036427821
		 577991269 2103270202 2066513245 1634493218 975336307 1634231074 1882092399 1701064293 1936289646 740455013 1869770786 1953654128
		 577987945 1981971258 1769173605 975335023 1847733297 577072481 1698964026 1936289646 540701285 1986096757 1634494817 577072226
		 1852121644 1701601889 1634089506 744846188 1886938402 577007201 1818322490 573334899 1634760805 1650549870 975332716 1702195828
		 1818370604 1600417381 1701080941 741358114 1634758434 2037672291 774978082 1629629488 1986622563 1715085925 1702063201 1919951404
		 1952805733 741489186 1920234274 1952935525 825893480 573321262 1768186226 975336309 808333361 2003313196 1701012289 1634887020
		 975332724 1702195828 1701061164 1936289646 1834971749 577070191 2100374842 1970479660 1634479458 1936876921 1566259746 578497661
		 1935764579 574235251 1868654691 1701850739 1634235182 1852141682 1970037294 573317746 1886351984 1769239141 975336293 1702240891
		 1869181810 825893486 1634607660 975332717 1634226978 1852141682 1970029103 573317746 1650552421 975332716 1936482662 1696738405
		 1851879544 1715085924 1702063201 2019893804 1684955504 1701601889 1920219682 573334901 1852140642 1869438820 975332708 1864510512
		 1768120688 975337844 741355057 1634235170 1852141682 1970037343 1868783474 1953853549 1715085925 1702063201 1752375852 1701868129
		 1835097966 1953396079 774978082 1931619376 1886544232 1918856805 1969841249 809116275 573322542 1920298082 1684107871 577992041
		 858665274 808464435 842281008 2100638009 1970479660 1634479458 1936876921 1566259746 578497661 1935764579 574235251 1868654691
		 1701850739 1852140590 578315891 1919951404 1919250543 1936025972 578501154 1936876918 577662825 573321530 1701667182 1277311522
		 544435813 1701209669 577991779 1852121644 1701601889 1634089506 744846188 1886938402 577007201 1818322490 573334899 1634760805
		 1650549870 975332716 1702195828 1818370604 1600417381 1701080941 741489186 1634758434 2037672291 774978082 1730292784 1701994860
		 577662815 1818322490 573334899 1918987367 1769168741 975332730 808333363 1818698284 1600483937 1734960503 975336552 741355057
		 1869373986 2002742639 1751607653 809116276 808465454 808464432 909718832 1818698284 1600483937 1701996660 1819240563 825893476
		 573321262 1953261926 1918857829 1952543855 577662825 808333370 1634935340 1634891124 1852795252 774978082 1747070000 2003071585
		 1600483937 1701012321 1634887020 577004916 1970435130 1663183973 1600416879 1836212599 1634089506 744846188 1953392930 1667330661
		 1702259060 1920219682 573334901 1702257011 1634494303 975332722 1702195828 1633821228 1734305131 1701994860 1768257375 578054247
		 1818322490 573334899 1634038371 1700750708 1667589734 1918858100 1819636581 1751342964 1701736033 1715085932 1702063201 1852121644
		 1701601889 1634493023 577987940 1970435130 1931619429 1936024681 741751330 1634492962 1601398116 1635020658 1852795252 892418594
		 573321262 1701999731 1650420577 577926508 841887802 808464432 842018864 573323321 1600484213 1952543335 577203817 1818322490
		 573334899 1952543335 1600613993 1936614756 578385001 774911290 1730292784 1769234802 1818191726 1952935525 825893480 741355056
		 1634887458 1735289204 1869576799 893002349 573321262 1952543335 1600613993 1886350451 809116261 573321262 1952543335 1600613993
		 1701999731 1752459118 774978082 1965173808 1868522867 1970037603 1852795251 1634089506 744846188 1667460898 1769174380 1935634031
		 1701670265 1667854964 1920219682 573334901 1818452847 1869181813 1701863278 1852138354 842670708 741355056 1667460898 1769174380
		 1918856815 1952543855 577662825 808333370 1668227628 1937075299 1601073001 576942689 808464698 573321262 1600484213 1634886515
		 577266548 1818322490 573334899 1601332083 1835891059 1769108581 1949966947 744846706 1919120162 1952542815 1852990836 741358114
		 1919120162 1819635039 1818716532 1600483937 1853189987 825893492 1668489772 1701076850 1953067886 893002361 741355056 1919120162
		 1852140639 577270887 774911290 1931619376 1935635043 1701867372 1918989919 1668178281 809116261 573321262 1601332083 1952737655
		 1635147624 1851877746 975332707 741355056 1919120162 1701147487 809116260 1668489772 1870290802 975334767 741355058 1919120162
		 1953460831 1869182049 809116270 573321262 1601332083 1701999731 1752459118 774978082 1965173808 1683973491 578057077 1818322490
		 573334899 1953723748 1952542815 1852990836 741358114 1937073186 1701076852 1953067886 893002361 741355056 1937073186 1634885492
		 1937074532 1918989919 1668178281 809116261 573321262 1953723748 1953065567 577922420 808333370 1969496620 2053076083 577597295
		 808333882 1969496620 1918858355 1952543855 577662825 808333370 1969496620 1935635571 1852142196 577270887 808333626 1818698284
		 1600483937 1600484213 1953718895 1701602145 1634560351 975332711 1936482662 1730292837 1701994860 1935830879 1818452340 1835622245
		 1600481121 1752457584 572668450 1651450412 1767863411 1701273965 1869576799 825893485 573321262 1953718895 1634560351 1918854503
		 1952543855 577662825 808333370 1651450412 1767863411 1701273965 1920234335 1952935525 825893480 573321262 1600484213 1953261926
		 1767862885 1701273965 1634089506 744846188 1634494242 1767859570 1701273965 1952542815 574235240 1663183906 1919249761 2037669729
		 975332720 1931619376 1701995892 1869438831 975332708 573340976 761427315 1702453612 975336306 1568496987 578497661 1935764579
		 574235251 1868654691 1986997875 1634497125 1953705593 577793377 1919951404 1919250543 1936025972 578501154 1936876918 577662825
		 573321530 1701667182 1394752034 1886216564 1696738338 1818386798 1715085925 1702063201 2019893804 1684955504 1634089506 744846188
		 1886938402 1633971809 577072226 1970435130 1931619429 1886216564 1919903839 1633647209 1852270956 741423650 1635021602 1985966189
		 1601466981 1734962273 859447918 1931619378 1886216564 1819239263 975336047 808333659 808333612 808333612 1931619421 1886216564
		 1852794463 2067407476 1919252002 1852795251 741423650 1768910882 1935635566 577075817 741355834 1835099682 578382953 573321274
		 1819898995 809116261 1702306348 1952999273 741358114 1667327522 574235237 1634300481 746398316 1635021602 1935634541 1852404340
		 2067407463 1919252002 1852795251 741423650 2002874914 1920234335 577203817 740434490 1852401186 1935633505 1852404340 574235239
		 746421538 1651864354 2036427821 577991269 2103270202 573341021 1768383826 1699180143 2067407470 1919252002 1852795251 741423650
		 1970236706 1717527923 1869376623 1852137335 1701601889 1715085924 1702063201 1869423148 1600484213 1819045734 1885304687 1953393007
		 1668246623 577004907 1818322490 573334899 1937076077 1868980069 2003790956 1768910943 2019521646 741358114 1970236706 1717527923
		 1869376623 1869635447 1601465961 809116281 1377971325 1701080677 1701402226 2067407479 1919252002 1852795251 741423650 1634624802
		 1600482402 1684956530 1918857829 1869178725 1715085934 1702063201 1701978668 1919247470 1734701663 1601073001 975319160 808333613
		 1701978668 1919247470 1734701663 1601073001 975319161 808333613 1701978668 1919247470 1734701663 1601073001 975319416 808333613
		 1701978668 1919247470 1734701663 1601073001 975319417 808333613 1769349676 1918859109 975332453 1702195828 1769349676 1734309733
		 1852138866 1920219682 573334901 2003134838 1970037343 1949966949 744846706 1701410338 1869438839 975335278 1936482662 1663183973
		 1919904879 1634493279 1834971245 577070191 741946938 1819239202 1667199599 1886216556 577662815 1970435130 1965173861 1885300083
		 1818589289 1886609759 1601463141 975335023 1936482662 1965173861 1885300083 1919905377 1600220513 2003134838 577662815 1818322490
		 573334899 1702390128 1852399468 1818193766 1701536623 1715085924 1702063201 1768956460 1600939384 1868983913 1919902559 1952671090
		 1667196005 1919904879 1715085939 1702063201 1092758653 1869182051 975336302 1702240891 1869181810 825893486 1634738732 1231385461
		 1667191376 1801676136 975332453 1936482662 1948396645 1383363429 1918858085 1869177953 825571874 1702109740 1699902579 1751342963
		 1701536613 1715085924 1702063201 1701061164 1399289186 1768186216 1918855022 1869177953 909457954 1701061164 1399289186 1768186216
		 1667196782 1801676136 975332453 1936482662 1931619429 1701995892 1685015919 1634885477 577726820 741881658 1702130466 1299146098
		 1600480367 1667590243 577004907 1818322490 2105369971 ;
	setAttr ".vfbSyncM" yes;
	setAttr ".mSceneName" -type "string" "D:/Code/MayaCode/autoRig/guide_rigs/guide_quad_root.ma";
	setAttr ".rt_cpuRayBundleSize" 4;
	setAttr ".rt_gpuRayBundleSize" 128;
	setAttr ".rt_maxPaths" 10000;
	setAttr ".rt_engineType" 3;
	setAttr ".rt_gpuResizeTextures" 0;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "5E500324-4BC9-5870-796D-49B221F8F0C4";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n"
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1878\n            -height 1092\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n"
		+ "            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n"
		+ "            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n"
		+ "            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n"
		+ "                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n"
		+ "                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showPlayRangeShades \"on\" \n                -lockPlayRangeShades \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n"
		+ "                -keyMinScale 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -valueLinesToggle 1\n                -highlightAffectedCurves 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n"
		+ "                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n"
		+ "                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n"
		+ "                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n"
		+ "                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n"
		+ "                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n"
		+ "\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n"
		+ "                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n"
		+ "                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1878\\n    -height 1092\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1878\\n    -height 1092\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 52 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "3A1D7008-4337-9727-838E-3B86555478D2";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".fzn";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".o" 1;
	setAttr -av ".unw" 1;
	setAttr -av -k on ".etw";
	setAttr -av -k on ".tps";
	setAttr -av -k on ".tms";
select -ne :hardwareRenderingGlobals;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".fzn";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av -k on ".rm";
	setAttr -av -k on ".lm";
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr -av -k on ".hom";
	setAttr -av -k on ".hodm";
	setAttr -av -k on ".xry";
	setAttr -av -k on ".jxr";
	setAttr -av -k on ".sslt";
	setAttr -av -k on ".cbr";
	setAttr -av -k on ".bbr";
	setAttr -av -k on ".mhl";
	setAttr -av -k on ".cons";
	setAttr -av -k on ".vac";
	setAttr -av -k on ".hwi";
	setAttr -av -k on ".csvd";
	setAttr -av ".ta";
	setAttr -av ".tq";
	setAttr -av -k on ".ts";
	setAttr -av ".etmr";
	setAttr -k on ".tmrm";
	setAttr -av ".tmr";
	setAttr -av ".aoon";
	setAttr -av ".aoam";
	setAttr -av ".aora";
	setAttr -av -k on ".aofr";
	setAttr -av ".aosm";
	setAttr -av -k on ".hff";
	setAttr -av ".hfd";
	setAttr -av ".hfs";
	setAttr -av ".hfe";
	setAttr -av ".hfc";
	setAttr -av ".hfcb";
	setAttr -av ".hfcg";
	setAttr -av ".hfcr";
	setAttr -av ".hfa";
	setAttr -av ".mbe";
	setAttr -av -k on ".mbt";
	setAttr -av -k on ".mbsof";
	setAttr -av -k on ".mbsc";
	setAttr -av -k on ".mbc";
	setAttr -av -k on ".mbfa";
	setAttr -av -k on ".mbftb";
	setAttr -av -k on ".mbftg";
	setAttr -av -k on ".mbftr";
	setAttr -av -k on ".mbfta";
	setAttr -av -k on ".mbfe";
	setAttr -av -k on ".mbme";
	setAttr -av -k on ".mbcsx";
	setAttr -av -k on ".mbcsy";
	setAttr -av -k on ".mbasx";
	setAttr -av -k on ".mbasy";
	setAttr -av -k on ".blen";
	setAttr -av -k on ".blth";
	setAttr -av -k on ".blfr";
	setAttr -av -k on ".blfa";
	setAttr -av -k on ".blat";
	setAttr -av ".msaa";
	setAttr -av ".aasc";
	setAttr -av -k on ".aasq";
	setAttr -av -k on ".laa";
	setAttr -k on ".gamm";
	setAttr -av -k on ".gmmv";
	setAttr -av ".fprt" yes;
	setAttr -av -k on ".rtfm";
select -ne :renderPartition;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".bbx";
	setAttr -k on ".vwm";
	setAttr -k on ".tpv";
	setAttr -k on ".uit";
	setAttr -s 2 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 3 ".r";
select -ne :initialShadingGroup;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".bbx";
	setAttr -k on ".vwm";
	setAttr -k on ".tpv";
	setAttr -k on ".uit";
	setAttr -k on ".mwc";
	setAttr -av -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr ".ro" yes;
	setAttr -k on ".hio";
	setAttr -cb on ".ai_override";
	setAttr -k on ".ai_surface_shader";
	setAttr -cb on ".ai_surface_shaderr";
	setAttr -cb on ".ai_surface_shaderg";
	setAttr -cb on ".ai_surface_shaderb";
	setAttr -k on ".ai_volume_shader";
	setAttr -cb on ".ai_volume_shaderr";
	setAttr -cb on ".ai_volume_shaderg";
	setAttr -cb on ".ai_volume_shaderb";
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".bbx";
	setAttr -k on ".vwm";
	setAttr -k on ".tpv";
	setAttr -k on ".uit";
	setAttr -k on ".mwc";
	setAttr -av -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr ".ro" yes;
	setAttr -k on ".hio";
	setAttr -cb on ".ai_override";
	setAttr -k on ".ai_surface_shader";
	setAttr -cb on ".ai_surface_shaderr";
	setAttr -cb on ".ai_surface_shaderg";
	setAttr -cb on ".ai_surface_shaderb";
	setAttr -k on ".ai_volume_shader";
	setAttr -cb on ".ai_volume_shaderr";
	setAttr -cb on ".ai_volume_shaderg";
	setAttr -cb on ".ai_volume_shaderb";
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr -av -k on ".cch";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av -k on ".macc";
	setAttr -av -k on ".macd";
	setAttr -av -k on ".macq";
	setAttr -av -k on ".mcfr";
	setAttr -cb on ".ifg";
	setAttr -av -k on ".clip";
	setAttr -av -k on ".edm";
	setAttr -av -k on ".edl";
	setAttr -av ".ren" -type "string" "arnold";
	setAttr -av -k on ".esr";
	setAttr -av -k on ".ors";
	setAttr -cb on ".sdf";
	setAttr -av -k on ".outf";
	setAttr -av -cb on ".imfkey";
	setAttr -av -k on ".gama";
	setAttr -av -k on ".exrc";
	setAttr -av -k on ".expt";
	setAttr -av -k on ".an";
	setAttr -k on ".ar";
	setAttr -av -k on ".fs";
	setAttr -av -k on ".ef";
	setAttr -av -k on ".bfs";
	setAttr -av -cb on ".me";
	setAttr -cb on ".se";
	setAttr -av -k on ".be";
	setAttr -av -cb on ".ep";
	setAttr -av -k on ".fec";
	setAttr -av -k on ".ofc";
	setAttr -cb on ".ofe";
	setAttr -cb on ".efe";
	setAttr -cb on ".oft";
	setAttr -cb on ".umfn";
	setAttr -cb on ".ufe";
	setAttr -av -k on ".pff";
	setAttr -av -k on ".peie";
	setAttr -av -k on ".ifp";
	setAttr -av -k on ".rv";
	setAttr -av -k on ".comp";
	setAttr -av -k on ".cth";
	setAttr -av -k on ".soll";
	setAttr -av -cb on ".sosl";
	setAttr -av -k on ".rd";
	setAttr -av -k on ".lp";
	setAttr -av -k on ".sp";
	setAttr -av -k on ".shs";
	setAttr -av -k on ".lpr";
	setAttr -cb on ".gv";
	setAttr -cb on ".sv";
	setAttr -av -k on ".mm";
	setAttr -av -k on ".npu";
	setAttr -av -k on ".itf";
	setAttr -av -k on ".shp";
	setAttr -cb on ".isp";
	setAttr -av -k on ".uf";
	setAttr -av -k on ".oi";
	setAttr -av -k on ".rut";
	setAttr -av -k on ".mot";
	setAttr -av -k on ".mb";
	setAttr -av -k on ".mbf";
	setAttr -av -k on ".mbso";
	setAttr -av -k on ".mbsc";
	setAttr -av -k on ".afp";
	setAttr -av -k on ".pfb";
	setAttr -av -k on ".pram";
	setAttr -av -k on ".poam";
	setAttr -av -k on ".prlm";
	setAttr -av -k on ".polm";
	setAttr -av -cb on ".prm";
	setAttr -av -cb on ".pom";
	setAttr -cb on ".pfrm";
	setAttr -cb on ".pfom";
	setAttr -av -k on ".bll";
	setAttr -av -k on ".bls";
	setAttr -av -k on ".smv";
	setAttr -av -k on ".ubc";
	setAttr -av -k on ".mbc";
	setAttr -cb on ".mbt";
	setAttr -av -k on ".udbx";
	setAttr -av -k on ".smc";
	setAttr -av -k on ".kmv";
	setAttr -cb on ".isl";
	setAttr -cb on ".ism";
	setAttr -cb on ".imb";
	setAttr -av -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -av -k on ".tlwd";
	setAttr -av -k on ".tlht";
	setAttr -av -k on ".jfc";
	setAttr -cb on ".rsb";
	setAttr -av -k on ".ope";
	setAttr -av -k on ".oppf";
	setAttr -av -k on ".rcp";
	setAttr -av -k on ".icp";
	setAttr -av -k on ".ocp";
	setAttr -cb on ".hbl";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av ".w";
	setAttr -av ".h";
	setAttr -av -k on ".pa" 1;
	setAttr -av -k on ".al";
	setAttr -av ".dar";
	setAttr -av -k on ".ldar";
	setAttr -av -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -av -k on ".isu";
	setAttr -av -k on ".pdu";
select -ne :defaultColorMgtGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya2022-default/config.ocio";
	setAttr ".vtn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".vn" -type "string" "ACES 1.0 SDR-video";
	setAttr ".dn" -type "string" "sRGB";
	setAttr ".wsn" -type "string" "ACEScg";
	setAttr ".otn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".potn" -type "string" "ACES 1.0 SDR-video (sRGB)";
select -ne :hardwareRenderGlobals;
	setAttr -av -k on ".cch";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av ".ctrs" 256;
	setAttr -av ".btrs" 512;
	setAttr -av -k off -cb on ".fbfm";
	setAttr -av -k off -cb on ".ehql";
	setAttr -av -k off -cb on ".eams";
	setAttr -av -k off -cb on ".eeaa";
	setAttr -av -k off -cb on ".engm";
	setAttr -av -k off -cb on ".mes";
	setAttr -av -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -av -k off -cb on ".mbs";
	setAttr -av -k off -cb on ".trm";
	setAttr -av -k off -cb on ".tshc";
	setAttr -av -k off -cb on ".enpt";
	setAttr -av -k off -cb on ".clmt";
	setAttr -av -k off -cb on ".tcov";
	setAttr -av -k off -cb on ".lith";
	setAttr -av -k off -cb on ".sobc";
	setAttr -av -k off -cb on ".cuth";
	setAttr -av -k off -cb on ".hgcd";
	setAttr -av -k off -cb on ".hgci";
	setAttr -av -k off -cb on ".mgcs";
	setAttr -av -k off -cb on ".twa";
	setAttr -av -k off -cb on ".twz";
	setAttr -av -k on ".hwcc";
	setAttr -av -k on ".hwdp";
	setAttr -av -k on ".hwql";
	setAttr -av -k on ".hwfr";
	setAttr -av -k on ".soll";
	setAttr -av -k on ".sosl";
	setAttr -av -k on ".bswa";
	setAttr -av -k on ".shml";
	setAttr -av -k on ".hwel";
connectAttr "neckRoot_locShape.wp" "neck_CrvShape.cp[0]";
connectAttr "neckRootExtra_locShape.wp" "neck_CrvShape.cp[1]";
connectAttr "neck_locShape.wp" "neck_CrvShape.cp[2]";
connectAttr "neckEndExtra_locShape.wp" "neck_CrvShape.cp[3]";
connectAttr "neckEnd_locShape.wp" "neck_CrvShape.cp[4]";
connectAttr "root_locShape.wp" "chest_CrvShape.cp[0]";
connectAttr "rootExtra_locShape.wp" "chest_CrvShape.cp[1]";
connectAttr "splne1_locShape.wp" "chest_CrvShape.cp[2]";
connectAttr "splne2_locShape.wp" "chest_CrvShape.cp[3]";
connectAttr "chestExtra_locShape.wp" "chest_CrvShape.cp[4]";
connectAttr "chest_locShape.wp" "chest_CrvShape.cp[5]";
connectAttr "splne2_loc_Grp_pointConstraint1.ctx" "splne2_loc_Grp.tx";
connectAttr "splne2_loc_Grp_pointConstraint1.cty" "splne2_loc_Grp.ty";
connectAttr "splne2_loc_Grp_pointConstraint1.ctz" "splne2_loc_Grp.tz";
connectAttr "splne2_loc_Grp.pim" "splne2_loc_Grp_pointConstraint1.cpim";
connectAttr "splne2_loc_Grp.rp" "splne2_loc_Grp_pointConstraint1.crp";
connectAttr "splne2_loc_Grp.rpt" "splne2_loc_Grp_pointConstraint1.crt";
connectAttr "root_loc.t" "splne2_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "root_loc.rp" "splne2_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "root_loc.rpt" "splne2_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "root_loc.pm" "splne2_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "splne2_loc_Grp_pointConstraint1.w0" "splne2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "chest_loc.t" "splne2_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "chest_loc.rp" "splne2_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "chest_loc.rpt" "splne2_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "chest_loc.pm" "splne2_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "splne2_loc_Grp_pointConstraint1.w1" "splne2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "splne1_loc_Grp_pointConstraint1.ctx" "splne1_loc_Grp.tx";
connectAttr "splne1_loc_Grp_pointConstraint1.cty" "splne1_loc_Grp.ty";
connectAttr "splne1_loc_Grp_pointConstraint1.ctz" "splne1_loc_Grp.tz";
connectAttr "splne1_loc_Grp.pim" "splne1_loc_Grp_pointConstraint1.cpim";
connectAttr "splne1_loc_Grp.rp" "splne1_loc_Grp_pointConstraint1.crp";
connectAttr "splne1_loc_Grp.rpt" "splne1_loc_Grp_pointConstraint1.crt";
connectAttr "root_loc.t" "splne1_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "root_loc.rp" "splne1_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "root_loc.rpt" "splne1_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "root_loc.pm" "splne1_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "splne1_loc_Grp_pointConstraint1.w0" "splne1_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "chest_loc.t" "splne1_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "chest_loc.rp" "splne1_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "chest_loc.rpt" "splne1_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "chest_loc.pm" "splne1_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "splne1_loc_Grp_pointConstraint1.w1" "splne1_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "neckRoot_loc_Grp_parentConstraint1.ctx" "neckRoot_loc_Grp.tx";
connectAttr "neckRoot_loc_Grp_parentConstraint1.cty" "neckRoot_loc_Grp.ty";
connectAttr "neckRoot_loc_Grp_parentConstraint1.ctz" "neckRoot_loc_Grp.tz";
connectAttr "neckRoot_loc_Grp_parentConstraint1.crx" "neckRoot_loc_Grp.rx";
connectAttr "neckRoot_loc_Grp_parentConstraint1.cry" "neckRoot_loc_Grp.ry";
connectAttr "neckRoot_loc_Grp_parentConstraint1.crz" "neckRoot_loc_Grp.rz";
connectAttr "neckRootExtra_loc_Grp_pointConstraint1.ctx" "neckRootExtra_loc_Grp.tx"
		;
connectAttr "neckRootExtra_loc_Grp_pointConstraint1.cty" "neckRootExtra_loc_Grp.ty"
		;
connectAttr "neckRootExtra_loc_Grp_pointConstraint1.ctz" "neckRootExtra_loc_Grp.tz"
		;
connectAttr "neckRootExtra_loc_Grp.pim" "neckRootExtra_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "neckRootExtra_loc_Grp.rp" "neckRootExtra_loc_Grp_pointConstraint1.crp"
		;
connectAttr "neckRootExtra_loc_Grp.rpt" "neckRootExtra_loc_Grp_pointConstraint1.crt"
		;
connectAttr "neckRoot_loc.t" "neckRootExtra_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "neckRoot_loc.rp" "neckRootExtra_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "neckRoot_loc.rpt" "neckRootExtra_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "neckRoot_loc.pm" "neckRootExtra_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "neckRootExtra_loc_Grp_pointConstraint1.w0" "neckRootExtra_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "neck_loc.t" "neckRootExtra_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "neck_loc.rp" "neckRootExtra_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "neck_loc.rpt" "neckRootExtra_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "neck_loc.pm" "neckRootExtra_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "neckRootExtra_loc_Grp_pointConstraint1.w1" "neckRootExtra_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "neckEndExtra_loc_Grp_pointConstraint1.ctx" "neckEndExtra_loc_Grp.tx"
		;
connectAttr "neckEndExtra_loc_Grp_pointConstraint1.cty" "neckEndExtra_loc_Grp.ty"
		;
connectAttr "neckEndExtra_loc_Grp_pointConstraint1.ctz" "neckEndExtra_loc_Grp.tz"
		;
connectAttr "neckEndExtra_loc_Grp.pim" "neckEndExtra_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "neckEndExtra_loc_Grp.rp" "neckEndExtra_loc_Grp_pointConstraint1.crp"
		;
connectAttr "neckEndExtra_loc_Grp.rpt" "neckEndExtra_loc_Grp_pointConstraint1.crt"
		;
connectAttr "neck_loc.t" "neckEndExtra_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "neck_loc.rp" "neckEndExtra_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "neck_loc.rpt" "neckEndExtra_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "neck_loc.pm" "neckEndExtra_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "neckEndExtra_loc_Grp_pointConstraint1.w0" "neckEndExtra_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "neckEnd_loc.t" "neckEndExtra_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "neckEnd_loc.rp" "neckEndExtra_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "neckEnd_loc.rpt" "neckEndExtra_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "neckEnd_loc.pm" "neckEndExtra_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "neckEndExtra_loc_Grp_pointConstraint1.w1" "neckEndExtra_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "neckRoot_vector_Grp_aimConstraint1.crx" "neckRoot_vector_Grp.rx";
connectAttr "neckRoot_vector_Grp_aimConstraint1.cry" "neckRoot_vector_Grp.ry";
connectAttr "neckRoot_vector_Grp_aimConstraint1.crz" "neckRoot_vector_Grp.rz";
connectAttr "neckRoot_vector_Grp.pim" "neckRoot_vector_Grp_aimConstraint1.cpim";
connectAttr "neckRoot_vector_Grp.t" "neckRoot_vector_Grp_aimConstraint1.ct";
connectAttr "neckRoot_vector_Grp.rp" "neckRoot_vector_Grp_aimConstraint1.crp";
connectAttr "neckRoot_vector_Grp.rpt" "neckRoot_vector_Grp_aimConstraint1.crt";
connectAttr "neckRoot_vector_Grp.ro" "neckRoot_vector_Grp_aimConstraint1.cro";
connectAttr "neck_loc.t" "neckRoot_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "neck_loc.rp" "neckRoot_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "neck_loc.rpt" "neckRoot_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "neck_loc.pm" "neckRoot_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "neckRoot_vector_Grp_aimConstraint1.w0" "neckRoot_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "neckRoot_loc.wm" "neckRoot_vector_Grp_aimConstraint1.wum";
connectAttr "neck_loc_Grp_pointConstraint1.ctx" "neck_loc_Grp.tx";
connectAttr "neck_loc_Grp_pointConstraint1.cty" "neck_loc_Grp.ty";
connectAttr "neck_loc_Grp_pointConstraint1.ctz" "neck_loc_Grp.tz";
connectAttr "neck_loc_Grp.pim" "neck_loc_Grp_pointConstraint1.cpim";
connectAttr "neck_loc_Grp.rp" "neck_loc_Grp_pointConstraint1.crp";
connectAttr "neck_loc_Grp.rpt" "neck_loc_Grp_pointConstraint1.crt";
connectAttr "neckRoot_loc.t" "neck_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "neckRoot_loc.rp" "neck_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "neckRoot_loc.rpt" "neck_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "neckRoot_loc.pm" "neck_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "neck_loc_Grp_pointConstraint1.w0" "neck_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "neckEnd_loc.t" "neck_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "neckEnd_loc.rp" "neck_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "neckEnd_loc.rpt" "neck_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "neckEnd_loc.pm" "neck_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "neck_loc_Grp_pointConstraint1.w1" "neck_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "neckRoot_loc_Grp.ro" "neckRoot_loc_Grp_parentConstraint1.cro";
connectAttr "neckRoot_loc_Grp.pim" "neckRoot_loc_Grp_parentConstraint1.cpim";
connectAttr "neckRoot_loc_Grp.rp" "neckRoot_loc_Grp_parentConstraint1.crp";
connectAttr "neckRoot_loc_Grp.rpt" "neckRoot_loc_Grp_parentConstraint1.crt";
connectAttr "chest_loc.t" "neckRoot_loc_Grp_parentConstraint1.tg[0].tt";
connectAttr "chest_loc.rp" "neckRoot_loc_Grp_parentConstraint1.tg[0].trp";
connectAttr "chest_loc.rpt" "neckRoot_loc_Grp_parentConstraint1.tg[0].trt";
connectAttr "chest_loc.r" "neckRoot_loc_Grp_parentConstraint1.tg[0].tr";
connectAttr "chest_loc.ro" "neckRoot_loc_Grp_parentConstraint1.tg[0].tro";
connectAttr "chest_loc.s" "neckRoot_loc_Grp_parentConstraint1.tg[0].ts";
connectAttr "chest_loc.pm" "neckRoot_loc_Grp_parentConstraint1.tg[0].tpm";
connectAttr "neckRoot_loc_Grp_parentConstraint1.w0" "neckRoot_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "chestExtra_loc_Grp_pointConstraint1.ctx" "chestExtra_loc_Grp.tx";
connectAttr "chestExtra_loc_Grp_pointConstraint1.cty" "chestExtra_loc_Grp.ty";
connectAttr "chestExtra_loc_Grp_pointConstraint1.ctz" "chestExtra_loc_Grp.tz";
connectAttr "chestExtra_loc_Grp.pim" "chestExtra_loc_Grp_pointConstraint1.cpim";
connectAttr "chestExtra_loc_Grp.rp" "chestExtra_loc_Grp_pointConstraint1.crp";
connectAttr "chestExtra_loc_Grp.rpt" "chestExtra_loc_Grp_pointConstraint1.crt";
connectAttr "splne2_loc.t" "chestExtra_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "splne2_loc.rp" "chestExtra_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "splne2_loc.rpt" "chestExtra_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "splne2_loc.pm" "chestExtra_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "chestExtra_loc_Grp_pointConstraint1.w0" "chestExtra_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "chest_loc.t" "chestExtra_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "chest_loc.rp" "chestExtra_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "chest_loc.rpt" "chestExtra_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "chest_loc.pm" "chestExtra_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "chestExtra_loc_Grp_pointConstraint1.w1" "chestExtra_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "rootExtra_loc_Grp_pointConstraint1.ctx" "rootExtra_loc_Grp.tx";
connectAttr "rootExtra_loc_Grp_pointConstraint1.cty" "rootExtra_loc_Grp.ty";
connectAttr "rootExtra_loc_Grp_pointConstraint1.ctz" "rootExtra_loc_Grp.tz";
connectAttr "rootExtra_loc_Grp.pim" "rootExtra_loc_Grp_pointConstraint1.cpim";
connectAttr "rootExtra_loc_Grp.rp" "rootExtra_loc_Grp_pointConstraint1.crp";
connectAttr "rootExtra_loc_Grp.rpt" "rootExtra_loc_Grp_pointConstraint1.crt";
connectAttr "root_loc.t" "rootExtra_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "root_loc.rp" "rootExtra_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "root_loc.rpt" "rootExtra_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "root_loc.pm" "rootExtra_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "rootExtra_loc_Grp_pointConstraint1.w0" "rootExtra_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "splne1_loc.t" "rootExtra_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "splne1_loc.rp" "rootExtra_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "splne1_loc.rpt" "rootExtra_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "splne1_loc.pm" "rootExtra_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "rootExtra_loc_Grp_pointConstraint1.w1" "rootExtra_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "root_vector_Grp_aimConstraint1.crx" "root_vector_Grp.rx";
connectAttr "root_vector_Grp_aimConstraint1.cry" "root_vector_Grp.ry";
connectAttr "root_vector_Grp_aimConstraint1.crz" "root_vector_Grp.rz";
connectAttr "root_vector_Grp.pim" "root_vector_Grp_aimConstraint1.cpim";
connectAttr "root_vector_Grp.t" "root_vector_Grp_aimConstraint1.ct";
connectAttr "root_vector_Grp.rp" "root_vector_Grp_aimConstraint1.crp";
connectAttr "root_vector_Grp.rpt" "root_vector_Grp_aimConstraint1.crt";
connectAttr "root_vector_Grp.ro" "root_vector_Grp_aimConstraint1.cro";
connectAttr "rootExtra_loc.t" "root_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "rootExtra_loc.rp" "root_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "rootExtra_loc.rpt" "root_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "rootExtra_loc.pm" "root_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "root_vector_Grp_aimConstraint1.w0" "root_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "root_loc.wm" "root_vector_Grp_aimConstraint1.wum";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "renderLayerManager1.rlmi[0]" "defaultRenderLayer1.rlid";
connectAttr "renderLayerManager2.rlmi[0]" "defaultRenderLayer2.rlid";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer1.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer2.msg" ":defaultRenderingList1.r" -na;
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
// End of guide_quad_root.ma
