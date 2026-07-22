//Maya ASCII 2022 scene
//Name: guide_quad.ma
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
fileInfo "UUID" "4806C9EF-4D6A-FB63-54E6-C5A766F97A97";
createNode transform -s -n "persp";
	rename -uid "7208C928-4B6B-2EE8-FC48-03B119189728";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 24.478143222591974 38.222576214752429 -1.7648220488803315 ;
	setAttr ".r" -type "double3" -32.138352729592668 67.799999999994313 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "2DA44182-4E38-6F38-3A34-75AE71D2CA3B";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 15.740695329360038;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "FB04BB28-44DB-62A5-7AFA-23B1CCFE45D1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "28D67436-409D-031A-754D-5E8F5AEA3206";
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
	rename -uid "7DAFC369-4518-0B50-D1F9-CA84970CA6A0";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "874B4784-4239-CACE-AE37-7AA9DB2E20F4";
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
	rename -uid "A06BFCFB-46CA-AB7D-099E-1C90386431A4";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "11A7F8AD-4B9D-035B-F223-03851DC112E8";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "container";
	setAttr ".rig_data" -type "string" "group";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_index" -type "string" "0";
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
		0 23 11.5
		0 24 11.916250000000002
		0 26 12.75
		0 27.999999999999996 13.583750000000002
		0 29 14
		;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "neck_type";
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
createNode transform -n "C_root_Crv" -p "C_root_nonParent";
	rename -uid "65941274-4BD6-4E71-060B-15AA80D9AD82";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "C_root_CrvShape" -p "C_root_Crv";
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
		0 22 -10
		0 21.997560656372066 -7.7755600000000005
		0 22 -3.3200000000000003
		-0.07342204270015884 21.999999999999503 3.3200000000000003
		-0.024449540219152896 22.002441250976396 7.7755599999999987
		0 22 10
		;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "root";
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
	setAttr ".t" -type "double3" 0 22 -10 ;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "mirror";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_index" -type "string" "0";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	addAttr -ci true -sn "insertJnt" -ln "insertJnt" -dv 4 -min 0 -at "long";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "neck_type";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "neck_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "neckRoot";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "C_neckRootExtra_locShape" -p "C_neckRootExtra_loc";
	rename -uid "FFC6A147-47BE-0AFC-D6ED-B6A1D64F7969";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "neck_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "neckEnd";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "C_neckEndExtra_locShape" -p "C_neckEndExtra_loc";
	rename -uid "1B5A7FE6-40AF-BEBE-30B5-96B64AB8110B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
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
	setAttr ".t" -type "double3" 0 6 2.5 ;
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "neck_type";
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
	rename -uid "02A8B575-40C7-8359-5342-59BC85CC39A5";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "neck_type";
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
createNode parentConstraint -n "C_neckRoot_loc_Grp_parentConstraint1" -p "C_neckRoot_loc_Grp";
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
createNode transform -n "C_chest_loc_Grp" -p "C_root_loc";
	rename -uid "8DC482D6-4DE0-5B1C-8914-2EBB6C8B331B";
	setAttr ".t" -type "double3" 0 0 20 ;
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
createNode transform -n "C_root_vector" -p "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "root_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "root";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "C_root_vectorShape" -p "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp|C_root_vector";
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
createNode aimConstraint -n "C_root_vector_Grp_aimConstraint1" -p "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp";
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
createNode transform -n "C_tail_nonParent";
	rename -uid "E0E65279-493B-EBD3-E2DA-D78BAC4D5D1A";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "tail_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "container";
	setAttr ".rig_data" -type "string" "group";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "C_tail_Crv" -p "C_tail_nonParent";
	rename -uid "E23E3A0D-45F1-61B9-1F5C-EEABA24CD091";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "C_tail_CrvShape" -p "C_tail_Crv";
	rename -uid "AB92FC74-4E1B-1575-50F6-4CADAD0B0AAB";
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
		0 22 -13
		0 21.997560656372066 -14.112220000000002
		0 22 -16.340000000000003
		-0.07342204270015884 21.999999999999503 -19.660000000000004
		-0.024449540219152896 22.002441250976396 -21.887780000000003
		0 22 -23
		;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "tail_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "tail";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "C_tail_mirror";
	rename -uid "EDB6615C-455F-20D3-860D-67AD9BB7C8EA";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "tail_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "mirror";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "C_tailRoot_loc_Grp" -p "C_tail_mirror";
	rename -uid "DDE60655-41DB-1695-03BE-4798714006D4";
createNode transform -n "C_tailRoot_loc" -p "C_tailRoot_loc_Grp";
	rename -uid "8FF5AD53-4832-1831-AEBF-1983F7F8C00A";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "tail_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "tailRoot";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "C_tailRoot_locShape" -p "C_tailRoot_loc";
	rename -uid "6A24F04F-41DA-E015-6A6E-BB8C81F454C5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "C_tail1_loc_Grp" -p "C_tailRoot_loc";
	rename -uid "97639740-4599-4FD2-8706-6D891FB51E0F";
	setAttr ".t" -type "double3" 0 0 -2 ;
createNode transform -n "C_tail1_loc" -p "C_tail1_loc_Grp";
	rename -uid "DCA97355-4C3D-4CFA-B62C-5E8723A474B5";
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
	setAttr -k on ".insertJnt" 6;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "tail_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "tail1";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "C_tail1_locShape" -p "C_tail1_loc";
	rename -uid "8D132B53-4226-5591-45C8-74BF29F9BF4E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_tail3_loc_Grp" -p "C_tail1_loc";
	rename -uid "AD1A16CF-4B2E-C2BE-2D64-00A2F4260F89";
createNode transform -n "C_tail3_loc" -p "C_tail3_loc_Grp";
	rename -uid "EE145C8A-475C-9122-3F86-A78797CB19CC";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "tail_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "tail3";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "C_tail3_locShape" -p "C_tail3_loc";
	rename -uid "D60C17EB-4DC2-DF67-E6FD-44AD300A3D2C";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "C_splne2_loc_Grp_pointConstraint1" -p "C_tail3_loc_Grp";
	rename -uid "5D3CA693-45DF-6653-A758-AFB1C4F66449";
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
createNode transform -n "C_tail2_loc_Grp" -p "C_tail1_loc";
	rename -uid "B3AEE4A1-4A34-D4C4-573A-4290EED92B97";
createNode transform -n "C_tail2_loc" -p "C_tail2_loc_Grp";
	rename -uid "514E4606-47BD-9B78-565A-2B9AFDAC1184";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "tail_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "tail2";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "C_tail2_locShape" -p "C_tail2_loc";
	rename -uid "8D538090-485A-74E4-7B05-8D80A30163B4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "C_splne1_loc_Grp_pointConstraint1" -p "C_tail2_loc_Grp";
	rename -uid "6C6D7650-46DD-2C77-49B5-74863B7097A9";
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
createNode transform -n "C_tailEnd_loc_Grp" -p "C_tail1_loc";
	rename -uid "00A70D75-4F09-D64A-5513-C9B6832F57C7";
	setAttr ".t" -type "double3" 0 0 -10 ;
createNode transform -n "C_tailEnd_loc" -p "C_tailEnd_loc_Grp";
	rename -uid "F12852D6-4BB6-A43F-9253-5BACF3A84DD7";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "tail_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "tailEnd";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "C_tailEnd_locShape" -p "C_tailEnd_loc";
	rename -uid "F4A3B391-43E4-A51F-6FDD-E99C2D934630";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "C_tailEndExtra_loc_Grp" -p "C_tail1_loc";
	rename -uid "FEF6F901-40CC-B84D-876C-F5A096B84C25";
createNode transform -n "C_tailEndExtra_loc" -p "C_tailEndExtra_loc_Grp";
	rename -uid "58D23E70-42C2-A4F0-920B-FC970A93DE80";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "tail_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "tailEnd";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "C_tailEndExtra_locShape" -p "C_tailEndExtra_loc";
	rename -uid "2D2DA62A-4B63-AEE2-D0DA-8E997EA156D8";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode pointConstraint -n "C_chestExtra_loc_Grp_pointConstraint1" -p "C_tailEndExtra_loc_Grp";
	rename -uid "13D27C9C-404D-4178-CE27-06991275E703";
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
createNode transform -n "C_tailExtra1_loc_Grp" -p "C_tail1_loc";
	rename -uid "22CB253C-40F2-649B-7576-51B2FB5770E6";
createNode transform -n "C_tailExtra1_loc" -p "C_tailExtra1_loc_Grp";
	rename -uid "0F45E264-49F1-0CB1-7884-129696368E1D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "tail_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "tail";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "C_tailExtra1_locShape" -p "C_tailExtra1_loc";
	rename -uid "8D1ECC9C-48B3-3781-316E-8D8BED6D2194";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode pointConstraint -n "C_rootExtra_loc_Grp_pointConstraint1" -p "C_tailExtra1_loc_Grp";
	rename -uid "6408ECBB-44F8-6885-0CB9-1992EDEEADD7";
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
createNode transform -n "C_root_vector_Grp" -p "C_tail1_loc";
	rename -uid "C6B34D5E-49D9-5576-CB19-0C918E86321D";
createNode transform -n "C_root_vector" -p "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp";
	rename -uid "B1C6F9B9-4CA6-F4EC-CA8B-12942A4FA105";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "tail_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "root";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "C_root_vectorShape" -p "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp|C_root_vector";
	rename -uid "9C8CCC4C-44F5-50F0-B99A-D99D59A344D5";
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
createNode aimConstraint -n "C_root_vector_Grp_aimConstraint1" -p "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp";
	rename -uid "A544C785-4D2A-E270-7136-0FA27869DA93";
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
createNode parentConstraint -n "C_tail_mirror_parentConstraint1" -p "C_tail_mirror";
	rename -uid "F1C3A580-44F4-19A0-7280-A4912A118362";
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
	setAttr ".tg[0].tot" -type "double3" 0 0 -1 ;
	setAttr ".rst" -type "double3" 0 22 -11 ;
	setAttr -k on ".w0";
createNode transform -n "L_hip_nonParent";
	rename -uid "F721292A-42FF-9A8F-C6E2-6E9102182494";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "container";
	setAttr ".rig_data" -type "string" "group";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_hip_Crv" -p "L_hip_nonParent";
	rename -uid "9DFC13E9-4EE6-275F-8622-14908825D98A";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_hip_CrvShape" -p "L_hip_Crv";
	rename -uid "8F332B94-4DF2-97A1-6728-5FB1D282BB08";
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
		6 22 -10
		6 13 -7
		;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_knee_Crv" -p "L_hip_nonParent";
	rename -uid "198E6739-4542-56AB-7C70-8EB9C72A75CA";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_knee_CrvShape" -p "L_knee_Crv";
	rename -uid "86DCE80B-467D-B64E-5866-9BBB3693CAF5";
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
		6 13 -7
		6 8 -12
		;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_ankle_Crv" -p "L_hip_nonParent";
	rename -uid "3AA8C448-461C-04D6-9F54-C59FE79D9C78";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_ankle_CrvShape" -p "L_ankle_Crv";
	rename -uid "80D4A981-4555-51C3-0235-A68FACE36C1C";
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
		6 8 -12
		5.9999999999999982 2.5 -9.5000000000000036
		;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_toeRoot_Crv" -p "L_hip_nonParent";
	rename -uid "BBA44DEC-4A3A-56E3-A8A2-D79D3C905EF4";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_toeRoot_CrvShape" -p "L_toeRoot_Crv";
	rename -uid "B161EECC-428F-93F8-A838-EF814DE387CE";
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
		5.9999999999999982 2.5 -9.5000000000000036
		6 1 -9
		;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "toeRoot";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_toe1_Crv" -p "L_hip_nonParent";
	rename -uid "621E7A78-4677-18E0-A112-B087CD663BA2";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_toe1_CrvShape" -p "L_toe1_Crv";
	rename -uid "2B7CEA13-4A45-C694-ECCF-AF85CD9401EC";
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
		6 1 -9
		6 1 -8
		;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "toe1";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_hip_loc_mirror";
	rename -uid "42E5F459-420F-2330-369A-0C9C28433EE0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "mirror";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_hip_loc_Grp" -p "L_hip_loc_mirror";
	rename -uid "DDDCE480-48E5-3668-2999-7DBC64B98941";
createNode transform -n "L_hip_loc" -p "L_hip_loc_Grp";
	rename -uid "B37D72AC-45D0-4133-00FD-A4B2DA2CD0F8";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_hip_locShape" -p "L_hip_loc";
	rename -uid "59FDD858-4F20-0383-5F11-FABADBF7E7D6";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_knee_loc_Grp" -p "L_hip_loc";
	rename -uid "C44F2F85-4C65-BEBD-B6A0-EF93F1FDFEEF";
	setAttr ".t" -type "double3" 0 -9 3.0000000000000004 ;
createNode transform -n "L_knee_loc" -p "L_knee_loc_Grp";
	rename -uid "069DDE44-4F59-DB83-F663-8E93B0DA7E4C";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_knee_locShape" -p "L_knee_loc";
	rename -uid "D95A2B05-41CC-F5FD-0E97-A5904EA703A8";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_hipExtra_loc_Grp" -p "L_knee_loc";
	rename -uid "317D4B8C-40E7-77FB-A62F-2C9BB9BFB23C";
	setAttr ".r" -type "double3" 3.1805546814635168e-15 0 0 ;
createNode transform -n "L_hipExtra_loc" -p "L_hipExtra_loc_Grp";
	rename -uid "741A4160-4681-B9C0-A65E-0384DEE42442";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_hipExtra_locShape" -p "L_hipExtra_loc";
	rename -uid "09B893E8-4EFC-1D30-D500-2EB1A40E8808";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_hipExtra_loc_Grp_parentConstraint1" -p "L_hipExtra_loc_Grp";
	rename -uid "D1091C39-4869-1555-BC25-DA9BC020C426";
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
	rename -uid "43D47311-4D94-21AC-F51D-C99F7D37FB38";
	setAttr ".t" -type "double3" 0 0 1 ;
createNode transform -n "L_kneeExtra_loc" -p "L_kneeExtra_loc_Grp";
	rename -uid "5B1FF1C2-4061-3F94-3B7B-25A96A8873BB";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_kneeExtra_locShape" -p "L_kneeExtra_loc";
	rename -uid "5CA066B8-4726-F1AD-78B2-B1ABD1EFFC08";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_knee_ankleExtra1_loc_Grp" -p "L_knee_loc";
	rename -uid "E2C4A7DF-49A8-9B0B-0066-B48A3AC07B1B";
createNode transform -n "L_knee_ankleExtra1_loc" -p "L_knee_ankleExtra1_loc_Grp";
	rename -uid "B0CE03B0-4D0F-FAD9-7DCD-1396C1279655";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "knee_ankle";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_knee_ankleExtra1_locShape" -p "L_knee_ankleExtra1_loc";
	rename -uid "2FDE3B14-4315-C428-59F2-A88EEE29F6CC";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_knee_ankleExtra1_loc_Grp_parentConstraint1" -p "L_knee_ankleExtra1_loc_Grp";
	rename -uid "8247BD36-4647-104B-FCBE-3D8AF2EC6FF5";
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
	rename -uid "43B8E611-42CA-B08C-3A71-B7B491E562CF";
	setAttr ".t" -type "double3" 0 0 -4.4408920985006262e-16 ;
createNode aimConstraint -n "L_L_aim_support1_aimConstraint1" -p "L_L_aim_support1";
	rename -uid "77B88626-4A85-14BF-9621-CAA0B8DCC6FE";
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
	rename -uid "C2078B6D-460D-9678-29F6-BBB0B80878DB";
	setAttr ".t" -type "double3" 0 0 -4.4408920985006262e-16 ;
createNode aimConstraint -n "L_L_aim_support2_aimConstraint1" -p "L_L_aim_support2";
	rename -uid "AECEDB72-49C9-A6D6-FD8B-CBBEF5FCA58B";
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
	rename -uid "29BC439D-46BA-47C7-957E-12B3A3B95401";
	setAttr ".t" -type "double3" 0 -14 -2 ;
createNode transform -n "L_ankle_loc" -p "L_ankle_loc_Grp";
	rename -uid "70E8F839-4D56-4123-8672-398B550FF291";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_ankle_locShape" -p "L_ankle_loc";
	rename -uid "C69E2FC9-4AEE-C1FD-17AF-86A44206155E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_knee_ankleExtra2_loc_Grp" -p "L_ankle_loc";
	rename -uid "A32F9E8D-4E86-A47A-8AA4-789854C90EBB";
createNode transform -n "L_knee_ankleExtra2_loc" -p "L_knee_ankleExtra2_loc_Grp";
	rename -uid "E3C29A6D-4277-CAB0-BEEF-8E87338001B1";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "knee_ankle";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_knee_ankleExtra2_locShape" -p "L_knee_ankleExtra2_loc";
	rename -uid "9353D78A-4523-17D6-ED73-B5AB87971E20";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_knee_ankleExtra2_loc_Grp_parentConstraint1" -p "L_knee_ankleExtra2_loc_Grp";
	rename -uid "DED85E63-41FD-2613-DA7A-37A5BAE48E50";
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
	rename -uid "4252CD15-4A6E-C4E0-54CE-C99746877761";
	setAttr ".t" -type "double3" 0 0 -1 ;
createNode transform -n "L_ankleExtra_loc" -p "L_ankleExtra_loc_Grp";
	rename -uid "90B5794B-4768-B8DD-9068-B2B4BEBA90BB";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_ankleExtra_locShape" -p "L_ankleExtra_loc";
	rename -uid "22E04330-408F-6AD6-0F1D-3F8363C0E1DF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_toeExtra_loc_Grp" -p "L_ankle_loc";
	rename -uid "62EAF5D0-405E-0016-C1EA-94ADC2E31ACF";
	setAttr ".r" -type "double3" -3.1805546814635168e-15 0 0 ;
createNode transform -n "L_toeExtra_loc" -p "L_toeExtra_loc_Grp";
	rename -uid "9FF6F4BA-48AA-8E41-51E7-229BE1A37402";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_toeExtra_locShape" -p "L_toeExtra_loc";
	rename -uid "BE3FCA4C-4334-F492-5197-2291C87567B3";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_toeExtra_loc_Grp_parentConstraint1" -p "L_toeExtra_loc_Grp";
	rename -uid "B570AAE9-4489-A012-902C-248E15116283";
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
	rename -uid "BF076E05-4757-D192-9AC1-75ABB0E6ACDD";
createNode aimConstraint -n "L_L_aim_support3_aimConstraint1" -p "L_L_aim_support3";
	rename -uid "717C5A2B-4023-0563-B529-93B8C5F37D28";
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
	rename -uid "17A3D522-4A7E-F0AD-7419-FA933EF63093";
createNode aimConstraint -n "L_L_aim_support4_aimConstraint1" -p "L_L_aim_support4";
	rename -uid "8590D707-458D-D091-D296-AFAD5A37572F";
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
	rename -uid "4AE5D26A-4CFC-83C2-3D5C-6ABAB4311124";
	setAttr ".t" -type "double3" -1.7763568394002505e-15 -19.5 0.49999999999999645 ;
createNode transform -n "L_toeRoot_loc" -p "L_toeRoot_loc_Grp";
	rename -uid "44D7A192-4045-1FEE-B023-FBBAC7205C08";
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
	setAttr -k on ".insertJnt" 1;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "toeRoot";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_toeRoot_locShape" -p "L_toeRoot_loc";
	rename -uid "2F9CAAA3-466D-CA35-D272-ABBB35893E3A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_toe1_loc_Grp" -p "L_toeRoot_loc";
	rename -uid "C516A1B3-4F49-1332-0A29-44A909F74E44";
	setAttr ".t" -type "double3" 1.7763568394002505e-15 -1.5 0.50000000000000355 ;
createNode transform -n "L_toe1_loc" -p "L_toe1_loc_Grp";
	rename -uid "A863ABB6-44CB-4F37-A2D3-A29B578EF92B";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_toe1_locShape" -p "L_toe1_loc";
	rename -uid "44A3C471-4ABB-439D-1ED9-28A735957E32";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_heelPivot_loc_Grp" -p "L_toe1_loc";
	rename -uid "C3AE3CEE-4444-F840-2457-B993D063E01C";
	setAttr ".t" -type "double3" 0 -1 0 ;
createNode transform -n "L_heelPivot_loc" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_heelPivot_loc_Grp";
	rename -uid "D6BD302A-45E5-06EB-FA6F-2A95F0E9B538";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "heel";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_heelPivot_locShape" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_heelPivot_loc_Grp|L_heelPivot_loc";
	rename -uid "4FD8DA4A-4B45-76D3-E5D2-52A738D9DC61";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_toeEndPivot_loc_Grp" -p "L_toe1_loc";
	rename -uid "0403E2F0-4F69-756D-1C5E-62A0282761AC";
	setAttr ".t" -type "double3" 0 -1 1.5 ;
createNode transform -n "L_toeEndPivot_loc" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_toeEndPivot_loc_Grp";
	rename -uid "E09F0D9F-48C6-D5EF-754B-A78B38BFE501";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_toeEndPivot_locShape" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_toeEndPivot_loc_Grp|L_toeEndPivot_loc";
	rename -uid "23104371-42BA-19E0-A5C7-E69F32CEF6EB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_bankLeftPivot_loc_Grp" -p "L_toe1_loc";
	rename -uid "0B2C7F88-4493-9D99-932D-98AD6F31A680";
	setAttr ".t" -type "double3" 1 -1 0.75 ;
createNode transform -n "L_bankLeftPivot_loc" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_bankLeftPivot_loc_Grp";
	rename -uid "E6DFB17C-4F2D-6308-EBB7-E59B486D3FEF";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "bankLeft";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_bankLeftPivot_locShape" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_bankLeftPivot_loc_Grp|L_bankLeftPivot_loc";
	rename -uid "F1F309B0-42DA-51CF-A270-5FB59C40941F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_toePivot_loc_Grp" -p "L_toe1_loc";
	rename -uid "3DA064A8-4E69-44EF-C369-59813152C293";
	setAttr ".t" -type "double3" 0 -1 0.75 ;
createNode transform -n "L_toePivot_loc" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_toePivot_loc_Grp";
	rename -uid "487A0803-4126-3940-2361-A8B7D8B20EC6";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_toePivot_locShape" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_toePivot_loc_Grp|L_toePivot_loc";
	rename -uid "4B70FA86-46F9-0136-A9A1-D58EC16A4207";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_bankRightPivot_loc_Grp" -p "L_toe1_loc";
	rename -uid "F3F2626E-481A-3705-F512-AC85BE4659F9";
	setAttr ".t" -type "double3" -1 -1 0.75 ;
createNode transform -n "L_bankRightPivot_loc" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_bankRightPivot_loc_Grp";
	rename -uid "F0A478CF-45CE-9066-4A62-23A25CFCE717";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "bankRight";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_bankRightPivot_locShape" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toeRoot_loc_Grp|L_toeRoot_loc|L_toe1_loc_Grp|L_toe1_loc|L_bankRightPivot_loc_Grp|L_bankRightPivot_loc";
	rename -uid "18849A31-465C-1F15-4FDB-B592AD7C53C9";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_toe2_loc_Grp" -p "L_toeRoot_loc";
	rename -uid "1A678D34-4D56-2A26-C039-8B816BEF2B22";
	setAttr ".t" -type "double3" 1.7763568394002505e-15 -1.5 1.5000000000000036 ;
createNode transform -n "L_toe2_loc" -p "L_toe2_loc_Grp";
	rename -uid "9BAB7FDF-4458-0EC6-58E9-3E995789B527";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_index" -type "string" "5";
createNode locator -n "L_toe2_locShape" -p "L_toe2_loc";
	rename -uid "6A357B7C-4B57-8B32-40B1-F78CE5273AB5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_leg_vector_Grp" -p "L_hip_loc";
	rename -uid "DAD227F5-4DFD-F9E8-A96B-CDA320723B32";
createNode transform -n "L_leg_vector" -p "L_leg_vector_Grp";
	rename -uid "32D46AEB-4E12-4B2B-9876-08AB935F4B60";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "leg";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "L_leg_vectorShape" -p "L_leg_vector";
	rename -uid "DBB1BE31-4324-0F21-A443-BEA71A8760F9";
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
	rename -uid "93296BD6-4950-8DE0-1F24-B49FDBD1C555";
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
	rename -uid "C6F9765A-49A2-BABD-F13D-97BB6DE153EF";
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
	rename -uid "53841D75-4770-7BCF-5896-A7B1556BCBBF";
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
	setAttr ".tg[0].tot" -type "double3" 6 0 0 ;
	setAttr ".rst" -type "double3" 6 22 -10 ;
	setAttr -k on ".w0";
createNode transform -n "R_hip_nonParent";
	rename -uid "DE6A47BC-4D68-D315-563A-0CBA984B7868";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "container";
	setAttr ".rig_data" -type "string" "group";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_hip_Crv" -p "R_hip_nonParent";
	rename -uid "B37090C8-4BF1-74B4-837B-5AB6C0CBBA29";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_hip_CrvShape" -p "R_hip_Crv";
	rename -uid "4C8D22B8-487A-4613-B978-45A7BACB6FE2";
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
		-6 22 -10
		-6 13 -7
		;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_knee_Crv" -p "R_hip_nonParent";
	rename -uid "0195B4FB-41A2-CBFA-804D-519DB3895476";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_knee_CrvShape" -p "R_knee_Crv";
	rename -uid "80BCC6E6-41EC-0A07-133D-C2A58994DD0D";
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
		-6 13 -7
		-6 8 -12
		;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_ankle_Crv" -p "R_hip_nonParent";
	rename -uid "3357E5A8-4E6B-E808-C8DA-A7AD45F5DE23";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_ankle_CrvShape" -p "R_ankle_Crv";
	rename -uid "B01243FD-4250-D98B-4DFB-EDBEC6EB1EB2";
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
		-6 8 -12
		-5.9999999999999982 2.5 -9.5000000000000036
		;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_toeRoot_Crv" -p "R_hip_nonParent";
	rename -uid "920FA748-420D-9BCF-3A69-0DA334B2AB68";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_toeRoot_CrvShape" -p "R_toeRoot_Crv";
	rename -uid "15DF2072-4A09-0214-47B4-99AF0D26499F";
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
		-5.9999999999999982 2.5 -9.5000000000000036
		-6 1 -9
		;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "toeRoot";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_toe1_Crv" -p "R_hip_nonParent";
	rename -uid "F25B68D8-4E46-B675-2472-71AA9C308EA3";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_toe1_CrvShape" -p "R_toe1_Crv";
	rename -uid "06686B19-47A0-50AD-F024-DC9286534A7A";
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
		-6 1 -9
		-6 1 -8
		;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_part" -type "string" "toe1";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_hip_loc_mirror";
	rename -uid "72994A04-454A-CAA7-852A-55871623BCEC";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".s" -type "double3" -1 1 1 ;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "mirror";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_hip_loc_Grp" -p "R_hip_loc_mirror";
	rename -uid "13ED5898-4182-0D71-2428-0BAECEBD1128";
createNode transform -n "R_hip_loc" -p "R_hip_loc_Grp";
	rename -uid "35442243-452A-9337-E8B7-1BB56194F92D";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_hip_locShape" -p "R_hip_loc";
	rename -uid "02749115-4644-AE67-3A58-22AD8570918C";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_knee_loc_Grp" -p "R_hip_loc";
	rename -uid "B8D6C9E5-400C-65D1-D273-55AEC04E8CED";
	setAttr ".t" -type "double3" 0 -9 3.0000000000000004 ;
createNode transform -n "R_knee_loc" -p "R_knee_loc_Grp";
	rename -uid "E810F387-4433-47A2-9005-E0B4F6E47EE3";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_knee_locShape" -p "R_knee_loc";
	rename -uid "2D693CAC-434A-EB6D-5BBC-10B02AF8FD6A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_hipExtra_loc_Grp" -p "R_knee_loc";
	rename -uid "D71FE144-48D5-E086-EEAF-898E29557C78";
	setAttr ".r" -type "double3" 3.1805546814635168e-15 0 0 ;
createNode transform -n "R_hipExtra_loc" -p "R_hipExtra_loc_Grp";
	rename -uid "D175E5EA-49A0-75D8-B343-ACA6FC882917";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_hipExtra_locShape" -p "R_hipExtra_loc";
	rename -uid "A578D88D-4A4B-49F8-5022-C1B4341437CC";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_hipExtra_loc_Grp_parentConstraint1" -p "R_hipExtra_loc_Grp";
	rename -uid "3E563818-4EF9-A583-AC39-C28866BA90B0";
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
	rename -uid "EEA29DFA-422C-D211-0704-9784D318E2C9";
	setAttr ".t" -type "double3" 0 0 1 ;
createNode transform -n "R_kneeExtra_loc" -p "R_kneeExtra_loc_Grp";
	rename -uid "58779058-485A-D6D5-E069-E7A53A31F6FC";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_kneeExtra_locShape" -p "R_kneeExtra_loc";
	rename -uid "35018B2D-4244-4DE9-BBBB-0F9DB9BA7C15";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_knee_ankleExtra1_loc_Grp" -p "R_knee_loc";
	rename -uid "22147AB6-4048-E9A5-67B9-9A8CDD40B30B";
createNode transform -n "R_knee_ankleExtra1_loc" -p "R_knee_ankleExtra1_loc_Grp";
	rename -uid "710B6645-4C92-F7B9-E6CB-1FA03951A1B5";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "knee_ankle";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_knee_ankleExtra1_locShape" -p "R_knee_ankleExtra1_loc";
	rename -uid "AE1102EF-4D4C-0A50-EDD9-2FBECC242B52";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_knee_ankleExtra1_loc_Grp_parentConstraint1" -p "R_knee_ankleExtra1_loc_Grp";
	rename -uid "0BDAD868-4B7E-676B-E91D-FEB3AED5EEC5";
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
	rename -uid "48C42969-4919-3923-2DAE-DEB5C630535F";
	setAttr ".t" -type "double3" 0 0 -4.4408920985006262e-16 ;
createNode aimConstraint -n "R_L_aim_support1_aimConstraint1" -p "R_L_aim_support1";
	rename -uid "4B9A0D08-4072-0F32-F3C5-659FB8AAEF7C";
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
	rename -uid "D17A86EF-4AB0-1CFC-5E9A-5DAD1E992755";
	setAttr ".t" -type "double3" 0 0 -4.4408920985006262e-16 ;
createNode aimConstraint -n "R_L_aim_support2_aimConstraint1" -p "R_L_aim_support2";
	rename -uid "6EE519F4-412F-64BF-8990-5DB1281D5B8C";
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
	rename -uid "189D6FC4-4E5A-0CBF-2597-24AEA85CEAB7";
	setAttr ".t" -type "double3" 0 -14 -2 ;
createNode transform -n "R_ankle_loc" -p "R_ankle_loc_Grp";
	rename -uid "ECB963CA-4FA5-FB58-3E6E-82821FF841DC";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_ankle_locShape" -p "R_ankle_loc";
	rename -uid "DAF17243-46D2-4C00-D892-FDB747511D39";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_knee_ankleExtra2_loc_Grp" -p "R_ankle_loc";
	rename -uid "1EBE8FCA-47A0-721B-EA23-F79AE7125FF3";
createNode transform -n "R_knee_ankleExtra2_loc" -p "R_knee_ankleExtra2_loc_Grp";
	rename -uid "1B8AE004-44F4-9607-21A5-028F23735A4A";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "knee_ankle";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_knee_ankleExtra2_locShape" -p "R_knee_ankleExtra2_loc";
	rename -uid "5BC49F9E-4061-8F63-6959-BFA05D7E6C50";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_knee_ankleExtra2_loc_Grp_parentConstraint1" -p "R_knee_ankleExtra2_loc_Grp";
	rename -uid "D8FFF49F-4EC1-5390-B60C-80922531A119";
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
	rename -uid "EE278517-4F90-B275-06DA-F8B204B345F0";
	setAttr ".t" -type "double3" 0 0 -1 ;
createNode transform -n "R_ankleExtra_loc" -p "R_ankleExtra_loc_Grp";
	rename -uid "77435A20-4C8C-F8EB-5455-6081A2AEFC7F";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_ankleExtra_locShape" -p "R_ankleExtra_loc";
	rename -uid "3A3718D7-4778-99EA-6E04-048A07FE8973";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_toeExtra_loc_Grp" -p "R_ankle_loc";
	rename -uid "566D097D-453E-7AD9-4924-CA96F708E4B3";
	setAttr ".r" -type "double3" -3.1805546814635168e-15 0 0 ;
createNode transform -n "R_toeExtra_loc" -p "R_toeExtra_loc_Grp";
	rename -uid "988B74C7-4EE0-8E7A-1575-E59B17C4B24B";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_toeExtra_locShape" -p "R_toeExtra_loc";
	rename -uid "FF291A99-44C1-12C2-C128-F090ADA8585E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_toeExtra_loc_Grp_parentConstraint1" -p "R_toeExtra_loc_Grp";
	rename -uid "86CE8A46-48D6-EBDE-EF45-8E8C10C1268F";
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
	rename -uid "E0D0909A-4D17-DF95-7BE7-6BB1EF14A6F0";
createNode aimConstraint -n "R_L_aim_support3_aimConstraint1" -p "R_L_aim_support3";
	rename -uid "93971053-4F7C-3EA0-A66E-72A3FCEB31EE";
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
	rename -uid "C26BEFC2-4B35-5DB6-8766-6AB637808FCC";
createNode aimConstraint -n "R_L_aim_support4_aimConstraint1" -p "R_L_aim_support4";
	rename -uid "9A3A09FA-4D1E-F6E9-5CC1-D683892B98E5";
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
	rename -uid "D1241F84-43E0-2E5A-93CA-39A422A212B2";
	setAttr ".t" -type "double3" -1.7763568394002505e-15 -19.5 0.49999999999999645 ;
createNode transform -n "R_toeRoot_loc" -p "R_toeRoot_loc_Grp";
	rename -uid "BDFB2876-409B-6164-B1BE-FBA1EEBB2BA9";
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
	setAttr -k on ".insertJnt" 1;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "toeRoot";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_toeRoot_locShape" -p "R_toeRoot_loc";
	rename -uid "53CD5750-4611-9FF5-471B-4389FC2CD844";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_toe1_loc_Grp" -p "R_toeRoot_loc";
	rename -uid "3A75E336-4765-5AEA-0E42-7991649FAE26";
	setAttr ".t" -type "double3" 1.7763568394002505e-15 -1.5 0.50000000000000355 ;
createNode transform -n "R_toe1_loc" -p "R_toe1_loc_Grp";
	rename -uid "020CB131-489C-9AD2-EED4-599C304692DA";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_toe1_locShape" -p "R_toe1_loc";
	rename -uid "2C5C4C64-486F-EE1B-9D0A-9A8CB348319F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_heelPivot_loc_Grp" -p "R_toe1_loc";
	rename -uid "FC92B127-4910-517F-1286-39892B925B9A";
	setAttr ".t" -type "double3" 0 -1 0 ;
createNode transform -n "R_heelPivot_loc" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_heelPivot_loc_Grp";
	rename -uid "20028D4C-41C1-2BFF-AD77-BCB548BCEC76";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "heel";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_heelPivot_locShape" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_heelPivot_loc_Grp|R_heelPivot_loc";
	rename -uid "7F3C5C46-46F2-BC0B-22FC-D3A2734CD530";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_toeEndPivot_loc_Grp" -p "R_toe1_loc";
	rename -uid "C4C93857-4221-5197-6BE7-FDB75DA18950";
	setAttr ".t" -type "double3" 0 -1 1.5 ;
createNode transform -n "R_toeEndPivot_loc" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_toeEndPivot_loc_Grp";
	rename -uid "E990CE6F-48C3-4D54-328F-7D86755D9431";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_toeEndPivot_locShape" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_toeEndPivot_loc_Grp|R_toeEndPivot_loc";
	rename -uid "CE7DA429-41B2-727B-A2C4-C8BB9D6AF143";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_bankLeftPivot_loc_Grp" -p "R_toe1_loc";
	rename -uid "E74470F2-4A63-6CC7-C879-798B5346D5B9";
	setAttr ".t" -type "double3" 1 -1 0.75 ;
createNode transform -n "R_bankLeftPivot_loc" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_bankLeftPivot_loc_Grp";
	rename -uid "9578F9F5-4BE3-A291-AD75-42A44DAC7A75";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "bankLeft";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_bankLeftPivot_locShape" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_bankLeftPivot_loc_Grp|R_bankLeftPivot_loc";
	rename -uid "D4F32454-45C7-0C4D-4C87-6DB2A4597366";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_toePivot_loc_Grp" -p "R_toe1_loc";
	rename -uid "1A25D28C-4E1E-5121-0BC3-22877BF4B492";
	setAttr ".t" -type "double3" 0 -1 0.75 ;
createNode transform -n "R_toePivot_loc" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_toePivot_loc_Grp";
	rename -uid "C44143B1-4CF4-313B-A1C7-8AA2343B207B";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_toePivot_locShape" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_toePivot_loc_Grp|R_toePivot_loc";
	rename -uid "0FC0BCC4-48B8-BF0B-9F00-71801157AE20";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_bankRightPivot_loc_Grp" -p "R_toe1_loc";
	rename -uid "C96FC9F4-4595-FB81-7169-55BA9A461732";
	setAttr ".t" -type "double3" -1 -1 0.75 ;
createNode transform -n "R_bankRightPivot_loc" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_bankRightPivot_loc_Grp";
	rename -uid "80FCE848-438B-383A-FE15-6198012A0F88";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "bankRight";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_bankRightPivot_locShape" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toeRoot_loc_Grp|R_toeRoot_loc|R_toe1_loc_Grp|R_toe1_loc|R_bankRightPivot_loc_Grp|R_bankRightPivot_loc";
	rename -uid "CDE78751-4AAD-E426-1C70-61897A520CF2";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_toe2_loc_Grp" -p "R_toeRoot_loc";
	rename -uid "C6E61B7E-4426-13CA-1058-7D90B5D1777B";
	setAttr ".t" -type "double3" 1.7763568394002505e-15 -1.5 1.5000000000000036 ;
createNode transform -n "R_toe2_loc" -p "R_toe2_loc_Grp";
	rename -uid "3CE17CE3-46EE-486F-7143-12B803017684";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_index" -type "string" "5";
createNode locator -n "R_toe2_locShape" -p "R_toe2_loc";
	rename -uid "BE5860AB-408A-C90D-9979-B98D6BFB122B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_leg_vector_Grp" -p "R_hip_loc";
	rename -uid "BE853DCD-438A-6669-3FEE-AD92AA4B01A5";
createNode transform -n "R_leg_vector" -p "R_leg_vector_Grp";
	rename -uid "BFD92142-4684-0B75-B2E7-6DB53004CCFE";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "leg";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "R_leg_vectorShape" -p "R_leg_vector";
	rename -uid "EB7FA3D3-42CB-3166-936B-0193AA310392";
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
	rename -uid "8E624C44-4ECA-59D5-C739-F09C4C779E47";
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
	rename -uid "EE08D97A-407D-E52D-993D-CCB268A69BD2";
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
	rename -uid "D5A7E946-4BC8-9818-D339-85B2858D6897";
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
	setAttr ".tg[0].tot" -type "double3" -6 0 0 ;
	setAttr ".rst" -type "double3" -6 22 -10 ;
	setAttr -k on ".w0";
createNode transform -n "L_arm_loc_mirror";
	rename -uid "42127E0D-4C0F-A0AA-1249-1097F5592145";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "mirror";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_scapula_loc_Grp" -p "L_arm_loc_mirror";
	rename -uid "350F1E69-440F-C446-317C-B4A4137A0E41";
createNode transform -n "L_scapula_loc" -p "L_scapula_loc_Grp";
	rename -uid "2884E144-4537-CA5F-6B2F-CCA7559A0AC5";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_scapula_locShape" -p "L_scapula_loc";
	rename -uid "18E64B5E-46FD-2094-4EA3-338FA83BF176";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_scapula_vector_Grp" -p "L_scapula_loc";
	rename -uid "33DE64B6-4575-D592-7A38-25B735BFA645";
createNode transform -n "L_scapula_vector" -p "L_scapula_vector_Grp";
	rename -uid "039B943A-454D-E3A1-83D4-B6A8F1C4A06C";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "L_scapula_vectorShape" -p "L_scapula_vector";
	rename -uid "B794B589-4454-5A21-D9CE-22A7037A8E7C";
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
	rename -uid "FE968CE8-4B8F-A412-95D3-7E9FF43AB141";
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
	rename -uid "34340C0F-40D8-E15A-4C40-F7B98F5FDCA8";
	setAttr ".t" -type "double3" 2 -7 3 ;
createNode transform -n "L_shoulder_loc" -p "L_shoulder_loc_Grp";
	rename -uid "3FC2367D-4FA2-99A0-31A1-8DB5893A320E";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_shoulder_locShape" -p "L_shoulder_loc";
	rename -uid "B536123F-41BD-FBB6-1377-3BAAFA7274A5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_shoulder_vector_Grp" -p "L_shoulder_loc";
	rename -uid "22338ED4-472D-2699-478C-19BE64D3EE97";
createNode transform -n "L_shoulder_vector" -p "L_shoulder_vector_Grp";
	rename -uid "78C75955-4943-94CA-5A6C-4790F2A72DC8";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "L_shoulder_vectorShape" -p "L_shoulder_vector";
	rename -uid "D56F2A0B-47BE-2890-F14D-3ABF43ACAAF0";
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
	rename -uid "CD848574-4F44-1CEE-39DC-78A47C52A59D";
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
	rename -uid "89BC141E-4E90-AC86-F7BC-D6A3FD57D8B3";
	setAttr ".t" -type "double3" 0 -13 -2 ;
createNode transform -n "L_wrist_loc" -p "L_wrist_loc_Grp";
	rename -uid "7F567F22-43DF-9068-7A7E-D5AE9FC3BC80";
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
	setAttr -k on ".insertJnt" 1;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_wrist_locShape" -p "L_wrist_loc";
	rename -uid "B31FB0B6-4695-BE75-7588-51A96C431FE1";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_wristToe_loc_Grp" -p "L_wrist_loc";
	rename -uid "4F434DFA-400E-74EA-B84F-A6881D028525";
	setAttr ".t" -type "double3" 0 -2 0.5 ;
createNode transform -n "L_wristToe_loc" -p "L_wristToe_loc_Grp";
	rename -uid "32CE7B6A-463B-4890-941F-5CB4E35BC70A";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "wristToe";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_wristToe_locShape" -p "L_wristToe_loc";
	rename -uid "8FA5B17C-40A5-941A-22A0-3DB672878309";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_bankRightPivot_loc_Grp" -p "L_wristToe_loc";
	rename -uid "5AB68FC0-488D-1EA3-A4AD-539323A74E1D";
	setAttr ".t" -type "double3" -1 -1 0.74999972723693986 ;
createNode transform -n "L_bankRightPivot_loc" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_bankRightPivot_loc_Grp";
	rename -uid "6B9E4DF3-49C9-0757-E17D-9081199FAAA2";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "bankRight";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_bankRightPivot_locShape" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_bankRightPivot_loc_Grp|L_bankRightPivot_loc";
	rename -uid "04D9B464-4FF3-CF4F-EC3F-20AA2C6BD319";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_heelPivot_loc_Grp" -p "L_wristToe_loc";
	rename -uid "08B3E68F-4046-79FA-67E4-93B0A326F35A";
	setAttr ".t" -type "double3" 0 -1 -2.7276306013845897e-07 ;
createNode transform -n "L_heelPivot_loc" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_heelPivot_loc_Grp";
	rename -uid "CF103A7E-40A5-8AE4-ACC5-50B76A265944";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "heel";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_heelPivot_locShape" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_heelPivot_loc_Grp|L_heelPivot_loc";
	rename -uid "9C504851-48C4-CDB3-6601-8B929703B988";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_bankLeftPivot_loc_Grp" -p "L_wristToe_loc";
	rename -uid "2B1F250C-439C-B8C2-8219-3A954D425EB5";
	setAttr ".t" -type "double3" 1 -1 0.74999972723693986 ;
createNode transform -n "L_bankLeftPivot_loc" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_bankLeftPivot_loc_Grp";
	rename -uid "55B1C0BF-4859-EB9A-006F-1A9CAFD90231";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "bankLeft";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_bankLeftPivot_locShape" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_bankLeftPivot_loc_Grp|L_bankLeftPivot_loc";
	rename -uid "BFF4BB71-479F-333C-E8CB-55A7571F1283";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_toePivot_loc_Grp" -p "L_wristToe_loc";
	rename -uid "D1851D4B-41E9-430A-4987-95B617C57BB6";
	setAttr ".t" -type "double3" 0 -1 0.74999972723693986 ;
createNode transform -n "L_toePivot_loc" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_toePivot_loc_Grp";
	rename -uid "18D77FA4-4CC5-1D2E-85AA-23827D916B6E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_toePivot_locShape" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_toePivot_loc_Grp|L_toePivot_loc";
	rename -uid "7E54710D-4DEC-1153-9689-48A9FAA0A1C0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_toeEndPivot_loc_Grp" -p "L_wristToe_loc";
	rename -uid "C3DE309D-46C5-7B36-6198-F18F1A508A6F";
	setAttr ".t" -type "double3" 0 -1 1.4999997272369399 ;
createNode transform -n "L_toeEndPivot_loc" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_toeEndPivot_loc_Grp";
	rename -uid "8C801C7D-46D2-1DA6-7ED3-24AB431908A5";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_toeEndPivot_locShape" -p "|L_arm_loc_mirror|L_scapula_loc_Grp|L_scapula_loc|L_shoulder_loc_Grp|L_shoulder_loc|L_wrist_loc_Grp|L_wrist_loc|L_wristToe_loc_Grp|L_wristToe_loc|L_toeEndPivot_loc_Grp|L_toeEndPivot_loc";
	rename -uid "DAE5C1B0-4692-C80C-2D85-AA8FFF1BB753";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_wristToeEnd_loc_Grp" -p "L_wrist_loc";
	rename -uid "455412BB-41AA-FD89-923F-45869CDE5AF3";
	setAttr ".t" -type "double3" 0 -2 2 ;
createNode transform -n "L_wristToeEnd_loc" -p "L_wristToeEnd_loc_Grp";
	rename -uid "8A93CE4F-4DEC-1AF3-FECC-4FA2CFAA8EB2";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "wristToeEnd";
	setAttr ".rig_index" -type "string" "5";
createNode locator -n "L_wristToeEnd_locShape" -p "L_wristToeEnd_loc";
	rename -uid "95988539-4730-C1A5-7391-A4BB8C0EB2C4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_elbow_loc_Grp" -p "L_shoulder_loc";
	rename -uid "23272A90-40E8-2A4B-509B-04B3C631D4F2";
	setAttr ".t" -type "double3" 0 -7 -4 ;
createNode transform -n "L_elbow_loc" -p "L_elbow_loc_Grp";
	rename -uid "A0746D91-4426-580E-0382-588CC266DCA9";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_elbow_locShape" -p "L_elbow_loc";
	rename -uid "5CE6F656-48AE-75A7-B60D-8FB5D5A2FF7D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_aim_support2" -p "L_elbow_loc";
	rename -uid "75230471-49EB-294B-8C88-7FB82D1F8C29";
createNode aimConstraint -n "L_aim_support2_aimConstraint1" -p "L_aim_support2";
	rename -uid "9CBC2786-4346-287B-086C-4EB4C0C3A819";
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
	rename -uid "0FAF87C6-4725-5530-94C9-B28AFDECB984";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
createNode aimConstraint -n "L_aim_support1_aimConstraint1" -p "L_aim_support1";
	rename -uid "11F3DB0C-4F21-6510-096D-21AE0C239A18";
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
	rename -uid "38EE5256-42EC-4F7F-0556-BE8AA9B5C0C0";
createNode transform -n "L_shoulderExtra_loc" -p "L_shoulderExtra_loc_Grp";
	rename -uid "8D316ABB-44DD-4E8C-43F3-95B65F071FEC";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_shoulderExtra_locShape" -p "L_shoulderExtra_loc";
	rename -uid "2A7E3D1F-47FF-BE1E-B908-37B280EF1A7F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_shoulderExtra_loc_Grp_parentConstraint1" -p "L_shoulderExtra_loc_Grp";
	rename -uid "B6CAEC72-4A79-04E0-4764-B2AC827ACC99";
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
	rename -uid "EDD90C8B-4A4E-E43E-60EC-DBA6A7CD9CB0";
	setAttr ".t" -type "double3" 0 0 -1 ;
createNode transform -n "L_elbowExtra_loc" -p "L_elbowExtra_loc_Grp";
	rename -uid "24984E2F-4A74-DAE2-8C27-16B0EF331585";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_elbowExtra_locShape" -p "L_elbowExtra_loc";
	rename -uid "ECDEB5A7-4498-402D-3F8F-68ABABB13B8A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_wristExtra_loc_Grp" -p "L_elbow_loc";
	rename -uid "3EFBCF18-4184-E831-7953-67A8BF1C2E1F";
createNode transform -n "L_wristExtra_loc" -p "L_wristExtra_loc_Grp";
	rename -uid "F88C10A6-465F-9BD7-8176-B5916A92C727";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_wristExtra_locShape" -p "L_wristExtra_loc";
	rename -uid "42D8C1BC-46E5-79CA-A411-6680A5F1B294";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_wristExtra_loc_Grp_parentConstraint1" -p "L_wristExtra_loc_Grp";
	rename -uid "3F24C394-4B72-F804-25CC-A2B2007F4820";
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
	rename -uid "E8DCFAB4-47C1-80B8-A392-D1AF93CD5633";
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
	setAttr ".tg[0].tot" -type "double3" 4 1 -1 ;
	setAttr ".rst" -type "double3" 4 23 9 ;
	setAttr -k on ".w0";
createNode transform -n "L_arm_nonParent";
	rename -uid "1BC5E2C6-4778-9766-465F-3E85862E2F90";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "container";
	setAttr ".rig_data" -type "string" "group";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "L_scapula_curve" -p "L_arm_nonParent";
	rename -uid "51A37F58-4726-9318-8737-D7B2910B4969";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_scapula_curveShape" -p "L_scapula_curve";
	rename -uid "A004AC33-40CF-293C-B847-57ACB1311F14";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		4 23 9
		6 16 12
		;
createNode transform -n "L_shoulder_curve" -p "L_arm_nonParent";
	rename -uid "94952B87-4F59-D30A-0AAB-6A9393FBAD7D";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_shoulder_curveShape" -p "L_shoulder_curve";
	rename -uid "5B1672D2-42B5-851D-7AF4-B5A1B895DF4C";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		6 16 12
		6 9 8
		;
createNode transform -n "L_elbow_curve" -p "L_arm_nonParent";
	rename -uid "DDE419F1-4623-2783-C637-1FAB9349FFC9";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_elbow_curveShape" -p "L_elbow_curve";
	rename -uid "1CD0868D-4E49-5522-292C-CD91AF42CBEE";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		6 9 8
		6 3 10
		;
createNode transform -n "L_wrist_curve" -p "L_arm_nonParent";
	rename -uid "AE91D645-4CF6-7E09-F207-E1B64D22BB91";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_wrist_curveShape" -p "L_wrist_curve";
	rename -uid "06C7EAA5-4442-6C18-D220-60BF9AC96415";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		6 3 10
		6 1 10.5
		;
createNode transform -n "L_wristToe_curve" -p "L_arm_nonParent";
	rename -uid "8FB0526B-43D1-13D9-DBF6-54A592BB9064";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_wristToe_curveShape" -p "L_wristToe_curve";
	rename -uid "E1CE238B-40CA-AEC1-4689-BF86E356CB08";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		6 1 10.5
		6 1 12
		;
createNode transform -n "R_arm_loc_mirror";
	rename -uid "D287D77A-4490-FC64-726C-CC966296697E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".s" -type "double3" -1 1 1 ;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "mirror";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_scapula_loc_Grp" -p "R_arm_loc_mirror";
	rename -uid "2B6F245E-4034-8843-0743-BBABAA482A62";
createNode transform -n "R_scapula_loc" -p "R_scapula_loc_Grp";
	rename -uid "DE3ECEC8-4D62-DD8B-BF85-E8BEC18F94E6";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_scapula_locShape" -p "R_scapula_loc";
	rename -uid "351305D6-43C4-D57B-F3BF-5A8AEBC85D3C";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_scapula_vector_Grp" -p "R_scapula_loc";
	rename -uid "1F20FBB8-4D47-DBAD-72D7-57A39FB6C197";
createNode transform -n "R_scapula_vector" -p "R_scapula_vector_Grp";
	rename -uid "F25DC897-4D5A-2B95-2904-84BE3E3591FC";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "scapula";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "R_scapula_vectorShape" -p "R_scapula_vector";
	rename -uid "46E576C4-42B2-93BC-4586-8A91B997B8F4";
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
	rename -uid "DF7ADFAD-487D-A6A2-410E-B7B774391131";
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
	rename -uid "E2106076-47B3-8609-7D49-75A28E430150";
	setAttr ".t" -type "double3" 2 -7 3 ;
createNode transform -n "R_shoulder_loc" -p "R_shoulder_loc_Grp";
	rename -uid "3D76A3F2-4F16-E776-C725-4CB62D8E9024";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_shoulder_locShape" -p "R_shoulder_loc";
	rename -uid "048B2ED2-481D-9808-A50B-6E94556D6C79";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_shoulder_vector_Grp" -p "R_shoulder_loc";
	rename -uid "26635282-40F8-9A0F-9582-E39B79317B07";
createNode transform -n "R_shoulder_vector" -p "R_shoulder_vector_Grp";
	rename -uid "6520A927-426B-52ED-9BD7-4C9453190E22";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "R_shoulder_vectorShape" -p "R_shoulder_vector";
	rename -uid "C443686A-457F-DCA1-BB16-33B1CA2B6C49";
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
	rename -uid "62BE39FC-42C1-2404-2637-428F44D30361";
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
	rename -uid "48BA366C-4C06-772A-7756-3CA811B5B697";
	setAttr ".t" -type "double3" 0 -13 -2 ;
createNode transform -n "R_wrist_loc" -p "R_wrist_loc_Grp";
	rename -uid "DAFA5ED8-4356-1523-8AFC-608F43FCEB2C";
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
	setAttr -k on ".insertJnt" 1;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_wrist_locShape" -p "R_wrist_loc";
	rename -uid "FD40FCD9-40B1-8E0C-8F18-B3857B6388B7";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_wristToe_loc_Grp" -p "R_wrist_loc";
	rename -uid "ABC159A8-4B61-37FD-2847-56A3F081AE87";
	setAttr ".t" -type "double3" 0 -2 0.5 ;
createNode transform -n "R_wristToe_loc" -p "R_wristToe_loc_Grp";
	rename -uid "8FABC302-4E68-AF71-AE1C-C68415DE739F";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "wristToe";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_wristToe_locShape" -p "R_wristToe_loc";
	rename -uid "38869206-41D9-CC0C-385B-0F867C8E2951";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_bankRightPivot_loc_Grp" -p "R_wristToe_loc";
	rename -uid "2E3303CE-435B-B4BF-276A-7B85E4BBBC20";
	setAttr ".t" -type "double3" -1 -1 0.74999972723693986 ;
createNode transform -n "R_bankRightPivot_loc" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_bankRightPivot_loc_Grp";
	rename -uid "1566C05F-4182-EF2E-9E8D-00A8D7D0F77F";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "bankRight";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_bankRightPivot_locShape" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_bankRightPivot_loc_Grp|R_bankRightPivot_loc";
	rename -uid "E63538FF-4F01-195A-57C5-7F9D75CF378B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_heelPivot_loc_Grp" -p "R_wristToe_loc";
	rename -uid "65F5FD79-49D7-89E3-EF48-C3A5C6D5577E";
	setAttr ".t" -type "double3" 0 -1 -2.7276306013845897e-07 ;
createNode transform -n "R_heelPivot_loc" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_heelPivot_loc_Grp";
	rename -uid "5C52F338-49AC-A330-41DD-D5B80F40C5D4";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "heel";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_heelPivot_locShape" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_heelPivot_loc_Grp|R_heelPivot_loc";
	rename -uid "7512ECD6-4444-01AB-09DB-B6B67C6007A2";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_bankLeftPivot_loc_Grp" -p "R_wristToe_loc";
	rename -uid "40915ABB-40F9-47F2-4114-1FA5D20B67CB";
	setAttr ".t" -type "double3" 1 -1 0.74999972723693986 ;
createNode transform -n "R_bankLeftPivot_loc" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_bankLeftPivot_loc_Grp";
	rename -uid "68DC1EB4-41F3-82BA-F420-2189CD935307";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "bankLeft";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_bankLeftPivot_locShape" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_bankLeftPivot_loc_Grp|R_bankLeftPivot_loc";
	rename -uid "F69BE47C-4D42-28E5-20B9-39BE7F3A0292";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_toePivot_loc_Grp" -p "R_wristToe_loc";
	rename -uid "1D83C169-4440-B523-9A0C-5ABAD949C2EE";
	setAttr ".t" -type "double3" 0 -1 0.74999972723693986 ;
createNode transform -n "R_toePivot_loc" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_toePivot_loc_Grp";
	rename -uid "E1C697CA-48D8-50C9-921A-7B8A78C923CD";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_toePivot_locShape" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_toePivot_loc_Grp|R_toePivot_loc";
	rename -uid "7E50932C-4829-3F13-B857-38AD7D2DE161";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_toeEndPivot_loc_Grp" -p "R_wristToe_loc";
	rename -uid "3270F570-4797-1F9C-5FA3-258A14E715E8";
	setAttr ".t" -type "double3" 0 -1 1.4999997272369399 ;
createNode transform -n "R_toeEndPivot_loc" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_toeEndPivot_loc_Grp";
	rename -uid "6C42CA10-4CF7-1515-614D-499419F460B9";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 9;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "pivot";
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_toeEndPivot_locShape" -p "|R_arm_loc_mirror|R_scapula_loc_Grp|R_scapula_loc|R_shoulder_loc_Grp|R_shoulder_loc|R_wrist_loc_Grp|R_wrist_loc|R_wristToe_loc_Grp|R_wristToe_loc|R_toeEndPivot_loc_Grp|R_toeEndPivot_loc";
	rename -uid "EB171557-4955-4421-F98B-A9AFCCF980D4";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_wristToeEnd_loc_Grp" -p "R_wrist_loc";
	rename -uid "B3736B78-44BB-D977-7A82-5E940B9023F0";
	setAttr ".t" -type "double3" 0 -2 2 ;
createNode transform -n "R_wristToeEnd_loc" -p "R_wristToeEnd_loc_Grp";
	rename -uid "020F96EE-406F-7EAC-E15A-FC9FFFD73E63";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "wristToeEnd";
	setAttr ".rig_index" -type "string" "5";
createNode locator -n "R_wristToeEnd_locShape" -p "R_wristToeEnd_loc";
	rename -uid "13AF18EB-42C9-4502-B27D-DB96452EEAE1";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_elbow_loc_Grp" -p "R_shoulder_loc";
	rename -uid "BF0A4E83-433D-996C-5CEA-4295FF116609";
	setAttr ".t" -type "double3" 0 -7 -4 ;
createNode transform -n "R_elbow_loc" -p "R_elbow_loc_Grp";
	rename -uid "DB1ADD3A-4C93-3CD0-CBA5-77A3B010969F";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_elbow_locShape" -p "R_elbow_loc";
	rename -uid "1CD234E8-47AC-24DB-72F5-6E8EF70B2AD3";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_aim_support2" -p "R_elbow_loc";
	rename -uid "CB24B641-4B1F-251E-7ECA-9DA5075CA75A";
createNode aimConstraint -n "R_aim_support2_aimConstraint1" -p "R_aim_support2";
	rename -uid "21025976-4D07-9BED-44B9-29A4D582813B";
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
	rename -uid "C2A00DA3-4645-0B15-3F34-25B0F1F6141C";
	setAttr ".s" -type "double3" 1 0.99999999999999989 0.99999999999999989 ;
createNode aimConstraint -n "R_aim_support1_aimConstraint1" -p "R_aim_support1";
	rename -uid "D7CEE3B5-49EC-4D95-C9F2-26AE7E50C8E9";
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
	rename -uid "3B902B08-4534-C087-D5DF-5C8AA00C77BC";
createNode transform -n "R_shoulderExtra_loc" -p "R_shoulderExtra_loc_Grp";
	rename -uid "4E133FED-4F45-1937-74AA-45B6A5920D25";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "shoulder";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_shoulderExtra_locShape" -p "R_shoulderExtra_loc";
	rename -uid "D826EC12-474D-8389-05C8-43B4D01BE3A2";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_shoulderExtra_loc_Grp_parentConstraint1" -p "R_shoulderExtra_loc_Grp";
	rename -uid "4ADDBF74-41A4-4D66-7256-7281DA826AEE";
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
	rename -uid "C5EF51E2-43DC-09F3-77C9-F49576A53E57";
	setAttr ".t" -type "double3" 0 0 -1 ;
createNode transform -n "R_elbowExtra_loc" -p "R_elbowExtra_loc_Grp";
	rename -uid "C0A410C8-47AF-27A8-BEBC-5995492C4D07";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "elbow";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_elbowExtra_locShape" -p "R_elbowExtra_loc";
	rename -uid "A51132C0-4D93-D16A-2B85-2CB471BDCCE1";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_wristExtra_loc_Grp" -p "R_elbow_loc";
	rename -uid "B4779C34-4E11-A54D-7742-2C94A991A0EA";
createNode transform -n "R_wristExtra_loc" -p "R_wristExtra_loc_Grp";
	rename -uid "8A4FB8DA-4821-6FB6-232B-C6ACD8371811";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "extra";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "wrist";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_wristExtra_locShape" -p "R_wristExtra_loc";
	rename -uid "0F252D53-4D1A-600F-057D-9E8F7D621D88";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_wristExtra_loc_Grp_parentConstraint1" -p "R_wristExtra_loc_Grp";
	rename -uid "F5BF6223-4A52-DF9C-9BDF-E6B74AEB79AF";
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
	rename -uid "80003E62-41BE-596E-6488-19B40904BE24";
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
	setAttr ".tg[0].tot" -type "double3" -4 1 -1 ;
	setAttr ".rst" -type "double3" -4 23 9 ;
	setAttr -k on ".w0";
createNode transform -n "R_arm_nonParent";
	rename -uid "D23F8FEC-45E7-0864-12F4-12A333CDC609";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "arm_type";
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_role" -type "string" "container";
	setAttr ".rig_data" -type "string" "group";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_index" -type "string" "";
createNode transform -n "R_scapula_curve" -p "R_arm_nonParent";
	rename -uid "9C858CD0-49B8-0E17-6D81-25930262C31D";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_scapula_curveShape" -p "R_scapula_curve";
	rename -uid "ED359419-47D4-E398-E463-AFAF0BC44B75";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-4 23 9
		-6 16 12
		;
createNode transform -n "R_shoulder_curve" -p "R_arm_nonParent";
	rename -uid "63B0DD8F-422A-C88A-75A5-A88EA697CCD4";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_shoulder_curveShape" -p "R_shoulder_curve";
	rename -uid "6D72AB43-4526-D350-4591-E1844FE35643";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-6 16 12
		-6 9 8
		;
createNode transform -n "R_elbow_curve" -p "R_arm_nonParent";
	rename -uid "0C16B11A-4EA4-FC75-D36D-EEB2270368B0";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_elbow_curveShape" -p "R_elbow_curve";
	rename -uid "E7FB7AD9-43FE-E94E-022C-28BBE44E38AC";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-6 9 8
		-6 3 10
		;
createNode transform -n "R_wrist_curve" -p "R_arm_nonParent";
	rename -uid "BD453B0A-4CDC-3787-52AD-1BBEA3CBF264";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_wrist_curveShape" -p "R_wrist_curve";
	rename -uid "12EA4432-4EAB-FD97-DC42-889D7A1197C0";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-6 3 10
		-6 1 10.5
		;
createNode transform -n "R_wristToe_curve" -p "R_arm_nonParent";
	rename -uid "AD91D468-41F9-2F99-7A88-DBA13C948D5E";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_wristToe_curveShape" -p "R_wristToe_curve";
	rename -uid "5331E4D1-4837-CD02-4851-788971D26F2C";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-6 1 10.5
		-6 1 12
		;
createNode transform -n "C_head_nonParent";
	rename -uid "DFBF6D1F-464F-C1A3-AA12-25B725B8F33E";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".rig_type" -type "string" "quad";
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
		0 27 17
		0 23 21
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
		0 27 17
		0 24 19
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
		0 27 17
		0 27 19
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
		0 24 17
		0 24.583717346191403 17.283961534500122
		0 25.892116546630859 18.249692916870117
		0 26.095920562744141 20.067109107971191
		0 26 21
		;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "tongue_type";
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
		0 24 17
		0 24 18
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
		3 34 19
		3 34 21
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
		3 34 19
		3 34 31
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
		-3 34 19
		-3.0000000000000004 34 21
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
		-3 34 19
		-3.0000000000000013 33.999999999999993 31
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	addAttr -ci true -sn "insertJnt" -ln "insertJnt" -dv 4 -min 2 -at "long";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "tongue_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "tongue1";
	setAttr ".rig_index" -type "string" "0";
	setAttr -k on ".insertJnt";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	setAttr ".rig_type" -type "string" "quad";
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
	rename -uid "E8C20E29-4AE4-6731-2C5C-1EB447877857";
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
	setAttr ".tg[0].tot" -type "double3" 0 6 2.5 ;
	setAttr ".rst" -type "double3" 0 29 14 ;
	setAttr -k on ".w0";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "19447498-47AD-E7CB-2C2A-9AA19ED78DCD";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager1";
	rename -uid "11E902DA-443A-169F-6277-7CBD472C8A42";
createNode poseInterpolatorManager -n "poseInterpolatorManager1";
	rename -uid "5115493A-4F04-2DDF-3C58-CF97C8B774A2";
createNode displayLayerManager -n "layerManager";
	rename -uid "CF598216-44DB-1423-AC56-74A7870AC308";
createNode displayLayer -n "defaultLayer";
	rename -uid "6740F3E0-4CBA-4FE7-9278-6A910A171F1F";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "306CA14B-4414-4A95-1785-E28AE5135FD4";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "9D22595D-47C7-CE8B-4FF9-5CA936F628BD";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager7";
	rename -uid "4CCB682A-4A87-6222-9C2D-AB9F6E6A2AA9";
createNode renderLayer -n "defaultRenderLayer7";
	rename -uid "F04BB8FA-4375-B4F3-1D64-59B7C4140232";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager8";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer8";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager7";
	rename -uid "AA2C566D-4F52-610C-3133-348EBE41937D";
createNode poseInterpolatorManager -n "poseInterpolatorManager7";
	rename -uid "FA7E58A5-4578-E1CA-7621-24BF5FEED386";
createNode renderLayerManager -n "renderLayerManager9";
	rename -uid "2204E19E-4CC0-AAF8-3205-5FA0D67F8C04";
createNode renderLayer -n "defaultRenderLayer9";
	rename -uid "6817F74C-491A-16D8-CF48-E1A2A60FB2C6";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager10";
	rename -uid "39A2F3C0-42DD-BAD7-361D-F082D6003C8A";
createNode renderLayer -n "defaultRenderLayer10";
	rename -uid "B63BC5BC-4F47-9B33-1531-18AAE183AF91";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager11";
	rename -uid "02BA731B-4BEA-81FD-1DC6-3AB3EEC48F53";
createNode renderLayer -n "defaultRenderLayer11";
	rename -uid "DE9C5079-453C-78BF-B696-6EB7C8968364";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager8";
	rename -uid "E047B66A-4E98-DBE4-27CC-D384C3E0E961";
createNode poseInterpolatorManager -n "poseInterpolatorManager8";
	rename -uid "7B92D329-4222-C717-D7AF-F39CACA67DF2";
createNode renderLayerManager -n "renderLayerManager12";
	rename -uid "DF28B3B1-4B26-5936-2EE7-81900A8EF877";
createNode renderLayer -n "defaultRenderLayer12";
	rename -uid "6F10ED1D-4E98-7A74-9DE3-8C80188AAF57";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager6";
	rename -uid "DA4CEB85-4FC9-9A7B-DC9A-1E8EFE4E3570";
createNode poseInterpolatorManager -n "poseInterpolatorManager6";
	rename -uid "C6F73AF9-47BB-5B22-1599-E28F48A2BDAD";
createNode renderLayerManager -n "renderLayerManager5";
	rename -uid "E6995241-451F-41ED-4524-FB8DB381336A";
createNode renderLayer -n "defaultRenderLayer5";
	rename -uid "18BD152B-47D0-B8AF-228D-98BB6CE1C394";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager6";
	rename -uid "9FA7CCC1-4939-92A7-66FE-0EA2552C1759";
createNode renderLayer -n "defaultRenderLayer6";
	rename -uid "26B6B36B-48E7-AF6B-74E7-2FA0CFA17051";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager5";
	rename -uid "758C3BF5-44AA-5BEF-6E22-DCB1D096C717";
createNode poseInterpolatorManager -n "poseInterpolatorManager5";
	rename -uid "C3037264-4D05-4AB9-B6D0-7AB3D4AA0643";
createNode renderLayerManager -n "renderLayerManager4";
	rename -uid "471985CF-464C-F034-7E8E-E5BE19497592";
createNode renderLayer -n "defaultRenderLayer4";
	rename -uid "D67474E4-4AF3-57C5-9E5B-988B5300D1F3";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager1";
	rename -uid "1ECDF3E6-402D-F519-B0B3-9DAD99C62122";
createNode renderLayer -n "defaultRenderLayer1";
	rename -uid "F59CDC04-4FD6-228A-A2D8-3B96C61C2038";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager2";
	rename -uid "CF49868D-45F8-C691-5996-9CB8C4C046A6";
createNode renderLayer -n "defaultRenderLayer2";
	rename -uid "14A81BC5-4744-FABD-F09C-50945C822AF9";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager4";
	rename -uid "69EEC230-4FE7-7607-1D06-ADBB0018CF83";
createNode poseInterpolatorManager -n "poseInterpolatorManager4";
	rename -uid "F1608DB2-4537-FA27-9CF9-28985AA5279A";
createNode renderLayerManager -n "renderLayerManager3";
	rename -uid "A35E20A8-4A92-78AF-5B7E-7FA24BC0E5E6";
createNode renderLayer -n "defaultRenderLayer3";
	rename -uid "C4912F49-407D-03E3-CD7B-6A8B37267548";
	setAttr ".g" yes;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "AF4356A2-4024-BEFE-7658-579D104DD91A";
	setAttr ".def" 0;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -323.80951094248991 -330.95236780151544 ;
	setAttr ".tgi[0].vh" -type "double2" 324.99998708566085 330.95236780151544 ;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "3BED4989-4AB1-CE16-E61C-43AE5D5858EE";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode VRaySettingsNode -s -n "vraySettings";
	rename -uid "5280D5D5-4CE8-0265-EE9F-44A6BE1CC0E9";
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
	rename -uid "066E517A-43BD-2E4C-EB66-4392C86C667A";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "FD2CFEBC-4FC7-224E-D6E9-669681A7A31D";
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
	setAttr -s 13 ".r";
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
connectAttr "C_root_locShape.wp" "C_root_CrvShape.cp[0]";
connectAttr "C_rootExtra_locShape.wp" "C_root_CrvShape.cp[1]";
connectAttr "C_splne1_locShape.wp" "C_root_CrvShape.cp[2]";
connectAttr "C_splne2_locShape.wp" "C_root_CrvShape.cp[3]";
connectAttr "C_chestExtra_locShape.wp" "C_root_CrvShape.cp[4]";
connectAttr "C_chest_locShape.wp" "C_root_CrvShape.cp[5]";
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.ctx" "C_splne2_loc_Grp.tx"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.cty" "C_splne2_loc_Grp.ty"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.ctz" "C_splne2_loc_Grp.tz"
		;
connectAttr "C_splne2_loc_Grp.pim" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "C_splne2_loc_Grp.rp" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.crp"
		;
connectAttr "C_splne2_loc_Grp.rpt" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.crt"
		;
connectAttr "C_root_loc.t" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "C_root_loc.rp" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "C_root_loc.rpt" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "C_root_loc.pm" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.w0" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_chest_loc.t" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "C_chest_loc.rp" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "C_chest_loc.rpt" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "C_chest_loc.pm" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.w1" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne2_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.ctx" "C_splne1_loc_Grp.tx"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.cty" "C_splne1_loc_Grp.ty"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.ctz" "C_splne1_loc_Grp.tz"
		;
connectAttr "C_splne1_loc_Grp.pim" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "C_splne1_loc_Grp.rp" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.crp"
		;
connectAttr "C_splne1_loc_Grp.rpt" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.crt"
		;
connectAttr "C_root_loc.t" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "C_root_loc.rp" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "C_root_loc.rpt" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "C_root_loc.pm" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.w0" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_chest_loc.t" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "C_chest_loc.rp" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "C_chest_loc.rpt" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "C_chest_loc.pm" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.w1" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_splne1_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "C_neckRoot_loc_Grp_parentConstraint1.ctx" "C_neckRoot_loc_Grp.tx";
connectAttr "C_neckRoot_loc_Grp_parentConstraint1.cty" "C_neckRoot_loc_Grp.ty";
connectAttr "C_neckRoot_loc_Grp_parentConstraint1.ctz" "C_neckRoot_loc_Grp.tz";
connectAttr "C_neckRoot_loc_Grp_parentConstraint1.crx" "C_neckRoot_loc_Grp.rx";
connectAttr "C_neckRoot_loc_Grp_parentConstraint1.cry" "C_neckRoot_loc_Grp.ry";
connectAttr "C_neckRoot_loc_Grp_parentConstraint1.crz" "C_neckRoot_loc_Grp.rz";
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
connectAttr "C_neckRoot_loc_Grp.ro" "C_neckRoot_loc_Grp_parentConstraint1.cro";
connectAttr "C_neckRoot_loc_Grp.pim" "C_neckRoot_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "C_neckRoot_loc_Grp.rp" "C_neckRoot_loc_Grp_parentConstraint1.crp";
connectAttr "C_neckRoot_loc_Grp.rpt" "C_neckRoot_loc_Grp_parentConstraint1.crt";
connectAttr "C_chest_loc.t" "C_neckRoot_loc_Grp_parentConstraint1.tg[0].tt";
connectAttr "C_chest_loc.rp" "C_neckRoot_loc_Grp_parentConstraint1.tg[0].trp";
connectAttr "C_chest_loc.rpt" "C_neckRoot_loc_Grp_parentConstraint1.tg[0].trt";
connectAttr "C_chest_loc.r" "C_neckRoot_loc_Grp_parentConstraint1.tg[0].tr";
connectAttr "C_chest_loc.ro" "C_neckRoot_loc_Grp_parentConstraint1.tg[0].tro";
connectAttr "C_chest_loc.s" "C_neckRoot_loc_Grp_parentConstraint1.tg[0].ts";
connectAttr "C_chest_loc.pm" "C_neckRoot_loc_Grp_parentConstraint1.tg[0].tpm";
connectAttr "C_neckRoot_loc_Grp_parentConstraint1.w0" "C_neckRoot_loc_Grp_parentConstraint1.tg[0].tw"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.ctx" "C_chestExtra_loc_Grp.tx"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.cty" "C_chestExtra_loc_Grp.ty"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.ctz" "C_chestExtra_loc_Grp.tz"
		;
connectAttr "C_chestExtra_loc_Grp.pim" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "C_chestExtra_loc_Grp.rp" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.crp"
		;
connectAttr "C_chestExtra_loc_Grp.rpt" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.crt"
		;
connectAttr "C_splne2_loc.t" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "C_splne2_loc.rp" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "C_splne2_loc.rpt" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "C_splne2_loc.pm" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.w0" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_chest_loc.t" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "C_chest_loc.rp" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "C_chest_loc.rpt" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "C_chest_loc.pm" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.w1" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_chestExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.ctx" "C_rootExtra_loc_Grp.tx"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.cty" "C_rootExtra_loc_Grp.ty"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.ctz" "C_rootExtra_loc_Grp.tz"
		;
connectAttr "C_rootExtra_loc_Grp.pim" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "C_rootExtra_loc_Grp.rp" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.crp"
		;
connectAttr "C_rootExtra_loc_Grp.rpt" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.crt"
		;
connectAttr "C_root_loc.t" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "C_root_loc.rp" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "C_root_loc.rpt" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "C_root_loc.pm" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.w0" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_splne1_loc.t" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "C_splne1_loc.rp" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "C_splne1_loc.rpt" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "C_splne1_loc.pm" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.w1" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_rootExtra_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.crx" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp.rx"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.cry" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp.ry"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.crz" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp.rz"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp.pim" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.cpim"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp.t" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.ct"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp.rp" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.crp"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp.rpt" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.crt"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp.ro" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.cro"
		;
connectAttr "C_rootExtra_loc.t" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.tg[0].tt"
		;
connectAttr "C_rootExtra_loc.rp" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.tg[0].trp"
		;
connectAttr "C_rootExtra_loc.rpt" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.tg[0].trt"
		;
connectAttr "C_rootExtra_loc.pm" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.tg[0].tpm"
		;
connectAttr "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.w0" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "C_root_loc.wm" "|C_root_mirror|C_root_loc_Grp|C_root_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.wum"
		;
connectAttr "C_tail1_locShape.wp" "C_tail_CrvShape.cp[0]";
connectAttr "C_tailExtra1_locShape.wp" "C_tail_CrvShape.cp[1]";
connectAttr "C_tail2_locShape.wp" "C_tail_CrvShape.cp[2]";
connectAttr "C_tail3_locShape.wp" "C_tail_CrvShape.cp[3]";
connectAttr "C_tailEndExtra_locShape.wp" "C_tail_CrvShape.cp[4]";
connectAttr "C_tailEnd_locShape.wp" "C_tail_CrvShape.cp[5]";
connectAttr "C_tail_mirror_parentConstraint1.ctx" "C_tail_mirror.tx";
connectAttr "C_tail_mirror_parentConstraint1.cty" "C_tail_mirror.ty";
connectAttr "C_tail_mirror_parentConstraint1.ctz" "C_tail_mirror.tz";
connectAttr "C_tail_mirror_parentConstraint1.crx" "C_tail_mirror.rx";
connectAttr "C_tail_mirror_parentConstraint1.cry" "C_tail_mirror.ry";
connectAttr "C_tail_mirror_parentConstraint1.crz" "C_tail_mirror.rz";
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.ctx" "C_tail3_loc_Grp.tx"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.cty" "C_tail3_loc_Grp.ty"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.ctz" "C_tail3_loc_Grp.tz"
		;
connectAttr "C_tail3_loc_Grp.pim" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "C_tail3_loc_Grp.rp" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.crp"
		;
connectAttr "C_tail3_loc_Grp.rpt" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.crt"
		;
connectAttr "C_tail1_loc.t" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "C_tail1_loc.rp" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "C_tail1_loc.rpt" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "C_tail1_loc.pm" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.w0" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_tailEnd_loc.t" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "C_tailEnd_loc.rp" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "C_tailEnd_loc.rpt" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "C_tailEnd_loc.pm" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.w1" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail3_loc_Grp|C_splne2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.ctx" "C_tail2_loc_Grp.tx"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.cty" "C_tail2_loc_Grp.ty"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.ctz" "C_tail2_loc_Grp.tz"
		;
connectAttr "C_tail2_loc_Grp.pim" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "C_tail2_loc_Grp.rp" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.crp"
		;
connectAttr "C_tail2_loc_Grp.rpt" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.crt"
		;
connectAttr "C_tail1_loc.t" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "C_tail1_loc.rp" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "C_tail1_loc.rpt" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "C_tail1_loc.pm" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.w0" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_tailEnd_loc.t" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "C_tailEnd_loc.rp" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "C_tailEnd_loc.rpt" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "C_tailEnd_loc.pm" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.w1" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tail2_loc_Grp|C_splne1_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.ctx" "C_tailEndExtra_loc_Grp.tx"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.cty" "C_tailEndExtra_loc_Grp.ty"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.ctz" "C_tailEndExtra_loc_Grp.tz"
		;
connectAttr "C_tailEndExtra_loc_Grp.pim" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "C_tailEndExtra_loc_Grp.rp" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.crp"
		;
connectAttr "C_tailEndExtra_loc_Grp.rpt" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.crt"
		;
connectAttr "C_tail3_loc.t" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "C_tail3_loc.rp" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "C_tail3_loc.rpt" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "C_tail3_loc.pm" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.w0" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_tailEnd_loc.t" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "C_tailEnd_loc.rp" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "C_tailEnd_loc.rpt" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "C_tailEnd_loc.pm" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.w1" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailEndExtra_loc_Grp|C_chestExtra_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.ctx" "C_tailExtra1_loc_Grp.tx"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.cty" "C_tailExtra1_loc_Grp.ty"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.ctz" "C_tailExtra1_loc_Grp.tz"
		;
connectAttr "C_tailExtra1_loc_Grp.pim" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "C_tailExtra1_loc_Grp.rp" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.crp"
		;
connectAttr "C_tailExtra1_loc_Grp.rpt" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.crt"
		;
connectAttr "C_tail1_loc.t" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "C_tail1_loc.rp" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "C_tail1_loc.rpt" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "C_tail1_loc.pm" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.w0" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "C_tail2_loc.t" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "C_tail2_loc.rp" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "C_tail2_loc.rpt" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "C_tail2_loc.pm" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.w1" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_tailExtra1_loc_Grp|C_rootExtra_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.crx" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp.rx"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.cry" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp.ry"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.crz" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp.rz"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp.pim" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.cpim"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp.t" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.ct"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp.rp" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.crp"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp.rpt" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.crt"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp.ro" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.cro"
		;
connectAttr "C_tailExtra1_loc.t" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.tg[0].tt"
		;
connectAttr "C_tailExtra1_loc.rp" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.tg[0].trp"
		;
connectAttr "C_tailExtra1_loc.rpt" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.tg[0].trt"
		;
connectAttr "C_tailExtra1_loc.pm" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.tg[0].tpm"
		;
connectAttr "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.w0" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "C_tail1_loc.wm" "|C_tail_mirror|C_tailRoot_loc_Grp|C_tailRoot_loc|C_tail1_loc_Grp|C_tail1_loc|C_root_vector_Grp|C_root_vector_Grp_aimConstraint1.wum"
		;
connectAttr "C_tail_mirror.ro" "C_tail_mirror_parentConstraint1.cro";
connectAttr "C_tail_mirror.pim" "C_tail_mirror_parentConstraint1.cpim";
connectAttr "C_tail_mirror.rp" "C_tail_mirror_parentConstraint1.crp";
connectAttr "C_tail_mirror.rpt" "C_tail_mirror_parentConstraint1.crt";
connectAttr "C_root_loc.t" "C_tail_mirror_parentConstraint1.tg[0].tt";
connectAttr "C_root_loc.rp" "C_tail_mirror_parentConstraint1.tg[0].trp";
connectAttr "C_root_loc.rpt" "C_tail_mirror_parentConstraint1.tg[0].trt";
connectAttr "C_root_loc.r" "C_tail_mirror_parentConstraint1.tg[0].tr";
connectAttr "C_root_loc.ro" "C_tail_mirror_parentConstraint1.tg[0].tro";
connectAttr "C_root_loc.s" "C_tail_mirror_parentConstraint1.tg[0].ts";
connectAttr "C_root_loc.pm" "C_tail_mirror_parentConstraint1.tg[0].tpm";
connectAttr "C_tail_mirror_parentConstraint1.w0" "C_tail_mirror_parentConstraint1.tg[0].tw"
		;
connectAttr "L_hip_locShape.wp" "L_hip_CrvShape.cp[0]";
connectAttr "L_knee_locShape.wp" "L_hip_CrvShape.cp[1]";
connectAttr "L_knee_locShape.wp" "L_knee_CrvShape.cp[0]";
connectAttr "L_ankle_locShape.wp" "L_knee_CrvShape.cp[1]";
connectAttr "L_ankle_locShape.wp" "L_ankle_CrvShape.cp[0]";
connectAttr "L_toeRoot_locShape.wp" "L_ankle_CrvShape.cp[1]";
connectAttr "L_toeRoot_locShape.wp" "L_toeRoot_CrvShape.cp[0]";
connectAttr "L_toe1_locShape.wp" "L_toeRoot_CrvShape.cp[1]";
connectAttr "L_toe1_locShape.wp" "L_toe1_CrvShape.cp[0]";
connectAttr "L_toe2_locShape.wp" "L_toe1_CrvShape.cp[1]";
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
connectAttr "L_toeExtra_loc_Grp_parentConstraint1.ctx" "L_toeExtra_loc_Grp.tx";
connectAttr "L_toeExtra_loc_Grp_parentConstraint1.cty" "L_toeExtra_loc_Grp.ty";
connectAttr "L_toeExtra_loc_Grp_parentConstraint1.ctz" "L_toeExtra_loc_Grp.tz";
connectAttr "L_toeExtra_loc_Grp.ro" "L_toeExtra_loc_Grp_parentConstraint1.cro";
connectAttr "L_toeExtra_loc_Grp.pim" "L_toeExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "L_toeExtra_loc_Grp.rp" "L_toeExtra_loc_Grp_parentConstraint1.crp";
connectAttr "L_toeExtra_loc_Grp.rpt" "L_toeExtra_loc_Grp_parentConstraint1.crt";
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
connectAttr "C_root_loc.t" "L_hip_loc_mirror_parentConstraint1.tg[0].tt";
connectAttr "C_root_loc.rp" "L_hip_loc_mirror_parentConstraint1.tg[0].trp";
connectAttr "C_root_loc.rpt" "L_hip_loc_mirror_parentConstraint1.tg[0].trt";
connectAttr "C_root_loc.r" "L_hip_loc_mirror_parentConstraint1.tg[0].tr";
connectAttr "C_root_loc.ro" "L_hip_loc_mirror_parentConstraint1.tg[0].tro";
connectAttr "C_root_loc.s" "L_hip_loc_mirror_parentConstraint1.tg[0].ts";
connectAttr "C_root_loc.pm" "L_hip_loc_mirror_parentConstraint1.tg[0].tpm";
connectAttr "L_hip_loc_mirror_parentConstraint1.w0" "L_hip_loc_mirror_parentConstraint1.tg[0].tw"
		;
connectAttr "R_hip_locShape.wp" "R_hip_CrvShape.cp[0]";
connectAttr "R_knee_locShape.wp" "R_hip_CrvShape.cp[1]";
connectAttr "R_knee_locShape.wp" "R_knee_CrvShape.cp[0]";
connectAttr "R_ankle_locShape.wp" "R_knee_CrvShape.cp[1]";
connectAttr "R_ankle_locShape.wp" "R_ankle_CrvShape.cp[0]";
connectAttr "R_toeRoot_locShape.wp" "R_ankle_CrvShape.cp[1]";
connectAttr "R_toeRoot_locShape.wp" "R_toeRoot_CrvShape.cp[0]";
connectAttr "R_toe1_locShape.wp" "R_toeRoot_CrvShape.cp[1]";
connectAttr "R_toe1_locShape.wp" "R_toe1_CrvShape.cp[0]";
connectAttr "R_toe2_locShape.wp" "R_toe1_CrvShape.cp[1]";
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
connectAttr "R_toeExtra_loc_Grp_parentConstraint1.ctx" "R_toeExtra_loc_Grp.tx";
connectAttr "R_toeExtra_loc_Grp_parentConstraint1.cty" "R_toeExtra_loc_Grp.ty";
connectAttr "R_toeExtra_loc_Grp_parentConstraint1.ctz" "R_toeExtra_loc_Grp.tz";
connectAttr "R_toeExtra_loc_Grp.ro" "R_toeExtra_loc_Grp_parentConstraint1.cro";
connectAttr "R_toeExtra_loc_Grp.pim" "R_toeExtra_loc_Grp_parentConstraint1.cpim"
		;
connectAttr "R_toeExtra_loc_Grp.rp" "R_toeExtra_loc_Grp_parentConstraint1.crp";
connectAttr "R_toeExtra_loc_Grp.rpt" "R_toeExtra_loc_Grp_parentConstraint1.crt";
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
connectAttr "C_root_loc.t" "R_hip_loc_mirror_parentConstraint1.tg[0].tt";
connectAttr "C_root_loc.rp" "R_hip_loc_mirror_parentConstraint1.tg[0].trp";
connectAttr "C_root_loc.rpt" "R_hip_loc_mirror_parentConstraint1.tg[0].trt";
connectAttr "C_root_loc.r" "R_hip_loc_mirror_parentConstraint1.tg[0].tr";
connectAttr "C_root_loc.ro" "R_hip_loc_mirror_parentConstraint1.tg[0].tro";
connectAttr "C_root_loc.s" "R_hip_loc_mirror_parentConstraint1.tg[0].ts";
connectAttr "C_root_loc.pm" "R_hip_loc_mirror_parentConstraint1.tg[0].tpm";
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
connectAttr "C_chest_loc.t" "L_arm_loc_mirror_parentConstraint1.tg[0].tt";
connectAttr "C_chest_loc.rp" "L_arm_loc_mirror_parentConstraint1.tg[0].trp";
connectAttr "C_chest_loc.rpt" "L_arm_loc_mirror_parentConstraint1.tg[0].trt";
connectAttr "C_chest_loc.r" "L_arm_loc_mirror_parentConstraint1.tg[0].tr";
connectAttr "C_chest_loc.ro" "L_arm_loc_mirror_parentConstraint1.tg[0].tro";
connectAttr "C_chest_loc.s" "L_arm_loc_mirror_parentConstraint1.tg[0].ts";
connectAttr "C_chest_loc.pm" "L_arm_loc_mirror_parentConstraint1.tg[0].tpm";
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
connectAttr "C_chest_loc.t" "R_arm_loc_mirror_parentConstraint1.tg[0].tt";
connectAttr "C_chest_loc.rp" "R_arm_loc_mirror_parentConstraint1.tg[0].trp";
connectAttr "C_chest_loc.rpt" "R_arm_loc_mirror_parentConstraint1.tg[0].trt";
connectAttr "C_chest_loc.r" "R_arm_loc_mirror_parentConstraint1.tg[0].tr";
connectAttr "C_chest_loc.ro" "R_arm_loc_mirror_parentConstraint1.tg[0].tro";
connectAttr "C_chest_loc.s" "R_arm_loc_mirror_parentConstraint1.tg[0].ts";
connectAttr "C_chest_loc.pm" "R_arm_loc_mirror_parentConstraint1.tg[0].tpm";
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
connectAttr "C_head_mirror_parentConstraint1.cty" "C_head_mirror.ty";
connectAttr "C_head_mirror_parentConstraint1.ctz" "C_head_mirror.tz";
connectAttr "C_head_mirror_parentConstraint1.ctx" "C_head_mirror.tx";
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
connectAttr "renderLayerManager7.rlmi[0]" "defaultRenderLayer7.rlid";
connectAttr "renderLayerManager8.rlmi[0]" "defaultRenderLayer8.rlid";
connectAttr "renderLayerManager9.rlmi[0]" "defaultRenderLayer9.rlid";
connectAttr "renderLayerManager10.rlmi[0]" "defaultRenderLayer10.rlid";
connectAttr "renderLayerManager11.rlmi[0]" "defaultRenderLayer11.rlid";
connectAttr "renderLayerManager12.rlmi[0]" "defaultRenderLayer12.rlid";
connectAttr "renderLayerManager5.rlmi[0]" "defaultRenderLayer5.rlid";
connectAttr "renderLayerManager6.rlmi[0]" "defaultRenderLayer6.rlid";
connectAttr "renderLayerManager4.rlmi[0]" "defaultRenderLayer4.rlid";
connectAttr "renderLayerManager1.rlmi[0]" "defaultRenderLayer1.rlid";
connectAttr "renderLayerManager2.rlmi[0]" "defaultRenderLayer2.rlid";
connectAttr "renderLayerManager3.rlmi[0]" "defaultRenderLayer3.rlid";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer7.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer8.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer9.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer10.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer11.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer12.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer5.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer6.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer4.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer1.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer2.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer3.msg" ":defaultRenderingList1.r" -na;
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
// End of guide_quad.ma
