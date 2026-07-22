//Maya ASCII 2022 scene
//Name: guide_bipad_root.ma
//Last modified: Wed, Jul 22, 2026 12:54:09 PM
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
fileInfo "UUID" "4FB3D070-423F-DBAB-6485-E091A66E23F9";
createNode transform -s -n "persp";
	rename -uid "E98F2045-41CF-383A-1CE8-38B73E6C7918";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.37049093731101834 137.21657040495896 130.13083694960551 ;
	setAttr ".r" -type "double3" -36.338352729608211 359.79999999990201 2.3605823091239599e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "2AC9D49C-4FB1-6C91-B00F-20B93A1B746F";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 164.59023690005708;
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
createNode transform -n "C_root_nonParent";
	rename -uid "32B077C1-4EE4-5706-8EC1-EA96F01D924D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "container";
	setAttr ".rig_data" -type "string" "group";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "C_neck_Crv" -p "C_root_nonParent";
	rename -uid "7F835C6E-4ED5-EADC-02AC-A08133A1C975";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "C_neck_CrvShape" -p "C_neck_Crv";
	rename -uid "92FEEFA1-4299-DB9D-4692-F6AEF3C10091";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "neck";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "C_neck_CrvShape1Orig" -p "C_neck_Crv";
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
createNode transform -n "C_chest_Crv" -p "C_root_nonParent";
	rename -uid "65941274-4BD6-4E71-060B-15AA80D9AD82";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "C_chest_CrvShape" -p "C_chest_Crv";
	rename -uid "E18A63C5-4162-AB9F-B8B0-288C3E8F9E71";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "chest";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "C_root_mirror";
	rename -uid "BB037801-45CD-2BDD-7A90-40948BB40BF6";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".t" -type "double3" 0 22 0 ;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "mirror";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "C_root_loc_Grp" -p "C_root_mirror";
	rename -uid "5F265CF3-4724-95A8-00B2-02AC9A340E8F";
createNode transform -n "C_root_loc" -p "C_root_loc_Grp";
	rename -uid "3E3FD532-496F-2DC4-CF29-2A81729136B6";
	addAttr -ci true -k true -sn "insertJnt" -ln "insertJnt" -min 0 -at "long";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 16;
	setAttr -k on ".insertJnt" 4;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "root";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "C_root_locShape" -p "C_root_loc";
	rename -uid "9B6E059A-4C98-BECF-0974-3393CF632A3B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "C_splne2_loc_Grp" -p "C_root_loc";
	rename -uid "D5BBF632-4C42-3600-BEFB-B88FDC2B9EAB";
createNode transform -n "C_splne2_loc" -p "C_splne2_loc_Grp";
	rename -uid "A9B673C3-41EB-13DF-681A-DB81841A91F2";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".t" -type "double3" -0.07342204270015884 -4.9737991503207013e-13 0 ;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "splne2";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "C_splne2_locShape" -p "C_splne2_loc";
	rename -uid "17863E37-44EC-909D-E42F-37BA67903EED";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode pointConstraint -n "C_splne2_loc_Grp_pointConstraint1" -p "C_splne2_loc_Grp";
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
createNode transform -n "C_splne1_loc_Grp" -p "C_root_loc";
	rename -uid "03C46C3C-420D-DC82-D3DE-A09643C8859F";
createNode transform -n "C_splne1_loc" -p "C_splne1_loc_Grp";
	rename -uid "61B9F5BB-45E7-FECA-BAF1-65AC7E410574";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "splne1";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "C_splne1_locShape" -p "C_splne1_loc";
	rename -uid "9BDD4978-420A-E12A-F036-0B84CAFFF286";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode pointConstraint -n "C_splne1_loc_Grp_pointConstraint1" -p "C_splne1_loc_Grp";
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
createNode transform -n "C_neckRoot_loc_Grp" -p "C_root_loc";
	rename -uid "FD793313-4242-AEF3-8464-F29CFA93FF7F";
createNode transform -n "C_neckRoot_loc" -p "C_neckRoot_loc_Grp";
	rename -uid "C8CBD832-4146-9793-777D-2CA173BF4C74";
	addAttr -ci true -k true -sn "insertJnt" -ln "insertJnt" -min 0 -at "long";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 16;
	setAttr -k on ".insertJnt" 4;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "neckRoot";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "C_neckRoot_locShape" -p "C_neckRoot_loc";
	rename -uid "DD20F9A3-40A4-F3C9-E68F-3FA5314CEEBF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_neckRootExtra_loc_Grp" -p "C_neckRoot_loc";
	rename -uid "3F0F1D5E-4BBE-5ABC-61AC-58A95C62BABF";
createNode transform -n "C_neckRootExtra_loc" -p "C_neckRootExtra_loc_Grp";
	rename -uid "DA51EAF0-4F1A-9C0A-F8ED-43ADDA2C2E29";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "neckRoot";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "C_neckRootExtra_locShape" -p "C_neckRootExtra_loc";
	rename -uid "FFC6A147-47BE-0AFC-D6ED-B6A1D64F7969";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "C_neckRootExtra_loc_Grp_pointConstraint1" -p "C_neckRootExtra_loc_Grp";
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
createNode transform -n "C_neckEndExtra_loc_Grp" -p "C_neckRoot_loc";
	rename -uid "F2923AF7-4C4F-D675-426C-3B9B861634FC";
createNode transform -n "C_neckEndExtra_loc" -p "C_neckEndExtra_loc_Grp";
	rename -uid "DFB9BFD4-4E2E-3ADE-D0FC-2792E40495B6";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "neckEnd";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "C_neckEndExtra_locShape" -p "C_neckEndExtra_loc";
	rename -uid "1B5A7FE6-40AF-BEBE-30B5-96B64AB8110B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "C_neckEndExtra_loc_Grp_pointConstraint1" -p "C_neckEndExtra_loc_Grp";
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
createNode transform -n "C_neckEnd_loc_Grp" -p "C_neckRoot_loc";
	rename -uid "741A0674-44D8-A914-323E-ED8B94658960";
	setAttr ".t" -type "double3" 0 6 0 ;
createNode transform -n "C_neckEnd_loc" -p "C_neckEnd_loc_Grp";
	rename -uid "3C15D887-4273-C2DA-2244-75866412FA64";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".v" no;
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "neckEnd";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "C_neckEnd_locShape" -p "C_neckEnd_loc";
	rename -uid "79794180-485E-C96A-04A6-E098AEB1A961";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_neckRoot_vector_Grp" -p "C_neckRoot_loc";
	rename -uid "EC1A814B-439E-1E6C-9E2E-9085EDF90B1A";
createNode transform -n "C_neckRoot_vector" -p "C_neckRoot_vector_Grp";
	rename -uid "3F4E2448-4C02-6E0D-A035-269F027A3FA0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "neckRoot";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "C_neckRoot_vectorShape" -p "C_neckRoot_vector";
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
createNode aimConstraint -n "C_neckRoot_vector_Grp_aimConstraint1" -p "C_neckRoot_vector_Grp";
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
createNode transform -n "C_neck_loc_Grp" -p "C_neckRoot_loc";
	rename -uid "353BD92A-46A8-DC68-A0DD-11A648F60EA2";
createNode transform -n "C_neck_loc" -p "C_neck_loc_Grp";
	rename -uid "90932617-46CC-FE78-BA0F-E485A350BFB1";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "neck";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "C_neck_locShape" -p "C_neck_loc";
	rename -uid "BEF061A5-47E2-7969-B932-DD93C86A03E6";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "C_neck_loc_Grp_pointConstraint1" -p "C_neck_loc_Grp";
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
createNode pointConstraint -n "C_neckRoot_loc_Grp_pointConstraint1" -p "C_neckRoot_loc_Grp";
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
createNode transform -n "C_chest_loc_Grp" -p "C_root_loc";
	rename -uid "8DC482D6-4DE0-5B1C-8914-2EBB6C8B331B";
	setAttr ".t" -type "double3" 0 22 0 ;
createNode transform -n "C_chest_loc" -p "C_chest_loc_Grp";
	rename -uid "649567CA-41AE-ED71-6741-C4A3ADA35EBB";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "chest";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "C_chest_locShape" -p "C_chest_loc";
	rename -uid "E4FC0FC5-448A-F9E6-1152-A3830F411B42";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "C_chestExtra_loc_Grp" -p "C_root_loc";
	rename -uid "984A7306-4A1C-AAD4-9FE0-E4B6585A2386";
createNode transform -n "C_chestExtra_loc" -p "C_chestExtra_loc_Grp";
	rename -uid "50B5EF52-494C-44C6-D81C-86B1DE05991A";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "chest";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "C_chestExtra_locShape" -p "C_chestExtra_loc";
	rename -uid "97FACD23-4249-172F-DC29-DE97B7164CD4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "C_chestExtra_loc_Grp_pointConstraint1" -p "C_chestExtra_loc_Grp";
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
createNode transform -n "C_rootExtra_loc_Grp" -p "C_root_loc";
	rename -uid "51E7319C-40BD-63C0-CC46-15B70580637E";
createNode transform -n "C_rootExtra_loc" -p "C_rootExtra_loc_Grp";
	rename -uid "73E15950-4136-12C3-A6D1-F8B1B6CB763E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "root";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "C_rootExtra_locShape" -p "C_rootExtra_loc";
	rename -uid "693234FA-4647-6E26-EF7E-10A0D6211AFF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "C_rootExtra_loc_Grp_pointConstraint1" -p "C_rootExtra_loc_Grp";
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
createNode transform -n "C_root_vector_Grp" -p "C_root_loc";
	rename -uid "28ECE944-42B6-1DC7-D3A3-FAAC095DC02A";
createNode transform -n "C_root_vector" -p "C_root_vector_Grp";
	rename -uid "1C309548-4F81-D01E-39C9-EC83C3FD9687";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "root";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "C_root_vectorShape" -p "C_root_vector";
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
createNode aimConstraint -n "C_root_vector_Grp_aimConstraint1" -p "C_root_vector_Grp";
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
createNode lightLinker -s -n "lightLinker1";
	rename -uid "5605203C-47E7-F640-998C-45A785E153EB";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "B4AC166C-48F0-3F76-FAF9-8BB0A180DA87";
createNode displayLayer -n "defaultLayer";
	rename -uid "287D8167-4032-53EE-4996-8685FE0C83E8";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "398DC4B1-4FAD-0F4E-4EE2-B998641A8CF6";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "F04BB8FA-4375-B4F3-1D64-59B7C4140232";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager1";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer1";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager4";
	rename -uid "BBE41C10-4842-0E74-7A1D-059EC6677024";
createNode poseInterpolatorManager -n "poseInterpolatorManager4";
	rename -uid "B035F0B4-43A2-9A11-B642-F3BC309482B9";
createNode renderLayerManager -n "renderLayerManager2";
	rename -uid "2204E19E-4CC0-AAF8-3205-5FA0D67F8C04";
createNode renderLayer -n "defaultRenderLayer2";
	rename -uid "6817F74C-491A-16D8-CF48-E1A2A60FB2C6";
	setAttr ".g" yes;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "E8F637EB-4282-CD72-3992-088B3BAE8F67";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode VRaySettingsNode -s -n "vraySettings";
	rename -uid "087A4F19-41FE-B09C-54A8-89A6D78A92FA";
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
	rename -uid "29300D3B-4553-A975-CD55-95953AFB3281";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "5BFE9FE0-49A9-8818-A376-BDBAAF24F1C2";
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
connectAttr "C_neckRoot_locShape.wp" "C_neck_CrvShape.cp[0]";
connectAttr "C_neckRootExtra_locShape.wp" "C_neck_CrvShape.cp[1]";
connectAttr "C_neck_locShape.wp" "C_neck_CrvShape.cp[2]";
connectAttr "C_neckEndExtra_locShape.wp" "C_neck_CrvShape.cp[3]";
connectAttr "C_neckEnd_locShape.wp" "C_neck_CrvShape.cp[4]";
connectAttr "C_root_locShape.wp" "C_chest_CrvShape.cp[0]";
connectAttr "C_rootExtra_locShape.wp" "C_chest_CrvShape.cp[1]";
connectAttr "C_splne1_locShape.wp" "C_chest_CrvShape.cp[2]";
connectAttr "C_splne2_locShape.wp" "C_chest_CrvShape.cp[3]";
connectAttr "C_chestExtra_locShape.wp" "C_chest_CrvShape.cp[4]";
connectAttr "C_chest_locShape.wp" "C_chest_CrvShape.cp[5]";
connectAttr "C_splne2_loc_Grp_pointConstraint1.ctx" "C_splne2_loc_Grp.tx";
connectAttr "C_splne2_loc_Grp_pointConstraint1.cty" "C_splne2_loc_Grp.ty";
connectAttr "C_splne2_loc_Grp_pointConstraint1.ctz" "C_splne2_loc_Grp.tz";
connectAttr "C_splne2_loc_Grp.pim" "C_splne2_loc_Grp_pointConstraint1.cpim";
connectAttr "C_splne2_loc_Grp.rp" "C_splne2_loc_Grp_pointConstraint1.crp";
connectAttr "C_splne2_loc_Grp.rpt" "C_splne2_loc_Grp_pointConstraint1.crt";
connectAttr "C_root_loc.t" "C_splne2_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "C_root_loc.rp" "C_splne2_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "C_root_loc.rpt" "C_splne2_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "C_root_loc.pm" "C_splne2_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "C_splne2_loc_Grp_pointConstraint1.w0" "C_splne2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_chest_loc.t" "C_splne2_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "C_chest_loc.rp" "C_splne2_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "C_chest_loc.rpt" "C_splne2_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "C_chest_loc.pm" "C_splne2_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "C_splne2_loc_Grp_pointConstraint1.w1" "C_splne2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "C_splne1_loc_Grp_pointConstraint1.ctx" "C_splne1_loc_Grp.tx";
connectAttr "C_splne1_loc_Grp_pointConstraint1.cty" "C_splne1_loc_Grp.ty";
connectAttr "C_splne1_loc_Grp_pointConstraint1.ctz" "C_splne1_loc_Grp.tz";
connectAttr "C_splne1_loc_Grp.pim" "C_splne1_loc_Grp_pointConstraint1.cpim";
connectAttr "C_splne1_loc_Grp.rp" "C_splne1_loc_Grp_pointConstraint1.crp";
connectAttr "C_splne1_loc_Grp.rpt" "C_splne1_loc_Grp_pointConstraint1.crt";
connectAttr "C_root_loc.t" "C_splne1_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "C_root_loc.rp" "C_splne1_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "C_root_loc.rpt" "C_splne1_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "C_root_loc.pm" "C_splne1_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "C_splne1_loc_Grp_pointConstraint1.w0" "C_splne1_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_chest_loc.t" "C_splne1_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "C_chest_loc.rp" "C_splne1_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "C_chest_loc.rpt" "C_splne1_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "C_chest_loc.pm" "C_splne1_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "C_splne1_loc_Grp_pointConstraint1.w1" "C_splne1_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "C_neckRoot_loc_Grp_pointConstraint1.ctx" "C_neckRoot_loc_Grp.tx";
connectAttr "C_neckRoot_loc_Grp_pointConstraint1.cty" "C_neckRoot_loc_Grp.ty";
connectAttr "C_neckRoot_loc_Grp_pointConstraint1.ctz" "C_neckRoot_loc_Grp.tz";
connectAttr "C_neckRootExtra_loc_Grp_pointConstraint1.ctx" "C_neckRootExtra_loc_Grp.tx"
		;
connectAttr "C_neckRootExtra_loc_Grp_pointConstraint1.cty" "C_neckRootExtra_loc_Grp.ty"
		;
connectAttr "C_neckRootExtra_loc_Grp_pointConstraint1.ctz" "C_neckRootExtra_loc_Grp.tz"
		;
connectAttr "C_neckRootExtra_loc_Grp.pim" "C_neckRootExtra_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "C_neckRootExtra_loc_Grp.rp" "C_neckRootExtra_loc_Grp_pointConstraint1.crp"
		;
connectAttr "C_neckRootExtra_loc_Grp.rpt" "C_neckRootExtra_loc_Grp_pointConstraint1.crt"
		;
connectAttr "C_neckRoot_loc.t" "C_neckRootExtra_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "C_neckRoot_loc.rp" "C_neckRootExtra_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "C_neckRoot_loc.rpt" "C_neckRootExtra_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "C_neckRoot_loc.pm" "C_neckRootExtra_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "C_neckRootExtra_loc_Grp_pointConstraint1.w0" "C_neckRootExtra_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_neck_loc.t" "C_neckRootExtra_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "C_neck_loc.rp" "C_neckRootExtra_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "C_neck_loc.rpt" "C_neckRootExtra_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "C_neck_loc.pm" "C_neckRootExtra_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "C_neckRootExtra_loc_Grp_pointConstraint1.w1" "C_neckRootExtra_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "C_neckEndExtra_loc_Grp_pointConstraint1.ctx" "C_neckEndExtra_loc_Grp.tx"
		;
connectAttr "C_neckEndExtra_loc_Grp_pointConstraint1.cty" "C_neckEndExtra_loc_Grp.ty"
		;
connectAttr "C_neckEndExtra_loc_Grp_pointConstraint1.ctz" "C_neckEndExtra_loc_Grp.tz"
		;
connectAttr "C_neckEndExtra_loc_Grp.pim" "C_neckEndExtra_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "C_neckEndExtra_loc_Grp.rp" "C_neckEndExtra_loc_Grp_pointConstraint1.crp"
		;
connectAttr "C_neckEndExtra_loc_Grp.rpt" "C_neckEndExtra_loc_Grp_pointConstraint1.crt"
		;
connectAttr "C_neck_loc.t" "C_neckEndExtra_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "C_neck_loc.rp" "C_neckEndExtra_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "C_neck_loc.rpt" "C_neckEndExtra_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "C_neck_loc.pm" "C_neckEndExtra_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "C_neckEndExtra_loc_Grp_pointConstraint1.w0" "C_neckEndExtra_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_neckEnd_loc.t" "C_neckEndExtra_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "C_neckEnd_loc.rp" "C_neckEndExtra_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "C_neckEnd_loc.rpt" "C_neckEndExtra_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "C_neckEnd_loc.pm" "C_neckEndExtra_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "C_neckEndExtra_loc_Grp_pointConstraint1.w1" "C_neckEndExtra_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "C_neckRoot_vector_Grp_aimConstraint1.crx" "C_neckRoot_vector_Grp.rx"
		;
connectAttr "C_neckRoot_vector_Grp_aimConstraint1.cry" "C_neckRoot_vector_Grp.ry"
		;
connectAttr "C_neckRoot_vector_Grp_aimConstraint1.crz" "C_neckRoot_vector_Grp.rz"
		;
connectAttr "C_neckRoot_vector_Grp.pim" "C_neckRoot_vector_Grp_aimConstraint1.cpim"
		;
connectAttr "C_neckRoot_vector_Grp.t" "C_neckRoot_vector_Grp_aimConstraint1.ct";
connectAttr "C_neckRoot_vector_Grp.rp" "C_neckRoot_vector_Grp_aimConstraint1.crp"
		;
connectAttr "C_neckRoot_vector_Grp.rpt" "C_neckRoot_vector_Grp_aimConstraint1.crt"
		;
connectAttr "C_neckRoot_vector_Grp.ro" "C_neckRoot_vector_Grp_aimConstraint1.cro"
		;
connectAttr "C_neck_loc.t" "C_neckRoot_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "C_neck_loc.rp" "C_neckRoot_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "C_neck_loc.rpt" "C_neckRoot_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "C_neck_loc.pm" "C_neckRoot_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "C_neckRoot_vector_Grp_aimConstraint1.w0" "C_neckRoot_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "C_neckRoot_loc.wm" "C_neckRoot_vector_Grp_aimConstraint1.wum";
connectAttr "C_neck_loc_Grp_pointConstraint1.ctx" "C_neck_loc_Grp.tx";
connectAttr "C_neck_loc_Grp_pointConstraint1.cty" "C_neck_loc_Grp.ty";
connectAttr "C_neck_loc_Grp_pointConstraint1.ctz" "C_neck_loc_Grp.tz";
connectAttr "C_neck_loc_Grp.pim" "C_neck_loc_Grp_pointConstraint1.cpim";
connectAttr "C_neck_loc_Grp.rp" "C_neck_loc_Grp_pointConstraint1.crp";
connectAttr "C_neck_loc_Grp.rpt" "C_neck_loc_Grp_pointConstraint1.crt";
connectAttr "C_neckRoot_loc.t" "C_neck_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "C_neckRoot_loc.rp" "C_neck_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "C_neckRoot_loc.rpt" "C_neck_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "C_neckRoot_loc.pm" "C_neck_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "C_neck_loc_Grp_pointConstraint1.w0" "C_neck_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_neckEnd_loc.t" "C_neck_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "C_neckEnd_loc.rp" "C_neck_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "C_neckEnd_loc.rpt" "C_neck_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "C_neckEnd_loc.pm" "C_neck_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "C_neck_loc_Grp_pointConstraint1.w1" "C_neck_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "C_neckRoot_loc_Grp.pim" "C_neckRoot_loc_Grp_pointConstraint1.cpim";
connectAttr "C_neckRoot_loc_Grp.rp" "C_neckRoot_loc_Grp_pointConstraint1.crp";
connectAttr "C_neckRoot_loc_Grp.rpt" "C_neckRoot_loc_Grp_pointConstraint1.crt";
connectAttr "C_chest_loc.t" "C_neckRoot_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "C_chest_loc.rp" "C_neckRoot_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "C_chest_loc.rpt" "C_neckRoot_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "C_chest_loc.pm" "C_neckRoot_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "C_neckRoot_loc_Grp_pointConstraint1.w0" "C_neckRoot_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_chestExtra_loc_Grp_pointConstraint1.ctx" "C_chestExtra_loc_Grp.tx"
		;
connectAttr "C_chestExtra_loc_Grp_pointConstraint1.cty" "C_chestExtra_loc_Grp.ty"
		;
connectAttr "C_chestExtra_loc_Grp_pointConstraint1.ctz" "C_chestExtra_loc_Grp.tz"
		;
connectAttr "C_chestExtra_loc_Grp.pim" "C_chestExtra_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "C_chestExtra_loc_Grp.rp" "C_chestExtra_loc_Grp_pointConstraint1.crp"
		;
connectAttr "C_chestExtra_loc_Grp.rpt" "C_chestExtra_loc_Grp_pointConstraint1.crt"
		;
connectAttr "C_splne2_loc.t" "C_chestExtra_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "C_splne2_loc.rp" "C_chestExtra_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "C_splne2_loc.rpt" "C_chestExtra_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "C_splne2_loc.pm" "C_chestExtra_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "C_chestExtra_loc_Grp_pointConstraint1.w0" "C_chestExtra_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_chest_loc.t" "C_chestExtra_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "C_chest_loc.rp" "C_chestExtra_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "C_chest_loc.rpt" "C_chestExtra_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "C_chest_loc.pm" "C_chestExtra_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "C_chestExtra_loc_Grp_pointConstraint1.w1" "C_chestExtra_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "C_rootExtra_loc_Grp_pointConstraint1.ctx" "C_rootExtra_loc_Grp.tx";
connectAttr "C_rootExtra_loc_Grp_pointConstraint1.cty" "C_rootExtra_loc_Grp.ty";
connectAttr "C_rootExtra_loc_Grp_pointConstraint1.ctz" "C_rootExtra_loc_Grp.tz";
connectAttr "C_rootExtra_loc_Grp.pim" "C_rootExtra_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "C_rootExtra_loc_Grp.rp" "C_rootExtra_loc_Grp_pointConstraint1.crp";
connectAttr "C_rootExtra_loc_Grp.rpt" "C_rootExtra_loc_Grp_pointConstraint1.crt"
		;
connectAttr "C_root_loc.t" "C_rootExtra_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "C_root_loc.rp" "C_rootExtra_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "C_root_loc.rpt" "C_rootExtra_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "C_root_loc.pm" "C_rootExtra_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "C_rootExtra_loc_Grp_pointConstraint1.w0" "C_rootExtra_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_splne1_loc.t" "C_rootExtra_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "C_splne1_loc.rp" "C_rootExtra_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "C_splne1_loc.rpt" "C_rootExtra_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "C_splne1_loc.pm" "C_rootExtra_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "C_rootExtra_loc_Grp_pointConstraint1.w1" "C_rootExtra_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "C_root_vector_Grp_aimConstraint1.crx" "C_root_vector_Grp.rx";
connectAttr "C_root_vector_Grp_aimConstraint1.cry" "C_root_vector_Grp.ry";
connectAttr "C_root_vector_Grp_aimConstraint1.crz" "C_root_vector_Grp.rz";
connectAttr "C_root_vector_Grp.pim" "C_root_vector_Grp_aimConstraint1.cpim";
connectAttr "C_root_vector_Grp.t" "C_root_vector_Grp_aimConstraint1.ct";
connectAttr "C_root_vector_Grp.rp" "C_root_vector_Grp_aimConstraint1.crp";
connectAttr "C_root_vector_Grp.rpt" "C_root_vector_Grp_aimConstraint1.crt";
connectAttr "C_root_vector_Grp.ro" "C_root_vector_Grp_aimConstraint1.cro";
connectAttr "C_rootExtra_loc.t" "C_root_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "C_rootExtra_loc.rp" "C_root_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "C_rootExtra_loc.rpt" "C_root_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "C_rootExtra_loc.pm" "C_root_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "C_root_vector_Grp_aimConstraint1.w0" "C_root_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "C_root_loc.wm" "C_root_vector_Grp_aimConstraint1.wum";
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
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
// End of guide_bipad_root.ma
