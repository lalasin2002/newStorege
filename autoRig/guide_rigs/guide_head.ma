//Maya ASCII 2022 scene
//Name: guide_head.ma
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
fileInfo "UUID" "98590E4C-4ADB-E72F-3475-EBA4B7397D1F";
createNode transform -s -n "persp";
	rename -uid "E98F2045-41CF-383A-1CE8-38B73E6C7918";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 19.598280737350326 57.21450739303706 2.176466666153495 ;
	setAttr ".r" -type "double3" -26.738352811158961 -5306.9999999996617 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "2AC9D49C-4FB1-6C91-B00F-20B93A1B746F";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 23.447789408019606;
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
	setAttr ".t" -type "double3" 0 53 1001.5061830724211 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "1F3F4646-4467-989E-363D-E69C39687FF9";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 999.50618307242109;
	setAttr ".ow" 31.808910431298589;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" 0 53 2 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "F9C8F567-4683-9354-2706-44B4951E094E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 52.476886020139759 3.5751561672753156 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "296BF61A-4FA3-3103-C3AE-D1B4098E2382";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 36.285319773144465;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
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
	setAttr ".t" -type "double3" 0 51 0 ;
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
	addAttr -ci true -sn "insertJnt" -ln "insertJnt" -min 0 -at "long";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_module" -type "string" "tongue_type";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_part" -type "string" "tongue1";
	setAttr ".rig_index" -type "string" "0";
	setAttr -k on ".insertJnt" 4;
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
createNode lightLinker -s -n "lightLinker1";
	rename -uid "47D67843-490D-D637-1CC8-4B8C7BE6F31A";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "7951B935-49AC-509E-80CF-4C8F61365E9F";
createNode displayLayer -n "defaultLayer";
	rename -uid "287D8167-4032-53EE-4996-8685FE0C83E8";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "099E4BA5-45E4-4A7C-2219-578F58ADEE8D";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "F04BB8FA-4375-B4F3-1D64-59B7C4140232";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager1";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer1";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager4";
	rename -uid "C720C86B-4715-029D-55C6-5B94B6E9551D";
createNode poseInterpolatorManager -n "poseInterpolatorManager4";
	rename -uid "99697D67-446A-CF93-A2DC-ABA91872EAB8";
createNode renderLayerManager -n "renderLayerManager2";
	rename -uid "2204E19E-4CC0-AAF8-3205-5FA0D67F8C04";
createNode renderLayer -n "defaultRenderLayer2";
	rename -uid "6817F74C-491A-16D8-CF48-E1A2A60FB2C6";
	setAttr ".g" yes;
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "AF4356A2-4024-BEFE-7658-579D104DD91A";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -323.80951094248991 -330.95236780151544 ;
	setAttr ".tgi[0].vh" -type "double2" 324.99998708566085 330.95236780151544 ;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "5F23D1AF-4FEC-C5B0-C9DC-2A9B7C781294";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode VRaySettingsNode -s -n "vraySettings";
	rename -uid "2B2A5226-4B06-3005-7492-6498F7B83AC7";
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
	rename -uid "45309369-4118-3A67-7DFF-0999755D315D";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "8ABBC5A7-42B6-8B5B-C0CF-C0BF4E3A0B07";
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
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
// End of guide_head.ma
