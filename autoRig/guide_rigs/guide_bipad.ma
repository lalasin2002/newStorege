//Maya ASCII 2022 scene
//Name: guide_biped.ma
//Last modified: Tue, Jul 07, 2026 10:47:36 AM
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
fileInfo "UUID" "82C9C54D-4193-04E0-BE5B-1ABB3155C3EF";
createNode transform -s -n "persp";
	rename -uid "BA795C28-4794-797F-14AF-18A200F9E273";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 19.833844624903652 54.97428914982423 54.592431544747043 ;
	setAttr ".r" -type "double3" -17.738352729610043 15.000000000000142 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "CD55FF99-4174-7A25-15C8-8C96B686FB8B";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 54.791031157428243;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "B720481F-4721-246F-7094-E99428773B48";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "19BD2761-4DFF-D099-8F6E-99A68DFBE9D6";
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
	rename -uid "D3C85FBA-4772-C46D-EC44-2796D4C3E930";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "9C9F471C-449B-172C-F3FD-9D9B6CF72F73";
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
	rename -uid "B7DBCDC0-4C54-37BD-D37E-5DB986708F2F";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "9CFD41CD-4FCD-92A0-13DC-2194C7D70AB3";
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
createNode pointConstraint -n "C_neckEnd_loc_pointConstraint1" -p "C_neckEnd_loc";
	rename -uid "09E42F29-4D30-8383-4FFC-6A9C16F01802";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_head_locW0" -dv 1 -min 0 -at "double";
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
	setAttr -k on ".w0";
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
createNode transform -n "L_leg_nonParent";
	rename -uid "814818FC-4663-1325-2A29-C3945D5B5C2D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "container";
	setAttr ".rig_data" -type "string" "group";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_hip_Crv" -p "L_leg_nonParent";
	rename -uid "73AE9EBF-4898-407D-8B17-E7AB030D3904";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_hip_CrvShape" -p "L_hip_Crv";
	rename -uid "5F61BE36-496B-0F40-468E-6E804BD0790E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_knee_Crv" -p "L_leg_nonParent";
	rename -uid "ECA8E0AB-41FA-41A1-026E-B4B7D9292A4D";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_knee_CrvShape" -p "L_knee_Crv";
	rename -uid "2BB8BC9D-4D90-DBB8-74B3-72972D8235C3";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_ankle_Crv" -p "L_leg_nonParent";
	rename -uid "00C44461-4828-9DC5-F403-CCA7D8557753";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_ankle_CrvShape" -p "L_ankle_Crv";
	rename -uid "B70487E6-4BB4-DC72-ED53-1C8AD41B5829";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_toe_Crv" -p "L_leg_nonParent";
	rename -uid "E3E191D5-41BD-8522-AE4C-B786D8D8AA74";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_toe_CrvShape" -p "L_toe_Crv";
	rename -uid "29725EAC-4A6C-0D7C-5F24-CFAD22FD36B2";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_hip_mirror";
	rename -uid "F2B6A5E9-4DA7-D3B7-1C30-D9947FA93952";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "mirror";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_hip_loc_Grp" -p "L_hip_mirror";
	rename -uid "B2CFA9B0-4EAE-C4BE-A6D0-CFA286AEC192";
createNode transform -n "L_hip_loc" -p "L_hip_loc_Grp";
	rename -uid "512F3E41-4FA5-5558-D65F-38B22B743ECD";
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
	setAttr -k on ".insertJnt" 2;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_hip_locShape" -p "L_hip_loc";
	rename -uid "E41E47B1-452F-B041-74C0-C5A00A8810D2";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_knee_loc_Grp" -p "L_hip_loc";
	rename -uid "2D54C2C5-4866-A44E-361F-798F371D08EF";
	setAttr ".t" -type "double3" 0 -10 1 ;
createNode transform -n "L_knee_loc" -p "L_knee_loc_Grp";
	rename -uid "CE18D012-415C-34F0-A754-23B8E0985253";
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
	setAttr -k on ".insertJnt" 2;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_knee_locShape" -p "L_knee_loc";
	rename -uid "9838A280-4F2D-45F8-2129-FFA9B8DD3026";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_hipExtra_loc_Grp" -p "L_knee_loc";
	rename -uid "1EF38131-4555-2E0D-B17E-8A8A19B7617A";
createNode transform -n "L_hipExtra_loc" -p "L_hipExtra_loc_Grp";
	rename -uid "539CC65C-4555-A751-2404-5889174C659B";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_hipExtra_locShape" -p "L_hipExtra_loc";
	rename -uid "0EDF614D-4534-3742-170C-36B4A6E6D0B6";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_hipExtra_loc_Grp_parentConstraint1" -p "L_hipExtra_loc_Grp";
	rename -uid "47C53316-466E-B248-383E-C8AE8BDA8405";
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
	rename -uid "3B39E99F-478F-8945-B562-119EDE05BDB3";
createNode transform -n "L_ankleExtra_loc" -p "L_ankleExtra_loc_Grp";
	rename -uid "50EE6E7F-48BF-569D-1439-38A5D8EB6A3A";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_ankleExtra_locShape" -p "L_ankleExtra_loc";
	rename -uid "5049139E-4CD8-70DF-A700-CD9D05A95599";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_ankleExtra_loc_Grp_parentConstraint1" -p "L_ankleExtra_loc_Grp";
	rename -uid "0F0B5748-4A69-8DE7-E6D4-66A76D1BC0D2";
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
	rename -uid "3BAFE887-45B9-43D0-D17F-4FBEF7F585D3";
	setAttr ".t" -type "double3" 0 0 1 ;
createNode transform -n "L_kneeExtra_loc" -p "L_kneeExtra_loc_Grp";
	rename -uid "B874EEAC-4065-6760-E1D2-D08C7A267846";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_kneeExtra_locShape" -p "L_kneeExtra_loc";
	rename -uid "5F516FF5-47C4-62F6-1360-FCBE6305F7B3";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_aim_support2" -p "L_knee_loc";
	rename -uid "940C5478-41C2-FFF1-EDB8-C792E4038325";
	setAttr ".v" no;
createNode aimConstraint -n "L_aim_support2_aimConstraint1" -p "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support2";
	rename -uid "6F1D5818-4F9B-B2CD-CEAF-BFBF59D71C90";
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
	rename -uid "45A0EE85-43E1-8CA8-D3A7-B2AB83EE4FB8";
	setAttr ".v" no;
createNode aimConstraint -n "L_aim_support1_aimConstraint1" -p "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_knee_loc_Grp|L_knee_loc|L_aim_support1";
	rename -uid "E51F4E23-4D2B-C541-056C-44AB89DA19A3";
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
	rename -uid "C1AAA9A6-4FAE-2017-0764-ACAC196AAB9C";
	setAttr ".t" -type "double3" 0 -19 0 ;
createNode transform -n "L_ankle_loc" -p "L_ankle_loc_Grp";
	rename -uid "AEB5FBC7-4ACE-28C5-57B4-D6AB37146CB2";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_ankle_locShape" -p "L_ankle_loc";
	rename -uid "F915A9C7-4303-6F95-5398-5AB76E25E746";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_toeEnd_loc_Grp" -p "L_ankle_loc";
	rename -uid "DEC0F78C-448B-6445-FA7D-7FB8FB72AEB5";
	setAttr ".t" -type "double3" 0 -1 6 ;
createNode transform -n "L_toeEnd_loc" -p "L_toeEnd_loc_Grp";
	rename -uid "70BFF8EE-434C-A5A5-B840-4CB48C12B9AF";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_toeEnd_locShape" -p "L_toeEnd_loc";
	rename -uid "76D103B8-42C3-A543-62E2-E3B811BAFF0B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_toe_loc_Grp" -p "L_ankle_loc";
	rename -uid "355759B8-4697-0317-030D-4A9C478FD77C";
	setAttr ".t" -type "double3" 0 -1 3 ;
createNode transform -n "L_toe_loc" -p "L_toe_loc_Grp";
	rename -uid "6D0B8197-4F63-EA0E-4F09-9DA4B4C6659A";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_toe_locShape" -p "L_toe_loc";
	rename -uid "E4C226DF-4BA5-373C-C0CB-BEAFD925E19B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_heelExtra_loc_Grp" -p "L_ankle_loc";
	rename -uid "5AE58F80-4213-81B6-BD89-ACBD7AE77298";
	setAttr ".t" -type "double3" 0 -3 -1 ;
createNode transform -n "L_heelPivot_loc" -p "L_heelExtra_loc_Grp";
	rename -uid "BF9977AD-497F-B458-F380-69A0E1EE18A9";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "heel";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_heelPivot_locShape" -p "L_heelPivot_loc";
	rename -uid "F4114AC5-46D4-D010-0837-0A931B256BFA";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_toeEndExtra_loc_Grp" -p "L_ankle_loc";
	rename -uid "7691642D-4E9A-45CE-F19D-E892848BE425";
	setAttr ".t" -type "double3" 0 -3 6 ;
createNode transform -n "L_toeEndPivot_loc" -p "L_toeEndExtra_loc_Grp";
	rename -uid "5111838F-4899-AC19-B816-898850E04EF1";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_toeEndPivot_locShape" -p "L_toeEndPivot_loc";
	rename -uid "52C07705-4188-8FA4-9867-899534EB01DD";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_bankRightPivot_loc_Grp" -p "L_ankle_loc";
	rename -uid "621E47A3-48FC-E3F0-4828-168BA6817A36";
	setAttr ".t" -type "double3" -2 -3 3 ;
createNode transform -n "L_bankRightPivot_loc" -p "|L_hip_mirror|L_hip_loc_Grp|L_hip_loc|L_ankle_loc_Grp|L_ankle_loc|L_bankRightPivot_loc_Grp";
	rename -uid "6B46CFCC-4319-93CC-57FB-F0A050EE4C57";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "bankRight";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_bankRightPivot_locShape" -p "L_bankRightPivot_loc";
	rename -uid "861FE37B-432E-74F7-2696-18A0A2591AA8";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_bankLeftPivot_loc_Grp" -p "L_ankle_loc";
	rename -uid "D27E8CDE-4523-881F-308C-FCAD0E4C6480";
	setAttr ".t" -type "double3" 2 -3 3 ;
createNode transform -n "L_bankLeftPivot_loc" -p "L_bankLeftPivot_loc_Grp";
	rename -uid "916BDDEC-4DFD-6760-FA24-2DAEE5C6F4D1";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "bankLeft";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_bankLeftPivot_locShape" -p "L_bankLeftPivot_loc";
	rename -uid "586D4CBD-440D-9DFC-947E-5A977C3517E5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_toeExtra_loc_Grp" -p "L_ankle_loc";
	rename -uid "38D8158C-441C-D2C6-C150-989D610FEBA3";
	setAttr ".t" -type "double3" 0 -3 3 ;
createNode transform -n "L_toePivot_loc" -p "L_toeExtra_loc_Grp";
	rename -uid "DBF428B4-41C0-214C-2D07-D482DF7EF5F0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_toePivot_locShape" -p "L_toePivot_loc";
	rename -uid "F95B676D-4387-7C7C-2C28-219B47AF0578";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_hip_vector_Grp" -p "L_hip_loc";
	rename -uid "5573F941-4956-58AF-45CF-639AB98FB378";
createNode transform -n "L_hip_vector" -p "L_hip_vector_Grp";
	rename -uid "3F4E2448-4C02-6E0D-A035-269F027A3FA0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "L_hip_vectorShape" -p "L_hip_vector";
	rename -uid "27CD6502-4552-B1AD-B701-CC9057AD26B0";
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
	rename -uid "A545E15E-4193-212F-1781-A5B37354E073";
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
	rename -uid "ADE283CA-41E4-B30A-0F81-D3B8EDA888C3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_root_locW0" -dv 1 -min 0 -at "double";
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
	rename -uid "6F6BA713-4471-3B28-3DE0-02A6C38F1749";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "container";
	setAttr ".rig_data" -type "string" "group";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_hip_Crv" -p "R_leg_nonParent";
	rename -uid "51013E3D-4C92-8893-0AD1-5E82BA187D07";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_hip_CrvShape" -p "R_hip_Crv";
	rename -uid "01B20A4C-46C4-F4C6-6BD9-4398C6120B80";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_knee_Crv" -p "R_leg_nonParent";
	rename -uid "4AB085AA-4559-8BF3-4AFC-A49B0041A4DB";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_knee_CrvShape" -p "R_knee_Crv";
	rename -uid "E410B841-4F6B-D7A3-DBC2-82BFDC4160B3";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_ankle_Crv" -p "R_leg_nonParent";
	rename -uid "2E2A8420-4B95-B522-31E4-C7BBE7D198AD";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_ankle_CrvShape" -p "R_ankle_Crv";
	rename -uid "09A4D16C-4B00-BB14-9781-4286F559D27D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_toe_Crv" -p "R_leg_nonParent";
	rename -uid "E002A64F-444A-7F22-AFAC-79979275B265";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_toe_CrvShape" -p "R_toe_Crv";
	rename -uid "0D782B7C-485E-78E8-4D02-139FB6FA6150";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_hip_mirror";
	rename -uid "E2B46FC1-4DFA-A4AA-6632-6F93C77BFFD8";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".s" -type "double3" -1 1 1 ;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "mirror";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_hip_loc_Grp" -p "R_hip_mirror";
	rename -uid "3D9D2BA5-4B2F-0EBF-6A4D-C3A3923F734C";
createNode transform -n "R_hip_loc" -p "R_hip_loc_Grp";
	rename -uid "69F9362B-4B50-E5D3-3EB7-109FD6758E2A";
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
	setAttr -k on ".insertJnt" 2;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_hip_locShape" -p "R_hip_loc";
	rename -uid "DC0E15EB-475B-52FE-D50E-A69B492FD47F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_knee_loc_Grp" -p "R_hip_loc";
	rename -uid "73A56171-4315-B1CE-D89B-3CB7B33E9FB9";
	setAttr ".t" -type "double3" 0 -10 1 ;
createNode transform -n "R_knee_loc" -p "R_knee_loc_Grp";
	rename -uid "86F53CC9-4A19-7335-3EA8-2F9C02DC8C55";
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
	setAttr -k on ".insertJnt" 2;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_knee_locShape" -p "R_knee_loc";
	rename -uid "B1AE548D-4FC5-EAF2-D451-71A580B54540";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_hipExtra_loc_Grp" -p "R_knee_loc";
	rename -uid "C8C00FC1-45FD-5A1D-7DFF-D9A51ACF4D01";
createNode transform -n "R_hipExtra_loc" -p "R_hipExtra_loc_Grp";
	rename -uid "49DB70A1-4363-F7F2-E8C6-5C942E3C199F";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_hipExtra_locShape" -p "R_hipExtra_loc";
	rename -uid "76898647-4696-C8CA-842C-5D8C65F31402";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_hipExtra_loc_Grp_parentConstraint1" -p "R_hipExtra_loc_Grp";
	rename -uid "5DDFE002-4C09-8D98-DA8E-F9A176C6FB66";
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
	rename -uid "55EE8441-43F0-7048-E167-8CBCBB1F9355";
createNode transform -n "R_ankleExtra_loc" -p "R_ankleExtra_loc_Grp";
	rename -uid "E0B6A16F-4095-1CFD-3698-649C6D6CFA74";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_ankleExtra_locShape" -p "R_ankleExtra_loc";
	rename -uid "D0BDF75E-49A1-1883-2A28-F18801A3459E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_ankleExtra_loc_Grp_parentConstraint1" -p "R_ankleExtra_loc_Grp";
	rename -uid "94D1D2AA-40A2-3E71-945D-DC849BCF4945";
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
	rename -uid "AB412DDF-4B68-CA9E-1F05-6E93FB4F7F81";
	setAttr ".t" -type "double3" 0 0 1 ;
createNode transform -n "R_kneeExtra_loc" -p "R_kneeExtra_loc_Grp";
	rename -uid "F8B92FFC-46B9-2D62-AF86-94AAA5B08351";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_kneeExtra_locShape" -p "R_kneeExtra_loc";
	rename -uid "B8240EC1-4B98-F105-75EB-B194530945DA";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_aim_support2" -p "R_knee_loc";
	rename -uid "DF17F597-4C52-449E-3162-95A0F7D4482E";
	setAttr ".v" no;
createNode aimConstraint -n "R_aim_support2_aimConstraint1" -p "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support2";
	rename -uid "A56DBC35-494A-A5A3-8494-9CB9743E73DA";
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
	rename -uid "FB60EC1B-4B02-649A-DF5B-4CBD9AEFA3B0";
	setAttr ".v" no;
createNode aimConstraint -n "R_aim_support1_aimConstraint1" -p "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_knee_loc_Grp|R_knee_loc|R_aim_support1";
	rename -uid "DBB6281A-4318-11AC-2D29-D7B14783EF43";
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
	rename -uid "53CA8C06-48F7-DCB2-B75E-6EB9E954ADBA";
	setAttr ".t" -type "double3" 0 -19 0 ;
createNode transform -n "R_ankle_loc" -p "R_ankle_loc_Grp";
	rename -uid "DD7BD4ED-44F6-92D9-3DAE-589DCAC955CA";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_ankle_locShape" -p "R_ankle_loc";
	rename -uid "E1F476D6-4836-4780-7644-A39227BD1F47";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_toeEnd_loc_Grp" -p "R_ankle_loc";
	rename -uid "4490DF6F-4FEC-3E44-5FF8-EDA9078545FB";
	setAttr ".t" -type "double3" 0 -1 6 ;
createNode transform -n "R_toeEnd_loc" -p "R_toeEnd_loc_Grp";
	rename -uid "712A7454-443D-AF40-775B-448A6EEDD18A";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_toeEnd_locShape" -p "R_toeEnd_loc";
	rename -uid "4CE9B995-4C8E-133B-DA3F-C78F5ED25A12";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_toe_loc_Grp" -p "R_ankle_loc";
	rename -uid "F8182114-4267-42D9-9AE9-9CAA8A78FA9F";
	setAttr ".t" -type "double3" 0 -1 3 ;
createNode transform -n "R_toe_loc" -p "R_toe_loc_Grp";
	rename -uid "03F0C662-4030-E753-1321-3886B43269BC";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_toe_locShape" -p "R_toe_loc";
	rename -uid "53707AA7-4BF0-C5D7-501A-F19D8D9FF069";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_heelExtra_loc_Grp" -p "R_ankle_loc";
	rename -uid "D4E27D45-4EF1-8291-3229-C78CF5B0C320";
	setAttr ".t" -type "double3" 0 -3 -1 ;
createNode transform -n "R_heelPivot_loc" -p "R_heelExtra_loc_Grp";
	rename -uid "F63BCA48-4080-2519-857E-11B737E79912";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "heel";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_heelPivot_locShape" -p "R_heelPivot_loc";
	rename -uid "72741F1F-471D-790C-28E8-899CA873D207";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_toeEndExtra_loc_Grp" -p "R_ankle_loc";
	rename -uid "A69F2FAD-4285-5B7A-C298-22A12219BC9E";
	setAttr ".t" -type "double3" 0 -3 6 ;
createNode transform -n "R_toeEndPivot_loc" -p "R_toeEndExtra_loc_Grp";
	rename -uid "07900117-4A80-1B83-93A4-2586E552997D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_toeEndPivot_locShape" -p "R_toeEndPivot_loc";
	rename -uid "BF327C5C-4A63-9419-3CB5-CBAED9D6A7B7";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_bankRightPivot_loc_Grp" -p "R_ankle_loc";
	rename -uid "B032418B-4B14-C877-2D2D-7BB628C7726F";
	setAttr ".t" -type "double3" -2 -3 3 ;
createNode transform -n "R_bankRightPivot_loc" -p "|R_hip_mirror|R_hip_loc_Grp|R_hip_loc|R_ankle_loc_Grp|R_ankle_loc|L_bankRightPivot_loc_Grp";
	rename -uid "6E6FAC53-4E87-EA6A-0B86-398ACE2C1A81";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "bankRight";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_bankRightPivot_locShape" -p "R_bankRightPivot_loc";
	rename -uid "EC97ED38-4800-B5CF-8C95-30BC3B3FF79A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_bankLeftPivot_loc_Grp" -p "R_ankle_loc";
	rename -uid "B3FACB3A-447B-C1A9-77C0-90B6E329E8D5";
	setAttr ".t" -type "double3" 2 -3 3 ;
createNode transform -n "R_bankLeftPivot_loc" -p "R_bankLeftPivot_loc_Grp";
	rename -uid "6B3074BB-40AC-C2E6-B5C9-4092E3512741";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "bankLeft";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_bankLeftPivot_locShape" -p "R_bankLeftPivot_loc";
	rename -uid "EE8EFD41-4B00-399E-DAD5-E6BB2655931A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_toeExtra_loc_Grp" -p "R_ankle_loc";
	rename -uid "D7A686D0-42E1-8D06-E262-3EAAED1A45A6";
	setAttr ".t" -type "double3" 0 -3 3 ;
createNode transform -n "R_toePivot_loc" -p "R_toeExtra_loc_Grp";
	rename -uid "CA7DC619-4939-0B93-E3EA-289F0F47404C";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_toePivot_locShape" -p "R_toePivot_loc";
	rename -uid "E6721F25-44C2-E7E6-90F4-7BAA78DC79F5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_hip_vector_Grp" -p "R_hip_loc";
	rename -uid "E6FA76DC-42E9-D661-CF9C-1080E352AB16";
createNode transform -n "R_hip_vector" -p "R_hip_vector_Grp";
	rename -uid "A18389BC-43E7-D748-B593-179A0A05B8CB";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "R_hip_vectorShape" -p "R_hip_vector";
	rename -uid "D90D24B2-40FC-1166-4204-1B99CA385C30";
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
	rename -uid "B4E7C6B7-447C-99B4-CF51-30BB74E410CC";
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
	rename -uid "0EB0677B-48E3-9F01-5E49-359942CC7EFB";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_root_locW0" -dv 1 -min 0 -at "double";
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
	rename -uid "619B891D-4023-9A7E-C652-5CAF974AC5F3";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "container";
	setAttr ".rig_data" -type "string" "group";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_scapula_Crv" -p "L_arm_nonParent";
	rename -uid "6271337E-4F65-4A18-4F18-E8BE6FEAF00E";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_scapula_CrvShape" -p "L_scapula_Crv";
	rename -uid "8FED7144-43F7-CA93-6C0D-20BCE68ADB74";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_shoulder_Crv" -p "L_arm_nonParent";
	rename -uid "5C0EC677-411A-B80D-9FB4-B1A2DFF84B44";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_shoulder_CrvShape" -p "L_shoulder_Crv";
	rename -uid "201F4AA4-48E4-2CE6-7358-CE992FCDF6C7";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_elbow_Crv" -p "L_arm_nonParent";
	rename -uid "ED45B9F8-49FB-E166-7086-06A73DB03004";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_elbow_CrvShape" -p "L_elbow_Crv";
	rename -uid "8C47F21E-4654-36F8-618C-2FBC91A2D986";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_wrist_Crv" -p "L_arm_nonParent";
	rename -uid "CF6B6EF8-4300-53CC-B474-F0883A119B5D";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_wrist_CrvShape" -p "L_wrist_Crv";
	rename -uid "92B8D397-4C0A-F1D5-D013-BFB77A16253D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_shoulderExtra_Crv" -p "L_arm_nonParent";
	rename -uid "7CDC68EB-4FA6-59D9-5F1D-6783F71215D4";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_shoulderExtra_CrvShape" -p "L_shoulderExtra_Crv";
	rename -uid "8507221F-412A-4973-6B4C-51BAC6FE9752";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_elbowExtra_Crv" -p "L_arm_nonParent";
	rename -uid "4B755881-44E7-13E3-FCCB-9F87F1FDFB46";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_elbowExtra_CrvShape" -p "L_elbowExtra_Crv";
	rename -uid "C3E2DA02-469D-CE34-C6CB-E5AFCBD29D06";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_scapula_mirror";
	rename -uid "1CFE9F3A-4E59-3C9E-FA42-99A8871FA568";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "mirror";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_scapula_loc_Grp" -p "L_scapula_mirror";
	rename -uid "0C5835F4-4319-53F8-A24D-A78635FBC5DA";
createNode transform -n "L_scapula_loc" -p "L_scapula_loc_Grp";
	rename -uid "D0CB5DF2-4AD8-65B6-B8BD-D7A155B5239D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_scapula_locShape" -p "L_scapula_loc";
	rename -uid "B9E4FB4E-4F69-8767-3514-6B9B549AA82E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_shoulder_loc_Grp" -p "L_scapula_loc";
	rename -uid "0CA5663F-4A6F-FBE9-AA80-0AA9BFC3B566";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "L_shoulder_loc" -p "L_shoulder_loc_Grp";
	rename -uid "6447AF86-4868-96BC-1E9D-1CBE15296B9F";
	addAttr -ci true -sn "insertJnt" -ln "insertJnt" -min 0 -at "long";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 16;
	setAttr -k on ".insertJnt" 2;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_shoulder_locShape" -p "L_shoulder_loc";
	rename -uid "CB193003-4D2E-29E6-D86D-988564F31182";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 16;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_elbow_loc_Grp" -p "L_shoulder_loc";
	rename -uid "A79E3468-484D-1085-0233-6C81EAF2CD4B";
	setAttr ".t" -type "double3" 6 0 -1 ;
createNode transform -n "L_elbow_loc" -p "L_elbow_loc_Grp";
	rename -uid "5167D135-409B-7A54-FCA6-EB81D2C07649";
	addAttr -ci true -sn "insertJnt" -ln "insertJnt" -min 0 -at "long";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 16;
	setAttr -k on ".insertJnt" 2;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_elbow_locShape" -p "L_elbow_loc";
	rename -uid "9ED3448B-4EB4-36EF-EB81-139BDB6A5CDF";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 16;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_elbowExtra_loc_Grp" -p "L_elbow_loc";
	rename -uid "DE852668-4C45-FD62-466F-32B5418D3265";
	setAttr ".t" -type "double3" 0 0 -1 ;
createNode transform -n "L_elbowExtra_loc" -p "L_elbowExtra_loc_Grp";
	rename -uid "B32A2AA0-4773-6AEA-A84A-BF970FA4D4AA";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_elbowExtra_locShape" -p "L_elbowExtra_loc";
	rename -uid "7573A57A-4487-C3A1-1B9B-2CA535D9A243";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_aim_support1" -p "L_elbow_loc";
	rename -uid "E732E743-4C03-9F8E-293B-14907652C36C";
	setAttr ".v" no;
createNode aimConstraint -n "L_aim_support1_aimConstraint1" -p "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support1";
	rename -uid "4946DEFA-41A5-BA75-C360-E4871D0EAE22";
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
	rename -uid "DE52FD67-4595-BBEE-85E6-6A835796362C";
	setAttr ".v" no;
createNode aimConstraint -n "L_aim_support2_aimConstraint1" -p "|L_scapula_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_elbow_loc_Grp|L_elbow_loc|L_aim_support2";
	rename -uid "6C6FDF87-45C6-B431-D911-27A737FAEFF4";
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
	rename -uid "60266F8D-49D5-EC66-38F5-D781DE28A1F8";
createNode transform -n "L_shoulderExtra_loc" -p "L_shoulderExtra_loc_Grp";
	rename -uid "58DC0E03-4E13-E694-F72A-7D84BA14EF08";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_shoulderExtra_locShape" -p "L_shoulderExtra_loc";
	rename -uid "FC09E6B4-4E3F-0970-3E90-A0AA77A7F6F1";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_shoulderExtra_loc_Grp_parentConstraint1" -p "L_shoulderExtra_loc_Grp";
	rename -uid "7E359195-48DE-9CBE-D786-F29816BEB51C";
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
	rename -uid "8E6071E6-4947-94FA-0B7C-9D93A5B1C7B7";
createNode transform -n "L_wristExtra_loc" -p "L_wristExtra_loc_Grp";
	rename -uid "7C1A2EC4-43CC-ED35-9728-238D7926B46B";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_wristExtra_locShape" -p "L_wristExtra_loc";
	rename -uid "0C350407-4427-2808-A29D-6D9BC43D6CF0";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_wristExtra_loc_Grp_parentConstraint1" -p "L_wristExtra_loc_Grp";
	rename -uid "3098E700-4CC5-B7F7-B905-D1B99259BDF9";
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
	rename -uid "792A1CAA-4470-6FD0-4930-9B8D8229586B";
	setAttr ".t" -type "double3" 12 0 0 ;
createNode transform -n "L_wrist_loc" -p "L_wrist_loc_Grp";
	rename -uid "F3AC1B81-4C71-5B06-BAA6-7A9B3FB28F78";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_wrist_locShape" -p "L_wrist_loc";
	rename -uid "4615A63C-4D31-B35F-C62F-64874FC1837B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_wristEnd_loc_Grp" -p "L_wrist_loc";
	rename -uid "70FE2DD2-4A1A-00CA-264A-6294693CEE1F";
	setAttr ".t" -type "double3" 1 0 0 ;
createNode transform -n "L_wristEnd_loc" -p "L_wristEnd_loc_Grp";
	rename -uid "794C3892-4973-524D-5BAE-BD9D9DA068B6";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "wristEnd";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_wristEnd_locShape" -p "L_wristEnd_loc";
	rename -uid "57F3810C-4300-5FD0-E974-A8A10929AC1F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_shoulder_vector_Grp" -p "L_shoulder_loc";
	rename -uid "3DE0CFD8-4601-A3D9-57F8-AA81968DCCCA";
createNode transform -n "L_shoulder_vector" -p "L_shoulder_vector_Grp";
	rename -uid "3F4E2448-4C02-6E0D-A035-269F027A3FA0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "L_shoulder_vectorShape" -p "L_shoulder_vector";
	rename -uid "27CD6502-4552-B1AD-B701-CC9057AD26B0";
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
	rename -uid "93BA9CAA-4CEF-7CE2-1947-B9B0B19AAED7";
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
	rename -uid "2849F24E-4AC0-5224-977E-6B8FBEFF6408";
createNode transform -n "L_scapula_vector" -p "L_scapula_vector_Grp";
	rename -uid "B5A417E5-4236-AC78-5543-63929CE5F9F6";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "L_scapula_vectorShape" -p "L_scapula_vector";
	rename -uid "0F680832-498C-0712-BD6F-FF9545D42E85";
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
	rename -uid "182AA397-43FD-528A-7595-BFA2F282160B";
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
	rename -uid "9D0CA32D-408F-A240-827D-2888F332A208";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_chest_locW0" -dv 1 -min 0 -at "double";
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
	rename -uid "6C59F2B3-452C-7600-9C63-008DC7D74778";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "container";
	setAttr ".rig_data" -type "string" "group";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_scapula_Crv" -p "R_arm_nonParent";
	rename -uid "E3558B41-4B8C-AE27-7132-0C97F58219A3";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_scapula_CrvShape" -p "R_scapula_Crv";
	rename -uid "09C09DCD-475B-CD14-F334-ED92CA1BDADD";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_shoulder_Crv" -p "R_arm_nonParent";
	rename -uid "4255332C-4F7B-DE70-14E6-50AF44C879D1";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_shoulder_CrvShape" -p "R_shoulder_Crv";
	rename -uid "013F7AA2-4183-681B-AC6A-ABA08362DB5B";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_elbow_Crv" -p "R_arm_nonParent";
	rename -uid "4A37646D-4E3E-D565-88DD-18AEDAA8A860";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_elbow_CrvShape" -p "R_elbow_Crv";
	rename -uid "2BB16BF4-4E77-53E9-EA24-268D7FCADE11";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_wrist_Crv" -p "R_arm_nonParent";
	rename -uid "E4B9626B-429A-29CE-3BB3-AF9508D609EC";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_wrist_CrvShape" -p "R_wrist_Crv";
	rename -uid "6C8C5208-4DFC-E011-D189-6A92B54F7969";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_shoulderExtra_Crv" -p "R_arm_nonParent";
	rename -uid "95C81FF0-42B6-FCB3-F2B8-DFA8DB65D6D7";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_shoulderExtra_CrvShape" -p "R_shoulderExtra_Crv";
	rename -uid "BC9AD895-4C89-7DCC-0B68-2BA876413C36";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_elbowExtra_Crv" -p "R_arm_nonParent";
	rename -uid "86F83AEB-4D98-5CF4-ED27-96B1AB1EE1CA";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_elbowExtra_CrvShape" -p "R_elbowExtra_Crv";
	rename -uid "964D5A79-42E2-7AB3-5CA0-34ADA8B6F4F8";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_scapula_mirror";
	rename -uid "E91B8AE6-4243-6468-587F-BC8AB3EE5736";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".s" -type "double3" -1 1 1 ;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "mirror";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_scapula_loc_Grp" -p "R_scapula_mirror";
	rename -uid "5B0AB875-4EE0-E3BD-CC8F-99BCF1821D79";
createNode transform -n "R_scapula_loc" -p "R_scapula_loc_Grp";
	rename -uid "83CC8C80-4182-BAEB-2D87-D88BB63D71BA";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_scapula_locShape" -p "R_scapula_loc";
	rename -uid "B6E8CC05-4D5B-BA15-6AE5-43989EF4312A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_shoulder_loc_Grp" -p "R_scapula_loc";
	rename -uid "F7460078-4174-3D0D-AD2E-6D9845608F03";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "R_shoulder_loc" -p "R_shoulder_loc_Grp";
	rename -uid "33A0EF7B-4239-4F81-88DE-999904273661";
	addAttr -ci true -sn "insertJnt" -ln "insertJnt" -min 0 -at "long";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 16;
	setAttr -k on ".insertJnt" 2;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_shoulder_locShape" -p "R_shoulder_loc";
	rename -uid "07DE7CE5-4EC9-E3F7-98DD-559E4ADBC7B8";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 16;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_elbow_loc_Grp" -p "R_shoulder_loc";
	rename -uid "E84EEE3F-42D0-F116-731F-9BA8FAA89F89";
	setAttr ".t" -type "double3" 6 0 -1 ;
createNode transform -n "R_elbow_loc" -p "R_elbow_loc_Grp";
	rename -uid "6C047D5E-4E68-91D9-28A0-8A8DFB7D8F42";
	addAttr -ci true -sn "insertJnt" -ln "insertJnt" -min 0 -at "long";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 16;
	setAttr -k on ".insertJnt" 2;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_elbow_locShape" -p "R_elbow_loc";
	rename -uid "19D70C1D-44F3-4A6C-F180-50A556078CC9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 16;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_elbowExtra_loc_Grp" -p "R_elbow_loc";
	rename -uid "199298A8-4815-1996-C29B-DDABB6FC6644";
	setAttr ".t" -type "double3" 0 0 -1 ;
createNode transform -n "R_elbowExtra_loc" -p "R_elbowExtra_loc_Grp";
	rename -uid "E24F1058-4605-5425-68CF-189351A3B87B";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_elbowExtra_locShape" -p "R_elbowExtra_loc";
	rename -uid "3033184A-4E75-92CD-32F5-A884392A1933";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_aim_support1" -p "R_elbow_loc";
	rename -uid "74984A87-4398-AAFC-7B60-8BB341314B83";
	setAttr ".v" no;
createNode aimConstraint -n "R_aim_support1_aimConstraint1" -p "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support1";
	rename -uid "EBDFD698-49C4-725C-3C88-B9917A76D375";
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
	rename -uid "384B0C6F-415C-3B41-142C-76BAA991A238";
	setAttr ".v" no;
createNode aimConstraint -n "R_aim_support2_aimConstraint1" -p "|R_scapula_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_elbow_loc_Grp|R_elbow_loc|R_aim_support2";
	rename -uid "AECCBA67-4FDA-500F-EC87-6DB8F18C91D5";
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
	rename -uid "0A7A3CEC-429C-2127-198A-CA9D4F2127EB";
createNode transform -n "R_shoulderExtra_loc" -p "R_shoulderExtra_loc_Grp";
	rename -uid "61A066C3-41DC-4B93-2D76-47BA90A63577";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_shoulderExtra_locShape" -p "R_shoulderExtra_loc";
	rename -uid "CB2E0F4B-4ECD-3F9F-DAD0-9F9144CFE69B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_shoulderExtra_loc_Grp_parentConstraint1" -p "R_shoulderExtra_loc_Grp";
	rename -uid "73903921-4864-601D-1081-F389443192F3";
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
	rename -uid "06A1A806-47D7-CA3F-00C9-A19B685BF7BD";
createNode transform -n "R_wristExtra_loc" -p "R_wristExtra_loc_Grp";
	rename -uid "08186CA4-41AC-FBA1-19D6-26B738DFF6B5";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_wristExtra_locShape" -p "R_wristExtra_loc";
	rename -uid "42046E06-4D5A-D6C6-ECD0-A78169800FC8";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_wristExtra_loc_Grp_parentConstraint1" -p "R_wristExtra_loc_Grp";
	rename -uid "EEE524BB-46D9-AB3E-2783-91A90F3573EB";
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
	rename -uid "2F295F7F-44A1-B8D3-4C7F-FBAC7465D935";
	setAttr ".t" -type "double3" 12 0 0 ;
createNode transform -n "R_wrist_loc" -p "R_wrist_loc_Grp";
	rename -uid "CCE51FF4-4426-57B1-7B06-EFB6937B0148";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_wrist_locShape" -p "R_wrist_loc";
	rename -uid "A1196C98-432C-C1E4-CCBF-1B814F6E69D9";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_wristEnd_loc_Grp" -p "R_wrist_loc";
	rename -uid "525009D6-4F3A-DD0D-D8CF-54B59A7F7242";
	setAttr ".t" -type "double3" 1 0 0 ;
createNode transform -n "R_wristEnd_loc" -p "R_wristEnd_loc_Grp";
	rename -uid "8856528A-4C52-6787-52BE-49A03F0EA0A8";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "wristEnd";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_wristEnd_locShape" -p "R_wristEnd_loc";
	rename -uid "8EBCDF83-4091-B7C7-C9B4-3F9ED79C17BD";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_shoulder_vector_Grp" -p "R_shoulder_loc";
	rename -uid "7D0FE805-4EA3-B286-D3AA-3192C9A405D4";
	setAttr ".t" -type "double3" 8.8817841970012523e-16 0 0 ;
createNode transform -n "R_shoulder_vector" -p "R_shoulder_vector_Grp";
	rename -uid "81403F15-48CE-5708-6F31-5296A2606328";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "R_shoulder_vectorShape" -p "R_shoulder_vector";
	rename -uid "41CD97D4-42EF-2866-EAF7-21BD76812529";
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
	rename -uid "9935D3DA-49AF-C964-0802-17ACEF9A0CD5";
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
	rename -uid "D61EEA46-4B65-59CD-F218-89B24B891A73";
createNode transform -n "R_scapula_vector" -p "R_scapula_vector_Grp";
	rename -uid "4240BD26-497B-86D2-E92E-A09D9C53ECC3";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "R_scapula_vectorShape" -p "R_scapula_vector";
	rename -uid "145E0712-4AA0-DFC3-C7D7-939C060AD6AA";
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
	rename -uid "AE87D39A-4A4F-3D1A-AE87-86BBFCF9CED4";
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
	rename -uid "3A720C31-4D76-0893-7F8B-22B2351DE61F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_chest_locW0" -dv 1 -min 0 -at "double";
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
	rename -uid "1EA4828C-4656-DD48-5007-0582972769BC";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "container";
	setAttr ".rig_data" -type "string" "group";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_index_Crv" -p "L_hand_nonParent";
	rename -uid "A5DD3C67-4B0F-F4CC-1FE1-688ADAF4EE2A";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_index_CrvShape" -p "L_index_Crv";
	rename -uid "32D04A24-47BB-C537-70D1-26AE6B51A81A";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "index";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_middle_Crv" -p "L_hand_nonParent";
	rename -uid "16C4B1B1-44EF-521B-2329-54A4D7C4572D";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_middle_CrvShape" -p "L_middle_Crv";
	rename -uid "4B59BFB0-4BB1-EABA-1925-56B1517D6888";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "middle";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_ring_Crv" -p "L_hand_nonParent";
	rename -uid "F11C2725-4CE2-C733-2DF8-A49617FB0BEC";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_ring_CrvShape" -p "L_ring_Crv";
	rename -uid "944AFFD8-4B51-41CB-3188-7C99E1AFF000";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "ring";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_pinky_Crv" -p "L_hand_nonParent";
	rename -uid "762D9B4C-4009-E4DB-5ECC-38A7EAAEA338";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_pinky_CrvShape" -p "L_pinky_Crv";
	rename -uid "8CBCB625-42B7-B6D6-C136-D9B5575C1B07";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "pinky";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_thumb_Crv" -p "L_hand_nonParent";
	rename -uid "4AC2FD3A-47D4-D349-C990-7EAC8C4D0226";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_thumb_CrvShape" -p "L_thumb_Crv";
	rename -uid "AB05171C-47C7-5737-2C57-568E3CEC2AA8";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "thumb";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_handRoot_mirror";
	rename -uid "0DCFDE7B-428D-3B52-4187-E4919995DBB0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "mirror";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_handRoot_loc_Grp" -p "L_handRoot_mirror";
	rename -uid "93FA7D8B-47DA-A214-B5A0-09911C53CC8B";
createNode transform -n "L_handRoot_loc" -p "|L_handRoot_mirror|L_handRoot_loc_Grp";
	rename -uid "C281D593-450C-6CC9-23DB-3DA065F2F48C";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
createNode locator -n "L_handRoot_locShape" -p "L_handRoot_loc";
	rename -uid "4AF447FF-404A-16FF-65D0-36A1AD8BF17E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_thumbRoot_loc_Grp" -p "L_handRoot_loc";
	rename -uid "D6190E67-457A-7E09-1EC7-CB8DE716DCB1";
	setAttr ".t" -type "double3" 1 0 1 ;
createNode transform -n "L_thumbRoot_loc" -p "L_thumbRoot_loc_Grp";
	rename -uid "78E401C0-4B94-744D-DCB3-AB9BA325750D";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "thumbRoot";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_thumbRoot_locShape" -p "L_thumbRoot_loc";
	rename -uid "3FD1B0A8-4922-D931-E70C-F98C04754531";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_thumb1_loc_Grp" -p "L_thumbRoot_loc";
	rename -uid "0868BF3F-462E-5595-79CA-5083010A652A";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "L_thumb1_loc" -p "L_thumb1_loc_Grp";
	rename -uid "AF53D0C2-4B78-1DB8-A582-CDA158BE6555";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "thumb1";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_thumb1_locShape" -p "L_thumb1_loc";
	rename -uid "995C6CFD-4EAF-5D49-B9AC-18AE955932A7";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_thumb2_loc_Grp" -p "L_thumb1_loc";
	rename -uid "F9F6C3DF-4393-78AE-7044-67BC6EAF0A70";
createNode transform -n "L_thumb2_loc" -p "L_thumb2_loc_Grp";
	rename -uid "D9B67761-4EE4-951D-D45C-B59BF887FD45";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "thumb2";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_thumb2_locShape" -p "L_thumb2_loc";
	rename -uid "29E86743-4E78-BCEE-964E-B8A06820096B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_thumb2_loc_Grp_pointConstraint1" -p "L_thumb2_loc_Grp";
	rename -uid "89101E67-44C7-33CC-05AD-B782EA5BAFC7";
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
	rename -uid "4D97FAD3-4238-8310-2934-E186D49973BD";
	setAttr ".t" -type "double3" 2.666 0 0 ;
createNode transform -n "L_thumb3_loc" -p "L_thumb3_loc_Grp";
	rename -uid "E1CD5808-4628-4912-961F-DDA17E183C1B";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "thumb3";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_thumb3_locShape" -p "L_thumb3_loc";
	rename -uid "BCD6A746-402E-1624-6656-E88763E2BD4F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_thumb_vector_Grp" -p "L_thumb1_loc";
	rename -uid "2F43A7A9-46E0-9561-933A-87BDB3830857";
createNode transform -n "L_thumb_vector" -p "L_thumb_vector_Grp";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "thumb";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "L_thumb_vectorShape" -p "L_thumb_vector";
	rename -uid "27CD6502-4552-B1AD-B701-CC9057AD26B0";
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
createNode aimConstraint -n "L_thumb_vector_Grp_aimConstraint1" -p "L_thumb_vector_Grp";
	rename -uid "313D4845-4A27-C3E0-D64C-8E995F40A279";
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
	rename -uid "38F331D2-4B00-F921-6ACC-F5972B250D47";
	setAttr ".t" -type "double3" 1 0 -1 ;
createNode transform -n "L_pinkyRoot_loc" -p "L_pinkyRoot_loc_Grp";
	rename -uid "E0312B78-406A-71F8-80CE-B6BD1536523A";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "pinkyRoot";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_pinkyRoot_locShape" -p "L_pinkyRoot_loc";
	rename -uid "2542A6E4-4343-E51E-C207-18A7AF5749BD";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_pinky1_loc_Grp" -p "L_pinkyRoot_loc";
	rename -uid "BAD2A497-4A08-25DF-D462-5B80C080A5AE";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "L_pinky1_loc" -p "L_pinky1_loc_Grp";
	rename -uid "E1ACF165-4918-55B6-9EA4-B0AD84665D6F";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "pinky1";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_pinky1_locShape" -p "L_pinky1_loc";
	rename -uid "0469AB20-4E79-2E4F-D4BB-87835FE7E627";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_pinky2_loc_Grp" -p "L_pinky1_loc";
	rename -uid "4C7DAD28-4B79-51BF-99BE-CD9152C6FFB3";
createNode transform -n "L_pinky2_loc" -p "L_pinky2_loc_Grp";
	rename -uid "8308772D-4E88-C3A4-E66E-6F9DFC12A6EE";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "pinky2";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_pinky2_locShape" -p "L_pinky2_loc";
	rename -uid "BE83AABD-4131-2C6A-9935-A9A1FE859209";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_pinky2_loc_Grp_pointConstraint1" -p "L_pinky2_loc_Grp";
	rename -uid "AEE70641-4A28-F38D-5B3F-3AAF135F951F";
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
	rename -uid "5F79DEEB-4D71-AA58-FDEE-0A97DF33CC86";
createNode transform -n "L_pinky3_loc" -p "L_pinky3_loc_Grp";
	rename -uid "3A36D783-497C-7644-49F0-9A9C8F3A34FA";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "pinky3";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_pinky3_locShape" -p "L_pinky3_loc";
	rename -uid "42D39D5C-44C4-4634-877A-F194E9F1DF96";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_pinky3_loc_Grp_pointConstraint1" -p "L_pinky3_loc_Grp";
	rename -uid "262AB4C6-4A9F-BB52-BBD2-84B34F0C4333";
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
	rename -uid "906E3469-4BD6-C1FA-9455-7FB6F4179D36";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "L_pinky4_loc" -p "L_pinky4_loc_Grp";
	rename -uid "74B410C4-4EAB-26E6-3898-3FBDADE32FDF";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "pinky4";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_pinky4_locShape" -p "L_pinky4_loc";
	rename -uid "861A6F81-4745-FE0D-FD5B-DDAB351B7AAB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_pinky_vector_Grp" -p "L_pinky1_loc";
	rename -uid "34E06D40-498E-7A9A-4B9B-5CA896153667";
createNode transform -n "L_pinky_vector" -p "L_pinky_vector_Grp";
	rename -uid "6044C5CE-4146-7588-0603-639494131815";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "pinky";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "L_pinky_vectorShape" -p "L_pinky_vector";
	rename -uid "14920253-47E5-CC9A-DEF3-7B85E302958F";
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
createNode aimConstraint -n "L_pinky_vector_Grp_aimConstraint1" -p "L_pinky_vector_Grp";
	rename -uid "30F945A8-49D5-6422-2AC0-CD9AC7169D72";
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
	rename -uid "96BA01F9-4310-1A6F-7E14-4AB1F99B019D";
	setAttr ".t" -type "double3" 1 0 -0.5 ;
createNode transform -n "L_ringRoot_loc" -p "L_ringRoot_loc_Grp";
	rename -uid "9FE727B4-49C3-8600-4362-B6AF17280A0D";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ringRoot";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_ringRoot_locShape" -p "L_ringRoot_loc";
	rename -uid "249CB796-4D17-6421-D175-73A83C8FBB22";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_ring1_loc_Grp" -p "L_ringRoot_loc";
	rename -uid "7A1A36A1-4EC4-23A0-D4AF-BF9156B21519";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "L_ring1_loc" -p "L_ring1_loc_Grp";
	rename -uid "E5509F2D-4CA3-8C0D-06BF-A381FF5D438F";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ring1";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_ring1_locShape" -p "L_ring1_loc";
	rename -uid "4E410110-4192-B817-4187-51B19D48DFD7";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_ring2_loc_Grp" -p "L_ring1_loc";
	rename -uid "04F155A7-4073-39BB-6512-5284F949E6D9";
createNode transform -n "L_ring2_loc" -p "L_ring2_loc_Grp";
	rename -uid "3A59FB40-4517-12B4-44DA-0DACAC96119C";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ring2";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_ring2_locShape" -p "L_ring2_loc";
	rename -uid "33EB5DDD-4789-4620-F9D2-3B80F156EC93";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_ring2_loc_Grp_pointConstraint1" -p "L_ring2_loc_Grp";
	rename -uid "47A944A5-457B-ECC8-D486-938D61755919";
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
	rename -uid "C143E8A6-4859-B7C1-FB08-96867A4502E8";
createNode transform -n "L_ring3_loc" -p "L_ring3_loc_Grp";
	rename -uid "9AB18A77-43AB-5FB5-D9F9-698911A6E1CC";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ring3";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_ring3_locShape" -p "L_ring3_loc";
	rename -uid "C5F04795-42DD-557E-B1AC-DFA4932D9856";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_ring3_loc_Grp_pointConstraint1" -p "L_ring3_loc_Grp";
	rename -uid "04C693D2-4AED-9125-C83D-CB9CCCB4E3F3";
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
	rename -uid "7E2866DE-4629-38D0-A4C7-9C88D306BBD4";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "L_ring4_loc" -p "L_ring4_loc_Grp";
	rename -uid "20E6F8CB-4A22-7598-3E6D-849EF9EA141D";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ring4";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_ring4_locShape" -p "L_ring4_loc";
	rename -uid "8A62C567-4EE9-BF86-5E22-AFBE908486C2";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_ring_vector_Grp" -p "L_ring1_loc";
	rename -uid "1299AF37-4601-E2D5-3FED-F5A61618EB9C";
createNode transform -n "L_ring_vector" -p "L_ring_vector_Grp";
	rename -uid "B230285B-400E-8B61-38C0-769713B960C7";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "ring";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "L_ring_vectorShape" -p "L_ring_vector";
	rename -uid "9B92F91C-45DA-ABBE-46BB-AAA35D21AF17";
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
createNode aimConstraint -n "L_ring_vector_Grp_aimConstraint1" -p "L_ring_vector_Grp";
	rename -uid "96F59657-45F9-996D-3A08-E7B3AB4E665F";
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
	rename -uid "5F6C967C-41E7-3AA6-61EE-A7911731ED88";
	setAttr ".t" -type "double3" 1 0 0.5 ;
createNode transform -n "L_indexRoot_loc" -p "L_indexRoot_loc_Grp";
	rename -uid "0D219D70-475A-E4EA-93B3-72855A783E14";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "indexRoot";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_indexRoot_locShape" -p "L_indexRoot_loc";
	rename -uid "B777AD7A-4AD5-7399-0194-12AE6A393A12";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_index1_loc_Grp" -p "L_indexRoot_loc";
	rename -uid "BA61B796-43B7-ACCD-B630-A69A75E2106C";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "L_index1_loc" -p "L_index1_loc_Grp";
	rename -uid "F31DCEFF-4DF6-3D15-2D3A-4ABFE6043D47";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "index1";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_index1_locShape" -p "L_index1_loc";
	rename -uid "2CC90CB6-43F8-5569-2C27-4DA6D1E4313F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_index2_loc_Grp" -p "L_index1_loc";
	rename -uid "7F8B068F-484F-DDF5-D1FB-57981C440612";
createNode transform -n "L_index2_loc" -p "L_index2_loc_Grp";
	rename -uid "F57E6D96-404E-BAD4-025E-FC8F4F6CBAFE";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "index2";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_index2_locShape" -p "L_index2_loc";
	rename -uid "D7F6FC3E-4DB2-6DD8-BC9B-8BA6076F348D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_index2_loc_Grp_pointConstraint1" -p "L_index2_loc_Grp";
	rename -uid "35D58C10-4B08-F56E-BBBD-21984A8E313F";
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
	rename -uid "BD5F18A8-4DB1-4A07-6A00-2AA3A38FA592";
createNode transform -n "L_index3_loc" -p "L_index3_loc_Grp";
	rename -uid "0D261CDE-4FBB-507A-FB0E-2FBE98931ACE";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "index3";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_index3_locShape" -p "L_index3_loc";
	rename -uid "BA896669-471B-8770-DC80-E9B81A890B35";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_index3_loc_Grp_pointConstraint1" -p "L_index3_loc_Grp";
	rename -uid "64A131B0-4000-B075-3A55-A18F308B9216";
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
	rename -uid "34408EE1-4D3E-529B-943B-E688558BE8DB";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "L_index4_loc" -p "L_index4_loc_Grp";
	rename -uid "CF0A6F60-4B3B-2963-BD66-CCBFF3B0FF49";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "index4";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_index4_locShape" -p "L_index4_loc";
	rename -uid "0F9C5DCD-4E3E-5783-5329-5D9C8D414024";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_index_vector_Grp" -p "L_index1_loc";
	rename -uid "241082DD-48D6-BB39-DC65-03BC7B25424F";
createNode transform -n "L_index_vector" -p "L_index_vector_Grp";
	rename -uid "62811404-4FC6-F48A-1ABB-DB8D7992218F";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "index";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "L_index_vectorShape" -p "L_index_vector";
	rename -uid "8EFACC41-4D43-4681-5D0D-8785D27B81BE";
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
createNode aimConstraint -n "L_index_vector_Grp_aimConstraint1" -p "L_index_vector_Grp";
	rename -uid "CB2BC8CD-4039-D636-9B85-8FB9FEF93695";
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
	rename -uid "95944AC7-4A0B-1AAF-6316-C9A8A006AB86";
	setAttr ".t" -type "double3" 1 0 0 ;
createNode transform -n "L_middleRoot_loc" -p "L_middleRoot_loc_Grp";
	rename -uid "D7C0AE82-41DF-01AD-17FF-D9935BABA0A6";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "middleRoot";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_middleRoot_locShape" -p "L_middleRoot_loc";
	rename -uid "A4E6E1B9-48EA-62EF-96FF-C89E63A9B43D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_middle1_loc_Grp" -p "L_middleRoot_loc";
	rename -uid "E5CABB8F-4F1C-CE56-CB07-7184F93C083D";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "L_middle1_loc" -p "L_middle1_loc_Grp";
	rename -uid "53FA9391-43D3-141A-DF4A-E2839BC3126A";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "middle1";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_middle1_locShape" -p "L_middle1_loc";
	rename -uid "72435E9F-470B-C62F-657E-198BDD676033";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_middle2_loc_Grp" -p "L_middle1_loc";
	rename -uid "182C9BCE-4F52-1F5E-44A8-A8AAEFBC4B87";
createNode transform -n "L_middle2_loc" -p "L_middle2_loc_Grp";
	rename -uid "95897949-42CB-428D-1846-A096B2EF4F1B";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "middle2";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_middle2_locShape" -p "L_middle2_loc";
	rename -uid "507AFB7E-4053-8E05-F069-44A1F734BCDF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_middle2_loc_Grp_pointConstraint1" -p "L_middle2_loc_Grp";
	rename -uid "2794966A-45E4-7309-ED83-518735AAC657";
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
	rename -uid "124F2871-4142-C41C-8967-FAA76E995098";
createNode transform -n "L_middle3_loc" -p "L_middle3_loc_Grp";
	rename -uid "5CB1569A-4BDD-41E7-BC70-CDB551E418CB";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "middle3";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_middle3_locShape" -p "L_middle3_loc";
	rename -uid "2A78058A-4C98-A46D-B62D-7A958982737C";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "L_middle3_loc_Grp_pointConstraint1" -p "L_middle3_loc_Grp";
	rename -uid "8E053C0F-4D6E-2745-0EE2-899D850310EE";
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
	rename -uid "7C7F6216-4619-CD5C-2472-A98F62FE9A92";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "L_middle4_loc" -p "L_middle4_loc_Grp";
	rename -uid "2CF2A2E3-4006-6EDE-B1AA-B9A098C65FAD";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "middle4";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_middle4_locShape" -p "L_middle4_loc";
	rename -uid "A57057FF-429A-DD41-1D64-12BB776B6944";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_middle_vector_Grp" -p "L_middle1_loc";
	rename -uid "8ACDD583-41D9-CAB3-6869-C196DC917073";
createNode transform -n "L_middle_vector" -p "L_middle_vector_Grp";
	rename -uid "535A1C47-401D-69CF-B270-4EAC0D038654";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "middle";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "L_middle_vectorShape" -p "L_middle_vector";
	rename -uid "4B30697B-40A3-3446-71CB-BCBDA523FA82";
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
createNode aimConstraint -n "L_middle_vector_Grp_aimConstraint1" -p "L_middle_vector_Grp";
	rename -uid "67B037B1-4F0B-0069-6CF2-568B34A95128";
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
	rename -uid "C2EC82FA-480C-8D4F-C6FD-54AC60E458F2";
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
	rename -uid "BF2BCD4C-4EF2-5514-5123-C4AF71001BFE";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "container";
	setAttr ".rig_data" -type "string" "group";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_index_Crv" -p "R_hand_nonParent";
	rename -uid "3DE76A93-4FAF-3B31-29D8-B5B443DABDD3";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_index_CrvShape" -p "R_index_Crv";
	rename -uid "64AD11E2-4154-B5F7-B4EC-FD94DFCFA027";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "index";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_middle_Crv" -p "R_hand_nonParent";
	rename -uid "51153FD8-4FC2-92DE-E257-CD86867D7807";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_middle_CrvShape" -p "R_middle_Crv";
	rename -uid "4E97B477-4CC2-B912-E809-16B80295447A";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "middle";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_ring_Crv" -p "R_hand_nonParent";
	rename -uid "C4743FB3-4299-158C-0112-508D141DDF07";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_ring_CrvShape" -p "R_ring_Crv";
	rename -uid "E04BFD2D-49B6-FD89-FCC3-24A81E92C5AB";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "ring";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_pinky_Crv" -p "R_hand_nonParent";
	rename -uid "34FA0151-4C80-A3C8-090C-82815A58532B";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_pinky_CrvShape" -p "R_pinky_Crv";
	rename -uid "443AB43D-4BB7-B11B-6548-87BE2BF2A6B1";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "pinky";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_thumb_Crv" -p "R_hand_nonParent";
	rename -uid "B11BA3A9-4FB4-6C29-B20B-5FBB0DF97596";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_thumb_CrvShape" -p "R_thumb_Crv";
	rename -uid "C09D1E6F-44F2-70D4-11DE-2AB4C1E6F0DE";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "thumb";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_handRoot_mirror";
	rename -uid "A2ECDDB7-415C-BEC0-AE7A-F18532B02914";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".s" -type "double3" -1 1 1 ;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "mirror";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_handRoot_loc_Grp" -p "R_handRoot_mirror";
	rename -uid "6291E97A-4A41-3DBF-E28E-2B8B88F079C7";
createNode transform -n "R_handRoot_loc" -p "|R_handRoot_mirror|L_handRoot_loc_Grp";
	rename -uid "FEA45A77-4C14-6D28-147E-088A7A7A4006";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
createNode locator -n "R_handRoot_locShape" -p "R_handRoot_loc";
	rename -uid "E243BB42-4EF0-EC8E-BA54-A2BFA7CB9795";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_thumbRoot_loc_Grp" -p "R_handRoot_loc";
	rename -uid "914635A5-4FAC-79E2-82EE-F0A040351C9B";
	setAttr ".t" -type "double3" 1 0 1 ;
createNode transform -n "R_thumbRoot_loc" -p "R_thumbRoot_loc_Grp";
	rename -uid "E3077CE5-42F0-2809-7F7A-ADB492149F82";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "thumbRoot";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_thumbRoot_locShape" -p "R_thumbRoot_loc";
	rename -uid "E060418E-4513-96E9-955C-9E97D9B7633B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_thumb1_loc_Grp" -p "R_thumbRoot_loc";
	rename -uid "F6CAA6C8-4569-0877-DC8A-749F4AD78E68";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "R_thumb1_loc" -p "R_thumb1_loc_Grp";
	rename -uid "F2CC0907-4F08-ECDD-AEEE-9591880B93C2";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "thumb1";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_thumb1_locShape" -p "R_thumb1_loc";
	rename -uid "392FE03C-408B-CA9A-53D5-E4B049B3E13D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_thumb2_loc_Grp" -p "R_thumb1_loc";
	rename -uid "17D00EDE-4925-91BE-F194-0E84B6438394";
createNode transform -n "R_thumb2_loc" -p "R_thumb2_loc_Grp";
	rename -uid "21092BE8-4E1A-FD7D-3F12-ADB944E3C268";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "thumb2";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_thumb2_locShape" -p "R_thumb2_loc";
	rename -uid "F8A1BD1B-4295-2069-398B-21B5027FBF7F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_thumb2_loc_Grp_pointConstraint1" -p "R_thumb2_loc_Grp";
	rename -uid "390D1A29-4301-1E8F-D4FA-2F9CAB0E736C";
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
	rename -uid "3270A3C8-40A0-B248-6840-31AAD920A13F";
	setAttr ".t" -type "double3" 2.666 0 0 ;
createNode transform -n "R_thumb3_loc" -p "R_thumb3_loc_Grp";
	rename -uid "46F1E677-4C9A-0247-FDE7-BCBA655CC206";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "thumb3";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_thumb3_locShape" -p "R_thumb3_loc";
	rename -uid "867E216A-4F30-40C5-0971-E6B5DA54A408";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_thumb_vector_Grp" -p "R_thumb1_loc";
	rename -uid "8E62BD2E-463A-C056-235B-978A98852A63";
createNode transform -n "R_thumb_vector" -p "R_thumb_vector_Grp";
	rename -uid "43D659D3-45BB-B3DA-C24C-28BD9FC6387D";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "thumb";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "R_thumb_vectorShape" -p "R_thumb_vector";
	rename -uid "FBC3CBCB-491F-2DD3-083C-92BA617F3988";
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
createNode aimConstraint -n "R_thumb_vector_Grp_aimConstraint1" -p "R_thumb_vector_Grp";
	rename -uid "1439A56E-4173-2082-BB91-238910846F82";
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
	rename -uid "4AD8802B-4273-D80E-9BEB-09A1E027DDA1";
	setAttr ".t" -type "double3" 1 0 -1 ;
createNode transform -n "R_pinkyRoot_loc" -p "R_pinkyRoot_loc_Grp";
	rename -uid "CEEAC314-4CFC-4159-934D-F3917D8242D1";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "pinkyRoot";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_pinkyRoot_locShape" -p "R_pinkyRoot_loc";
	rename -uid "AB14162A-4CFA-7BF4-325C-BEB770A875D6";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_pinky1_loc_Grp" -p "R_pinkyRoot_loc";
	rename -uid "280E3ACD-47D3-AB87-D026-F9AF9FFF5BC8";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "R_pinky1_loc" -p "R_pinky1_loc_Grp";
	rename -uid "538C0F49-4F5B-89B9-B84C-FDAEF795B380";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "pinky1";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_pinky1_locShape" -p "R_pinky1_loc";
	rename -uid "1B61CA5E-4726-14F7-5DE6-3F873FEB092F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_pinky2_loc_Grp" -p "R_pinky1_loc";
	rename -uid "3DF20D41-4FD1-6F95-6139-CDABF4AADFFA";
createNode transform -n "R_pinky2_loc" -p "R_pinky2_loc_Grp";
	rename -uid "59B7CAAF-487B-0487-F06D-1E992423480D";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "pinky2";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_pinky2_locShape" -p "R_pinky2_loc";
	rename -uid "C05DEFBE-4A31-35E2-8899-25AA2DFE6BAE";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_pinky2_loc_Grp_pointConstraint1" -p "R_pinky2_loc_Grp";
	rename -uid "5E25DF2C-4769-2F98-4C79-B39C31EA58D9";
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
	rename -uid "C882D66A-4922-E4E7-492C-0CBF70DE7242";
createNode transform -n "R_pinky3_loc" -p "R_pinky3_loc_Grp";
	rename -uid "CE9E7D65-4653-48FC-DDAD-72B0369FE0A3";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "pinky3";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_pinky3_locShape" -p "R_pinky3_loc";
	rename -uid "623553B7-483F-BB16-36E9-D5B053928C80";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_pinky3_loc_Grp_pointConstraint1" -p "R_pinky3_loc_Grp";
	rename -uid "4DC4D71E-4EC4-E88D-008E-D2A7A49847F3";
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
	rename -uid "9A89593D-41C3-97FE-FFD7-D29969196321";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "R_pinky4_loc" -p "R_pinky4_loc_Grp";
	rename -uid "F2C14545-4CC9-4C17-CF8B-229DAF603497";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "pinky4";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_pinky4_locShape" -p "R_pinky4_loc";
	rename -uid "1B7BD86B-4E28-02DD-A72F-9784BDE07827";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_pinky_vector_Grp" -p "R_pinky1_loc";
	rename -uid "8B2B5567-4133-C33D-EEC7-F0B7D79B7069";
createNode transform -n "R_pinky_vector" -p "R_pinky_vector_Grp";
	rename -uid "94549729-49F6-C646-18DF-998C9A7245C3";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "pinky";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "R_pinky_vectorShape" -p "R_pinky_vector";
	rename -uid "0FCBB5D4-4B2A-9735-CED8-44A3A1466819";
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
createNode aimConstraint -n "R_pinky_vector_Grp_aimConstraint1" -p "R_pinky_vector_Grp";
	rename -uid "0C333A9E-43CF-946B-993C-88BDACE26EAE";
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
	rename -uid "FF8091E4-45FD-C62A-C891-9BA67D232E22";
	setAttr ".t" -type "double3" 1 0 -0.5 ;
createNode transform -n "R_ringRoot_loc" -p "R_ringRoot_loc_Grp";
	rename -uid "B940BD0A-4B93-01E6-81A0-F5A0B0BB0F4F";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ringRoot";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_ringRoot_locShape" -p "R_ringRoot_loc";
	rename -uid "EF9E56E7-49C9-9612-B37D-46A0E73DEE81";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_ring1_loc_Grp" -p "R_ringRoot_loc";
	rename -uid "987092C4-4DDA-8847-C3A9-85A0F23B0C75";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "R_ring1_loc" -p "R_ring1_loc_Grp";
	rename -uid "8E3CF434-4172-24E9-45CB-18B925E14E72";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ring1";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_ring1_locShape" -p "R_ring1_loc";
	rename -uid "85E04194-4BFF-2313-7D2D-ACB2AC9232A1";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_ring2_loc_Grp" -p "R_ring1_loc";
	rename -uid "3C3F7F8F-4671-4BF3-B0C4-ED9A95131E8D";
createNode transform -n "R_ring2_loc" -p "R_ring2_loc_Grp";
	rename -uid "BBCB92F9-4992-2E91-3AC5-CF95BD141C27";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ring2";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_ring2_locShape" -p "R_ring2_loc";
	rename -uid "12861916-4F52-9B83-094E-A3A187B39C1D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_ring2_loc_Grp_pointConstraint1" -p "R_ring2_loc_Grp";
	rename -uid "2AB99A03-4F3F-A8D8-6D43-1BB7364AC08A";
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
	rename -uid "46C2C58B-40D4-C142-C49B-26A48F817359";
createNode transform -n "R_ring3_loc" -p "R_ring3_loc_Grp";
	rename -uid "93B61C42-44D7-2BF1-B192-5FA9B2DE5280";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ring3";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_ring3_locShape" -p "R_ring3_loc";
	rename -uid "50D0B21B-4ED8-3F1D-30CD-0B9A7389C719";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_ring3_loc_Grp_pointConstraint1" -p "R_ring3_loc_Grp";
	rename -uid "2F0FBECC-4564-5876-7F09-67A37472DE1E";
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
	rename -uid "A1ED5B52-4702-9DD0-05C6-4D87BADBA90D";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "R_ring4_loc" -p "R_ring4_loc_Grp";
	rename -uid "7F7BA441-4C02-4890-9DC8-DD916C5B8CD6";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ring4";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_ring4_locShape" -p "R_ring4_loc";
	rename -uid "E1251F4B-45AB-386C-513C-55B08869B1B4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_ring_vector_Grp" -p "R_ring1_loc";
	rename -uid "C7CA083F-41E9-1B6F-F6D8-54A7C10303ED";
createNode transform -n "R_ring_vector" -p "R_ring_vector_Grp";
	rename -uid "F49D0CAD-4B34-926B-8DAF-63AAB454EF09";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "ring";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "R_ring_vectorShape" -p "R_ring_vector";
	rename -uid "8A3D3DC1-4E1D-9989-1CE9-D8B61BBDE809";
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
createNode aimConstraint -n "R_ring_vector_Grp_aimConstraint1" -p "R_ring_vector_Grp";
	rename -uid "60C8AA07-486B-E069-9897-108D5FD046E7";
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
	rename -uid "45608BD0-4871-8477-23EF-548CF8FA855D";
	setAttr ".t" -type "double3" 1 0 0.5 ;
createNode transform -n "R_indexRoot_loc" -p "R_indexRoot_loc_Grp";
	rename -uid "C9D1208C-40DC-7437-8897-5C8FACDCD6BD";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "indexRoot";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_indexRoot_locShape" -p "R_indexRoot_loc";
	rename -uid "F84972AC-4927-F1DF-0F59-FB8AC33D42E8";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_index1_loc_Grp" -p "R_indexRoot_loc";
	rename -uid "4D08C830-460F-7804-B649-F58BF26688BA";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "R_index1_loc" -p "R_index1_loc_Grp";
	rename -uid "EAF68EF2-41FD-532D-3663-B3AB3D9CFA6C";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "index1";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_index1_locShape" -p "R_index1_loc";
	rename -uid "2D4990AC-4832-D1F2-B587-DEB2D0B5D6AE";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_index2_loc_Grp" -p "R_index1_loc";
	rename -uid "A22C8EE6-4552-7A91-0AAA-37930A8AA940";
createNode transform -n "R_index2_loc" -p "R_index2_loc_Grp";
	rename -uid "B9A22DCD-447C-F86F-26EA-6584394141CD";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "index2";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_index2_locShape" -p "R_index2_loc";
	rename -uid "D580C274-4B6D-3DDF-C296-E4A31AA983CC";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_index2_loc_Grp_pointConstraint1" -p "R_index2_loc_Grp";
	rename -uid "8C99615A-4CBC-D737-7191-ECB11D1A1E4D";
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
	rename -uid "249D75D7-469F-C527-BF26-D495331F9D93";
createNode transform -n "R_index3_loc" -p "R_index3_loc_Grp";
	rename -uid "45857E74-47A2-E9FC-C59B-D1B57D7906E1";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "index3";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_index3_locShape" -p "R_index3_loc";
	rename -uid "7848086C-4AE2-8DB8-DE9C-A59D3B3F2CF4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_index3_loc_Grp_pointConstraint1" -p "R_index3_loc_Grp";
	rename -uid "7EE28932-4DDE-77E6-72F3-B6B726EDFC77";
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
	rename -uid "5FB05E7D-463C-0C04-CC78-88BE1F3B062B";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "R_index4_loc" -p "R_index4_loc_Grp";
	rename -uid "92B65FBF-489F-61D9-D13F-BEA0855D444C";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "index4";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_index4_locShape" -p "R_index4_loc";
	rename -uid "DCACDA3C-438C-16D7-3355-D4AB7FBCD7DC";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_index_vector_Grp" -p "R_index1_loc";
	rename -uid "D32DD424-4431-9186-551E-E2915495CD85";
createNode transform -n "R_index_vector" -p "R_index_vector_Grp";
	rename -uid "7D196E60-41B0-F6C4-B128-9994878A4283";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "index";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "R_index_vectorShape" -p "R_index_vector";
	rename -uid "4833D154-4E06-652D-7997-3BAC5354D6A6";
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
createNode aimConstraint -n "R_index_vector_Grp_aimConstraint1" -p "R_index_vector_Grp";
	rename -uid "8985FE7F-4ACF-A6D1-ED82-20BAFC71E470";
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
	rename -uid "264537BE-48F5-AD8B-BB6C-C8A1FFDE1D98";
	setAttr ".t" -type "double3" 1 0 0 ;
createNode transform -n "R_middleRoot_loc" -p "R_middleRoot_loc_Grp";
	rename -uid "49F02A67-48FB-BF44-0101-C4B401658EE9";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "middleRoot";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_middleRoot_locShape" -p "R_middleRoot_loc";
	rename -uid "99FC651D-4972-2701-C746-92A78A33F744";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_middle1_loc_Grp" -p "R_middleRoot_loc";
	rename -uid "89E2A63D-4426-162E-BFD0-E78F7CFF0C42";
	setAttr ".t" -type "double3" 1.5 0 0 ;
createNode transform -n "R_middle1_loc" -p "R_middle1_loc_Grp";
	rename -uid "D32195C7-4B30-736C-6489-88B34C505C19";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "middle1";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_middle1_locShape" -p "R_middle1_loc";
	rename -uid "9E72C4B1-4B36-1689-18D7-868E3538581D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_middle2_loc_Grp" -p "R_middle1_loc";
	rename -uid "67EEDF06-44CC-16E6-8212-C0B25FB1AC4A";
createNode transform -n "R_middle2_loc" -p "R_middle2_loc_Grp";
	rename -uid "D9B45EB4-43F8-6BD9-99FF-B4988B52696D";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "middle2";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_middle2_locShape" -p "R_middle2_loc";
	rename -uid "13F2ABDF-4C38-1CAD-199A-01965AF4FF97";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_middle2_loc_Grp_pointConstraint1" -p "R_middle2_loc_Grp";
	rename -uid "78E11E8B-491F-9F8A-BC80-E39C60D37A25";
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
	rename -uid "B7F2B15E-4FF5-99CE-6870-3D923771517F";
createNode transform -n "R_middle3_loc" -p "R_middle3_loc_Grp";
	rename -uid "38818E66-4811-1767-9C65-279F4B6856E4";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "middle3";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_middle3_locShape" -p "R_middle3_loc";
	rename -uid "12B5B0E0-4FDD-7F44-B9AB-BF86F66BDC3E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "R_middle3_loc_Grp_pointConstraint1" -p "R_middle3_loc_Grp";
	rename -uid "05A051AC-4AD3-A960-C7C3-75B7E2410A49";
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
	rename -uid "DD187B69-4DA1-54FB-02F5-058BD6068FE6";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "R_middle4_loc" -p "R_middle4_loc_Grp";
	rename -uid "4810C595-4596-EB87-DE92-7AA27686EA47";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "middle4";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_middle4_locShape" -p "R_middle4_loc";
	rename -uid "DA9A53F6-4576-DBEA-538B-C8B8829B91FF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_middle_vector_Grp" -p "R_middle1_loc";
	rename -uid "4993503B-48F6-E423-88C7-9A919DD74ECE";
createNode transform -n "R_middle_vector" -p "R_middle_vector_Grp";
	rename -uid "64A986DD-4847-AF52-3517-56B4E0935473";
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
	setAttr ".rig_module" -type "string" "hand_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "middle";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "R_middle_vectorShape" -p "R_middle_vector";
	rename -uid "6C8ABFB7-48F0-DFBB-6210-1D96F2E97B92";
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
createNode aimConstraint -n "R_middle_vector_Grp_aimConstraint1" -p "R_middle_vector_Grp";
	rename -uid "13B4E67B-46AB-8AC8-001D-64AAAE1261DA";
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
	rename -uid "E92A75DD-4C5C-0150-7E59-5E82FB189724";
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
createNode transform -n "C_head_nonParent";
	rename -uid "DFBF6D1F-464F-C1A3-AA12-25B725B8F33E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "head_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "container";
	setAttr ".rig_data" -type "string" "group";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "C_jaw_Crv" -p "C_head_nonParent";
	rename -uid "3C3DBD72-464A-CFE6-1F2F-2CBDDAF0E899";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "C_jaw_CrvShape" -p "C_jaw_Crv";
	rename -uid "ADBF1300-414F-28EF-4050-B2B9F902A679";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 49 3
		0 45 7
		;
createNode transform -n "C_gumA_Crv" -p "C_head_nonParent";
	rename -uid "08EBD2D0-458F-43B0-658B-08B65E0A34FC";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "C_gumA_CrvShape" -p "C_gumA_Crv";
	rename -uid "00260E4F-46FD-528A-8D00-89A6BBEF523A";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 49 3
		0 46 5
		;
createNode transform -n "C_gumB_Crv" -p "C_head_nonParent";
	rename -uid "A75DDAB8-4838-C7ED-3829-97AEC68C203F";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "C_gumB_CrvShape" -p "C_gumB_Crv";
	rename -uid "BEEAED49-4FD9-7F05-2A16-B2B8671E3F8C";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 49 3
		0 49 5
		;
createNode transform -n "C_tongue_Crv" -p "C_head_nonParent";
	rename -uid "89AE2CF8-4705-3DB5-1405-789112FFC9EE";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "C_tongue_CrvShape" -p "C_tongue_Crv";
	rename -uid "0460F4A7-48FD-D574-FAEC-B58F0A8FC4DB";
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
		0 46 3
		0 46.583717346191406 3.2839615345001221
		0 47.892116546630859 4.2496929168701172
		0 48.095920562744141 6.0671091079711914
		0 48 7
		;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "head_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "tongue";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "C_tonguePivot_Crv" -p "C_head_nonParent";
	rename -uid "9182B155-4B0C-0B63-6C34-1E926D18EFD3";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "C_tonguePivot_CrvShape" -p "C_tonguePivot_Crv";
	rename -uid "9EA978F8-4423-2A5E-7D17-5AA3E07C8414";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 46 3
		0 46 4
		;
createNode transform -n "L_eye_Crv" -p "C_head_nonParent";
	rename -uid "A7F33E77-4FBE-7EED-2169-68A36404F8F7";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_eye_CrvShape" -p "L_eye_Crv";
	rename -uid "0D0E8445-4283-F650-6D58-D39CCF17040F";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		3 56 5
		3 56 7
		;
createNode transform -n "L_eyeAim_Crv" -p "C_head_nonParent";
	rename -uid "7030D39D-4C14-3A29-3FD9-0FA73870B019";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_eyeAim_CrvShape" -p "L_eyeAim_Crv";
	rename -uid "0D92346D-4DDD-22B9-AD3B-30A0F009295A";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		3 56 5
		3 56 17
		;
createNode transform -n "R_eye_Crv" -p "C_head_nonParent";
	rename -uid "C393A567-4483-7552-003C-93AF10C00430";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_eye_CrvShape" -p "R_eye_Crv";
	rename -uid "4CF1FD1F-482B-6150-BFCD-D7B379B5BAB6";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-3 56 5
		-3.0000000000000004 56 7
		;
createNode transform -n "R_eyeAim_Crv" -p "C_head_nonParent";
	rename -uid "169376A7-46EF-03C4-C805-2085C45CEABC";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_eyeAim_CrvShape" -p "R_eyeAim_Crv";
	rename -uid "10F73813-42F8-5AF8-31DA-A998016583C4";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-3 56 5
		-3.0000000000000022 56 17
		;
createNode transform -n "C_head_mirror";
	rename -uid "116BCB00-4548-DA54-E31C-5281DCDA8144";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "head_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "mirror";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "C_head_loc_Grp" -p "C_head_mirror";
	rename -uid "64507BBC-49D2-522A-6C2D-00AADF454F04";
createNode transform -n "C_head_loc" -p "C_head_loc_Grp";
	rename -uid "C66652FA-45D2-9DF9-3CA4-02AA06D0AE69";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "head_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "head";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "C_head_locShape" -p "C_head_loc";
	rename -uid "9A13C833-41E9-6B30-7FF4-6E887B5DDF5B";
	setAttr -k off ".v";
createNode transform -n "C_headA_loc_Grp" -p "C_head_loc";
	rename -uid "4CFA9AE1-42AB-0C5B-68BB-C897E813B492";
	setAttr ".t" -type "double3" 0 -1 2 ;
createNode transform -n "C_headA_loc" -p "C_headA_loc_Grp";
	rename -uid "9C194239-4F17-BB1A-CDDA-7F826A2999EC";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 28;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "head_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "headA";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "C_headA_locShape" -p "C_headA_loc";
	rename -uid "AEE90977-4836-386D-3EEF-52ADBA0F5916";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "C_jaw_loc_Grp" -p "C_headA_loc";
	rename -uid "601272FA-4CCF-926C-31EC-5E8C9C43D598";
	setAttr ".t" -type "double3" 0 -1 1 ;
createNode transform -n "C_jaw_loc" -p "C_jaw_loc_Grp";
	rename -uid "46260178-4FEF-22B3-4C80-45A2D46199B2";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 28;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "gum_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "jaw";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "C_jaw_locShape" -p "C_jaw_loc";
	rename -uid "1ABAA8B6-479D-5F37-6CF3-FA8CA4C96FE7";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_jawEnd_loc_Grp" -p "C_jaw_loc";
	rename -uid "C3C010B9-4EBE-B148-13E0-6B94CA6BEDE5";
	setAttr ".t" -type "double3" 0 -4 4 ;
createNode transform -n "C_jawEnd_loc" -p "C_jawEnd_loc_Grp";
	rename -uid "DEE0C1CA-45CC-0960-2815-27A56B0C6F43";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 28;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "gum_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "jawEnd";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "C_jawEnd_locShape" -p "C_jawEnd_loc";
	rename -uid "5518C222-43B1-8CFD-4658-0A8576FDBACC";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_gumA_loc_Grp" -p "C_headA_loc";
	rename -uid "E76120A6-4C00-C6CC-3916-A6BAD629B859";
	setAttr ".t" -type "double3" 0 -4 3 ;
createNode transform -n "C_gumA_loc" -p "C_gumA_loc_Grp";
	rename -uid "28ED228B-4919-CEA7-5EFB-BC9D524ED4B0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 28;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "gum_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "gumA";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "C_gumA_locShape" -p "C_gumA_loc";
	rename -uid "2163D27A-48C0-B135-0A6B-4597A0968C10";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_gumB_loc_Grp" -p "C_headA_loc";
	rename -uid "ABA60107-41ED-CA5F-10F7-829BB1DDD6D8";
	setAttr ".t" -type "double3" 0 -1 3 ;
createNode transform -n "C_gumB_loc" -p "C_gumB_loc_Grp";
	rename -uid "A39605EE-4F6B-1F37-BD51-4E8DC26D42F4";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 28;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "gum_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "gumB";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "C_gumB_locShape" -p "C_gumB_loc";
	rename -uid "5B0EFCD2-4A31-B584-F981-DA9D3AF8809D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_tongue1_loc_Grp" -p "C_headA_loc";
	rename -uid "AC21133F-40C0-12F2-75DA-85B944D9E5EB";
	setAttr ".t" -type "double3" 0 -4 1 ;
createNode transform -n "C_tongue1_loc" -p "C_tongue1_loc_Grp";
	rename -uid "D6DAD678-4D2D-7C5F-54F0-E580845A0285";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "tongue_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "tongue1";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "C_tongue1_locShape" -p "C_tongue1_loc";
	rename -uid "5B1BDC9E-4B86-2365-24EA-79A1C9EFCCB8";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_tongueExtra1_loc_Grp" -p "C_headA_loc";
	rename -uid "41A7E02A-4A05-FC66-B850-45B68BE638FD";
createNode transform -n "C_tongueExtra1_loc" -p "C_tongueExtra1_loc_Grp";
	rename -uid "63C7B3A1-4E5D-EC1C-EB44-BD8C8992624C";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
createNode locator -n "C_tongueExtra1_locShape" -p "C_tongueExtra1_loc";
	rename -uid "9E84A507-4149-7D4A-7EC9-CA86AB101638";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode pointConstraint -n "C_tongueExtra1_loc_Grp_pointConstraint1" -p "C_tongueExtra1_loc_Grp";
	rename -uid "7A05E229-4FAD-7AAF-57A6-B39FC7111F9C";
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
createNode transform -n "C_tongue2_loc_Grp" -p "C_headA_loc";
	rename -uid "6A89CB33-411D-CBF3-BD63-498EF839B736";
createNode transform -n "C_tongue2_loc" -p "C_tongue2_loc_Grp";
	rename -uid "272E4E15-4F2C-E3F4-9329-B1AE28042D1B";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "tongue_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "tongue2";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "C_tongue2_locShape" -p "C_tongue2_loc";
	rename -uid "23E0C5C7-40D9-64AA-D96F-8A8677AC6218";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "C_tongue2_loc_Grp_pointConstraint1" -p "C_tongue2_loc_Grp";
	rename -uid "EC6F2BEF-43BA-7D9E-AE7F-EFB2D9F60637";
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
createNode transform -n "C_tongueExtra2_loc_Grp" -p "C_headA_loc";
	rename -uid "978152B5-419E-C90D-18AA-AFB5C84C91DE";
createNode transform -n "C_tongueExtra2_loc" -p "C_tongueExtra2_loc_Grp";
	rename -uid "288295ED-4E70-4FF9-606A-85A386D88B15";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
createNode locator -n "C_tongueExtra2_locShape" -p "C_tongueExtra2_loc";
	rename -uid "A027BB62-428A-6770-C19D-E7B8BFCF8C9B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode pointConstraint -n "C_tongueExtra2_loc_Grp_pointConstraint1" -p "C_tongueExtra2_loc_Grp";
	rename -uid "6E523A84-4403-5CB7-D6D2-EB8BE2FFFBAF";
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
createNode transform -n "C_tongue3_loc_Grp" -p "C_headA_loc";
	rename -uid "1535472A-43E5-CB52-8015-E58E908FAA4F";
	setAttr ".t" -type "double3" 0 -2 5 ;
createNode transform -n "C_tongue3_loc" -p "C_tongue3_loc_Grp";
	rename -uid "A8FA8911-4CDA-7E83-596C-7ABD986C3FE0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "tongue_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "tongue3";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "C_tongue3_locShape" -p "C_tongue3_loc";
	rename -uid "CF707034-4E80-83FA-2986-B581B6A97CCC";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_tonguePivot_loc_Grp" -p "C_headA_loc";
	rename -uid "4E77A0E2-449C-086D-2B15-ECA76B55C225";
	setAttr ".t" -type "double3" 0 -4 2 ;
createNode transform -n "C_tonguePivot_loc" -p "C_tonguePivot_loc_Grp";
	rename -uid "694E1A88-427C-8FC5-BF98-0F9D7D42CE15";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "tongue_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "tongue";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "C_tonguePivot_locShape" -p "C_tonguePivot_loc";
	rename -uid "9B8DC118-44FF-772C-BE88-2E94A30584A5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "C_headB_loc_Grp" -p "C_head_loc";
	rename -uid "7118DA4C-40B9-AC0F-C265-D7BEAD1A58A0";
	setAttr ".t" -type "double3" 0 1 2 ;
createNode transform -n "C_headB_loc" -p "C_headB_loc_Grp";
	rename -uid "98D666F6-4BF7-9F53-CEC8-0F9D22470A65";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "head_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "headB";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "C_headB_locShape" -p "C_headB_loc";
	rename -uid "2DA468A1-43D4-BF8B-8E33-1BA22FE23645";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "C_nose_loc_Grp" -p "C_headB_loc";
	rename -uid "EC6C8CB3-4EE5-B94F-C9C9-FC9750EC72CF";
	setAttr ".t" -type "double3" 0 -1 5 ;
createNode transform -n "C_nose_loc" -p "C_nose_loc_Grp";
	rename -uid "360901FE-4599-71F0-E3C3-2093227B9E32";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".t" -type "double3" 0.056490961808491669 -0.14021338325147781 0.032717656879860613 ;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "head_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "nose";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "C_nose_locShape" -p "C_nose_loc";
	rename -uid "7856DF80-4E02-322C-7B1F-8E9A3EB09236";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_eyeRoot_mirror" -p "C_headB_loc";
	rename -uid "D395B4E7-4EE7-EA30-DDF3-969281878DB8";
	setAttr ".t" -type "double3" 3 4 3 ;
createNode transform -n "L_eyeRoot_loc_Grp" -p "L_eyeRoot_mirror";
	rename -uid "8ED5B874-4B4F-B5A4-1B99-8DB0F4745568";
createNode transform -n "L_eyeRoot_loc" -p "L_eyeRoot_loc_Grp";
	rename -uid "3B82F5B4-4B9E-A4C9-C7FA-469BE5D9A97A";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
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
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "eye_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "eyeRoot";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_eyeRoot_locShape" -p "L_eyeRoot_loc";
	rename -uid "6490229E-43EF-A334-F588-82A2697E5014";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_eye_loc_Grp" -p "L_eyeRoot_loc";
	rename -uid "F0D022F1-4EFC-7C50-12DE-81A7DA441C4C";
	setAttr ".v" no;
createNode transform -n "L_eye_loc" -p "L_eye_loc_Grp";
	rename -uid "EFB85239-49C8-2610-69D4-EAAC48B661A0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "eye_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "eye";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_eye_locShape" -p "L_eye_loc";
	rename -uid "867968D8-42D6-FA53-851C-82A21F3B18DC";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_eyeEnd_loc_Grp" -p "L_eyeRoot_loc";
	rename -uid "ADAE494B-46B5-7F2C-BC66-029AADDBB6C6";
	setAttr ".t" -type "double3" 0 0 2 ;
createNode transform -n "L_eyeEnd_loc" -p "L_eyeEnd_loc_Grp";
	rename -uid "B52DC4AC-482E-0320-5CA4-8ABD39CAD59F";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "eye_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "eyeEnd";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_eyeEnd_locShape" -p "L_eyeEnd_loc";
	rename -uid "FF359782-4B66-CE99-2CDA-1BA8928A2CDB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_eye_vector_Grp" -p "L_eyeRoot_mirror";
	rename -uid "809A6140-4B85-81BD-ECEC-2AA7874DF9CD";
createNode transform -n "L_eye_vector" -p "L_eye_vector_Grp";
	rename -uid "EFF7745B-4663-66AF-BF8C-CC8574CB3A99";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "eye_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "eye";
	setAttr ".rig_index" -type "string" "";
createNode locator -n "L_eye_vectorShape" -p "L_eye_vector";
	rename -uid "CB892573-4D2C-3894-A53D-D8B1023E8897";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_eye_vector_Grp_parentConstraint1" -p "L_eye_vector_Grp";
	rename -uid "C1E4D669-48F5-793E-00FC-DC8C13CE8F7D";
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
createNode transform -n "R_eyeRoot_mirror" -p "C_headB_loc";
	rename -uid "D672C0FA-41EA-D297-CE0E-7083802A3E04";
	setAttr ".t" -type "double3" -3 4 3 ;
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr ".s" -type "double3" 1 1 -1 ;
createNode transform -n "R_eyeRoot_loc_Grp" -p "R_eyeRoot_mirror";
	rename -uid "F350749C-4F6F-C1D5-9503-F3B2A2FDEE1F";
createNode transform -n "R_eyeRoot_loc" -p "R_eyeRoot_loc_Grp";
	rename -uid "16A3BAA4-4328-E12E-DFA2-AB91DE8F89CD";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
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
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "eye_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "eyeRoot";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_eyeRoot_locShape" -p "R_eyeRoot_loc";
	rename -uid "7EA82787-4647-AA30-DAB4-319A0B456A19";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_eye_loc_Grp" -p "R_eyeRoot_loc";
	rename -uid "64C1EFE3-4E76-F20D-B7B7-168D01D859D7";
	setAttr ".v" no;
createNode transform -n "R_eye_loc" -p "R_eye_loc_Grp";
	rename -uid "9CCDAB01-48ED-6541-855A-8792EF83A8C9";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "eye_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "eye";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_eye_locShape" -p "R_eye_loc";
	rename -uid "5240F603-4A8C-E6A7-A626-EF8523278430";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_eyeEnd_loc_Grp" -p "R_eyeRoot_loc";
	rename -uid "75CC1823-45BF-3B3B-5389-78868B3F67E4";
	setAttr ".t" -type "double3" 0 0 2 ;
createNode transform -n "R_eyeEnd_loc" -p "R_eyeEnd_loc_Grp";
	rename -uid "14659633-4A96-2634-F1D5-C48D444C9567";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "eye_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "eyeEnd";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_eyeEnd_locShape" -p "R_eyeEnd_loc";
	rename -uid "CA59C4FC-4ED1-FCF2-5C3A-BCA49195C645";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_eye_vector_Grp" -p "R_eyeRoot_mirror";
	rename -uid "3AF10459-43BC-75F4-DB40-B0850D499D36";
createNode transform -n "R_eye_vector" -p "R_eye_vector_Grp";
	rename -uid "BAD066EC-42FC-22B7-CF1F-CEA9C126D14B";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 15;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "eye_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "eye";
	setAttr ".rig_index" -type "string" "";
createNode locator -n "R_eye_vectorShape" -p "R_eye_vector";
	rename -uid "72017155-4B15-A49A-AB56-D58AB734B052";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_eye_vector_Grp_parentConstraint1" -p "R_eye_vector_Grp";
	rename -uid "2DBDCAD2-463F-1341-16D6-97B9F3533147";
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
createNode transform -n "C_eye_loc_Grp" -p "C_headB_loc";
	rename -uid "BA9E44E2-4C24-E177-37D8-1390ECB39A33";
	setAttr ".t" -type "double3" -6.6613381477509392e-16 4 15 ;
createNode transform -n "C_eye_loc" -p "C_eye_loc_Grp";
	rename -uid "19DA1137-4390-869A-0E24-6B8A5DBE34FC";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "eye_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "eye";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "C_eye_locShape" -p "C_eye_loc";
	rename -uid "2C5DB658-4BB2-7B3C-F927-A2A4F6745520";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode parentConstraint -n "C_head_mirror_parentConstraint1" -p "C_head_mirror";
	rename -uid "C1F5DE61-4A59-6F5E-AC18-208F58758D7B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "C_neckRoot_locW0" -dv 1 -min 0 -at "double";
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
	rename -uid "CED20669-4B6E-B95E-0FC9-86BD32A7BC16";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode VRaySettingsNode -s -n "vraySettings";
	rename -uid "A1A48749-4F33-3C76-5E41-13998E2DE397";
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
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "09219D91-4446-36F3-DFAD-B69CA02749FE";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "5C9244BF-4F76-5265-C4C1-B9A59E6C0144";
createNode displayLayerManager -n "layerManager";
	rename -uid "8103AC68-4EC7-68D2-73D5-0A8A1052132A";
createNode displayLayer -n "defaultLayer";
	rename -uid "3D79FB48-45FC-677C-1C34-D4B836994C99";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "88138F71-4A77-B348-8C7C-08BF3CA38846";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "6ADEFCF9-48AB-1256-B684-25B3F7736254";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager12";
	rename -uid "D374CB7D-4271-13F4-2595-828C190B67A0";
createNode renderLayer -n "defaultRenderLayer12";
	rename -uid "F04BB8FA-4375-B4F3-1D64-59B7C4140232";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager13";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer13";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager9";
	rename -uid "BBE41C10-4842-0E74-7A1D-059EC6677024";
createNode poseInterpolatorManager -n "poseInterpolatorManager9";
	rename -uid "B035F0B4-43A2-9A11-B642-F3BC309482B9";
createNode renderLayerManager -n "renderLayerManager14";
	rename -uid "2204E19E-4CC0-AAF8-3205-5FA0D67F8C04";
createNode renderLayer -n "defaultRenderLayer14";
	rename -uid "6817F74C-491A-16D8-CF48-E1A2A60FB2C6";
	setAttr ".g" yes;
createNode script -n "backUp_uiConfigurationScriptNode3";
	rename -uid "38F3C7A3-4096-3305-4AB9-4BAB0F072495";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode script -n "uiConfigurationScriptNode4";
	rename -uid "F1744C4C-4CC9-322E-40D5-80927005FAFF";
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
createNode script -n "sceneConfigurationScriptNode4";
	rename -uid "CBCEECF5-46C7-68D4-B5D1-538EB499192F";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode shapeEditorManager -n "shapeEditorManager7";
	rename -uid "901E1FFA-49FE-CCF8-C23D-1BAE36AA26E2";
createNode poseInterpolatorManager -n "poseInterpolatorManager7";
	rename -uid "74FB312B-4E25-D04C-5E0D-349F110856EE";
createNode renderLayerManager -n "renderLayerManager9";
	rename -uid "E930BF74-42AA-1F5E-D3E4-5AA45863E3FA";
createNode renderLayer -n "defaultRenderLayer9";
	rename -uid "33B341B9-47DF-CC2A-577A-769CB8197643";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager5";
	rename -uid "ACB42E0F-414C-E688-98D9-008A20491864";
createNode poseInterpolatorManager -n "poseInterpolatorManager5";
	rename -uid "EE0AA319-47D7-0B0D-4363-9B8C668AD435";
createNode renderLayerManager -n "renderLayerManager10";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer10";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager8";
	rename -uid "E517CDD2-4ACB-DDBD-D4CE-1C9D248B3173";
createNode poseInterpolatorManager -n "poseInterpolatorManager8";
	rename -uid "7263EA5F-4D58-6F95-7FFF-23AAD6CF5BAC";
createNode renderLayerManager -n "renderLayerManager11";
	rename -uid "593F2969-4831-AA33-2118-1488082CA92B";
createNode renderLayer -n "defaultRenderLayer11";
	rename -uid "C2AEF630-40D0-B673-5645-479A4FD709FF";
	setAttr ".g" yes;
createNode script -n "backUp_uiConfigurationScriptNode2";
	rename -uid "BC1E490A-4A25-9EF5-4058-DFA2736529C2";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode shapeEditorManager -n "shapeEditorManager2";
	rename -uid "03FCC6F5-452A-98EB-FD8A-748508DFB982";
createNode poseInterpolatorManager -n "poseInterpolatorManager2";
	rename -uid "53BB25B0-4567-D771-38AD-AC8AA9568870";
createNode renderLayerManager -n "renderLayerManager1";
	rename -uid "34824356-4CAB-494E-4AC5-6789C832E1F0";
createNode renderLayer -n "defaultRenderLayer1";
	rename -uid "9FF8B58F-40B9-DAAC-F268-809E3FE42501";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager4";
	rename -uid "ACB42E0F-414C-E688-98D9-008A20491864";
createNode poseInterpolatorManager -n "poseInterpolatorManager4";
	rename -uid "EE0AA319-47D7-0B0D-4363-9B8C668AD435";
createNode renderLayerManager -n "renderLayerManager2";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer2";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode animCurveTL -n "temp_nameShape1_controlPoints_0__xValue";
	rename -uid "6A6595DA-45C5-A99F-AD7A-D98DA17AC943";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0.49999999999999978;
createNode animCurveTL -n "temp_nameShape1_controlPoints_0__yValue";
	rename -uid "5B786052-455F-F86A-9CFA-FE86F14F235C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_0__zValue";
	rename -uid "AD4AB1F4-4FB7-4EB5-6C86-1C805F83E3C4";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_1__xValue";
	rename -uid "5FEBEF4B-4AAB-B8CC-776A-50880797D455";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_1__yValue";
	rename -uid "5A66540F-4723-0CDC-2895-FA9EA761B2CB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_1__zValue";
	rename -uid "E1CA0F4A-46A9-2BCC-C148-D3BFEB3A7B26";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.49999999999999978;
createNode animCurveTL -n "temp_nameShape1_controlPoints_2__xValue";
	rename -uid "0C55366F-4223-9577-2A64-9A88DFF87BF5";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.49999999999999978;
createNode animCurveTL -n "temp_nameShape1_controlPoints_2__yValue";
	rename -uid "CA199378-4E59-D979-1F6E-B2A8EFD01F2F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_2__zValue";
	rename -uid "6B3507AC-46A0-D07B-B15E-3F96E6F65C1E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_3__xValue";
	rename -uid "3FD112DE-473D-9ECA-C281-1AB50652A53B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.99999999999999956;
createNode animCurveTL -n "temp_nameShape1_controlPoints_3__yValue";
	rename -uid "703A49FE-4C61-54D2-E929-6A8086486FBC";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_3__zValue";
	rename -uid "67B1BB33-42C8-FF61-6146-D7B1CA27B139";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_4__xValue";
	rename -uid "EE43EA5F-4740-3812-A2B7-30B3977BB065";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_4__yValue";
	rename -uid "F16033C1-46EE-83C1-EE33-F1B3AD24862A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_4__zValue";
	rename -uid "1D7BB404-41D8-A96A-DBE2-5489AC087F51";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.99999999999999956;
createNode animCurveTL -n "temp_nameShape1_controlPoints_5__xValue";
	rename -uid "78778FC9-4FD2-5E5A-631A-97971DA52DF1";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0.99999999999999956;
createNode animCurveTL -n "temp_nameShape1_controlPoints_5__yValue";
	rename -uid "B715BB4F-4993-4BA9-9942-67B70AB00315";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_5__zValue";
	rename -uid "9E218E8B-4EBF-B299-9529-CFB9790F6B06";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_6__xValue";
	rename -uid "740B9A1E-4301-C987-BAB0-9DAF0D133306";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0.49999999999999978;
createNode animCurveTL -n "temp_nameShape1_controlPoints_6__yValue";
	rename -uid "7C04D04B-44FF-1C49-C874-5F84FC3EC667";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_6__zValue";
	rename -uid "BBA2CCEE-4BF7-B840-538F-3B90E611DD66";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_0__xValue1";
	rename -uid "253D4C0C-4826-5177-9CA2-83BB245B58FE";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0.49999999999999978;
createNode animCurveTL -n "temp_nameShape1_controlPoints_0__yValue1";
	rename -uid "BEA03817-4F66-AFBC-FD1A-6490220155DB";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_0__zValue1";
	rename -uid "97A8B1F1-454F-4E27-BCD0-5FA5AD2841F0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_1__xValue1";
	rename -uid "96ADE1D5-4285-89BB-46DC-B488E4E95032";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_1__yValue1";
	rename -uid "4E31E53B-48D3-3D93-2511-70BE3588255C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_1__zValue1";
	rename -uid "D6936967-449F-5BD6-8915-3C9ECD9C362C";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.49999999999999978;
createNode animCurveTL -n "temp_nameShape1_controlPoints_2__xValue1";
	rename -uid "4BB7AB03-4BED-5B1B-AD56-94A720A33564";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.49999999999999978;
createNode animCurveTL -n "temp_nameShape1_controlPoints_2__yValue1";
	rename -uid "2798F4D0-4F9C-61B8-2445-509D970A3ED0";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_2__zValue1";
	rename -uid "BE556083-499C-FBDA-010C-81A1D022E18B";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_3__xValue1";
	rename -uid "4015420F-4D67-3291-4F23-239151463228";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.99999999999999956;
createNode animCurveTL -n "temp_nameShape1_controlPoints_3__yValue1";
	rename -uid "2EDE61A6-4B6A-3290-BD08-429756C08FF2";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_3__zValue1";
	rename -uid "EA293B23-4767-891C-77FF-3F91DEE0316F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_4__xValue1";
	rename -uid "52EBEE8E-4EA1-05DF-D52B-43B05EB4732A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_4__yValue1";
	rename -uid "E3872FB9-45D4-74B0-C8BD-4C92FE9F5F87";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_4__zValue1";
	rename -uid "FD0F212C-43FA-4E0D-4D13-0F8F965CC69A";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 -0.99999999999999956;
createNode animCurveTL -n "temp_nameShape1_controlPoints_5__xValue1";
	rename -uid "CD0A0D5C-4D1F-2DCE-386C-72A5DE9F3A25";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0.99999999999999956;
createNode animCurveTL -n "temp_nameShape1_controlPoints_5__yValue1";
	rename -uid "B1B799FA-42F6-538E-2A7D-A29EAFFAE228";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_5__zValue1";
	rename -uid "BA8C5266-4A68-F387-9551-17B6E828DC1F";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_6__xValue1";
	rename -uid "BCE0A9D9-4E7B-101D-E400-97B4CAA2170E";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0.49999999999999978;
createNode animCurveTL -n "temp_nameShape1_controlPoints_6__yValue1";
	rename -uid "01350AFA-43C9-B154-823D-02802F34401D";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode animCurveTL -n "temp_nameShape1_controlPoints_6__zValue1";
	rename -uid "782A0EAD-4F2B-66E4-1186-E2BBB26CF903";
	setAttr ".tan" 18;
	setAttr ".wgt" no;
	setAttr ".ktv[0]"  1 0;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "DA711668-4FF2-7E7B-074D-569D057E7B6B";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode renderLayerManager -n "renderLayerManager3";
	rename -uid "A0F8C52F-48AD-E63B-423D-A580006DDD8D";
createNode renderLayer -n "defaultRenderLayer3";
	rename -uid "782FAD52-4D0C-4283-2878-E1A235A5814C";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager4";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer4";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager5";
	rename -uid "573B5091-4070-0CB9-0906-1B8A09A9EF62";
createNode renderLayer -n "defaultRenderLayer5";
	rename -uid "BBF9D720-4D86-9256-C5AE-22AA6F456E03";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager6";
	rename -uid "728D0BDF-45D7-8828-D8FB-0CAFCD42ED9D";
createNode renderLayer -n "defaultRenderLayer6";
	rename -uid "3CECC1BD-429B-8560-DE57-659C1B787A7B";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager7";
	rename -uid "78066895-4C95-18D2-BF05-24BBBB7B247C";
createNode renderLayer -n "defaultRenderLayer7";
	rename -uid "6B2E1001-42F8-B4F9-3A5B-BBB2E5BC3AF4";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager6";
	rename -uid "D52A5437-45FB-03DF-BB12-A3AABE77BE0F";
createNode poseInterpolatorManager -n "poseInterpolatorManager6";
	rename -uid "50C5E128-4BB6-53F6-16A0-6C8FCAA091A0";
createNode renderLayerManager -n "renderLayerManager8";
	rename -uid "CC56CDD7-48DD-9E6E-4757-9CADCBC44701";
createNode renderLayer -n "defaultRenderLayer8";
	rename -uid "4FC8D4DC-416A-8515-A351-86B121A81F01";
	setAttr ".g" yes;
createNode script -n "backUp_uiConfigurationScriptNode1";
	rename -uid "ED1C08CA-4A71-48B5-E139-CD83A37AD58B";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode renderLayerManager -n "renderLayerManager15";
	rename -uid "1ECDF3E6-402D-F519-B0B3-9DAD99C62122";
createNode renderLayer -n "defaultRenderLayer15";
	rename -uid "F04BB8FA-4375-B4F3-1D64-59B7C4140232";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager16";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer16";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager10";
	rename -uid "69EEC230-4FE7-7607-1D06-ADBB0018CF83";
createNode poseInterpolatorManager -n "poseInterpolatorManager10";
	rename -uid "F1608DB2-4537-FA27-9CF9-28985AA5279A";
createNode renderLayerManager -n "renderLayerManager17";
	rename -uid "2204E19E-4CC0-AAF8-3205-5FA0D67F8C04";
createNode renderLayer -n "defaultRenderLayer17";
	rename -uid "6817F74C-491A-16D8-CF48-E1A2A60FB2C6";
	setAttr ".g" yes;
createNode script -n "backUp_uiConfigurationScriptNode4";
	rename -uid "A72189A9-4189-A6FD-578B-E38A4343B8A4";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "AF4356A2-4024-BEFE-7658-579D104DD91A";
	setAttr ".def" no;
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
	setAttr -s 18 ".r";
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
select -ne :ikSystem;
	setAttr -s 4 ".sol";
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
connectAttr "C_neckEnd_loc_pointConstraint1.ctx" "C_neckEnd_loc.tx";
connectAttr "C_neckEnd_loc_pointConstraint1.cty" "C_neckEnd_loc.ty";
connectAttr "C_neckEnd_loc_pointConstraint1.ctz" "C_neckEnd_loc.tz";
connectAttr "C_neckEnd_loc.pim" "C_neckEnd_loc_pointConstraint1.cpim";
connectAttr "C_neckEnd_loc.rp" "C_neckEnd_loc_pointConstraint1.crp";
connectAttr "C_neckEnd_loc.rpt" "C_neckEnd_loc_pointConstraint1.crt";
connectAttr "C_head_loc.t" "C_neckEnd_loc_pointConstraint1.tg[0].tt";
connectAttr "C_head_loc.rp" "C_neckEnd_loc_pointConstraint1.tg[0].trp";
connectAttr "C_head_loc.rpt" "C_neckEnd_loc_pointConstraint1.tg[0].trt";
connectAttr "C_head_loc.pm" "C_neckEnd_loc_pointConstraint1.tg[0].tpm";
connectAttr "C_neckEnd_loc_pointConstraint1.w0" "C_neckEnd_loc_pointConstraint1.tg[0].tw"
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
connectAttr "C_root_loc.t" "L_hip_mirror_parentConstraint1.tg[0].tt";
connectAttr "C_root_loc.rp" "L_hip_mirror_parentConstraint1.tg[0].trp";
connectAttr "C_root_loc.rpt" "L_hip_mirror_parentConstraint1.tg[0].trt";
connectAttr "C_root_loc.r" "L_hip_mirror_parentConstraint1.tg[0].tr";
connectAttr "C_root_loc.ro" "L_hip_mirror_parentConstraint1.tg[0].tro";
connectAttr "C_root_loc.s" "L_hip_mirror_parentConstraint1.tg[0].ts";
connectAttr "C_root_loc.pm" "L_hip_mirror_parentConstraint1.tg[0].tpm";
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
connectAttr "C_root_loc.t" "R_hip_mirror_parentConstraint1.tg[0].tt";
connectAttr "C_root_loc.rp" "R_hip_mirror_parentConstraint1.tg[0].trp";
connectAttr "C_root_loc.rpt" "R_hip_mirror_parentConstraint1.tg[0].trt";
connectAttr "C_root_loc.r" "R_hip_mirror_parentConstraint1.tg[0].tr";
connectAttr "C_root_loc.ro" "R_hip_mirror_parentConstraint1.tg[0].tro";
connectAttr "C_root_loc.s" "R_hip_mirror_parentConstraint1.tg[0].ts";
connectAttr "C_root_loc.pm" "R_hip_mirror_parentConstraint1.tg[0].tpm";
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
connectAttr "C_chest_loc.t" "L_scapula_mirror_parentConstraint1.tg[0].tt";
connectAttr "C_chest_loc.rp" "L_scapula_mirror_parentConstraint1.tg[0].trp";
connectAttr "C_chest_loc.rpt" "L_scapula_mirror_parentConstraint1.tg[0].trt";
connectAttr "C_chest_loc.r" "L_scapula_mirror_parentConstraint1.tg[0].tr";
connectAttr "C_chest_loc.ro" "L_scapula_mirror_parentConstraint1.tg[0].tro";
connectAttr "C_chest_loc.s" "L_scapula_mirror_parentConstraint1.tg[0].ts";
connectAttr "C_chest_loc.pm" "L_scapula_mirror_parentConstraint1.tg[0].tpm";
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
connectAttr "C_chest_loc.t" "R_scapula_mirror_parentConstraint1.tg[0].tt";
connectAttr "C_chest_loc.rp" "R_scapula_mirror_parentConstraint1.tg[0].trp";
connectAttr "C_chest_loc.rpt" "R_scapula_mirror_parentConstraint1.tg[0].trt";
connectAttr "C_chest_loc.r" "R_scapula_mirror_parentConstraint1.tg[0].tr";
connectAttr "C_chest_loc.ro" "R_scapula_mirror_parentConstraint1.tg[0].tro";
connectAttr "C_chest_loc.s" "R_scapula_mirror_parentConstraint1.tg[0].ts";
connectAttr "C_chest_loc.pm" "R_scapula_mirror_parentConstraint1.tg[0].tpm";
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
connectAttr "L_thumb_vector_Grp_aimConstraint1.crx" "L_thumb_vector_Grp.rx";
connectAttr "L_thumb_vector_Grp_aimConstraint1.cry" "L_thumb_vector_Grp.ry";
connectAttr "L_thumb_vector_Grp_aimConstraint1.crz" "L_thumb_vector_Grp.rz";
connectAttr "L_thumb_vector_Grp.pim" "L_thumb_vector_Grp_aimConstraint1.cpim";
connectAttr "L_thumb_vector_Grp.t" "L_thumb_vector_Grp_aimConstraint1.ct";
connectAttr "L_thumb_vector_Grp.rp" "L_thumb_vector_Grp_aimConstraint1.crp";
connectAttr "L_thumb_vector_Grp.rpt" "L_thumb_vector_Grp_aimConstraint1.crt";
connectAttr "L_thumb_vector_Grp.ro" "L_thumb_vector_Grp_aimConstraint1.cro";
connectAttr "L_thumb2_loc.t" "L_thumb_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "L_thumb2_loc.rp" "L_thumb_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "L_thumb2_loc.rpt" "L_thumb_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "L_thumb2_loc.pm" "L_thumb_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "L_thumb_vector_Grp_aimConstraint1.w0" "L_thumb_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "L_thumb1_loc.wm" "L_thumb_vector_Grp_aimConstraint1.wum";
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
connectAttr "L_pinky_vector_Grp_aimConstraint1.crx" "L_pinky_vector_Grp.rx";
connectAttr "L_pinky_vector_Grp_aimConstraint1.cry" "L_pinky_vector_Grp.ry";
connectAttr "L_pinky_vector_Grp_aimConstraint1.crz" "L_pinky_vector_Grp.rz";
connectAttr "L_pinky_vector_Grp.pim" "L_pinky_vector_Grp_aimConstraint1.cpim";
connectAttr "L_pinky_vector_Grp.t" "L_pinky_vector_Grp_aimConstraint1.ct";
connectAttr "L_pinky_vector_Grp.rp" "L_pinky_vector_Grp_aimConstraint1.crp";
connectAttr "L_pinky_vector_Grp.rpt" "L_pinky_vector_Grp_aimConstraint1.crt";
connectAttr "L_pinky_vector_Grp.ro" "L_pinky_vector_Grp_aimConstraint1.cro";
connectAttr "L_pinky2_loc.t" "L_pinky_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "L_pinky2_loc.rp" "L_pinky_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "L_pinky2_loc.rpt" "L_pinky_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "L_pinky2_loc.pm" "L_pinky_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "L_pinky_vector_Grp_aimConstraint1.w0" "L_pinky_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "L_pinky1_loc.wm" "L_pinky_vector_Grp_aimConstraint1.wum";
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
connectAttr "L_ring_vector_Grp_aimConstraint1.crx" "L_ring_vector_Grp.rx";
connectAttr "L_ring_vector_Grp_aimConstraint1.cry" "L_ring_vector_Grp.ry";
connectAttr "L_ring_vector_Grp_aimConstraint1.crz" "L_ring_vector_Grp.rz";
connectAttr "L_ring_vector_Grp.pim" "L_ring_vector_Grp_aimConstraint1.cpim";
connectAttr "L_ring_vector_Grp.t" "L_ring_vector_Grp_aimConstraint1.ct";
connectAttr "L_ring_vector_Grp.rp" "L_ring_vector_Grp_aimConstraint1.crp";
connectAttr "L_ring_vector_Grp.rpt" "L_ring_vector_Grp_aimConstraint1.crt";
connectAttr "L_ring_vector_Grp.ro" "L_ring_vector_Grp_aimConstraint1.cro";
connectAttr "L_ring2_loc.t" "L_ring_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "L_ring2_loc.rp" "L_ring_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "L_ring2_loc.rpt" "L_ring_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "L_ring2_loc.pm" "L_ring_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "L_ring_vector_Grp_aimConstraint1.w0" "L_ring_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "L_ring1_loc.wm" "L_ring_vector_Grp_aimConstraint1.wum";
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
connectAttr "L_index_vector_Grp_aimConstraint1.crx" "L_index_vector_Grp.rx";
connectAttr "L_index_vector_Grp_aimConstraint1.cry" "L_index_vector_Grp.ry";
connectAttr "L_index_vector_Grp_aimConstraint1.crz" "L_index_vector_Grp.rz";
connectAttr "L_index_vector_Grp.pim" "L_index_vector_Grp_aimConstraint1.cpim";
connectAttr "L_index_vector_Grp.t" "L_index_vector_Grp_aimConstraint1.ct";
connectAttr "L_index_vector_Grp.rp" "L_index_vector_Grp_aimConstraint1.crp";
connectAttr "L_index_vector_Grp.rpt" "L_index_vector_Grp_aimConstraint1.crt";
connectAttr "L_index_vector_Grp.ro" "L_index_vector_Grp_aimConstraint1.cro";
connectAttr "L_index2_loc.t" "L_index_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "L_index2_loc.rp" "L_index_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "L_index2_loc.rpt" "L_index_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "L_index2_loc.pm" "L_index_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "L_index_vector_Grp_aimConstraint1.w0" "L_index_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "L_index1_loc.wm" "L_index_vector_Grp_aimConstraint1.wum";
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
connectAttr "L_middle_vector_Grp_aimConstraint1.crx" "L_middle_vector_Grp.rx";
connectAttr "L_middle_vector_Grp_aimConstraint1.cry" "L_middle_vector_Grp.ry";
connectAttr "L_middle_vector_Grp_aimConstraint1.crz" "L_middle_vector_Grp.rz";
connectAttr "L_middle_vector_Grp.pim" "L_middle_vector_Grp_aimConstraint1.cpim";
connectAttr "L_middle_vector_Grp.t" "L_middle_vector_Grp_aimConstraint1.ct";
connectAttr "L_middle_vector_Grp.rp" "L_middle_vector_Grp_aimConstraint1.crp";
connectAttr "L_middle_vector_Grp.rpt" "L_middle_vector_Grp_aimConstraint1.crt";
connectAttr "L_middle_vector_Grp.ro" "L_middle_vector_Grp_aimConstraint1.cro";
connectAttr "L_middle2_loc.t" "L_middle_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "L_middle2_loc.rp" "L_middle_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "L_middle2_loc.rpt" "L_middle_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "L_middle2_loc.pm" "L_middle_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "L_middle_vector_Grp_aimConstraint1.w0" "L_middle_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "L_middle1_loc.wm" "L_middle_vector_Grp_aimConstraint1.wum";
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
connectAttr "R_thumb_vector_Grp_aimConstraint1.crx" "R_thumb_vector_Grp.rx";
connectAttr "R_thumb_vector_Grp_aimConstraint1.cry" "R_thumb_vector_Grp.ry";
connectAttr "R_thumb_vector_Grp_aimConstraint1.crz" "R_thumb_vector_Grp.rz";
connectAttr "R_thumb_vector_Grp.pim" "R_thumb_vector_Grp_aimConstraint1.cpim";
connectAttr "R_thumb_vector_Grp.t" "R_thumb_vector_Grp_aimConstraint1.ct";
connectAttr "R_thumb_vector_Grp.rp" "R_thumb_vector_Grp_aimConstraint1.crp";
connectAttr "R_thumb_vector_Grp.rpt" "R_thumb_vector_Grp_aimConstraint1.crt";
connectAttr "R_thumb_vector_Grp.ro" "R_thumb_vector_Grp_aimConstraint1.cro";
connectAttr "R_thumb2_loc.t" "R_thumb_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "R_thumb2_loc.rp" "R_thumb_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "R_thumb2_loc.rpt" "R_thumb_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "R_thumb2_loc.pm" "R_thumb_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "R_thumb_vector_Grp_aimConstraint1.w0" "R_thumb_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "R_thumb1_loc.wm" "R_thumb_vector_Grp_aimConstraint1.wum";
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
connectAttr "R_pinky_vector_Grp_aimConstraint1.crx" "R_pinky_vector_Grp.rx";
connectAttr "R_pinky_vector_Grp_aimConstraint1.cry" "R_pinky_vector_Grp.ry";
connectAttr "R_pinky_vector_Grp_aimConstraint1.crz" "R_pinky_vector_Grp.rz";
connectAttr "R_pinky_vector_Grp.pim" "R_pinky_vector_Grp_aimConstraint1.cpim";
connectAttr "R_pinky_vector_Grp.t" "R_pinky_vector_Grp_aimConstraint1.ct";
connectAttr "R_pinky_vector_Grp.rp" "R_pinky_vector_Grp_aimConstraint1.crp";
connectAttr "R_pinky_vector_Grp.rpt" "R_pinky_vector_Grp_aimConstraint1.crt";
connectAttr "R_pinky_vector_Grp.ro" "R_pinky_vector_Grp_aimConstraint1.cro";
connectAttr "R_pinky2_loc.t" "R_pinky_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "R_pinky2_loc.rp" "R_pinky_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "R_pinky2_loc.rpt" "R_pinky_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "R_pinky2_loc.pm" "R_pinky_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "R_pinky_vector_Grp_aimConstraint1.w0" "R_pinky_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "R_pinky1_loc.wm" "R_pinky_vector_Grp_aimConstraint1.wum";
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
connectAttr "R_ring_vector_Grp_aimConstraint1.crx" "R_ring_vector_Grp.rx";
connectAttr "R_ring_vector_Grp_aimConstraint1.cry" "R_ring_vector_Grp.ry";
connectAttr "R_ring_vector_Grp_aimConstraint1.crz" "R_ring_vector_Grp.rz";
connectAttr "R_ring_vector_Grp.pim" "R_ring_vector_Grp_aimConstraint1.cpim";
connectAttr "R_ring_vector_Grp.t" "R_ring_vector_Grp_aimConstraint1.ct";
connectAttr "R_ring_vector_Grp.rp" "R_ring_vector_Grp_aimConstraint1.crp";
connectAttr "R_ring_vector_Grp.rpt" "R_ring_vector_Grp_aimConstraint1.crt";
connectAttr "R_ring_vector_Grp.ro" "R_ring_vector_Grp_aimConstraint1.cro";
connectAttr "R_ring2_loc.t" "R_ring_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "R_ring2_loc.rp" "R_ring_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "R_ring2_loc.rpt" "R_ring_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "R_ring2_loc.pm" "R_ring_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "R_ring_vector_Grp_aimConstraint1.w0" "R_ring_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "R_ring1_loc.wm" "R_ring_vector_Grp_aimConstraint1.wum";
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
connectAttr "R_index_vector_Grp_aimConstraint1.crx" "R_index_vector_Grp.rx";
connectAttr "R_index_vector_Grp_aimConstraint1.cry" "R_index_vector_Grp.ry";
connectAttr "R_index_vector_Grp_aimConstraint1.crz" "R_index_vector_Grp.rz";
connectAttr "R_index_vector_Grp.pim" "R_index_vector_Grp_aimConstraint1.cpim";
connectAttr "R_index_vector_Grp.t" "R_index_vector_Grp_aimConstraint1.ct";
connectAttr "R_index_vector_Grp.rp" "R_index_vector_Grp_aimConstraint1.crp";
connectAttr "R_index_vector_Grp.rpt" "R_index_vector_Grp_aimConstraint1.crt";
connectAttr "R_index_vector_Grp.ro" "R_index_vector_Grp_aimConstraint1.cro";
connectAttr "R_index2_loc.t" "R_index_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "R_index2_loc.rp" "R_index_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "R_index2_loc.rpt" "R_index_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "R_index2_loc.pm" "R_index_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "R_index_vector_Grp_aimConstraint1.w0" "R_index_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "R_index1_loc.wm" "R_index_vector_Grp_aimConstraint1.wum";
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
connectAttr "R_middle_vector_Grp_aimConstraint1.crx" "R_middle_vector_Grp.rx";
connectAttr "R_middle_vector_Grp_aimConstraint1.cry" "R_middle_vector_Grp.ry";
connectAttr "R_middle_vector_Grp_aimConstraint1.crz" "R_middle_vector_Grp.rz";
connectAttr "R_middle_vector_Grp.pim" "R_middle_vector_Grp_aimConstraint1.cpim";
connectAttr "R_middle_vector_Grp.t" "R_middle_vector_Grp_aimConstraint1.ct";
connectAttr "R_middle_vector_Grp.rp" "R_middle_vector_Grp_aimConstraint1.crp";
connectAttr "R_middle_vector_Grp.rpt" "R_middle_vector_Grp_aimConstraint1.crt";
connectAttr "R_middle_vector_Grp.ro" "R_middle_vector_Grp_aimConstraint1.cro";
connectAttr "R_middle2_loc.t" "R_middle_vector_Grp_aimConstraint1.tg[0].tt";
connectAttr "R_middle2_loc.rp" "R_middle_vector_Grp_aimConstraint1.tg[0].trp";
connectAttr "R_middle2_loc.rpt" "R_middle_vector_Grp_aimConstraint1.tg[0].trt";
connectAttr "R_middle2_loc.pm" "R_middle_vector_Grp_aimConstraint1.tg[0].tpm";
connectAttr "R_middle_vector_Grp_aimConstraint1.w0" "R_middle_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "R_middle1_loc.wm" "R_middle_vector_Grp_aimConstraint1.wum";
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
connectAttr "C_jaw_locShape.wp" "C_jaw_CrvShape.cp[0]";
connectAttr "C_jawEnd_locShape.wp" "C_jaw_CrvShape.cp[1]";
connectAttr "C_jaw_locShape.wp" "C_gumA_CrvShape.cp[0]";
connectAttr "C_gumA_locShape.wp" "C_gumA_CrvShape.cp[1]";
connectAttr "C_jaw_locShape.wp" "C_gumB_CrvShape.cp[0]";
connectAttr "C_gumB_locShape.wp" "C_gumB_CrvShape.cp[1]";
connectAttr "C_tongue1_locShape.wp" "C_tongue_CrvShape.cp[0]";
connectAttr "C_tongueExtra1_locShape.wp" "C_tongue_CrvShape.cp[1]";
connectAttr "C_tongue2_locShape.wp" "C_tongue_CrvShape.cp[2]";
connectAttr "C_tongueExtra2_locShape.wp" "C_tongue_CrvShape.cp[3]";
connectAttr "C_tongue3_locShape.wp" "C_tongue_CrvShape.cp[4]";
connectAttr "C_tongue1_locShape.wp" "C_tonguePivot_CrvShape.cp[0]";
connectAttr "C_tonguePivot_locShape.wp" "C_tonguePivot_CrvShape.cp[1]";
connectAttr "L_eye_locShape.wp" "L_eye_CrvShape.cp[0]";
connectAttr "L_eyeEnd_locShape.wp" "L_eye_CrvShape.cp[1]";
connectAttr "L_eye_locShape.wp" "L_eyeAim_CrvShape.cp[0]";
connectAttr "L_eye_vectorShape.wp" "L_eyeAim_CrvShape.cp[1]";
connectAttr "R_eye_locShape.wp" "R_eye_CrvShape.cp[0]";
connectAttr "R_eyeEnd_locShape.wp" "R_eye_CrvShape.cp[1]";
connectAttr "R_eye_locShape.wp" "R_eyeAim_CrvShape.cp[0]";
connectAttr "R_eye_vectorShape.wp" "R_eyeAim_CrvShape.cp[1]";
connectAttr "C_head_mirror_parentConstraint1.ctx" "C_head_mirror.tx";
connectAttr "C_head_mirror_parentConstraint1.cty" "C_head_mirror.ty";
connectAttr "C_head_mirror_parentConstraint1.ctz" "C_head_mirror.tz";
connectAttr "C_head_mirror_parentConstraint1.crx" "C_head_mirror.rx";
connectAttr "C_head_mirror_parentConstraint1.cry" "C_head_mirror.ry";
connectAttr "C_head_mirror_parentConstraint1.crz" "C_head_mirror.rz";
connectAttr "C_tongueExtra1_loc_Grp_pointConstraint1.ctx" "C_tongueExtra1_loc_Grp.tx"
		;
connectAttr "C_tongueExtra1_loc_Grp_pointConstraint1.cty" "C_tongueExtra1_loc_Grp.ty"
		;
connectAttr "C_tongueExtra1_loc_Grp_pointConstraint1.ctz" "C_tongueExtra1_loc_Grp.tz"
		;
connectAttr "C_tongueExtra1_loc_Grp.pim" "C_tongueExtra1_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "C_tongueExtra1_loc_Grp.rp" "C_tongueExtra1_loc_Grp_pointConstraint1.crp"
		;
connectAttr "C_tongueExtra1_loc_Grp.rpt" "C_tongueExtra1_loc_Grp_pointConstraint1.crt"
		;
connectAttr "C_tongue1_loc.t" "C_tongueExtra1_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "C_tongue1_loc.rp" "C_tongueExtra1_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "C_tongue1_loc.rpt" "C_tongueExtra1_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "C_tongue1_loc.pm" "C_tongueExtra1_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "C_tongueExtra1_loc_Grp_pointConstraint1.w0" "C_tongueExtra1_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_tongue2_loc.t" "C_tongueExtra1_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "C_tongue2_loc.rp" "C_tongueExtra1_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "C_tongue2_loc.rpt" "C_tongueExtra1_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "C_tongue2_loc.pm" "C_tongueExtra1_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "C_tongueExtra1_loc_Grp_pointConstraint1.w1" "C_tongueExtra1_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "C_tongue2_loc_Grp_pointConstraint1.ctx" "C_tongue2_loc_Grp.tx";
connectAttr "C_tongue2_loc_Grp_pointConstraint1.cty" "C_tongue2_loc_Grp.ty";
connectAttr "C_tongue2_loc_Grp_pointConstraint1.ctz" "C_tongue2_loc_Grp.tz";
connectAttr "C_tongue2_loc_Grp.pim" "C_tongue2_loc_Grp_pointConstraint1.cpim";
connectAttr "C_tongue2_loc_Grp.rp" "C_tongue2_loc_Grp_pointConstraint1.crp";
connectAttr "C_tongue2_loc_Grp.rpt" "C_tongue2_loc_Grp_pointConstraint1.crt";
connectAttr "C_tongue1_loc.t" "C_tongue2_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "C_tongue1_loc.rp" "C_tongue2_loc_Grp_pointConstraint1.tg[0].trp";
connectAttr "C_tongue1_loc.rpt" "C_tongue2_loc_Grp_pointConstraint1.tg[0].trt";
connectAttr "C_tongue1_loc.pm" "C_tongue2_loc_Grp_pointConstraint1.tg[0].tpm";
connectAttr "C_tongue2_loc_Grp_pointConstraint1.w0" "C_tongue2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_tongue3_loc.t" "C_tongue2_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "C_tongue3_loc.rp" "C_tongue2_loc_Grp_pointConstraint1.tg[1].trp";
connectAttr "C_tongue3_loc.rpt" "C_tongue2_loc_Grp_pointConstraint1.tg[1].trt";
connectAttr "C_tongue3_loc.pm" "C_tongue2_loc_Grp_pointConstraint1.tg[1].tpm";
connectAttr "C_tongue2_loc_Grp_pointConstraint1.w1" "C_tongue2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "C_tongueExtra2_loc_Grp_pointConstraint1.ctx" "C_tongueExtra2_loc_Grp.tx"
		;
connectAttr "C_tongueExtra2_loc_Grp_pointConstraint1.cty" "C_tongueExtra2_loc_Grp.ty"
		;
connectAttr "C_tongueExtra2_loc_Grp_pointConstraint1.ctz" "C_tongueExtra2_loc_Grp.tz"
		;
connectAttr "C_tongueExtra2_loc_Grp.pim" "C_tongueExtra2_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "C_tongueExtra2_loc_Grp.rp" "C_tongueExtra2_loc_Grp_pointConstraint1.crp"
		;
connectAttr "C_tongueExtra2_loc_Grp.rpt" "C_tongueExtra2_loc_Grp_pointConstraint1.crt"
		;
connectAttr "C_tongue2_loc.t" "C_tongueExtra2_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "C_tongue2_loc.rp" "C_tongueExtra2_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "C_tongue2_loc.rpt" "C_tongueExtra2_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "C_tongue2_loc.pm" "C_tongueExtra2_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "C_tongueExtra2_loc_Grp_pointConstraint1.w0" "C_tongueExtra2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_tongue3_loc.t" "C_tongueExtra2_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "C_tongue3_loc.rp" "C_tongueExtra2_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "C_tongue3_loc.rpt" "C_tongueExtra2_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "C_tongue3_loc.pm" "C_tongueExtra2_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "C_tongueExtra2_loc_Grp_pointConstraint1.w1" "C_tongueExtra2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "L_eye_vector_Grp_parentConstraint1.ctx" "L_eye_vector_Grp.tx";
connectAttr "L_eye_vector_Grp_parentConstraint1.cty" "L_eye_vector_Grp.ty";
connectAttr "L_eye_vector_Grp_parentConstraint1.ctz" "L_eye_vector_Grp.tz";
connectAttr "L_eye_vector_Grp_parentConstraint1.crx" "L_eye_vector_Grp.rx";
connectAttr "L_eye_vector_Grp_parentConstraint1.cry" "L_eye_vector_Grp.ry";
connectAttr "L_eye_vector_Grp_parentConstraint1.crz" "L_eye_vector_Grp.rz";
connectAttr "L_eye_vector_Grp.ro" "L_eye_vector_Grp_parentConstraint1.cro";
connectAttr "L_eye_vector_Grp.pim" "L_eye_vector_Grp_parentConstraint1.cpim";
connectAttr "L_eye_vector_Grp.rp" "L_eye_vector_Grp_parentConstraint1.crp";
connectAttr "L_eye_vector_Grp.rpt" "L_eye_vector_Grp_parentConstraint1.crt";
connectAttr "C_eye_loc.t" "L_eye_vector_Grp_parentConstraint1.tg[0].tt";
connectAttr "C_eye_loc.rp" "L_eye_vector_Grp_parentConstraint1.tg[0].trp";
connectAttr "C_eye_loc.rpt" "L_eye_vector_Grp_parentConstraint1.tg[0].trt";
connectAttr "C_eye_loc.r" "L_eye_vector_Grp_parentConstraint1.tg[0].tr";
connectAttr "C_eye_loc.ro" "L_eye_vector_Grp_parentConstraint1.tg[0].tro";
connectAttr "C_eye_loc.s" "L_eye_vector_Grp_parentConstraint1.tg[0].ts";
connectAttr "C_eye_loc.pm" "L_eye_vector_Grp_parentConstraint1.tg[0].tpm";
connectAttr "L_eye_vector_Grp_parentConstraint1.w0" "L_eye_vector_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "R_eye_vector_Grp_parentConstraint1.ctx" "R_eye_vector_Grp.tx";
connectAttr "R_eye_vector_Grp_parentConstraint1.cty" "R_eye_vector_Grp.ty";
connectAttr "R_eye_vector_Grp_parentConstraint1.ctz" "R_eye_vector_Grp.tz";
connectAttr "R_eye_vector_Grp_parentConstraint1.crx" "R_eye_vector_Grp.rx";
connectAttr "R_eye_vector_Grp_parentConstraint1.cry" "R_eye_vector_Grp.ry";
connectAttr "R_eye_vector_Grp_parentConstraint1.crz" "R_eye_vector_Grp.rz";
connectAttr "R_eye_vector_Grp.ro" "R_eye_vector_Grp_parentConstraint1.cro";
connectAttr "R_eye_vector_Grp.pim" "R_eye_vector_Grp_parentConstraint1.cpim";
connectAttr "R_eye_vector_Grp.rp" "R_eye_vector_Grp_parentConstraint1.crp";
connectAttr "R_eye_vector_Grp.rpt" "R_eye_vector_Grp_parentConstraint1.crt";
connectAttr "C_eye_loc.t" "R_eye_vector_Grp_parentConstraint1.tg[0].tt";
connectAttr "C_eye_loc.rp" "R_eye_vector_Grp_parentConstraint1.tg[0].trp";
connectAttr "C_eye_loc.rpt" "R_eye_vector_Grp_parentConstraint1.tg[0].trt";
connectAttr "C_eye_loc.r" "R_eye_vector_Grp_parentConstraint1.tg[0].tr";
connectAttr "C_eye_loc.ro" "R_eye_vector_Grp_parentConstraint1.tg[0].tro";
connectAttr "C_eye_loc.s" "R_eye_vector_Grp_parentConstraint1.tg[0].ts";
connectAttr "C_eye_loc.pm" "R_eye_vector_Grp_parentConstraint1.tg[0].tpm";
connectAttr "R_eye_vector_Grp_parentConstraint1.w0" "R_eye_vector_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "C_head_mirror.ro" "C_head_mirror_parentConstraint1.cro";
connectAttr "C_head_mirror.pim" "C_head_mirror_parentConstraint1.cpim";
connectAttr "C_head_mirror.rp" "C_head_mirror_parentConstraint1.crp";
connectAttr "C_head_mirror.rpt" "C_head_mirror_parentConstraint1.crt";
connectAttr "C_neckRoot_loc.t" "C_head_mirror_parentConstraint1.tg[0].tt";
connectAttr "C_neckRoot_loc.rp" "C_head_mirror_parentConstraint1.tg[0].trp";
connectAttr "C_neckRoot_loc.rpt" "C_head_mirror_parentConstraint1.tg[0].trt";
connectAttr "C_neckRoot_loc.r" "C_head_mirror_parentConstraint1.tg[0].tr";
connectAttr "C_neckRoot_loc.ro" "C_head_mirror_parentConstraint1.tg[0].tro";
connectAttr "C_neckRoot_loc.s" "C_head_mirror_parentConstraint1.tg[0].ts";
connectAttr "C_neckRoot_loc.pm" "C_head_mirror_parentConstraint1.tg[0].tpm";
connectAttr "C_head_mirror_parentConstraint1.w0" "C_head_mirror_parentConstraint1.tg[0].tw"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "renderLayerManager12.rlmi[0]" "defaultRenderLayer12.rlid";
connectAttr "renderLayerManager13.rlmi[0]" "defaultRenderLayer13.rlid";
connectAttr "renderLayerManager14.rlmi[0]" "defaultRenderLayer14.rlid";
connectAttr "renderLayerManager9.rlmi[0]" "defaultRenderLayer9.rlid";
connectAttr "renderLayerManager10.rlmi[0]" "defaultRenderLayer10.rlid";
connectAttr "renderLayerManager11.rlmi[0]" "defaultRenderLayer11.rlid";
connectAttr "renderLayerManager1.rlmi[0]" "defaultRenderLayer1.rlid";
connectAttr "renderLayerManager2.rlmi[0]" "defaultRenderLayer2.rlid";
connectAttr "renderLayerManager3.rlmi[0]" "defaultRenderLayer3.rlid";
connectAttr "renderLayerManager4.rlmi[0]" "defaultRenderLayer4.rlid";
connectAttr "renderLayerManager5.rlmi[0]" "defaultRenderLayer5.rlid";
connectAttr "renderLayerManager6.rlmi[0]" "defaultRenderLayer6.rlid";
connectAttr "renderLayerManager7.rlmi[0]" "defaultRenderLayer7.rlid";
connectAttr "renderLayerManager8.rlmi[0]" "defaultRenderLayer8.rlid";
connectAttr "renderLayerManager15.rlmi[0]" "defaultRenderLayer15.rlid";
connectAttr "renderLayerManager16.rlmi[0]" "defaultRenderLayer16.rlid";
connectAttr "renderLayerManager17.rlmi[0]" "defaultRenderLayer17.rlid";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer12.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer13.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer14.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer9.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer10.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer11.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer1.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer2.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer3.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer4.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer5.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer6.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer7.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer8.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer15.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer16.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer17.msg" ":defaultRenderingList1.r" -na;
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
// End of guide_biped.ma
