//Maya ASCII 2022 scene
//Name: guide_biped_head.ma
//Last modified: Thu, Jul 02, 2026 05:52:27 PM
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
fileInfo "UUID" "C2A10E9F-4787-33F5-C18B-D7B971D9D811";
createNode transform -s -n "persp";
	rename -uid "E98F2045-41CF-383A-1CE8-38B73E6C7918";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 57.733524712115141 64.516527586424885 103.53535766110973 ;
	setAttr ".r" -type "double3" -4.5383528033908815 -5369.7999999993208 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "2AC9D49C-4FB1-6C91-B00F-20B93A1B746F";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 119.93385378589733;
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
createNode transform -n "head_nonParent";
	rename -uid "DFBF6D1F-464F-C1A3-AA12-25B725B8F33E";
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
	setAttr ".rig_boneType" -type "string" "head";
createNode transform -n "jaw_curve" -p "head_nonParent";
	rename -uid "3C3DBD72-464A-CFE6-1F2F-2CBDDAF0E899";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "jaw_curveShape" -p "jaw_curve";
	rename -uid "ADBF1300-414F-28EF-4050-B2B9F902A679";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 50 3
		0 46 7
		;
createNode transform -n "gumA_curve" -p "head_nonParent";
	rename -uid "08EBD2D0-458F-43B0-658B-08B65E0A34FC";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "gumA_curveShape" -p "gumA_curve";
	rename -uid "00260E4F-46FD-528A-8D00-89A6BBEF523A";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 50 3
		0 47 5
		;
createNode transform -n "gumB_curve" -p "head_nonParent";
	rename -uid "A75DDAB8-4838-C7ED-3829-97AEC68C203F";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "gumB_curveShape" -p "gumB_curve";
	rename -uid "BEEAED49-4FD9-7F05-2A16-B2B8671E3F8C";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 50 3
		0 50 5
		;
createNode transform -n "tongue_curve" -p "head_nonParent";
	rename -uid "89AE2CF8-4705-3DB5-1405-789112FFC9EE";
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
	setAttr ".rig_boneType" -type "string" "tongue";
createNode nurbsCurve -n "tongue_curveShape" -p "tongue_curve";
	rename -uid "0460F4A7-48FD-D574-FAEC-B58F0A8FC4DB";
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
		0 47 3
		0 47.583717346191406 3.2839615345001221
		0 48.892116546630859 4.2496929168701172
		0 49.095920562744141 6.0671091079711914
		0 49 7
		;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "tongue";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "tongue";
createNode transform -n "tonguePivot_curve" -p "head_nonParent";
	rename -uid "9182B155-4B0C-0B63-6C34-1E926D18EFD3";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "tonguePivot_curveShape" -p "tonguePivot_curve";
	rename -uid "9EA978F8-4423-2A5E-7D17-5AA3E07C8414";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		0 47 3
		0 47 4
		;
createNode transform -n "L_eye_curve" -p "head_nonParent";
	rename -uid "A7F33E77-4FBE-7EED-2169-68A36404F8F7";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_eye_curveShape" -p "L_eye_curve";
	rename -uid "0D0E8445-4283-F650-6D58-D39CCF17040F";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		3 57 5
		3 57 7
		;
createNode transform -n "L_eyeAim_curve" -p "head_nonParent";
	rename -uid "7030D39D-4C14-3A29-3FD9-0FA73870B019";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "L_eyeAim_curveShape" -p "L_eyeAim_curve";
	rename -uid "0D92346D-4DDD-22B9-AD3B-30A0F009295A";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		3 57 5
		3 57 17
		;
createNode transform -n "R_eye_curve" -p "head_nonParent";
	rename -uid "C393A567-4483-7552-003C-93AF10C00430";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_eye_curveShape" -p "R_eye_curve";
	rename -uid "4CF1FD1F-482B-6150-BFCD-D7B379B5BAB6";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-3 57 5
		-3.0000000000000004 57 7
		;
createNode transform -n "R_eyeAim_curve" -p "head_nonParent";
	rename -uid "169376A7-46EF-03C4-C805-2085C45CEABC";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode nurbsCurve -n "R_eyeAim_curveShape" -p "R_eyeAim_curve";
	rename -uid "10F73813-42F8-5AF8-31DA-A998016583C4";
	setAttr -k off ".v";
	setAttr -s 2 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 1 0 no 3
		2 0 1
		2
		-3 57 5
		-3.0000000000000018 56.999999999999993 17
		;
createNode transform -n "head_mirror";
	rename -uid "116BCB00-4548-DA54-E31C-5281DCDA8144";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".t" -type "double3" 0 52 0 ;
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "head";
createNode transform -n "head_loc_Grp" -p "head_mirror";
	rename -uid "697DF30F-40EE-EC37-8D56-5EAE25547DAA";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".rig_side" -type "string" "C";
	setAttr ".rig_type" -type "string" "bipad";
	setAttr ".rig_part" -type "string" "rootPoint";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "head";
createNode transform -n "head_loc" -p "head_loc_Grp";
	rename -uid "C66652FA-45D2-9DF9-3CA4-02AA06D0AE69";
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
	setAttr ".rig_boneType" -type "string" "head";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "head_locShape" -p "head_loc";
	rename -uid "9A13C833-41E9-6B30-7FF4-6E887B5DDF5B";
	setAttr -k off ".v";
createNode transform -n "headA_loc_Grp" -p "head_loc";
	rename -uid "4CFA9AE1-42AB-0C5B-68BB-C897E813B492";
	setAttr ".t" -type "double3" 0 -1 2 ;
createNode transform -n "headA_loc" -p "headA_loc_Grp";
	rename -uid "9C194239-4F17-BB1A-CDDA-7F826A2999EC";
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
	setAttr ".rig_boneType" -type "string" "head";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "headA_locShape" -p "headA_loc";
	rename -uid "AEE90977-4836-386D-3EEF-52ADBA0F5916";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "jaw_loc_Grp" -p "headA_loc";
	rename -uid "601272FA-4CCF-926C-31EC-5E8C9C43D598";
	setAttr ".t" -type "double3" 0 -1 1 ;
createNode transform -n "jaw_loc" -p "jaw_loc_Grp";
	rename -uid "46260178-4FEF-22B3-4C80-45A2D46199B2";
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
	setAttr ".rig_boneType" -type "string" "jaw";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "jaw_locShape" -p "jaw_loc";
	rename -uid "1ABAA8B6-479D-5F37-6CF3-FA8CA4C96FE7";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "jawEnd_loc_Grp" -p "jaw_loc";
	rename -uid "C3C010B9-4EBE-B148-13E0-6B94CA6BEDE5";
	setAttr ".t" -type "double3" 0 -4 4 ;
createNode transform -n "jawEnd_loc" -p "jawEnd_loc_Grp";
	rename -uid "DEE0C1CA-45CC-0960-2815-27A56B0C6F43";
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
	setAttr ".rig_boneType" -type "string" "jaw";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "jawEnd_locShape" -p "jawEnd_loc";
	rename -uid "5518C222-43B1-8CFD-4658-0A8576FDBACC";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "gumA_loc_Grp" -p "headA_loc";
	rename -uid "E76120A6-4C00-C6CC-3916-A6BAD629B859";
	setAttr ".t" -type "double3" 0 -4 3 ;
createNode transform -n "gumA_loc" -p "gumA_loc_Grp";
	rename -uid "28ED228B-4919-CEA7-5EFB-BC9D524ED4B0";
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
	setAttr ".rig_boneType" -type "string" "gum";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "gumA_locShape" -p "gumA_loc";
	rename -uid "2163D27A-48C0-B135-0A6B-4597A0968C10";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "gumB_loc_Grp" -p "headA_loc";
	rename -uid "ABA60107-41ED-CA5F-10F7-829BB1DDD6D8";
	setAttr ".t" -type "double3" 0 -1 3 ;
createNode transform -n "gumB_loc" -p "gumB_loc_Grp";
	rename -uid "A39605EE-4F6B-1F37-BD51-4E8DC26D42F4";
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
	setAttr ".rig_boneType" -type "string" "gum";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "gumB_locShape" -p "gumB_loc";
	rename -uid "5B0EFCD2-4A31-B584-F981-DA9D3AF8809D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "tongue1_loc_Grp" -p "headA_loc";
	rename -uid "AC21133F-40C0-12F2-75DA-85B944D9E5EB";
	setAttr ".t" -type "double3" 0 -4 1 ;
createNode transform -n "tongue1_loc" -p "tongue1_loc_Grp";
	rename -uid "D6DAD678-4D2D-7C5F-54F0-E580845A0285";
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
	setAttr ".rig_boneType" -type "string" "tongue";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "tongue1_locShape" -p "tongue1_loc";
	rename -uid "5B1BDC9E-4B86-2365-24EA-79A1C9EFCCB8";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "tongueExtra1_loc_Grp" -p "headA_loc";
	rename -uid "41A7E02A-4A05-FC66-B850-45B68BE638FD";
createNode transform -n "tongueExtra1_loc" -p "tongueExtra1_loc_Grp";
	rename -uid "63C7B3A1-4E5D-EC1C-EB44-BD8C8992624C";
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
	setAttr ".rig_boneType" -type "string" "tongue";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "tongueExtra1_locShape" -p "tongueExtra1_loc";
	rename -uid "9E84A507-4149-7D4A-7EC9-CA86AB101638";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode pointConstraint -n "tongueExtra1_loc_Grp_pointConstraint1" -p "tongueExtra1_loc_Grp";
	rename -uid "7A05E229-4FAD-7AAF-57A6-B39FC7111F9C";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "tongue1_locW0" -dv 1 -min 0 -at "double";
	addAttr -dcb 0 -ci true -k true -sn "w1" -ln "tongue2_locW1" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
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
	setAttr -k on ".w0" 0.716;
	setAttr -k on ".w1" 0.284;
createNode transform -n "tongue2_loc_Grp" -p "headA_loc";
	rename -uid "6A89CB33-411D-CBF3-BD63-498EF839B736";
createNode transform -n "tongue2_loc" -p "tongue2_loc_Grp";
	rename -uid "272E4E15-4F2C-E3F4-9329-B1AE28042D1B";
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
	setAttr ".rig_boneType" -type "string" "tongue";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "tongue2_locShape" -p "tongue2_loc";
	rename -uid "23E0C5C7-40D9-64AA-D96F-8A8677AC6218";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "tongue2_loc_Grp_pointConstraint1" -p "tongue2_loc_Grp";
	rename -uid "EC6F2BEF-43BA-7D9E-AE7F-EFB2D9F60637";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "tongue1_locW0" -dv 1 -min 0 -at "double";
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
	setAttr ".o" -type "double3" 0 0.89211654663085938 -0.75030708312988281 ;
	setAttr ".rst" -type "double3" 0 48.892116546630859 4.2496929168701172 ;
	setAttr -k on ".w0";
	setAttr -k on ".w1";
createNode transform -n "tongueExtra2_loc_Grp" -p "headA_loc";
	rename -uid "978152B5-419E-C90D-18AA-AFB5C84C91DE";
createNode transform -n "tongueExtra2_loc" -p "tongueExtra2_loc_Grp";
	rename -uid "288295ED-4E70-4FF9-606A-85A386D88B15";
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
	setAttr ".rig_boneType" -type "string" "tongue";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "tongueExtra2_locShape" -p "tongueExtra2_loc";
	rename -uid "A027BB62-428A-6770-C19D-E7B8BFCF8C9B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode pointConstraint -n "tongueExtra2_loc_Grp_pointConstraint1" -p "tongueExtra2_loc_Grp";
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
createNode transform -n "tongue3_loc_Grp" -p "headA_loc";
	rename -uid "1535472A-43E5-CB52-8015-E58E908FAA4F";
	setAttr ".t" -type "double3" 0 -2 5 ;
createNode transform -n "tongue3_loc" -p "tongue3_loc_Grp";
	rename -uid "A8FA8911-4CDA-7E83-596C-7ABD986C3FE0";
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
	setAttr ".rig_boneType" -type "string" "tongue";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "tongue3_locShape" -p "tongue3_loc";
	rename -uid "CF707034-4E80-83FA-2986-B581B6A97CCC";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "tonguePivot_loc_Grp" -p "headA_loc";
	rename -uid "4E77A0E2-449C-086D-2B15-ECA76B55C225";
	setAttr ".t" -type "double3" 0 -4 2 ;
createNode transform -n "tonguePivot_loc" -p "tonguePivot_loc_Grp";
	rename -uid "694E1A88-427C-8FC5-BF98-0F9D7D42CE15";
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
	setAttr ".rig_boneType" -type "string" "tongue";
createNode locator -n "tonguePivot_locShape" -p "tonguePivot_loc";
	rename -uid "9B8DC118-44FF-772C-BE88-2E94A30584A5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "headB_loc_Grp" -p "head_loc";
	rename -uid "7118DA4C-40B9-AC0F-C265-D7BEAD1A58A0";
	setAttr ".t" -type "double3" 0 1 2 ;
createNode transform -n "headB_loc" -p "headB_loc_Grp";
	rename -uid "98D666F6-4BF7-9F53-CEC8-0F9D22470A65";
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
	setAttr ".rig_boneType" -type "string" "head";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "headB_locShape" -p "headB_loc";
	rename -uid "2DA468A1-43D4-BF8B-8E33-1BA22FE23645";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_eyeRoot_mirror" -p "headB_loc";
	rename -uid "D395B4E7-4EE7-EA30-DDF3-969281878DB8";
	setAttr ".t" -type "double3" 3 4 3 ;
createNode transform -n "L_eyeRoot_loc_Grp" -p "L_eyeRoot_mirror";
	rename -uid "8ED5B874-4B4F-B5A4-1B99-8DB0F4745568";
createNode transform -n "L_eyeRoot_loc" -p "L_eyeRoot_loc_Grp";
	rename -uid "3B82F5B4-4B9E-A4C9-C7FA-469BE5D9A97A";
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
	setAttr ".rig_boneType" -type "string" "eye";
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
	setAttr ".rig_boneType" -type "string" "eye";
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
	setAttr ".rig_boneType" -type "string" "eye";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_eyeEnd_locShape" -p "L_eyeEnd_loc";
	rename -uid "FF359782-4B66-CE99-2CDA-1BA8928A2CDB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_eyeAim_loc_Grp" -p "L_eyeRoot_mirror";
	rename -uid "809A6140-4B85-81BD-ECEC-2AA7874DF9CD";
createNode transform -n "L_eyeAim_loc" -p "L_eyeAim_loc_Grp";
	rename -uid "EFF7745B-4663-66AF-BF8C-CC8574CB3A99";
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
	setAttr ".rig_boneType" -type "string" "eye";
createNode locator -n "L_eyeAim_locShape" -p "L_eyeAim_loc";
	rename -uid "CB892573-4D2C-3894-A53D-D8B1023E8897";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_eyeAim_loc_Grp_parentConstraint1" -p "L_eyeAim_loc_Grp";
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
createNode transform -n "R_eyeRoot_mirror" -p "headB_loc";
	rename -uid "D672C0FA-41EA-D297-CE0E-7083802A3E04";
	setAttr ".t" -type "double3" -3 4 3 ;
	setAttr ".r" -type "double3" 0 180 0 ;
	setAttr ".s" -type "double3" 1 1 -1 ;
createNode transform -n "R_eyeRoot_loc_Grp" -p "R_eyeRoot_mirror";
	rename -uid "F350749C-4F6F-C1D5-9503-F3B2A2FDEE1F";
createNode transform -n "R_eyeRoot_loc" -p "R_eyeRoot_loc_Grp";
	rename -uid "16A3BAA4-4328-E12E-DFA2-AB91DE8F89CD";
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
	setAttr ".rig_boneType" -type "string" "eye";
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
	setAttr ".rig_boneType" -type "string" "eye";
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
	setAttr ".rig_boneType" -type "string" "eye";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_eyeEnd_locShape" -p "R_eyeEnd_loc";
	rename -uid "CA59C4FC-4ED1-FCF2-5C3A-BCA49195C645";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_eyeAim_loc_Grp" -p "R_eyeRoot_mirror";
	rename -uid "3AF10459-43BC-75F4-DB40-B0850D499D36";
createNode transform -n "R_eyeAim_loc" -p "R_eyeAim_loc_Grp";
	rename -uid "BAD066EC-42FC-22B7-CF1F-CEA9C126D14B";
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
	setAttr ".rig_boneType" -type "string" "eye";
createNode locator -n "R_eyeAim_locShape" -p "R_eyeAim_loc";
	rename -uid "72017155-4B15-A49A-AB56-D58AB734B052";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_eyeAim_loc_Grp_parentConstraint1" -p "R_eyeAim_loc_Grp";
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
createNode transform -n "C_eye_loc_Grp" -p "headB_loc";
	rename -uid "BA9E44E2-4C24-E177-37D8-1390ECB39A33";
	setAttr ".t" -type "double3" -6.6613381477509392e-16 4 15 ;
createNode transform -n "C_eye_loc" -p "C_eye_loc_Grp";
	rename -uid "19DA1137-4390-869A-0E24-6B8A5DBE34FC";
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
	setAttr ".rig_boneType" -type "string" "eye";
createNode locator -n "C_eye_locShape" -p "C_eye_loc";
	rename -uid "2C5DB658-4BB2-7B3C-F927-A2A4F6745520";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "nose_loc_Grp" -p "headB_loc";
	rename -uid "EC6C8CB3-4EE5-B94F-C9C9-FC9750EC72CF";
	setAttr ".t" -type "double3" 0 -1 5 ;
createNode transform -n "nose_loc" -p "nose_loc_Grp";
	rename -uid "360901FE-4599-71F0-E3C3-2093227B9E32";
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
	setAttr ".rig_boneType" -type "string" "head";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "nose_locShape" -p "nose_loc";
	rename -uid "7856DF80-4E02-322C-7B1F-8E9A3EB09236";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "9995B0DE-4156-8CB5-F020-3580DFBF75AF";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "94F8DC4A-466B-B31E-1FAB-2FA5C69276B3";
createNode displayLayer -n "defaultLayer";
	rename -uid "287D8167-4032-53EE-4996-8685FE0C83E8";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "957EFCD5-4787-429B-5570-0C99FB98F295";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "F04BB8FA-4375-B4F3-1D64-59B7C4140232";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager1";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer1";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager3";
	rename -uid "30AE98B8-4545-8AA3-FCE8-B89BDD4908B6";
createNode poseInterpolatorManager -n "poseInterpolatorManager3";
	rename -uid "787BCF0D-466B-CA70-2779-2D96BC55D04F";
createNode renderLayerManager -n "renderLayerManager2";
	rename -uid "2204E19E-4CC0-AAF8-3205-5FA0D67F8C04";
createNode renderLayer -n "defaultRenderLayer2";
	rename -uid "6817F74C-491A-16D8-CF48-E1A2A60FB2C6";
	setAttr ".g" yes;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "F74FC9A8-4D9C-4F5C-72AA-70B09EDBCAFC";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode VRaySettingsNode -s -n "vraySettings";
	rename -uid "3CBA42DF-44F0-F4C3-74B8-B39748ADA662";
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
	setAttr ".mSceneName" -type "string" "D:/Code/MayaCode/autoRig/guide_rigs/guide_biped_head.ma";
	setAttr ".rt_cpuRayBundleSize" 4;
	setAttr ".rt_gpuRayBundleSize" 128;
	setAttr ".rt_maxPaths" 10000;
	setAttr ".rt_engineType" 3;
	setAttr ".rt_gpuResizeTextures" 0;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "A69D5340-4339-9FCD-AF43-5796905A317C";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 936\n            -height 524\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 935\n            -height 524\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 936\n            -height 524\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"|persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
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
		+ "\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -connectionMinSegment 0.03\n                -connectionOffset 0.03\n                -connectionRoundness 0.8\n                -connectionTension -100\n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n"
		+ "                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n"
		+ "                -connectionStyle \"bezier\" \n                -connectionMinSegment 0.03\n                -connectionOffset 0.03\n                -connectionRoundness 0.8\n                -connectionTension -100\n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1678\\n    -height 1092\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1678\\n    -height 1092\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 52 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "2CFF9011-4CFE-7088-5294-56B29E796F13";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "8C6022AD-42A3-409D-24AE-75B2C0BF5A5E";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -906.86557327512969 -150.23552365312997 ;
	setAttr ".tgi[0].vh" -type "double2" 171.07330938302638 391.87965371483386 ;
	setAttr -s 58 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -421.42855834960938;
	setAttr ".tgi[0].ni[0].y" -2445.71435546875;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" -461.42855834960938;
	setAttr ".tgi[0].ni[1].y" 154.28572082519531;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" -461.42855834960938;
	setAttr ".tgi[0].ni[2].y" 90;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" -461.42855834960938;
	setAttr ".tgi[0].ni[3].y" 24.285715103149414;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" -801.4285888671875;
	setAttr ".tgi[0].ni[4].y" 155.71427917480469;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" -122.85713958740234;
	setAttr ".tgi[0].ni[5].y" 205.71427917480469;
	setAttr ".tgi[0].ni[5].nvs" 18304;
	setAttr ".tgi[0].ni[6].x" -461.42855834960938;
	setAttr ".tgi[0].ni[6].y" 284.28570556640625;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[0].ni[7].x" -122.85713958740234;
	setAttr ".tgi[0].ni[7].y" 205.71427917480469;
	setAttr ".tgi[0].ni[7].nvs" 18304;
	setAttr ".tgi[0].ni[8].x" -461.42855834960938;
	setAttr ".tgi[0].ni[8].y" 90;
	setAttr ".tgi[0].ni[8].nvs" 18304;
	setAttr ".tgi[0].ni[9].x" -308.57144165039062;
	setAttr ".tgi[0].ni[9].y" -714.28570556640625;
	setAttr ".tgi[0].ni[9].nvs" 18304;
	setAttr ".tgi[0].ni[10].x" -461.42855834960938;
	setAttr ".tgi[0].ni[10].y" -235.71427917480469;
	setAttr ".tgi[0].ni[10].nvs" 18304;
	setAttr ".tgi[0].ni[11].x" -615.71429443359375;
	setAttr ".tgi[0].ni[11].y" 1197.142822265625;
	setAttr ".tgi[0].ni[11].nvs" 18304;
	setAttr ".tgi[0].ni[12].x" -308.57144165039062;
	setAttr ".tgi[0].ni[12].y" -562.85711669921875;
	setAttr ".tgi[0].ni[12].nvs" 18304;
	setAttr ".tgi[0].ni[13].x" -308.57144165039062;
	setAttr ".tgi[0].ni[13].y" 1135.7142333984375;
	setAttr ".tgi[0].ni[13].nvs" 18304;
	setAttr ".tgi[0].ni[14].x" -461.42855834960938;
	setAttr ".tgi[0].ni[14].y" 90;
	setAttr ".tgi[0].ni[14].nvs" 18304;
	setAttr ".tgi[0].ni[15].x" -615.71429443359375;
	setAttr ".tgi[0].ni[15].y" 1074.2857666015625;
	setAttr ".tgi[0].ni[15].nvs" 18304;
	setAttr ".tgi[0].ni[16].x" -308.57144165039062;
	setAttr ".tgi[0].ni[16].y" -411.42855834960938;
	setAttr ".tgi[0].ni[16].nvs" 18304;
	setAttr ".tgi[0].ni[17].x" -308.57144165039062;
	setAttr ".tgi[0].ni[17].y" -260;
	setAttr ".tgi[0].ni[17].nvs" 18304;
	setAttr ".tgi[0].ni[18].x" -308.57144165039062;
	setAttr ".tgi[0].ni[18].y" -108.57142639160156;
	setAttr ".tgi[0].ni[18].nvs" 18304;
	setAttr ".tgi[0].ni[19].x" -308.57144165039062;
	setAttr ".tgi[0].ni[19].y" 42.857143402099609;
	setAttr ".tgi[0].ni[19].nvs" 18304;
	setAttr ".tgi[0].ni[20].x" -308.57144165039062;
	setAttr ".tgi[0].ni[20].y" 194.28572082519531;
	setAttr ".tgi[0].ni[20].nvs" 18304;
	setAttr ".tgi[0].ni[21].x" -308.57144165039062;
	setAttr ".tgi[0].ni[21].y" 345.71429443359375;
	setAttr ".tgi[0].ni[21].nvs" 18304;
	setAttr ".tgi[0].ni[22].x" -308.57144165039062;
	setAttr ".tgi[0].ni[22].y" 497.14285278320312;
	setAttr ".tgi[0].ni[22].nvs" 18304;
	setAttr ".tgi[0].ni[23].x" -461.42855834960938;
	setAttr ".tgi[0].ni[23].y" 220;
	setAttr ".tgi[0].ni[23].nvs" 18304;
	setAttr ".tgi[0].ni[24].x" -615.71429443359375;
	setAttr ".tgi[0].ni[24].y" 154.28572082519531;
	setAttr ".tgi[0].ni[24].nvs" 18304;
	setAttr ".tgi[0].ni[25].x" -461.42855834960938;
	setAttr ".tgi[0].ni[25].y" 220;
	setAttr ".tgi[0].ni[25].nvs" 18304;
	setAttr ".tgi[0].ni[26].x" -308.57144165039062;
	setAttr ".tgi[0].ni[26].y" 1012.8571166992188;
	setAttr ".tgi[0].ni[26].nvs" 18304;
	setAttr ".tgi[0].ni[27].x" -308.57144165039062;
	setAttr ".tgi[0].ni[27].y" 800;
	setAttr ".tgi[0].ni[27].nvs" 18304;
	setAttr ".tgi[0].ni[28].x" -615.71429443359375;
	setAttr ".tgi[0].ni[28].y" 951.4285888671875;
	setAttr ".tgi[0].ni[28].nvs" 18304;
	setAttr ".tgi[0].ni[29].x" -377.14285278320312;
	setAttr ".tgi[0].ni[29].y" 197.14285278320312;
	setAttr ".tgi[0].ni[29].nvs" 18304;
	setAttr ".tgi[0].ni[30].x" -709.0172119140625;
	setAttr ".tgi[0].ni[30].y" 786.95306396484375;
	setAttr ".tgi[0].ni[30].nvs" 18306;
	setAttr ".tgi[0].ni[31].x" 203.57142639160156;
	setAttr ".tgi[0].ni[31].y" 45.714282989501953;
	setAttr ".tgi[0].ni[31].nvs" 18304;
	setAttr ".tgi[0].ni[32].x" -874.6346435546875;
	setAttr ".tgi[0].ni[32].y" 518.26611328125;
	setAttr ".tgi[0].ni[32].nvs" 18306;
	setAttr ".tgi[0].ni[33].x" -1061.446533203125;
	setAttr ".tgi[0].ni[33].y" 200.05255126953125;
	setAttr ".tgi[0].ni[33].nvs" 18306;
	setAttr ".tgi[0].ni[34].x" -962.88018798828125;
	setAttr ".tgi[0].ni[34].y" 278.67218017578125;
	setAttr ".tgi[0].ni[34].nvs" 18306;
	setAttr ".tgi[0].ni[35].x" -580.14898681640625;
	setAttr ".tgi[0].ni[35].y" 385.60345458984375;
	setAttr ".tgi[0].ni[35].nvs" 18306;
	setAttr ".tgi[0].ni[36].x" -115.57749938964844;
	setAttr ".tgi[0].ni[36].y" 696.9056396484375;
	setAttr ".tgi[0].ni[36].nvs" 18306;
	setAttr ".tgi[0].ni[37].x" -127.14286041259766;
	setAttr ".tgi[0].ni[37].y" -48.571430206298828;
	setAttr ".tgi[0].ni[37].nvs" 18304;
	setAttr ".tgi[0].ni[38].x" -494.28570556640625;
	setAttr ".tgi[0].ni[38].y" 104.28571319580078;
	setAttr ".tgi[0].ni[38].nvs" 18304;
	setAttr ".tgi[0].ni[39].x" -461.42855834960938;
	setAttr ".tgi[0].ni[39].y" 90;
	setAttr ".tgi[0].ni[39].nvs" 18304;
	setAttr ".tgi[0].ni[40].x" -461.42855834960938;
	setAttr ".tgi[0].ni[40].y" 154.28572082519531;
	setAttr ".tgi[0].ni[40].nvs" 18304;
	setAttr ".tgi[0].ni[41].x" -461.42855834960938;
	setAttr ".tgi[0].ni[41].y" 90;
	setAttr ".tgi[0].ni[41].nvs" 18304;
	setAttr ".tgi[0].ni[42].x" -494.28570556640625;
	setAttr ".tgi[0].ni[42].y" 205.71427917480469;
	setAttr ".tgi[0].ni[42].nvs" 18304;
	setAttr ".tgi[0].ni[43].x" -461.42855834960938;
	setAttr ".tgi[0].ni[43].y" 90;
	setAttr ".tgi[0].ni[43].nvs" 18304;
	setAttr ".tgi[0].ni[44].x" -697.14288330078125;
	setAttr ".tgi[0].ni[44].y" -68.571426391601562;
	setAttr ".tgi[0].ni[44].nvs" 18304;
	setAttr ".tgi[0].ni[45].x" -432.85714721679688;
	setAttr ".tgi[0].ni[45].y" -68.571426391601562;
	setAttr ".tgi[0].ni[45].nvs" 18304;
	setAttr ".tgi[0].ni[46].x" -461.42855834960938;
	setAttr ".tgi[0].ni[46].y" 90;
	setAttr ".tgi[0].ni[46].nvs" 18304;
	setAttr ".tgi[0].ni[47].x" -461.42855834960938;
	setAttr ".tgi[0].ni[47].y" 220;
	setAttr ".tgi[0].ni[47].nvs" 18304;
	setAttr ".tgi[0].ni[48].x" -461.42855834960938;
	setAttr ".tgi[0].ni[48].y" 90;
	setAttr ".tgi[0].ni[48].nvs" 18304;
	setAttr ".tgi[0].ni[49].x" -461.42855834960938;
	setAttr ".tgi[0].ni[49].y" 220;
	setAttr ".tgi[0].ni[49].nvs" 18304;
	setAttr ".tgi[0].ni[50].x" -461.42855834960938;
	setAttr ".tgi[0].ni[50].y" 220;
	setAttr ".tgi[0].ni[50].nvs" 18304;
	setAttr ".tgi[0].ni[51].x" -461.42855834960938;
	setAttr ".tgi[0].ni[51].y" 220;
	setAttr ".tgi[0].ni[51].nvs" 18304;
	setAttr ".tgi[0].ni[52].x" -461.42855834960938;
	setAttr ".tgi[0].ni[52].y" 220;
	setAttr ".tgi[0].ni[52].nvs" 18304;
	setAttr ".tgi[0].ni[53].x" -461.42855834960938;
	setAttr ".tgi[0].ni[53].y" 90;
	setAttr ".tgi[0].ni[53].nvs" 18304;
	setAttr ".tgi[0].ni[54].x" -615.71429443359375;
	setAttr ".tgi[0].ni[54].y" 52.857143402099609;
	setAttr ".tgi[0].ni[54].nvs" 18304;
	setAttr ".tgi[0].ni[55].x" -461.42855834960938;
	setAttr ".tgi[0].ni[55].y" 220;
	setAttr ".tgi[0].ni[55].nvs" 18304;
	setAttr ".tgi[0].ni[56].x" -461.42855834960938;
	setAttr ".tgi[0].ni[56].y" 90;
	setAttr ".tgi[0].ni[56].nvs" 18304;
	setAttr ".tgi[0].ni[57].x" -122.85713958740234;
	setAttr ".tgi[0].ni[57].y" 104.28571319580078;
	setAttr ".tgi[0].ni[57].nvs" 18304;
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
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "renderLayerManager1.rlmi[0]" "defaultRenderLayer1.rlid";
connectAttr "renderLayerManager2.rlmi[0]" "defaultRenderLayer2.rlid";
connectAttr "head_mirror.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn";
connectAttr "head_nonParent.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "C_eye_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn";
connectAttr "L_eyeRoot_loc_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "C_eye_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn";
connectAttr "L_eyeEnd_loc_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn"
		;
connectAttr "L_eye_loc_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn";
connectAttr "R_eyeAim_loc_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn"
		;
connectAttr "tonguePivot_curve.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn"
		;
connectAttr "R_eyeRoot_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn";
connectAttr "L_eyeRoot_mirror.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn"
		;
connectAttr "R_eyeEnd_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn"
		;
connectAttr "R_eyeRoot_mirror.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn"
		;
connectAttr "R_eye_curveShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[13].dn"
		;
connectAttr "L_eye_curveShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[14].dn"
		;
connectAttr "R_eye_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[15].dn";
connectAttr "R_eyeAim_curve.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[16].dn";
connectAttr "R_eye_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[17].dn";
connectAttr "R_eyeEnd_loc_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[18].dn"
		;
connectAttr "R_eyeRoot_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[19].dn"
		;
connectAttr "R_eye_loc_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[20].dn";
connectAttr "R_eyeEnd_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[21].dn";
connectAttr "R_eye_curve.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[22].dn";
connectAttr "L_eye_curve.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[23].dn";
connectAttr "R_eyeAim_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[24].dn";
connectAttr "tonguePivot_curveShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[25].dn"
		;
connectAttr "R_eyeAim_curveShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[26].dn"
		;
connectAttr "R_eyeRoot_loc_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[27].dn"
		;
connectAttr "R_eyeAim_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[28].dn"
		;
connectAttr "tongue2_loc_Grp_pointConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[29].dn"
		;
connectAttr "tongue1_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[30].dn"
		;
connectAttr "tongue_curve.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[31].dn";
connectAttr "tongueExtra1_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[32].dn"
		;
connectAttr "tongue2_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[33].dn"
		;
connectAttr "tongueExtra2_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[34].dn"
		;
connectAttr "tongue3_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[35].dn"
		;
connectAttr "tongue_curveShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[36].dn"
		;
connectAttr "tongueExtra2_loc_Grp_pointConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[37].dn"
		;
connectAttr "L_eyeAim_loc_Grp_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[38].dn"
		;
connectAttr "tonguePivot_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[39].dn"
		;
connectAttr "C_eye_loc_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[40].dn";
connectAttr "head_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[41].dn";
connectAttr "R_eyeAim_loc_Grp_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[42].dn"
		;
connectAttr "L_eyeEnd_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[43].dn";
connectAttr "tonguePivot_loc_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[44].dn"
		;
connectAttr "tongueExtra1_loc_Grp_pointConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[45].dn"
		;
connectAttr "L_eye_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[46].dn";
connectAttr "tonguePivot_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[47].dn"
		;
connectAttr "L_eyeRoot_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[48].dn";
connectAttr "L_eye_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[49].dn";
connectAttr "L_eyeRoot_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[50].dn"
		;
connectAttr "L_eyeEnd_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[51].dn"
		;
connectAttr "head_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[52].dn";
connectAttr "L_eyeAim_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[53].dn"
		;
connectAttr "L_eyeAim_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[54].dn";
connectAttr "L_eyeAim_curve.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[55].dn";
connectAttr "L_eyeAim_curveShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[56].dn"
		;
connectAttr "L_eyeAim_loc_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[57].dn"
		;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer1.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer2.msg" ":defaultRenderingList1.r" -na;
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
// End of guide_biped_head.ma
