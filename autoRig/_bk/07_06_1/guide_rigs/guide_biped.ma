//Maya ASCII 2022 scene
//Name: guide_biped.ma
//Last modified: Mon, Jul 06, 2026 06:39:58 PM
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
fileInfo "UUID" "363F7050-4484-8200-42AA-42A9983DA12F";
createNode transform -s -n "persp";
	rename -uid "E98F2045-41CF-383A-1CE8-38B73E6C7918";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 21.459152038725154 64.087773444078252 43.14269434622171 ;
	setAttr ".r" -type "double3" -25.538352729760422 26.999999999993275 -8.9240499230927173e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "2AC9D49C-4FB1-6C91-B00F-20B93A1B746F";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 61.048909145992134;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 4 12 2 ;
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
	setAttr ".t" -type "double3" 1000.1 48.694751617506839 1.8432548303335334 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "296BF61A-4FA3-3103-C3AE-D1B4098E2382";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 35.585888701322489;
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
	setAttr ".rig_type" -type "string" "biped";
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
	setAttr ".rig_type" -type "string" "biped";
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
		0 45 0
		0 46 0
		0 48 0
		0 50 0
		0 51 0
		;
	setAttr ".rig_type" -type "string" "biped";
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
	setAttr ".rig_type" -type "string" "biped";
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
		0 22 0
		0 24.44444465637207 0
		0 29.348000000000003 0
		-0.07342204270015884 36.651999999999504 0
		-0.024449540219152896 41.555557250976399 0
		0 44 0
		;
	setAttr ".rig_type" -type "string" "biped";
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
	setAttr ".t" -type "double3" 0 22 0 ;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "biped";
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
	setAttr ".rig_type" -type "string" "biped";
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
	setAttr ".rig_type" -type "string" "biped";
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
	setAttr ".rig_type" -type "string" "biped";
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
	addAttr -ci true -k true -sn "insertJnt" -ln "insertJnt" -min 0 -at "long";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 16;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "neckRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "neck_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "C";
	setAttr -k on ".insertJnt" 4;
	setAttr ".rig_attachBoneType" -type "string" "root_type";
	setAttr ".rig_attachSide" -type "string" "C";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "chest";
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
	setAttr ".rig_type" -type "string" "biped";
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
	setAttr ".rig_type" -type "string" "biped";
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
	setAttr ".rig_type" -type "string" "biped";
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
	rename -uid "9A63040F-4437-7029-44BB-A9917DB3F32C";
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
	setAttr ".rst" -type "double3" 0 6 0 ;
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
	setAttr ".rig_type" -type "string" "biped";
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
	setAttr ".rig_type" -type "string" "biped";
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
createNode pointConstraint -n "neckRoot_loc_Grp_pointConstraint1" -p "neckRoot_loc_Grp";
	rename -uid "33503C85-4127-DDAD-912E-61BF2DBCAE58";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_chest_locW0" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" 0 1 0 ;
	setAttr ".rst" -type "double3" 0 23 0 ;
	setAttr -k on ".w0";
createNode transform -n "chest_loc_Grp" -p "root_loc";
	rename -uid "8DC482D6-4DE0-5B1C-8914-2EBB6C8B331B";
	setAttr ".t" -type "double3" 0 22 0 ;
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
	setAttr ".rig_type" -type "string" "biped";
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
	setAttr ".rig_type" -type "string" "biped";
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
	setAttr ".rig_type" -type "string" "biped";
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
	setAttr ".rig_type" -type "string" "biped";
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
		-1.6653345369377348e-16 0 0.49999999999999983
		-1.6653345369377348e-16 0.5 -3.6977854932234928e-32
		1.6653345369377348e-16 0 -0.49999999999999983
		3.3306690738754696e-16 0 -0.99999999999999967
		-3.3306690738754696e-16 1 -7.3955709864469857e-32
		-3.3306690738754696e-16 0 0.99999999999999967
		-1.6653345369377348e-16 0 0.49999999999999983
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
	setAttr ".a" -type "double3" 0 1 0 ;
	setAttr ".u" -type "double3" 0 0 1 ;
	setAttr ".wu" -type "double3" 0 0 1 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0 0 45.000000000000007 ;
	setAttr -k on ".w0";
createNode transform -n "L_leg_nonParent";
	rename -uid "8B8259FE-460D-8302-3775-FEB4FB861AD8";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_hip_Crv" -p "L_leg_nonParent";
	rename -uid "A0D91D72-481E-4A16-9A03-25AF304F8339";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_hip_CrvShape" -p "L_hip_Crv";
	rename -uid "9E2E0A4A-4F0A-2355-451D-14B18537AE7E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		4 22 0
		4 12 1
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_knee_Crv" -p "L_leg_nonParent";
	rename -uid "2DC98F94-4896-E72E-CF8A-BD906AB80E47";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_knee_CrvShape" -p "L_knee_Crv";
	rename -uid "956ADA49-44BD-858C-579D-A28480A676D1";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		4 12 1
		4 3 0
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_ankle_Crv" -p "L_leg_nonParent";
	rename -uid "FBBF48CA-4EB1-631C-306D-DDAC1338917F";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_ankle_CrvShape" -p "L_ankle_Crv";
	rename -uid "F02248AB-4C72-4FAF-0F41-F883B8759C3C";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		4 3 0
		4 2 3
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_toe_Crv" -p "L_leg_nonParent";
	rename -uid "8BFFB799-48C8-6A5C-7A91-19B856D15432";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_toe_CrvShape" -p "L_toe_Crv";
	rename -uid "B45EC5A4-40A0-347C-C3AE-EC9777B881BC";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		4 2 3
		4 2 6
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_hip_mirror";
	rename -uid "34FB0C22-496E-7763-65F0-BCBDEFFC2FF1";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_attachBoneType" -type "string" "root_type";
	setAttr ".rig_attachSide" -type "string" "C";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "root";
createNode transform -n "L_hip_loc_Grp" -p "L_hip_mirror";
	rename -uid "95A58BFE-4845-9701-179B-73A69D526FC3";
createNode transform -n "L_hip_loc" -p "L_hip_loc_Grp";
	rename -uid "DD502774-4ADF-2B2F-8391-148912788FA2";
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
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "L";
	setAttr -k on ".insertJnt" 2;
createNode locator -n "L_hip_locShape" -p "L_hip_loc";
	rename -uid "C07DC688-48F9-8F0A-6117-BA8AF1080A83";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_knee_loc_Grp" -p "L_hip_loc";
	rename -uid "B17C8FCC-461B-C5FD-429C-0D9C11432486";
	setAttr ".t" -type "double3" 0 -10 1 ;
createNode transform -n "L_knee_loc" -p "L_knee_loc_Grp";
	rename -uid "DFB00EE4-41AF-E333-2D2A-F8BA66B4D100";
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
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "L";
	setAttr -k on ".insertJnt" 2;
createNode locator -n "L_knee_locShape" -p "L_knee_loc";
	rename -uid "E22A608E-4D17-9AF2-3334-17BA1A32D323";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_hipExtra_loc_Grp" -p "L_knee_loc";
	rename -uid "9B7FB5D2-4BB7-3E8F-67D3-3F821E427F34";
createNode transform -n "L_hipExtra_loc" -p "L_hipExtra_loc_Grp";
	rename -uid "6FCA6A51-4F8F-31DA-3F47-4584C6B1C6B9";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_hipExtra_locShape" -p "L_hipExtra_loc";
	rename -uid "B77EC96D-4268-4107-AEE4-21AB3D263EBB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_hipExtra_loc_Grp_parentConstraint1" -p "L_hipExtra_loc_Grp";
	rename -uid "35546775-4031-FC2F-DE47-5080C6BB703D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_aim_support1W0" -dv 1 -min 
		0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0 2.1416185444889582 0.9950371902099886 ;
	setAttr ".tg[0].tor" -type "double3" 5.7105931374996324 0 0 ;
	setAttr ".lr" -type "double3" -7.9513867036587919e-16 0 0 ;
	setAttr ".rst" -type "double3" 0 2.2299999999999986 0.77699999999999991 ;
	setAttr ".rsrr" -type "double3" -7.9513867036587919e-16 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_ankleExtra_loc_Grp" -p "L_knee_loc";
	rename -uid "C28F6763-4132-7F5D-E16A-ECA2F4FD3156";
createNode transform -n "L_ankleExtra_loc" -p "L_ankleExtra_loc_Grp";
	rename -uid "5D456B00-4A8D-FC62-18E7-24AA463567E3";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_ankleExtra_locShape" -p "L_ankleExtra_loc";
	rename -uid "6F75E06E-42FD-2359-30D2-8D983E222486";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_ankleExtra_loc_Grp_parentConstraint1" -p "L_ankleExtra_loc_Grp";
	rename -uid "F125B396-41A2-89B2-54AA-03B5BF3ED9E1";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_aim_support2W0" -dv 1 -min 
		0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0 -1.9089193597297989 0.9938837346736189 ;
	setAttr ".tg[0].tor" -type "double3" -6.3401917459099115 0 0 ;
	setAttr ".lr" -type "double3" -1.5902773407317584e-15 0 0 ;
	setAttr ".rst" -type "double3" 0 -2.0070000000000014 0.77699999999999969 ;
	setAttr ".rsrr" -type "double3" -1.5902773407317584e-15 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_kneeExtra_loc_Grp" -p "L_knee_loc";
	rename -uid "4552C42E-49B4-E07C-0248-37A2F02A5E75";
	setAttr ".t" -type "double3" 0 0 1 ;
createNode transform -n "L_kneeExtra_loc" -p "L_kneeExtra_loc_Grp";
	rename -uid "81A9C0ED-4806-500C-E359-A793A1180931";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_attachBoneType" -type "string" "leg_type";
	setAttr ".rig_attachSide" -type "string" "L";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "knee";
createNode locator -n "L_kneeExtra_locShape" -p "L_kneeExtra_loc";
	rename -uid "E22A4F3D-4CE3-F525-D10A-E283EE8828F0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_aim_support2" -p "L_knee_loc";
	rename -uid "45B512E9-4251-2BF6-4FD3-C3AF260F1290";
	setAttr ".v" no;
createNode aimConstraint -n "L_aim_support2_aimConstraint1" -p "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2";
	rename -uid "B19ECEB3-43DA-713F-EAB7-0FB22DD6D3A8";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_ankle_locW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 6.3401917459099097 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_aim_support1" -p "L_knee_loc";
	rename -uid "D921F99E-414D-90E2-27A1-7FAE5CE0A1B4";
	setAttr ".v" no;
createNode aimConstraint -n "L_aim_support1_aimConstraint1" -p "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1";
	rename -uid "D556FC02-462D-7CC3-B93C-3AB9426CBA45";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_hip_locW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -5.7105931374996333 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_ankle_loc_Grp" -p "L_hip_loc";
	rename -uid "ADF31D4B-462B-EF42-5EC5-DCBF93B9620F";
	setAttr ".t" -type "double3" 0 -19 0 ;
createNode transform -n "L_ankle_loc" -p "L_ankle_loc_Grp";
	rename -uid "8D872262-4D61-4007-F03D-BB9F2C1180AF";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_ankle_locShape" -p "L_ankle_loc";
	rename -uid "17CEA37E-46D5-A345-A4C2-E5B70D87995A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_toeEnd_loc_Grp" -p "L_ankle_loc";
	rename -uid "E0FE3151-438E-BAED-78A9-6D88F0AB5CE6";
	setAttr ".t" -type "double3" 0 -1 6 ;
createNode transform -n "L_toeEnd_loc" -p "L_toeEnd_loc_Grp";
	rename -uid "B5EECF47-4E5B-40D1-094D-36A2BC135405";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "4";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_toeEnd_locShape" -p "L_toeEnd_loc";
	rename -uid "DCF50EBB-4C34-797C-E80D-5B8C3FED144A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_toe_loc_Grp" -p "L_ankle_loc";
	rename -uid "9A9C9913-4387-052F-B6BD-B6BCD63C89C3";
	setAttr ".t" -type "double3" 0 -1 3 ;
createNode transform -n "L_toe_loc" -p "L_toe_loc_Grp";
	rename -uid "3814EF15-4F45-FF83-E515-08B5BE03EA2D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "3";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_toe_locShape" -p "L_toe_loc";
	rename -uid "56960E7C-45AC-8F49-B508-759BE0D31C3E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_heelExtra_loc_Grp" -p "L_ankle_loc";
	rename -uid "2EE5B59F-4B45-4A7A-DEC3-B0B14E4542DD";
	setAttr ".t" -type "double3" 0 -3 -1 ;
createNode transform -n "L_heelExtra_loc" -p "L_heelExtra_loc_Grp";
	rename -uid "2D795246-4A4A-5060-8435-189242A1BAF6";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "heel";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_heelExtra_locShape" -p "L_heelExtra_loc";
	rename -uid "0F855E88-4DBD-ECFE-DC1F-A9B6B069DD95";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_toeEndExtra_loc_Grp" -p "L_ankle_loc";
	rename -uid "16259A6A-4E7E-DE7D-96CF-C18147E7D467";
	setAttr ".t" -type "double3" 0 -3 6 ;
createNode transform -n "L_toeEndExtra_loc" -p "L_toeEndExtra_loc_Grp";
	rename -uid "E0F4744D-4478-05DA-BB5B-4ABDEAB9A0DA";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_toeEndExtra_locShape" -p "L_toeEndExtra_loc";
	rename -uid "060D41E1-4CC2-44E8-7BE2-35B3E462617F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_bankRight_loc_Grp" -p "L_ankle_loc";
	rename -uid "0128C107-4586-C9E4-D3B3-23ABFF98B089";
	setAttr ".t" -type "double3" -2 -3 3 ;
createNode transform -n "L_bankRight_loc" -p "L_bankRight_loc_Grp";
	rename -uid "8F08BCC4-4CDD-C222-684F-008DC6A93093";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "bankRight";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_bankRight_locShape" -p "L_bankRight_loc";
	rename -uid "4B9379F7-47E8-0955-4437-ACB4BCD30971";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_bankLeft_loc_Grp" -p "L_ankle_loc";
	rename -uid "99E519C0-4625-F274-5295-D2A83FDE6F4C";
	setAttr ".t" -type "double3" 2 -3 3 ;
createNode transform -n "L_bankLeft_loc" -p "L_bankLeft_loc_Grp";
	rename -uid "6EC444E0-45A0-40C7-801E-028A07564119";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "bankLeft";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_bankLeft_locShape" -p "L_bankLeft_loc";
	rename -uid "EEC90545-484D-BD3C-88F9-67A971391AD5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_toeExtra_loc_Grp" -p "L_ankle_loc";
	rename -uid "27AA2A4A-425B-BA70-BB3E-FDADB71CD7E3";
	setAttr ".t" -type "double3" 0 -3 3 ;
createNode transform -n "L_toeExtra_loc" -p "L_toeExtra_loc_Grp";
	rename -uid "71AD19EC-4713-A3EA-5BC5-359C9E97CD71";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_toeExtra_locShape" -p "L_toeExtra_loc";
	rename -uid "F218DE78-45F1-8BAD-3658-239DFBFFEFD6";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_hip_vector_Grp" -p "L_hip_loc";
	rename -uid "CEDD8413-4003-818F-87A3-53838130D62E";
createNode transform -n "L_hip_vector" -p "L_hip_vector_Grp";
	rename -uid "45D62C16-4D39-3C3B-805D-37998DFBC8E0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_hip_vectorShape" -p "L_hip_vector";
	rename -uid "6664A746-40A5-1ECC-E816-568459169A21";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		1.3877787807814457e-16 3.0531133177191805e-16 0.5
		-1.3877787807814447e-16 -0.5 3.0531133177191815e-16
		-1.3877787807814457e-16 -3.0531133177191805e-16 -0.5
		-2.7755575615628914e-16 -6.106226635438361e-16 -1
		-2.7755575615628894e-16 -1 6.1062266354383629e-16
		2.7755575615628914e-16 6.106226635438361e-16 1
		1.3877787807814457e-16 3.0531133177191805e-16 0.5
		;
createNode aimConstraint -n "L_hip_vector_Grp_aimConstraint1" -p "L_hip_vector_Grp";
	rename -uid "19CA3F08-49D9-0B58-D919-E19DAE4CAF3F";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_knee_locW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -5.7105931374996333 0 0 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "L_hip_mirror_parentConstraint1" -p "L_hip_mirror";
	rename -uid "76FEB741-447E-B585-419C-71811BC11943";
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
	setAttr ".tg[0].tot" -type "double3" 4 0 0 ;
	setAttr ".rst" -type "double3" 4 22 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_leg_nonParent";
	rename -uid "63944679-4D09-FD33-6F7E-F1907E8ABE05";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_hip_Crv" -p "R_leg_nonParent";
	rename -uid "9428507F-4AC7-BDF6-E876-14B41A00F9EF";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_hip_CrvShape" -p "R_hip_Crv";
	rename -uid "A3B6FD97-48C1-C341-8E23-A4B1544A1C14";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-4 22 0
		-4 12 1
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_knee_Crv" -p "R_leg_nonParent";
	rename -uid "27F65395-4C82-3423-D146-AAB9E33D838E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_knee_CrvShape" -p "R_knee_Crv";
	rename -uid "4346EB8A-41C5-7883-1B0E-72BBBF9B0CF8";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-4 12 1
		-4 3 0
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_ankle_Crv" -p "R_leg_nonParent";
	rename -uid "0387A4ED-478A-E07B-6F63-508637860DBB";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_ankle_CrvShape" -p "R_ankle_Crv";
	rename -uid "1B9C56B0-483E-C88E-EF07-838EEEBE8850";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-4 3 0
		-4 2 3
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_toe_Crv" -p "R_leg_nonParent";
	rename -uid "B9B13239-402F-F86A-CBA4-33B5377E428D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_toe_CrvShape" -p "R_toe_Crv";
	rename -uid "1EDB6D1C-4E13-5C83-7E72-C39F4408DB2D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-4 2 3
		-4 2 6
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_hip_mirror";
	rename -uid "C97A85DD-482E-28DD-086C-25B3307E1F48";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".s" -type "double3" -1 1 1 ;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_attachBoneType" -type "string" "root_type";
	setAttr ".rig_attachSide" -type "string" "C";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "root";
createNode transform -n "R_hip_loc_Grp" -p "R_hip_mirror";
	rename -uid "DDDC5775-4E78-7B56-C7FF-9D994A77200B";
createNode transform -n "R_hip_loc" -p "R_hip_loc_Grp";
	rename -uid "5ECF5558-48E6-A36F-D076-7EB5F426F131";
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
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "R";
	setAttr -k on ".insertJnt" 2;
createNode locator -n "R_hip_locShape" -p "R_hip_loc";
	rename -uid "A880862F-4B89-B9CC-743A-A0A5FA092A1E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_knee_loc_Grp" -p "R_hip_loc";
	rename -uid "77E3B0B6-4CD4-C448-5AA2-5D8B5406894A";
	setAttr ".t" -type "double3" 0 -10 1 ;
createNode transform -n "R_knee_loc" -p "R_knee_loc_Grp";
	rename -uid "F1CC7335-4C6B-3FCE-3F74-21ADA2798D52";
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
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "R";
	setAttr -k on ".insertJnt" 2;
createNode locator -n "R_knee_locShape" -p "R_knee_loc";
	rename -uid "EF7578B6-495F-EF95-6E23-BE913C39CC09";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_hipExtra_loc_Grp" -p "R_knee_loc";
	rename -uid "D1A1A515-4211-39DD-1F89-DEA36CF7B5C3";
createNode transform -n "R_hipExtra_loc" -p "R_hipExtra_loc_Grp";
	rename -uid "DD983EE6-4987-1BFB-E015-3E901A145721";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_hipExtra_locShape" -p "R_hipExtra_loc";
	rename -uid "30BCDAEC-4860-8F4F-F905-52BB3C9FF90D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_hipExtra_loc_Grp_parentConstraint1" -p "R_hipExtra_loc_Grp";
	rename -uid "CF7E7642-464F-9451-D6E0-FDA41C92B5E2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_aim_support1W0" -dv 1 -min 
		0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0 2.1416185444889582 0.9950371902099886 ;
	setAttr ".tg[0].tor" -type "double3" 5.7105931374996324 0 0 ;
	setAttr ".lr" -type "double3" -7.9513867036587919e-16 0 0 ;
	setAttr ".rst" -type "double3" 0 2.2299999999999986 0.77699999999999991 ;
	setAttr ".rsrr" -type "double3" -7.9513867036587919e-16 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_ankleExtra_loc_Grp" -p "R_knee_loc";
	rename -uid "08D2471B-4B7E-E2EE-37CC-EBBD038AB883";
createNode transform -n "R_ankleExtra_loc" -p "R_ankleExtra_loc_Grp";
	rename -uid "FFD9F896-43D3-E1AC-4A2E-C093FB053EDF";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_ankleExtra_locShape" -p "R_ankleExtra_loc";
	rename -uid "3DF6D69A-4DFD-666F-1712-08A27FB94FD7";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_ankleExtra_loc_Grp_parentConstraint1" -p "R_ankleExtra_loc_Grp";
	rename -uid "349F35EA-4538-49FE-E60B-7781B544C1EC";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_aim_support2W0" -dv 1 -min 
		0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0 -1.9089193597297989 0.9938837346736189 ;
	setAttr ".tg[0].tor" -type "double3" -6.3401917459099115 0 0 ;
	setAttr ".lr" -type "double3" -1.5902773407317584e-15 0 0 ;
	setAttr ".rst" -type "double3" 0 -2.0070000000000014 0.77699999999999969 ;
	setAttr ".rsrr" -type "double3" -1.5902773407317584e-15 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_kneeExtra_loc_Grp" -p "R_knee_loc";
	rename -uid "39E42EC3-4CF6-E75B-CC19-40A774DA7520";
	setAttr ".t" -type "double3" 0 0 1 ;
createNode transform -n "R_kneeExtra_loc" -p "R_kneeExtra_loc_Grp";
	rename -uid "0991B684-4EC9-C21F-A5F3-A2BD564D282C";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_attachBoneType" -type "string" "leg_type";
	setAttr ".rig_attachSide" -type "string" "R";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "knee";
createNode locator -n "R_kneeExtra_locShape" -p "R_kneeExtra_loc";
	rename -uid "5928DA51-42D7-F677-75C9-048B75CD5494";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_aim_support2" -p "R_knee_loc";
	rename -uid "CA120C5E-470F-EBA3-B291-C7A3480ACE9A";
	setAttr ".v" no;
createNode aimConstraint -n "R_aim_support2_aimConstraint1" -p "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2";
	rename -uid "AFE2B6B5-4BE7-0EC8-08D0-35A8AA9EFAE0";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_ankle_locW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" 6.3401917459099097 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_aim_support1" -p "R_knee_loc";
	rename -uid "813BFEB3-444D-1F1E-251B-A68A529BDA73";
	setAttr ".v" no;
createNode aimConstraint -n "R_aim_support1_aimConstraint1" -p "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1";
	rename -uid "DBE8ADDE-4F21-E59C-4829-2C82462B9C06";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_hip_locW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -5.7105931374996333 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_ankle_loc_Grp" -p "R_hip_loc";
	rename -uid "4DD626BD-49C4-C81B-EAA7-70A1DA866AE1";
	setAttr ".t" -type "double3" 0 -19 0 ;
createNode transform -n "R_ankle_loc" -p "R_ankle_loc_Grp";
	rename -uid "F0AC54A3-43B1-4289-232C-1FBECC5069A4";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_ankle_locShape" -p "R_ankle_loc";
	rename -uid "F024FCDC-4473-0BDF-2E70-FEAD3D25C65A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_toeEnd_loc_Grp" -p "R_ankle_loc";
	rename -uid "D89BF7C1-4632-F905-AAFB-2C824356DAB5";
	setAttr ".t" -type "double3" 0 -1 6 ;
createNode transform -n "R_toeEnd_loc" -p "R_toeEnd_loc_Grp";
	rename -uid "767AE4B7-4EA8-16C7-00F9-B2A43E2AE085";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "4";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_toeEnd_locShape" -p "R_toeEnd_loc";
	rename -uid "000DEA2A-4347-8277-6CA1-BC8A2461DD28";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_toe_loc_Grp" -p "R_ankle_loc";
	rename -uid "5BCBB436-48A6-FAB7-4C21-1EA54BF729EA";
	setAttr ".t" -type "double3" 0 -1 3 ;
createNode transform -n "R_toe_loc" -p "R_toe_loc_Grp";
	rename -uid "7C8AA6E7-4A61-094C-308A-D7A410B3CBA3";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_index" -type "string" "3";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_toe_locShape" -p "R_toe_loc";
	rename -uid "AB42DFA0-46AA-9F91-CA12-E9A2AEE9D300";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_heelExtra_loc_Grp" -p "R_ankle_loc";
	rename -uid "01D95099-47A5-099A-3F2F-A89D7924283E";
	setAttr ".t" -type "double3" 0 -3 -1 ;
createNode transform -n "R_heelExtra_loc" -p "R_heelExtra_loc_Grp";
	rename -uid "94B4DAB5-4CD0-7F36-D3A1-9EB80F538C2D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "heel";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_heelExtra_locShape" -p "R_heelExtra_loc";
	rename -uid "50046DC2-4158-6173-8967-C78CAC0E9E4B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_toeEndExtra_loc_Grp" -p "R_ankle_loc";
	rename -uid "B671773E-4CA4-3EAC-9B9B-BDB9C4548B15";
	setAttr ".t" -type "double3" 0 -3 6 ;
createNode transform -n "R_toeEndExtra_loc" -p "R_toeEndExtra_loc_Grp";
	rename -uid "DB14AA45-45AC-B04D-234E-C897E90C7C9C";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_toeEndExtra_locShape" -p "R_toeEndExtra_loc";
	rename -uid "B9BF462D-442F-93EF-BC60-5E9D0388E81C";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_bankRight_loc_Grp" -p "R_ankle_loc";
	rename -uid "2076C0A7-4EEB-D0F5-AFCB-369486BDA526";
	setAttr ".t" -type "double3" -2 -3 3 ;
createNode transform -n "R_bankRight_loc" -p "R_bankRight_loc_Grp";
	rename -uid "F837A002-4D79-C8D6-5DFF-8CB1CCF2E3B8";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "bankRight";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_bankRight_locShape" -p "R_bankRight_loc";
	rename -uid "C04CE379-4E20-C79E-BE50-88A5FD8AE87B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_bankLeft_loc_Grp" -p "R_ankle_loc";
	rename -uid "C8FBE5CA-459F-473D-2D31-8883B7466BB6";
	setAttr ".t" -type "double3" 2 -3 3 ;
createNode transform -n "R_bankLeft_loc" -p "R_bankLeft_loc_Grp";
	rename -uid "19C3EF00-4878-5B28-5370-3786C780E791";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "bankLeft";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_bankLeft_locShape" -p "R_bankLeft_loc";
	rename -uid "27DDC820-435E-6469-D102-6E923BE0CEF3";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_toeExtra_loc_Grp" -p "R_ankle_loc";
	rename -uid "9096F9C1-4A8F-36D3-C9C4-18AAF1F9014B";
	setAttr ".t" -type "double3" 0 -3 3 ;
createNode transform -n "R_toeExtra_loc" -p "R_toeExtra_loc_Grp";
	rename -uid "34DF654A-44B2-D662-21D4-F4B9CC04BC4E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_toeExtra_locShape" -p "R_toeExtra_loc";
	rename -uid "BEEB84B8-4F3E-8F9B-5667-A38C907259F4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_hip_vector_Grp" -p "R_hip_loc";
	rename -uid "B2ECC0CA-47ED-E530-0CF4-CE95CEA179BF";
createNode transform -n "R_hip_vector" -p "R_hip_vector_Grp";
	rename -uid "B4CFAAAD-42CA-0E23-64DC-EA8B0799019C";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_hip_vectorShape" -p "R_hip_vector";
	rename -uid "D9AB55C7-4361-441F-DE90-AB906B7E5033";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		1.3877787807814457e-16 3.0531133177191805e-16 0.5
		-1.3877787807814447e-16 -0.5 3.0531133177191815e-16
		-1.3877787807814457e-16 -3.0531133177191805e-16 -0.5
		-2.7755575615628914e-16 -6.106226635438361e-16 -1
		-2.7755575615628894e-16 -1 6.1062266354383629e-16
		2.7755575615628914e-16 6.106226635438361e-16 1
		1.3877787807814457e-16 3.0531133177191805e-16 0.5
		;
createNode aimConstraint -n "R_hip_vector_Grp_aimConstraint1" -p "R_hip_vector_Grp";
	rename -uid "2DF462E5-459E-388D-90D8-48B709B37CCE";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_knee_locW0" -dv 1 -at "double";
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
	setAttr ".rsrr" -type "double3" -5.7105931374996333 0 0 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "R_hip_mirror_parentConstraint1" -p "R_hip_mirror";
	rename -uid "BBC39C11-4ED0-B393-C5A0-35805CC8DAFF";
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
	setAttr ".tg[0].tot" -type "double3" -4 0 0 ;
	setAttr ".rst" -type "double3" -4 22 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_arm_nonParent";
	rename -uid "F0D55E00-4BE6-ED91-ACBD-F79B02B1021B";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_scapula_Crv" -p "L_arm_nonParent";
	rename -uid "4F5ACD81-4A74-8633-CA09-939C969D5FBA";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_scapula_CrvShape" -p "L_scapula_Crv";
	rename -uid "8F2A3E5D-4741-67CE-B1C2-2BB9C47B366B";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		1 44 0
		5 44 0
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_shoulder_Crv" -p "L_arm_nonParent";
	rename -uid "1F147012-4178-0F67-779A-A8B030F72D81";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_shoulder_CrvShape" -p "L_shoulder_Crv";
	rename -uid "DE9B5BAB-4FB7-1FA4-95D1-BCBD0C87AB74";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		5 44 0
		11 44 -1
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_elbow_Crv" -p "L_arm_nonParent";
	rename -uid "DCDAE4F4-4F8C-4D30-1075-C19BE95F9672";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_elbow_CrvShape" -p "L_elbow_Crv";
	rename -uid "BF5FA146-4E69-FBDC-802D-DBA70F36446C";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		11 44 -1
		17 44 0
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_wrist_Crv" -p "L_arm_nonParent";
	rename -uid "DC4D42BD-45B3-EEB7-A4E5-F1A1754C823F";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_wrist_CrvShape" -p "L_wrist_Crv";
	rename -uid "C13A08B5-45D1-D895-4F0A-A781F76F3319";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		17 44 0
		18 44 0
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_shoulderExtra_Crv" -p "L_arm_nonParent";
	rename -uid "B95CC33B-427D-D4DB-0397-0FA68682664C";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_shoulderExtra_CrvShape" -p "L_shoulderExtra_Crv";
	rename -uid "3674DA65-4F90-1A99-A0B3-0584502CC511";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		10.062910067666001 44 -1.8263120498094789
		11 44 -2
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_elbowExtra_Crv" -p "L_arm_nonParent";
	rename -uid "08952FCD-41E8-1B32-8F09-8FA962FB83C2";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_elbowExtra_CrvShape" -p "L_elbowExtra_Crv";
	rename -uid "C534F8B4-45BE-95BB-BC89-51A5BA59FD3F";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		11 44 -2
		11.937083353925061 44 -1.8263942799211668
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_scapula_mirror";
	rename -uid "0378E73A-47D5-8FC0-6A11-23A57682FD5F";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_attachBoneType" -type "string" "root_type";
	setAttr ".rig_attachSide" -type "string" "C";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "chest";
createNode transform -n "L_scapula_loc_Grp" -p "L_scapula_mirror";
	rename -uid "8696879B-43C8-19B0-012E-3281A553ACAA";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "rootPoint";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_scapula_loc" -p "L_scapula_loc_Grp";
	rename -uid "C6352E5E-48DF-AF64-A0C6-CA92FAFEE300";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_scapula_locShape" -p "L_scapula_loc";
	rename -uid "9BA64A91-4185-AE0F-42EB-BBAC51808E4F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_shoulder_loc_Grp" -p "L_scapula_loc";
	rename -uid "715DCF06-42A4-2AB7-B956-CB903EAC22B0";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "L_shoulder_loc" -p "L_shoulder_loc_Grp";
	rename -uid "4E74F765-4CB2-1B31-3412-B4AAF97401E3";
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
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "L";
	setAttr -k on ".insertJnt" 2;
createNode locator -n "L_shoulder_locShape" -p "L_shoulder_loc";
	rename -uid "73CCCECC-45BD-B371-4939-AFA9C6333393";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 16;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_elbow_loc_Grp" -p "L_shoulder_loc";
	rename -uid "6FDCA5AC-48A7-374F-AFFD-E38E4E6D9379";
	setAttr ".t" -type "double3" 6 0 -1 ;
createNode transform -n "L_elbow_loc" -p "L_elbow_loc_Grp";
	rename -uid "174B2EA5-4BD0-0E8B-93E3-8483B7F0C61C";
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
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "L";
	setAttr -k on ".insertJnt" 2;
createNode locator -n "L_elbow_locShape" -p "L_elbow_loc";
	rename -uid "651365D9-42D5-AE8E-53A2-AB8AC0E0BC08";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 16;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_elbowExtra_loc_Grp" -p "L_elbow_loc";
	rename -uid "DDEA41F0-4696-054B-CF60-DAB30FF3EB6D";
	setAttr ".t" -type "double3" 0 0 -1 ;
createNode transform -n "L_elbowExtra_loc" -p "L_elbowExtra_loc_Grp";
	rename -uid "C60E4453-4716-151A-E7FA-D6A1B673FC44";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_attachBoneType" -type "string" "arm_type";
	setAttr ".rig_attachSide" -type "string" "L";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "elbow";
createNode locator -n "L_elbowExtra_locShape" -p "L_elbowExtra_loc";
	rename -uid "E524FF5C-4662-6C6A-ADA8-24BD7120D451";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_aim_support1" -p "L_elbow_loc";
	rename -uid "860F3D51-45DC-97D6-4A0C-D1BA3904B6BB";
	setAttr ".v" no;
createNode aimConstraint -n "L_aim_support1_aimConstraint1" -p "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1";
	rename -uid "07DC4D9C-4317-406A-FFE4-4791BD66B707";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_shoulder_locW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" -1 0 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0 14.036243467926484 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_aim_support2" -p "L_elbow_loc";
	rename -uid "136BCF37-4823-A4CB-0BE4-128D66E46CD4";
	setAttr ".v" no;
createNode aimConstraint -n "L_aim_support2_aimConstraint1" -p "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2";
	rename -uid "C73463FA-4660-BE6D-845C-94B56F2ED9A9";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_wrist_locW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0 -14.036243467926484 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_shoulderExtra_loc_Grp" -p "L_elbow_loc";
	rename -uid "4FCDEDBF-4E9A-CA2B-4F48-AEA7131EEFF8";
createNode transform -n "L_shoulderExtra_loc" -p "L_shoulderExtra_loc_Grp";
	rename -uid "6D1C1286-4A65-6054-884D-2284CC091BBE";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_shoulderExtra_locShape" -p "L_shoulderExtra_loc";
	rename -uid "FCC78190-4F49-4A10-DEA7-3F92AB0AE28A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_shoulderExtra_loc_Grp_parentConstraint1" -p "L_shoulderExtra_loc_Grp";
	rename -uid "ED497093-47E5-1867-0972-1991DD90AFC9";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_aim_support1W0" -dv 1 -min 
		0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" -0.78849495115163837 0 -0.96912582101110889 ;
	setAttr ".tg[0].tor" -type "double3" 0 -14.036243467926484 0 ;
	setAttr ".lr" -type "double3" 0 -4.5739212599008727 0 ;
	setAttr ".rst" -type "double3" -1 0 -0.74895203113555908 ;
	setAttr ".rsrr" -type "double3" 0 -1.5902773407317584e-15 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_wristExtra_loc_Grp" -p "L_elbow_loc";
	rename -uid "AD400B20-4642-C994-7F14-9CAF0B699BAE";
createNode transform -n "L_wristExtra_loc" -p "L_wristExtra_loc_Grp";
	rename -uid "ACEA9AAD-4904-E8B9-AA79-5EB935263BA1";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_wristExtra_locShape" -p "L_wristExtra_loc";
	rename -uid "B53C351D-44FF-C593-88F5-E29C768BA126";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_wristExtra_loc_Grp_parentConstraint1" -p "L_wristExtra_loc_Grp";
	rename -uid "21F77015-493C-033E-572A-879800878576";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_aim_support2W0" -dv 1 -min 
		0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0.78847494370194671 0 -0.96920585080986621 ;
	setAttr ".tg[0].tor" -type "double3" 0 14.036243467926484 0 ;
	setAttr ".lr" -type "double3" 0 4.5739212599008727 0 ;
	setAttr ".rst" -type "double3" 0.99999999999999822 0 -0.749034523963928 ;
	setAttr ".rsrr" -type "double3" 0 1.5902773407317584e-15 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_wrist_loc_Grp" -p "L_shoulder_loc";
	rename -uid "51FBFB2D-451B-AEE0-4F10-B29C746A7C7A";
	setAttr ".t" -type "double3" 12 0 0 ;
createNode transform -n "L_wrist_loc" -p "L_wrist_loc_Grp";
	rename -uid "F26E9A49-4EBF-E5AD-0C01-EFA6A34F867D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "3";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_wrist_locShape" -p "L_wrist_loc";
	rename -uid "37336D8B-41AD-4D60-54AC-168D70B8E981";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_wristEnd_loc_Grp" -p "L_wrist_loc";
	rename -uid "08A9DB20-46BA-14CC-DF6F-BA92A1E30041";
	setAttr ".t" -type "double3" 1 0 0 ;
createNode transform -n "L_wristEnd_loc" -p "L_wristEnd_loc_Grp";
	rename -uid "F96C0965-4AD1-7F57-9B05-50AAFFA0B7FE";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "wristEnd";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "4";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_wristEnd_locShape" -p "L_wristEnd_loc";
	rename -uid "375B9FCC-4DB5-A7E0-8F9B-319E474BF8B3";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_shoulder_vector_Grp" -p "L_shoulder_loc";
	rename -uid "F58D87A5-45FD-8313-BBC5-289A59EAAD01";
createNode transform -n "L_shoulder_vector" -p "L_shoulder_vector_Grp";
	rename -uid "6C6E825C-4CB5-998B-CE01-299D768CC20E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "shoulder_aim";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_shoulder_vectorShape" -p "L_shoulder_vector";
	rename -uid "A1C62520-4621-6018-DDB9-FF9F91E6A4D6";
	setAttr -k off ".v";
	setAttr -s 7 ".cp";
	setAttr -av ".cp[0].xv";
	setAttr -av ".cp[0].yv";
	setAttr -av ".cp[0].zv";
	setAttr -av ".cp[1].xv";
	setAttr -av ".cp[1].yv";
	setAttr -av ".cp[1].zv";
	setAttr -av ".cp[2].xv";
	setAttr -av ".cp[2].yv";
	setAttr -av ".cp[2].zv";
	setAttr -av ".cp[3].xv";
	setAttr -av ".cp[3].yv";
	setAttr -av ".cp[3].zv";
	setAttr -av ".cp[4].xv";
	setAttr -av ".cp[4].yv";
	setAttr -av ".cp[4].zv";
	setAttr -av ".cp[5].xv";
	setAttr -av ".cp[5].yv";
	setAttr -av ".cp[5].zv";
	setAttr -av ".cp[6].xv";
	setAttr -av ".cp[6].yv";
	setAttr -av ".cp[6].zv";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-1.6653345369377348e-16 -0.49999999999999983 0
		0.49999999999999989 -1.6653345369377348e-16 1.6653345369377348e-16
		1.6653345369377348e-16 0.49999999999999983 0
		3.3306690738754696e-16 0.99999999999999967 0
		0.99999999999999978 -3.3306690738754696e-16 3.3306690738754696e-16
		-3.3306690738754696e-16 -0.99999999999999967 0
		-1.6653345369377348e-16 -0.49999999999999983 0
		;
createNode aimConstraint -n "L_shoulder_vector_Grp_aimConstraint1" -p "L_shoulder_vector_Grp";
	rename -uid "7302ACDF-4CC8-09DC-9B27-25A798A62790";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_elbow_locW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0 14.036243467926484 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_scapula_vector_Grp" -p "L_scapula_loc";
	rename -uid "DADFEF4F-4346-9EB2-CA62-639745C5B070";
createNode transform -n "L_scapula_vector" -p "L_scapula_vector_Grp";
	rename -uid "2A83F000-4B8C-53AB-D18F-5E82D2C64985";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_scapula_vectorShape" -p "L_scapula_vector";
	rename -uid "E60CDB05-484D-C3FF-6D53-AB8FBA3B2825";
	setAttr -k off ".v";
	setAttr -av ".cp[0].xv";
	setAttr -av ".cp[0].yv";
	setAttr -av ".cp[0].zv";
	setAttr -av ".cp[1].xv";
	setAttr -av ".cp[1].yv";
	setAttr -av ".cp[1].zv";
	setAttr -av ".cp[2].xv";
	setAttr -av ".cp[2].yv";
	setAttr -av ".cp[2].zv";
	setAttr -av ".cp[3].xv";
	setAttr -av ".cp[3].yv";
	setAttr -av ".cp[3].zv";
	setAttr -av ".cp[4].xv";
	setAttr -av ".cp[4].yv";
	setAttr -av ".cp[4].zv";
	setAttr -av ".cp[5].xv";
	setAttr -av ".cp[5].yv";
	setAttr -av ".cp[5].zv";
	setAttr -av ".cp[6].xv";
	setAttr -av ".cp[6].yv";
	setAttr -av ".cp[6].zv";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-1.6653345369377348e-16 -0.49999999999999983 0
		0.49999999999999989 -1.6653345369377348e-16 1.6653345369377348e-16
		1.6653345369377348e-16 0.49999999999999983 0
		3.3306690738754696e-16 0.99999999999999967 0
		0.99999999999999978 -3.3306690738754696e-16 3.3306690738754696e-16
		-3.3306690738754696e-16 -0.99999999999999967 0
		-1.6653345369377348e-16 -0.49999999999999983 0
		;
createNode aimConstraint -n "L_scapula_vector_Grp_aimConstraint1" -p "L_scapula_vector_Grp";
	rename -uid "3788C448-4D8B-2196-3E4D-FEB1D2C66206";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_shoulder_locW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr -k on ".w0";
createNode parentConstraint -n "L_scapula_mirror_parentConstraint1" -p "L_scapula_mirror";
	rename -uid "AEAD2DD7-42F1-A684-655A-A0902691D278";
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
	setAttr ".tg[0].tot" -type "double3" 1 0 0 ;
	setAttr ".rst" -type "double3" 1 44 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_arm_nonParent";
	rename -uid "AF5D0893-42C4-ABB4-8ACB-40BB960C29BD";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_scapula_Crv" -p "R_arm_nonParent";
	rename -uid "1793FEB8-43BC-6AF6-ADFE-E680A8FBFA30";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_scapula_CrvShape" -p "R_scapula_Crv";
	rename -uid "83C0BEE4-4E9E-763C-4616-9992759A670E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-1 44 0
		-5 44 0
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_shoulder_Crv" -p "R_arm_nonParent";
	rename -uid "E8820F1C-447D-7C3C-216A-9DB198D123B3";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_shoulder_CrvShape" -p "R_shoulder_Crv";
	rename -uid "FE5576AB-487E-9D39-5061-1C9730B0F97D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-5 44 0
		-11 44 -1
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_elbow_Crv" -p "R_arm_nonParent";
	rename -uid "4406A345-4F5B-9344-4118-2CBB9366EBA0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_elbow_CrvShape" -p "R_elbow_Crv";
	rename -uid "190A2D73-4A18-840D-3938-B8914A21E8D3";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-11 44 -1
		-17 44 0
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_wrist_Crv" -p "R_arm_nonParent";
	rename -uid "BFED18F4-43EE-12B0-A21C-C18E2995788E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_wrist_CrvShape" -p "R_wrist_Crv";
	rename -uid "C17E8A64-4708-4942-3BA6-7CBFB4B6117E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-17 44 0
		-18 44 0
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_shoulderExtra_Crv" -p "R_arm_nonParent";
	rename -uid "924CDCAF-4BEC-69C0-5E5B-FEA02934854C";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_shoulderExtra_CrvShape" -p "R_shoulderExtra_Crv";
	rename -uid "899B52E1-4C55-F5AA-237F-02A470132656";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-10.062910067666001 44 -1.8263120498094789
		-11 44 -2
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_elbowExtra_Crv" -p "R_arm_nonParent";
	rename -uid "7CA1C14A-48DE-B0AA-6CC9-F2B5AF1CD2DA";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_elbowExtra_CrvShape" -p "R_elbowExtra_Crv";
	rename -uid "E346AA1F-49FB-DD5A-BAD8-94BEF55DE5FE";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-11 44 -2
		-11.937083353925061 44 -1.8263942799211668
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_scapula_mirror";
	rename -uid "8E101766-40C1-841A-EEE4-FE81410E0355";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".s" -type "double3" -1 1 1 ;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_attachBoneType" -type "string" "root_type";
	setAttr ".rig_attachSide" -type "string" "C";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "chest";
createNode transform -n "R_scapula_loc_Grp" -p "R_scapula_mirror";
	rename -uid "D7542F59-4D57-C499-5F5A-74BAF42DA09A";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "rootPoint";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_scapula_loc" -p "R_scapula_loc_Grp";
	rename -uid "386C168B-4E23-0975-D4E3-81A50D96D020";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_scapula_locShape" -p "R_scapula_loc";
	rename -uid "8519CFE7-4146-805E-2EAF-B68B38C0E7A0";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_shoulder_loc_Grp" -p "R_scapula_loc";
	rename -uid "94A75125-4454-DE0B-2AE5-60838470B63C";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "R_shoulder_loc" -p "R_shoulder_loc_Grp";
	rename -uid "B32F3758-4B30-B1CE-7E4D-FFA981877BA9";
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
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "R";
	setAttr -k on ".insertJnt" 2;
createNode locator -n "R_shoulder_locShape" -p "R_shoulder_loc";
	rename -uid "C4134AB2-4C76-C581-DBC0-D383B624F593";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 16;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_elbow_loc_Grp" -p "R_shoulder_loc";
	rename -uid "C1A06B1E-4AAF-590B-6088-B28EF0D48D88";
	setAttr ".t" -type "double3" 6 0 -1 ;
createNode transform -n "R_elbow_loc" -p "R_elbow_loc_Grp";
	rename -uid "5ABEC874-4B69-8B80-3121-74A2B4FA7583";
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
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "R";
	setAttr -k on ".insertJnt" 2;
createNode locator -n "R_elbow_locShape" -p "R_elbow_loc";
	rename -uid "5B8C6A8B-4DD7-C162-2E54-F69BC5630569";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 16;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_elbowExtra_loc_Grp" -p "R_elbow_loc";
	rename -uid "07FE9ED7-476E-94FE-3494-82B03B823752";
	setAttr ".t" -type "double3" 0 0 -1 ;
createNode transform -n "R_elbowExtra_loc" -p "R_elbowExtra_loc_Grp";
	rename -uid "9BA1A71D-4EC8-31BF-A3F1-C487E5ECE954";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_attachBoneType" -type "string" "arm_type";
	setAttr ".rig_attachSide" -type "string" "R";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "elbow";
createNode locator -n "R_elbowExtra_locShape" -p "R_elbowExtra_loc";
	rename -uid "00C585BA-4867-C68A-3EF3-77BDCADC6DAA";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_aim_support1" -p "R_elbow_loc";
	rename -uid "FB7ADF05-40EB-2EC2-D9BF-E08DFE818794";
	setAttr ".v" no;
createNode aimConstraint -n "R_aim_support1_aimConstraint1" -p "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1";
	rename -uid "602648CA-44F8-A04F-F493-94876683B1AF";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_shoulder_locW0" -dv 1 -at "double";
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
	setAttr ".a" -type "double3" -1 0 0 ;
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0 14.036243467926484 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_aim_support2" -p "R_elbow_loc";
	rename -uid "09E126CD-4355-DBFA-1907-65996BC1D4A2";
	setAttr ".v" no;
createNode aimConstraint -n "R_aim_support2_aimConstraint1" -p "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2";
	rename -uid "5AA44C3D-42F0-50BC-073D-5BBB97ED0735";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_wrist_locW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0 -14.036243467926484 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_shoulderExtra_loc_Grp" -p "R_elbow_loc";
	rename -uid "129CFD15-4F49-8198-3716-14B895824ABA";
createNode transform -n "R_shoulderExtra_loc" -p "R_shoulderExtra_loc_Grp";
	rename -uid "6B979FF9-4E17-9F8A-A8D3-38B592E721CB";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_shoulderExtra_locShape" -p "R_shoulderExtra_loc";
	rename -uid "82EDBDAA-4EA6-FABA-992F-2BAFFD3F3904";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_shoulderExtra_loc_Grp_parentConstraint1" -p "R_shoulderExtra_loc_Grp";
	rename -uid "8BF4E859-440D-E29B-6EC8-4F9A665079FE";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_aim_support1W0" -dv 1 -min 
		0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" -0.78849495115163837 0 -0.96912582101110889 ;
	setAttr ".tg[0].tor" -type "double3" 0 -14.036243467926484 0 ;
	setAttr ".lr" -type "double3" 0 -4.5739212599008727 0 ;
	setAttr ".rst" -type "double3" -1 0 -0.74895203113555908 ;
	setAttr ".rsrr" -type "double3" 0 -1.5902773407317584e-15 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_wristExtra_loc_Grp" -p "R_elbow_loc";
	rename -uid "F2C125A7-45B9-8424-D83C-F59D81D47D1D";
createNode transform -n "R_wristExtra_loc" -p "R_wristExtra_loc_Grp";
	rename -uid "872A40C0-458A-F535-8C53-E6AECB121FDA";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_wristExtra_locShape" -p "R_wristExtra_loc";
	rename -uid "833F56EF-46F1-6EFE-A32D-7391274A9477";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_wristExtra_loc_Grp_parentConstraint1" -p "R_wristExtra_loc_Grp";
	rename -uid "0BDD13F5-4FDC-85C8-DF68-5E91098E4473";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_aim_support2W0" -dv 1 -min 
		0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0.78847494370194671 0 -0.96920585080986621 ;
	setAttr ".tg[0].tor" -type "double3" 0 14.036243467926484 0 ;
	setAttr ".lr" -type "double3" 0 4.5739212599008727 0 ;
	setAttr ".rst" -type "double3" 0.99999999999999822 0 -0.749034523963928 ;
	setAttr ".rsrr" -type "double3" 0 1.5902773407317584e-15 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_wrist_loc_Grp" -p "R_shoulder_loc";
	rename -uid "7822642C-45C7-7EA9-1D08-1B997F5358E7";
	setAttr ".t" -type "double3" 12 0 0 ;
createNode transform -n "R_wrist_loc" -p "R_wrist_loc_Grp";
	rename -uid "0D708009-4B2A-B813-FAC2-CE8FA204A753";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "3";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_wrist_locShape" -p "R_wrist_loc";
	rename -uid "A26B74BF-4E0F-514A-CC91-50B0EC2A49AF";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_wristEnd_loc_Grp" -p "R_wrist_loc";
	rename -uid "82EB87AE-4452-B457-5CF1-9385E74161D9";
	setAttr ".t" -type "double3" 1 0 0 ;
createNode transform -n "R_wristEnd_loc" -p "R_wristEnd_loc_Grp";
	rename -uid "9D324D01-487E-49E0-189F-07A8F948C74A";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "wristEnd";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_index" -type "string" "4";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_wristEnd_locShape" -p "R_wristEnd_loc";
	rename -uid "905EE3F1-4ED1-383B-09B4-6D8927FC4EF0";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_shoulder_vector_Grp" -p "R_shoulder_loc";
	rename -uid "1D9B9621-4083-BE09-4B95-99848A8258A3";
	setAttr ".t" -type "double3" 8.8817841970012523e-16 0 0 ;
createNode transform -n "R_shoulder_vector" -p "R_shoulder_vector_Grp";
	rename -uid "8845508A-4275-759C-635E-779A16D21A2E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_shoulder_vectorShape" -p "R_shoulder_vector";
	rename -uid "A504239A-4F0E-2D9C-3838-B894C30B933D";
	setAttr -k off ".v";
	setAttr -s 7 ".cp";
	setAttr -av ".cp[0].xv";
	setAttr -av ".cp[0].yv";
	setAttr -av ".cp[0].zv";
	setAttr -av ".cp[1].xv";
	setAttr -av ".cp[1].yv";
	setAttr -av ".cp[1].zv";
	setAttr -av ".cp[2].xv";
	setAttr -av ".cp[2].yv";
	setAttr -av ".cp[2].zv";
	setAttr -av ".cp[3].xv";
	setAttr -av ".cp[3].yv";
	setAttr -av ".cp[3].zv";
	setAttr -av ".cp[4].xv";
	setAttr -av ".cp[4].yv";
	setAttr -av ".cp[4].zv";
	setAttr -av ".cp[5].xv";
	setAttr -av ".cp[5].yv";
	setAttr -av ".cp[5].zv";
	setAttr -av ".cp[6].xv";
	setAttr -av ".cp[6].yv";
	setAttr -av ".cp[6].zv";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-1.6653345369377348e-16 -0.49999999999999983 0
		0.49999999999999989 -1.6653345369377348e-16 1.6653345369377348e-16
		1.6653345369377348e-16 0.49999999999999983 0
		3.3306690738754696e-16 0.99999999999999967 0
		0.99999999999999978 -3.3306690738754696e-16 3.3306690738754696e-16
		-3.3306690738754696e-16 -0.99999999999999967 0
		-1.6653345369377348e-16 -0.49999999999999983 0
		;
createNode aimConstraint -n "R_shoulder_vector_Grp_aimConstraint1" -p "R_shoulder_vector_Grp";
	rename -uid "9B0F06E2-41FE-35F4-691A-5F9BB6B8E202";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_elbow_locW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr ".rsrr" -type "double3" 0 14.036243467926484 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_scapula_vector_Grp" -p "R_scapula_loc";
	rename -uid "1D4441C4-40C3-2F8F-9B02-AC80050BD8D0";
createNode transform -n "R_scapula_vector" -p "R_scapula_vector_Grp";
	rename -uid "24196241-4897-1A91-954E-6C85BAA047C5";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_scapula_vectorShape" -p "R_scapula_vector";
	rename -uid "22D95B71-4C37-928E-5DE7-5F90DB61DC40";
	setAttr -k off ".v";
	setAttr -av ".cp[0].xv";
	setAttr -av ".cp[0].yv";
	setAttr -av ".cp[0].zv";
	setAttr -av ".cp[1].xv";
	setAttr -av ".cp[1].yv";
	setAttr -av ".cp[1].zv";
	setAttr -av ".cp[2].xv";
	setAttr -av ".cp[2].yv";
	setAttr -av ".cp[2].zv";
	setAttr -av ".cp[3].xv";
	setAttr -av ".cp[3].yv";
	setAttr -av ".cp[3].zv";
	setAttr -av ".cp[4].xv";
	setAttr -av ".cp[4].yv";
	setAttr -av ".cp[4].zv";
	setAttr -av ".cp[5].xv";
	setAttr -av ".cp[5].yv";
	setAttr -av ".cp[5].zv";
	setAttr -av ".cp[6].xv";
	setAttr -av ".cp[6].yv";
	setAttr -av ".cp[6].zv";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-1.6653345369377348e-16 -0.49999999999999983 0
		0.49999999999999989 -1.6653345369377348e-16 1.6653345369377348e-16
		1.6653345369377348e-16 0.49999999999999983 0
		3.3306690738754696e-16 0.99999999999999967 0
		0.99999999999999978 -3.3306690738754696e-16 3.3306690738754696e-16
		-3.3306690738754696e-16 -0.99999999999999967 0
		-1.6653345369377348e-16 -0.49999999999999983 0
		;
createNode aimConstraint -n "R_scapula_vector_Grp_aimConstraint1" -p "R_scapula_vector_Grp";
	rename -uid "F66CF066-4449-5471-A0A3-12AFCEA9F298";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_shoulder_locW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr -k on ".w0";
createNode parentConstraint -n "R_scapula_mirror_parentConstraint1" -p "R_scapula_mirror";
	rename -uid "677D3094-42A9-D892-2649-D7915C2A00AB";
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
	setAttr ".tg[0].tot" -type "double3" -1 0 0 ;
	setAttr ".rst" -type "double3" -1 44 0 ;
	setAttr -k on ".w0";
createNode transform -n "L_hand_nonParent";
	rename -uid "3D57C514-4FB5-F718-B995-B99C38D4682D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_index_Crv" -p "L_hand_nonParent";
	rename -uid "9C6F0050-481A-214A-6AB5-CFA5BC343E26";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_index_CrvShape" -p "L_index_Crv";
	rename -uid "E720B145-4F6E-9266-C92C-5BA45EC14C71";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 0.25 0.5 0.75 1
		5
		18.999999999999996 43.999999999999993 0.5
		20.499999999999996 43.999999999999993 0.5
		21.834 43.999999999999993 0.5
		23.166 43.999999999999993 0.5
		24.499999999999996 43.999999999999993 0.5
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_middle_Crv" -p "L_hand_nonParent";
	rename -uid "8264081A-4907-925C-7940-8AA7D4524F1B";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_middle_CrvShape" -p "L_middle_Crv";
	rename -uid "14E65190-49DE-F778-233F-D4B330479067";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 0.25 0.5 0.75 1
		5
		18.999999999999996 43.999999999999993 0
		20.499999999999996 43.999999999999993 0
		21.834 43.999999999999993 0
		23.166 43.999999999999993 0
		24.499999999999996 43.999999999999993 0
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_ring_Crv" -p "L_hand_nonParent";
	rename -uid "2365F0EE-4D25-72A4-C16A-369EBF01C231";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_ring_CrvShape" -p "L_ring_Crv";
	rename -uid "04687DD6-4308-654A-E373-AB82EF9D2D42";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 0.25 0.5 0.75 1
		5
		18.999999999999996 43.999999999999993 -0.5
		20.499999999999996 43.999999999999993 -0.5
		21.834 43.999999999999993 -0.5
		23.166 43.999999999999993 -0.5
		24.499999999999996 43.999999999999993 -0.5
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_pinky_Crv" -p "L_hand_nonParent";
	rename -uid "65266613-41D5-6BD1-92A5-6EA2DB1D3451";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_pinky_CrvShape" -p "L_pinky_Crv";
	rename -uid "798407CF-49F6-3A64-57D1-CCA597794AA9";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 0.25 0.5 0.75 1
		5
		18.999999999999996 43.999999999999993 -1
		20.499999999999996 43.999999999999993 -1
		21.834 43.999999999999993 -1
		23.166 43.999999999999993 -1
		24.499999999999996 43.999999999999993 -1
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_thumb_Crv" -p "L_hand_nonParent";
	rename -uid "B3699EA4-4533-2FDD-C624-D8B2F2511F56";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_thumb_CrvShape" -p "L_thumb_Crv";
	rename -uid "4FC19EC9-4306-F7E1-0DDD-05A569BA21DA";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 4 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 1 2 3
		4
		18.999999999999996 43.999999999999993 1
		20.499999999999996 43.999999999999993 1
		21.832999999999998 43.999999999999993 1
		23.165999999999997 43.999999999999993 1
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
createNode transform -n "L_handRoot_mirror";
	rename -uid "FCC12880-4450-37BD-95FC-01AE516D2E6C";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_attachBoneType" -type "string" "arm_type";
	setAttr ".rig_attachSide" -type "string" "L";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "wrist";
createNode transform -n "L_handRoot_loc_Grp" -p "L_handRoot_mirror";
	rename -uid "CD56920D-4ACD-0044-791D-6F86DA0A2965";
createNode transform -n "L_handRoot_loc" -p "|L_handRoot_mirror|L_handRoot_loc_Grp";
	rename -uid "8564E8B5-46EB-AAAF-5EFB-23B2F681CC43";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
createNode locator -n "L_handRoot_locShape" -p "L_handRoot_loc";
	rename -uid "D5B7DFB1-4F21-34B2-4373-13AD6763BB6F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_thumbRoot_loc_Grp" -p "L_handRoot_loc";
	rename -uid "4A06AF49-4046-E05A-FF76-188650679469";
	setAttr ".t" -type "double3" 1 0 1 ;
createNode transform -n "L_thumbRoot_loc" -p "L_thumbRoot_loc_Grp";
	rename -uid "8F0135B2-43F4-4FBB-4EA7-44AD54B2B04C";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumbRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_attachBoneType" -type "string" "arm_type";
	setAttr ".rig_attachSide" -type "string" "L";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "wrist";
createNode locator -n "L_thumbRoot_locShape" -p "L_thumbRoot_loc";
	rename -uid "02BB2747-47A3-6575-886A-8EB3A5EA263F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_thumb1_loc_Grp" -p "L_thumbRoot_loc";
	rename -uid "EECFA58E-49A6-ABB2-3767-E29EC32EAE41";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "L_thumb1_loc" -p "L_thumb1_loc_Grp";
	rename -uid "6D7CB8D1-4465-A2E0-F50D-57BC0729F130";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_thumb1_locShape" -p "L_thumb1_loc";
	rename -uid "B1C60340-431C-7102-263A-92B56B6D9648";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_thumb2_loc_Grp" -p "L_thumb1_loc";
	rename -uid "199AF667-48B2-DB6C-CF1B-588BA8F03575";
createNode transform -n "L_thumb2_loc" -p "L_thumb2_loc_Grp";
	rename -uid "73A6C941-437C-15D4-84BF-BAA37BF7DE31";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_thumb2_locShape" -p "L_thumb2_loc";
	rename -uid "6ADBE029-46CB-9523-853B-29AC4FAAD761";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_thumb2_loc_Grp_pointConstraint1" -p "L_thumb2_loc_Grp";
	rename -uid "9AE4765B-4A46-E414-2D27-2DAFFB79CBAA";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_thumb3_locW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_thumb1_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 2 0 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "L_thumb3_loc_Grp" -p "L_thumb1_loc";
	rename -uid "D3EB1928-446B-809F-C585-DDB134E0FA72";
	setAttr ".t" -type "double3" 2.666 0 0 ;
createNode transform -n "L_thumb3_loc" -p "L_thumb3_loc_Grp";
	rename -uid "A877A3A9-4F4D-7EB8-3265-659F4CF6E374";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb3";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "3";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_thumb3_locShape" -p "L_thumb3_loc";
	rename -uid "3A99220B-4322-DF64-66AD-56ACC2336723";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_thumb_aimVector_Grp" -p "L_thumb1_loc";
	rename -uid "1D516752-41FC-94D8-DD90-DB9223BD64B2";
createNode transform -n "L_thumb_aimVector" -p "L_thumb_aimVector_Grp";
	rename -uid "7E421837-4011-BE3D-273F-B8BDEDE69823";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_thumb_aimVectorShape" -p "L_thumb_aimVector";
	rename -uid "1E72E014-494E-B700-6512-5EBEBC906E09";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-1.0227235724968863e-16 -0.30706249999999985 0
		0.3070624999999999 -1.0227235724968863e-16 1.0227235724968863e-16
		1.0227235724968863e-16 0.30706249999999985 0
		2.0454471449937726e-16 0.6141249999999997 0
		0.61412499999999981 -2.0454471449937726e-16 2.0454471449937726e-16
		-2.0454471449937726e-16 -0.6141249999999997 0
		-1.0227235724968863e-16 -0.30706249999999985 0
		;
createNode aimConstraint -n "L_thumb_aimVector_Grp_aimConstraint1" -p "L_thumb_aimVector_Grp";
	rename -uid "BC86D9CB-467E-4639-923C-35908E897542";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_thumb2_locW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr -k on ".w0";
createNode transform -n "L_pinkyRoot_loc_Grp" -p "L_handRoot_loc";
	rename -uid "E7DC9FA5-4A8C-5EC3-048D-31BB19699799";
	setAttr ".t" -type "double3" 1 0 -1 ;
createNode transform -n "L_pinkyRoot_loc" -p "L_pinkyRoot_loc_Grp";
	rename -uid "5966BBEC-4F12-033A-F97D-EDA6CCF0FBD2";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinkyRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_attachBoneType" -type "string" "arm_type";
	setAttr ".rig_attachSide" -type "string" "L";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "wrist";
createNode locator -n "L_pinkyRoot_locShape" -p "L_pinkyRoot_loc";
	rename -uid "2D69DE41-45F6-F17C-C2FB-A994EEB0B8F0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_pinky1_loc_Grp" -p "L_pinkyRoot_loc";
	rename -uid "D27EA008-4B68-ECC7-C104-0EAA00EDDFDC";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "L_pinky1_loc" -p "L_pinky1_loc_Grp";
	rename -uid "78F9DA60-4DCD-9CD6-DA76-34850B91D1B3";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_pinky1_locShape" -p "L_pinky1_loc";
	rename -uid "ED2BA948-45B0-5B72-B392-FFB9D4AEDC5C";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_pinky2_loc_Grp" -p "L_pinky1_loc";
	rename -uid "685E859E-4580-F198-1549-57BE1E03EC85";
createNode transform -n "L_pinky2_loc" -p "L_pinky2_loc_Grp";
	rename -uid "2D8850F9-4C13-8977-1E13-7E82B7EF3C50";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_pinky2_locShape" -p "L_pinky2_loc";
	rename -uid "17684841-40F6-8BB2-9685-9D8E6C20FFF5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_pinky2_loc_Grp_pointConstraint1" -p "L_pinky2_loc_Grp";
	rename -uid "A94CF000-476B-65FA-D749-A1BA71BD2400";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_pinky1_locW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_pinky4_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" 0.0019999999999988916 0 0 ;
	setAttr ".rst" -type "double3" 2 0 0 ;
	setAttr -k on ".w0" 0.667;
	setAttr -k on ".w1" 0.333;
createNode transform -n "L_pinky3_loc_Grp" -p "L_pinky1_loc";
	rename -uid "61BA368D-4F77-D59A-B887-489BB5F34991";
createNode transform -n "L_pinky3_loc" -p "L_pinky3_loc_Grp";
	rename -uid "EA1DC9F9-409D-AE3E-E42F-76BF5C354ED2";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky3";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "3";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_pinky3_locShape" -p "L_pinky3_loc";
	rename -uid "6A093763-49BD-947F-06CF-2B85A9000E9F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_pinky3_loc_Grp_pointConstraint1" -p "L_pinky3_loc_Grp";
	rename -uid "00538672-45A4-8CA4-8C36-3FAE87041CC5";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_pinky1_locW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_pinky4_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" -0.0019999999999988916 0 0 ;
	setAttr ".rst" -type "double3" 4 0 0 ;
	setAttr -k on ".w0" 0.333;
	setAttr -k on ".w1" 0.667;
createNode transform -n "L_pinky4_loc_Grp" -p "L_pinky1_loc";
	rename -uid "5278EBEC-4599-7CCA-A541-03B5ABCFD78B";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "L_pinky4_loc" -p "L_pinky4_loc_Grp";
	rename -uid "AF99AA7C-4E1D-5B06-385A-3DB5B2D038CC";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky4";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "4";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_pinky4_locShape" -p "L_pinky4_loc";
	rename -uid "73683B50-464D-D310-2D6C-6890677FA459";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_pinky_aimVector_Grp" -p "L_pinky1_loc";
	rename -uid "AD47A5E4-4320-C606-36E5-1BB85193CEA4";
createNode transform -n "L_pinky_aimVector" -p "L_pinky_aimVector_Grp";
	rename -uid "E3EE860E-454D-26CD-3B71-F18D763C64CE";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_pinky_aimVectorShape" -p "L_pinky_aimVector";
	rename -uid "F8DDC66B-473E-FBC0-19B5-7CB3A3A78890";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-1.0227235724968863e-16 -0.30706249999999985 0
		0.3070624999999999 -1.0227235724968863e-16 1.0227235724968863e-16
		1.0227235724968863e-16 0.30706249999999985 0
		2.0454471449937726e-16 0.6141249999999997 0
		0.61412499999999981 -2.0454471449937726e-16 2.0454471449937726e-16
		-2.0454471449937726e-16 -0.6141249999999997 0
		-1.0227235724968863e-16 -0.30706249999999985 0
		;
createNode aimConstraint -n "L_pinky_aimVector_Grp_aimConstraint1" -p "L_pinky_aimVector_Grp";
	rename -uid "004CEFD5-4E9C-0BC5-2C86-8B99173E4A0F";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_pinky2_locW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr -k on ".w0";
createNode transform -n "L_ringRoot_loc_Grp" -p "L_handRoot_loc";
	rename -uid "1E995503-49EF-F526-07F2-74A19AB03C74";
	setAttr ".t" -type "double3" 1 0 -0.5 ;
createNode transform -n "L_ringRoot_loc" -p "L_ringRoot_loc_Grp";
	rename -uid "9432F45C-42CC-D08C-2273-DE92AD5392A4";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ringRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_attachBoneType" -type "string" "arm_type";
	setAttr ".rig_attachSide" -type "string" "L";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "wrist";
createNode locator -n "L_ringRoot_locShape" -p "L_ringRoot_loc";
	rename -uid "1B00A722-4896-985E-D2BC-81A15415395B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_ring1_loc_Grp" -p "L_ringRoot_loc";
	rename -uid "6CC1543D-4FC6-E393-EFAE-91AFCAE6A8C9";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "L_ring1_loc" -p "L_ring1_loc_Grp";
	rename -uid "12885B6D-4260-8D6D-37DE-39A33B6971D7";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_ring1_locShape" -p "L_ring1_loc";
	rename -uid "09329B3C-44FF-2CD8-5D49-7B936A6CF8ED";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_ring2_loc_Grp" -p "L_ring1_loc";
	rename -uid "C3DB1962-44CB-8606-28B5-EFB89D428ACF";
createNode transform -n "L_ring2_loc" -p "L_ring2_loc_Grp";
	rename -uid "75159641-400A-EDF3-D977-7982369D00A1";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_ring2_locShape" -p "L_ring2_loc";
	rename -uid "2DB7DBE2-4F34-59D5-39A1-22AF964D21A9";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_ring2_loc_Grp_pointConstraint1" -p "L_ring2_loc_Grp";
	rename -uid "E9469C9A-45A8-940E-2FA9-159824E35380";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_ring1_locW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_ring4_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" 0.0019999999999988916 0 0 ;
	setAttr ".rst" -type "double3" 2 0 0 ;
	setAttr -k on ".w0" 0.667;
	setAttr -k on ".w1" 0.333;
createNode transform -n "L_ring3_loc_Grp" -p "L_ring1_loc";
	rename -uid "69E531D9-472D-859B-948E-34B61003ACAA";
createNode transform -n "L_ring3_loc" -p "L_ring3_loc_Grp";
	rename -uid "70401D62-4DDE-BD08-3BB9-33BE6A26DBE5";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring3";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "3";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_ring3_locShape" -p "L_ring3_loc";
	rename -uid "A56F9502-4D90-439C-CBD5-16A3CABCCC8A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_ring3_loc_Grp_pointConstraint1" -p "L_ring3_loc_Grp";
	rename -uid "30D09BD8-4265-3076-2213-ABA16CA0F41C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_ring1_locW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_ring4_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" -0.0019999999999988916 0 0 ;
	setAttr ".rst" -type "double3" 4 0 0 ;
	setAttr -k on ".w0" 0.333;
	setAttr -k on ".w1" 0.667;
createNode transform -n "L_ring4_loc_Grp" -p "L_ring1_loc";
	rename -uid "29877C8C-44BF-76BB-1DF1-83A165020BF8";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "L_ring4_loc" -p "L_ring4_loc_Grp";
	rename -uid "3C528A9A-4157-CFCA-B50E-7E8FA2D4FCD0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring4";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "4";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_ring4_locShape" -p "L_ring4_loc";
	rename -uid "56152A75-4F0E-3EBA-3306-93B5BC065BE5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_ring_aimVector_Grp" -p "L_ring1_loc";
	rename -uid "32C20438-4983-AB12-0FA3-D3AC7DA125BE";
createNode transform -n "L_ring_aimVector" -p "L_ring_aimVector_Grp";
	rename -uid "E88B221C-4C2C-3183-1024-72B1426AB67A";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_ring_aimVectorShape" -p "L_ring_aimVector";
	rename -uid "B4A69FF0-4104-A19D-903B-5AB4E91135AD";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-1.0227235724968863e-16 -0.30706249999999985 0
		0.3070624999999999 -1.0227235724968863e-16 1.0227235724968863e-16
		1.0227235724968863e-16 0.30706249999999985 0
		2.0454471449937726e-16 0.6141249999999997 0
		0.61412499999999981 -2.0454471449937726e-16 2.0454471449937726e-16
		-2.0454471449937726e-16 -0.6141249999999997 0
		-1.0227235724968863e-16 -0.30706249999999985 0
		;
createNode aimConstraint -n "L_ring_aimVector_Grp_aimConstraint1" -p "L_ring_aimVector_Grp";
	rename -uid "8157529D-40F0-29C5-0D1A-919F7112EB08";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_ring2_locW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr -k on ".w0";
createNode transform -n "L_indexRoot_loc_Grp" -p "L_handRoot_loc";
	rename -uid "9307CFBD-4A6A-6B30-2F7F-F5812711B0D6";
	setAttr ".t" -type "double3" 1 0 0.5 ;
createNode transform -n "L_indexRoot_loc" -p "L_indexRoot_loc_Grp";
	rename -uid "E20FC821-48A0-CE56-40F5-F6A753603EBC";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "indexRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_attachBoneType" -type "string" "arm_type";
	setAttr ".rig_attachSide" -type "string" "L";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "wrist";
createNode locator -n "L_indexRoot_locShape" -p "L_indexRoot_loc";
	rename -uid "4207E128-499C-3325-FF4E-C9BCF55431A3";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_index1_loc_Grp" -p "L_indexRoot_loc";
	rename -uid "7ADE60C3-4DB6-FAAB-2451-468E9A545472";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "L_index1_loc" -p "L_index1_loc_Grp";
	rename -uid "4E73F271-440A-FA06-A101-9285901FE263";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_index1_locShape" -p "L_index1_loc";
	rename -uid "37AFC55E-4629-5009-5075-4AB865C6746D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_index2_loc_Grp" -p "L_index1_loc";
	rename -uid "C70D852E-41B7-E459-661D-9E88DF704C1F";
createNode transform -n "L_index2_loc" -p "L_index2_loc_Grp";
	rename -uid "2CCD0C9A-45A4-F191-D127-3DA975A9D3B1";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_index2_locShape" -p "L_index2_loc";
	rename -uid "C8DA7BAB-4FDC-25F0-41BE-E6BC65CE3FB5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_index2_loc_Grp_pointConstraint1" -p "L_index2_loc_Grp";
	rename -uid "535ADF24-4093-8510-9CF1-CDBCE158AF8A";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_index1_locW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_index4_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" 0.0019999999999988916 0 0 ;
	setAttr ".rst" -type "double3" 2 0 0 ;
	setAttr -k on ".w0" 0.667;
	setAttr -k on ".w1" 0.333;
createNode transform -n "L_index3_loc_Grp" -p "L_index1_loc";
	rename -uid "DB63C99C-4648-A111-BD73-578FEE211F3A";
createNode transform -n "L_index3_loc" -p "L_index3_loc_Grp";
	rename -uid "47FE6408-467D-E09A-C2D0-ACA3EF62E07E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index3";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "3";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_index3_locShape" -p "L_index3_loc";
	rename -uid "EC3C9DC0-4DE1-380C-9709-638123231B3C";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_index3_loc_Grp_pointConstraint1" -p "L_index3_loc_Grp";
	rename -uid "ABD370EE-4ADA-0EAF-8A03-2B9522EA1BEC";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_index1_locW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_index4_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" -0.0019999999999988916 0 0 ;
	setAttr ".rst" -type "double3" 4 0 0 ;
	setAttr -k on ".w0" 0.333;
	setAttr -k on ".w1" 0.667;
createNode transform -n "L_index4_loc_Grp" -p "L_index1_loc";
	rename -uid "2E3583D5-4511-BE55-049B-8BAFF73D8EA6";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "L_index4_loc" -p "L_index4_loc_Grp";
	rename -uid "99C5791C-4408-346D-A954-D3A425B166BC";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index4";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "4";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_index4_locShape" -p "L_index4_loc";
	rename -uid "3B0CE5B3-42B7-5DD3-A273-038978F38080";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_index_aimVector_Grp" -p "L_index1_loc";
	rename -uid "01DAB586-4484-19C6-C390-5189ED5CBEF0";
createNode transform -n "L_index_aimVector" -p "L_index_aimVector_Grp";
	rename -uid "6A7D43BD-42CE-856F-B311-869E8AD0A5C1";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_index_aimVectorShape" -p "L_index_aimVector";
	rename -uid "D195F485-4D48-77B3-ECC3-BC9934D54559";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-1.0227235724968863e-16 -0.30706249999999985 0
		0.3070624999999999 -1.0227235724968863e-16 1.0227235724968863e-16
		1.0227235724968863e-16 0.30706249999999985 0
		2.0454471449937726e-16 0.6141249999999997 0
		0.61412499999999981 -2.0454471449937726e-16 2.0454471449937726e-16
		-2.0454471449937726e-16 -0.6141249999999997 0
		-1.0227235724968863e-16 -0.30706249999999985 0
		;
createNode aimConstraint -n "L_index_aimVector_Grp_aimConstraint1" -p "L_index_aimVector_Grp";
	rename -uid "AA3E192D-4D47-20A5-9AEB-538D31BFAB68";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_index2_locW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr -k on ".w0";
createNode transform -n "L_middleRoot_loc_Grp" -p "L_handRoot_loc";
	rename -uid "F6E6CA17-4DBB-E646-9DD3-1C80DE46B152";
	setAttr ".t" -type "double3" 1 0 0 ;
createNode transform -n "L_middleRoot_loc" -p "L_middleRoot_loc_Grp";
	rename -uid "189FF9AD-450E-FFE0-4CB7-7691F17B376F";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middleRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_attachBoneType" -type "string" "arm_type";
	setAttr ".rig_attachSide" -type "string" "L";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "wrist";
createNode locator -n "L_middleRoot_locShape" -p "L_middleRoot_loc";
	rename -uid "BBF0E00F-4B52-595F-07A8-4893500B383F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_middle1_loc_Grp" -p "L_middleRoot_loc";
	rename -uid "F105EABA-45F6-FE7E-B61C-03A029F4247E";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "L_middle1_loc" -p "L_middle1_loc_Grp";
	rename -uid "01B29CAB-4601-6BB7-8561-CD8B85AE850F";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_middle1_locShape" -p "L_middle1_loc";
	rename -uid "F91FD217-4C50-3414-57DE-0F9080127904";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_middle2_loc_Grp" -p "L_middle1_loc";
	rename -uid "57D5BB67-420C-1CAC-D28D-4BAC11E00D46";
createNode transform -n "L_middle2_loc" -p "L_middle2_loc_Grp";
	rename -uid "4D2DF6E1-48F7-BBFF-1259-F1B833479C91";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_middle2_locShape" -p "L_middle2_loc";
	rename -uid "2C31B96C-404E-C227-B325-6B8FF49BE522";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_middle2_loc_Grp_pointConstraint1" -p "L_middle2_loc_Grp";
	rename -uid "5666C8CB-4A98-63D9-B388-D0AD2D581BC1";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_middle1_locW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_middle4_locW1" -dv 1 -min 0 
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
	setAttr ".o" -type "double3" 0.0019999999999988916 0 0 ;
	setAttr ".rst" -type "double3" 2 0 0 ;
	setAttr -k on ".w0" 0.667;
	setAttr -k on ".w1" 0.333;
createNode transform -n "L_middle3_loc_Grp" -p "L_middle1_loc";
	rename -uid "B82819EB-495D-F6E8-5971-68B93F66CD11";
createNode transform -n "L_middle3_loc" -p "L_middle3_loc_Grp";
	rename -uid "0ADAE4A9-490F-0639-3450-0596B695AE28";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle3";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "3";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_middle3_locShape" -p "L_middle3_loc";
	rename -uid "A354BD6D-4D43-B89F-ABAF-8489B24B110F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_middle3_loc_Grp_pointConstraint1" -p "L_middle3_loc_Grp";
	rename -uid "377C2571-4DED-C40F-3B1A-22B35B76C4F2";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_middle1_locW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_middle4_locW1" -dv 1 -min 0 
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
	setAttr ".o" -type "double3" -0.0019999999999988916 0 0 ;
	setAttr ".rst" -type "double3" 4 0 0 ;
	setAttr -k on ".w0" 0.333;
	setAttr -k on ".w1" 0.667;
createNode transform -n "L_middle4_loc_Grp" -p "L_middle1_loc";
	rename -uid "45350A93-4BBE-8EAF-6AFC-AA85AF549298";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "L_middle4_loc" -p "L_middle4_loc_Grp";
	rename -uid "6C61DF97-4D8C-8B40-B2AC-4C811C331CD5";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle4";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "4";
	setAttr ".rig_side" -type "string" "L";
createNode locator -n "L_middle4_locShape" -p "L_middle4_loc";
	rename -uid "2FD18698-41C6-D7CA-1AF0-648A7BBFB32C";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_middle_aimVector_Grp" -p "L_middle1_loc";
	rename -uid "82CBEFB9-4297-C710-47BD-FA91AB704D92";
createNode transform -n "L_middle_aimVector" -p "L_middle_aimVector_Grp";
	rename -uid "F60CA5EB-4CC7-ECB7-BF8C-7AA3E9B87DBA";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
createNode nurbsCurve -n "L_middle_aimVectorShape" -p "L_middle_aimVector";
	rename -uid "06A68EFC-410D-131D-9FA2-A4A82E408D1F";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-1.0227235724968863e-16 -0.30706249999999985 0
		0.3070624999999999 -1.0227235724968863e-16 1.0227235724968863e-16
		1.0227235724968863e-16 0.30706249999999985 0
		2.0454471449937726e-16 0.6141249999999997 0
		0.61412499999999981 -2.0454471449937726e-16 2.0454471449937726e-16
		-2.0454471449937726e-16 -0.6141249999999997 0
		-1.0227235724968863e-16 -0.30706249999999985 0
		;
createNode aimConstraint -n "L_middle_aimVector_Grp_aimConstraint1" -p "L_middle_aimVector_Grp";
	rename -uid "3CA596D3-423B-A8CD-6EBB-CBB754864393";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_middle2_locW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr -k on ".w0";
createNode parentConstraint -n "L_handRoot_mirror_parentConstraint1" -p "L_handRoot_mirror";
	rename -uid "56FC6BDC-494B-5222-1DE7-D5A5CC6115B1";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "L_wrist_locW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0.99999999999999645 -7.1054273576010019e-15 
		0 ;
	setAttr ".rst" -type "double3" 17.999999999999996 43.999999999999993 0 ;
	setAttr -k on ".w0";
createNode transform -n "R_hand_nonParent";
	rename -uid "95C83DDC-4CAE-B75F-CBD7-D4A50BC41F5A";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_index_Crv" -p "R_hand_nonParent";
	rename -uid "A506313C-434B-EE14-4CD9-4F9875396D24";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_index_CrvShape" -p "R_index_Crv";
	rename -uid "35EE2722-42AA-1DAE-62C0-12A09CDBD46F";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 0.25 0.5 0.75 1
		5
		-18.999999999999996 43.999999999999993 0.5
		-20.499999999999996 43.999999999999993 0.5
		-21.834000000000003 43.999999999999993 0.5
		-23.166000000000004 43.999999999999993 0.5
		-24.499999999999996 43.999999999999993 0.5
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_middle_Crv" -p "R_hand_nonParent";
	rename -uid "43B1B1A8-4003-6AC1-39FA-BE941B6DB498";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_middle_CrvShape" -p "R_middle_Crv";
	rename -uid "2ECF1386-4C11-79D8-7B0A-9D9B26F54DE8";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 0.25 0.5 0.75 1
		5
		-18.999999999999996 43.999999999999993 0
		-20.499999999999996 43.999999999999993 0
		-21.834000000000003 43.999999999999993 0
		-23.166000000000004 43.999999999999993 0
		-24.499999999999996 43.999999999999993 0
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_ring_Crv" -p "R_hand_nonParent";
	rename -uid "E0F57E3A-4BAE-F252-7EF3-6F8806C0AD29";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_ring_CrvShape" -p "R_ring_Crv";
	rename -uid "85CE0109-4F21-0BE0-EC6B-A7B34DEA9605";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 0.25 0.5 0.75 1
		5
		-18.999999999999996 43.999999999999993 -0.5
		-20.499999999999996 43.999999999999993 -0.5
		-21.834000000000003 43.999999999999993 -0.5
		-23.166000000000004 43.999999999999993 -0.5
		-24.499999999999996 43.999999999999993 -0.5
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_pinky_Crv" -p "R_hand_nonParent";
	rename -uid "BEAAFC7B-4AB5-A0CB-9389-96AB0F9F023D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_pinky_CrvShape" -p "R_pinky_Crv";
	rename -uid "F8F08D11-4217-C91A-4FDD-A4906E9D5BFB";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 0.25 0.5 0.75 1
		5
		-18.999999999999996 43.999999999999993 -1
		-20.499999999999996 43.999999999999993 -1
		-21.834000000000003 43.999999999999993 -1
		-23.166000000000004 43.999999999999993 -1
		-24.499999999999996 43.999999999999993 -1
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_thumb_Crv" -p "R_hand_nonParent";
	rename -uid "683792F3-4623-ADD6-5FDA-C3B89D532069";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_thumb_CrvShape" -p "R_thumb_Crv";
	rename -uid "30389C63-461A-FFDF-2CF5-15BBAD49A9FF";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr -k off ".v";
	setAttr -s 4 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 1 2 3
		4
		-18.999999999999996 43.999999999999993 1
		-20.499999999999996 43.999999999999993 1
		-21.833000000000002 43.999999999999993 1
		-23.165999999999997 43.999999999999993 1
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
createNode transform -n "R_handRoot_mirror";
	rename -uid "25AFD138-4F51-D372-3D87-9096D5E13FE5";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".s" -type "double3" -1 1 1 ;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_attachBoneType" -type "string" "arm_type";
	setAttr ".rig_attachSide" -type "string" "R";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "wrist";
createNode transform -n "L_handRoot_loc_Grp" -p "R_handRoot_mirror";
	rename -uid "CD4702F2-4D9F-7EFB-C18F-60A88A6A8B8F";
createNode transform -n "R_handRoot_loc" -p "|R_handRoot_mirror|L_handRoot_loc_Grp";
	rename -uid "48EB096A-43D9-1966-F0E0-ACA03546960E";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
createNode locator -n "R_handRoot_locShape" -p "R_handRoot_loc";
	rename -uid "1A46850F-41E6-C4E9-B86E-1DA0BAD7900A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_thumbRoot_loc_Grp" -p "R_handRoot_loc";
	rename -uid "FA81DA90-4455-ABAF-CE6E-6B8CB6FF4585";
	setAttr ".t" -type "double3" 1 0 1 ;
createNode transform -n "R_thumbRoot_loc" -p "R_thumbRoot_loc_Grp";
	rename -uid "1B7563DE-4132-3932-7C4B-13962772EC53";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumbRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_attachBoneType" -type "string" "arm_type";
	setAttr ".rig_attachSide" -type "string" "R";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "wrist";
createNode locator -n "R_thumbRoot_locShape" -p "R_thumbRoot_loc";
	rename -uid "225A6027-4933-DBFD-F8E4-B0AA456DB0AA";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_thumb1_loc_Grp" -p "R_thumbRoot_loc";
	rename -uid "9134D068-42D9-4578-FA90-0381E6F57CB7";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "R_thumb1_loc" -p "R_thumb1_loc_Grp";
	rename -uid "81E46C52-4845-FC0D-9F5B-7AB405CFC70D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_thumb1_locShape" -p "R_thumb1_loc";
	rename -uid "4578F4B9-479E-4618-0011-3F9877E10F96";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_thumb2_loc_Grp" -p "R_thumb1_loc";
	rename -uid "03F61358-43F6-7E83-2287-98B8B73A9382";
createNode transform -n "R_thumb2_loc" -p "R_thumb2_loc_Grp";
	rename -uid "70EA5220-4D4D-2BAB-A638-EABE3A7C8DD9";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_thumb2_locShape" -p "R_thumb2_loc";
	rename -uid "E260B8E7-4A89-5EB8-5B7D-88A64333451D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_thumb2_loc_Grp_pointConstraint1" -p "R_thumb2_loc_Grp";
	rename -uid "08DDF2AF-47AA-763B-514D-AA906B579A56";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_thumb3_locW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_thumb1_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".rst" -type "double3" 2 0 0 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "R_thumb3_loc_Grp" -p "R_thumb1_loc";
	rename -uid "28D3EFEC-4C39-E3F4-B4C8-18A1CC1B9468";
	setAttr ".t" -type "double3" 2.666 0 0 ;
createNode transform -n "R_thumb3_loc" -p "R_thumb3_loc_Grp";
	rename -uid "104A1CA2-4472-D008-82C9-5E81F9034506";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb3";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "3";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_thumb3_locShape" -p "R_thumb3_loc";
	rename -uid "3029FDF8-4253-936A-0CAE-AB9CA6AA44AA";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_thumb_aimVector_Grp" -p "R_thumb1_loc";
	rename -uid "9D09CCC7-4206-45C0-3766-EE9CF8EC2426";
createNode transform -n "R_thumb_aimVector" -p "R_thumb_aimVector_Grp";
	rename -uid "C53A6D82-478B-9B93-D852-3FB1D748EBD1";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_thumb_aimVectorShape" -p "R_thumb_aimVector";
	rename -uid "FDCFC4DD-4081-755A-4916-DBB7ED66F17A";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-1.0227235724968863e-16 -0.30706249999999985 0
		0.3070624999999999 -1.0227235724968863e-16 1.0227235724968863e-16
		1.0227235724968863e-16 0.30706249999999985 0
		2.0454471449937726e-16 0.6141249999999997 0
		0.61412499999999981 -2.0454471449937726e-16 2.0454471449937726e-16
		-2.0454471449937726e-16 -0.6141249999999997 0
		-1.0227235724968863e-16 -0.30706249999999985 0
		;
createNode aimConstraint -n "R_thumb_aimVector_Grp_aimConstraint1" -p "R_thumb_aimVector_Grp";
	rename -uid "E6613EA5-478C-06A6-6C17-938BDB49C0A0";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_thumb2_locW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr -k on ".w0";
createNode transform -n "R_pinkyRoot_loc_Grp" -p "R_handRoot_loc";
	rename -uid "703972FC-4594-50D7-62FE-22A034D6A68F";
	setAttr ".t" -type "double3" 1 0 -1 ;
createNode transform -n "R_pinkyRoot_loc" -p "R_pinkyRoot_loc_Grp";
	rename -uid "37EFB7A3-4649-E099-84D4-918DF4B35A56";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinkyRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_attachBoneType" -type "string" "arm_type";
	setAttr ".rig_attachSide" -type "string" "R";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "wrist";
createNode locator -n "R_pinkyRoot_locShape" -p "R_pinkyRoot_loc";
	rename -uid "EBF48C91-435A-F2EE-48DC-65B0D472340E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_pinky1_loc_Grp" -p "R_pinkyRoot_loc";
	rename -uid "F766B69F-4ACC-D3C7-3991-77B0AC8DB755";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "R_pinky1_loc" -p "R_pinky1_loc_Grp";
	rename -uid "B08252A6-4733-78A5-4F50-22B5DB29825A";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_pinky1_locShape" -p "R_pinky1_loc";
	rename -uid "84361A54-4ACC-F0D3-9C84-988D521995EF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_pinky2_loc_Grp" -p "R_pinky1_loc";
	rename -uid "B819D815-4E17-EF9A-DBF0-3CB656158FCF";
createNode transform -n "R_pinky2_loc" -p "R_pinky2_loc_Grp";
	rename -uid "77207B26-454A-FD80-734D-1EB0EEB78DD8";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_pinky2_locShape" -p "R_pinky2_loc";
	rename -uid "ABD23071-4FF1-7E84-B415-5692A0A40582";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_pinky2_loc_Grp_pointConstraint1" -p "R_pinky2_loc_Grp";
	rename -uid "DD82CFF4-424F-4BDC-2958-D2B4C85CE639";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_pinky1_locW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_pinky4_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" 0.0019999999999988916 0 0 ;
	setAttr ".rst" -type "double3" 2 0 0 ;
	setAttr -k on ".w0" 0.667;
	setAttr -k on ".w1" 0.333;
createNode transform -n "R_pinky3_loc_Grp" -p "R_pinky1_loc";
	rename -uid "55F232F6-4B1B-AC79-7F76-21AA8BF2DA0F";
createNode transform -n "R_pinky3_loc" -p "R_pinky3_loc_Grp";
	rename -uid "9715C603-4011-7770-5030-F28C85547B80";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky3";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "3";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_pinky3_locShape" -p "R_pinky3_loc";
	rename -uid "269D7E22-48CD-3094-841E-EE81452EB37E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_pinky3_loc_Grp_pointConstraint1" -p "R_pinky3_loc_Grp";
	rename -uid "CAFFA1E6-4560-4DD4-EDD5-47987EBE001F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_pinky1_locW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_pinky4_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" -0.0019999999999988916 0 0 ;
	setAttr ".rst" -type "double3" 4 0 0 ;
	setAttr -k on ".w0" 0.333;
	setAttr -k on ".w1" 0.667;
createNode transform -n "R_pinky4_loc_Grp" -p "R_pinky1_loc";
	rename -uid "27E1456C-4074-D5C1-95DF-8CA59DA2D2AE";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "R_pinky4_loc" -p "R_pinky4_loc_Grp";
	rename -uid "CF7264FE-4A66-B23E-C1AF-F4B96F854737";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky4";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "4";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_pinky4_locShape" -p "R_pinky4_loc";
	rename -uid "9E3D806F-4F0E-68C5-B623-23971A149D2D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_pinky_aimVector_Grp" -p "R_pinky1_loc";
	rename -uid "A858BB10-45FE-1F52-9386-94B2A114B748";
createNode transform -n "R_pinky_aimVector" -p "R_pinky_aimVector_Grp";
	rename -uid "CEA51F50-40C3-A727-23E6-7184AAA5150D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_pinky_aimVectorShape" -p "R_pinky_aimVector";
	rename -uid "1B1F8684-4B1E-5C40-D84C-A7AEF68C238B";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-1.0227235724968863e-16 -0.30706249999999985 0
		0.3070624999999999 -1.0227235724968863e-16 1.0227235724968863e-16
		1.0227235724968863e-16 0.30706249999999985 0
		2.0454471449937726e-16 0.6141249999999997 0
		0.61412499999999981 -2.0454471449937726e-16 2.0454471449937726e-16
		-2.0454471449937726e-16 -0.6141249999999997 0
		-1.0227235724968863e-16 -0.30706249999999985 0
		;
createNode aimConstraint -n "R_pinky_aimVector_Grp_aimConstraint1" -p "R_pinky_aimVector_Grp";
	rename -uid "A8A44621-4DFA-F8CA-0046-3386C699A1D9";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_pinky2_locW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr -k on ".w0";
createNode transform -n "R_ringRoot_loc_Grp" -p "R_handRoot_loc";
	rename -uid "0ED61F16-490D-A018-AF88-17807DFAE110";
	setAttr ".t" -type "double3" 1 0 -0.5 ;
createNode transform -n "R_ringRoot_loc" -p "R_ringRoot_loc_Grp";
	rename -uid "FC1942DB-4929-F41A-307E-E686E2EE5D7B";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ringRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_attachBoneType" -type "string" "arm_type";
	setAttr ".rig_attachSide" -type "string" "R";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "wrist";
createNode locator -n "R_ringRoot_locShape" -p "R_ringRoot_loc";
	rename -uid "7B1476B9-4BB3-51C8-F6F0-4E9C7794214C";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_ring1_loc_Grp" -p "R_ringRoot_loc";
	rename -uid "E9D14F7B-4CD7-4067-0774-B49C6A8A6163";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "R_ring1_loc" -p "R_ring1_loc_Grp";
	rename -uid "D8BB0A5B-4D7A-2F70-F648-BDBC034A180A";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_ring1_locShape" -p "R_ring1_loc";
	rename -uid "9D6CF214-4AC6-E81E-4D90-F481427C54E5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_ring2_loc_Grp" -p "R_ring1_loc";
	rename -uid "19433485-4AA6-45B0-419E-EB992E87EEC2";
createNode transform -n "R_ring2_loc" -p "R_ring2_loc_Grp";
	rename -uid "CE588017-4F1B-1D20-CA7A-AC92B1A47175";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_ring2_locShape" -p "R_ring2_loc";
	rename -uid "BCE46910-4E07-F899-BED2-43A58692748F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_ring2_loc_Grp_pointConstraint1" -p "R_ring2_loc_Grp";
	rename -uid "B1ED1083-4202-3030-F448-CE86FD91094F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_ring1_locW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_ring4_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" 0.0019999999999988916 0 0 ;
	setAttr ".rst" -type "double3" 2 0 0 ;
	setAttr -k on ".w0" 0.667;
	setAttr -k on ".w1" 0.333;
createNode transform -n "R_ring3_loc_Grp" -p "R_ring1_loc";
	rename -uid "A4685A39-4D41-EC44-DC2E-4F8E5B0BA84C";
createNode transform -n "R_ring3_loc" -p "R_ring3_loc_Grp";
	rename -uid "ABB994CD-4183-679A-5DC5-C4A659E40BD1";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring3";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "3";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_ring3_locShape" -p "R_ring3_loc";
	rename -uid "9BB3C813-4552-2852-618D-438A7FA514F0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_ring3_loc_Grp_pointConstraint1" -p "R_ring3_loc_Grp";
	rename -uid "CE43EADE-4ECF-2595-B75F-F3AFFC43FD50";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_ring1_locW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_ring4_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" -0.0019999999999988916 0 0 ;
	setAttr ".rst" -type "double3" 4 0 0 ;
	setAttr -k on ".w0" 0.333;
	setAttr -k on ".w1" 0.667;
createNode transform -n "R_ring4_loc_Grp" -p "R_ring1_loc";
	rename -uid "2441648C-4EC3-A5A6-68A1-929EB766B995";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "R_ring4_loc" -p "R_ring4_loc_Grp";
	rename -uid "5E7226C5-4ADD-23D0-F732-E2A0BB284D54";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring4";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "4";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_ring4_locShape" -p "R_ring4_loc";
	rename -uid "43DC962C-4575-57C0-3211-B7B2C37485C7";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_ring_aimVector_Grp" -p "R_ring1_loc";
	rename -uid "E516D669-41A9-8F6C-288C-E9BE6B990199";
createNode transform -n "R_ring_aimVector" -p "R_ring_aimVector_Grp";
	rename -uid "9693F1D9-4827-219F-FF29-09B36960F7F9";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_ring_aimVectorShape" -p "R_ring_aimVector";
	rename -uid "1487A407-4FAA-BA1A-C446-B2A670379BA9";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-1.0227235724968863e-16 -0.30706249999999985 0
		0.3070624999999999 -1.0227235724968863e-16 1.0227235724968863e-16
		1.0227235724968863e-16 0.30706249999999985 0
		2.0454471449937726e-16 0.6141249999999997 0
		0.61412499999999981 -2.0454471449937726e-16 2.0454471449937726e-16
		-2.0454471449937726e-16 -0.6141249999999997 0
		-1.0227235724968863e-16 -0.30706249999999985 0
		;
createNode aimConstraint -n "R_ring_aimVector_Grp_aimConstraint1" -p "R_ring_aimVector_Grp";
	rename -uid "40EDDAA5-4833-6C93-DF30-53B0205588F6";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_ring2_locW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr -k on ".w0";
createNode transform -n "R_indexRoot_loc_Grp" -p "R_handRoot_loc";
	rename -uid "BF378A55-47A7-1DDE-F68A-D3BFE71743A3";
	setAttr ".t" -type "double3" 1 0 0.5 ;
createNode transform -n "R_indexRoot_loc" -p "R_indexRoot_loc_Grp";
	rename -uid "1A1F361D-4946-BD44-A836-6C9C850BD921";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "indexRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_attachBoneType" -type "string" "arm_type";
	setAttr ".rig_attachSide" -type "string" "R";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "wrist";
createNode locator -n "R_indexRoot_locShape" -p "R_indexRoot_loc";
	rename -uid "F781B630-4080-353A-5E3B-CC950326207C";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_index1_loc_Grp" -p "R_indexRoot_loc";
	rename -uid "13B7B247-4E20-4120-8E85-559E93A209BF";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "R_index1_loc" -p "R_index1_loc_Grp";
	rename -uid "E7CDE9B1-40CA-7661-5E02-56ADB3A892DD";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_index1_locShape" -p "R_index1_loc";
	rename -uid "B6DC709D-40E0-B0AE-3B3E-C7B7ACAE1D68";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_index2_loc_Grp" -p "R_index1_loc";
	rename -uid "77EE7674-4400-D075-77FA-B3ACBB8B6B5F";
createNode transform -n "R_index2_loc" -p "R_index2_loc_Grp";
	rename -uid "F9C086D1-435E-D8E4-4960-4AB351239B29";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_index2_locShape" -p "R_index2_loc";
	rename -uid "A6CB49CF-4A63-226F-2C9E-47B094F933A9";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_index2_loc_Grp_pointConstraint1" -p "R_index2_loc_Grp";
	rename -uid "E6B5657D-4CA3-1145-BC9C-718E992F72C1";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_index1_locW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_index4_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" 0.0019999999999988916 0 0 ;
	setAttr ".rst" -type "double3" 2 0 0 ;
	setAttr -k on ".w0" 0.667;
	setAttr -k on ".w1" 0.333;
createNode transform -n "R_index3_loc_Grp" -p "R_index1_loc";
	rename -uid "D5C3014D-47ED-54CF-0A67-F3A5A0806B43";
createNode transform -n "R_index3_loc" -p "R_index3_loc_Grp";
	rename -uid "80F8B8B7-4AE4-175B-7F33-CC9BF4AB64E7";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index3";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "3";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_index3_locShape" -p "R_index3_loc";
	rename -uid "89B12309-40E2-2898-09CD-5F87D610282D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_index3_loc_Grp_pointConstraint1" -p "R_index3_loc_Grp";
	rename -uid "997C7AB8-4149-AAFE-CFB8-F3BDE49A5F3D";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_index1_locW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_index4_locW1" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" -0.0019999999999988916 0 0 ;
	setAttr ".rst" -type "double3" 4 0 0 ;
	setAttr -k on ".w0" 0.333;
	setAttr -k on ".w1" 0.667;
createNode transform -n "R_index4_loc_Grp" -p "R_index1_loc";
	rename -uid "D93ABE01-42FF-4418-E2F8-59951EFA8E9D";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "R_index4_loc" -p "R_index4_loc_Grp";
	rename -uid "0A8F71D9-4151-A797-8905-1B9385CF3CA2";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index4";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "4";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_index4_locShape" -p "R_index4_loc";
	rename -uid "72B7B223-4658-686A-F1B7-43BB030F63B2";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_index_aimVector_Grp" -p "R_index1_loc";
	rename -uid "48E484B9-43EC-61D3-CB42-7681F1609E34";
createNode transform -n "R_index_aimVector" -p "R_index_aimVector_Grp";
	rename -uid "F62301D3-4A80-825B-25B4-D980C4E116A8";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_index_aimVectorShape" -p "R_index_aimVector";
	rename -uid "28F6C12E-49A6-E80C-CFE3-B492C935EE0A";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-1.0227235724968863e-16 -0.30706249999999985 0
		0.3070624999999999 -1.0227235724968863e-16 1.0227235724968863e-16
		1.0227235724968863e-16 0.30706249999999985 0
		2.0454471449937726e-16 0.6141249999999997 0
		0.61412499999999981 -2.0454471449937726e-16 2.0454471449937726e-16
		-2.0454471449937726e-16 -0.6141249999999997 0
		-1.0227235724968863e-16 -0.30706249999999985 0
		;
createNode aimConstraint -n "R_index_aimVector_Grp_aimConstraint1" -p "R_index_aimVector_Grp";
	rename -uid "31077A36-441E-1D4D-CFC6-22BA68B56A36";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_index2_locW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr -k on ".w0";
createNode transform -n "R_middleRoot_loc_Grp" -p "R_handRoot_loc";
	rename -uid "20B34ADC-47DC-56D5-8D98-2298753A98AB";
	setAttr ".t" -type "double3" 1 0 0 ;
createNode transform -n "R_middleRoot_loc" -p "R_middleRoot_loc_Grp";
	rename -uid "CA8081C8-4CDD-78B5-B8AC-E1A4F7C7065E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middleRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_attachBoneType" -type "string" "arm_type";
	setAttr ".rig_attachSide" -type "string" "R";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "wrist";
createNode locator -n "R_middleRoot_locShape" -p "R_middleRoot_loc";
	rename -uid "EF02A230-4478-C77A-EE70-3F9E6B347A98";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_middle1_loc_Grp" -p "R_middleRoot_loc";
	rename -uid "B5931962-4FD6-E64B-18A5-89B8274D1F48";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "R_middle1_loc" -p "R_middle1_loc_Grp";
	rename -uid "CDC6C622-4B56-A516-74E6-BC9B10116E97";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_middle1_locShape" -p "R_middle1_loc";
	rename -uid "A3BC21B3-40E3-35AA-A5DB-2B9206EAC53E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_middle2_loc_Grp" -p "R_middle1_loc";
	rename -uid "DC90AAAF-4477-4E26-5399-CEA894B8FDA1";
createNode transform -n "R_middle2_loc" -p "R_middle2_loc_Grp";
	rename -uid "771551FA-491E-C7DE-4C94-528167C068BB";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "2";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_middle2_locShape" -p "R_middle2_loc";
	rename -uid "099DE002-466C-248E-BD8C-F58A4AEEA486";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_middle2_loc_Grp_pointConstraint1" -p "R_middle2_loc_Grp";
	rename -uid "131AD65B-40F5-6FDC-67CE-7D908A99D3B9";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_middle1_locW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_middle4_locW1" -dv 1 -min 0 
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
	setAttr ".o" -type "double3" 0.0019999999999988916 0 0 ;
	setAttr ".rst" -type "double3" 2 0 0 ;
	setAttr -k on ".w0" 0.667;
	setAttr -k on ".w1" 0.333;
createNode transform -n "R_middle3_loc_Grp" -p "R_middle1_loc";
	rename -uid "5C4A7531-4730-08FC-5691-E989076D85AF";
createNode transform -n "R_middle3_loc" -p "R_middle3_loc_Grp";
	rename -uid "48C56B24-4605-CB81-7E3A-C8AE77B86FAE";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle3";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "3";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_middle3_locShape" -p "R_middle3_loc";
	rename -uid "8C8F5356-4E62-837C-B43A-AC80F58A44CE";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_middle3_loc_Grp_pointConstraint1" -p "R_middle3_loc_Grp";
	rename -uid "A1F5EE63-40BB-4F26-4EB3-BD9DEE9024BD";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "Guide_middle1_locW0" -dv 1 -min 0 
		-at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "Guide_middle4_locW1" -dv 1 -min 0 
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
	setAttr ".o" -type "double3" -0.0019999999999988916 0 0 ;
	setAttr ".rst" -type "double3" 4 0 0 ;
	setAttr -k on ".w0" 0.333;
	setAttr -k on ".w1" 0.667;
createNode transform -n "R_middle4_loc_Grp" -p "R_middle1_loc";
	rename -uid "27B87D8D-44E4-D04A-5234-FC9B7ED79491";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "R_middle4_loc" -p "R_middle4_loc_Grp";
	rename -uid "0E43D665-418A-0271-EC04-0A835628AF83";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle4";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_index" -type "string" "4";
	setAttr ".rig_side" -type "string" "R";
createNode locator -n "R_middle4_locShape" -p "R_middle4_loc";
	rename -uid "F3587B9F-473C-950F-B200-0F8D7A7078D7";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_middle_aimVector_Grp" -p "R_middle1_loc";
	rename -uid "F761D504-43FC-8543-F204-CA8A6AA82AC1";
createNode transform -n "R_middle_aimVector" -p "R_middle_aimVector_Grp";
	rename -uid "BA910568-43DE-9BBC-6C06-3AA7E5519FD8";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
createNode nurbsCurve -n "R_middle_aimVectorShape" -p "R_middle_aimVector";
	rename -uid "264CCBC4-4980-D1CD-5C63-719E62A3E0C8";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 6 0 no 3
		7 0 1 2 3 4 5 6
		7
		-1.0227235724968863e-16 -0.30706249999999985 0
		0.3070624999999999 -1.0227235724968863e-16 1.0227235724968863e-16
		1.0227235724968863e-16 0.30706249999999985 0
		2.0454471449937726e-16 0.6141249999999997 0
		0.61412499999999981 -2.0454471449937726e-16 2.0454471449937726e-16
		-2.0454471449937726e-16 -0.6141249999999997 0
		-1.0227235724968863e-16 -0.30706249999999985 0
		;
createNode aimConstraint -n "R_middle_aimVector_Grp_aimConstraint1" -p "R_middle_aimVector_Grp";
	rename -uid "B95CDB99-4A9A-3B9C-D64C-29A37C95D4CD";
	addAttr -dcb 0 -ci true -sn "w0" -ln "Guide_middle2_locW0" -dv 1 -at "double";
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
	setAttr ".wut" 2;
	setAttr -k on ".w0";
createNode parentConstraint -n "R_handRoot_mirror_parentConstraint1" -p "R_handRoot_mirror";
	rename -uid "FEF99B9D-4F7D-CCB6-E6E8-86AFA55AA028";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "R_wrist_locW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 0.99999999999999645 -7.1054273576010019e-15 
		0 ;
	setAttr ".tg[0].tor" -type "double3" 180 0 0 ;
	setAttr ".rst" -type "double3" -17.999999999999996 43.999999999999993 0 ;
	setAttr -k on ".w0";
createNode transform -n "head_nonParent";
	rename -uid "CCCB4187-429D-88EC-CA5D-65AAB10AE8ED";
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
	rename -uid "1A5C3CA0-4A9D-6E0C-D2A0-1899975A40F4";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "jaw_curveShape" -p "jaw_curve";
	rename -uid "A1DE65EA-4858-BE79-5181-D5A81811227B";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 49 3
		0 45 7
		;
createNode transform -n "gumA_curve" -p "head_nonParent";
	rename -uid "A21F16A5-4F92-2574-2F64-E29384ED14BF";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "gumA_curveShape" -p "gumA_curve";
	rename -uid "B857DC9D-4F1C-7AF4-0356-24BB011B1F2E";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 49 3
		0 46 5
		;
createNode transform -n "gumB_curve" -p "head_nonParent";
	rename -uid "792E1953-4191-10CA-23CA-13A1EE35D9CA";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "gumB_curveShape" -p "gumB_curve";
	rename -uid "01B19FA8-4447-7D0A-004F-6EB79C850FAE";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 49 3
		0 49 5
		;
createNode transform -n "tongue_curve" -p "head_nonParent";
	rename -uid "172FA266-4C7F-0E8B-28D7-E98E7735B5A1";
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
	setAttr ".rig_boneType" -type "string" "tongue_type";
createNode nurbsCurve -n "tongue_curveShape" -p "tongue_curve";
	rename -uid "73DA7A22-4A96-E74D-86BC-8C85F45D5078";
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
		0 46 3
		0 46.583717346191406 3.2839615345001221
		0 47.892116546630859 4.2496929168701172
		0 48.095920562744141 6.0671091079711914
		0 48 7
		;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "tongue";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "tongue_type_type";
createNode transform -n "tonguePivot_curve" -p "head_nonParent";
	rename -uid "01DA4478-4B0F-1C4D-80A5-EBAC7B5B4DB6";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "tonguePivot_curveShape" -p "tonguePivot_curve";
	rename -uid "E89DCD5E-4B85-9F53-E382-6388CD9ECD17";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 46 3
		0 46 4
		;
createNode transform -n "L_eye_curve" -p "head_nonParent";
	rename -uid "5C8EC37E-4B6B-54E0-A745-778FCDBF7ABE";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_eye_curveShape" -p "L_eye_curve";
	rename -uid "E16D28AC-4A81-E118-22C3-C6B4AF37E673";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		3 56 5
		3 56 7
		;
createNode transform -n "L_eyeAim_curve" -p "head_nonParent";
	rename -uid "85D4DBAD-4205-15EF-28A4-6C8CE4E1F2F9";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_eyeAim_curveShape" -p "L_eyeAim_curve";
	rename -uid "F5F2F507-4E42-7101-85BC-31AE2D32461F";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		3 56 5
		3 56 17
		;
createNode transform -n "R_eye_curve" -p "head_nonParent";
	rename -uid "801514AA-4BB7-DAE6-5FF9-A684D9FA4006";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_eye_curveShape" -p "R_eye_curve";
	rename -uid "BC0C8130-4F95-0DE2-6C46-12895038E658";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-3 56 5
		-3.0000000000000004 56 7
		;
createNode transform -n "R_eyeAim_curve" -p "head_nonParent";
	rename -uid "33F41E98-43C2-D043-5305-2C9B60104E07";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_eyeAim_curveShape" -p "R_eyeAim_curve";
	rename -uid "D2E4E7BC-4374-C7AB-BF41-BB83A608228A";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-3 56 5
		-3.0000000000000022 56 17
		;
createNode transform -n "head_mirror";
	rename -uid "A294A320-47BD-C05C-816B-EF9A26EB1673";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "head_type";
	setAttr ".rig_attachBoneType" -type "string" "neck_type";
	setAttr ".rig_attachSide" -type "string" "C";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "neckEnd";
createNode transform -n "head_loc_Grp" -p "head_mirror";
	rename -uid "EBE09B81-4B84-7C41-56D9-83B46A4B589F";
createNode transform -n "head_loc" -p "head_loc_Grp";
	rename -uid "3CFF6DF8-451C-6D17-9CCE-C6BA3889ACFE";
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
	rename -uid "C105B302-4839-C261-6B42-0A97616FABA0";
	setAttr -k off ".v";
createNode transform -n "headA_loc_Grp" -p "head_loc";
	rename -uid "E5AD88F7-4F4B-D551-56F0-658CE1EBA511";
	setAttr ".t" -type "double3" 0 -1 2 ;
createNode transform -n "headA_loc" -p "headA_loc_Grp";
	rename -uid "FC8C9758-4AD1-9B8D-1148-4D8BCD9CD839";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 28;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "headA";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "head_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_attachBoneType" -type "string" "head_type";
	setAttr ".rig_attachSide" -type "string" "C";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "head";
createNode locator -n "headA_locShape" -p "headA_loc";
	rename -uid "5B6CCD1B-4B58-489B-A9A1-C59DF3BCB224";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "jaw_loc_Grp" -p "headA_loc";
	rename -uid "559ED1C9-4DEA-BFCE-29F7-29A897834896";
	setAttr ".t" -type "double3" 0 -1 1 ;
createNode transform -n "jaw_loc" -p "jaw_loc_Grp";
	rename -uid "C3E4C085-43B2-3713-F593-D7AB002F3CAB";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 28;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "jaw";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "jaw_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr ".rig_attachBoneType" -type "string" "head_type";
	setAttr ".rig_attachSide" -type "string" "C";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "headA";
createNode locator -n "jaw_locShape" -p "jaw_loc";
	rename -uid "9EB7B542-4DB0-E2E6-1D43-538D739C80C8";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "jawEnd_loc_Grp" -p "jaw_loc";
	rename -uid "3D953ADE-4B33-2C93-5FC9-38B1DCD90CA7";
	setAttr ".t" -type "double3" 0 -4 4 ;
createNode transform -n "jawEnd_loc" -p "jawEnd_loc_Grp";
	rename -uid "6D2A3F74-4DFA-B0A4-43F5-5981548D8174";
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
	rename -uid "5DC18135-4D69-91AA-7F22-B0A9C94D80DB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "gumA_loc_Grp" -p "headA_loc";
	rename -uid "7EA9841F-4061-7E86-8B50-0DB9C9E50E40";
	setAttr ".t" -type "double3" 0 -4 3 ;
createNode transform -n "gumA_loc" -p "gumA_loc_Grp";
	rename -uid "07988C5A-4B00-3588-BEA2-818B2EDE2A41";
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
	rename -uid "FCCD7ACE-412A-104D-060B-7F89AD113F8D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "gumB_loc_Grp" -p "headA_loc";
	rename -uid "6E7875E8-43BD-6158-F809-FDA3AA384362";
	setAttr ".t" -type "double3" 0 -1 3 ;
createNode transform -n "gumB_loc" -p "gumB_loc_Grp";
	rename -uid "0D8893CD-48E9-1FFB-89C1-F388B249DB0D";
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
	rename -uid "8FD810F5-4EF0-87D1-7C70-DE92B4B09894";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "tongue1_loc_Grp" -p "headA_loc";
	rename -uid "32603625-4989-44C4-F747-6D87ADAE7697";
	setAttr ".t" -type "double3" 0 -4 1 ;
createNode transform -n "tongue1_loc" -p "tongue1_loc_Grp";
	rename -uid "1E07D806-43E5-46E8-FF53-8682A467D731";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -k true -sn "insertJnt" -ln "insertJnt" -min 0 -at "long";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 16;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "tongue1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "tongue_type";
	setAttr ".rig_index" -type "string" "0";
	setAttr -k on ".insertJnt" 6;
	setAttr ".rig_attachBoneType" -type "string" "head_type";
	setAttr ".rig_attachSide" -type "string" "C";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "headA";
createNode locator -n "tongue1_locShape" -p "tongue1_loc";
	rename -uid "A71E051D-4A48-C29B-149B-CF87A6F7999B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "tongueExtra1_loc_Grp" -p "headA_loc";
	rename -uid "9AF80D82-4938-BB5A-DEF6-F9A81DF02186";
createNode transform -n "tongueExtra1_loc" -p "tongueExtra1_loc_Grp";
	rename -uid "4F5BC9ED-469B-6A6A-F080-AE829A8AB901";
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
	rename -uid "E9D7B07F-4646-3CA8-E9BD-86B5E9023140";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode pointConstraint -n "tongueExtra1_loc_Grp_pointConstraint1" -p "tongueExtra1_loc_Grp";
	rename -uid "6C713C2F-4492-3A51-4CA4-ACA21D91321F";
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
	rename -uid "D1EADADB-4775-7895-0F53-45BED92CEB8C";
createNode transform -n "tongue2_loc" -p "tongue2_loc_Grp";
	rename -uid "BF8480FC-4220-89E4-075B-EA8D3718DD14";
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
	rename -uid "68C65DAA-4F2A-7D25-4710-68A0CD95AA9C";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "tongue2_loc_Grp_pointConstraint1" -p "tongue2_loc_Grp";
	rename -uid "CF6BC8DB-417A-6D9C-1FE8-F5B5C31EDB8E";
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
	rename -uid "5142D2FC-4ECF-C119-291D-ED9B0D2F7D89";
createNode transform -n "tongueExtra2_loc" -p "tongueExtra2_loc_Grp";
	rename -uid "85E8540B-444E-CAA9-2379-059B139EFCE6";
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
	rename -uid "7CE888CB-4205-4A76-2837-598FFD35BF88";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode pointConstraint -n "tongueExtra2_loc_Grp_pointConstraint1" -p "tongueExtra2_loc_Grp";
	rename -uid "22FC41C1-48A6-D9A9-4DAA-7A8A7ED112FC";
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
	rename -uid "F6ECB98A-4D0A-E9BA-4BCE-A9B36468FD6E";
	setAttr ".t" -type "double3" 0 -2 5 ;
createNode transform -n "tongue3_loc" -p "tongue3_loc_Grp";
	rename -uid "A52653F9-4FC1-92F8-09AB-3E9AF9CE10B6";
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
	rename -uid "2DD4F662-457A-FE9D-F0EF-779EB9F1CB19";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "tonguePivot_loc_Grp" -p "headA_loc";
	rename -uid "A250945E-43DA-F311-6CF2-E3992CAC4B98";
	setAttr ".t" -type "double3" 0 -4 2 ;
createNode transform -n "tonguePivot_loc" -p "tonguePivot_loc_Grp";
	rename -uid "4CE2662A-4940-AB39-8749-A58932AE8C24";
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
	rename -uid "B9DBDFD7-4BE2-AE80-D683-E287B8FB853C";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "headB_loc_Grp" -p "head_loc";
	rename -uid "046A6EE1-4C54-7EE8-A14F-CBA1ECCA3B1B";
	setAttr ".t" -type "double3" 0 1 2 ;
createNode transform -n "headB_loc" -p "headB_loc_Grp";
	rename -uid "DB2B9C4A-4690-651B-DA1A-6399A8256B96";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "headB";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "head_type";
	setAttr ".rig_index" -type "string" "1";
	setAttr ".rig_attachBoneType" -type "string" "head_type";
	setAttr ".rig_attachSide" -type "string" "C";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "head";
createNode locator -n "headB_locShape" -p "headB_loc";
	rename -uid "8B91C4F9-4193-2BC3-6CF1-F393D21684B9";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_eyeRoot_mirror" -p "headB_loc";
	rename -uid "8E07834B-4F38-C53D-D96F-B6B72E0041A0";
	setAttr ".t" -type "double3" 3 4 3 ;
createNode transform -n "L_eyeRoot_loc_Grp" -p "L_eyeRoot_mirror";
	rename -uid "62ED5682-4CE7-B14A-9E76-1FB512774CD3";
createNode transform -n "L_eyeRoot_loc" -p "L_eyeRoot_loc_Grp";
	rename -uid "F311BABA-4887-472B-5D1D-1CB9CCF813FE";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
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
	setAttr ".rig_attachBoneType" -type "string" "head_type";
	setAttr ".rig_attachSide" -type "string" "C";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "headB";
createNode locator -n "L_eyeRoot_locShape" -p "L_eyeRoot_loc";
	rename -uid "EAF7E1CA-49CE-908E-614A-AF884655C3D9";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_eye_loc_Grp" -p "L_eyeRoot_loc";
	rename -uid "0BED454F-4768-8420-0B25-8DA695F82AB6";
	setAttr ".v" no;
createNode transform -n "L_eye_loc" -p "L_eye_loc_Grp";
	rename -uid "DF3C7940-4907-1180-C49D-1ABCD7050410";
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
	rename -uid "CE283990-4208-830B-7B88-109C3B3E9FEA";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_eyeEnd_loc_Grp" -p "L_eyeRoot_loc";
	rename -uid "6E72667E-48E8-9D2C-DDFE-8CBBAEBB1A46";
	setAttr ".t" -type "double3" 0 0 2 ;
createNode transform -n "L_eyeEnd_loc" -p "L_eyeEnd_loc_Grp";
	rename -uid "127FAB02-4E96-A136-9C5B-FD9012D3E596";
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
	rename -uid "9DCFDEFD-4B9D-A89E-F0A7-0AB7B08B1FFC";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_eyeAim_loc_Grp" -p "L_eyeRoot_mirror";
	rename -uid "BEAF871D-4DE9-882E-6B8D-D3AFF4FF1886";
createNode transform -n "L_eyeAim_loc" -p "L_eyeAim_loc_Grp";
	rename -uid "284E2D83-42D3-85DB-DE9E-FF9F15D35413";
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
	rename -uid "FC5FFEED-40CC-1FAB-D503-0CAD164FD762";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_eyeAim_loc_Grp_parentConstraint1" -p "L_eyeAim_loc_Grp";
	rename -uid "7E48E317-451E-C0C6-0B0B-1B9E3D779692";
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
	rename -uid "BB11DCF3-44AD-D746-85FA-C683D707B7D2";
	setAttr ".t" -type "double3" -3 4 3 ;
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr ".s" -type "double3" 1 1 -1 ;
createNode transform -n "R_eyeRoot_loc_Grp" -p "R_eyeRoot_mirror";
	rename -uid "4143BC2C-42C6-93D3-2447-6AA227DDDE0C";
createNode transform -n "R_eyeRoot_loc" -p "R_eyeRoot_loc_Grp";
	rename -uid "C4BF4B4B-4671-A3FE-5422-8180934F5233";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
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
	setAttr ".rig_attachBoneType" -type "string" "head_type";
	setAttr ".rig_attachSide" -type "string" "C";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "headB";
createNode locator -n "R_eyeRoot_locShape" -p "R_eyeRoot_loc";
	rename -uid "4E5D9049-41B8-E9DD-461B-C193F1C248B1";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_eye_loc_Grp" -p "R_eyeRoot_loc";
	rename -uid "13A321DF-4E78-A240-8804-6180206F2E36";
	setAttr ".v" no;
createNode transform -n "R_eye_loc" -p "R_eye_loc_Grp";
	rename -uid "3E8FCC74-4A08-7DD7-44FE-CB9EC611BDCA";
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
	rename -uid "AB84C909-47B8-C621-BCE5-B99A89CFF03C";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_eyeEnd_loc_Grp" -p "R_eyeRoot_loc";
	rename -uid "E1D2C792-4696-2AB4-ADFC-05A336956916";
	setAttr ".t" -type "double3" 0 0 2 ;
createNode transform -n "R_eyeEnd_loc" -p "R_eyeEnd_loc_Grp";
	rename -uid "6535C67B-4FD0-A1F7-28DC-069695A0EB39";
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
	rename -uid "A72183D1-4073-2F3D-18CE-C0BDD07C916B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_eyeAim_loc_Grp" -p "R_eyeRoot_mirror";
	rename -uid "A3BB8D44-4070-F599-D80F-8A8A9A1E96A8";
createNode transform -n "R_eyeAim_loc" -p "R_eyeAim_loc_Grp";
	rename -uid "66BFAACE-4784-48FC-7F81-4AAA86238DA0";
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
	rename -uid "FF92FBB5-4B0B-8C53-15B8-D5934CFDC824";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_eyeAim_loc_Grp_parentConstraint1" -p "R_eyeAim_loc_Grp";
	rename -uid "A3FF1937-4E2B-275A-4C18-5A84ECBAF666";
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
	rename -uid "5F0E2333-43F0-0038-DB0F-CF807C905AFC";
	setAttr ".t" -type "double3" -6.6613381477509392e-16 4 15 ;
createNode transform -n "C_eye_loc" -p "C_eye_loc_Grp";
	rename -uid "B1B6C3B0-45EF-9AF9-03D6-5D8331A697E0";
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
	rename -uid "D9560560-4DC0-0AD0-57F4-D0B3E123F981";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "nose_loc_Grp" -p "headB_loc";
	rename -uid "1C4FE3D2-495B-F25D-5C1D-EAACA270C54D";
	setAttr ".t" -type "double3" 0 -1 5 ;
createNode transform -n "nose_loc" -p "nose_loc_Grp";
	rename -uid "EDB34D5B-4E24-D63F-E263-17B5839207DA";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	addAttr -ci true -sn "rig_attachBoneType" -ln "rig_attachBoneType" -dt "string";
	addAttr -ci true -sn "rig_attachSide" -ln "rig_attachSide" -dt "string";
	addAttr -ci true -sn "rig_attachAlp" -ln "rig_attachAlp" -dt "string";
	addAttr -ci true -sn "rig_attachRole" -ln "rig_attachRole" -dt "string";
	addAttr -ci true -sn "rig_attachData" -ln "rig_attachData" -dt "string";
	addAttr -ci true -sn "rig_attachPart" -ln "rig_attachPart" -dt "string";
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
	setAttr ".rig_attachBoneType" -type "string" "head_type";
	setAttr ".rig_attachSide" -type "string" "C";
	setAttr ".rig_attachAlp" -type "string" "A";
	setAttr ".rig_attachRole" -type "string" "main";
	setAttr ".rig_attachData" -type "string" "loc";
	setAttr ".rig_attachPart" -type "string" "headB";
createNode locator -n "nose_locShape" -p "nose_loc";
	rename -uid "AE01CF0B-4E27-27E2-126B-C6944680EBB6";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode parentConstraint -n "head_mirror_parentConstraint1" -p "head_mirror";
	rename -uid "9AFE0F09-4F93-C35A-3DD5-52B1192D67A9";
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
	setAttr ".tg[0].tot" -type "double3" 0 6 0 ;
	setAttr ".rst" -type "double3" 0 51 0 ;
	setAttr -k on ".w0";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "EE984259-48BC-B16B-6230-5791C465F14F";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "BD3004E0-4B7F-794A-EAD3-04B2EAA351BF";
createNode displayLayer -n "defaultLayer";
	rename -uid "287D8167-4032-53EE-4996-8685FE0C83E8";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "CBB018CE-4777-8FA9-137C-2EAB26BF5308";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "F04BB8FA-4375-B4F3-1D64-59B7C4140232";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager1";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer1";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager4";
	rename -uid "DBCEDBE8-4805-E6DF-BF25-ABB8E981E4EA";
createNode poseInterpolatorManager -n "poseInterpolatorManager4";
	rename -uid "4B0C3BEF-4A2E-CB5D-0DEF-7EAD0CEE08B8";
createNode renderLayerManager -n "renderLayerManager2";
	rename -uid "2204E19E-4CC0-AAF8-3205-5FA0D67F8C04";
createNode renderLayer -n "defaultRenderLayer2";
	rename -uid "6817F74C-491A-16D8-CF48-E1A2A60FB2C6";
	setAttr ".g" yes;
createNode animCurveTL -n "temp_nameShape1_controlPoints_0__xValue";
	rename -uid "D51AF865-4391-AA75-1D45-E9902E8238BE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0.49999999999999978;
createNode animCurveTL -n "temp_nameShape1_controlPoints_0__yValue";
	rename -uid "68A92536-4EBB-E1AC-7638-84ACFDDE10B8";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_0__zValue";
	rename -uid "570AB733-4727-A1F7-D5C2-5286680B814C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_1__xValue";
	rename -uid "1A15A48E-443D-4FF1-F432-EEB8EAA3CAF6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_1__yValue";
	rename -uid "ABF4D042-4D12-A99D-3137-E999A72B5E16";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_1__zValue";
	rename -uid "98550680-46BD-008E-F3F1-90809A81F040";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.49999999999999978;
createNode animCurveTL -n "temp_nameShape1_controlPoints_2__xValue";
	rename -uid "8C731D24-48C0-656F-9013-CFA449100FDA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.49999999999999978;
createNode animCurveTL -n "temp_nameShape1_controlPoints_2__yValue";
	rename -uid "03188154-42CE-4A00-5B77-468AC6621CCD";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_2__zValue";
	rename -uid "5F1382D8-481C-804D-D814-01BCAF3A59DC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_3__xValue";
	rename -uid "52C01C86-4275-1C4F-8520-CEACEDE44A8C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.99999999999999956;
createNode animCurveTL -n "temp_nameShape1_controlPoints_3__yValue";
	rename -uid "B6CDA972-4BE0-00AF-9FC7-DA8E33B5FD02";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_3__zValue";
	rename -uid "BE35AFA3-4A9C-9897-7168-43A9331C39E9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_4__xValue";
	rename -uid "7FD4627D-45CB-83DB-4054-27A631A76B9B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_4__yValue";
	rename -uid "DA1EE027-45CF-EFF8-52A9-FF904A9BFCF5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_4__zValue";
	rename -uid "77831AAB-4124-0763-71ED-B1BCFC990494";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.99999999999999956;
createNode animCurveTL -n "temp_nameShape1_controlPoints_5__xValue";
	rename -uid "534C212A-4CE8-D553-2E8C-F5BDED2ECB59";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0.99999999999999956;
createNode animCurveTL -n "temp_nameShape1_controlPoints_5__yValue";
	rename -uid "95F68544-4061-794E-FFE2-189062FE5189";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_5__zValue";
	rename -uid "1F461223-4EC8-8E1E-CE41-C4A0E7296A3B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_6__xValue";
	rename -uid "F5BEF936-4F75-4D2E-2CE8-CCBA8CA0284F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0.49999999999999978;
createNode animCurveTL -n "temp_nameShape1_controlPoints_6__yValue";
	rename -uid "5AA058E6-46A5-314B-95F8-F7B548B5FE86";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_6__zValue";
	rename -uid "F38DFD1E-42AD-F773-6194-B99271B72978";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_0__xValue1";
	rename -uid "1D82F7EA-4FDD-C415-4788-D08DB330100B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0.49999999999999978;
createNode animCurveTL -n "temp_nameShape1_controlPoints_0__yValue1";
	rename -uid "F87435AE-4744-6655-0859-CEB364DEE20E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_0__zValue1";
	rename -uid "0F632842-443D-23BB-1E3E-BA94E752B636";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_1__xValue1";
	rename -uid "F52D3A78-4EA1-815A-1EE5-BD9D9E2F2250";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_1__yValue1";
	rename -uid "6B11CD34-4961-20B2-A979-09863847C74B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_1__zValue1";
	rename -uid "9ADF57F8-43AF-72F6-64B6-80854EB4BCBF";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.49999999999999978;
createNode animCurveTL -n "temp_nameShape1_controlPoints_2__xValue1";
	rename -uid "65406650-4DB4-B954-EBA8-F2AADAC8D837";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.49999999999999978;
createNode animCurveTL -n "temp_nameShape1_controlPoints_2__yValue1";
	rename -uid "81A6C5E7-4153-FB74-20AB-0D826AA2907B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_2__zValue1";
	rename -uid "9173801E-4004-0688-E747-B487FAE63707";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_3__xValue1";
	rename -uid "AAA1C5EB-4713-B73C-96B0-59A94374477D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.99999999999999956;
createNode animCurveTL -n "temp_nameShape1_controlPoints_3__yValue1";
	rename -uid "7674D52E-47D9-D2CA-8F02-A6A95E6298C9";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_3__zValue1";
	rename -uid "FD01AE91-42A1-2597-719B-18A4C4269935";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_4__xValue1";
	rename -uid "19AB24C7-453A-D1B5-75DD-63AD6D8F8978";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_4__yValue1";
	rename -uid "75ECE7D1-4FA6-32FC-35BA-B8865C4E90D6";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_4__zValue1";
	rename -uid "58499CB7-4903-07DE-265D-A69AE562DBA5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.99999999999999956;
createNode animCurveTL -n "temp_nameShape1_controlPoints_5__xValue1";
	rename -uid "6C581580-43B4-576F-6C77-0F8DCB511E67";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0.99999999999999956;
createNode animCurveTL -n "temp_nameShape1_controlPoints_5__yValue1";
	rename -uid "FF2AE56D-4A18-4FED-D8ED-CC970145C524";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_5__zValue1";
	rename -uid "EDDCE6A3-4ABD-DD87-7F32-F7B1395579BA";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_6__xValue1";
	rename -uid "2394F6EE-4AA9-E29A-0E4A-14B7815347CB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0.49999999999999978;
createNode animCurveTL -n "temp_nameShape1_controlPoints_6__yValue1";
	rename -uid "70EA3BBB-47F7-77AF-AE1C-EDA816CA7585";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_6__zValue1";
	rename -uid "D5291758-47CE-303C-E58B-BFA5E0E6745F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "7A122390-4A19-DB0D-7727-E2B5711953C4";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode VRaySettingsNode -s -n "vraySettings";
	rename -uid "082E00AE-4ECF-F85B-B302-CB9B0975EFC6";
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
	setAttr ".mSceneName" -type "string" "D:/Code/MayaCode/autoRig/guide_rigs/guide_biped.ma";
	setAttr ".rt_cpuRayBundleSize" 4;
	setAttr ".rt_gpuRayBundleSize" 128;
	setAttr ".rt_maxPaths" 10000;
	setAttr ".rt_engineType" 3;
	setAttr ".rt_gpuResizeTextures" 0;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "666510C7-4294-770C-EBDC-6EB96E4A4F86";
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
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1678\n            -height 1092\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n"
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
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1678\\n    -height 1092\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1678\\n    -height 1092\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 52 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "FA950ED6-44F2-2AE2-BDC0-BDA7A93A56D3";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "442A3D7D-4CD6-DEC7-C2F1-3B81976F20B8";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -323.80951094248991 -330.95236780151544 ;
	setAttr ".tgi[0].vh" -type "double2" 324.99998708566085 330.95236780151544 ;
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
connectAttr "neckRoot_loc_Grp_pointConstraint1.ctx" "neckRoot_loc_Grp.tx";
connectAttr "neckRoot_loc_Grp_pointConstraint1.cty" "neckRoot_loc_Grp.ty";
connectAttr "neckRoot_loc_Grp_pointConstraint1.ctz" "neckRoot_loc_Grp.tz";
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
connectAttr "neckRoot_loc_Grp.pim" "neckRoot_loc_Grp_pointConstraint1.cpim";
connectAttr "neckRoot_loc_Grp.rp" "neckRoot_loc_Grp_pointConstraint1.crp";
connectAttr "neckRoot_loc_Grp.rpt" "neckRoot_loc_Grp_pointConstraint1.crt";
connectAttr "chest_loc.t" "neckRoot_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "chest_loc.rp" "neckRoot_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "chest_loc.rpt" "neckRoot_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "chest_loc.pm" "neckRoot_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "neckRoot_loc_Grp_pointConstraint1.w0" "neckRoot_loc_Grp_pointConstraint1.tg[0].tw"
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
connectAttr "L_hip_locShape.wp" "L_hip_CrvShape.cp[0]";
connectAttr "L_knee_locShape.wp" "L_hip_CrvShape.cp[1]";
connectAttr "L_knee_locShape.wp" "L_knee_CrvShape.cp[0]";
connectAttr "L_ankle_locShape.wp" "L_knee_CrvShape.cp[1]";
connectAttr "L_ankle_locShape.wp" "L_ankle_CrvShape.cp[0]";
connectAttr "L_toe_locShape.wp" "L_ankle_CrvShape.cp[1]";
connectAttr "L_toe_locShape.wp" "L_toe_CrvShape.cp[0]";
connectAttr "L_toeEnd_locShape.wp" "L_toe_CrvShape.cp[1]";
connectAttr "L_hip_mirror_parentConstraint1.ctx" "L_hip_mirror.tx";
connectAttr "L_hip_mirror_parentConstraint1.cty" "L_hip_mirror.ty";
connectAttr "L_hip_mirror_parentConstraint1.ctz" "L_hip_mirror.tz";
connectAttr "L_hip_mirror_parentConstraint1.crx" "L_hip_mirror.rx";
connectAttr "L_hip_mirror_parentConstraint1.cry" "L_hip_mirror.ry";
connectAttr "L_hip_mirror_parentConstraint1.crz" "L_hip_mirror.rz";
connectAttr "L_hipExtra_loc_Grp_parentConstraint1.ctx" "L_hipExtra_loc_Grp.tx";
connectAttr "L_hipExtra_loc_Grp_parentConstraint1.cty" "L_hipExtra_loc_Grp.ty";
connectAttr "L_hipExtra_loc_Grp_parentConstraint1.ctz" "L_hipExtra_loc_Grp.tz";
connectAttr "L_hipExtra_loc_Grp_parentConstraint1.crx" "L_hipExtra_loc_Grp.rx";
connectAttr "L_hipExtra_loc_Grp_parentConstraint1.cry" "L_hipExtra_loc_Grp.ry";
connectAttr "L_hipExtra_loc_Grp_parentConstraint1.crz" "L_hipExtra_loc_Grp.rz";
connectAttr "L_hipExtra_loc_Grp.ro" "L_hipExtra_loc_Grp_parentConstraint1.cro";
connectAttr "L_hipExtra_loc_Grp.pim" "L_hipExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "L_hipExtra_loc_Grp.rp" "L_hipExtra_loc_Grp_parentConstraint1.crp";
connectAttr "L_hipExtra_loc_Grp.rpt" "L_hipExtra_loc_Grp_parentConstraint1.crt";
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1.t" "L_hipExtra_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1.rp" "L_hipExtra_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1.rpt" "L_hipExtra_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1.r" "L_hipExtra_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1.ro" "L_hipExtra_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1.s" "L_hipExtra_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1.pm" "L_hipExtra_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "L_hipExtra_loc_Grp_parentConstraint1.w0" "L_hipExtra_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "L_ankleExtra_loc_Grp_parentConstraint1.ctx" "L_ankleExtra_loc_Grp.tx"
		;
connectAttr "L_ankleExtra_loc_Grp_parentConstraint1.cty" "L_ankleExtra_loc_Grp.ty"
		;
connectAttr "L_ankleExtra_loc_Grp_parentConstraint1.ctz" "L_ankleExtra_loc_Grp.tz"
		;
connectAttr "L_ankleExtra_loc_Grp_parentConstraint1.crx" "L_ankleExtra_loc_Grp.rx"
		;
connectAttr "L_ankleExtra_loc_Grp_parentConstraint1.cry" "L_ankleExtra_loc_Grp.ry"
		;
connectAttr "L_ankleExtra_loc_Grp_parentConstraint1.crz" "L_ankleExtra_loc_Grp.rz"
		;
connectAttr "L_ankleExtra_loc_Grp.ro" "L_ankleExtra_loc_Grp_parentConstraint1.cro"
		;
connectAttr "L_ankleExtra_loc_Grp.pim" "L_ankleExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "L_ankleExtra_loc_Grp.rp" "L_ankleExtra_loc_Grp_parentConstraint1.crp"
		;
connectAttr "L_ankleExtra_loc_Grp.rpt" "L_ankleExtra_loc_Grp_parentConstraint1.crt"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2.t" "L_ankleExtra_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2.rp" "L_ankleExtra_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2.rpt" "L_ankleExtra_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2.r" "L_ankleExtra_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2.ro" "L_ankleExtra_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2.s" "L_ankleExtra_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2.pm" "L_ankleExtra_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "L_ankleExtra_loc_Grp_parentConstraint1.w0" "L_ankleExtra_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2|L_aim_support2_aimConstraint1.crx" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2.rx"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2|L_aim_support2_aimConstraint1.cry" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2.ry"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2|L_aim_support2_aimConstraint1.crz" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2.rz"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2.pim" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2|L_aim_support2_aimConstraint1.cpim"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2.t" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2|L_aim_support2_aimConstraint1.ct"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2.rp" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2|L_aim_support2_aimConstraint1.crp"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2.rpt" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2|L_aim_support2_aimConstraint1.crt"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2.ro" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2|L_aim_support2_aimConstraint1.cro"
		;
connectAttr "L_ankle_loc.t" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2|L_aim_support2_aimConstraint1.tg[0].tt"
		;
connectAttr "L_ankle_loc.rp" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2|L_aim_support2_aimConstraint1.tg[0].trp"
		;
connectAttr "L_ankle_loc.rpt" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2|L_aim_support2_aimConstraint1.tg[0].trt"
		;
connectAttr "L_ankle_loc.pm" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2|L_aim_support2_aimConstraint1.tg[0].tpm"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2|L_aim_support2_aimConstraint1.w0" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2|L_aim_support2_aimConstraint1.tg[0].tw"
		;
connectAttr "L_knee_loc.wm" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2|L_aim_support2_aimConstraint1.wum"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1|L_aim_support1_aimConstraint1.crx" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1.rx"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1|L_aim_support1_aimConstraint1.cry" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1.ry"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1|L_aim_support1_aimConstraint1.crz" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1.rz"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1.pim" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1|L_aim_support1_aimConstraint1.cpim"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1.t" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1|L_aim_support1_aimConstraint1.ct"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1.rp" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1|L_aim_support1_aimConstraint1.crp"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1.rpt" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1|L_aim_support1_aimConstraint1.crt"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1.ro" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1|L_aim_support1_aimConstraint1.cro"
		;
connectAttr "L_hip_loc.t" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1|L_aim_support1_aimConstraint1.tg[0].tt"
		;
connectAttr "L_hip_loc.rp" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1|L_aim_support1_aimConstraint1.tg[0].trp"
		;
connectAttr "L_hip_loc.rpt" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1|L_aim_support1_aimConstraint1.tg[0].trt"
		;
connectAttr "L_hip_loc.pm" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1|L_aim_support1_aimConstraint1.tg[0].tpm"
		;
connectAttr "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1|L_aim_support1_aimConstraint1.w0" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1|L_aim_support1_aimConstraint1.tg[0].tw"
		;
connectAttr "L_knee_loc.wm" "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1|L_aim_support1_aimConstraint1.wum"
		;
connectAttr "L_hip_vector_Grp_aimConstraint1.crx" "L_hip_vector_Grp.rx";
connectAttr "L_hip_vector_Grp_aimConstraint1.cry" "L_hip_vector_Grp.ry";
connectAttr "L_hip_vector_Grp_aimConstraint1.crz" "L_hip_vector_Grp.rz";
connectAttr "L_hip_vector_Grp.pim" "L_hip_vector_Grp_aimConstraint1.cpim";
connectAttr "L_hip_vector_Grp.t" "L_hip_vector_Grp_aimConstraint1.ct";
connectAttr "L_hip_vector_Grp.rp" "L_hip_vector_Grp_aimConstraint1.crp";
connectAttr "L_hip_vector_Grp.rpt" "L_hip_vector_Grp_aimConstraint1.crt";
connectAttr "L_hip_vector_Grp.ro" "L_hip_vector_Grp_aimConstraint1.cro";
connectAttr "L_knee_loc.t" "L_hip_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "L_knee_loc.rp" "L_hip_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "L_knee_loc.rpt" "L_hip_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "L_knee_loc.pm" "L_hip_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "L_hip_vector_Grp_aimConstraint1.w0" "L_hip_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "L_hip_loc.wm" "L_hip_vector_Grp_aimConstraint1.wum";
connectAttr "L_hip_mirror.ro" "L_hip_mirror_parentConstraint1.cro";
connectAttr "L_hip_mirror.pim" "L_hip_mirror_parentConstraint1.cpim";
connectAttr "L_hip_mirror.rp" "L_hip_mirror_parentConstraint1.crp";
connectAttr "L_hip_mirror.rpt" "L_hip_mirror_parentConstraint1.crt";
connectAttr "root_loc.t" "L_hip_mirror_parentConstraint1.tg[0].tt";
connectAttr "root_loc.rp" "L_hip_mirror_parentConstraint1.tg[0].trp";
connectAttr "root_loc.rpt" "L_hip_mirror_parentConstraint1.tg[0].trt";
connectAttr "root_loc.r" "L_hip_mirror_parentConstraint1.tg[0].tr";
connectAttr "root_loc.ro" "L_hip_mirror_parentConstraint1.tg[0].tro";
connectAttr "root_loc.s" "L_hip_mirror_parentConstraint1.tg[0].ts";
connectAttr "root_loc.pm" "L_hip_mirror_parentConstraint1.tg[0].tpm";
connectAttr "L_hip_mirror_parentConstraint1.w0" "L_hip_mirror_parentConstraint1.tg[0].tw"
		;
connectAttr "R_hip_locShape.wp" "R_hip_CrvShape.cp[0]";
connectAttr "R_knee_locShape.wp" "R_hip_CrvShape.cp[1]";
connectAttr "R_knee_locShape.wp" "R_knee_CrvShape.cp[0]";
connectAttr "R_ankle_locShape.wp" "R_knee_CrvShape.cp[1]";
connectAttr "R_ankle_locShape.wp" "R_ankle_CrvShape.cp[0]";
connectAttr "R_toe_locShape.wp" "R_ankle_CrvShape.cp[1]";
connectAttr "R_toe_locShape.wp" "R_toe_CrvShape.cp[0]";
connectAttr "R_toeEnd_locShape.wp" "R_toe_CrvShape.cp[1]";
connectAttr "R_hip_mirror_parentConstraint1.ctx" "R_hip_mirror.tx";
connectAttr "R_hip_mirror_parentConstraint1.cty" "R_hip_mirror.ty";
connectAttr "R_hip_mirror_parentConstraint1.ctz" "R_hip_mirror.tz";
connectAttr "R_hip_mirror_parentConstraint1.crx" "R_hip_mirror.rx";
connectAttr "R_hip_mirror_parentConstraint1.cry" "R_hip_mirror.ry";
connectAttr "R_hip_mirror_parentConstraint1.crz" "R_hip_mirror.rz";
connectAttr "R_hipExtra_loc_Grp_parentConstraint1.ctx" "R_hipExtra_loc_Grp.tx";
connectAttr "R_hipExtra_loc_Grp_parentConstraint1.cty" "R_hipExtra_loc_Grp.ty";
connectAttr "R_hipExtra_loc_Grp_parentConstraint1.ctz" "R_hipExtra_loc_Grp.tz";
connectAttr "R_hipExtra_loc_Grp_parentConstraint1.crx" "R_hipExtra_loc_Grp.rx";
connectAttr "R_hipExtra_loc_Grp_parentConstraint1.cry" "R_hipExtra_loc_Grp.ry";
connectAttr "R_hipExtra_loc_Grp_parentConstraint1.crz" "R_hipExtra_loc_Grp.rz";
connectAttr "R_hipExtra_loc_Grp.ro" "R_hipExtra_loc_Grp_parentConstraint1.cro";
connectAttr "R_hipExtra_loc_Grp.pim" "R_hipExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "R_hipExtra_loc_Grp.rp" "R_hipExtra_loc_Grp_parentConstraint1.crp";
connectAttr "R_hipExtra_loc_Grp.rpt" "R_hipExtra_loc_Grp_parentConstraint1.crt";
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1.t" "R_hipExtra_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1.rp" "R_hipExtra_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1.rpt" "R_hipExtra_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1.r" "R_hipExtra_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1.ro" "R_hipExtra_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1.s" "R_hipExtra_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1.pm" "R_hipExtra_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "R_hipExtra_loc_Grp_parentConstraint1.w0" "R_hipExtra_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "R_ankleExtra_loc_Grp_parentConstraint1.ctx" "R_ankleExtra_loc_Grp.tx"
		;
connectAttr "R_ankleExtra_loc_Grp_parentConstraint1.cty" "R_ankleExtra_loc_Grp.ty"
		;
connectAttr "R_ankleExtra_loc_Grp_parentConstraint1.ctz" "R_ankleExtra_loc_Grp.tz"
		;
connectAttr "R_ankleExtra_loc_Grp_parentConstraint1.crx" "R_ankleExtra_loc_Grp.rx"
		;
connectAttr "R_ankleExtra_loc_Grp_parentConstraint1.cry" "R_ankleExtra_loc_Grp.ry"
		;
connectAttr "R_ankleExtra_loc_Grp_parentConstraint1.crz" "R_ankleExtra_loc_Grp.rz"
		;
connectAttr "R_ankleExtra_loc_Grp.ro" "R_ankleExtra_loc_Grp_parentConstraint1.cro"
		;
connectAttr "R_ankleExtra_loc_Grp.pim" "R_ankleExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "R_ankleExtra_loc_Grp.rp" "R_ankleExtra_loc_Grp_parentConstraint1.crp"
		;
connectAttr "R_ankleExtra_loc_Grp.rpt" "R_ankleExtra_loc_Grp_parentConstraint1.crt"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2.t" "R_ankleExtra_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2.rp" "R_ankleExtra_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2.rpt" "R_ankleExtra_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2.r" "R_ankleExtra_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2.ro" "R_ankleExtra_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2.s" "R_ankleExtra_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2.pm" "R_ankleExtra_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "R_ankleExtra_loc_Grp_parentConstraint1.w0" "R_ankleExtra_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2|R_aim_support2_aimConstraint1.crx" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2.rx"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2|R_aim_support2_aimConstraint1.cry" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2.ry"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2|R_aim_support2_aimConstraint1.crz" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2.rz"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2.pim" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2|R_aim_support2_aimConstraint1.cpim"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2.t" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2|R_aim_support2_aimConstraint1.ct"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2.rp" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2|R_aim_support2_aimConstraint1.crp"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2.rpt" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2|R_aim_support2_aimConstraint1.crt"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2.ro" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2|R_aim_support2_aimConstraint1.cro"
		;
connectAttr "R_ankle_loc.t" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2|R_aim_support2_aimConstraint1.tg[0].tt"
		;
connectAttr "R_ankle_loc.rp" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2|R_aim_support2_aimConstraint1.tg[0].trp"
		;
connectAttr "R_ankle_loc.rpt" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2|R_aim_support2_aimConstraint1.tg[0].trt"
		;
connectAttr "R_ankle_loc.pm" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2|R_aim_support2_aimConstraint1.tg[0].tpm"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2|R_aim_support2_aimConstraint1.w0" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2|R_aim_support2_aimConstraint1.tg[0].tw"
		;
connectAttr "R_knee_loc.wm" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2|R_aim_support2_aimConstraint1.wum"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1|R_aim_support1_aimConstraint1.crx" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1.rx"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1|R_aim_support1_aimConstraint1.cry" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1.ry"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1|R_aim_support1_aimConstraint1.crz" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1.rz"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1.pim" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1|R_aim_support1_aimConstraint1.cpim"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1.t" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1|R_aim_support1_aimConstraint1.ct"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1.rp" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1|R_aim_support1_aimConstraint1.crp"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1.rpt" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1|R_aim_support1_aimConstraint1.crt"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1.ro" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1|R_aim_support1_aimConstraint1.cro"
		;
connectAttr "R_hip_loc.t" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1|R_aim_support1_aimConstraint1.tg[0].tt"
		;
connectAttr "R_hip_loc.rp" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1|R_aim_support1_aimConstraint1.tg[0].trp"
		;
connectAttr "R_hip_loc.rpt" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1|R_aim_support1_aimConstraint1.tg[0].trt"
		;
connectAttr "R_hip_loc.pm" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1|R_aim_support1_aimConstraint1.tg[0].tpm"
		;
connectAttr "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1|R_aim_support1_aimConstraint1.w0" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1|R_aim_support1_aimConstraint1.tg[0].tw"
		;
connectAttr "R_knee_loc.wm" "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1|R_aim_support1_aimConstraint1.wum"
		;
connectAttr "R_hip_vector_Grp_aimConstraint1.crx" "R_hip_vector_Grp.rx";
connectAttr "R_hip_vector_Grp_aimConstraint1.cry" "R_hip_vector_Grp.ry";
connectAttr "R_hip_vector_Grp_aimConstraint1.crz" "R_hip_vector_Grp.rz";
connectAttr "R_hip_vector_Grp.pim" "R_hip_vector_Grp_aimConstraint1.cpim";
connectAttr "R_hip_vector_Grp.t" "R_hip_vector_Grp_aimConstraint1.ct";
connectAttr "R_hip_vector_Grp.rp" "R_hip_vector_Grp_aimConstraint1.crp";
connectAttr "R_hip_vector_Grp.rpt" "R_hip_vector_Grp_aimConstraint1.crt";
connectAttr "R_hip_vector_Grp.ro" "R_hip_vector_Grp_aimConstraint1.cro";
connectAttr "R_knee_loc.t" "R_hip_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "R_knee_loc.rp" "R_hip_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "R_knee_loc.rpt" "R_hip_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "R_knee_loc.pm" "R_hip_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "R_hip_vector_Grp_aimConstraint1.w0" "R_hip_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "R_hip_loc.wm" "R_hip_vector_Grp_aimConstraint1.wum";
connectAttr "R_hip_mirror.ro" "R_hip_mirror_parentConstraint1.cro";
connectAttr "R_hip_mirror.pim" "R_hip_mirror_parentConstraint1.cpim";
connectAttr "R_hip_mirror.rp" "R_hip_mirror_parentConstraint1.crp";
connectAttr "R_hip_mirror.rpt" "R_hip_mirror_parentConstraint1.crt";
connectAttr "root_loc.t" "R_hip_mirror_parentConstraint1.tg[0].tt";
connectAttr "root_loc.rp" "R_hip_mirror_parentConstraint1.tg[0].trp";
connectAttr "root_loc.rpt" "R_hip_mirror_parentConstraint1.tg[0].trt";
connectAttr "root_loc.r" "R_hip_mirror_parentConstraint1.tg[0].tr";
connectAttr "root_loc.ro" "R_hip_mirror_parentConstraint1.tg[0].tro";
connectAttr "root_loc.s" "R_hip_mirror_parentConstraint1.tg[0].ts";
connectAttr "root_loc.pm" "R_hip_mirror_parentConstraint1.tg[0].tpm";
connectAttr "R_hip_mirror_parentConstraint1.w0" "R_hip_mirror_parentConstraint1.tg[0].tw"
		;
connectAttr "L_scapula_locShape.wp" "L_scapula_CrvShape.cp[0]";
connectAttr "L_shoulder_locShape.wp" "L_scapula_CrvShape.cp[1]";
connectAttr "L_shoulder_locShape.wp" "L_shoulder_CrvShape.cp[0]";
connectAttr "L_elbow_locShape.wp" "L_shoulder_CrvShape.cp[1]";
connectAttr "L_elbow_locShape.wp" "L_elbow_CrvShape.cp[0]";
connectAttr "L_wrist_locShape.wp" "L_elbow_CrvShape.cp[1]";
connectAttr "L_wrist_locShape.wp" "L_wrist_CrvShape.cp[0]";
connectAttr "L_wristEnd_locShape.wp" "L_wrist_CrvShape.cp[1]";
connectAttr "L_shoulderExtra_locShape.wp" "L_shoulderExtra_CrvShape.cp[0]";
connectAttr "L_elbowExtra_locShape.wp" "L_shoulderExtra_CrvShape.cp[1]";
connectAttr "L_elbowExtra_locShape.wp" "L_elbowExtra_CrvShape.cp[0]";
connectAttr "L_wristExtra_locShape.wp" "L_elbowExtra_CrvShape.cp[1]";
connectAttr "L_scapula_mirror_parentConstraint1.ctx" "L_scapula_mirror.tx";
connectAttr "L_scapula_mirror_parentConstraint1.cty" "L_scapula_mirror.ty";
connectAttr "L_scapula_mirror_parentConstraint1.ctz" "L_scapula_mirror.tz";
connectAttr "L_scapula_mirror_parentConstraint1.crx" "L_scapula_mirror.rx";
connectAttr "L_scapula_mirror_parentConstraint1.cry" "L_scapula_mirror.ry";
connectAttr "L_scapula_mirror_parentConstraint1.crz" "L_scapula_mirror.rz";
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1|L_aim_support1_aimConstraint1.crx" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1.rx"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1|L_aim_support1_aimConstraint1.cry" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1.ry"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1|L_aim_support1_aimConstraint1.crz" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1.rz"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1.pim" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1|L_aim_support1_aimConstraint1.cpim"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1.t" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1|L_aim_support1_aimConstraint1.ct"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1.rp" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1|L_aim_support1_aimConstraint1.crp"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1.rpt" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1|L_aim_support1_aimConstraint1.crt"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1.ro" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1|L_aim_support1_aimConstraint1.cro"
		;
connectAttr "L_shoulder_loc.t" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1|L_aim_support1_aimConstraint1.tg[0].tt"
		;
connectAttr "L_shoulder_loc.rp" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1|L_aim_support1_aimConstraint1.tg[0].trp"
		;
connectAttr "L_shoulder_loc.rpt" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1|L_aim_support1_aimConstraint1.tg[0].trt"
		;
connectAttr "L_shoulder_loc.pm" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1|L_aim_support1_aimConstraint1.tg[0].tpm"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1|L_aim_support1_aimConstraint1.w0" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1|L_aim_support1_aimConstraint1.tg[0].tw"
		;
connectAttr "L_elbow_loc.wm" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1|L_aim_support1_aimConstraint1.wum"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2|L_aim_support2_aimConstraint1.crx" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2.rx"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2|L_aim_support2_aimConstraint1.cry" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2.ry"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2|L_aim_support2_aimConstraint1.crz" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2.rz"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2.pim" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2|L_aim_support2_aimConstraint1.cpim"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2.t" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2|L_aim_support2_aimConstraint1.ct"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2.rp" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2|L_aim_support2_aimConstraint1.crp"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2.rpt" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2|L_aim_support2_aimConstraint1.crt"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2.ro" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2|L_aim_support2_aimConstraint1.cro"
		;
connectAttr "L_wrist_loc.t" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2|L_aim_support2_aimConstraint1.tg[0].tt"
		;
connectAttr "L_wrist_loc.rp" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2|L_aim_support2_aimConstraint1.tg[0].trp"
		;
connectAttr "L_wrist_loc.rpt" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2|L_aim_support2_aimConstraint1.tg[0].trt"
		;
connectAttr "L_wrist_loc.pm" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2|L_aim_support2_aimConstraint1.tg[0].tpm"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2|L_aim_support2_aimConstraint1.w0" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2|L_aim_support2_aimConstraint1.tg[0].tw"
		;
connectAttr "L_elbow_loc.wm" "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2|L_aim_support2_aimConstraint1.wum"
		;
connectAttr "L_shoulderExtra_loc_Grp_parentConstraint1.ctx" "L_shoulderExtra_loc_Grp.tx"
		;
connectAttr "L_shoulderExtra_loc_Grp_parentConstraint1.cty" "L_shoulderExtra_loc_Grp.ty"
		;
connectAttr "L_shoulderExtra_loc_Grp_parentConstraint1.ctz" "L_shoulderExtra_loc_Grp.tz"
		;
connectAttr "L_shoulderExtra_loc_Grp_parentConstraint1.crx" "L_shoulderExtra_loc_Grp.rx"
		;
connectAttr "L_shoulderExtra_loc_Grp_parentConstraint1.cry" "L_shoulderExtra_loc_Grp.ry"
		;
connectAttr "L_shoulderExtra_loc_Grp_parentConstraint1.crz" "L_shoulderExtra_loc_Grp.rz"
		;
connectAttr "L_shoulderExtra_loc_Grp.ro" "L_shoulderExtra_loc_Grp_parentConstraint1.cro"
		;
connectAttr "L_shoulderExtra_loc_Grp.pim" "L_shoulderExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "L_shoulderExtra_loc_Grp.rp" "L_shoulderExtra_loc_Grp_parentConstraint1.crp"
		;
connectAttr "L_shoulderExtra_loc_Grp.rpt" "L_shoulderExtra_loc_Grp_parentConstraint1.crt"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1.t" "L_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1.rp" "L_shoulderExtra_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1.rpt" "L_shoulderExtra_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1.r" "L_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1.ro" "L_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1.s" "L_shoulderExtra_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1.pm" "L_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "L_shoulderExtra_loc_Grp_parentConstraint1.w0" "L_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "L_wristExtra_loc_Grp_parentConstraint1.ctx" "L_wristExtra_loc_Grp.tx"
		;
connectAttr "L_wristExtra_loc_Grp_parentConstraint1.cty" "L_wristExtra_loc_Grp.ty"
		;
connectAttr "L_wristExtra_loc_Grp_parentConstraint1.ctz" "L_wristExtra_loc_Grp.tz"
		;
connectAttr "L_wristExtra_loc_Grp_parentConstraint1.crx" "L_wristExtra_loc_Grp.rx"
		;
connectAttr "L_wristExtra_loc_Grp_parentConstraint1.cry" "L_wristExtra_loc_Grp.ry"
		;
connectAttr "L_wristExtra_loc_Grp_parentConstraint1.crz" "L_wristExtra_loc_Grp.rz"
		;
connectAttr "L_wristExtra_loc_Grp.ro" "L_wristExtra_loc_Grp_parentConstraint1.cro"
		;
connectAttr "L_wristExtra_loc_Grp.pim" "L_wristExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "L_wristExtra_loc_Grp.rp" "L_wristExtra_loc_Grp_parentConstraint1.crp"
		;
connectAttr "L_wristExtra_loc_Grp.rpt" "L_wristExtra_loc_Grp_parentConstraint1.crt"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2.t" "L_wristExtra_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2.rp" "L_wristExtra_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2.rpt" "L_wristExtra_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2.r" "L_wristExtra_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2.ro" "L_wristExtra_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2.s" "L_wristExtra_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2.pm" "L_wristExtra_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "L_wristExtra_loc_Grp_parentConstraint1.w0" "L_wristExtra_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "L_shoulder_vector_Grp_aimConstraint1.crx" "L_shoulder_vector_Grp.rx"
		;
connectAttr "L_shoulder_vector_Grp_aimConstraint1.cry" "L_shoulder_vector_Grp.ry"
		;
connectAttr "L_shoulder_vector_Grp_aimConstraint1.crz" "L_shoulder_vector_Grp.rz"
		;
connectAttr "temp_nameShape1_controlPoints_0__xValue.o" "L_shoulder_vectorShape.cp[0].xv"
		;
connectAttr "temp_nameShape1_controlPoints_0__yValue.o" "L_shoulder_vectorShape.cp[0].yv"
		;
connectAttr "temp_nameShape1_controlPoints_0__zValue.o" "L_shoulder_vectorShape.cp[0].zv"
		;
connectAttr "temp_nameShape1_controlPoints_1__xValue.o" "L_shoulder_vectorShape.cp[1].xv"
		;
connectAttr "temp_nameShape1_controlPoints_1__yValue.o" "L_shoulder_vectorShape.cp[1].yv"
		;
connectAttr "temp_nameShape1_controlPoints_1__zValue.o" "L_shoulder_vectorShape.cp[1].zv"
		;
connectAttr "temp_nameShape1_controlPoints_2__xValue.o" "L_shoulder_vectorShape.cp[2].xv"
		;
connectAttr "temp_nameShape1_controlPoints_2__yValue.o" "L_shoulder_vectorShape.cp[2].yv"
		;
connectAttr "temp_nameShape1_controlPoints_2__zValue.o" "L_shoulder_vectorShape.cp[2].zv"
		;
connectAttr "temp_nameShape1_controlPoints_3__xValue.o" "L_shoulder_vectorShape.cp[3].xv"
		;
connectAttr "temp_nameShape1_controlPoints_3__yValue.o" "L_shoulder_vectorShape.cp[3].yv"
		;
connectAttr "temp_nameShape1_controlPoints_3__zValue.o" "L_shoulder_vectorShape.cp[3].zv"
		;
connectAttr "temp_nameShape1_controlPoints_4__xValue.o" "L_shoulder_vectorShape.cp[4].xv"
		;
connectAttr "temp_nameShape1_controlPoints_4__yValue.o" "L_shoulder_vectorShape.cp[4].yv"
		;
connectAttr "temp_nameShape1_controlPoints_4__zValue.o" "L_shoulder_vectorShape.cp[4].zv"
		;
connectAttr "temp_nameShape1_controlPoints_5__xValue.o" "L_shoulder_vectorShape.cp[5].xv"
		;
connectAttr "temp_nameShape1_controlPoints_5__yValue.o" "L_shoulder_vectorShape.cp[5].yv"
		;
connectAttr "temp_nameShape1_controlPoints_5__zValue.o" "L_shoulder_vectorShape.cp[5].zv"
		;
connectAttr "temp_nameShape1_controlPoints_6__xValue.o" "L_shoulder_vectorShape.cp[6].xv"
		;
connectAttr "temp_nameShape1_controlPoints_6__yValue.o" "L_shoulder_vectorShape.cp[6].yv"
		;
connectAttr "temp_nameShape1_controlPoints_6__zValue.o" "L_shoulder_vectorShape.cp[6].zv"
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
connectAttr "L_scapula_mirror.ro" "L_scapula_mirror_parentConstraint1.cro";
connectAttr "L_scapula_mirror.pim" "L_scapula_mirror_parentConstraint1.cpim";
connectAttr "L_scapula_mirror.rp" "L_scapula_mirror_parentConstraint1.crp";
connectAttr "L_scapula_mirror.rpt" "L_scapula_mirror_parentConstraint1.crt";
connectAttr "chest_loc.t" "L_scapula_mirror_parentConstraint1.tg[0].tt";
connectAttr "chest_loc.rp" "L_scapula_mirror_parentConstraint1.tg[0].trp";
connectAttr "chest_loc.rpt" "L_scapula_mirror_parentConstraint1.tg[0].trt";
connectAttr "chest_loc.r" "L_scapula_mirror_parentConstraint1.tg[0].tr";
connectAttr "chest_loc.ro" "L_scapula_mirror_parentConstraint1.tg[0].tro";
connectAttr "chest_loc.s" "L_scapula_mirror_parentConstraint1.tg[0].ts";
connectAttr "chest_loc.pm" "L_scapula_mirror_parentConstraint1.tg[0].tpm";
connectAttr "L_scapula_mirror_parentConstraint1.w0" "L_scapula_mirror_parentConstraint1.tg[0].tw"
		;
connectAttr "R_scapula_locShape.wp" "R_scapula_CrvShape.cp[0]";
connectAttr "R_shoulder_locShape.wp" "R_scapula_CrvShape.cp[1]";
connectAttr "R_shoulder_locShape.wp" "R_shoulder_CrvShape.cp[0]";
connectAttr "R_elbow_locShape.wp" "R_shoulder_CrvShape.cp[1]";
connectAttr "R_elbow_locShape.wp" "R_elbow_CrvShape.cp[0]";
connectAttr "R_wrist_locShape.wp" "R_elbow_CrvShape.cp[1]";
connectAttr "R_wrist_locShape.wp" "R_wrist_CrvShape.cp[0]";
connectAttr "R_wristEnd_locShape.wp" "R_wrist_CrvShape.cp[1]";
connectAttr "R_shoulderExtra_locShape.wp" "R_shoulderExtra_CrvShape.cp[0]";
connectAttr "R_elbowExtra_locShape.wp" "R_shoulderExtra_CrvShape.cp[1]";
connectAttr "R_elbowExtra_locShape.wp" "R_elbowExtra_CrvShape.cp[0]";
connectAttr "R_wristExtra_locShape.wp" "R_elbowExtra_CrvShape.cp[1]";
connectAttr "R_scapula_mirror_parentConstraint1.ctx" "R_scapula_mirror.tx";
connectAttr "R_scapula_mirror_parentConstraint1.cty" "R_scapula_mirror.ty";
connectAttr "R_scapula_mirror_parentConstraint1.ctz" "R_scapula_mirror.tz";
connectAttr "R_scapula_mirror_parentConstraint1.crx" "R_scapula_mirror.rx";
connectAttr "R_scapula_mirror_parentConstraint1.cry" "R_scapula_mirror.ry";
connectAttr "R_scapula_mirror_parentConstraint1.crz" "R_scapula_mirror.rz";
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1|R_aim_support1_aimConstraint1.crx" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1.rx"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1|R_aim_support1_aimConstraint1.cry" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1.ry"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1|R_aim_support1_aimConstraint1.crz" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1.rz"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1.pim" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1|R_aim_support1_aimConstraint1.cpim"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1.t" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1|R_aim_support1_aimConstraint1.ct"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1.rp" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1|R_aim_support1_aimConstraint1.crp"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1.rpt" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1|R_aim_support1_aimConstraint1.crt"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1.ro" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1|R_aim_support1_aimConstraint1.cro"
		;
connectAttr "R_shoulder_loc.t" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1|R_aim_support1_aimConstraint1.tg[0].tt"
		;
connectAttr "R_shoulder_loc.rp" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1|R_aim_support1_aimConstraint1.tg[0].trp"
		;
connectAttr "R_shoulder_loc.rpt" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1|R_aim_support1_aimConstraint1.tg[0].trt"
		;
connectAttr "R_shoulder_loc.pm" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1|R_aim_support1_aimConstraint1.tg[0].tpm"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1|R_aim_support1_aimConstraint1.w0" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1|R_aim_support1_aimConstraint1.tg[0].tw"
		;
connectAttr "R_elbow_loc.wm" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1|R_aim_support1_aimConstraint1.wum"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2|R_aim_support2_aimConstraint1.crx" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2.rx"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2|R_aim_support2_aimConstraint1.cry" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2.ry"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2|R_aim_support2_aimConstraint1.crz" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2.rz"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2.pim" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2|R_aim_support2_aimConstraint1.cpim"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2.t" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2|R_aim_support2_aimConstraint1.ct"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2.rp" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2|R_aim_support2_aimConstraint1.crp"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2.rpt" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2|R_aim_support2_aimConstraint1.crt"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2.ro" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2|R_aim_support2_aimConstraint1.cro"
		;
connectAttr "R_wrist_loc.t" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2|R_aim_support2_aimConstraint1.tg[0].tt"
		;
connectAttr "R_wrist_loc.rp" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2|R_aim_support2_aimConstraint1.tg[0].trp"
		;
connectAttr "R_wrist_loc.rpt" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2|R_aim_support2_aimConstraint1.tg[0].trt"
		;
connectAttr "R_wrist_loc.pm" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2|R_aim_support2_aimConstraint1.tg[0].tpm"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2|R_aim_support2_aimConstraint1.w0" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2|R_aim_support2_aimConstraint1.tg[0].tw"
		;
connectAttr "R_elbow_loc.wm" "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2|R_aim_support2_aimConstraint1.wum"
		;
connectAttr "R_shoulderExtra_loc_Grp_parentConstraint1.ctx" "R_shoulderExtra_loc_Grp.tx"
		;
connectAttr "R_shoulderExtra_loc_Grp_parentConstraint1.cty" "R_shoulderExtra_loc_Grp.ty"
		;
connectAttr "R_shoulderExtra_loc_Grp_parentConstraint1.ctz" "R_shoulderExtra_loc_Grp.tz"
		;
connectAttr "R_shoulderExtra_loc_Grp_parentConstraint1.crx" "R_shoulderExtra_loc_Grp.rx"
		;
connectAttr "R_shoulderExtra_loc_Grp_parentConstraint1.cry" "R_shoulderExtra_loc_Grp.ry"
		;
connectAttr "R_shoulderExtra_loc_Grp_parentConstraint1.crz" "R_shoulderExtra_loc_Grp.rz"
		;
connectAttr "R_shoulderExtra_loc_Grp.ro" "R_shoulderExtra_loc_Grp_parentConstraint1.cro"
		;
connectAttr "R_shoulderExtra_loc_Grp.pim" "R_shoulderExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "R_shoulderExtra_loc_Grp.rp" "R_shoulderExtra_loc_Grp_parentConstraint1.crp"
		;
connectAttr "R_shoulderExtra_loc_Grp.rpt" "R_shoulderExtra_loc_Grp_parentConstraint1.crt"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1.t" "R_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1.rp" "R_shoulderExtra_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1.rpt" "R_shoulderExtra_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1.r" "R_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1.ro" "R_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1.s" "R_shoulderExtra_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1.pm" "R_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "R_shoulderExtra_loc_Grp_parentConstraint1.w0" "R_shoulderExtra_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "R_wristExtra_loc_Grp_parentConstraint1.ctx" "R_wristExtra_loc_Grp.tx"
		;
connectAttr "R_wristExtra_loc_Grp_parentConstraint1.cty" "R_wristExtra_loc_Grp.ty"
		;
connectAttr "R_wristExtra_loc_Grp_parentConstraint1.ctz" "R_wristExtra_loc_Grp.tz"
		;
connectAttr "R_wristExtra_loc_Grp_parentConstraint1.crx" "R_wristExtra_loc_Grp.rx"
		;
connectAttr "R_wristExtra_loc_Grp_parentConstraint1.cry" "R_wristExtra_loc_Grp.ry"
		;
connectAttr "R_wristExtra_loc_Grp_parentConstraint1.crz" "R_wristExtra_loc_Grp.rz"
		;
connectAttr "R_wristExtra_loc_Grp.ro" "R_wristExtra_loc_Grp_parentConstraint1.cro"
		;
connectAttr "R_wristExtra_loc_Grp.pim" "R_wristExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "R_wristExtra_loc_Grp.rp" "R_wristExtra_loc_Grp_parentConstraint1.crp"
		;
connectAttr "R_wristExtra_loc_Grp.rpt" "R_wristExtra_loc_Grp_parentConstraint1.crt"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2.t" "R_wristExtra_loc_Grp_parentConstraint1.tg[0].tt"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2.rp" "R_wristExtra_loc_Grp_parentConstraint1.tg[0].trp"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2.rpt" "R_wristExtra_loc_Grp_parentConstraint1.tg[0].trt"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2.r" "R_wristExtra_loc_Grp_parentConstraint1.tg[0].tr"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2.ro" "R_wristExtra_loc_Grp_parentConstraint1.tg[0].tro"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2.s" "R_wristExtra_loc_Grp_parentConstraint1.tg[0].ts"
		;
connectAttr "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2.pm" "R_wristExtra_loc_Grp_parentConstraint1.tg[0].tpm"
		;
connectAttr "R_wristExtra_loc_Grp_parentConstraint1.w0" "R_wristExtra_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "R_shoulder_vector_Grp_aimConstraint1.crx" "R_shoulder_vector_Grp.rx"
		;
connectAttr "R_shoulder_vector_Grp_aimConstraint1.cry" "R_shoulder_vector_Grp.ry"
		;
connectAttr "R_shoulder_vector_Grp_aimConstraint1.crz" "R_shoulder_vector_Grp.rz"
		;
connectAttr "temp_nameShape1_controlPoints_0__xValue1.o" "R_shoulder_vectorShape.cp[0].xv"
		;
connectAttr "temp_nameShape1_controlPoints_0__yValue1.o" "R_shoulder_vectorShape.cp[0].yv"
		;
connectAttr "temp_nameShape1_controlPoints_0__zValue1.o" "R_shoulder_vectorShape.cp[0].zv"
		;
connectAttr "temp_nameShape1_controlPoints_1__xValue1.o" "R_shoulder_vectorShape.cp[1].xv"
		;
connectAttr "temp_nameShape1_controlPoints_1__yValue1.o" "R_shoulder_vectorShape.cp[1].yv"
		;
connectAttr "temp_nameShape1_controlPoints_1__zValue1.o" "R_shoulder_vectorShape.cp[1].zv"
		;
connectAttr "temp_nameShape1_controlPoints_2__xValue1.o" "R_shoulder_vectorShape.cp[2].xv"
		;
connectAttr "temp_nameShape1_controlPoints_2__yValue1.o" "R_shoulder_vectorShape.cp[2].yv"
		;
connectAttr "temp_nameShape1_controlPoints_2__zValue1.o" "R_shoulder_vectorShape.cp[2].zv"
		;
connectAttr "temp_nameShape1_controlPoints_3__xValue1.o" "R_shoulder_vectorShape.cp[3].xv"
		;
connectAttr "temp_nameShape1_controlPoints_3__yValue1.o" "R_shoulder_vectorShape.cp[3].yv"
		;
connectAttr "temp_nameShape1_controlPoints_3__zValue1.o" "R_shoulder_vectorShape.cp[3].zv"
		;
connectAttr "temp_nameShape1_controlPoints_4__xValue1.o" "R_shoulder_vectorShape.cp[4].xv"
		;
connectAttr "temp_nameShape1_controlPoints_4__yValue1.o" "R_shoulder_vectorShape.cp[4].yv"
		;
connectAttr "temp_nameShape1_controlPoints_4__zValue1.o" "R_shoulder_vectorShape.cp[4].zv"
		;
connectAttr "temp_nameShape1_controlPoints_5__xValue1.o" "R_shoulder_vectorShape.cp[5].xv"
		;
connectAttr "temp_nameShape1_controlPoints_5__yValue1.o" "R_shoulder_vectorShape.cp[5].yv"
		;
connectAttr "temp_nameShape1_controlPoints_5__zValue1.o" "R_shoulder_vectorShape.cp[5].zv"
		;
connectAttr "temp_nameShape1_controlPoints_6__xValue1.o" "R_shoulder_vectorShape.cp[6].xv"
		;
connectAttr "temp_nameShape1_controlPoints_6__yValue1.o" "R_shoulder_vectorShape.cp[6].yv"
		;
connectAttr "temp_nameShape1_controlPoints_6__zValue1.o" "R_shoulder_vectorShape.cp[6].zv"
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
connectAttr "R_scapula_mirror.ro" "R_scapula_mirror_parentConstraint1.cro";
connectAttr "R_scapula_mirror.pim" "R_scapula_mirror_parentConstraint1.cpim";
connectAttr "R_scapula_mirror.rp" "R_scapula_mirror_parentConstraint1.crp";
connectAttr "R_scapula_mirror.rpt" "R_scapula_mirror_parentConstraint1.crt";
connectAttr "chest_loc.t" "R_scapula_mirror_parentConstraint1.tg[0].tt";
connectAttr "chest_loc.rp" "R_scapula_mirror_parentConstraint1.tg[0].trp";
connectAttr "chest_loc.rpt" "R_scapula_mirror_parentConstraint1.tg[0].trt";
connectAttr "chest_loc.r" "R_scapula_mirror_parentConstraint1.tg[0].tr";
connectAttr "chest_loc.ro" "R_scapula_mirror_parentConstraint1.tg[0].tro";
connectAttr "chest_loc.s" "R_scapula_mirror_parentConstraint1.tg[0].ts";
connectAttr "chest_loc.pm" "R_scapula_mirror_parentConstraint1.tg[0].tpm";
connectAttr "R_scapula_mirror_parentConstraint1.w0" "R_scapula_mirror_parentConstraint1.tg[0].tw"
		;
connectAttr "L_indexRoot_locShape.wp" "L_index_CrvShape.cp[0]";
connectAttr "L_index1_locShape.wp" "L_index_CrvShape.cp[1]";
connectAttr "L_index2_locShape.wp" "L_index_CrvShape.cp[2]";
connectAttr "L_index3_locShape.wp" "L_index_CrvShape.cp[3]";
connectAttr "L_index4_locShape.wp" "L_index_CrvShape.cp[4]";
connectAttr "L_middleRoot_locShape.wp" "L_middle_CrvShape.cp[0]";
connectAttr "L_middle1_locShape.wp" "L_middle_CrvShape.cp[1]";
connectAttr "L_middle2_locShape.wp" "L_middle_CrvShape.cp[2]";
connectAttr "L_middle3_locShape.wp" "L_middle_CrvShape.cp[3]";
connectAttr "L_middle4_locShape.wp" "L_middle_CrvShape.cp[4]";
connectAttr "L_ringRoot_locShape.wp" "L_ring_CrvShape.cp[0]";
connectAttr "L_ring1_locShape.wp" "L_ring_CrvShape.cp[1]";
connectAttr "L_ring2_locShape.wp" "L_ring_CrvShape.cp[2]";
connectAttr "L_ring3_locShape.wp" "L_ring_CrvShape.cp[3]";
connectAttr "L_ring4_locShape.wp" "L_ring_CrvShape.cp[4]";
connectAttr "L_pinkyRoot_locShape.wp" "L_pinky_CrvShape.cp[0]";
connectAttr "L_pinky1_locShape.wp" "L_pinky_CrvShape.cp[1]";
connectAttr "L_pinky2_locShape.wp" "L_pinky_CrvShape.cp[2]";
connectAttr "L_pinky3_locShape.wp" "L_pinky_CrvShape.cp[3]";
connectAttr "L_pinky4_locShape.wp" "L_pinky_CrvShape.cp[4]";
connectAttr "L_thumbRoot_locShape.wp" "L_thumb_CrvShape.cp[0]";
connectAttr "L_thumb1_locShape.wp" "L_thumb_CrvShape.cp[1]";
connectAttr "L_thumb2_locShape.wp" "L_thumb_CrvShape.cp[2]";
connectAttr "L_thumb3_locShape.wp" "L_thumb_CrvShape.cp[3]";
connectAttr "L_handRoot_mirror_parentConstraint1.ctx" "L_handRoot_mirror.tx";
connectAttr "L_handRoot_mirror_parentConstraint1.cty" "L_handRoot_mirror.ty";
connectAttr "L_handRoot_mirror_parentConstraint1.ctz" "L_handRoot_mirror.tz";
connectAttr "L_handRoot_mirror_parentConstraint1.crx" "L_handRoot_mirror.rx";
connectAttr "L_handRoot_mirror_parentConstraint1.cry" "L_handRoot_mirror.ry";
connectAttr "L_handRoot_mirror_parentConstraint1.crz" "L_handRoot_mirror.rz";
connectAttr "L_thumb2_loc_Grp_pointConstraint1.ctx" "L_thumb2_loc_Grp.tx";
connectAttr "L_thumb2_loc_Grp_pointConstraint1.cty" "L_thumb2_loc_Grp.ty";
connectAttr "L_thumb2_loc_Grp_pointConstraint1.ctz" "L_thumb2_loc_Grp.tz";
connectAttr "L_thumb2_loc_Grp.pim" "L_thumb2_loc_Grp_pointConstraint1.cpim";
connectAttr "L_thumb2_loc_Grp.rp" "L_thumb2_loc_Grp_pointConstraint1.crp";
connectAttr "L_thumb2_loc_Grp.rpt" "L_thumb2_loc_Grp_pointConstraint1.crt";
connectAttr "L_thumb3_loc.t" "L_thumb2_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "L_thumb3_loc.rp" "L_thumb2_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "L_thumb3_loc.rpt" "L_thumb2_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "L_thumb3_loc.pm" "L_thumb2_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "L_thumb2_loc_Grp_pointConstraint1.w0" "L_thumb2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "L_thumb1_loc.t" "L_thumb2_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "L_thumb1_loc.rp" "L_thumb2_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "L_thumb1_loc.rpt" "L_thumb2_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "L_thumb1_loc.pm" "L_thumb2_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "L_thumb2_loc_Grp_pointConstraint1.w1" "L_thumb2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "L_thumb_aimVector_Grp_aimConstraint1.crx" "L_thumb_aimVector_Grp.rx"
		;
connectAttr "L_thumb_aimVector_Grp_aimConstraint1.cry" "L_thumb_aimVector_Grp.ry"
		;
connectAttr "L_thumb_aimVector_Grp_aimConstraint1.crz" "L_thumb_aimVector_Grp.rz"
		;
connectAttr "L_thumb_aimVector_Grp.pim" "L_thumb_aimVector_Grp_aimConstraint1.cpim"
		;
connectAttr "L_thumb_aimVector_Grp.t" "L_thumb_aimVector_Grp_aimConstraint1.ct";
connectAttr "L_thumb_aimVector_Grp.rp" "L_thumb_aimVector_Grp_aimConstraint1.crp"
		;
connectAttr "L_thumb_aimVector_Grp.rpt" "L_thumb_aimVector_Grp_aimConstraint1.crt"
		;
connectAttr "L_thumb_aimVector_Grp.ro" "L_thumb_aimVector_Grp_aimConstraint1.cro"
		;
connectAttr "L_thumb2_loc.t" "L_thumb_aimVector_Grp_aimConstraint1.tg[0].tt";
connectAttr "L_thumb2_loc.rp" "L_thumb_aimVector_Grp_aimConstraint1.tg[0].trp";
connectAttr "L_thumb2_loc.rpt" "L_thumb_aimVector_Grp_aimConstraint1.tg[0].trt";
connectAttr "L_thumb2_loc.pm" "L_thumb_aimVector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "L_thumb_aimVector_Grp_aimConstraint1.w0" "L_thumb_aimVector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "L_thumb1_loc.wm" "L_thumb_aimVector_Grp_aimConstraint1.wum";
connectAttr "L_pinky2_loc_Grp_pointConstraint1.ctx" "L_pinky2_loc_Grp.tx";
connectAttr "L_pinky2_loc_Grp_pointConstraint1.cty" "L_pinky2_loc_Grp.ty";
connectAttr "L_pinky2_loc_Grp_pointConstraint1.ctz" "L_pinky2_loc_Grp.tz";
connectAttr "L_pinky2_loc_Grp.pim" "L_pinky2_loc_Grp_pointConstraint1.cpim";
connectAttr "L_pinky2_loc_Grp.rp" "L_pinky2_loc_Grp_pointConstraint1.crp";
connectAttr "L_pinky2_loc_Grp.rpt" "L_pinky2_loc_Grp_pointConstraint1.crt";
connectAttr "L_pinky1_loc.t" "L_pinky2_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "L_pinky1_loc.rp" "L_pinky2_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "L_pinky1_loc.rpt" "L_pinky2_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "L_pinky1_loc.pm" "L_pinky2_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "L_pinky2_loc_Grp_pointConstraint1.w0" "L_pinky2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "L_pinky4_loc.t" "L_pinky2_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "L_pinky4_loc.rp" "L_pinky2_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "L_pinky4_loc.rpt" "L_pinky2_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "L_pinky4_loc.pm" "L_pinky2_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "L_pinky2_loc_Grp_pointConstraint1.w1" "L_pinky2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "L_pinky3_loc_Grp_pointConstraint1.ctx" "L_pinky3_loc_Grp.tx";
connectAttr "L_pinky3_loc_Grp_pointConstraint1.cty" "L_pinky3_loc_Grp.ty";
connectAttr "L_pinky3_loc_Grp_pointConstraint1.ctz" "L_pinky3_loc_Grp.tz";
connectAttr "L_pinky3_loc_Grp.pim" "L_pinky3_loc_Grp_pointConstraint1.cpim";
connectAttr "L_pinky3_loc_Grp.rp" "L_pinky3_loc_Grp_pointConstraint1.crp";
connectAttr "L_pinky3_loc_Grp.rpt" "L_pinky3_loc_Grp_pointConstraint1.crt";
connectAttr "L_pinky1_loc.t" "L_pinky3_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "L_pinky1_loc.rp" "L_pinky3_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "L_pinky1_loc.rpt" "L_pinky3_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "L_pinky1_loc.pm" "L_pinky3_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "L_pinky3_loc_Grp_pointConstraint1.w0" "L_pinky3_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "L_pinky4_loc.t" "L_pinky3_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "L_pinky4_loc.rp" "L_pinky3_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "L_pinky4_loc.rpt" "L_pinky3_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "L_pinky4_loc.pm" "L_pinky3_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "L_pinky3_loc_Grp_pointConstraint1.w1" "L_pinky3_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "L_pinky_aimVector_Grp_aimConstraint1.crx" "L_pinky_aimVector_Grp.rx"
		;
connectAttr "L_pinky_aimVector_Grp_aimConstraint1.cry" "L_pinky_aimVector_Grp.ry"
		;
connectAttr "L_pinky_aimVector_Grp_aimConstraint1.crz" "L_pinky_aimVector_Grp.rz"
		;
connectAttr "L_pinky_aimVector_Grp.pim" "L_pinky_aimVector_Grp_aimConstraint1.cpim"
		;
connectAttr "L_pinky_aimVector_Grp.t" "L_pinky_aimVector_Grp_aimConstraint1.ct";
connectAttr "L_pinky_aimVector_Grp.rp" "L_pinky_aimVector_Grp_aimConstraint1.crp"
		;
connectAttr "L_pinky_aimVector_Grp.rpt" "L_pinky_aimVector_Grp_aimConstraint1.crt"
		;
connectAttr "L_pinky_aimVector_Grp.ro" "L_pinky_aimVector_Grp_aimConstraint1.cro"
		;
connectAttr "L_pinky2_loc.t" "L_pinky_aimVector_Grp_aimConstraint1.tg[0].tt";
connectAttr "L_pinky2_loc.rp" "L_pinky_aimVector_Grp_aimConstraint1.tg[0].trp";
connectAttr "L_pinky2_loc.rpt" "L_pinky_aimVector_Grp_aimConstraint1.tg[0].trt";
connectAttr "L_pinky2_loc.pm" "L_pinky_aimVector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "L_pinky_aimVector_Grp_aimConstraint1.w0" "L_pinky_aimVector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "L_pinky1_loc.wm" "L_pinky_aimVector_Grp_aimConstraint1.wum";
connectAttr "L_ring2_loc_Grp_pointConstraint1.ctx" "L_ring2_loc_Grp.tx";
connectAttr "L_ring2_loc_Grp_pointConstraint1.cty" "L_ring2_loc_Grp.ty";
connectAttr "L_ring2_loc_Grp_pointConstraint1.ctz" "L_ring2_loc_Grp.tz";
connectAttr "L_ring2_loc_Grp.pim" "L_ring2_loc_Grp_pointConstraint1.cpim";
connectAttr "L_ring2_loc_Grp.rp" "L_ring2_loc_Grp_pointConstraint1.crp";
connectAttr "L_ring2_loc_Grp.rpt" "L_ring2_loc_Grp_pointConstraint1.crt";
connectAttr "L_ring1_loc.t" "L_ring2_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "L_ring1_loc.rp" "L_ring2_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "L_ring1_loc.rpt" "L_ring2_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "L_ring1_loc.pm" "L_ring2_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "L_ring2_loc_Grp_pointConstraint1.w0" "L_ring2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "L_ring4_loc.t" "L_ring2_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "L_ring4_loc.rp" "L_ring2_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "L_ring4_loc.rpt" "L_ring2_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "L_ring4_loc.pm" "L_ring2_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "L_ring2_loc_Grp_pointConstraint1.w1" "L_ring2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "L_ring3_loc_Grp_pointConstraint1.ctx" "L_ring3_loc_Grp.tx";
connectAttr "L_ring3_loc_Grp_pointConstraint1.cty" "L_ring3_loc_Grp.ty";
connectAttr "L_ring3_loc_Grp_pointConstraint1.ctz" "L_ring3_loc_Grp.tz";
connectAttr "L_ring3_loc_Grp.pim" "L_ring3_loc_Grp_pointConstraint1.cpim";
connectAttr "L_ring3_loc_Grp.rp" "L_ring3_loc_Grp_pointConstraint1.crp";
connectAttr "L_ring3_loc_Grp.rpt" "L_ring3_loc_Grp_pointConstraint1.crt";
connectAttr "L_ring1_loc.t" "L_ring3_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "L_ring1_loc.rp" "L_ring3_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "L_ring1_loc.rpt" "L_ring3_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "L_ring1_loc.pm" "L_ring3_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "L_ring3_loc_Grp_pointConstraint1.w0" "L_ring3_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "L_ring4_loc.t" "L_ring3_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "L_ring4_loc.rp" "L_ring3_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "L_ring4_loc.rpt" "L_ring3_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "L_ring4_loc.pm" "L_ring3_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "L_ring3_loc_Grp_pointConstraint1.w1" "L_ring3_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "L_ring_aimVector_Grp_aimConstraint1.crx" "L_ring_aimVector_Grp.rx";
connectAttr "L_ring_aimVector_Grp_aimConstraint1.cry" "L_ring_aimVector_Grp.ry";
connectAttr "L_ring_aimVector_Grp_aimConstraint1.crz" "L_ring_aimVector_Grp.rz";
connectAttr "L_ring_aimVector_Grp.pim" "L_ring_aimVector_Grp_aimConstraint1.cpim"
		;
connectAttr "L_ring_aimVector_Grp.t" "L_ring_aimVector_Grp_aimConstraint1.ct";
connectAttr "L_ring_aimVector_Grp.rp" "L_ring_aimVector_Grp_aimConstraint1.crp";
connectAttr "L_ring_aimVector_Grp.rpt" "L_ring_aimVector_Grp_aimConstraint1.crt"
		;
connectAttr "L_ring_aimVector_Grp.ro" "L_ring_aimVector_Grp_aimConstraint1.cro";
connectAttr "L_ring2_loc.t" "L_ring_aimVector_Grp_aimConstraint1.tg[0].tt";
connectAttr "L_ring2_loc.rp" "L_ring_aimVector_Grp_aimConstraint1.tg[0].trp";
connectAttr "L_ring2_loc.rpt" "L_ring_aimVector_Grp_aimConstraint1.tg[0].trt";
connectAttr "L_ring2_loc.pm" "L_ring_aimVector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "L_ring_aimVector_Grp_aimConstraint1.w0" "L_ring_aimVector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "L_ring1_loc.wm" "L_ring_aimVector_Grp_aimConstraint1.wum";
connectAttr "L_index2_loc_Grp_pointConstraint1.ctx" "L_index2_loc_Grp.tx";
connectAttr "L_index2_loc_Grp_pointConstraint1.cty" "L_index2_loc_Grp.ty";
connectAttr "L_index2_loc_Grp_pointConstraint1.ctz" "L_index2_loc_Grp.tz";
connectAttr "L_index2_loc_Grp.pim" "L_index2_loc_Grp_pointConstraint1.cpim";
connectAttr "L_index2_loc_Grp.rp" "L_index2_loc_Grp_pointConstraint1.crp";
connectAttr "L_index2_loc_Grp.rpt" "L_index2_loc_Grp_pointConstraint1.crt";
connectAttr "L_index1_loc.t" "L_index2_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "L_index1_loc.rp" "L_index2_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "L_index1_loc.rpt" "L_index2_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "L_index1_loc.pm" "L_index2_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "L_index2_loc_Grp_pointConstraint1.w0" "L_index2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "L_index4_loc.t" "L_index2_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "L_index4_loc.rp" "L_index2_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "L_index4_loc.rpt" "L_index2_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "L_index4_loc.pm" "L_index2_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "L_index2_loc_Grp_pointConstraint1.w1" "L_index2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "L_index3_loc_Grp_pointConstraint1.ctx" "L_index3_loc_Grp.tx";
connectAttr "L_index3_loc_Grp_pointConstraint1.cty" "L_index3_loc_Grp.ty";
connectAttr "L_index3_loc_Grp_pointConstraint1.ctz" "L_index3_loc_Grp.tz";
connectAttr "L_index3_loc_Grp.pim" "L_index3_loc_Grp_pointConstraint1.cpim";
connectAttr "L_index3_loc_Grp.rp" "L_index3_loc_Grp_pointConstraint1.crp";
connectAttr "L_index3_loc_Grp.rpt" "L_index3_loc_Grp_pointConstraint1.crt";
connectAttr "L_index1_loc.t" "L_index3_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "L_index1_loc.rp" "L_index3_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "L_index1_loc.rpt" "L_index3_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "L_index1_loc.pm" "L_index3_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "L_index3_loc_Grp_pointConstraint1.w0" "L_index3_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "L_index4_loc.t" "L_index3_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "L_index4_loc.rp" "L_index3_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "L_index4_loc.rpt" "L_index3_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "L_index4_loc.pm" "L_index3_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "L_index3_loc_Grp_pointConstraint1.w1" "L_index3_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "L_index_aimVector_Grp_aimConstraint1.crx" "L_index_aimVector_Grp.rx"
		;
connectAttr "L_index_aimVector_Grp_aimConstraint1.cry" "L_index_aimVector_Grp.ry"
		;
connectAttr "L_index_aimVector_Grp_aimConstraint1.crz" "L_index_aimVector_Grp.rz"
		;
connectAttr "L_index_aimVector_Grp.pim" "L_index_aimVector_Grp_aimConstraint1.cpim"
		;
connectAttr "L_index_aimVector_Grp.t" "L_index_aimVector_Grp_aimConstraint1.ct";
connectAttr "L_index_aimVector_Grp.rp" "L_index_aimVector_Grp_aimConstraint1.crp"
		;
connectAttr "L_index_aimVector_Grp.rpt" "L_index_aimVector_Grp_aimConstraint1.crt"
		;
connectAttr "L_index_aimVector_Grp.ro" "L_index_aimVector_Grp_aimConstraint1.cro"
		;
connectAttr "L_index2_loc.t" "L_index_aimVector_Grp_aimConstraint1.tg[0].tt";
connectAttr "L_index2_loc.rp" "L_index_aimVector_Grp_aimConstraint1.tg[0].trp";
connectAttr "L_index2_loc.rpt" "L_index_aimVector_Grp_aimConstraint1.tg[0].trt";
connectAttr "L_index2_loc.pm" "L_index_aimVector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "L_index_aimVector_Grp_aimConstraint1.w0" "L_index_aimVector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "L_index1_loc.wm" "L_index_aimVector_Grp_aimConstraint1.wum";
connectAttr "L_middle2_loc_Grp_pointConstraint1.ctx" "L_middle2_loc_Grp.tx";
connectAttr "L_middle2_loc_Grp_pointConstraint1.cty" "L_middle2_loc_Grp.ty";
connectAttr "L_middle2_loc_Grp_pointConstraint1.ctz" "L_middle2_loc_Grp.tz";
connectAttr "L_middle2_loc_Grp.pim" "L_middle2_loc_Grp_pointConstraint1.cpim";
connectAttr "L_middle2_loc_Grp.rp" "L_middle2_loc_Grp_pointConstraint1.crp";
connectAttr "L_middle2_loc_Grp.rpt" "L_middle2_loc_Grp_pointConstraint1.crt";
connectAttr "L_middle1_loc.t" "L_middle2_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "L_middle1_loc.rp" "L_middle2_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "L_middle1_loc.rpt" "L_middle2_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "L_middle1_loc.pm" "L_middle2_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "L_middle2_loc_Grp_pointConstraint1.w0" "L_middle2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "L_middle4_loc.t" "L_middle2_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "L_middle4_loc.rp" "L_middle2_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "L_middle4_loc.rpt" "L_middle2_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "L_middle4_loc.pm" "L_middle2_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "L_middle2_loc_Grp_pointConstraint1.w1" "L_middle2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "L_middle3_loc_Grp_pointConstraint1.ctx" "L_middle3_loc_Grp.tx";
connectAttr "L_middle3_loc_Grp_pointConstraint1.cty" "L_middle3_loc_Grp.ty";
connectAttr "L_middle3_loc_Grp_pointConstraint1.ctz" "L_middle3_loc_Grp.tz";
connectAttr "L_middle3_loc_Grp.pim" "L_middle3_loc_Grp_pointConstraint1.cpim";
connectAttr "L_middle3_loc_Grp.rp" "L_middle3_loc_Grp_pointConstraint1.crp";
connectAttr "L_middle3_loc_Grp.rpt" "L_middle3_loc_Grp_pointConstraint1.crt";
connectAttr "L_middle1_loc.t" "L_middle3_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "L_middle1_loc.rp" "L_middle3_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "L_middle1_loc.rpt" "L_middle3_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "L_middle1_loc.pm" "L_middle3_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "L_middle3_loc_Grp_pointConstraint1.w0" "L_middle3_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "L_middle4_loc.t" "L_middle3_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "L_middle4_loc.rp" "L_middle3_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "L_middle4_loc.rpt" "L_middle3_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "L_middle4_loc.pm" "L_middle3_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "L_middle3_loc_Grp_pointConstraint1.w1" "L_middle3_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "L_middle_aimVector_Grp_aimConstraint1.crx" "L_middle_aimVector_Grp.rx"
		;
connectAttr "L_middle_aimVector_Grp_aimConstraint1.cry" "L_middle_aimVector_Grp.ry"
		;
connectAttr "L_middle_aimVector_Grp_aimConstraint1.crz" "L_middle_aimVector_Grp.rz"
		;
connectAttr "L_middle_aimVector_Grp.pim" "L_middle_aimVector_Grp_aimConstraint1.cpim"
		;
connectAttr "L_middle_aimVector_Grp.t" "L_middle_aimVector_Grp_aimConstraint1.ct"
		;
connectAttr "L_middle_aimVector_Grp.rp" "L_middle_aimVector_Grp_aimConstraint1.crp"
		;
connectAttr "L_middle_aimVector_Grp.rpt" "L_middle_aimVector_Grp_aimConstraint1.crt"
		;
connectAttr "L_middle_aimVector_Grp.ro" "L_middle_aimVector_Grp_aimConstraint1.cro"
		;
connectAttr "L_middle2_loc.t" "L_middle_aimVector_Grp_aimConstraint1.tg[0].tt";
connectAttr "L_middle2_loc.rp" "L_middle_aimVector_Grp_aimConstraint1.tg[0].trp"
		;
connectAttr "L_middle2_loc.rpt" "L_middle_aimVector_Grp_aimConstraint1.tg[0].trt"
		;
connectAttr "L_middle2_loc.pm" "L_middle_aimVector_Grp_aimConstraint1.tg[0].tpm"
		;
connectAttr "L_middle_aimVector_Grp_aimConstraint1.w0" "L_middle_aimVector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "L_middle1_loc.wm" "L_middle_aimVector_Grp_aimConstraint1.wum";
connectAttr "L_handRoot_mirror.ro" "L_handRoot_mirror_parentConstraint1.cro";
connectAttr "L_handRoot_mirror.pim" "L_handRoot_mirror_parentConstraint1.cpim";
connectAttr "L_handRoot_mirror.rp" "L_handRoot_mirror_parentConstraint1.crp";
connectAttr "L_handRoot_mirror.rpt" "L_handRoot_mirror_parentConstraint1.crt";
connectAttr "L_wrist_loc.t" "L_handRoot_mirror_parentConstraint1.tg[0].tt";
connectAttr "L_wrist_loc.rp" "L_handRoot_mirror_parentConstraint1.tg[0].trp";
connectAttr "L_wrist_loc.rpt" "L_handRoot_mirror_parentConstraint1.tg[0].trt";
connectAttr "L_wrist_loc.r" "L_handRoot_mirror_parentConstraint1.tg[0].tr";
connectAttr "L_wrist_loc.ro" "L_handRoot_mirror_parentConstraint1.tg[0].tro";
connectAttr "L_wrist_loc.s" "L_handRoot_mirror_parentConstraint1.tg[0].ts";
connectAttr "L_wrist_loc.pm" "L_handRoot_mirror_parentConstraint1.tg[0].tpm";
connectAttr "L_handRoot_mirror_parentConstraint1.w0" "L_handRoot_mirror_parentConstraint1.tg[0].tw"
		;
connectAttr "R_indexRoot_locShape.wp" "R_index_CrvShape.cp[0]";
connectAttr "R_index1_locShape.wp" "R_index_CrvShape.cp[1]";
connectAttr "R_index2_locShape.wp" "R_index_CrvShape.cp[2]";
connectAttr "R_index3_locShape.wp" "R_index_CrvShape.cp[3]";
connectAttr "R_index4_locShape.wp" "R_index_CrvShape.cp[4]";
connectAttr "R_middleRoot_locShape.wp" "R_middle_CrvShape.cp[0]";
connectAttr "R_middle1_locShape.wp" "R_middle_CrvShape.cp[1]";
connectAttr "R_middle2_locShape.wp" "R_middle_CrvShape.cp[2]";
connectAttr "R_middle3_locShape.wp" "R_middle_CrvShape.cp[3]";
connectAttr "R_middle4_locShape.wp" "R_middle_CrvShape.cp[4]";
connectAttr "R_ringRoot_locShape.wp" "R_ring_CrvShape.cp[0]";
connectAttr "R_ring1_locShape.wp" "R_ring_CrvShape.cp[1]";
connectAttr "R_ring2_locShape.wp" "R_ring_CrvShape.cp[2]";
connectAttr "R_ring3_locShape.wp" "R_ring_CrvShape.cp[3]";
connectAttr "R_ring4_locShape.wp" "R_ring_CrvShape.cp[4]";
connectAttr "R_pinkyRoot_locShape.wp" "R_pinky_CrvShape.cp[0]";
connectAttr "R_pinky1_locShape.wp" "R_pinky_CrvShape.cp[1]";
connectAttr "R_pinky2_locShape.wp" "R_pinky_CrvShape.cp[2]";
connectAttr "R_pinky3_locShape.wp" "R_pinky_CrvShape.cp[3]";
connectAttr "R_pinky4_locShape.wp" "R_pinky_CrvShape.cp[4]";
connectAttr "R_thumbRoot_locShape.wp" "R_thumb_CrvShape.cp[0]";
connectAttr "R_thumb1_locShape.wp" "R_thumb_CrvShape.cp[1]";
connectAttr "R_thumb2_locShape.wp" "R_thumb_CrvShape.cp[2]";
connectAttr "R_thumb3_locShape.wp" "R_thumb_CrvShape.cp[3]";
connectAttr "R_handRoot_mirror_parentConstraint1.ctx" "R_handRoot_mirror.tx";
connectAttr "R_handRoot_mirror_parentConstraint1.cty" "R_handRoot_mirror.ty";
connectAttr "R_handRoot_mirror_parentConstraint1.ctz" "R_handRoot_mirror.tz";
connectAttr "R_handRoot_mirror_parentConstraint1.crx" "R_handRoot_mirror.rx";
connectAttr "R_handRoot_mirror_parentConstraint1.cry" "R_handRoot_mirror.ry";
connectAttr "R_handRoot_mirror_parentConstraint1.crz" "R_handRoot_mirror.rz";
connectAttr "R_thumb2_loc_Grp_pointConstraint1.ctx" "R_thumb2_loc_Grp.tx";
connectAttr "R_thumb2_loc_Grp_pointConstraint1.cty" "R_thumb2_loc_Grp.ty";
connectAttr "R_thumb2_loc_Grp_pointConstraint1.ctz" "R_thumb2_loc_Grp.tz";
connectAttr "R_thumb2_loc_Grp.pim" "R_thumb2_loc_Grp_pointConstraint1.cpim";
connectAttr "R_thumb2_loc_Grp.rp" "R_thumb2_loc_Grp_pointConstraint1.crp";
connectAttr "R_thumb2_loc_Grp.rpt" "R_thumb2_loc_Grp_pointConstraint1.crt";
connectAttr "R_thumb3_loc.t" "R_thumb2_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "R_thumb3_loc.rp" "R_thumb2_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "R_thumb3_loc.rpt" "R_thumb2_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "R_thumb3_loc.pm" "R_thumb2_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "R_thumb2_loc_Grp_pointConstraint1.w0" "R_thumb2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "R_thumb1_loc.t" "R_thumb2_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "R_thumb1_loc.rp" "R_thumb2_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "R_thumb1_loc.rpt" "R_thumb2_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "R_thumb1_loc.pm" "R_thumb2_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "R_thumb2_loc_Grp_pointConstraint1.w1" "R_thumb2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "R_thumb_aimVector_Grp_aimConstraint1.crx" "R_thumb_aimVector_Grp.rx"
		;
connectAttr "R_thumb_aimVector_Grp_aimConstraint1.cry" "R_thumb_aimVector_Grp.ry"
		;
connectAttr "R_thumb_aimVector_Grp_aimConstraint1.crz" "R_thumb_aimVector_Grp.rz"
		;
connectAttr "R_thumb_aimVector_Grp.pim" "R_thumb_aimVector_Grp_aimConstraint1.cpim"
		;
connectAttr "R_thumb_aimVector_Grp.t" "R_thumb_aimVector_Grp_aimConstraint1.ct";
connectAttr "R_thumb_aimVector_Grp.rp" "R_thumb_aimVector_Grp_aimConstraint1.crp"
		;
connectAttr "R_thumb_aimVector_Grp.rpt" "R_thumb_aimVector_Grp_aimConstraint1.crt"
		;
connectAttr "R_thumb_aimVector_Grp.ro" "R_thumb_aimVector_Grp_aimConstraint1.cro"
		;
connectAttr "R_thumb2_loc.t" "R_thumb_aimVector_Grp_aimConstraint1.tg[0].tt";
connectAttr "R_thumb2_loc.rp" "R_thumb_aimVector_Grp_aimConstraint1.tg[0].trp";
connectAttr "R_thumb2_loc.rpt" "R_thumb_aimVector_Grp_aimConstraint1.tg[0].trt";
connectAttr "R_thumb2_loc.pm" "R_thumb_aimVector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "R_thumb_aimVector_Grp_aimConstraint1.w0" "R_thumb_aimVector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "R_thumb1_loc.wm" "R_thumb_aimVector_Grp_aimConstraint1.wum";
connectAttr "R_pinky2_loc_Grp_pointConstraint1.ctx" "R_pinky2_loc_Grp.tx";
connectAttr "R_pinky2_loc_Grp_pointConstraint1.cty" "R_pinky2_loc_Grp.ty";
connectAttr "R_pinky2_loc_Grp_pointConstraint1.ctz" "R_pinky2_loc_Grp.tz";
connectAttr "R_pinky2_loc_Grp.pim" "R_pinky2_loc_Grp_pointConstraint1.cpim";
connectAttr "R_pinky2_loc_Grp.rp" "R_pinky2_loc_Grp_pointConstraint1.crp";
connectAttr "R_pinky2_loc_Grp.rpt" "R_pinky2_loc_Grp_pointConstraint1.crt";
connectAttr "R_pinky1_loc.t" "R_pinky2_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "R_pinky1_loc.rp" "R_pinky2_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "R_pinky1_loc.rpt" "R_pinky2_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "R_pinky1_loc.pm" "R_pinky2_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "R_pinky2_loc_Grp_pointConstraint1.w0" "R_pinky2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "R_pinky4_loc.t" "R_pinky2_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "R_pinky4_loc.rp" "R_pinky2_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "R_pinky4_loc.rpt" "R_pinky2_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "R_pinky4_loc.pm" "R_pinky2_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "R_pinky2_loc_Grp_pointConstraint1.w1" "R_pinky2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "R_pinky3_loc_Grp_pointConstraint1.ctx" "R_pinky3_loc_Grp.tx";
connectAttr "R_pinky3_loc_Grp_pointConstraint1.cty" "R_pinky3_loc_Grp.ty";
connectAttr "R_pinky3_loc_Grp_pointConstraint1.ctz" "R_pinky3_loc_Grp.tz";
connectAttr "R_pinky3_loc_Grp.pim" "R_pinky3_loc_Grp_pointConstraint1.cpim";
connectAttr "R_pinky3_loc_Grp.rp" "R_pinky3_loc_Grp_pointConstraint1.crp";
connectAttr "R_pinky3_loc_Grp.rpt" "R_pinky3_loc_Grp_pointConstraint1.crt";
connectAttr "R_pinky1_loc.t" "R_pinky3_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "R_pinky1_loc.rp" "R_pinky3_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "R_pinky1_loc.rpt" "R_pinky3_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "R_pinky1_loc.pm" "R_pinky3_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "R_pinky3_loc_Grp_pointConstraint1.w0" "R_pinky3_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "R_pinky4_loc.t" "R_pinky3_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "R_pinky4_loc.rp" "R_pinky3_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "R_pinky4_loc.rpt" "R_pinky3_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "R_pinky4_loc.pm" "R_pinky3_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "R_pinky3_loc_Grp_pointConstraint1.w1" "R_pinky3_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "R_pinky_aimVector_Grp_aimConstraint1.crx" "R_pinky_aimVector_Grp.rx"
		;
connectAttr "R_pinky_aimVector_Grp_aimConstraint1.cry" "R_pinky_aimVector_Grp.ry"
		;
connectAttr "R_pinky_aimVector_Grp_aimConstraint1.crz" "R_pinky_aimVector_Grp.rz"
		;
connectAttr "R_pinky_aimVector_Grp.pim" "R_pinky_aimVector_Grp_aimConstraint1.cpim"
		;
connectAttr "R_pinky_aimVector_Grp.t" "R_pinky_aimVector_Grp_aimConstraint1.ct";
connectAttr "R_pinky_aimVector_Grp.rp" "R_pinky_aimVector_Grp_aimConstraint1.crp"
		;
connectAttr "R_pinky_aimVector_Grp.rpt" "R_pinky_aimVector_Grp_aimConstraint1.crt"
		;
connectAttr "R_pinky_aimVector_Grp.ro" "R_pinky_aimVector_Grp_aimConstraint1.cro"
		;
connectAttr "R_pinky2_loc.t" "R_pinky_aimVector_Grp_aimConstraint1.tg[0].tt";
connectAttr "R_pinky2_loc.rp" "R_pinky_aimVector_Grp_aimConstraint1.tg[0].trp";
connectAttr "R_pinky2_loc.rpt" "R_pinky_aimVector_Grp_aimConstraint1.tg[0].trt";
connectAttr "R_pinky2_loc.pm" "R_pinky_aimVector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "R_pinky_aimVector_Grp_aimConstraint1.w0" "R_pinky_aimVector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "R_pinky1_loc.wm" "R_pinky_aimVector_Grp_aimConstraint1.wum";
connectAttr "R_ring2_loc_Grp_pointConstraint1.ctx" "R_ring2_loc_Grp.tx";
connectAttr "R_ring2_loc_Grp_pointConstraint1.cty" "R_ring2_loc_Grp.ty";
connectAttr "R_ring2_loc_Grp_pointConstraint1.ctz" "R_ring2_loc_Grp.tz";
connectAttr "R_ring2_loc_Grp.pim" "R_ring2_loc_Grp_pointConstraint1.cpim";
connectAttr "R_ring2_loc_Grp.rp" "R_ring2_loc_Grp_pointConstraint1.crp";
connectAttr "R_ring2_loc_Grp.rpt" "R_ring2_loc_Grp_pointConstraint1.crt";
connectAttr "R_ring1_loc.t" "R_ring2_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "R_ring1_loc.rp" "R_ring2_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "R_ring1_loc.rpt" "R_ring2_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "R_ring1_loc.pm" "R_ring2_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "R_ring2_loc_Grp_pointConstraint1.w0" "R_ring2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "R_ring4_loc.t" "R_ring2_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "R_ring4_loc.rp" "R_ring2_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "R_ring4_loc.rpt" "R_ring2_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "R_ring4_loc.pm" "R_ring2_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "R_ring2_loc_Grp_pointConstraint1.w1" "R_ring2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "R_ring3_loc_Grp_pointConstraint1.ctx" "R_ring3_loc_Grp.tx";
connectAttr "R_ring3_loc_Grp_pointConstraint1.cty" "R_ring3_loc_Grp.ty";
connectAttr "R_ring3_loc_Grp_pointConstraint1.ctz" "R_ring3_loc_Grp.tz";
connectAttr "R_ring3_loc_Grp.pim" "R_ring3_loc_Grp_pointConstraint1.cpim";
connectAttr "R_ring3_loc_Grp.rp" "R_ring3_loc_Grp_pointConstraint1.crp";
connectAttr "R_ring3_loc_Grp.rpt" "R_ring3_loc_Grp_pointConstraint1.crt";
connectAttr "R_ring1_loc.t" "R_ring3_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "R_ring1_loc.rp" "R_ring3_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "R_ring1_loc.rpt" "R_ring3_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "R_ring1_loc.pm" "R_ring3_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "R_ring3_loc_Grp_pointConstraint1.w0" "R_ring3_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "R_ring4_loc.t" "R_ring3_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "R_ring4_loc.rp" "R_ring3_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "R_ring4_loc.rpt" "R_ring3_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "R_ring4_loc.pm" "R_ring3_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "R_ring3_loc_Grp_pointConstraint1.w1" "R_ring3_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "R_ring_aimVector_Grp_aimConstraint1.crx" "R_ring_aimVector_Grp.rx";
connectAttr "R_ring_aimVector_Grp_aimConstraint1.cry" "R_ring_aimVector_Grp.ry";
connectAttr "R_ring_aimVector_Grp_aimConstraint1.crz" "R_ring_aimVector_Grp.rz";
connectAttr "R_ring_aimVector_Grp.pim" "R_ring_aimVector_Grp_aimConstraint1.cpim"
		;
connectAttr "R_ring_aimVector_Grp.t" "R_ring_aimVector_Grp_aimConstraint1.ct";
connectAttr "R_ring_aimVector_Grp.rp" "R_ring_aimVector_Grp_aimConstraint1.crp";
connectAttr "R_ring_aimVector_Grp.rpt" "R_ring_aimVector_Grp_aimConstraint1.crt"
		;
connectAttr "R_ring_aimVector_Grp.ro" "R_ring_aimVector_Grp_aimConstraint1.cro";
connectAttr "R_ring2_loc.t" "R_ring_aimVector_Grp_aimConstraint1.tg[0].tt";
connectAttr "R_ring2_loc.rp" "R_ring_aimVector_Grp_aimConstraint1.tg[0].trp";
connectAttr "R_ring2_loc.rpt" "R_ring_aimVector_Grp_aimConstraint1.tg[0].trt";
connectAttr "R_ring2_loc.pm" "R_ring_aimVector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "R_ring_aimVector_Grp_aimConstraint1.w0" "R_ring_aimVector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "R_ring1_loc.wm" "R_ring_aimVector_Grp_aimConstraint1.wum";
connectAttr "R_index2_loc_Grp_pointConstraint1.ctx" "R_index2_loc_Grp.tx";
connectAttr "R_index2_loc_Grp_pointConstraint1.cty" "R_index2_loc_Grp.ty";
connectAttr "R_index2_loc_Grp_pointConstraint1.ctz" "R_index2_loc_Grp.tz";
connectAttr "R_index2_loc_Grp.pim" "R_index2_loc_Grp_pointConstraint1.cpim";
connectAttr "R_index2_loc_Grp.rp" "R_index2_loc_Grp_pointConstraint1.crp";
connectAttr "R_index2_loc_Grp.rpt" "R_index2_loc_Grp_pointConstraint1.crt";
connectAttr "R_index1_loc.t" "R_index2_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "R_index1_loc.rp" "R_index2_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "R_index1_loc.rpt" "R_index2_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "R_index1_loc.pm" "R_index2_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "R_index2_loc_Grp_pointConstraint1.w0" "R_index2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "R_index4_loc.t" "R_index2_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "R_index4_loc.rp" "R_index2_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "R_index4_loc.rpt" "R_index2_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "R_index4_loc.pm" "R_index2_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "R_index2_loc_Grp_pointConstraint1.w1" "R_index2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "R_index3_loc_Grp_pointConstraint1.ctx" "R_index3_loc_Grp.tx";
connectAttr "R_index3_loc_Grp_pointConstraint1.cty" "R_index3_loc_Grp.ty";
connectAttr "R_index3_loc_Grp_pointConstraint1.ctz" "R_index3_loc_Grp.tz";
connectAttr "R_index3_loc_Grp.pim" "R_index3_loc_Grp_pointConstraint1.cpim";
connectAttr "R_index3_loc_Grp.rp" "R_index3_loc_Grp_pointConstraint1.crp";
connectAttr "R_index3_loc_Grp.rpt" "R_index3_loc_Grp_pointConstraint1.crt";
connectAttr "R_index1_loc.t" "R_index3_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "R_index1_loc.rp" "R_index3_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "R_index1_loc.rpt" "R_index3_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "R_index1_loc.pm" "R_index3_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "R_index3_loc_Grp_pointConstraint1.w0" "R_index3_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "R_index4_loc.t" "R_index3_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "R_index4_loc.rp" "R_index3_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "R_index4_loc.rpt" "R_index3_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "R_index4_loc.pm" "R_index3_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "R_index3_loc_Grp_pointConstraint1.w1" "R_index3_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "R_index_aimVector_Grp_aimConstraint1.crx" "R_index_aimVector_Grp.rx"
		;
connectAttr "R_index_aimVector_Grp_aimConstraint1.cry" "R_index_aimVector_Grp.ry"
		;
connectAttr "R_index_aimVector_Grp_aimConstraint1.crz" "R_index_aimVector_Grp.rz"
		;
connectAttr "R_index_aimVector_Grp.pim" "R_index_aimVector_Grp_aimConstraint1.cpim"
		;
connectAttr "R_index_aimVector_Grp.t" "R_index_aimVector_Grp_aimConstraint1.ct";
connectAttr "R_index_aimVector_Grp.rp" "R_index_aimVector_Grp_aimConstraint1.crp"
		;
connectAttr "R_index_aimVector_Grp.rpt" "R_index_aimVector_Grp_aimConstraint1.crt"
		;
connectAttr "R_index_aimVector_Grp.ro" "R_index_aimVector_Grp_aimConstraint1.cro"
		;
connectAttr "R_index2_loc.t" "R_index_aimVector_Grp_aimConstraint1.tg[0].tt";
connectAttr "R_index2_loc.rp" "R_index_aimVector_Grp_aimConstraint1.tg[0].trp";
connectAttr "R_index2_loc.rpt" "R_index_aimVector_Grp_aimConstraint1.tg[0].trt";
connectAttr "R_index2_loc.pm" "R_index_aimVector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "R_index_aimVector_Grp_aimConstraint1.w0" "R_index_aimVector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "R_index1_loc.wm" "R_index_aimVector_Grp_aimConstraint1.wum";
connectAttr "R_middle2_loc_Grp_pointConstraint1.ctx" "R_middle2_loc_Grp.tx";
connectAttr "R_middle2_loc_Grp_pointConstraint1.cty" "R_middle2_loc_Grp.ty";
connectAttr "R_middle2_loc_Grp_pointConstraint1.ctz" "R_middle2_loc_Grp.tz";
connectAttr "R_middle2_loc_Grp.pim" "R_middle2_loc_Grp_pointConstraint1.cpim";
connectAttr "R_middle2_loc_Grp.rp" "R_middle2_loc_Grp_pointConstraint1.crp";
connectAttr "R_middle2_loc_Grp.rpt" "R_middle2_loc_Grp_pointConstraint1.crt";
connectAttr "R_middle1_loc.t" "R_middle2_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "R_middle1_loc.rp" "R_middle2_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "R_middle1_loc.rpt" "R_middle2_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "R_middle1_loc.pm" "R_middle2_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "R_middle2_loc_Grp_pointConstraint1.w0" "R_middle2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "R_middle4_loc.t" "R_middle2_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "R_middle4_loc.rp" "R_middle2_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "R_middle4_loc.rpt" "R_middle2_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "R_middle4_loc.pm" "R_middle2_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "R_middle2_loc_Grp_pointConstraint1.w1" "R_middle2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "R_middle3_loc_Grp_pointConstraint1.ctx" "R_middle3_loc_Grp.tx";
connectAttr "R_middle3_loc_Grp_pointConstraint1.cty" "R_middle3_loc_Grp.ty";
connectAttr "R_middle3_loc_Grp_pointConstraint1.ctz" "R_middle3_loc_Grp.tz";
connectAttr "R_middle3_loc_Grp.pim" "R_middle3_loc_Grp_pointConstraint1.cpim";
connectAttr "R_middle3_loc_Grp.rp" "R_middle3_loc_Grp_pointConstraint1.crp";
connectAttr "R_middle3_loc_Grp.rpt" "R_middle3_loc_Grp_pointConstraint1.crt";
connectAttr "R_middle1_loc.t" "R_middle3_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "R_middle1_loc.rp" "R_middle3_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "R_middle1_loc.rpt" "R_middle3_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "R_middle1_loc.pm" "R_middle3_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "R_middle3_loc_Grp_pointConstraint1.w0" "R_middle3_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "R_middle4_loc.t" "R_middle3_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "R_middle4_loc.rp" "R_middle3_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "R_middle4_loc.rpt" "R_middle3_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "R_middle4_loc.pm" "R_middle3_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "R_middle3_loc_Grp_pointConstraint1.w1" "R_middle3_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "R_middle_aimVector_Grp_aimConstraint1.crx" "R_middle_aimVector_Grp.rx"
		;
connectAttr "R_middle_aimVector_Grp_aimConstraint1.cry" "R_middle_aimVector_Grp.ry"
		;
connectAttr "R_middle_aimVector_Grp_aimConstraint1.crz" "R_middle_aimVector_Grp.rz"
		;
connectAttr "R_middle_aimVector_Grp.pim" "R_middle_aimVector_Grp_aimConstraint1.cpim"
		;
connectAttr "R_middle_aimVector_Grp.t" "R_middle_aimVector_Grp_aimConstraint1.ct"
		;
connectAttr "R_middle_aimVector_Grp.rp" "R_middle_aimVector_Grp_aimConstraint1.crp"
		;
connectAttr "R_middle_aimVector_Grp.rpt" "R_middle_aimVector_Grp_aimConstraint1.crt"
		;
connectAttr "R_middle_aimVector_Grp.ro" "R_middle_aimVector_Grp_aimConstraint1.cro"
		;
connectAttr "R_middle2_loc.t" "R_middle_aimVector_Grp_aimConstraint1.tg[0].tt";
connectAttr "R_middle2_loc.rp" "R_middle_aimVector_Grp_aimConstraint1.tg[0].trp"
		;
connectAttr "R_middle2_loc.rpt" "R_middle_aimVector_Grp_aimConstraint1.tg[0].trt"
		;
connectAttr "R_middle2_loc.pm" "R_middle_aimVector_Grp_aimConstraint1.tg[0].tpm"
		;
connectAttr "R_middle_aimVector_Grp_aimConstraint1.w0" "R_middle_aimVector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "R_middle1_loc.wm" "R_middle_aimVector_Grp_aimConstraint1.wum";
connectAttr "R_handRoot_mirror.ro" "R_handRoot_mirror_parentConstraint1.cro";
connectAttr "R_handRoot_mirror.pim" "R_handRoot_mirror_parentConstraint1.cpim";
connectAttr "R_handRoot_mirror.rp" "R_handRoot_mirror_parentConstraint1.crp";
connectAttr "R_handRoot_mirror.rpt" "R_handRoot_mirror_parentConstraint1.crt";
connectAttr "R_wrist_loc.t" "R_handRoot_mirror_parentConstraint1.tg[0].tt";
connectAttr "R_wrist_loc.rp" "R_handRoot_mirror_parentConstraint1.tg[0].trp";
connectAttr "R_wrist_loc.rpt" "R_handRoot_mirror_parentConstraint1.tg[0].trt";
connectAttr "R_wrist_loc.r" "R_handRoot_mirror_parentConstraint1.tg[0].tr";
connectAttr "R_wrist_loc.ro" "R_handRoot_mirror_parentConstraint1.tg[0].tro";
connectAttr "R_wrist_loc.s" "R_handRoot_mirror_parentConstraint1.tg[0].ts";
connectAttr "R_wrist_loc.pm" "R_handRoot_mirror_parentConstraint1.tg[0].tpm";
connectAttr "R_handRoot_mirror_parentConstraint1.w0" "R_handRoot_mirror_parentConstraint1.tg[0].tw"
		;
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
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
// End of guide_biped.ma
