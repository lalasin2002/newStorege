//Maya ASCII 2022 scene
//Name: guide_quad.ma
//Last modified: Fri, Jul 03, 2026 09:28:39 PM
//Codeset: 949
requires maya "2022";
requires -nodeType "VRaySettingsNode" -dataType "VRaySunParams" -dataType "vrayFloatVectorData"
		 -dataType "vrayFloatVectorData" -dataType "vrayIntData" "vrayformaya" "6";
requires "mtoa" "5.0.0.4";
currentUnit -l centimeter -a degree -t film;
fileInfo "vrayBuild" "6.00.03 990e52f";
fileInfo "application" "maya";
fileInfo "product" "Maya 2022";
fileInfo "version" "2022";
fileInfo "cutIdentifier" "202303271415-baa69b5798";
fileInfo "osv" "Windows 10 Pro v2009 (Build: 19045)";
fileInfo "UUID" "D5625A54-4D84-2624-4BDC-B7814FE146A8";
createNode transform -s -n "persp";
	rename -uid "E98F2045-41CF-383A-1CE8-38B73E6C7918";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 33.915567449675535 37.119329444294429 6.3961536267967203 ;
	setAttr ".r" -type "double3" -18.338352729581665 97.400000000002777 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "2AC9D49C-4FB1-6C91-B00F-20B93A1B746F";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 32.112002734232099;
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
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "root";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "root_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "C";
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
createNode transform -n "neckEnd_loc" -p "neckEnd_loc_Grp";
	rename -uid "3C15D887-4273-C2DA-2244-75866412FA64";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".v" no;
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
createNode pointConstraint -n "neckEnd_loc_Grp_pointConstraint1" -p "neckEnd_loc_Grp";
	rename -uid "DB08CA38-47B7-4643-F27E-EFB6C457AF51";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "head_locW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 0 6 2.5 ;
	setAttr -k on ".w0";
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
createNode transform -n "root_vector" -p "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp";
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
createNode nurbsCurve -n "root_vectorShape" -p "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp|root_vector";
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
createNode aimConstraint -n "root_vector_Grp_aimConstraint1" -p "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp";
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
createNode transform -n "L_hip_nonParent";
	rename -uid "0A773FA2-475E-1C20-4F19-C9B35EDE85C4";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode transform -n "L_hip_curve" -p "L_hip_nonParent";
	rename -uid "85DA30AE-4521-9A4C-AFF0-BCAE74D7CA39";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode nurbsCurve -n "L_hip_curveShape" -p "L_hip_curve";
	rename -uid "1BCBF604-44D1-6A75-D0E6-AF9BEF9FCB26";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		6 22 -10
		6 13 -7
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode transform -n "L_knee_curve" -p "L_hip_nonParent";
	rename -uid "4D5EC5E8-4B32-3936-BD54-6DB27F96B85A";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode nurbsCurve -n "L_knee_curveShape" -p "L_knee_curve";
	rename -uid "8F8DE170-4591-5D05-0CFF-14BD5D253989";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		6 13 -7
		6 8 -12
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode transform -n "L_ankle_curve" -p "L_hip_nonParent";
	rename -uid "D996D541-4D95-980B-C958-AE997E26B001";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode nurbsCurve -n "L_ankle_curveShape" -p "L_ankle_curve";
	rename -uid "71822E93-4B33-B12E-0B41-FF8958D8B64A";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		6 8 -12
		5.9999999999999982 2.5 -9.5000000000000036
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode transform -n "L_toeRoot_curve" -p "L_hip_nonParent";
	rename -uid "38069496-44E0-D86A-8725-A99D03374EAE";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toeRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode nurbsCurve -n "L_toeRoot_curveShape" -p "L_toeRoot_curve";
	rename -uid "150F2CC1-4900-4E58-F323-D2AFA27F5FED";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		5.9999999999999982 2.5 -9.5000000000000036
		6 1 -9
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode transform -n "L_toe1_curve" -p "L_hip_nonParent";
	rename -uid "D2AC1B76-4C7B-8DC9-A751-F5B72BF2A064";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toe1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode nurbsCurve -n "L_toe1_curveShape" -p "L_toe1_curve";
	rename -uid "323C79AE-4006-2041-4BB7-99B1A4E6E747";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		6 1 -9
		6 1 -8
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode transform -n "L_hip_loc_mirror";
	rename -uid "0D3B460E-455F-817B-2903-41B760100227";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode transform -n "L_hip_loc_Grp" -p "L_hip_loc_mirror";
	rename -uid "112EFCFA-4E3B-5A79-3FA8-6B83B4F06F48";
createNode transform -n "L_hip_loc" -p "L_hip_loc_Grp";
	rename -uid "DB2092A4-455E-6C48-52CD-69BF3490786D";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_hip_locShape" -p "L_hip_loc";
	rename -uid "C925CC4A-49D9-A3D3-B9E8-88B55317FB0B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_knee_loc_Grp" -p "L_hip_loc";
	rename -uid "97AFDB30-439F-6FE7-C05F-E48E40874E1D";
	setAttr ".t" -type "double3" 0 -9 3.0000000000000004 ;
createNode transform -n "L_knee_loc" -p "L_knee_loc_Grp";
	rename -uid "E040BE2A-48A9-15BA-9842-C1A489910185";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_knee_locShape" -p "L_knee_loc";
	rename -uid "FE9EE597-4F87-FE02-0A0B-A987DA6BBACA";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_hipExtra_loc_Grp" -p "L_knee_loc";
	rename -uid "C662CE4D-4C38-6676-30F4-83AFA5090315";
	setAttr ".r" -type "double3" 3.1805546814635168e-15 0 0 ;
createNode transform -n "L_hipExtra_loc" -p "L_hipExtra_loc_Grp";
	rename -uid "4E021C0F-4521-8B15-6FE3-FD92FF7F0508";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "hipExtra";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_hipExtra_locShape" -p "L_hipExtra_loc";
	rename -uid "92D35927-4FC2-588F-1F93-2FB689B4BEF7";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_hipExtra_loc_Grp_parentConstraint1" -p "L_hipExtra_loc_Grp";
	rename -uid "76E4ADA2-49E7-7E43-8038-78A7FF041796";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_aim_support1W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0 1.8007134162157676 0.95782628522115054 ;
	setAttr ".tg[0].tor" -type "double3" 16.699244233993621 0 0 ;
	setAttr ".lr" -type "double3" 3.1805546814635168e-15 0 0 ;
	setAttr ".rst" -type "double3" 0 2.0000000000000036 0.39999999999999947 ;
	setAttr ".rsrr" -type "double3" 3.1805546814635168e-15 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_kneeExtra_loc_Grp" -p "L_knee_loc";
	rename -uid "C0616FAA-48C2-C560-4F6A-C6B17C7F57B0";
	setAttr ".t" -type "double3" 0 0 1 ;
createNode transform -n "L_kneeExtra_loc" -p "L_kneeExtra_loc_Grp";
	rename -uid "DC0316E1-4FB1-F05A-2139-909B384AC62A";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "kneeExtra";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_kneeExtra_locShape" -p "L_kneeExtra_loc";
	rename -uid "567BCA94-48A0-0FAD-BB7F-BE8EF9F0A620";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_knee_ankleExtra1_loc_Grp" -p "L_knee_loc";
	rename -uid "1ED14B2C-4D35-53F5-5CB3-1DA7946BF2C9";
createNode transform -n "L_knee_ankleExtra1_loc" -p "L_knee_ankleExtra1_loc_Grp";
	rename -uid "6883D17D-4756-1EAC-0C32-4BADB56492BD";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "knee_ankle1";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_knee_ankleExtra1_locShape" -p "L_knee_ankleExtra1_loc";
	rename -uid "21D683E1-46AD-2F7D-4DC5-A58023061AA4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_knee_ankleExtra1_loc_Grp_parentConstraint1" -p "L_knee_ankleExtra1_loc_Grp";
	rename -uid "7D8335EA-45AF-912B-09E4-E9874171A9EA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_aim_support2W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" -8.8817841970012523e-16 -1.4142135623730976 
		0.70710678118654968 ;
	setAttr ".tg[0].tor" -type "double3" -45.000000000000014 0 0 ;
	setAttr ".rst" -type "double3" -8.8817841970012523e-16 -1.5000000000000036 -0.49999999999999956 ;
	setAttr -k on ".w0";
createNode transform -n "L_L_aim_support1" -p "L_knee_loc";
	rename -uid "35C6505C-47E2-A80C-4342-5DA28D415F66";
	setAttr ".t" -type "double3" 0 0 -4.4408920985006262e-16 ;
createNode aimConstraint -n "L_L_aim_support1_aimConstraint1" -p "L_L_aim_support1";
	rename -uid "0D3D7A39-4BDC-767F-7831-F4A25490EDD7";
	addAttr -dcb 0 -ci true -sn "w0" -ln "hip_locW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -16.699244233993618 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_L_aim_support2" -p "L_knee_loc";
	rename -uid "E6B7A2AF-4B3B-7613-6022-ADA6D5001C78";
	setAttr ".t" -type "double3" 0 0 -4.4408920985006262e-16 ;
createNode aimConstraint -n "L_L_aim_support2_aimConstraint1" -p "L_L_aim_support2";
	rename -uid "430DD875-45FF-77F7-9B56-8CA327D11CA4";
	addAttr -dcb 0 -ci true -sn "w0" -ln "ankle_locW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 -1 0 ;
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 45.000000000000007 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_ankle_loc_Grp" -p "L_hip_loc";
	rename -uid "29CD69AE-470B-1288-FD67-D1B956935A3F";
	setAttr ".t" -type "double3" 0 -14 -2 ;
createNode transform -n "L_ankle_loc" -p "L_ankle_loc_Grp";
	rename -uid "A85A9190-4845-1541-8C91-56A7CB9026A3";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_ankle_locShape" -p "L_ankle_loc";
	rename -uid "A712B831-4C5C-A53B-8136-EB943DD5F210";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_knee_ankleExtra2_loc_Grp" -p "L_ankle_loc";
	rename -uid "39E9D80C-45FB-9672-3DC0-74B3CD7F0A3A";
createNode transform -n "L_knee_ankleExtra2_loc" -p "L_knee_ankleExtra2_loc_Grp";
	rename -uid "69580D13-4F8F-6F3C-B094-529E5BE7CD0C";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "knee_ankle2";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_knee_ankleExtra2_locShape" -p "L_knee_ankleExtra2_loc";
	rename -uid "7A3B8E55-44B0-7BE0-DA01-7389CADA760A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_knee_ankleExtra2_loc_Grp_parentConstraint1" -p "L_knee_ankleExtra2_loc_Grp";
	rename -uid "80068C90-44FB-5A9F-EAB1-3B8735936D75";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_aim_support3W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 8.8817841970012523e-16 1.060660171779821 -0.70710678118654702 ;
	setAttr ".tg[0].tor" -type "double3" -45.000000000000014 0 0 ;
	setAttr ".rst" -type "double3" 8.8817841970012523e-16 1.25 0.25000000000000044 ;
	setAttr -k on ".w0";
createNode transform -n "L_ankleExtra_loc_Grp" -p "L_ankle_loc";
	rename -uid "0E4AB3A6-44C0-FE73-C063-F8A01EBE0F60";
	setAttr ".t" -type "double3" 0 0 -1 ;
createNode transform -n "L_ankleExtra_loc" -p "L_ankleExtra_loc_Grp";
	rename -uid "159C47DC-4829-1650-8C29-EE8328ED04D9";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "ankleExtra";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_ankleExtra_locShape" -p "L_ankleExtra_loc";
	rename -uid "35480ADC-49B9-BD35-B71B-24A25F2FDE8E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_toeExtra_loc_Grp" -p "L_ankle_loc";
	rename -uid "250C1A3A-4E1B-28E4-9A33-748314567CE9";
	setAttr ".r" -type "double3" -3.1805546814635168e-15 0 0 ;
createNode transform -n "L_toeExtra_loc" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_ankle_loc_Grp|L_ankle_loc|L_toeExtra_loc_Grp";
	rename -uid "47F78E92-4606-529A-5E57-F486331D36CF";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toeExtra";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_toeExtra_locShape" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_ankle_loc_Grp|L_ankle_loc|L_toeExtra_loc_Grp|L_toeExtra_loc";
	rename -uid "1FAFF1D4-48DD-C17D-D437-2F9028ADA5B2";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_toeExtra_loc_Grp_parentConstraint1" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_ankle_loc_Grp|L_ankle_loc|L_toeExtra_loc_Grp";
	rename -uid "288335C9-44A1-4696-ED75-CB9B60EB9DE0";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_aim_support4W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 8.8817841970012523e-16 -1.2441587657862474 
		-0.92847669088525886 ;
	setAttr ".tg[0].tor" -type "double3" 21.801409486351812 0 0 ;
	setAttr ".lr" -type "double3" -3.1805546814635168e-15 0 0 ;
	setAttr ".rst" -type "double3" 8.8817841970012523e-16 -1.5 -0.39999999999999947 ;
	setAttr ".rsrr" -type "double3" -3.1805546814635168e-15 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_L_aim_support3" -p "L_ankle_loc";
	rename -uid "4EA08A65-4B50-C977-DAFA-15AE59FBE089";
createNode aimConstraint -n "L_L_aim_support3_aimConstraint1" -p "L_L_aim_support3";
	rename -uid "1079B598-4B48-3724-DC5E-5A859F62C8D4";
	addAttr -dcb 0 -ci true -sn "w0" -ln "knee_locW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 45.000000000000007 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_L_aim_support4" -p "L_ankle_loc";
	rename -uid "428C8FE4-4BEB-5A99-059C-D39FD622FC33";
createNode aimConstraint -n "L_L_aim_support4_aimConstraint1" -p "L_L_aim_support4";
	rename -uid "C0393772-43BA-8BA4-4385-6B9FAA3F28AE";
	addAttr -dcb 0 -ci true -sn "w0" -ln "toe_locW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 -1 0 ;
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -21.801409486351815 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_toeRoot_loc_Grp" -p "L_hip_loc";
	rename -uid "F8321A08-4E67-F871-69E7-C198B44D14A7";
	setAttr ".t" -type "double3" -1.7763568394002505e-15 -19.5 0.49999999999999645 ;
createNode transform -n "L_toeRoot_loc" -p "L_toeRoot_loc_Grp";
	rename -uid "D63D68AE-4857-3005-B1B3-4B90A9BC42C3";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toeRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_toeRoot_locShape" -p "L_toeRoot_loc";
	rename -uid "3A86CC9B-446A-5A1B-7DF2-8D954E84E6F1";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_toe1_loc_Grp" -p "L_toeRoot_loc";
	rename -uid "FC54D867-49A2-BD57-58BF-69A20E1B30A7";
	setAttr ".t" -type "double3" 1.7763568394002505e-15 -1.5 0.50000000000000355 ;
createNode transform -n "L_toe1_loc" -p "L_toe1_loc_Grp";
	rename -uid "95536190-45FC-687B-7169-5EB99802AFA7";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toe1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_toe1_locShape" -p "L_toe1_loc";
	rename -uid "F3097F02-4AEA-35B3-B5B1-F4B44D983477";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_heelExtra_loc_Grp" -p "L_toe1_loc";
	rename -uid "8D1FF7DD-4490-0295-BB67-4DAA2E893B15";
	setAttr ".t" -type "double3" 0 -1 0 ;
createNode transform -n "L_heelExtra_loc" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_heelExtra_loc_Grp";
	rename -uid "439A4433-4451-166D-B174-F99001056BAC";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "heel";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_heelExtra_locShape" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_heelExtra_loc_Grp|L_heelExtra_loc";
	rename -uid "E48C8AFA-41BB-D9F2-EF44-A9ACAD2BDB61";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_toeEndExtra_loc_Grp" -p "L_toe1_loc";
	rename -uid "BAFC207B-4037-2A3A-5B59-0DAB3F7B775E";
	setAttr ".t" -type "double3" 0 -1 1.5 ;
createNode transform -n "L_toeEndExtra_loc" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_toeEndExtra_loc_Grp";
	rename -uid "75EE78DE-48B1-52FB-9210-32A6FF6638C5";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_toeEndExtra_locShape" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_toeEndExtra_loc_Grp|L_toeEndExtra_loc";
	rename -uid "37B735C4-4B0D-73E8-7AFE-CE96CA8FB6D1";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_bankLeft_loc_Grp" -p "L_toe1_loc";
	rename -uid "D4C49C94-4C89-CA23-C729-869F6B572300";
	setAttr ".t" -type "double3" 1 -1 0.75 ;
createNode transform -n "L_bankLeft_loc" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_bankLeft_loc_Grp";
	rename -uid "36AE21F3-48E8-7DC4-9A5D-B3AF41FE0A32";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "bankLeft";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_bankLeft_locShape" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_bankLeft_loc_Grp|L_bankLeft_loc";
	rename -uid "AC7C80E4-4D86-CB46-B583-89A5565A885D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_toeExtra_loc_Grp" -p "L_toe1_loc";
	rename -uid "962B9776-4116-E1C0-4C69-418DA2A2F1AF";
	setAttr ".t" -type "double3" 0 -1 0.75 ;
createNode transform -n "L_toeExtra_loc" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_toeExtra_loc_Grp";
	rename -uid "FB112A74-445D-4AAE-C21F-D6B578F6017A";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_toeExtra_locShape" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_toeExtra_loc_Grp|L_toeExtra_loc";
	rename -uid "C810E70A-4AC7-4392-D338-F9BA9852D684";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_bankRight_loc_Grp" -p "L_toe1_loc";
	rename -uid "327C4F51-4A7D-27E7-320A-CB931E64B036";
	setAttr ".t" -type "double3" -1 -1 0.75 ;
createNode transform -n "L_bankRight_loc" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_bankRight_loc_Grp";
	rename -uid "0CD289C0-4864-AB7F-0C25-D1B9353C8374";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "bankRight";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_bankRight_locShape" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_bankRight_loc_Grp|L_bankRight_loc";
	rename -uid "A263EB0F-4DC4-11A0-25DA-5281F837EA87";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_toe2_loc_Grp" -p "L_toeRoot_loc";
	rename -uid "7ECA3C83-4151-4EE2-78F0-C08795B3B02B";
	setAttr ".t" -type "double3" 1.7763568394002505e-15 -1.5 1.5000000000000036 ;
createNode transform -n "L_toe2_loc" -p "L_toe2_loc_Grp";
	rename -uid "C16697B6-4E60-0EA9-43F1-D4B03C6E2457";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toe2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "5";
createNode locator -n "L_toe2_locShape" -p "L_toe2_loc";
	rename -uid "0DBE4846-4D14-163C-F396-02A829F03A34";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_leg_vector_Grp" -p "L_hip_loc";
	rename -uid "B143831D-4F07-8F5F-D500-B796BE7F2C7E";
createNode transform -n "L_leg_vector" -p "L_leg_vector_Grp";
	rename -uid "0BC9CC60-4105-8518-FE42-498FFDE3B6BB";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hip_type";
createNode nurbsCurve -n "L_leg_vectorShape" -p "L_leg_vector";
	rename -uid "174A282F-48ED-7F74-383C-19A5F7A24668";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-2.2204460492503121e-16 -2.719262146893781e-32 -0.49999999999999978
		-1.6081226496766359e-16 -0.49999999999999978 9.8607613152626432e-32
		2.2204460492503121e-16 2.719262146893781e-32 0.49999999999999978
		4.4408920985006242e-16 5.438524293787562e-32 0.99999999999999956
		-3.2162452993532717e-16 -0.99999999999999956 1.9721522630525286e-31
		-4.4408920985006242e-16 -5.438524293787562e-32 -0.99999999999999956
		-2.2204460492503121e-16 -2.719262146893781e-32 -0.49999999999999978
		;
createNode pointConstraint -n "L_leg_vector_Grp_pointConstraint1" -p "L_leg_vector_Grp";
	rename -uid "5515F9ED-4186-F7D1-4CDB-C0A8B230FEFA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_locW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 6 22 0 ;
	setAttr -k on ".w0";
createNode aimConstraint -n "L_leg_vector_Grp_aimConstraint1" -p "L_leg_vector_Grp";
	rename -uid "C2118B6A-4697-4B75-64CA-538098551E3F";
	addAttr -dcb 0 -ci true -sn "w0" -ln "knee_locW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 -1 0 ;
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -16.699244233993621 0 0 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "L_hip_loc_mirror_parentConstraint1" -p "L_hip_loc_mirror";
	rename -uid "3D75C795-4BE2-7412-EA02-84AE0457B10B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "root_locW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 6 0 0 ;
	setAttr ".rst" -type "double3" 6 22 -10 ;
	setAttr -k on ".w0";
createNode transform -n "R_hip_nonParent";
	rename -uid "2420138C-4FE1-AA35-5BDE-78A62C319F7D";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode transform -n "R_hip_curve" -p "R_hip_nonParent";
	rename -uid "4BE2FABC-47EC-6790-DC1B-7992EA0C0407";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode nurbsCurve -n "R_hip_curveShape" -p "R_hip_curve";
	rename -uid "1832BC7D-44CF-2C34-A8FA-1C998C6F4EFF";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-6 22 -10
		-6 13 -7
		;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode transform -n "R_knee_curve" -p "R_hip_nonParent";
	rename -uid "3F094AAC-4E57-18FB-8373-D8ADF5A516DA";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode nurbsCurve -n "R_knee_curveShape" -p "R_knee_curve";
	rename -uid "E2E9727A-4027-EC82-6BDE-DDA096224731";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-6 13 -7
		-6 8 -12
		;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode transform -n "R_ankle_curve" -p "R_hip_nonParent";
	rename -uid "44780E53-4D20-3D50-60AD-A18191CAD106";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode nurbsCurve -n "R_ankle_curveShape" -p "R_ankle_curve";
	rename -uid "114C6412-40C4-B9FE-5544-2FB35136D6B3";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-6 8 -12
		-5.9999999999999982 2.5 -9.5000000000000036
		;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode transform -n "R_toeRoot_curve" -p "R_hip_nonParent";
	rename -uid "7CB6B9C8-479E-64FD-FAB1-D280CF744EF6";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toeRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode nurbsCurve -n "R_toeRoot_curveShape" -p "R_toeRoot_curve";
	rename -uid "73D09DB4-4279-E455-2745-BFACCFF7DB69";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-5.9999999999999982 2.5 -9.5000000000000036
		-6 1 -9
		;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode transform -n "R_toe1_curve" -p "R_hip_nonParent";
	rename -uid "426D5C3E-47FA-C46E-BE42-0DA6E99F6CFD";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toe1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode nurbsCurve -n "R_toe1_curveShape" -p "R_toe1_curve";
	rename -uid "F9C9CD31-4135-8656-8A32-A2A07F20EE15";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-6 1 -9
		-6 1 -8
		;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode transform -n "R_hip_loc_mirror";
	rename -uid "7F5E3DB1-4C7E-0474-9F11-DEB1820FD4C6";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".s" -type "double3" -1 1 1 ;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode transform -n "R_hip_loc_Grp" -p "R_hip_loc_mirror";
	rename -uid "A7871AB8-432A-0162-912F-A4B6562DAF15";
createNode transform -n "R_hip_loc" -p "R_hip_loc_Grp";
	rename -uid "ECF62BCB-4556-BF19-D35E-EBB6FC54F175";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_hip_locShape" -p "R_hip_loc";
	rename -uid "903C7FE9-411D-F90F-45B7-BAA9088686E4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_knee_loc_Grp" -p "R_hip_loc";
	rename -uid "EAA80E85-4EA0-C5FF-0CBC-AFA3DCD398C4";
	setAttr ".t" -type "double3" 0 -9 3.0000000000000004 ;
createNode transform -n "R_knee_loc" -p "R_knee_loc_Grp";
	rename -uid "E421903D-49BD-A115-D8B1-6889183DB3E5";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_knee_locShape" -p "R_knee_loc";
	rename -uid "A1D7A80A-4516-B4F9-BBFA-0092DBC99360";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_hipExtra_loc_Grp" -p "R_knee_loc";
	rename -uid "CB91641B-4B30-6478-5939-78A9045B94E0";
	setAttr ".r" -type "double3" 3.1805546814635168e-15 0 0 ;
createNode transform -n "R_hipExtra_loc" -p "R_hipExtra_loc_Grp";
	rename -uid "BC41DCE2-41BA-AA0E-74E3-19B3FC5A441E";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "hipExtra";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_hipExtra_locShape" -p "R_hipExtra_loc";
	rename -uid "1B1266A5-42A9-B13F-7BF6-808B693B5AD0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_hipExtra_loc_Grp_parentConstraint1" -p "R_hipExtra_loc_Grp";
	rename -uid "A1BA4772-4017-FC65-0BCD-828742AEDC46";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_aim_support1W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0 1.8007134162157676 0.95782628522115054 ;
	setAttr ".tg[0].tor" -type "double3" 16.699244233993621 0 0 ;
	setAttr ".lr" -type "double3" 3.1805546814635168e-15 0 0 ;
	setAttr ".rst" -type "double3" 0 2.0000000000000036 0.39999999999999947 ;
	setAttr ".rsrr" -type "double3" 3.1805546814635168e-15 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_kneeExtra_loc_Grp" -p "R_knee_loc";
	rename -uid "D74725F8-4184-83AB-E9CE-38B0F5C27505";
	setAttr ".t" -type "double3" 0 0 1 ;
createNode transform -n "R_kneeExtra_loc" -p "R_kneeExtra_loc_Grp";
	rename -uid "2EA7D27B-4131-2E74-2BD0-6AA26DEC924A";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "kneeExtra";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_kneeExtra_locShape" -p "R_kneeExtra_loc";
	rename -uid "8C250839-41F4-C5C3-5C2B-30A5098BF483";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_knee_ankleExtra1_loc_Grp" -p "R_knee_loc";
	rename -uid "11D3F22F-4545-9279-E0F2-28AE7D91572C";
createNode transform -n "R_knee_ankleExtra1_loc" -p "R_knee_ankleExtra1_loc_Grp";
	rename -uid "9F2851D9-4CD1-F928-4845-17A1BD4849ED";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "knee_ankle1";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_knee_ankleExtra1_locShape" -p "R_knee_ankleExtra1_loc";
	rename -uid "EED798D0-4AC2-6B30-723D-5FB15B6A3804";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_knee_ankleExtra1_loc_Grp_parentConstraint1" -p "R_knee_ankleExtra1_loc_Grp";
	rename -uid "EF5549CA-457B-0BFF-1B4F-A1B72DD19D8D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_aim_support2W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" -8.8817841970012523e-16 -1.4142135623730976 
		0.70710678118654968 ;
	setAttr ".tg[0].tor" -type "double3" -45.000000000000014 0 0 ;
	setAttr ".rst" -type "double3" -8.8817841970012523e-16 -1.5000000000000036 -0.49999999999999956 ;
	setAttr -k on ".w0";
createNode transform -n "R_L_aim_support1" -p "R_knee_loc";
	rename -uid "83420D0D-47C7-275B-321C-049090CBFAC4";
	setAttr ".t" -type "double3" 0 0 -4.4408920985006262e-16 ;
createNode aimConstraint -n "R_L_aim_support1_aimConstraint1" -p "R_L_aim_support1";
	rename -uid "BC156846-4A1F-868C-88F7-C09975334FD1";
	addAttr -dcb 0 -ci true -sn "w0" -ln "hip_locW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -16.699244233993618 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_L_aim_support2" -p "R_knee_loc";
	rename -uid "C913F2F3-4AE9-0165-9289-FE9A1CF5EA59";
	setAttr ".t" -type "double3" 0 0 -4.4408920985006262e-16 ;
createNode aimConstraint -n "R_L_aim_support2_aimConstraint1" -p "R_L_aim_support2";
	rename -uid "EC018DE6-4A70-EADE-709B-3CBE519910AD";
	addAttr -dcb 0 -ci true -sn "w0" -ln "ankle_locW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 -1 0 ;
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 45.000000000000007 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_ankle_loc_Grp" -p "R_hip_loc";
	rename -uid "1E8A8D7C-44DA-C6E3-3E0B-96AEE93BC9B8";
	setAttr ".t" -type "double3" 0 -14 -2 ;
createNode transform -n "R_ankle_loc" -p "R_ankle_loc_Grp";
	rename -uid "A971F3E8-414E-FE34-76FC-0C8AAA504F44";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_ankle_locShape" -p "R_ankle_loc";
	rename -uid "D600D3DD-455B-CC2F-A447-4F8435DB63C6";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_knee_ankleExtra2_loc_Grp" -p "R_ankle_loc";
	rename -uid "0FCD6E07-4789-5070-41CE-23AC20402613";
createNode transform -n "R_knee_ankleExtra2_loc" -p "R_knee_ankleExtra2_loc_Grp";
	rename -uid "464D1D87-44AE-1F04-EA2B-75881087A734";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "knee_ankle2";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_knee_ankleExtra2_locShape" -p "R_knee_ankleExtra2_loc";
	rename -uid "A55EF241-4F7C-7DDB-7134-35A67ACE8A04";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_knee_ankleExtra2_loc_Grp_parentConstraint1" -p "R_knee_ankleExtra2_loc_Grp";
	rename -uid "3AD3C8AF-4EDE-DA8E-3439-8ABFBBF20CF7";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_aim_support3W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 8.8817841970012523e-16 1.060660171779821 -0.70710678118654702 ;
	setAttr ".tg[0].tor" -type "double3" -45.000000000000014 0 0 ;
	setAttr ".rst" -type "double3" 8.8817841970012523e-16 1.25 0.25000000000000044 ;
	setAttr -k on ".w0";
createNode transform -n "R_ankleExtra_loc_Grp" -p "R_ankle_loc";
	rename -uid "3BBD4C93-4EFD-E8E0-F71A-6796CE9F857C";
	setAttr ".t" -type "double3" 0 0 -1 ;
createNode transform -n "R_ankleExtra_loc" -p "R_ankleExtra_loc_Grp";
	rename -uid "1968721A-4F95-A12B-E380-8B93C26763DA";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "ankleExtra";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_ankleExtra_locShape" -p "R_ankleExtra_loc";
	rename -uid "044815A3-469F-EBD0-2B63-2A91CE02318B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_toeExtra_loc_Grp" -p "R_ankle_loc";
	rename -uid "03868C7C-46A8-A7BA-2742-9792780E47FC";
	setAttr ".r" -type "double3" -3.1805546814635168e-15 0 0 ;
createNode transform -n "R_toeExtra_loc" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_ankle_loc_Grp|R_ankle_loc|R_toeExtra_loc_Grp";
	rename -uid "87AB3D17-4A1E-3A57-F3BA-2B99F074F9B4";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toeExtra";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_toeExtra_locShape" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_ankle_loc_Grp|R_ankle_loc|R_toeExtra_loc_Grp|R_toeExtra_loc";
	rename -uid "BD3F649C-4847-B332-F5A7-5D93DC0BB996";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_toeExtra_loc_Grp_parentConstraint1" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_ankle_loc_Grp|R_ankle_loc|R_toeExtra_loc_Grp";
	rename -uid "59D4201E-40E1-9460-65C3-FB976C251AF3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_aim_support4W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 8.8817841970012523e-16 -1.2441587657862474 
		-0.92847669088525886 ;
	setAttr ".tg[0].tor" -type "double3" 21.801409486351812 0 0 ;
	setAttr ".lr" -type "double3" -3.1805546814635168e-15 0 0 ;
	setAttr ".rst" -type "double3" 8.8817841970012523e-16 -1.5 -0.39999999999999947 ;
	setAttr ".rsrr" -type "double3" -3.1805546814635168e-15 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_L_aim_support3" -p "R_ankle_loc";
	rename -uid "EA458BFC-4703-75B6-C023-19B44B519EEB";
createNode aimConstraint -n "R_L_aim_support3_aimConstraint1" -p "R_L_aim_support3";
	rename -uid "1EAD54E6-4E08-987F-4512-02A14F2D3F36";
	addAttr -dcb 0 -ci true -sn "w0" -ln "knee_locW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 45.000000000000007 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_L_aim_support4" -p "R_ankle_loc";
	rename -uid "C7AAB203-4338-0C6F-60F1-C9AC9FF773A1";
createNode aimConstraint -n "R_L_aim_support4_aimConstraint1" -p "R_L_aim_support4";
	rename -uid "6BE4DEF5-49AC-6912-6C8A-6CB0B05DEC22";
	addAttr -dcb 0 -ci true -sn "w0" -ln "toe_locW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 -1 0 ;
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -21.801409486351815 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_toeRoot_loc_Grp" -p "R_hip_loc";
	rename -uid "A9986217-4C1F-78E0-1662-D39877C76ED3";
	setAttr ".t" -type "double3" -1.7763568394002505e-15 -19.5 0.49999999999999645 ;
createNode transform -n "R_toeRoot_loc" -p "R_toeRoot_loc_Grp";
	rename -uid "8C08CBCF-4ADC-CA01-36D4-A9B3208140D9";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toeRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_toeRoot_locShape" -p "R_toeRoot_loc";
	rename -uid "F7EFE3A0-4B0C-F1AF-DF6B-FA98FC033AB0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_toe1_loc_Grp" -p "R_toeRoot_loc";
	rename -uid "83986BEA-42D2-E1D1-E7F1-0EBA1A2D2BAB";
	setAttr ".t" -type "double3" 1.7763568394002505e-15 -1.5 0.50000000000000355 ;
createNode transform -n "R_toe1_loc" -p "R_toe1_loc_Grp";
	rename -uid "194E49B8-441A-0169-7426-DC86F8E82FB0";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toe1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_toe1_locShape" -p "R_toe1_loc";
	rename -uid "D44BEB4A-4172-64D1-C50A-35BCB25530EF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_heelExtra_loc_Grp" -p "R_toe1_loc";
	rename -uid "9379AAB9-4588-7230-DDDE-EA9445AA0216";
	setAttr ".t" -type "double3" 0 -1 0 ;
createNode transform -n "R_heelExtra_loc" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_heelExtra_loc_Grp";
	rename -uid "D386F456-4B6D-65EE-F7A7-7EB64AEEB691";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "heel";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_heelExtra_locShape" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_heelExtra_loc_Grp|R_heelExtra_loc";
	rename -uid "17907106-4420-793C-5208-DEB67C3583B1";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_toeEndExtra_loc_Grp" -p "R_toe1_loc";
	rename -uid "1F76A73A-48F5-F0C9-8C93-6D9E20CE96F2";
	setAttr ".t" -type "double3" 0 -1 1.5 ;
createNode transform -n "R_toeEndExtra_loc" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_toeEndExtra_loc_Grp";
	rename -uid "6D7048FE-48CA-021C-36EC-A09DB49A80F8";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_toeEndExtra_locShape" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_toeEndExtra_loc_Grp|R_toeEndExtra_loc";
	rename -uid "570519B0-4379-857F-6CA6-90B0F112469D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_bankLeft_loc_Grp" -p "R_toe1_loc";
	rename -uid "9F1C5627-4332-6E91-A53C-03AD164924F8";
	setAttr ".t" -type "double3" 1 -1 0.75 ;
createNode transform -n "R_bankLeft_loc" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_bankLeft_loc_Grp";
	rename -uid "55BD99B5-4C97-DE3D-A8CB-FE94EF7EDFB1";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "bankLeft";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_bankLeft_locShape" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_bankLeft_loc_Grp|R_bankLeft_loc";
	rename -uid "599F665C-491F-D61A-F151-CFBE1B6B3371";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_toeExtra_loc_Grp" -p "R_toe1_loc";
	rename -uid "D8423BC2-48CF-0136-2405-9EA2F5C63239";
	setAttr ".t" -type "double3" 0 -1 0.75 ;
createNode transform -n "R_toeExtra_loc" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_toeExtra_loc_Grp";
	rename -uid "D7024C6A-47C2-FBCC-AA71-2FB3EAF32BA8";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_toeExtra_locShape" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_toeExtra_loc_Grp|R_toeExtra_loc";
	rename -uid "BD15C418-44BB-7CD2-08D0-C683971D66A9";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_bankRight_loc_Grp" -p "R_toe1_loc";
	rename -uid "67DBC655-43E7-C603-688F-9C8D3BA87C68";
	setAttr ".t" -type "double3" -1 -1 0.75 ;
createNode transform -n "R_bankRight_loc" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_bankRight_loc_Grp";
	rename -uid "38C641E3-456C-FB09-D9C5-F1B7639AA0C6";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "bankRight";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_bankRight_locShape" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_bankRight_loc_Grp|R_bankRight_loc";
	rename -uid "AD13AEC5-46E4-0B05-CFFB-859672A78F23";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_toe2_loc_Grp" -p "R_toeRoot_loc";
	rename -uid "E6D1C9D7-48EB-F24A-9B2C-9EA04A89B6DE";
	setAttr ".t" -type "double3" 1.7763568394002505e-15 -1.5 1.5000000000000036 ;
createNode transform -n "R_toe2_loc" -p "R_toe2_loc_Grp";
	rename -uid "6C0EA4BE-4222-9B06-3044-7F98FE2F6DB5";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toe2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "5";
createNode locator -n "R_toe2_locShape" -p "R_toe2_loc";
	rename -uid "934A55C0-4FA4-307D-6822-2B809FC2BD11";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_leg_vector_Grp" -p "R_hip_loc";
	rename -uid "4BE2251D-4DC4-D359-E781-0083703527EB";
createNode transform -n "R_leg_vector" -p "R_leg_vector_Grp";
	rename -uid "5644693D-4A33-9431-E4A1-88944919A3F0";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "leg_type";
createNode nurbsCurve -n "R_leg_vectorShape" -p "R_leg_vector";
	rename -uid "2E41870E-459E-7931-2DF4-6BA660507831";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-2.2204460492503121e-16 -2.719262146893781e-32 -0.49999999999999978
		-1.6081226496766359e-16 -0.49999999999999978 9.8607613152626432e-32
		2.2204460492503121e-16 2.719262146893781e-32 0.49999999999999978
		4.4408920985006242e-16 5.438524293787562e-32 0.99999999999999956
		-3.2162452993532717e-16 -0.99999999999999956 1.9721522630525286e-31
		-4.4408920985006242e-16 -5.438524293787562e-32 -0.99999999999999956
		-2.2204460492503121e-16 -2.719262146893781e-32 -0.49999999999999978
		;
createNode pointConstraint -n "R_leg_vector_Grp_pointConstraint1" -p "R_leg_vector_Grp";
	rename -uid "724F75B1-4C77-5A48-5927-B5B350A32057";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "hip_locW0" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 6 22 0 ;
	setAttr -k on ".w0";
createNode aimConstraint -n "R_leg_vector_Grp_aimConstraint1" -p "R_leg_vector_Grp";
	rename -uid "7BEC184B-47B1-54EE-726C-6F923981C465";
	addAttr -dcb 0 -ci true -sn "w0" -ln "knee_locW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 -1 0 ;
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -16.699244233993621 0 0 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "R_hip_loc_mirror_parentConstraint1" -p "R_hip_loc_mirror";
	rename -uid "6CD796B9-48BF-E1AF-EC13-538569DD13CE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "root_locW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" -6 0 0 ;
	setAttr ".rst" -type "double3" -6 22 -10 ;
	setAttr -k on ".w0";
createNode transform -n "L_arm_loc_mirror";
	rename -uid "21519AFE-4A2F-6E82-2C84-A6BDAF9966E6";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode transform -n "L_scapula_loc_Grp" -p "L_arm_loc_mirror";
	rename -uid "7336B358-4428-91B2-342A-348394087353";
createNode transform -n "L_scapula_loc" -p "L_scapula_loc_Grp";
	rename -uid "C2AB911B-4D29-CB4F-577C-43B058E97D66";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_scapula_locShape" -p "L_scapula_loc";
	rename -uid "84BC1B57-4EF7-47A8-0236-E6B29BB6E164";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_scapula_vector_Grp" -p "L_scapula_loc";
	rename -uid "5525C137-4FF5-6D6D-7C3C-2F8379F0F8E9";
createNode transform -n "L_scapula_vector" -p "L_scapula_vector_Grp";
	rename -uid "8566A3B6-46A4-069F-47B1-22AC2970B84D";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode nurbsCurve -n "L_scapula_vectorShape" -p "L_scapula_vector";
	rename -uid "372FEDCD-47F9-934F-1120-559ADB6B8658";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-2.2204460492503121e-16 -2.719262146893781e-32 -0.49999999999999978
		-1.6081226496766359e-16 -0.49999999999999978 9.8607613152626432e-32
		2.2204460492503121e-16 2.719262146893781e-32 0.49999999999999978
		4.4408920985006242e-16 5.438524293787562e-32 0.99999999999999956
		-3.2162452993532717e-16 -0.99999999999999956 1.9721522630525286e-31
		-4.4408920985006242e-16 -5.438524293787562e-32 -0.99999999999999956
		-2.2204460492503121e-16 -2.719262146893781e-32 -0.49999999999999978
		;
createNode aimConstraint -n "L_scapula_vector_Grp_aimConstraint1" -p "L_scapula_vector_Grp";
	rename -uid "FCC61D3E-402A-DF49-690F-B583C0264068";
	addAttr -dcb 0 -ci true -sn "w0" -ln "L_shouder_locW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 -1 0 ;
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -22.395662330039151 8.5477407064332035e-14 15.945395900922813 ;
	setAttr -k on ".w0";
createNode transform -n "L_shoulder_loc_Grp" -p "L_scapula_loc";
	rename -uid "3D112D7C-493B-3692-3697-0EB73EF84568";
	setAttr ".t" -type "double3" 2 -7 3 ;
createNode transform -n "L_shoulder_loc" -p "L_shoulder_loc_Grp";
	rename -uid "B26CBFCC-4226-6664-5D0F-858FCEDBA581";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_shoulder_locShape" -p "L_shoulder_loc";
	rename -uid "DD828EAC-4258-F7FC-8AE3-CC8B6BFC49EB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_shoulder_vector_Grp" -p "L_shoulder_loc";
	rename -uid "0BF23F71-4BFE-CC0E-C08A-6FBEA832C8FB";
createNode transform -n "L_shoulder_vector" -p "L_shoulder_vector_Grp";
	rename -uid "A6CB1995-44E7-BE84-DB46-62AFD1CFA116";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode nurbsCurve -n "L_shoulder_vectorShape" -p "L_shoulder_vector";
	rename -uid "E565E8C8-417B-4F9B-1490-9D9828E256B5";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-2.2204460492503121e-16 -2.719262146893781e-32 -0.49999999999999978
		-1.6081226496766359e-16 -0.49999999999999978 9.8607613152626432e-32
		2.2204460492503121e-16 2.719262146893781e-32 0.49999999999999978
		4.4408920985006242e-16 5.438524293787562e-32 0.99999999999999956
		-3.2162452993532717e-16 -0.99999999999999956 1.9721522630525286e-31
		-4.4408920985006242e-16 -5.438524293787562e-32 -0.99999999999999956
		-2.2204460492503121e-16 -2.719262146893781e-32 -0.49999999999999978
		;
createNode aimConstraint -n "L_shoulder_vector_Grp_aimConstraint1" -p "L_shoulder_vector_Grp";
	rename -uid "CEB7F25F-40E8-8316-25B5-0CB0DB5B9A1C";
	addAttr -dcb 0 -ci true -sn "w0" -ln "L_elbow_locW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 -1 0 ;
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 29.744881296942214 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_wrist_loc_Grp" -p "L_shoulder_loc";
	rename -uid "B4288E39-4756-9DC8-840F-36A4C8853D0E";
	setAttr ".t" -type "double3" 0 -13 -2 ;
createNode transform -n "L_wrist_loc" -p "L_wrist_loc_Grp";
	rename -uid "B9B9789D-4AB7-AC7E-B254-10BE26FF614E";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_wrist_locShape" -p "L_wrist_loc";
	rename -uid "1594229E-429F-23A8-F798-B2AE697F096F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_wristToe_loc_Grp" -p "L_wrist_loc";
	rename -uid "321EA6E8-406E-DB50-1327-3699EF901FE7";
	setAttr ".t" -type "double3" 0 -2 0.5 ;
createNode transform -n "L_wristToe_loc" -p "L_wristToe_loc_Grp";
	rename -uid "32AC2D8E-487F-15D4-79F2-5086D99E2A8C";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "wristToe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_wristToe_locShape" -p "L_wristToe_loc";
	rename -uid "82233D80-4BF7-363C-CFB8-E0AF4CB0F6BF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_bankRight_loc_Grp" -p "L_wristToe_loc";
	rename -uid "1C51B407-4415-5D86-DA4D-08B304D62415";
	setAttr ".t" -type "double3" -1 -1 0.74999972723693986 ;
createNode transform -n "L_bankRight_loc" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_bankRight_loc_Grp";
	rename -uid "C12BD67D-4128-413F-498B-288934C31D60";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "bankRight";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_bankRight_locShape" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_bankRight_loc_Grp|L_bankRight_loc";
	rename -uid "368D5C3E-4AAF-71BA-9051-A0807C01DDD0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_heelExtra_loc_Grp" -p "L_wristToe_loc";
	rename -uid "494ED9FB-4FD3-FB2E-8D54-84910CD892DD";
	setAttr ".t" -type "double3" 0 -1 -2.7276306013845897e-07 ;
createNode transform -n "L_heelExtra_loc" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_heelExtra_loc_Grp";
	rename -uid "D6A739AD-4BDD-CE12-FA3F-A8B7FEEB1082";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "heel";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_heelExtra_locShape" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_heelExtra_loc_Grp|L_heelExtra_loc";
	rename -uid "4A18ACCC-42F0-5D72-F1AB-609C5BB14527";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_bankLeft_loc_Grp" -p "L_wristToe_loc";
	rename -uid "3E2FA665-4622-34DB-8B92-0A9EFB2657D9";
	setAttr ".t" -type "double3" 1 -1 0.74999972723693986 ;
createNode transform -n "L_bankLeft_loc" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_bankLeft_loc_Grp";
	rename -uid "5E90E051-4731-98C8-9AE5-71BF6CBEF147";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "bankLeft";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_bankLeft_locShape" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_bankLeft_loc_Grp|L_bankLeft_loc";
	rename -uid "34243FB7-4A4F-5593-302C-288D9D909854";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_toeExtra_loc_Grp" -p "L_wristToe_loc";
	rename -uid "33A38C94-45FA-3360-632D-52AF16FA7367";
	setAttr ".t" -type "double3" 0 -1 0.74999972723693986 ;
createNode transform -n "L_toeExtra_loc" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_toeExtra_loc_Grp";
	rename -uid "8C76ECD7-42C5-D5C4-91B5-21A1946366DD";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_toeExtra_locShape" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_toeExtra_loc_Grp|L_toeExtra_loc";
	rename -uid "12CC3C5B-4602-B2FA-2CBB-66B5D4765129";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_toeEndExtra_loc_Grp" -p "L_wristToe_loc";
	rename -uid "5EC5BFC0-4937-884F-8916-E4A7125DFE88";
	setAttr ".t" -type "double3" 0 -1 1.4999997272369399 ;
createNode transform -n "L_toeEndExtra_loc" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_toeEndExtra_loc_Grp";
	rename -uid "364A7D2D-4FAB-B64F-13FE-5085853A8A9D";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_toeEndExtra_locShape" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_toeEndExtra_loc_Grp|L_toeEndExtra_loc";
	rename -uid "E7BC80F9-4337-E32F-A051-FD8542FFAB33";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_wristToeEnd_loc_Grp" -p "L_wrist_loc";
	rename -uid "4F1A9268-4DC9-26B3-86D4-F88A1E502FEA";
	setAttr ".t" -type "double3" 0 -2 2 ;
createNode transform -n "L_wristToeEnd_loc" -p "L_wristToeEnd_loc_Grp";
	rename -uid "8F00B167-4EB5-9497-9C49-FAAA26411EE6";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "wristToeEnd";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "5";
createNode locator -n "L_wristToeEnd_locShape" -p "L_wristToeEnd_loc";
	rename -uid "7590CE30-4B62-AC3B-B931-50A62EA8B0E3";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_elbow_loc_Grp" -p "L_shoulder_loc";
	rename -uid "81B5C3B7-4A36-4C31-5697-AEA82632D023";
	setAttr ".t" -type "double3" 0 -7 -4 ;
createNode transform -n "L_elbow_loc" -p "L_elbow_loc_Grp";
	rename -uid "B3D09889-4671-BBA2-BA57-0687EE8360F9";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_elbow_locShape" -p "L_elbow_loc";
	rename -uid "2F80C74A-4799-227F-6507-37BF78B3B1E8";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_aim_support2" -p "L_elbow_loc";
	rename -uid "D9A5B697-469B-CDD4-E059-F1A3E69CDBC4";
createNode aimConstraint -n "L_aim_support2_aimConstraint1" -p "L_aim_support2";
	rename -uid "B6C209DE-4883-BA21-487B-4D99037C5CEB";
	addAttr -dcb 0 -ci true -sn "w0" -ln "L_wrist_locW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 -1 0 ;
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -18.434948822921999 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_aim_support1" -p "L_elbow_loc";
	rename -uid "D7BC7FB2-4FC7-8EB2-4140-A3829DD68B6D";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
createNode aimConstraint -n "L_aim_support1_aimConstraint1" -p "L_aim_support1";
	rename -uid "8A06F736-4FB2-E560-AF4E-2CA2F923D295";
	addAttr -dcb 0 -ci true -sn "w0" -ln "L_shoulder_locW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 29.744881296942214 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_shoulderExtra_loc_Grp" -p "L_elbow_loc";
	rename -uid "7F34CC09-4655-CCC0-7CF6-E99A25CB3C96";
createNode transform -n "L_shoulderExtra_loc" -p "L_shoulderExtra_loc_Grp";
	rename -uid "EDACEF79-4D16-7246-57A9-DC86FC53B37A";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_shoulderExtra_locShape" -p "L_shoulderExtra_loc";
	rename -uid "7D2E2A84-489A-469D-2A37-0899E91F8F96";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_shoulderExtra_loc_Grp_parentConstraint1" -p "L_shoulderExtra_loc_Grp";
	rename -uid "664877D4-4193-E433-A272-BC9E7C144606";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_aim_support1W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0 1.5194254987178031 -0.86824314212445897 ;
	setAttr ".tg[0].tor" -type "double3" -29.744881296942214 0 0 ;
	setAttr ".rst" -type "double3" 6 10.75 8 ;
	setAttr -k on ".w0";
createNode transform -n "L_elbowExtra_loc_Grp" -p "L_elbow_loc";
	rename -uid "4FC27582-4522-3387-AD12-8592DC9936B3";
	setAttr ".t" -type "double3" 0 0 -1 ;
createNode transform -n "L_elbowExtra_loc" -p "L_elbowExtra_loc_Grp";
	rename -uid "B87395A5-46F2-0194-19C1-C38898504A3D";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_elbowExtra_locShape" -p "L_elbowExtra_loc";
	rename -uid "21DD05E8-4A9C-18A5-A351-2F93CC23C8D4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_wristExtra_loc_Grp" -p "L_elbow_loc";
	rename -uid "22E5BB1A-4606-D5C8-E3FB-D58A549BF043";
createNode transform -n "L_wristExtra_loc" -p "L_wristExtra_loc_Grp";
	rename -uid "BBF738A5-49D9-5F20-18BA-F59DA943C2AC";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_wristExtra_locShape" -p "L_wristExtra_loc";
	rename -uid "9CBBE33A-4E7B-60BC-9FB3-6E9B414DCDA4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_wristExtra_loc_Grp_parentConstraint1" -p "L_wristExtra_loc_Grp";
	rename -uid "B6C1A7D0-4715-04D1-CAD2-299CCAEB6A3A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_aim_support2W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" -8.8817841970012523e-16 -1.5811388300841909 
		-0.94868329805051488 ;
	setAttr ".tg[0].tor" -type "double3" 18.434948822921996 0 0 ;
	setAttr ".lr" -type "double3" -3.1805546814635168e-15 0 0 ;
	setAttr ".rst" -type "double3" 5.9999999999999991 7.1999999999999984 7.5999999999999988 ;
	setAttr ".rsrr" -type "double3" -3.1805546814635168e-15 0 0 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "L_arm_loc_mirror_parentConstraint1" -p "L_arm_loc_mirror";
	rename -uid "E75A7BD8-4AAB-1640-C70D-479D94ECF8C9";
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
	setAttr ".tg[0].tot" -type "double3" 4 1 -1 ;
	setAttr ".rst" -type "double3" 4 23 9 ;
	setAttr -k on ".w0";
createNode transform -n "L_arm_nonParent";
	rename -uid "34EE0446-455C-DC5A-88A2-40B4562885DC";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode transform -n "L_scapula_curve" -p "L_arm_nonParent";
	rename -uid "C9D41B00-4238-8C51-1D0F-DA83EA01D948";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode nurbsCurve -n "L_scapula_curveShape" -p "L_scapula_curve";
	rename -uid "DFDC8ACA-451D-30B2-4569-7E88C6BB2EDD";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		4 23 9
		6 16 12
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode transform -n "L_shoulder_curve" -p "L_arm_nonParent";
	rename -uid "6213DF43-42BF-0226-6FA0-5AB37EE05A89";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode nurbsCurve -n "L_shoulder_curveShape" -p "L_shoulder_curve";
	rename -uid "6F297825-403F-136B-4DD3-5D868929DB03";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		6 16 12
		6 9 8
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode transform -n "L_elbow_curve" -p "L_arm_nonParent";
	rename -uid "5BE1AE6F-4152-75AD-672B-349E1C530450";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode nurbsCurve -n "L_elbow_curveShape" -p "L_elbow_curve";
	rename -uid "9F1D8638-422E-1C44-6950-5BBF145EFB13";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		6 9 8
		6 3 10
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode transform -n "L_wrist_curve" -p "L_arm_nonParent";
	rename -uid "760443C6-4F66-22DA-86F2-6FA4F476C649";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode nurbsCurve -n "L_wrist_curveShape" -p "L_wrist_curve";
	rename -uid "FFA29839-4EA2-7910-6155-EAB21A3B5984";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		6 3 10
		6 1 10.5
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode transform -n "L_wristToe_curve" -p "L_arm_nonParent";
	rename -uid "B708C6BB-46DB-09C8-75AD-23B7A185F069";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "wristToe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode nurbsCurve -n "L_wristToe_curveShape" -p "L_wristToe_curve";
	rename -uid "32572D77-42C8-764A-6D16-C3836493BC09";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		6 1 10.5
		6 1 12
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "wristToe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode transform -n "R_arm_loc_mirror";
	rename -uid "0BD3C7F6-486B-2FDC-031F-F8A9FCDCB618";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".s" -type "double3" -1 1 1 ;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode transform -n "R_scapula_loc_Grp" -p "R_arm_loc_mirror";
	rename -uid "AD3C2405-4B89-2808-1A0F-E99FABC0075E";
createNode transform -n "R_scapula_loc" -p "R_scapula_loc_Grp";
	rename -uid "1F9FB3B0-4ACF-623B-A610-559D24C1991E";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_scapula_locShape" -p "R_scapula_loc";
	rename -uid "FEDC4CEC-42B1-AC6D-F912-99A6E74590B3";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_scapula_vector_Grp" -p "R_scapula_loc";
	rename -uid "5E1FD3CD-418D-2F7B-7A6F-D6B2B9564D6D";
createNode transform -n "R_scapula_vector" -p "R_scapula_vector_Grp";
	rename -uid "7E657BDB-41D7-476A-F969-6BB3FE6E4797";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode nurbsCurve -n "R_scapula_vectorShape" -p "R_scapula_vector";
	rename -uid "698BD064-41C9-CE49-9B37-9584C71F6D18";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-2.2204460492503121e-16 -2.719262146893781e-32 -0.49999999999999978
		-1.6081226496766359e-16 -0.49999999999999978 9.8607613152626432e-32
		2.2204460492503121e-16 2.719262146893781e-32 0.49999999999999978
		4.4408920985006242e-16 5.438524293787562e-32 0.99999999999999956
		-3.2162452993532717e-16 -0.99999999999999956 1.9721522630525286e-31
		-4.4408920985006242e-16 -5.438524293787562e-32 -0.99999999999999956
		-2.2204460492503121e-16 -2.719262146893781e-32 -0.49999999999999978
		;
createNode aimConstraint -n "R_scapula_vector_Grp_aimConstraint1" -p "R_scapula_vector_Grp";
	rename -uid "7C72AD3C-4726-3D65-0C4A-76B13675758E";
	addAttr -dcb 0 -ci true -sn "w0" -ln "L_shouder_locW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 -1 0 ;
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -22.395662330039151 8.5477407064332035e-14 15.945395900922813 ;
	setAttr -k on ".w0";
createNode transform -n "R_shoulder_loc_Grp" -p "R_scapula_loc";
	rename -uid "43401CC9-405D-3824-4340-49836B7110BC";
	setAttr ".t" -type "double3" 2 -7 3 ;
createNode transform -n "R_shoulder_loc" -p "R_shoulder_loc_Grp";
	rename -uid "4A207438-4BFB-3473-22C2-3D8CD74C387E";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_shoulder_locShape" -p "R_shoulder_loc";
	rename -uid "28DBF3E0-4DDC-2FB7-FDBC-6DBDBCEF144F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_shoulder_vector_Grp" -p "R_shoulder_loc";
	rename -uid "FC428493-4BC2-842F-F4D1-A988BA56E1F8";
createNode transform -n "R_shoulder_vector" -p "R_shoulder_vector_Grp";
	rename -uid "273328C1-4469-1406-D779-41B2457D4564";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode nurbsCurve -n "R_shoulder_vectorShape" -p "R_shoulder_vector";
	rename -uid "203CCF9A-4B05-562A-0E61-AA95AE3315F1";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-2.2204460492503121e-16 -2.719262146893781e-32 -0.49999999999999978
		-1.6081226496766359e-16 -0.49999999999999978 9.8607613152626432e-32
		2.2204460492503121e-16 2.719262146893781e-32 0.49999999999999978
		4.4408920985006242e-16 5.438524293787562e-32 0.99999999999999956
		-3.2162452993532717e-16 -0.99999999999999956 1.9721522630525286e-31
		-4.4408920985006242e-16 -5.438524293787562e-32 -0.99999999999999956
		-2.2204460492503121e-16 -2.719262146893781e-32 -0.49999999999999978
		;
createNode aimConstraint -n "R_shoulder_vector_Grp_aimConstraint1" -p "R_shoulder_vector_Grp";
	rename -uid "1DD624EC-4D54-D6E5-F5DE-CF84F731F5C0";
	addAttr -dcb 0 -ci true -sn "w0" -ln "L_elbow_locW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 -1 0 ;
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 29.744881296942214 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_wrist_loc_Grp" -p "R_shoulder_loc";
	rename -uid "A59B1F7F-4131-F384-1E4D-F49595701895";
	setAttr ".t" -type "double3" 0 -13 -2 ;
createNode transform -n "R_wrist_loc" -p "R_wrist_loc_Grp";
	rename -uid "C13CA835-46CB-EF61-10AC-EA9B0CABC3E8";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_wrist_locShape" -p "R_wrist_loc";
	rename -uid "27E94666-468B-D7ED-8FDE-528D6023925F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_wristToe_loc_Grp" -p "R_wrist_loc";
	rename -uid "755D38C1-44B3-F3EC-A976-32BC15B1DBF4";
	setAttr ".t" -type "double3" 0 -2 0.5 ;
createNode transform -n "R_wristToe_loc" -p "R_wristToe_loc_Grp";
	rename -uid "EF0A05B9-44CF-10FE-EFB2-0783D8451B13";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "wristToe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_wristToe_locShape" -p "R_wristToe_loc";
	rename -uid "A107F76A-4B25-5889-42E9-28A51A4FE431";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_bankRight_loc_Grp" -p "R_wristToe_loc";
	rename -uid "64C34327-4834-24A6-5CFA-C5B2F6961385";
	setAttr ".t" -type "double3" -1 -1 0.74999972723693986 ;
createNode transform -n "R_bankRight_loc" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_bankRight_loc_Grp";
	rename -uid "AA1CCB27-4B9C-B24E-D013-BAA8C63F58E7";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "bankRight";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_bankRight_locShape" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_bankRight_loc_Grp|R_bankRight_loc";
	rename -uid "B8C9A180-4C90-C2F5-54BA-FE8253D28880";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_heelExtra_loc_Grp" -p "R_wristToe_loc";
	rename -uid "056251F2-4D31-AF37-2413-70B4244BCEEA";
	setAttr ".t" -type "double3" 0 -1 -2.7276306013845897e-07 ;
createNode transform -n "R_heelExtra_loc" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_heelExtra_loc_Grp";
	rename -uid "54E28064-4595-C266-2DD7-1F87D163044A";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "heel";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_heelExtra_locShape" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_heelExtra_loc_Grp|R_heelExtra_loc";
	rename -uid "6C8F6798-4E9D-791D-F0E1-D793E6906619";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_bankLeft_loc_Grp" -p "R_wristToe_loc";
	rename -uid "908E1E03-48E7-5E15-652C-A58E5944EC5C";
	setAttr ".t" -type "double3" 1 -1 0.74999972723693986 ;
createNode transform -n "R_bankLeft_loc" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_bankLeft_loc_Grp";
	rename -uid "FC46B7C6-4FEF-9CE3-7E51-A39D80DB045D";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "bankLeft";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_bankLeft_locShape" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_bankLeft_loc_Grp|R_bankLeft_loc";
	rename -uid "57F36911-4CB9-6E28-21AB-53B02AA7E794";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_toeExtra_loc_Grp" -p "R_wristToe_loc";
	rename -uid "91A3CD5C-4464-AED1-0198-CBB3F9FD5AF8";
	setAttr ".t" -type "double3" 0 -1 0.74999972723693986 ;
createNode transform -n "R_toeExtra_loc" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_toeExtra_loc_Grp";
	rename -uid "63D1FF43-4B47-F2EF-AF37-3FB8C250BCE8";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_toeExtra_locShape" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_toeExtra_loc_Grp|R_toeExtra_loc";
	rename -uid "611378A7-442B-656E-FE59-56A0B379F88A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_toeEndExtra_loc_Grp" -p "R_wristToe_loc";
	rename -uid "B6C8BA05-4B8A-053F-4BBB-81962EFF80A8";
	setAttr ".t" -type "double3" 0 -1 1.4999997272369399 ;
createNode transform -n "R_toeEndExtra_loc" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_toeEndExtra_loc_Grp";
	rename -uid "62A1E2C3-47B9-1C2A-90BC-39994F6EF60B";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_toeEndExtra_locShape" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_toeEndExtra_loc_Grp|R_toeEndExtra_loc";
	rename -uid "1E8676AC-4432-872C-048F-72B74CB38BFA";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_wristToeEnd_loc_Grp" -p "R_wrist_loc";
	rename -uid "B14F87EE-4D4C-6B87-4EAA-1CA330C609E8";
	setAttr ".t" -type "double3" 0 -2 2 ;
createNode transform -n "R_wristToeEnd_loc" -p "R_wristToeEnd_loc_Grp";
	rename -uid "BDCE1793-43FA-FED8-E850-568E90B434DF";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "wristToeEnd";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "5";
createNode locator -n "R_wristToeEnd_locShape" -p "R_wristToeEnd_loc";
	rename -uid "75BCD58F-4C65-4139-013E-93B408DAA466";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_elbow_loc_Grp" -p "R_shoulder_loc";
	rename -uid "D9AC2AA9-4390-7721-89B5-06ABCCC1542E";
	setAttr ".t" -type "double3" 0 -7 -4 ;
createNode transform -n "R_elbow_loc" -p "R_elbow_loc_Grp";
	rename -uid "57A14C81-4A9C-AD47-BFAF-7589748C413A";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_elbow_locShape" -p "R_elbow_loc";
	rename -uid "BB4123B5-49C2-6C36-A9C3-5EA1C1A567CD";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_aim_support2" -p "R_elbow_loc";
	rename -uid "E859F1A7-4915-4E77-6B14-2BB8A92A6C42";
createNode aimConstraint -n "R_aim_support2_aimConstraint1" -p "R_aim_support2";
	rename -uid "7F65305C-4531-E165-2ADD-4D90B593383D";
	addAttr -dcb 0 -ci true -sn "w0" -ln "L_wrist_locW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" 0 -1 0 ;
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" -18.434948822921999 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_aim_support1" -p "R_elbow_loc";
	rename -uid "9D40EB9F-44AC-0530-7341-FBBF89114468";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
createNode aimConstraint -n "R_aim_support1_aimConstraint1" -p "R_aim_support1";
	rename -uid "AC77CCCF-46F8-F830-0C50-28802D3E797C";
	addAttr -dcb 0 -ci true -sn "w0" -ln "L_shoulder_locW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 29.744881296942214 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_shoulderExtra_loc_Grp" -p "R_elbow_loc";
	rename -uid "7585BB99-4C72-3991-F2AA-F5869E78E643";
createNode transform -n "R_shoulderExtra_loc" -p "R_shoulderExtra_loc_Grp";
	rename -uid "4384ED7B-47AC-53FF-B0D1-AA8A0993A2EA";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_shoulderExtra_locShape" -p "R_shoulderExtra_loc";
	rename -uid "EEF6BCBC-4AF7-C8DD-DB8B-FABCD2AD8DBC";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_shoulderExtra_loc_Grp_parentConstraint1" -p "R_shoulderExtra_loc_Grp";
	rename -uid "AB83F525-40B3-18E7-6E92-AC904D7EA87E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_aim_support1W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0 1.5194254987178031 -0.86824314212445897 ;
	setAttr ".tg[0].tor" -type "double3" -29.744881296942214 0 0 ;
	setAttr ".rst" -type "double3" 6 10.75 8 ;
	setAttr -k on ".w0";
createNode transform -n "R_elbowExtra_loc_Grp" -p "R_elbow_loc";
	rename -uid "DA894288-4E00-7CF2-A01E-1B90A5C98DBA";
	setAttr ".t" -type "double3" 0 0 -1 ;
createNode transform -n "R_elbowExtra_loc" -p "R_elbowExtra_loc_Grp";
	rename -uid "F16C288D-4EE8-0FF3-1F27-31959C145C1F";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_elbowExtra_locShape" -p "R_elbowExtra_loc";
	rename -uid "87129C8A-49D2-E0A0-80FA-289CCF281389";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_wristExtra_loc_Grp" -p "R_elbow_loc";
	rename -uid "81C508B9-4608-1482-08EF-B795D2D2F3B3";
createNode transform -n "R_wristExtra_loc" -p "R_wristExtra_loc_Grp";
	rename -uid "22A30431-46FF-B1CF-E7BC-5BB6C0FCD280";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_wristExtra_locShape" -p "R_wristExtra_loc";
	rename -uid "9184509A-456A-BABA-30ED-83BE27D670D0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_wristExtra_loc_Grp_parentConstraint1" -p "R_wristExtra_loc_Grp";
	rename -uid "4C71FE21-464D-230C-7BF3-31AB0B2D0E95";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_aim_support2W0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" -8.8817841970012523e-16 -1.5811388300841909 
		-0.94868329805051488 ;
	setAttr ".tg[0].tor" -type "double3" 18.434948822921996 0 0 ;
	setAttr ".lr" -type "double3" -3.1805546814635168e-15 0 0 ;
	setAttr ".rst" -type "double3" 5.9999999999999991 7.1999999999999984 7.5999999999999988 ;
	setAttr ".rsrr" -type "double3" -3.1805546814635168e-15 0 0 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "R_arm_loc_mirror_parentConstraint1" -p "R_arm_loc_mirror";
	rename -uid "7C187ECC-4B2D-62D9-07C2-1C8D6F228E03";
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
	setAttr ".tg[0].tot" -type "double3" -4 1 -1 ;
	setAttr ".rst" -type "double3" -4 23 9 ;
	setAttr -k on ".w0";
createNode transform -n "R_arm_nonParent";
	rename -uid "31891449-4E5D-F19C-A0A8-76AFD7C8D606";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode transform -n "R_scapula_curve" -p "R_arm_nonParent";
	rename -uid "0483D4B6-4613-576C-A73F-35B6E5B5EDFC";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode nurbsCurve -n "R_scapula_curveShape" -p "R_scapula_curve";
	rename -uid "E0A96C1D-4ACB-81CE-0F88-729A67C6C8A5";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-4 23 9
		-6 16 12
		;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode transform -n "R_shoulder_curve" -p "R_arm_nonParent";
	rename -uid "FB8AB35F-409B-3FA7-28D9-008E68AE1075";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode nurbsCurve -n "R_shoulder_curveShape" -p "R_shoulder_curve";
	rename -uid "D8EAF8FB-47AD-48C9-6122-D2A811BAE343";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-6 16 12
		-6 9 8
		;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode transform -n "R_elbow_curve" -p "R_arm_nonParent";
	rename -uid "9A405553-4213-422C-4126-2285A998A4A5";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode nurbsCurve -n "R_elbow_curveShape" -p "R_elbow_curve";
	rename -uid "E0979184-4FF0-F449-B996-74B5A72FAAD2";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-6 9 8
		-6 3 10
		;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode transform -n "R_wrist_curve" -p "R_arm_nonParent";
	rename -uid "C0CAE720-4BFD-7D1F-9C5F-B1924D6F4547";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode nurbsCurve -n "R_wrist_curveShape" -p "R_wrist_curve";
	rename -uid "6B544D15-438E-6844-CE67-3C9F92CA51F8";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-6 3 10
		-6 1 10.5
		;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode transform -n "R_wristToe_curve" -p "R_arm_nonParent";
	rename -uid "CA7D44FE-4690-B232-82E8-5BBB9DBCA011";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "wristToe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode nurbsCurve -n "R_wristToe_curveShape" -p "R_wristToe_curve";
	rename -uid "164805F7-4A57-BE03-A971-F8B6AE7F94B6";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-6 1 10.5
		-6 1 12
		;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "wristToe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
createNode transform -n "head_nonParent";
	rename -uid "41F0B57A-4D08-A504-9234-899C2263D91B";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "head_type";
createNode transform -n "jaw_curve" -p "head_nonParent";
	rename -uid "938F24F5-47E9-4560-3173-BBB52768AC25";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "jaw_curveShape" -p "jaw_curve";
	rename -uid "5F35BF17-4E20-ADEF-D595-48A4DFAAD8A4";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 27 17
		0 23 21
		;
createNode transform -n "gumA_curve" -p "head_nonParent";
	rename -uid "23062304-4441-EEA4-3971-4FA486FD1C6A";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "gumA_curveShape" -p "gumA_curve";
	rename -uid "8AC3B1E6-4AB1-ADE4-ECD7-F4AD6577D179";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 27 17
		0 24 19
		;
createNode transform -n "gumB_curve" -p "head_nonParent";
	rename -uid "4C759FA8-4FAC-9910-BCF2-F68A483CA150";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "gumB_curveShape" -p "gumB_curve";
	rename -uid "76C553AA-494C-8BB6-776F-D7AF25CD7455";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 27 17
		0 27 19
		;
createNode transform -n "tongue_curve" -p "head_nonParent";
	rename -uid "71DC31C9-4EEE-9D32-1B9D-A78837BC9701";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "tongue";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "tongue_type_type";
createNode nurbsCurve -n "tongue_curveShape" -p "tongue_curve";
	rename -uid "4E11F82C-4176-3759-E673-5087CBD6D1AB";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		3 2 0 no 3
		7 0 0 0 0.5 1 1 1
		5
		0 24 17
		0 24.583717346191403 17.283961534500122
		0 25.892116546630859 18.249692916870117
		0 26.095920562744141 20.067109107971191
		0 26 21
		;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "tongue";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "tongue_type_type";
createNode transform -n "tonguePivot_curve" -p "head_nonParent";
	rename -uid "BA71783E-4CA3-8977-C58F-4D9F1E34717C";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "tonguePivot_curveShape" -p "tonguePivot_curve";
	rename -uid "6B15141E-4BBD-E0B2-27F1-C4B79AD4100A";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 24 17
		0 24 18
		;
createNode transform -n "L_eye_curve" -p "head_nonParent";
	rename -uid "AE20DF0B-40DA-9FA3-3E12-3086AABB5856";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_eye_curveShape" -p "L_eye_curve";
	rename -uid "98D5B3FE-49BA-AB22-A7D8-648697E220A9";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		3 34 19
		3 34 21
		;
createNode transform -n "L_eyeAim_curve" -p "head_nonParent";
	rename -uid "B7495C61-4B36-F17C-D768-32BAAD68D2E3";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_eyeAim_curveShape" -p "L_eyeAim_curve";
	rename -uid "230077B7-4858-6AAC-2C98-65A96F5D546C";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		3 34 19
		3 34 31
		;
createNode transform -n "R_eye_curve" -p "head_nonParent";
	rename -uid "2E57470B-43EB-C8B6-28B0-16BF9BA07BDC";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_eye_curveShape" -p "R_eye_curve";
	rename -uid "FD7EBEB0-49D9-EDDC-A42D-C9BAA0E514D0";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-3 34 19
		-3.0000000000000004 34 21
		;
createNode transform -n "R_eyeAim_curve" -p "head_nonParent";
	rename -uid "5AA7D7E7-4094-22C6-B868-5DB5C12C45AC";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_eyeAim_curveShape" -p "R_eyeAim_curve";
	rename -uid "587345B6-4E58-1552-8376-B58C7E4267BD";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-3 34 19
		-3.0000000000000013 33.999999999999993 31
		;
createNode transform -n "head_mirror";
	rename -uid "0118D0CA-469C-9DD1-EE18-C6B46160F23A";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "head_type";
createNode transform -n "head_loc_Grp" -p "head_mirror";
	rename -uid "B9312007-4C4B-D286-D660-D585D97C1B90";
createNode transform -n "head_loc" -p "head_loc_Grp";
	rename -uid "3BDD0E15-4B1E-EF7E-1AA1-659561A52453";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "head";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "head_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "head_locShape" -p "head_loc";
	rename -uid "FF2571AC-4775-9439-C8C2-7EA58EFE310E";
	setAttr -k off ".v";
createNode transform -n "headA_loc_Grp" -p "head_loc";
	rename -uid "312F0E84-41E2-AC14-B63B-61A96C69A6DD";
	setAttr ".t" -type "double3" 0 -1 2 ;
createNode transform -n "headA_loc" -p "headA_loc_Grp";
	rename -uid "2ACC6EBC-4701-8569-C9DE-C2BC0387564C";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 28;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "headA";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "head_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "headA_locShape" -p "headA_loc";
	rename -uid "4AD8498E-47AE-6CDC-754A-ADAA63041711";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "jaw_loc_Grp" -p "headA_loc";
	rename -uid "C4CA7638-4A5C-D080-A900-FEA0346383A7";
	setAttr ".t" -type "double3" 0 -1 1 ;
createNode transform -n "jaw_loc" -p "jaw_loc_Grp";
	rename -uid "4BE2CB8A-4AD8-BBA4-8F7E-4184F15774D2";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 28;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "jaw";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "jaw_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "jaw_locShape" -p "jaw_loc";
	rename -uid "E1314F96-4785-AE0C-B70D-51A3716E368F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "jawEnd_loc_Grp" -p "jaw_loc";
	rename -uid "C55F4379-4B7F-EA3B-3109-3E89DA9E9C88";
	setAttr ".t" -type "double3" 0 -4 4 ;
createNode transform -n "jawEnd_loc" -p "jawEnd_loc_Grp";
	rename -uid "C07FE6DB-4010-C615-8933-33BBC23E01F7";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 28;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "jawEnd";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "jaw_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "jawEnd_locShape" -p "jawEnd_loc";
	rename -uid "C2E0F727-403E-72CF-07FC-D2BF1D079D88";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "gumA_loc_Grp" -p "headA_loc";
	rename -uid "4E322D23-4B9C-DDC6-D069-5EBA38680FD6";
	setAttr ".t" -type "double3" 0 -4 3 ;
createNode transform -n "gumA_loc" -p "gumA_loc_Grp";
	rename -uid "A6D85B7C-474D-7624-121A-338B45AA8B75";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 28;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "gumA";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "gum_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "gumA_locShape" -p "gumA_loc";
	rename -uid "881CC9A8-4227-C372-35D5-D18D9DAB2D2D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "gumB_loc_Grp" -p "headA_loc";
	rename -uid "06410B3F-4BAB-10AF-E4CF-95A4717E384E";
	setAttr ".t" -type "double3" 0 -1 3 ;
createNode transform -n "gumB_loc" -p "gumB_loc_Grp";
	rename -uid "541A8721-4468-0793-05FB-F9AE77D8D7B2";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 28;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "gumB";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "gum_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "gumB_locShape" -p "gumB_loc";
	rename -uid "114F6C58-4074-6BD1-7A49-A1A06EBF084A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "tongue1_loc_Grp" -p "headA_loc";
	rename -uid "C5C72249-463D-B2F1-4E6D-9484A161261C";
	setAttr ".t" -type "double3" 0 -4 1 ;
createNode transform -n "tongue1_loc" -p "tongue1_loc_Grp";
	rename -uid "F1774B4A-45AF-6833-22BA-57B1C8AA6AEC";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "tongue1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "tongue_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "tongue1_locShape" -p "tongue1_loc";
	rename -uid "F1ED8BB9-4507-2A44-F8DC-9F878F21CE41";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "tongueExtra1_loc_Grp" -p "headA_loc";
	rename -uid "220C4FFA-402E-749E-B016-5893242AD7CC";
createNode transform -n "tongueExtra1_loc" -p "tongueExtra1_loc_Grp";
	rename -uid "830D6A01-4C8A-76FF-0BAF-7797F730E219";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "tongue1";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "tongue_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "tongueExtra1_locShape" -p "tongueExtra1_loc";
	rename -uid "A2C4F69A-41C6-6164-CB17-2B8821051DFB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode pointConstraint -n "tongueExtra1_loc_Grp_pointConstraint1" -p "tongueExtra1_loc_Grp";
	rename -uid "43DF028D-47EF-44E0-04B9-D1BBB6BB32E1";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "tongue2_locW1" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "tongue1_locW0" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" 0 0.046356246948242585 -0.070951253890990884 ;
	setAttr ".rst" -type "double3" 0 47.583717346191406 3.2839615345001221 ;
	setAttr -k on ".w1" 0.284;
	setAttr -k on ".w0" 0.716;
createNode transform -n "tongue2_loc_Grp" -p "headA_loc";
	rename -uid "A965BC40-447A-72D8-F250-D5800AE63BF6";
createNode transform -n "tongue2_loc" -p "tongue2_loc_Grp";
	rename -uid "9EB88E0E-4CF9-D492-B810-4EA8A237F021";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "tongue2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "tongue_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "tongue2_locShape" -p "tongue2_loc";
	rename -uid "A95A19ED-4577-B087-5B63-D29DCEA18B1A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "tongue2_loc_Grp_pointConstraint1" -p "tongue2_loc_Grp";
	rename -uid "6BC61ED8-4EBC-6DB5-EBD4-7E93E3970A16";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "tongue3_locW1" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "tongue1_locW0" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" 0 0.89211654663085938 -0.75030708312988281 ;
	setAttr ".rst" -type "double3" 0 48.892116546630859 4.2496929168701172 ;
	setAttr -k on ".w1";
	setAttr -k on ".w0";
createNode transform -n "tongueExtra2_loc_Grp" -p "headA_loc";
	rename -uid "593FE694-432F-4C84-702B-1DB421E5FDC6";
createNode transform -n "tongueExtra2_loc" -p "tongueExtra2_loc_Grp";
	rename -uid "32807AD0-49CD-EE03-A91F-9F80B45C8CA6";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "tongue2";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "tongue_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "tongueExtra2_locShape" -p "tongueExtra2_loc";
	rename -uid "5DFF5B50-4901-EDA0-F780-1CAB687C8A50";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode pointConstraint -n "tongueExtra2_loc_Grp_pointConstraint1" -p "tongueExtra2_loc_Grp";
	rename -uid "D471B58C-4785-68F6-ECD8-ADAA9E2D4109";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "tongue2_locW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "tongue3_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" 0 0.1322772865295434 -0.0060374050140383773 ;
	setAttr ".rst" -type "double3" 0 49.095920562744141 6.0671091079711914 ;
	setAttr -k on ".w0" 0.337;
	setAttr -k on ".w1" 0.663;
createNode transform -n "tongue3_loc_Grp" -p "headA_loc";
	rename -uid "95EC2D9E-4D68-FBD5-7FAC-C7A195D6CAA4";
	setAttr ".t" -type "double3" 0 -2 5 ;
createNode transform -n "tongue3_loc" -p "tongue3_loc_Grp";
	rename -uid "587E000E-49A9-99D3-DB04-CFBFFE2879C6";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "tongue3";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "tongue_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "tongue3_locShape" -p "tongue3_loc";
	rename -uid "0C29FE71-493B-4A0F-0964-6AA7921DB34E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "tonguePivot_loc_Grp" -p "headA_loc";
	rename -uid "932E2D95-4F3C-CC9D-BB31-4B93ED954BF8";
	setAttr ".t" -type "double3" 0 -4 2 ;
createNode transform -n "tonguePivot_loc" -p "tonguePivot_loc_Grp";
	rename -uid "F13FC1DE-4D97-6CCF-B6E7-EE8B581D6D5C";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "tongue";
	setAttr ".rig_role" -type "string" "pivot";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "tongue_type";
createNode locator -n "tonguePivot_locShape" -p "tonguePivot_loc";
	rename -uid "8DE8576E-4FE6-3EFE-CDF1-F6976C0AA069";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "headB_loc_Grp" -p "head_loc";
	rename -uid "33787CA9-487C-4922-7846-1497719F8922";
	setAttr ".t" -type "double3" 0 1 2 ;
createNode transform -n "headB_loc" -p "headB_loc_Grp";
	rename -uid "57EA1E25-4D5C-DAE1-A685-DB8CC1EC0D5C";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "headB";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "head_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "headB_locShape" -p "headB_loc";
	rename -uid "32B0BB7B-4D25-8AB8-7967-7788FF6FD259";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_eyeRoot_mirror" -p "headB_loc";
	rename -uid "773AA70D-48F5-FF20-F60C-17A902619E33";
	setAttr ".t" -type "double3" 3 4 3 ;
createNode transform -n "L_eyeRoot_loc_Grp" -p "L_eyeRoot_mirror";
	rename -uid "1F5F5174-4E7C-DEC7-8979-1B946F5527F4";
createNode transform -n "L_eyeRoot_loc" -p "L_eyeRoot_loc_Grp";
	rename -uid "E1BD4A3F-4069-AC75-CF76-4986E30C4F2E";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "eyeRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "eye_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_eyeRoot_locShape" -p "L_eyeRoot_loc";
	rename -uid "F4BAC7FE-4CD8-592A-AB73-C1A239505112";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_eye_loc_Grp" -p "L_eyeRoot_loc";
	rename -uid "5149103D-4693-778C-B096-099366004BDF";
	setAttr ".v" no;
createNode transform -n "L_eye_loc" -p "L_eye_loc_Grp";
	rename -uid "EAA06D81-4495-DA5C-1B03-A391E8BF165E";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "eye";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "eye_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_eye_locShape" -p "L_eye_loc";
	rename -uid "682B7153-47DE-BF4B-C8AB-4F97B7029019";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_eyeEnd_loc_Grp" -p "L_eyeRoot_loc";
	rename -uid "8E7C3A6E-40DD-88A5-106E-43B560AA5B82";
	setAttr ".t" -type "double3" 0 0 2 ;
createNode transform -n "L_eyeEnd_loc" -p "L_eyeEnd_loc_Grp";
	rename -uid "6000B0F0-4012-58F2-C072-2D85EF420373";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "eyeEnd";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "eye_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_eyeEnd_locShape" -p "L_eyeEnd_loc";
	rename -uid "B93C4739-409B-E7C5-96DE-33831390D0AE";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_eyeAim_loc_Grp" -p "L_eyeRoot_mirror";
	rename -uid "1548FD3D-4D46-3883-E95D-54ADE048DD48";
createNode transform -n "L_eyeAim_loc" -p "L_eyeAim_loc_Grp";
	rename -uid "F8B83091-4BBA-9EA0-1171-6087C4E1B1B1";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "eyeAim";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "eye_type";
createNode locator -n "L_eyeAim_locShape" -p "L_eyeAim_loc";
	rename -uid "C88DC4AA-4F10-2642-2E16-6EBFAF3F1FEC";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_eyeAim_loc_Grp_parentConstraint1" -p "L_eyeAim_loc_Grp";
	rename -uid "CB7360DE-4C47-A5AE-C6CA-14A3B5E89E59";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_eye_locW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 3.0000000000000009 0 0 ;
	setAttr ".rst" -type "double3" 0 0 12 ;
	setAttr -k on ".w0";
createNode transform -n "R_eyeRoot_mirror" -p "headB_loc";
	rename -uid "D87A8A3A-495C-F792-BB26-DDB316ADB6AB";
	setAttr ".t" -type "double3" -3 4 3 ;
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr ".s" -type "double3" 1 1 -1 ;
createNode transform -n "R_eyeRoot_loc_Grp" -p "R_eyeRoot_mirror";
	rename -uid "C5C7F78D-4B5C-F1F4-32E7-8683F8DF8557";
createNode transform -n "R_eyeRoot_loc" -p "R_eyeRoot_loc_Grp";
	rename -uid "0D611871-466F-758B-F2AC-DCA366AB8847";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "eyeRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "eye_type";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_eyeRoot_locShape" -p "R_eyeRoot_loc";
	rename -uid "46E9BDE6-4C89-68AA-7D71-99A648539AF0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_eye_loc_Grp" -p "R_eyeRoot_loc";
	rename -uid "9D6C7FD5-43E5-40B4-7BA1-6287A9C571D9";
	setAttr ".v" no;
createNode transform -n "R_eye_loc" -p "R_eye_loc_Grp";
	rename -uid "609E93F3-4146-44B5-9C5E-D2A40A36F4C1";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "eye";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "eye_type";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_eye_locShape" -p "R_eye_loc";
	rename -uid "1A5609A9-4361-8B0D-65E5-0EB286E28DFD";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_eyeEnd_loc_Grp" -p "R_eyeRoot_loc";
	rename -uid "3724D11D-47FB-700B-6524-9EBEF90A97B2";
	setAttr ".t" -type "double3" 0 0 2 ;
createNode transform -n "R_eyeEnd_loc" -p "R_eyeEnd_loc_Grp";
	rename -uid "3FA5EE0B-412E-5B1B-3AE1-F7B8AF6673DD";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "eyeEnd";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "eye_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_eyeEnd_locShape" -p "R_eyeEnd_loc";
	rename -uid "A21F26EC-45CD-D0D7-F763-80ACC480138C";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_eyeAim_loc_Grp" -p "R_eyeRoot_mirror";
	rename -uid "F45D3971-4A29-4BD4-CD4D-98881CD089B9";
createNode transform -n "R_eyeAim_loc" -p "R_eyeAim_loc_Grp";
	rename -uid "620A5C22-41E3-BFF0-D069-6D91388C0287";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "eyeAim";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "eye_type";
createNode locator -n "R_eyeAim_locShape" -p "R_eyeAim_loc";
	rename -uid "0AEE131D-4F7E-3152-0E1B-E9BA9019C398";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_eyeAim_loc_Grp_parentConstraint1" -p "R_eyeAim_loc_Grp";
	rename -uid "A59FA6CF-4203-1C41-4130-E69CEF109A51";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_eye_locW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" -3.0000000000000009 -7.1054273576010019e-15 
		0 ;
	setAttr ".tg[0].tor" -type "double3" 180 0 0 ;
	setAttr ".rst" -type "double3" 4.4408920985006262e-16 -7.1054273576010019e-15 12 ;
	setAttr -k on ".w0";
createNode transform -n "C_eye_loc_Grp" -p "headB_loc";
	rename -uid "2C8297FE-4C1B-22B2-FCA9-A3B62D831CD4";
	setAttr ".t" -type "double3" -6.6613381477509392e-16 4 15 ;
createNode transform -n "C_eye_loc" -p "C_eye_loc_Grp";
	rename -uid "64CA50CB-416C-D720-5789-A58245504F2A";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "eye";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "eye_type";
createNode locator -n "C_eye_locShape" -p "C_eye_loc";
	rename -uid "64F3F3C5-422D-4BCD-D6CA-6CBD962E6A79";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "nose_loc_Grp" -p "headB_loc";
	rename -uid "2E3AAE56-4D93-5F6E-7255-C7A6E828042B";
	setAttr ".t" -type "double3" 0 -1 5 ;
createNode transform -n "nose_loc" -p "nose_loc_Grp";
	rename -uid "E02D08A2-45BD-9B47-DF09-288D0395CF8D";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".t" -type "double3" 0.056490961808491669 -0.14021338325147781 0.032717656879860613 ;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "nose";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "head_type";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "nose_locShape" -p "nose_loc";
	rename -uid "C83A54BA-4F41-1EB7-711F-F2A912CAACEA";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode parentConstraint -n "head_mirror_parentConstraint1" -p "head_mirror";
	rename -uid "BCF7E3CF-44CE-5F44-9098-089AF180CF4F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "neckRoot_locW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0 6 2.5 ;
	setAttr ".rst" -type "double3" 0 29 14 ;
	setAttr -k on ".w0";
createNode transform -n "tail_nonParent";
	rename -uid "BD3D270D-40A6-2B4D-78C9-8DBB7A6A8822";
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
	setAttr ".rig_boneType" -type "string" "tail_type";
	setAttr ".rig_side" -type "string" "C";
createNode transform -n "tail_Crv" -p "tail_nonParent";
	rename -uid "F16BBAD7-4848-58C0-1B3F-BB86EE7C9DE1";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "tail";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "tail_type";
	setAttr ".rig_side" -type "string" "C";
createNode nurbsCurve -n "tail_CrvShape" -p "tail_Crv";
	rename -uid "8B7E5176-4FC1-83B8-3031-CAADFF52A15F";
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
		0 22 -13
		0 21.997560656372066 -14.112220000000002
		0 22 -16.340000000000003
		-0.07342204270015884 21.999999999999503 -19.660000000000004
		-0.024449540219152896 22.002441250976396 -21.887780000000003
		0 22 -23
		;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "tail";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "tail_type";
	setAttr ".rig_side" -type "string" "C";
createNode transform -n "tail_mirror";
	rename -uid "A1B69DB4-4AF3-9DCE-A49F-36B643ECD02C";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "tail_type";
createNode transform -n "tailRoot_loc_Grp" -p "tail_mirror";
	rename -uid "B5357CD9-43D8-FED7-E213-B894B7049BF7";
createNode transform -n "tailRoot_loc" -p "tailRoot_loc_Grp";
	rename -uid "9CBBFE50-48A5-BB31-1CF8-549BAB880329";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "tailRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "tail_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "C";
createNode locator -n "tailRoot_locShape" -p "tailRoot_loc";
	rename -uid "EC70A672-4D4B-877A-04D8-669AB638672D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "tail1_loc_Grp" -p "tailRoot_loc";
	rename -uid "CD0DA32F-49BC-5E71-26F7-46A7C481E646";
	setAttr ".t" -type "double3" 0 0 -2 ;
createNode transform -n "tail1_loc" -p "tail1_loc_Grp";
	rename -uid "E42B6454-42B9-EB9F-DC38-4C9E7FC47D7F";
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
	setAttr ".rig_part" -type "string" "tail1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "tail_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "C";
createNode locator -n "tail1_locShape" -p "tail1_loc";
	rename -uid "11B93E55-49C4-76FC-2A8B-279B14A06663";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "tail3_loc_Grp" -p "tail1_loc";
	rename -uid "D6D64CB4-43EC-56E5-6861-25BBA612BFA9";
createNode transform -n "tail3_loc" -p "tail3_loc_Grp";
	rename -uid "59398014-4F56-1602-4461-9693483BBDF3";
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
	setAttr ".rig_part" -type "string" "tail3";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "tail_type";
	setAttr ".rig_index" -type "string" "3";
	setAttr ".rig_side" -type "string" "C";
createNode locator -n "tail3_locShape" -p "tail3_loc";
	rename -uid "CF943398-48A2-8F9D-78DE-EE9A7A73C2D1";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "splne2_loc_Grp_pointConstraint1" -p "tail3_loc_Grp";
	rename -uid "6773468C-4D52-0151-1E1F-498F4A8787CB";
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
createNode transform -n "tail2_loc_Grp" -p "tail1_loc";
	rename -uid "8865506A-4D39-D519-7CB8-E08CA2657736";
createNode transform -n "tail2_loc" -p "tail2_loc_Grp";
	rename -uid "2B86FCC9-4FCF-6350-815E-AE8A4AEF1E7D";
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
	setAttr ".rig_part" -type "string" "tail2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "tail_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "C";
createNode locator -n "tail2_locShape" -p "tail2_loc";
	rename -uid "15D3D41C-4EDB-BB3E-48B5-9CAA62429396";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "splne1_loc_Grp_pointConstraint1" -p "tail2_loc_Grp";
	rename -uid "464EC343-4F10-3ECE-8254-0D92E5670F3E";
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
createNode transform -n "tailEnd_loc_Grp" -p "tail1_loc";
	rename -uid "EF1F44CD-4692-B141-5571-2C80AFC643F5";
	setAttr ".t" -type "double3" 0 0 -10 ;
createNode transform -n "tailEnd_loc" -p "tailEnd_loc_Grp";
	rename -uid "4340D3FC-4FEA-FAA9-34F2-61ADC1521A55";
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
	setAttr ".rig_part" -type "string" "tailEnd";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "tail_type";
	setAttr ".rig_index" -type "string" "4";
	setAttr ".rig_side" -type "string" "C";
createNode locator -n "tailEnd_locShape" -p "tailEnd_loc";
	rename -uid "4A2E48BC-40F2-223A-CE46-AE8091F77F62";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "tailEndExtra_loc_Grp" -p "tail1_loc";
	rename -uid "F87914D0-436B-C3B1-1E97-C3B8FCC8069E";
createNode transform -n "tailEndExtra_loc" -p "tailEndExtra_loc_Grp";
	rename -uid "7112988C-4878-5190-CBF7-8C88C8175C23";
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
	setAttr ".rig_part" -type "string" "tailEnd";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "tail_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "C";
createNode locator -n "tailEndExtra_locShape" -p "tailEndExtra_loc";
	rename -uid "325207E9-4290-B6E2-F590-7980B749E0E3";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode pointConstraint -n "chestExtra_loc_Grp_pointConstraint1" -p "tailEndExtra_loc_Grp";
	rename -uid "141828FB-4B0F-AEAD-E454-E581CB988073";
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
createNode transform -n "tailExtra1_loc_Grp" -p "tail1_loc";
	rename -uid "4A24F682-4FCB-F62A-CEF6-41BAB08E377A";
createNode transform -n "tailExtra1_loc" -p "tailExtra1_loc_Grp";
	rename -uid "160593DD-4E89-E7A6-F91F-D79AACAC5DDA";
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
	setAttr ".rig_part" -type "string" "tail1";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "tail_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "C";
createNode locator -n "tailExtra1_locShape" -p "tailExtra1_loc";
	rename -uid "F34DD1F0-4055-F939-6DB9-9791EE341FD9";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode pointConstraint -n "rootExtra_loc_Grp_pointConstraint1" -p "tailExtra1_loc_Grp";
	rename -uid "3BE0D779-411E-A5DA-A331-7C84A70AA1A1";
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
createNode transform -n "root_vector_Grp" -p "tail1_loc";
	rename -uid "048C25B7-43DA-FA76-555D-AEB2D596DF8B";
createNode transform -n "root_vector" -p "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp";
	rename -uid "26142315-4523-BB34-5816-BB8CCB6FD46E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "quad_type";
	setAttr ".rig_part" -type "string" "tail";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "tail_type";
	setAttr ".rig_side" -type "string" "C";
createNode nurbsCurve -n "root_vectorShape" -p "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp|root_vector";
	rename -uid "E4F8B954-4D4E-01CF-7314-AEAA54C16D6A";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		1.6653345369377363e-16 -0.49999999999999989 1.6653345369377338e-16
		-1.6653345369377348e-16 -1.6653345369377348e-16 -0.50000000000000033
		-1.6653345369377363e-16 0.49999999999999989 -1.6653345369377338e-16
		-3.3306690738754726e-16 0.99999999999999978 -3.3306690738754676e-16
		-3.3306690738754696e-16 -3.3306690738754696e-16 -1.0000000000000007
		3.3306690738754726e-16 -0.99999999999999978 3.3306690738754676e-16
		1.6653345369377363e-16 -0.49999999999999989 1.6653345369377338e-16
		;
createNode aimConstraint -n "root_vector_Grp_aimConstraint1" -p "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp";
	rename -uid "763DD027-4B02-756C-D4A4-86B32E91B03D";
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
	setAttr ".a" -type "double3" 0 0 -1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0 0 45.000000000000007 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "tail_mirror_parentConstraint1" -p "tail_mirror";
	rename -uid "83715352-44CF-E0F3-7267-9EA06B5BA080";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "root_locW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0 0 -1 ;
	setAttr ".rst" -type "double3" 0 22 -11 ;
	setAttr -k on ".w0";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "2BACAC9A-41CA-1470-54D4-A791F8048322";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "CD68AD15-45D5-338B-4244-D5B6796AB98D";
createNode displayLayer -n "defaultLayer";
	rename -uid "287D8167-4032-53EE-4996-8685FE0C83E8";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "1FE754AF-41B4-8CD9-E949-33AE2D996DD1";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "F04BB8FA-4375-B4F3-1D64-59B7C4140232";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager1";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer1";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager4";
	rename -uid "1A0EE516-45C2-790C-238E-6F82A19A7E21";
createNode poseInterpolatorManager -n "poseInterpolatorManager4";
	rename -uid "67650E86-4647-CBCE-1305-978E1C19319A";
createNode renderLayerManager -n "renderLayerManager2";
	rename -uid "2204E19E-4CC0-AAF8-3205-5FA0D67F8C04";
createNode renderLayer -n "defaultRenderLayer2";
	rename -uid "6817F74C-491A-16D8-CF48-E1A2A60FB2C6";
	setAttr ".g" yes;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "10A94EB1-43B0-48B7-C038-CA84DE6C9397";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode VRaySettingsNode -s -n "vraySettings";
	rename -uid "F63F2DAA-4CC9-C580-3145-F08120C42382";
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
	setAttr ".rt_cpuRayBundleSize" 4;
	setAttr ".rt_gpuRayBundleSize" 128;
	setAttr ".rt_maxPaths" 10000;
	setAttr ".rt_engineType" 3;
	setAttr ".rt_gpuResizeTextures" 0;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "F3DADF28-49B1-2FCC-7368-13A0528E441A";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "4927689B-4810-BC01-592B-BC9CB43A0732";
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
connectAttr "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.ctx" "splne2_loc_Grp.tx"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.cty" "splne2_loc_Grp.ty"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.ctz" "splne2_loc_Grp.tz"
		;
connectAttr "splne2_loc_Grp.pim" "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "splne2_loc_Grp.rp" "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.crp"
		;
connectAttr "splne2_loc_Grp.rpt" "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.crt"
		;
connectAttr "root_loc.t" "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "root_loc.rp" "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "root_loc.rpt" "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "root_loc.pm" "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.w0" "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "chest_loc.t" "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "chest_loc.rp" "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "chest_loc.rpt" "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "chest_loc.pm" "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.w1" "|root_mirror|root_loc_Grp|root_loc|splne2_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.ctx" "splne1_loc_Grp.tx"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.cty" "splne1_loc_Grp.ty"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.ctz" "splne1_loc_Grp.tz"
		;
connectAttr "splne1_loc_Grp.pim" "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "splne1_loc_Grp.rp" "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.crp"
		;
connectAttr "splne1_loc_Grp.rpt" "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.crt"
		;
connectAttr "root_loc.t" "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "root_loc.rp" "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "root_loc.rpt" "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "root_loc.pm" "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.w0" "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "chest_loc.t" "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "chest_loc.rp" "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "chest_loc.rpt" "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "chest_loc.pm" "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.w1" "|root_mirror|root_loc_Grp|root_loc|splne1_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[1].tw"
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
connectAttr "neckEnd_loc_Grp_pointConstraint1.ctx" "neckEnd_loc_Grp.tx";
connectAttr "neckEnd_loc_Grp_pointConstraint1.cty" "neckEnd_loc_Grp.ty";
connectAttr "neckEnd_loc_Grp_pointConstraint1.ctz" "neckEnd_loc_Grp.tz";
connectAttr "neckEnd_loc_Grp.pim" "neckEnd_loc_Grp_pointConstraint1.cpim";
connectAttr "neckEnd_loc_Grp.rp" "neckEnd_loc_Grp_pointConstraint1.crp";
connectAttr "neckEnd_loc_Grp.rpt" "neckEnd_loc_Grp_pointConstraint1.crt";
connectAttr "head_loc.t" "neckEnd_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "head_loc.rp" "neckEnd_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "head_loc.rpt" "neckEnd_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "head_loc.pm" "neckEnd_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "neckEnd_loc_Grp_pointConstraint1.w0" "neckEnd_loc_Grp_pointConstraint1.tg[0].tw"
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
connectAttr "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.ctx" "chestExtra_loc_Grp.tx"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.cty" "chestExtra_loc_Grp.ty"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.ctz" "chestExtra_loc_Grp.tz"
		;
connectAttr "chestExtra_loc_Grp.pim" "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "chestExtra_loc_Grp.rp" "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.crp"
		;
connectAttr "chestExtra_loc_Grp.rpt" "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.crt"
		;
connectAttr "splne2_loc.t" "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "splne2_loc.rp" "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "splne2_loc.rpt" "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "splne2_loc.pm" "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.w0" "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "chest_loc.t" "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "chest_loc.rp" "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "chest_loc.rpt" "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "chest_loc.pm" "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.w1" "|root_mirror|root_loc_Grp|root_loc|chestExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.ctx" "rootExtra_loc_Grp.tx"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.cty" "rootExtra_loc_Grp.ty"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.ctz" "rootExtra_loc_Grp.tz"
		;
connectAttr "rootExtra_loc_Grp.pim" "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "rootExtra_loc_Grp.rp" "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.crp"
		;
connectAttr "rootExtra_loc_Grp.rpt" "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.crt"
		;
connectAttr "root_loc.t" "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "root_loc.rp" "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "root_loc.rpt" "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "root_loc.pm" "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.w0" "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "splne1_loc.t" "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "splne1_loc.rp" "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "splne1_loc.rpt" "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "splne1_loc.pm" "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.w1" "|root_mirror|root_loc_Grp|root_loc|rootExtra_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.crx" "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp.rx"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.cry" "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp.ry"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.crz" "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp.rz"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp.pim" "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.cpim"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp.t" "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.ct"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp.rp" "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.crp"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp.rpt" "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.crt"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp.ro" "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.cro"
		;
connectAttr "rootExtra_loc.t" "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.tg[0].tt"
		;
connectAttr "rootExtra_loc.rp" "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.tg[0].trp"
		;
connectAttr "rootExtra_loc.rpt" "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.tg[0].trt"
		;
connectAttr "rootExtra_loc.pm" "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.tg[0].tpm"
		;
connectAttr "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.w0" "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "root_loc.wm" "|root_mirror|root_loc_Grp|root_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.wum"
		;
connectAttr "L_hip_locShape.wp" "L_hip_curveShape.cp[0]";
connectAttr "L_knee_locShape.wp" "L_hip_curveShape.cp[1]";
connectAttr "L_knee_locShape.wp" "L_knee_curveShape.cp[0]";
connectAttr "L_ankle_locShape.wp" "L_knee_curveShape.cp[1]";
connectAttr "L_ankle_locShape.wp" "L_ankle_curveShape.cp[0]";
connectAttr "L_toeRoot_locShape.wp" "L_ankle_curveShape.cp[1]";
connectAttr "L_toeRoot_locShape.wp" "L_toeRoot_curveShape.cp[0]";
connectAttr "L_toe1_locShape.wp" "L_toeRoot_curveShape.cp[1]";
connectAttr "L_toe1_locShape.wp" "L_toe1_curveShape.cp[0]";
connectAttr "L_toe2_locShape.wp" "L_toe1_curveShape.cp[1]";
connectAttr "L_hip_loc_mirror_parentConstraint1.ctx" "L_hip_loc_mirror.tx";
connectAttr "L_hip_loc_mirror_parentConstraint1.cty" "L_hip_loc_mirror.ty";
connectAttr "L_hip_loc_mirror_parentConstraint1.ctz" "L_hip_loc_mirror.tz";
connectAttr "L_hip_loc_mirror_parentConstraint1.crx" "L_hip_loc_mirror.rx";
connectAttr "L_hip_loc_mirror_parentConstraint1.cry" "L_hip_loc_mirror.ry";
connectAttr "L_hip_loc_mirror_parentConstraint1.crz" "L_hip_loc_mirror.rz";
connectAttr "L_hipExtra_loc_Grp_parentConstraint1.ctx" "L_hipExtra_loc_Grp.tx";
connectAttr "L_hipExtra_loc_Grp_parentConstraint1.cty" "L_hipExtra_loc_Grp.ty";
connectAttr "L_hipExtra_loc_Grp_parentConstraint1.ctz" "L_hipExtra_loc_Grp.tz";
connectAttr "L_hipExtra_loc_Grp.ro" "L_hipExtra_loc_Grp_parentConstraint1.cro";
connectAttr "L_hipExtra_loc_Grp.pim" "L_hipExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "L_hipExtra_loc_Grp.rp" "L_hipExtra_loc_Grp_parentConstraint1.crp";
connectAttr "L_hipExtra_loc_Grp.rpt" "L_hipExtra_loc_Grp_parentConstraint1.crt";
connectAttr "L_L_aim_support1.t" "L_hipExtra_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "L_L_aim_support1.rp" "L_hipExtra_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "L_L_aim_support1.rpt" "L_hipExtra_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "L_L_aim_support1.r" "L_hipExtra_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "L_L_aim_support1.ro" "L_hipExtra_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "L_L_aim_support1.s" "L_hipExtra_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "L_L_aim_support1.pm" "L_hipExtra_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "L_hipExtra_loc_Grp_parentConstraint1.w0" "L_hipExtra_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "L_knee_ankleExtra1_loc_Grp_parentConstraint1.ctx" "L_knee_ankleExtra1_loc_Grp.tx"
		;
connectAttr "L_knee_ankleExtra1_loc_Grp_parentConstraint1.cty" "L_knee_ankleExtra1_loc_Grp.ty"
		;
connectAttr "L_knee_ankleExtra1_loc_Grp_parentConstraint1.ctz" "L_knee_ankleExtra1_loc_Grp.tz"
		;
connectAttr "L_knee_ankleExtra1_loc_Grp.ro" "L_knee_ankleExtra1_loc_Grp_parentConstraint1.cro"
		;
connectAttr "L_knee_ankleExtra1_loc_Grp.pim" "L_knee_ankleExtra1_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "L_knee_ankleExtra1_loc_Grp.rp" "L_knee_ankleExtra1_loc_Grp_parentConstraint1.crp"
		;
connectAttr "L_knee_ankleExtra1_loc_Grp.rpt" "L_knee_ankleExtra1_loc_Grp_parentConstraint1.crt"
		;
connectAttr "L_L_aim_support2.t" "L_knee_ankleExtra1_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "L_L_aim_support2.rp" "L_knee_ankleExtra1_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "L_L_aim_support2.rpt" "L_knee_ankleExtra1_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "L_L_aim_support2.r" "L_knee_ankleExtra1_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "L_L_aim_support2.ro" "L_knee_ankleExtra1_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "L_L_aim_support2.s" "L_knee_ankleExtra1_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "L_L_aim_support2.pm" "L_knee_ankleExtra1_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "L_knee_ankleExtra1_loc_Grp_parentConstraint1.w0" "L_knee_ankleExtra1_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "L_L_aim_support1_aimConstraint1.crx" "L_L_aim_support1.rx";
connectAttr "L_L_aim_support1_aimConstraint1.cry" "L_L_aim_support1.ry";
connectAttr "L_L_aim_support1_aimConstraint1.crz" "L_L_aim_support1.rz";
connectAttr "L_L_aim_support1.pim" "L_L_aim_support1_aimConstraint1.cpim";
connectAttr "L_L_aim_support1.t" "L_L_aim_support1_aimConstraint1.ct";
connectAttr "L_L_aim_support1.rp" "L_L_aim_support1_aimConstraint1.crp";
connectAttr "L_L_aim_support1.rpt" "L_L_aim_support1_aimConstraint1.crt";
connectAttr "L_L_aim_support1.ro" "L_L_aim_support1_aimConstraint1.cro";
connectAttr "L_hip_loc.t" "L_L_aim_support1_aimConstraint1.tg[0].tt";
connectAttr "L_hip_loc.rp" "L_L_aim_support1_aimConstraint1.tg[0].trp";
connectAttr "L_hip_loc.rpt" "L_L_aim_support1_aimConstraint1.tg[0].trt";
connectAttr "L_hip_loc.pm" "L_L_aim_support1_aimConstraint1.tg[0].tpm";
connectAttr "L_L_aim_support1_aimConstraint1.w0" "L_L_aim_support1_aimConstraint1.tg[0].tw"
		;
connectAttr "L_knee_loc.wm" "L_L_aim_support1_aimConstraint1.wum";
connectAttr "L_L_aim_support2_aimConstraint1.crx" "L_L_aim_support2.rx";
connectAttr "L_L_aim_support2_aimConstraint1.cry" "L_L_aim_support2.ry";
connectAttr "L_L_aim_support2_aimConstraint1.crz" "L_L_aim_support2.rz";
connectAttr "L_L_aim_support2.pim" "L_L_aim_support2_aimConstraint1.cpim";
connectAttr "L_L_aim_support2.t" "L_L_aim_support2_aimConstraint1.ct";
connectAttr "L_L_aim_support2.rp" "L_L_aim_support2_aimConstraint1.crp";
connectAttr "L_L_aim_support2.rpt" "L_L_aim_support2_aimConstraint1.crt";
connectAttr "L_L_aim_support2.ro" "L_L_aim_support2_aimConstraint1.cro";
connectAttr "L_ankle_loc.t" "L_L_aim_support2_aimConstraint1.tg[0].tt";
connectAttr "L_ankle_loc.rp" "L_L_aim_support2_aimConstraint1.tg[0].trp";
connectAttr "L_ankle_loc.rpt" "L_L_aim_support2_aimConstraint1.tg[0].trt";
connectAttr "L_ankle_loc.pm" "L_L_aim_support2_aimConstraint1.tg[0].tpm";
connectAttr "L_L_aim_support2_aimConstraint1.w0" "L_L_aim_support2_aimConstraint1.tg[0].tw"
		;
connectAttr "L_knee_loc.wm" "L_L_aim_support2_aimConstraint1.wum";
connectAttr "L_knee_ankleExtra2_loc_Grp_parentConstraint1.ctx" "L_knee_ankleExtra2_loc_Grp.tx"
		;
connectAttr "L_knee_ankleExtra2_loc_Grp_parentConstraint1.cty" "L_knee_ankleExtra2_loc_Grp.ty"
		;
connectAttr "L_knee_ankleExtra2_loc_Grp_parentConstraint1.ctz" "L_knee_ankleExtra2_loc_Grp.tz"
		;
connectAttr "L_knee_ankleExtra2_loc_Grp.ro" "L_knee_ankleExtra2_loc_Grp_parentConstraint1.cro"
		;
connectAttr "L_knee_ankleExtra2_loc_Grp.pim" "L_knee_ankleExtra2_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "L_knee_ankleExtra2_loc_Grp.rp" "L_knee_ankleExtra2_loc_Grp_parentConstraint1.crp"
		;
connectAttr "L_knee_ankleExtra2_loc_Grp.rpt" "L_knee_ankleExtra2_loc_Grp_parentConstraint1.crt"
		;
connectAttr "L_L_aim_support3.t" "L_knee_ankleExtra2_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "L_L_aim_support3.rp" "L_knee_ankleExtra2_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "L_L_aim_support3.rpt" "L_knee_ankleExtra2_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "L_L_aim_support3.r" "L_knee_ankleExtra2_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "L_L_aim_support3.ro" "L_knee_ankleExtra2_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "L_L_aim_support3.s" "L_knee_ankleExtra2_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "L_L_aim_support3.pm" "L_knee_ankleExtra2_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "L_knee_ankleExtra2_loc_Grp_parentConstraint1.w0" "L_knee_ankleExtra2_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "L_toeExtra_loc_Grp_parentConstraint1.ctx" "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_ankle_loc_Grp|L_ankle_loc|L_toeExtra_loc_Grp.tx"
		;
connectAttr "L_toeExtra_loc_Grp_parentConstraint1.cty" "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_ankle_loc_Grp|L_ankle_loc|L_toeExtra_loc_Grp.ty"
		;
connectAttr "L_toeExtra_loc_Grp_parentConstraint1.ctz" "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_ankle_loc_Grp|L_ankle_loc|L_toeExtra_loc_Grp.tz"
		;
connectAttr "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_ankle_loc_Grp|L_ankle_loc|L_toeExtra_loc_Grp.ro" "L_toeExtra_loc_Grp_parentConstraint1.cro"
		;
connectAttr "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_ankle_loc_Grp|L_ankle_loc|L_toeExtra_loc_Grp.pim" "L_toeExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_ankle_loc_Grp|L_ankle_loc|L_toeExtra_loc_Grp.rp" "L_toeExtra_loc_Grp_parentConstraint1.crp"
		;
connectAttr "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_ankle_loc_Grp|L_ankle_loc|L_toeExtra_loc_Grp.rpt" "L_toeExtra_loc_Grp_parentConstraint1.crt"
		;
connectAttr "L_L_aim_support4.t" "L_toeExtra_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "L_L_aim_support4.rp" "L_toeExtra_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "L_L_aim_support4.rpt" "L_toeExtra_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "L_L_aim_support4.r" "L_toeExtra_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "L_L_aim_support4.ro" "L_toeExtra_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "L_L_aim_support4.s" "L_toeExtra_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "L_L_aim_support4.pm" "L_toeExtra_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "L_toeExtra_loc_Grp_parentConstraint1.w0" "L_toeExtra_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "L_L_aim_support3_aimConstraint1.crx" "L_L_aim_support3.rx";
connectAttr "L_L_aim_support3_aimConstraint1.cry" "L_L_aim_support3.ry";
connectAttr "L_L_aim_support3_aimConstraint1.crz" "L_L_aim_support3.rz";
connectAttr "L_L_aim_support3.pim" "L_L_aim_support3_aimConstraint1.cpim";
connectAttr "L_L_aim_support3.t" "L_L_aim_support3_aimConstraint1.ct";
connectAttr "L_L_aim_support3.rp" "L_L_aim_support3_aimConstraint1.crp";
connectAttr "L_L_aim_support3.rpt" "L_L_aim_support3_aimConstraint1.crt";
connectAttr "L_L_aim_support3.ro" "L_L_aim_support3_aimConstraint1.cro";
connectAttr "L_knee_loc.t" "L_L_aim_support3_aimConstraint1.tg[0].tt";
connectAttr "L_knee_loc.rp" "L_L_aim_support3_aimConstraint1.tg[0].trp";
connectAttr "L_knee_loc.rpt" "L_L_aim_support3_aimConstraint1.tg[0].trt";
connectAttr "L_knee_loc.pm" "L_L_aim_support3_aimConstraint1.tg[0].tpm";
connectAttr "L_L_aim_support3_aimConstraint1.w0" "L_L_aim_support3_aimConstraint1.tg[0].tw"
		;
connectAttr "L_ankle_loc.wm" "L_L_aim_support3_aimConstraint1.wum";
connectAttr "L_L_aim_support4_aimConstraint1.crx" "L_L_aim_support4.rx";
connectAttr "L_L_aim_support4_aimConstraint1.cry" "L_L_aim_support4.ry";
connectAttr "L_L_aim_support4_aimConstraint1.crz" "L_L_aim_support4.rz";
connectAttr "L_L_aim_support4.pim" "L_L_aim_support4_aimConstraint1.cpim";
connectAttr "L_L_aim_support4.t" "L_L_aim_support4_aimConstraint1.ct";
connectAttr "L_L_aim_support4.rp" "L_L_aim_support4_aimConstraint1.crp";
connectAttr "L_L_aim_support4.rpt" "L_L_aim_support4_aimConstraint1.crt";
connectAttr "L_L_aim_support4.ro" "L_L_aim_support4_aimConstraint1.cro";
connectAttr "L_toeRoot_loc.t" "L_L_aim_support4_aimConstraint1.tg[0].tt";
connectAttr "L_toeRoot_loc.rp" "L_L_aim_support4_aimConstraint1.tg[0].trp";
connectAttr "L_toeRoot_loc.rpt" "L_L_aim_support4_aimConstraint1.tg[0].trt";
connectAttr "L_toeRoot_loc.pm" "L_L_aim_support4_aimConstraint1.tg[0].tpm";
connectAttr "L_L_aim_support4_aimConstraint1.w0" "L_L_aim_support4_aimConstraint1.tg[0].tw"
		;
connectAttr "L_ankle_loc.wm" "L_L_aim_support4_aimConstraint1.wum";
connectAttr "L_leg_vector_Grp_pointConstraint1.ctx" "L_leg_vector_Grp.tx";
connectAttr "L_leg_vector_Grp_pointConstraint1.cty" "L_leg_vector_Grp.ty";
connectAttr "L_leg_vector_Grp_pointConstraint1.ctz" "L_leg_vector_Grp.tz";
connectAttr "L_leg_vector_Grp_aimConstraint1.crx" "L_leg_vector_Grp.rx";
connectAttr "L_leg_vector_Grp_aimConstraint1.cry" "L_leg_vector_Grp.ry";
connectAttr "L_leg_vector_Grp_aimConstraint1.crz" "L_leg_vector_Grp.rz";
connectAttr "L_leg_vector_Grp.pim" "L_leg_vector_Grp_pointConstraint1.cpim";
connectAttr "L_leg_vector_Grp.rp" "L_leg_vector_Grp_pointConstraint1.crp";
connectAttr "L_leg_vector_Grp.rpt" "L_leg_vector_Grp_pointConstraint1.crt";
connectAttr "L_hip_loc.t" "L_leg_vector_Grp_pointConstraint1.tg[0].tt";
connectAttr "L_hip_loc.rp" "L_leg_vector_Grp_pointConstraint1.tg[0].trp";
connectAttr "L_hip_loc.rpt" "L_leg_vector_Grp_pointConstraint1.tg[0].trt";
connectAttr "L_hip_loc.pm" "L_leg_vector_Grp_pointConstraint1.tg[0].tpm";
connectAttr "L_leg_vector_Grp_pointConstraint1.w0" "L_leg_vector_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "L_leg_vector_Grp.pim" "L_leg_vector_Grp_aimConstraint1.cpim";
connectAttr "L_leg_vector_Grp.t" "L_leg_vector_Grp_aimConstraint1.ct";
connectAttr "L_leg_vector_Grp.rp" "L_leg_vector_Grp_aimConstraint1.crp";
connectAttr "L_leg_vector_Grp.rpt" "L_leg_vector_Grp_aimConstraint1.crt";
connectAttr "L_leg_vector_Grp.ro" "L_leg_vector_Grp_aimConstraint1.cro";
connectAttr "L_knee_loc.t" "L_leg_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "L_knee_loc.rp" "L_leg_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "L_knee_loc.rpt" "L_leg_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "L_knee_loc.pm" "L_leg_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "L_leg_vector_Grp_aimConstraint1.w0" "L_leg_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "L_hip_loc.wm" "L_leg_vector_Grp_aimConstraint1.wum";
connectAttr "L_hip_loc_mirror.ro" "L_hip_loc_mirror_parentConstraint1.cro";
connectAttr "L_hip_loc_mirror.pim" "L_hip_loc_mirror_parentConstraint1.cpim";
connectAttr "L_hip_loc_mirror.rp" "L_hip_loc_mirror_parentConstraint1.crp";
connectAttr "L_hip_loc_mirror.rpt" "L_hip_loc_mirror_parentConstraint1.crt";
connectAttr "root_loc.t" "L_hip_loc_mirror_parentConstraint1.tg[0].tt";
connectAttr "root_loc.rp" "L_hip_loc_mirror_parentConstraint1.tg[0].trp";
connectAttr "root_loc.rpt" "L_hip_loc_mirror_parentConstraint1.tg[0].trt";
connectAttr "root_loc.r" "L_hip_loc_mirror_parentConstraint1.tg[0].tr";
connectAttr "root_loc.ro" "L_hip_loc_mirror_parentConstraint1.tg[0].tro";
connectAttr "root_loc.s" "L_hip_loc_mirror_parentConstraint1.tg[0].ts";
connectAttr "root_loc.pm" "L_hip_loc_mirror_parentConstraint1.tg[0].tpm";
connectAttr "L_hip_loc_mirror_parentConstraint1.w0" "L_hip_loc_mirror_parentConstraint1.tg[0].tw"
		;
connectAttr "R_hip_locShape.wp" "R_hip_curveShape.cp[0]";
connectAttr "R_knee_locShape.wp" "R_hip_curveShape.cp[1]";
connectAttr "R_knee_locShape.wp" "R_knee_curveShape.cp[0]";
connectAttr "R_ankle_locShape.wp" "R_knee_curveShape.cp[1]";
connectAttr "R_ankle_locShape.wp" "R_ankle_curveShape.cp[0]";
connectAttr "R_toeRoot_locShape.wp" "R_ankle_curveShape.cp[1]";
connectAttr "R_toeRoot_locShape.wp" "R_toeRoot_curveShape.cp[0]";
connectAttr "R_toe1_locShape.wp" "R_toeRoot_curveShape.cp[1]";
connectAttr "R_toe1_locShape.wp" "R_toe1_curveShape.cp[0]";
connectAttr "R_toe2_locShape.wp" "R_toe1_curveShape.cp[1]";
connectAttr "R_hip_loc_mirror_parentConstraint1.ctx" "R_hip_loc_mirror.tx";
connectAttr "R_hip_loc_mirror_parentConstraint1.cty" "R_hip_loc_mirror.ty";
connectAttr "R_hip_loc_mirror_parentConstraint1.ctz" "R_hip_loc_mirror.tz";
connectAttr "R_hip_loc_mirror_parentConstraint1.crx" "R_hip_loc_mirror.rx";
connectAttr "R_hip_loc_mirror_parentConstraint1.cry" "R_hip_loc_mirror.ry";
connectAttr "R_hip_loc_mirror_parentConstraint1.crz" "R_hip_loc_mirror.rz";
connectAttr "R_hipExtra_loc_Grp_parentConstraint1.ctx" "R_hipExtra_loc_Grp.tx";
connectAttr "R_hipExtra_loc_Grp_parentConstraint1.cty" "R_hipExtra_loc_Grp.ty";
connectAttr "R_hipExtra_loc_Grp_parentConstraint1.ctz" "R_hipExtra_loc_Grp.tz";
connectAttr "R_hipExtra_loc_Grp.ro" "R_hipExtra_loc_Grp_parentConstraint1.cro";
connectAttr "R_hipExtra_loc_Grp.pim" "R_hipExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "R_hipExtra_loc_Grp.rp" "R_hipExtra_loc_Grp_parentConstraint1.crp";
connectAttr "R_hipExtra_loc_Grp.rpt" "R_hipExtra_loc_Grp_parentConstraint1.crt";
connectAttr "R_L_aim_support1.t" "R_hipExtra_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "R_L_aim_support1.rp" "R_hipExtra_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "R_L_aim_support1.rpt" "R_hipExtra_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "R_L_aim_support1.r" "R_hipExtra_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "R_L_aim_support1.ro" "R_hipExtra_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "R_L_aim_support1.s" "R_hipExtra_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "R_L_aim_support1.pm" "R_hipExtra_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "R_hipExtra_loc_Grp_parentConstraint1.w0" "R_hipExtra_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "R_knee_ankleExtra1_loc_Grp_parentConstraint1.ctx" "R_knee_ankleExtra1_loc_Grp.tx"
		;
connectAttr "R_knee_ankleExtra1_loc_Grp_parentConstraint1.cty" "R_knee_ankleExtra1_loc_Grp.ty"
		;
connectAttr "R_knee_ankleExtra1_loc_Grp_parentConstraint1.ctz" "R_knee_ankleExtra1_loc_Grp.tz"
		;
connectAttr "R_knee_ankleExtra1_loc_Grp.ro" "R_knee_ankleExtra1_loc_Grp_parentConstraint1.cro"
		;
connectAttr "R_knee_ankleExtra1_loc_Grp.pim" "R_knee_ankleExtra1_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "R_knee_ankleExtra1_loc_Grp.rp" "R_knee_ankleExtra1_loc_Grp_parentConstraint1.crp"
		;
connectAttr "R_knee_ankleExtra1_loc_Grp.rpt" "R_knee_ankleExtra1_loc_Grp_parentConstraint1.crt"
		;
connectAttr "R_L_aim_support2.t" "R_knee_ankleExtra1_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "R_L_aim_support2.rp" "R_knee_ankleExtra1_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "R_L_aim_support2.rpt" "R_knee_ankleExtra1_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "R_L_aim_support2.r" "R_knee_ankleExtra1_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "R_L_aim_support2.ro" "R_knee_ankleExtra1_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "R_L_aim_support2.s" "R_knee_ankleExtra1_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "R_L_aim_support2.pm" "R_knee_ankleExtra1_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "R_knee_ankleExtra1_loc_Grp_parentConstraint1.w0" "R_knee_ankleExtra1_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "R_L_aim_support1_aimConstraint1.crx" "R_L_aim_support1.rx";
connectAttr "R_L_aim_support1_aimConstraint1.cry" "R_L_aim_support1.ry";
connectAttr "R_L_aim_support1_aimConstraint1.crz" "R_L_aim_support1.rz";
connectAttr "R_L_aim_support1.pim" "R_L_aim_support1_aimConstraint1.cpim";
connectAttr "R_L_aim_support1.t" "R_L_aim_support1_aimConstraint1.ct";
connectAttr "R_L_aim_support1.rp" "R_L_aim_support1_aimConstraint1.crp";
connectAttr "R_L_aim_support1.rpt" "R_L_aim_support1_aimConstraint1.crt";
connectAttr "R_L_aim_support1.ro" "R_L_aim_support1_aimConstraint1.cro";
connectAttr "R_hip_loc.t" "R_L_aim_support1_aimConstraint1.tg[0].tt";
connectAttr "R_hip_loc.rp" "R_L_aim_support1_aimConstraint1.tg[0].trp";
connectAttr "R_hip_loc.rpt" "R_L_aim_support1_aimConstraint1.tg[0].trt";
connectAttr "R_hip_loc.pm" "R_L_aim_support1_aimConstraint1.tg[0].tpm";
connectAttr "R_L_aim_support1_aimConstraint1.w0" "R_L_aim_support1_aimConstraint1.tg[0].tw"
		;
connectAttr "R_knee_loc.wm" "R_L_aim_support1_aimConstraint1.wum";
connectAttr "R_L_aim_support2_aimConstraint1.crx" "R_L_aim_support2.rx";
connectAttr "R_L_aim_support2_aimConstraint1.cry" "R_L_aim_support2.ry";
connectAttr "R_L_aim_support2_aimConstraint1.crz" "R_L_aim_support2.rz";
connectAttr "R_L_aim_support2.pim" "R_L_aim_support2_aimConstraint1.cpim";
connectAttr "R_L_aim_support2.t" "R_L_aim_support2_aimConstraint1.ct";
connectAttr "R_L_aim_support2.rp" "R_L_aim_support2_aimConstraint1.crp";
connectAttr "R_L_aim_support2.rpt" "R_L_aim_support2_aimConstraint1.crt";
connectAttr "R_L_aim_support2.ro" "R_L_aim_support2_aimConstraint1.cro";
connectAttr "R_ankle_loc.t" "R_L_aim_support2_aimConstraint1.tg[0].tt";
connectAttr "R_ankle_loc.rp" "R_L_aim_support2_aimConstraint1.tg[0].trp";
connectAttr "R_ankle_loc.rpt" "R_L_aim_support2_aimConstraint1.tg[0].trt";
connectAttr "R_ankle_loc.pm" "R_L_aim_support2_aimConstraint1.tg[0].tpm";
connectAttr "R_L_aim_support2_aimConstraint1.w0" "R_L_aim_support2_aimConstraint1.tg[0].tw"
		;
connectAttr "R_knee_loc.wm" "R_L_aim_support2_aimConstraint1.wum";
connectAttr "R_knee_ankleExtra2_loc_Grp_parentConstraint1.ctx" "R_knee_ankleExtra2_loc_Grp.tx"
		;
connectAttr "R_knee_ankleExtra2_loc_Grp_parentConstraint1.cty" "R_knee_ankleExtra2_loc_Grp.ty"
		;
connectAttr "R_knee_ankleExtra2_loc_Grp_parentConstraint1.ctz" "R_knee_ankleExtra2_loc_Grp.tz"
		;
connectAttr "R_knee_ankleExtra2_loc_Grp.ro" "R_knee_ankleExtra2_loc_Grp_parentConstraint1.cro"
		;
connectAttr "R_knee_ankleExtra2_loc_Grp.pim" "R_knee_ankleExtra2_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "R_knee_ankleExtra2_loc_Grp.rp" "R_knee_ankleExtra2_loc_Grp_parentConstraint1.crp"
		;
connectAttr "R_knee_ankleExtra2_loc_Grp.rpt" "R_knee_ankleExtra2_loc_Grp_parentConstraint1.crt"
		;
connectAttr "R_L_aim_support3.t" "R_knee_ankleExtra2_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "R_L_aim_support3.rp" "R_knee_ankleExtra2_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "R_L_aim_support3.rpt" "R_knee_ankleExtra2_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "R_L_aim_support3.r" "R_knee_ankleExtra2_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "R_L_aim_support3.ro" "R_knee_ankleExtra2_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "R_L_aim_support3.s" "R_knee_ankleExtra2_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "R_L_aim_support3.pm" "R_knee_ankleExtra2_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "R_knee_ankleExtra2_loc_Grp_parentConstraint1.w0" "R_knee_ankleExtra2_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "R_toeExtra_loc_Grp_parentConstraint1.ctx" "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_ankle_loc_Grp|R_ankle_loc|R_toeExtra_loc_Grp.tx"
		;
connectAttr "R_toeExtra_loc_Grp_parentConstraint1.cty" "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_ankle_loc_Grp|R_ankle_loc|R_toeExtra_loc_Grp.ty"
		;
connectAttr "R_toeExtra_loc_Grp_parentConstraint1.ctz" "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_ankle_loc_Grp|R_ankle_loc|R_toeExtra_loc_Grp.tz"
		;
connectAttr "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_ankle_loc_Grp|R_ankle_loc|R_toeExtra_loc_Grp.ro" "R_toeExtra_loc_Grp_parentConstraint1.cro"
		;
connectAttr "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_ankle_loc_Grp|R_ankle_loc|R_toeExtra_loc_Grp.pim" "R_toeExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_ankle_loc_Grp|R_ankle_loc|R_toeExtra_loc_Grp.rp" "R_toeExtra_loc_Grp_parentConstraint1.crp"
		;
connectAttr "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_ankle_loc_Grp|R_ankle_loc|R_toeExtra_loc_Grp.rpt" "R_toeExtra_loc_Grp_parentConstraint1.crt"
		;
connectAttr "R_L_aim_support4.t" "R_toeExtra_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "R_L_aim_support4.rp" "R_toeExtra_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "R_L_aim_support4.rpt" "R_toeExtra_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "R_L_aim_support4.r" "R_toeExtra_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "R_L_aim_support4.ro" "R_toeExtra_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "R_L_aim_support4.s" "R_toeExtra_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "R_L_aim_support4.pm" "R_toeExtra_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "R_toeExtra_loc_Grp_parentConstraint1.w0" "R_toeExtra_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "R_L_aim_support3_aimConstraint1.crx" "R_L_aim_support3.rx";
connectAttr "R_L_aim_support3_aimConstraint1.cry" "R_L_aim_support3.ry";
connectAttr "R_L_aim_support3_aimConstraint1.crz" "R_L_aim_support3.rz";
connectAttr "R_L_aim_support3.pim" "R_L_aim_support3_aimConstraint1.cpim";
connectAttr "R_L_aim_support3.t" "R_L_aim_support3_aimConstraint1.ct";
connectAttr "R_L_aim_support3.rp" "R_L_aim_support3_aimConstraint1.crp";
connectAttr "R_L_aim_support3.rpt" "R_L_aim_support3_aimConstraint1.crt";
connectAttr "R_L_aim_support3.ro" "R_L_aim_support3_aimConstraint1.cro";
connectAttr "R_knee_loc.t" "R_L_aim_support3_aimConstraint1.tg[0].tt";
connectAttr "R_knee_loc.rp" "R_L_aim_support3_aimConstraint1.tg[0].trp";
connectAttr "R_knee_loc.rpt" "R_L_aim_support3_aimConstraint1.tg[0].trt";
connectAttr "R_knee_loc.pm" "R_L_aim_support3_aimConstraint1.tg[0].tpm";
connectAttr "R_L_aim_support3_aimConstraint1.w0" "R_L_aim_support3_aimConstraint1.tg[0].tw"
		;
connectAttr "R_ankle_loc.wm" "R_L_aim_support3_aimConstraint1.wum";
connectAttr "R_L_aim_support4_aimConstraint1.crx" "R_L_aim_support4.rx";
connectAttr "R_L_aim_support4_aimConstraint1.cry" "R_L_aim_support4.ry";
connectAttr "R_L_aim_support4_aimConstraint1.crz" "R_L_aim_support4.rz";
connectAttr "R_L_aim_support4.pim" "R_L_aim_support4_aimConstraint1.cpim";
connectAttr "R_L_aim_support4.t" "R_L_aim_support4_aimConstraint1.ct";
connectAttr "R_L_aim_support4.rp" "R_L_aim_support4_aimConstraint1.crp";
connectAttr "R_L_aim_support4.rpt" "R_L_aim_support4_aimConstraint1.crt";
connectAttr "R_L_aim_support4.ro" "R_L_aim_support4_aimConstraint1.cro";
connectAttr "R_toeRoot_loc.t" "R_L_aim_support4_aimConstraint1.tg[0].tt";
connectAttr "R_toeRoot_loc.rp" "R_L_aim_support4_aimConstraint1.tg[0].trp";
connectAttr "R_toeRoot_loc.rpt" "R_L_aim_support4_aimConstraint1.tg[0].trt";
connectAttr "R_toeRoot_loc.pm" "R_L_aim_support4_aimConstraint1.tg[0].tpm";
connectAttr "R_L_aim_support4_aimConstraint1.w0" "R_L_aim_support4_aimConstraint1.tg[0].tw"
		;
connectAttr "R_ankle_loc.wm" "R_L_aim_support4_aimConstraint1.wum";
connectAttr "R_leg_vector_Grp_pointConstraint1.ctx" "R_leg_vector_Grp.tx";
connectAttr "R_leg_vector_Grp_pointConstraint1.cty" "R_leg_vector_Grp.ty";
connectAttr "R_leg_vector_Grp_pointConstraint1.ctz" "R_leg_vector_Grp.tz";
connectAttr "R_leg_vector_Grp_aimConstraint1.crx" "R_leg_vector_Grp.rx";
connectAttr "R_leg_vector_Grp_aimConstraint1.cry" "R_leg_vector_Grp.ry";
connectAttr "R_leg_vector_Grp_aimConstraint1.crz" "R_leg_vector_Grp.rz";
connectAttr "R_leg_vector_Grp.pim" "R_leg_vector_Grp_pointConstraint1.cpim";
connectAttr "R_leg_vector_Grp.rp" "R_leg_vector_Grp_pointConstraint1.crp";
connectAttr "R_leg_vector_Grp.rpt" "R_leg_vector_Grp_pointConstraint1.crt";
connectAttr "R_hip_loc.t" "R_leg_vector_Grp_pointConstraint1.tg[0].tt";
connectAttr "R_hip_loc.rp" "R_leg_vector_Grp_pointConstraint1.tg[0].trp";
connectAttr "R_hip_loc.rpt" "R_leg_vector_Grp_pointConstraint1.tg[0].trt";
connectAttr "R_hip_loc.pm" "R_leg_vector_Grp_pointConstraint1.tg[0].tpm";
connectAttr "R_leg_vector_Grp_pointConstraint1.w0" "R_leg_vector_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "R_leg_vector_Grp.pim" "R_leg_vector_Grp_aimConstraint1.cpim";
connectAttr "R_leg_vector_Grp.t" "R_leg_vector_Grp_aimConstraint1.ct";
connectAttr "R_leg_vector_Grp.rp" "R_leg_vector_Grp_aimConstraint1.crp";
connectAttr "R_leg_vector_Grp.rpt" "R_leg_vector_Grp_aimConstraint1.crt";
connectAttr "R_leg_vector_Grp.ro" "R_leg_vector_Grp_aimConstraint1.cro";
connectAttr "R_knee_loc.t" "R_leg_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "R_knee_loc.rp" "R_leg_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "R_knee_loc.rpt" "R_leg_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "R_knee_loc.pm" "R_leg_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "R_leg_vector_Grp_aimConstraint1.w0" "R_leg_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "R_hip_loc.wm" "R_leg_vector_Grp_aimConstraint1.wum";
connectAttr "R_hip_loc_mirror.ro" "R_hip_loc_mirror_parentConstraint1.cro";
connectAttr "R_hip_loc_mirror.pim" "R_hip_loc_mirror_parentConstraint1.cpim";
connectAttr "R_hip_loc_mirror.rp" "R_hip_loc_mirror_parentConstraint1.crp";
connectAttr "R_hip_loc_mirror.rpt" "R_hip_loc_mirror_parentConstraint1.crt";
connectAttr "root_loc.t" "R_hip_loc_mirror_parentConstraint1.tg[0].tt";
connectAttr "root_loc.rp" "R_hip_loc_mirror_parentConstraint1.tg[0].trp";
connectAttr "root_loc.rpt" "R_hip_loc_mirror_parentConstraint1.tg[0].trt";
connectAttr "root_loc.r" "R_hip_loc_mirror_parentConstraint1.tg[0].tr";
connectAttr "root_loc.ro" "R_hip_loc_mirror_parentConstraint1.tg[0].tro";
connectAttr "root_loc.s" "R_hip_loc_mirror_parentConstraint1.tg[0].ts";
connectAttr "root_loc.pm" "R_hip_loc_mirror_parentConstraint1.tg[0].tpm";
connectAttr "R_hip_loc_mirror_parentConstraint1.w0" "R_hip_loc_mirror_parentConstraint1.tg[0].tw"
		;
connectAttr "L_arm_loc_mirror_parentConstraint1.ctx" "L_arm_loc_mirror.tx";
connectAttr "L_arm_loc_mirror_parentConstraint1.cty" "L_arm_loc_mirror.ty";
connectAttr "L_arm_loc_mirror_parentConstraint1.ctz" "L_arm_loc_mirror.tz";
connectAttr "L_arm_loc_mirror_parentConstraint1.crx" "L_arm_loc_mirror.rx";
connectAttr "L_arm_loc_mirror_parentConstraint1.cry" "L_arm_loc_mirror.ry";
connectAttr "L_arm_loc_mirror_parentConstraint1.crz" "L_arm_loc_mirror.rz";
connectAttr "L_scapula_vector_Grp_aimConstraint1.crx" "L_scapula_vector_Grp.rx";
connectAttr "L_scapula_vector_Grp_aimConstraint1.cry" "L_scapula_vector_Grp.ry";
connectAttr "L_scapula_vector_Grp_aimConstraint1.crz" "L_scapula_vector_Grp.rz";
connectAttr "L_scapula_vector_Grp.pim" "L_scapula_vector_Grp_aimConstraint1.cpim"
		;
connectAttr "L_scapula_vector_Grp.t" "L_scapula_vector_Grp_aimConstraint1.ct";
connectAttr "L_scapula_vector_Grp.rp" "L_scapula_vector_Grp_aimConstraint1.crp";
connectAttr "L_scapula_vector_Grp.rpt" "L_scapula_vector_Grp_aimConstraint1.crt"
		;
connectAttr "L_scapula_vector_Grp.ro" "L_scapula_vector_Grp_aimConstraint1.cro";
connectAttr "L_shoulder_loc.t" "L_scapula_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "L_shoulder_loc.rp" "L_scapula_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "L_shoulder_loc.rpt" "L_scapula_vector_Grp_aimConstraint1.tg[0].trt"
		;
connectAttr "L_shoulder_loc.pm" "L_scapula_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "L_scapula_vector_Grp_aimConstraint1.w0" "L_scapula_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "L_scapula_loc.wm" "L_scapula_vector_Grp_aimConstraint1.wum";
connectAttr "L_shoulder_vector_Grp_aimConstraint1.crx" "L_shoulder_vector_Grp.rx"
		;
connectAttr "L_shoulder_vector_Grp_aimConstraint1.cry" "L_shoulder_vector_Grp.ry"
		;
connectAttr "L_shoulder_vector_Grp_aimConstraint1.crz" "L_shoulder_vector_Grp.rz"
		;
connectAttr "L_shoulder_vector_Grp.pim" "L_shoulder_vector_Grp_aimConstraint1.cpim"
		;
connectAttr "L_shoulder_vector_Grp.t" "L_shoulder_vector_Grp_aimConstraint1.ct";
connectAttr "L_shoulder_vector_Grp.rp" "L_shoulder_vector_Grp_aimConstraint1.crp"
		;
connectAttr "L_shoulder_vector_Grp.rpt" "L_shoulder_vector_Grp_aimConstraint1.crt"
		;
connectAttr "L_shoulder_vector_Grp.ro" "L_shoulder_vector_Grp_aimConstraint1.cro"
		;
connectAttr "L_elbow_loc.t" "L_shoulder_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "L_elbow_loc.rp" "L_shoulder_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "L_elbow_loc.rpt" "L_shoulder_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "L_elbow_loc.pm" "L_shoulder_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "L_shoulder_vector_Grp_aimConstraint1.w0" "L_shoulder_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "L_shoulder_loc.wm" "L_shoulder_vector_Grp_aimConstraint1.wum";
connectAttr "L_aim_support2_aimConstraint1.crx" "L_aim_support2.rx";
connectAttr "L_aim_support2_aimConstraint1.cry" "L_aim_support2.ry";
connectAttr "L_aim_support2_aimConstraint1.crz" "L_aim_support2.rz";
connectAttr "L_aim_support2.pim" "L_aim_support2_aimConstraint1.cpim";
connectAttr "L_aim_support2.t" "L_aim_support2_aimConstraint1.ct";
connectAttr "L_aim_support2.rp" "L_aim_support2_aimConstraint1.crp";
connectAttr "L_aim_support2.rpt" "L_aim_support2_aimConstraint1.crt";
connectAttr "L_aim_support2.ro" "L_aim_support2_aimConstraint1.cro";
connectAttr "L_wrist_loc.t" "L_aim_support2_aimConstraint1.tg[0].tt";
connectAttr "L_wrist_loc.rp" "L_aim_support2_aimConstraint1.tg[0].trp";
connectAttr "L_wrist_loc.rpt" "L_aim_support2_aimConstraint1.tg[0].trt";
connectAttr "L_wrist_loc.pm" "L_aim_support2_aimConstraint1.tg[0].tpm";
connectAttr "L_aim_support2_aimConstraint1.w0" "L_aim_support2_aimConstraint1.tg[0].tw"
		;
connectAttr "L_elbow_loc.wm" "L_aim_support2_aimConstraint1.wum";
connectAttr "L_aim_support1_aimConstraint1.crx" "L_aim_support1.rx";
connectAttr "L_aim_support1_aimConstraint1.cry" "L_aim_support1.ry";
connectAttr "L_aim_support1_aimConstraint1.crz" "L_aim_support1.rz";
connectAttr "L_aim_support1.pim" "L_aim_support1_aimConstraint1.cpim";
connectAttr "L_aim_support1.t" "L_aim_support1_aimConstraint1.ct";
connectAttr "L_aim_support1.rp" "L_aim_support1_aimConstraint1.crp";
connectAttr "L_aim_support1.rpt" "L_aim_support1_aimConstraint1.crt";
connectAttr "L_aim_support1.ro" "L_aim_support1_aimConstraint1.cro";
connectAttr "L_shoulder_loc.t" "L_aim_support1_aimConstraint1.tg[0].tt";
connectAttr "L_shoulder_loc.rp" "L_aim_support1_aimConstraint1.tg[0].trp";
connectAttr "L_shoulder_loc.rpt" "L_aim_support1_aimConstraint1.tg[0].trt";
connectAttr "L_shoulder_loc.pm" "L_aim_support1_aimConstraint1.tg[0].tpm";
connectAttr "L_aim_support1_aimConstraint1.w0" "L_aim_support1_aimConstraint1.tg[0].tw"
		;
connectAttr "L_elbow_loc.wm" "L_aim_support1_aimConstraint1.wum";
connectAttr "L_shoulderExtra_loc_Grp_parentConstraint1.ctx" "L_shoulderExtra_loc_Grp.tx"
		;
connectAttr "L_shoulderExtra_loc_Grp_parentConstraint1.cty" "L_shoulderExtra_loc_Grp.ty"
		;
connectAttr "L_shoulderExtra_loc_Grp_parentConstraint1.ctz" "L_shoulderExtra_loc_Grp.tz"
		;
connectAttr "L_shoulderExtra_loc_Grp.ro" "L_shoulderExtra_loc_Grp_parentConstraint1.cro"
		;
connectAttr "L_shoulderExtra_loc_Grp.pim" "L_shoulderExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "L_shoulderExtra_loc_Grp.rp" "L_shoulderExtra_loc_Grp_parentConstraint1.crp"
		;
connectAttr "L_shoulderExtra_loc_Grp.rpt" "L_shoulderExtra_loc_Grp_parentConstraint1.crt"
		;
connectAttr "L_aim_support1.t" "L_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "L_aim_support1.rp" "L_shoulderExtra_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "L_aim_support1.rpt" "L_shoulderExtra_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "L_aim_support1.r" "L_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "L_aim_support1.ro" "L_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "L_aim_support1.s" "L_shoulderExtra_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "L_aim_support1.pm" "L_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "L_shoulderExtra_loc_Grp_parentConstraint1.w0" "L_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "L_wristExtra_loc_Grp_parentConstraint1.ctx" "L_wristExtra_loc_Grp.tx"
		;
connectAttr "L_wristExtra_loc_Grp_parentConstraint1.cty" "L_wristExtra_loc_Grp.ty"
		;
connectAttr "L_wristExtra_loc_Grp_parentConstraint1.ctz" "L_wristExtra_loc_Grp.tz"
		;
connectAttr "L_wristExtra_loc_Grp.ro" "L_wristExtra_loc_Grp_parentConstraint1.cro"
		;
connectAttr "L_wristExtra_loc_Grp.pim" "L_wristExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "L_wristExtra_loc_Grp.rp" "L_wristExtra_loc_Grp_parentConstraint1.crp"
		;
connectAttr "L_wristExtra_loc_Grp.rpt" "L_wristExtra_loc_Grp_parentConstraint1.crt"
		;
connectAttr "L_aim_support2.t" "L_wristExtra_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "L_aim_support2.rp" "L_wristExtra_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "L_aim_support2.rpt" "L_wristExtra_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "L_aim_support2.r" "L_wristExtra_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "L_aim_support2.ro" "L_wristExtra_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "L_aim_support2.s" "L_wristExtra_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "L_aim_support2.pm" "L_wristExtra_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "L_wristExtra_loc_Grp_parentConstraint1.w0" "L_wristExtra_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "L_arm_loc_mirror.ro" "L_arm_loc_mirror_parentConstraint1.cro";
connectAttr "L_arm_loc_mirror.pim" "L_arm_loc_mirror_parentConstraint1.cpim";
connectAttr "L_arm_loc_mirror.rp" "L_arm_loc_mirror_parentConstraint1.crp";
connectAttr "L_arm_loc_mirror.rpt" "L_arm_loc_mirror_parentConstraint1.crt";
connectAttr "chest_loc.t" "L_arm_loc_mirror_parentConstraint1.tg[0].tt";
connectAttr "chest_loc.rp" "L_arm_loc_mirror_parentConstraint1.tg[0].trp";
connectAttr "chest_loc.rpt" "L_arm_loc_mirror_parentConstraint1.tg[0].trt";
connectAttr "chest_loc.r" "L_arm_loc_mirror_parentConstraint1.tg[0].tr";
connectAttr "chest_loc.ro" "L_arm_loc_mirror_parentConstraint1.tg[0].tro";
connectAttr "chest_loc.s" "L_arm_loc_mirror_parentConstraint1.tg[0].ts";
connectAttr "chest_loc.pm" "L_arm_loc_mirror_parentConstraint1.tg[0].tpm";
connectAttr "L_arm_loc_mirror_parentConstraint1.w0" "L_arm_loc_mirror_parentConstraint1.tg[0].tw"
		;
connectAttr "L_scapula_locShape.wp" "L_scapula_curveShape.cp[0]";
connectAttr "L_shoulder_locShape.wp" "L_scapula_curveShape.cp[1]";
connectAttr "L_shoulder_locShape.wp" "L_shoulder_curveShape.cp[0]";
connectAttr "L_elbow_locShape.wp" "L_shoulder_curveShape.cp[1]";
connectAttr "L_elbow_locShape.wp" "L_elbow_curveShape.cp[0]";
connectAttr "L_wrist_locShape.wp" "L_elbow_curveShape.cp[1]";
connectAttr "L_wrist_locShape.wp" "L_wrist_curveShape.cp[0]";
connectAttr "L_wristToe_locShape.wp" "L_wrist_curveShape.cp[1]";
connectAttr "L_wristToe_locShape.wp" "L_wristToe_curveShape.cp[0]";
connectAttr "L_wristToeEnd_locShape.wp" "L_wristToe_curveShape.cp[1]";
connectAttr "R_arm_loc_mirror_parentConstraint1.ctx" "R_arm_loc_mirror.tx";
connectAttr "R_arm_loc_mirror_parentConstraint1.cty" "R_arm_loc_mirror.ty";
connectAttr "R_arm_loc_mirror_parentConstraint1.ctz" "R_arm_loc_mirror.tz";
connectAttr "R_arm_loc_mirror_parentConstraint1.crx" "R_arm_loc_mirror.rx";
connectAttr "R_arm_loc_mirror_parentConstraint1.cry" "R_arm_loc_mirror.ry";
connectAttr "R_arm_loc_mirror_parentConstraint1.crz" "R_arm_loc_mirror.rz";
connectAttr "R_scapula_vector_Grp_aimConstraint1.crx" "R_scapula_vector_Grp.rx";
connectAttr "R_scapula_vector_Grp_aimConstraint1.cry" "R_scapula_vector_Grp.ry";
connectAttr "R_scapula_vector_Grp_aimConstraint1.crz" "R_scapula_vector_Grp.rz";
connectAttr "R_scapula_vector_Grp.pim" "R_scapula_vector_Grp_aimConstraint1.cpim"
		;
connectAttr "R_scapula_vector_Grp.t" "R_scapula_vector_Grp_aimConstraint1.ct";
connectAttr "R_scapula_vector_Grp.rp" "R_scapula_vector_Grp_aimConstraint1.crp";
connectAttr "R_scapula_vector_Grp.rpt" "R_scapula_vector_Grp_aimConstraint1.crt"
		;
connectAttr "R_scapula_vector_Grp.ro" "R_scapula_vector_Grp_aimConstraint1.cro";
connectAttr "R_shoulder_loc.t" "R_scapula_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "R_shoulder_loc.rp" "R_scapula_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "R_shoulder_loc.rpt" "R_scapula_vector_Grp_aimConstraint1.tg[0].trt"
		;
connectAttr "R_shoulder_loc.pm" "R_scapula_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "R_scapula_vector_Grp_aimConstraint1.w0" "R_scapula_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "R_scapula_loc.wm" "R_scapula_vector_Grp_aimConstraint1.wum";
connectAttr "R_shoulder_vector_Grp_aimConstraint1.crx" "R_shoulder_vector_Grp.rx"
		;
connectAttr "R_shoulder_vector_Grp_aimConstraint1.cry" "R_shoulder_vector_Grp.ry"
		;
connectAttr "R_shoulder_vector_Grp_aimConstraint1.crz" "R_shoulder_vector_Grp.rz"
		;
connectAttr "R_shoulder_vector_Grp.pim" "R_shoulder_vector_Grp_aimConstraint1.cpim"
		;
connectAttr "R_shoulder_vector_Grp.t" "R_shoulder_vector_Grp_aimConstraint1.ct";
connectAttr "R_shoulder_vector_Grp.rp" "R_shoulder_vector_Grp_aimConstraint1.crp"
		;
connectAttr "R_shoulder_vector_Grp.rpt" "R_shoulder_vector_Grp_aimConstraint1.crt"
		;
connectAttr "R_shoulder_vector_Grp.ro" "R_shoulder_vector_Grp_aimConstraint1.cro"
		;
connectAttr "R_elbow_loc.t" "R_shoulder_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "R_elbow_loc.rp" "R_shoulder_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "R_elbow_loc.rpt" "R_shoulder_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "R_elbow_loc.pm" "R_shoulder_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "R_shoulder_vector_Grp_aimConstraint1.w0" "R_shoulder_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "R_shoulder_loc.wm" "R_shoulder_vector_Grp_aimConstraint1.wum";
connectAttr "R_aim_support2_aimConstraint1.crx" "R_aim_support2.rx";
connectAttr "R_aim_support2_aimConstraint1.cry" "R_aim_support2.ry";
connectAttr "R_aim_support2_aimConstraint1.crz" "R_aim_support2.rz";
connectAttr "R_aim_support2.pim" "R_aim_support2_aimConstraint1.cpim";
connectAttr "R_aim_support2.t" "R_aim_support2_aimConstraint1.ct";
connectAttr "R_aim_support2.rp" "R_aim_support2_aimConstraint1.crp";
connectAttr "R_aim_support2.rpt" "R_aim_support2_aimConstraint1.crt";
connectAttr "R_aim_support2.ro" "R_aim_support2_aimConstraint1.cro";
connectAttr "R_wrist_loc.t" "R_aim_support2_aimConstraint1.tg[0].tt";
connectAttr "R_wrist_loc.rp" "R_aim_support2_aimConstraint1.tg[0].trp";
connectAttr "R_wrist_loc.rpt" "R_aim_support2_aimConstraint1.tg[0].trt";
connectAttr "R_wrist_loc.pm" "R_aim_support2_aimConstraint1.tg[0].tpm";
connectAttr "R_aim_support2_aimConstraint1.w0" "R_aim_support2_aimConstraint1.tg[0].tw"
		;
connectAttr "R_elbow_loc.wm" "R_aim_support2_aimConstraint1.wum";
connectAttr "R_aim_support1_aimConstraint1.crx" "R_aim_support1.rx";
connectAttr "R_aim_support1_aimConstraint1.cry" "R_aim_support1.ry";
connectAttr "R_aim_support1_aimConstraint1.crz" "R_aim_support1.rz";
connectAttr "R_aim_support1.pim" "R_aim_support1_aimConstraint1.cpim";
connectAttr "R_aim_support1.t" "R_aim_support1_aimConstraint1.ct";
connectAttr "R_aim_support1.rp" "R_aim_support1_aimConstraint1.crp";
connectAttr "R_aim_support1.rpt" "R_aim_support1_aimConstraint1.crt";
connectAttr "R_aim_support1.ro" "R_aim_support1_aimConstraint1.cro";
connectAttr "R_shoulder_loc.t" "R_aim_support1_aimConstraint1.tg[0].tt";
connectAttr "R_shoulder_loc.rp" "R_aim_support1_aimConstraint1.tg[0].trp";
connectAttr "R_shoulder_loc.rpt" "R_aim_support1_aimConstraint1.tg[0].trt";
connectAttr "R_shoulder_loc.pm" "R_aim_support1_aimConstraint1.tg[0].tpm";
connectAttr "R_aim_support1_aimConstraint1.w0" "R_aim_support1_aimConstraint1.tg[0].tw"
		;
connectAttr "R_elbow_loc.wm" "R_aim_support1_aimConstraint1.wum";
connectAttr "R_shoulderExtra_loc_Grp_parentConstraint1.ctx" "R_shoulderExtra_loc_Grp.tx"
		;
connectAttr "R_shoulderExtra_loc_Grp_parentConstraint1.cty" "R_shoulderExtra_loc_Grp.ty"
		;
connectAttr "R_shoulderExtra_loc_Grp_parentConstraint1.ctz" "R_shoulderExtra_loc_Grp.tz"
		;
connectAttr "R_shoulderExtra_loc_Grp.ro" "R_shoulderExtra_loc_Grp_parentConstraint1.cro"
		;
connectAttr "R_shoulderExtra_loc_Grp.pim" "R_shoulderExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "R_shoulderExtra_loc_Grp.rp" "R_shoulderExtra_loc_Grp_parentConstraint1.crp"
		;
connectAttr "R_shoulderExtra_loc_Grp.rpt" "R_shoulderExtra_loc_Grp_parentConstraint1.crt"
		;
connectAttr "R_aim_support1.t" "R_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "R_aim_support1.rp" "R_shoulderExtra_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "R_aim_support1.rpt" "R_shoulderExtra_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "R_aim_support1.r" "R_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "R_aim_support1.ro" "R_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "R_aim_support1.s" "R_shoulderExtra_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "R_aim_support1.pm" "R_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "R_shoulderExtra_loc_Grp_parentConstraint1.w0" "R_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "R_wristExtra_loc_Grp_parentConstraint1.ctx" "R_wristExtra_loc_Grp.tx"
		;
connectAttr "R_wristExtra_loc_Grp_parentConstraint1.cty" "R_wristExtra_loc_Grp.ty"
		;
connectAttr "R_wristExtra_loc_Grp_parentConstraint1.ctz" "R_wristExtra_loc_Grp.tz"
		;
connectAttr "R_wristExtra_loc_Grp.ro" "R_wristExtra_loc_Grp_parentConstraint1.cro"
		;
connectAttr "R_wristExtra_loc_Grp.pim" "R_wristExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "R_wristExtra_loc_Grp.rp" "R_wristExtra_loc_Grp_parentConstraint1.crp"
		;
connectAttr "R_wristExtra_loc_Grp.rpt" "R_wristExtra_loc_Grp_parentConstraint1.crt"
		;
connectAttr "R_aim_support2.t" "R_wristExtra_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "R_aim_support2.rp" "R_wristExtra_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "R_aim_support2.rpt" "R_wristExtra_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "R_aim_support2.r" "R_wristExtra_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "R_aim_support2.ro" "R_wristExtra_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "R_aim_support2.s" "R_wristExtra_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "R_aim_support2.pm" "R_wristExtra_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "R_wristExtra_loc_Grp_parentConstraint1.w0" "R_wristExtra_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "R_arm_loc_mirror.ro" "R_arm_loc_mirror_parentConstraint1.cro";
connectAttr "R_arm_loc_mirror.pim" "R_arm_loc_mirror_parentConstraint1.cpim";
connectAttr "R_arm_loc_mirror.rp" "R_arm_loc_mirror_parentConstraint1.crp";
connectAttr "R_arm_loc_mirror.rpt" "R_arm_loc_mirror_parentConstraint1.crt";
connectAttr "chest_loc.t" "R_arm_loc_mirror_parentConstraint1.tg[0].tt";
connectAttr "chest_loc.rp" "R_arm_loc_mirror_parentConstraint1.tg[0].trp";
connectAttr "chest_loc.rpt" "R_arm_loc_mirror_parentConstraint1.tg[0].trt";
connectAttr "chest_loc.r" "R_arm_loc_mirror_parentConstraint1.tg[0].tr";
connectAttr "chest_loc.ro" "R_arm_loc_mirror_parentConstraint1.tg[0].tro";
connectAttr "chest_loc.s" "R_arm_loc_mirror_parentConstraint1.tg[0].ts";
connectAttr "chest_loc.pm" "R_arm_loc_mirror_parentConstraint1.tg[0].tpm";
connectAttr "R_arm_loc_mirror_parentConstraint1.w0" "R_arm_loc_mirror_parentConstraint1.tg[0].tw"
		;
connectAttr "R_scapula_locShape.wp" "R_scapula_curveShape.cp[0]";
connectAttr "R_shoulder_locShape.wp" "R_scapula_curveShape.cp[1]";
connectAttr "R_shoulder_locShape.wp" "R_shoulder_curveShape.cp[0]";
connectAttr "R_elbow_locShape.wp" "R_shoulder_curveShape.cp[1]";
connectAttr "R_elbow_locShape.wp" "R_elbow_curveShape.cp[0]";
connectAttr "R_wrist_locShape.wp" "R_elbow_curveShape.cp[1]";
connectAttr "R_wrist_locShape.wp" "R_wrist_curveShape.cp[0]";
connectAttr "R_wristToe_locShape.wp" "R_wrist_curveShape.cp[1]";
connectAttr "R_wristToe_locShape.wp" "R_wristToe_curveShape.cp[0]";
connectAttr "R_wristToeEnd_locShape.wp" "R_wristToe_curveShape.cp[1]";
connectAttr "jaw_locShape.wp" "jaw_curveShape.cp[0]";
connectAttr "jawEnd_locShape.wp" "jaw_curveShape.cp[1]";
connectAttr "jaw_locShape.wp" "gumA_curveShape.cp[0]";
connectAttr "gumA_locShape.wp" "gumA_curveShape.cp[1]";
connectAttr "jaw_locShape.wp" "gumB_curveShape.cp[0]";
connectAttr "gumB_locShape.wp" "gumB_curveShape.cp[1]";
connectAttr "tongue1_locShape.wp" "tongue_curveShape.cp[0]";
connectAttr "tongueExtra1_locShape.wp" "tongue_curveShape.cp[1]";
connectAttr "tongue2_locShape.wp" "tongue_curveShape.cp[2]";
connectAttr "tongueExtra2_locShape.wp" "tongue_curveShape.cp[3]";
connectAttr "tongue3_locShape.wp" "tongue_curveShape.cp[4]";
connectAttr "tongue1_locShape.wp" "tonguePivot_curveShape.cp[0]";
connectAttr "tonguePivot_locShape.wp" "tonguePivot_curveShape.cp[1]";
connectAttr "L_eye_locShape.wp" "L_eye_curveShape.cp[0]";
connectAttr "L_eyeEnd_locShape.wp" "L_eye_curveShape.cp[1]";
connectAttr "L_eye_locShape.wp" "L_eyeAim_curveShape.cp[0]";
connectAttr "L_eyeAim_locShape.wp" "L_eyeAim_curveShape.cp[1]";
connectAttr "R_eye_locShape.wp" "R_eye_curveShape.cp[0]";
connectAttr "R_eyeEnd_locShape.wp" "R_eye_curveShape.cp[1]";
connectAttr "R_eye_locShape.wp" "R_eyeAim_curveShape.cp[0]";
connectAttr "R_eyeAim_locShape.wp" "R_eyeAim_curveShape.cp[1]";
connectAttr "head_mirror_parentConstraint1.ctx" "head_mirror.tx";
connectAttr "head_mirror_parentConstraint1.cty" "head_mirror.ty";
connectAttr "head_mirror_parentConstraint1.ctz" "head_mirror.tz";
connectAttr "tongueExtra1_loc_Grp_pointConstraint1.ctx" "tongueExtra1_loc_Grp.tx"
		;
connectAttr "tongueExtra1_loc_Grp_pointConstraint1.cty" "tongueExtra1_loc_Grp.ty"
		;
connectAttr "tongueExtra1_loc_Grp_pointConstraint1.ctz" "tongueExtra1_loc_Grp.tz"
		;
connectAttr "tongueExtra1_loc_Grp.pim" "tongueExtra1_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "tongueExtra1_loc_Grp.rp" "tongueExtra1_loc_Grp_pointConstraint1.crp"
		;
connectAttr "tongueExtra1_loc_Grp.rpt" "tongueExtra1_loc_Grp_pointConstraint1.crt"
		;
connectAttr "tongue1_loc.t" "tongueExtra1_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "tongue1_loc.rp" "tongueExtra1_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "tongue1_loc.rpt" "tongueExtra1_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "tongue1_loc.pm" "tongueExtra1_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "tongueExtra1_loc_Grp_pointConstraint1.w0" "tongueExtra1_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "tongue2_loc.t" "tongueExtra1_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "tongue2_loc.rp" "tongueExtra1_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "tongue2_loc.rpt" "tongueExtra1_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "tongue2_loc.pm" "tongueExtra1_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "tongueExtra1_loc_Grp_pointConstraint1.w1" "tongueExtra1_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "tongue2_loc_Grp_pointConstraint1.ctx" "tongue2_loc_Grp.tx";
connectAttr "tongue2_loc_Grp_pointConstraint1.cty" "tongue2_loc_Grp.ty";
connectAttr "tongue2_loc_Grp_pointConstraint1.ctz" "tongue2_loc_Grp.tz";
connectAttr "tongue2_loc_Grp.pim" "tongue2_loc_Grp_pointConstraint1.cpim";
connectAttr "tongue2_loc_Grp.rp" "tongue2_loc_Grp_pointConstraint1.crp";
connectAttr "tongue2_loc_Grp.rpt" "tongue2_loc_Grp_pointConstraint1.crt";
connectAttr "tongue1_loc.t" "tongue2_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "tongue1_loc.rp" "tongue2_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "tongue1_loc.rpt" "tongue2_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "tongue1_loc.pm" "tongue2_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "tongue2_loc_Grp_pointConstraint1.w0" "tongue2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "tongue3_loc.t" "tongue2_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "tongue3_loc.rp" "tongue2_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "tongue3_loc.rpt" "tongue2_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "tongue3_loc.pm" "tongue2_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "tongue2_loc_Grp_pointConstraint1.w1" "tongue2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "tongueExtra2_loc_Grp_pointConstraint1.ctx" "tongueExtra2_loc_Grp.tx"
		;
connectAttr "tongueExtra2_loc_Grp_pointConstraint1.cty" "tongueExtra2_loc_Grp.ty"
		;
connectAttr "tongueExtra2_loc_Grp_pointConstraint1.ctz" "tongueExtra2_loc_Grp.tz"
		;
connectAttr "tongueExtra2_loc_Grp.pim" "tongueExtra2_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "tongueExtra2_loc_Grp.rp" "tongueExtra2_loc_Grp_pointConstraint1.crp"
		;
connectAttr "tongueExtra2_loc_Grp.rpt" "tongueExtra2_loc_Grp_pointConstraint1.crt"
		;
connectAttr "tongue2_loc.t" "tongueExtra2_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "tongue2_loc.rp" "tongueExtra2_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "tongue2_loc.rpt" "tongueExtra2_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "tongue2_loc.pm" "tongueExtra2_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "tongueExtra2_loc_Grp_pointConstraint1.w0" "tongueExtra2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "tongue3_loc.t" "tongueExtra2_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "tongue3_loc.rp" "tongueExtra2_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "tongue3_loc.rpt" "tongueExtra2_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "tongue3_loc.pm" "tongueExtra2_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "tongueExtra2_loc_Grp_pointConstraint1.w1" "tongueExtra2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "L_eyeAim_loc_Grp_parentConstraint1.ctx" "L_eyeAim_loc_Grp.tx";
connectAttr "L_eyeAim_loc_Grp_parentConstraint1.cty" "L_eyeAim_loc_Grp.ty";
connectAttr "L_eyeAim_loc_Grp_parentConstraint1.ctz" "L_eyeAim_loc_Grp.tz";
connectAttr "L_eyeAim_loc_Grp_parentConstraint1.crx" "L_eyeAim_loc_Grp.rx";
connectAttr "L_eyeAim_loc_Grp_parentConstraint1.cry" "L_eyeAim_loc_Grp.ry";
connectAttr "L_eyeAim_loc_Grp_parentConstraint1.crz" "L_eyeAim_loc_Grp.rz";
connectAttr "L_eyeAim_loc_Grp.ro" "L_eyeAim_loc_Grp_parentConstraint1.cro";
connectAttr "L_eyeAim_loc_Grp.pim" "L_eyeAim_loc_Grp_parentConstraint1.cpim";
connectAttr "L_eyeAim_loc_Grp.rp" "L_eyeAim_loc_Grp_parentConstraint1.crp";
connectAttr "L_eyeAim_loc_Grp.rpt" "L_eyeAim_loc_Grp_parentConstraint1.crt";
connectAttr "C_eye_loc.t" "L_eyeAim_loc_Grp_parentConstraint1.tg[0].tt";
connectAttr "C_eye_loc.rp" "L_eyeAim_loc_Grp_parentConstraint1.tg[0].trp";
connectAttr "C_eye_loc.rpt" "L_eyeAim_loc_Grp_parentConstraint1.tg[0].trt";
connectAttr "C_eye_loc.r" "L_eyeAim_loc_Grp_parentConstraint1.tg[0].tr";
connectAttr "C_eye_loc.ro" "L_eyeAim_loc_Grp_parentConstraint1.tg[0].tro";
connectAttr "C_eye_loc.s" "L_eyeAim_loc_Grp_parentConstraint1.tg[0].ts";
connectAttr "C_eye_loc.pm" "L_eyeAim_loc_Grp_parentConstraint1.tg[0].tpm";
connectAttr "L_eyeAim_loc_Grp_parentConstraint1.w0" "L_eyeAim_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "R_eyeAim_loc_Grp_parentConstraint1.ctx" "R_eyeAim_loc_Grp.tx";
connectAttr "R_eyeAim_loc_Grp_parentConstraint1.cty" "R_eyeAim_loc_Grp.ty";
connectAttr "R_eyeAim_loc_Grp_parentConstraint1.ctz" "R_eyeAim_loc_Grp.tz";
connectAttr "R_eyeAim_loc_Grp_parentConstraint1.crx" "R_eyeAim_loc_Grp.rx";
connectAttr "R_eyeAim_loc_Grp_parentConstraint1.cry" "R_eyeAim_loc_Grp.ry";
connectAttr "R_eyeAim_loc_Grp_parentConstraint1.crz" "R_eyeAim_loc_Grp.rz";
connectAttr "R_eyeAim_loc_Grp.ro" "R_eyeAim_loc_Grp_parentConstraint1.cro";
connectAttr "R_eyeAim_loc_Grp.pim" "R_eyeAim_loc_Grp_parentConstraint1.cpim";
connectAttr "R_eyeAim_loc_Grp.rp" "R_eyeAim_loc_Grp_parentConstraint1.crp";
connectAttr "R_eyeAim_loc_Grp.rpt" "R_eyeAim_loc_Grp_parentConstraint1.crt";
connectAttr "C_eye_loc.t" "R_eyeAim_loc_Grp_parentConstraint1.tg[0].tt";
connectAttr "C_eye_loc.rp" "R_eyeAim_loc_Grp_parentConstraint1.tg[0].trp";
connectAttr "C_eye_loc.rpt" "R_eyeAim_loc_Grp_parentConstraint1.tg[0].trt";
connectAttr "C_eye_loc.r" "R_eyeAim_loc_Grp_parentConstraint1.tg[0].tr";
connectAttr "C_eye_loc.ro" "R_eyeAim_loc_Grp_parentConstraint1.tg[0].tro";
connectAttr "C_eye_loc.s" "R_eyeAim_loc_Grp_parentConstraint1.tg[0].ts";
connectAttr "C_eye_loc.pm" "R_eyeAim_loc_Grp_parentConstraint1.tg[0].tpm";
connectAttr "R_eyeAim_loc_Grp_parentConstraint1.w0" "R_eyeAim_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "head_mirror.ro" "head_mirror_parentConstraint1.cro";
connectAttr "head_mirror.pim" "head_mirror_parentConstraint1.cpim";
connectAttr "head_mirror.rp" "head_mirror_parentConstraint1.crp";
connectAttr "head_mirror.rpt" "head_mirror_parentConstraint1.crt";
connectAttr "neckRoot_loc.t" "head_mirror_parentConstraint1.tg[0].tt";
connectAttr "neckRoot_loc.rp" "head_mirror_parentConstraint1.tg[0].trp";
connectAttr "neckRoot_loc.rpt" "head_mirror_parentConstraint1.tg[0].trt";
connectAttr "neckRoot_loc.r" "head_mirror_parentConstraint1.tg[0].tr";
connectAttr "neckRoot_loc.ro" "head_mirror_parentConstraint1.tg[0].tro";
connectAttr "neckRoot_loc.s" "head_mirror_parentConstraint1.tg[0].ts";
connectAttr "neckRoot_loc.pm" "head_mirror_parentConstraint1.tg[0].tpm";
connectAttr "head_mirror_parentConstraint1.w0" "head_mirror_parentConstraint1.tg[0].tw"
		;
connectAttr "tail1_locShape.wp" "tail_CrvShape.cp[0]";
connectAttr "tailExtra1_locShape.wp" "tail_CrvShape.cp[1]";
connectAttr "tail2_locShape.wp" "tail_CrvShape.cp[2]";
connectAttr "tail3_locShape.wp" "tail_CrvShape.cp[3]";
connectAttr "tailEndExtra_locShape.wp" "tail_CrvShape.cp[4]";
connectAttr "tailEnd_locShape.wp" "tail_CrvShape.cp[5]";
connectAttr "tail_mirror_parentConstraint1.ctx" "tail_mirror.tx";
connectAttr "tail_mirror_parentConstraint1.cty" "tail_mirror.ty";
connectAttr "tail_mirror_parentConstraint1.ctz" "tail_mirror.tz";
connectAttr "tail_mirror_parentConstraint1.crx" "tail_mirror.rx";
connectAttr "tail_mirror_parentConstraint1.cry" "tail_mirror.ry";
connectAttr "tail_mirror_parentConstraint1.crz" "tail_mirror.rz";
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.ctx" "tail3_loc_Grp.tx"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.cty" "tail3_loc_Grp.ty"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.ctz" "tail3_loc_Grp.tz"
		;
connectAttr "tail3_loc_Grp.pim" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "tail3_loc_Grp.rp" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.crp"
		;
connectAttr "tail3_loc_Grp.rpt" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.crt"
		;
connectAttr "tail1_loc.t" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "tail1_loc.rp" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "tail1_loc.rpt" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "tail1_loc.pm" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.w0" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "tailEnd_loc.t" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "tailEnd_loc.rp" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "tailEnd_loc.rpt" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "tailEnd_loc.pm" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.w1" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail3_loc_Grp|splne2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.ctx" "tail2_loc_Grp.tx"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.cty" "tail2_loc_Grp.ty"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.ctz" "tail2_loc_Grp.tz"
		;
connectAttr "tail2_loc_Grp.pim" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "tail2_loc_Grp.rp" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.crp"
		;
connectAttr "tail2_loc_Grp.rpt" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.crt"
		;
connectAttr "tail1_loc.t" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "tail1_loc.rp" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "tail1_loc.rpt" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "tail1_loc.pm" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.w0" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "tailEnd_loc.t" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "tailEnd_loc.rp" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "tailEnd_loc.rpt" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "tailEnd_loc.pm" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.w1" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tail2_loc_Grp|splne1_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.ctx" "tailEndExtra_loc_Grp.tx"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.cty" "tailEndExtra_loc_Grp.ty"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.ctz" "tailEndExtra_loc_Grp.tz"
		;
connectAttr "tailEndExtra_loc_Grp.pim" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "tailEndExtra_loc_Grp.rp" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.crp"
		;
connectAttr "tailEndExtra_loc_Grp.rpt" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.crt"
		;
connectAttr "tail3_loc.t" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "tail3_loc.rp" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "tail3_loc.rpt" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "tail3_loc.pm" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.w0" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "tailEnd_loc.t" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "tailEnd_loc.rp" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "tailEnd_loc.rpt" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "tailEnd_loc.pm" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.w1" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailEndExtra_loc_Grp|chestExtra_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.ctx" "tailExtra1_loc_Grp.tx"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.cty" "tailExtra1_loc_Grp.ty"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.ctz" "tailExtra1_loc_Grp.tz"
		;
connectAttr "tailExtra1_loc_Grp.pim" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "tailExtra1_loc_Grp.rp" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.crp"
		;
connectAttr "tailExtra1_loc_Grp.rpt" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.crt"
		;
connectAttr "tail1_loc.t" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "tail1_loc.rp" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "tail1_loc.rpt" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "tail1_loc.pm" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.w0" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "tail2_loc.t" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "tail2_loc.rp" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "tail2_loc.rpt" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "tail2_loc.pm" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.w1" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|tailExtra1_loc_Grp|rootExtra_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.crx" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp.rx"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.cry" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp.ry"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.crz" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp.rz"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp.pim" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.cpim"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp.t" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.ct"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp.rp" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.crp"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp.rpt" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.crt"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp.ro" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.cro"
		;
connectAttr "tailExtra1_loc.t" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.tg[0].tt"
		;
connectAttr "tailExtra1_loc.rp" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.tg[0].trp"
		;
connectAttr "tailExtra1_loc.rpt" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.tg[0].trt"
		;
connectAttr "tailExtra1_loc.pm" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.tg[0].tpm"
		;
connectAttr "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.w0" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "tail1_loc.wm" "|tail_mirror|tailRoot_loc_Grp|tailRoot_loc|tail1_loc_Grp|tail1_loc|root_vector_Grp|root_vector_Grp_aimConstraint1.wum"
		;
connectAttr "tail_mirror.ro" "tail_mirror_parentConstraint1.cro";
connectAttr "tail_mirror.pim" "tail_mirror_parentConstraint1.cpim";
connectAttr "tail_mirror.rp" "tail_mirror_parentConstraint1.crp";
connectAttr "tail_mirror.rpt" "tail_mirror_parentConstraint1.crt";
connectAttr "root_loc.t" "tail_mirror_parentConstraint1.tg[0].tt";
connectAttr "root_loc.rp" "tail_mirror_parentConstraint1.tg[0].trp";
connectAttr "root_loc.rpt" "tail_mirror_parentConstraint1.tg[0].trt";
connectAttr "root_loc.r" "tail_mirror_parentConstraint1.tg[0].tr";
connectAttr "root_loc.ro" "tail_mirror_parentConstraint1.tg[0].tro";
connectAttr "root_loc.s" "tail_mirror_parentConstraint1.tg[0].ts";
connectAttr "root_loc.pm" "tail_mirror_parentConstraint1.tg[0].tpm";
connectAttr "tail_mirror_parentConstraint1.w0" "tail_mirror_parentConstraint1.tg[0].tw"
		;
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
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
// End of guide_quad.ma
