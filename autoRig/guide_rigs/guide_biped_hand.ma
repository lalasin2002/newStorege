//Maya ASCII 2022 scene
//Name: guide_biped_hand.ma
//Last modified: Tue, Jun 30, 2026 04:59:46 PM
//Codeset: 949
requires maya "2022";
requires -nodeType "RedshiftOptions" -nodeType "RedshiftPostEffects" "redshift4maya" "3.5.07";
requires "stereoCamera" "10.0";
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
fileInfo "UUID" "70EB0BE9-4D65-2ED4-47FA-CDB0FB1BC4FA";
createNode transform -s -n "persp";
	rename -uid "5BF5815E-40EB-4064-2CDC-0785A99AF1D0";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 6.2637132198493575 41.915210824211066 35.473473700487062 ;
	setAttr ".r" -type "double3" -48.338352729754355 -370.59999999999883 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "1EE6F488-4BE5-D228-D58E-B6B75CB30949";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 54.962500396267693;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "488920C8-45E0-5FD0-0501-A5B1BA7358BF";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "F34EE7B3-4867-DDF7-CABA-5FB5676165BC";
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
	rename -uid "69A85285-4746-CE1D-4DAE-D88A3530C1C2";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "20C5C638-474C-7515-3349-E18C93AA77BC";
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
	rename -uid "FC10411F-4C32-443E-B5AB-9197C406A983";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "31E8E1DE-4405-9C3D-72B5-4DA6CAA4D956";
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
createNode transform -n "Guide_hand_nonParant";
	rename -uid "1EA4828C-4656-DD48-5007-0582972769BC";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "nonParent";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "hand";
createNode transform -n "Guide_index_Crv" -p "Guide_hand_nonParant";
	rename -uid "A5DD3C67-4B0F-F4CC-1FE1-688ADAF4EE2A";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "hand";
createNode nurbsCurve -n "Guide_index_CrvShape" -p "Guide_index_Crv";
	rename -uid "32D04A24-47BB-C537-70D1-26AE6B51A81A";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 0.25 0.5 0.75 1
		5
		12 0 1
		15 0 1
		17 0 1
		19.000000000000004 0 1
		21 0 1
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "hand";
createNode transform -n "Guide_middle_Crv" -p "Guide_hand_nonParant";
	rename -uid "16C4B1B1-44EF-521B-2329-54A4D7C4572D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "hand";
createNode nurbsCurve -n "Guide_middle_CrvShape" -p "Guide_middle_Crv";
	rename -uid "4B59BFB0-4BB1-EABA-1925-56B1517D6888";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 0.25 0.5 0.75 1
		5
		12 0 0
		15 0 0
		17 0 0
		19.000000000000004 0 0
		21 0 0
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "hand";
createNode transform -n "Guide_ring_Crv" -p "Guide_hand_nonParant";
	rename -uid "F11C2725-4CE2-C733-2DF8-A49617FB0BEC";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "hand";
createNode nurbsCurve -n "Guide_ring_CrvShape" -p "Guide_ring_Crv";
	rename -uid "944AFFD8-4B51-41CB-3188-7C99E1AFF000";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 0.25 0.5 0.75 1
		5
		12 0 -1
		15 0 -1
		17 0 -1
		19.000000000000004 0 -1
		21 0 -1
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "hand";
createNode transform -n "Guide_pinky_Crv" -p "Guide_hand_nonParant";
	rename -uid "762D9B4C-4009-E4DB-5ECC-38A7EAAEA338";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "hand";
createNode nurbsCurve -n "Guide_pinky_CrvShape" -p "Guide_pinky_Crv";
	rename -uid "8CBCB625-42B7-B6D6-C136-D9B5575C1B07";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 5 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 0.25 0.5 0.75 1
		5
		12 0 -2
		15 0 -2
		17 0 -2
		19.000000000000004 0 -2
		21 0 -2
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "hand";
createNode transform -n "Guide_thumb_Crv" -p "Guide_hand_nonParant";
	rename -uid "4AC2FD3A-47D4-D349-C990-7EAC8C4D0226";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "hand";
createNode nurbsCurve -n "Guide_thumb_CrvShape" -p "Guide_thumb_Crv";
	rename -uid "AB05171C-47C7-5737-2C57-568E3CEC2AA8";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr -k off ".v";
	setAttr -s 4 ".cp";
	setAttr ".cc" -type "nurbsCurve" 
		1 3 0 no 3
		4 0 1 2 3
		4
		12 0 2
		15 0 2
		17 0 2
		19 0 2
		;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "hand";
createNode transform -n "Guide_handRoot_loc_Grp";
	rename -uid "6E70874E-4213-203A-1A61-E3BB04A427AF";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".t" -type "double3" 11 0 0 ;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "rootPoint";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "hand";
createNode transform -n "Guide_handRoot_loc" -p "Guide_handRoot_loc_Grp";
	rename -uid "C281D593-450C-6CC9-23DB-3DA065F2F48C";
	setAttr ".ove" yes;
	setAttr ".ovc" 18;
createNode locator -n "Guide_handRoot_locShape" -p "Guide_handRoot_loc";
	rename -uid "4AF447FF-404A-16FF-65D0-36A1AD8BF17E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "Guide_thumbRoot_loc_Grp" -p "Guide_handRoot_loc";
	rename -uid "D6190E67-457A-7E09-1EC7-CB8DE716DCB1";
	setAttr ".t" -type "double3" 1 0 2 ;
createNode transform -n "Guide_thumbRoot_loc" -p "Guide_thumbRoot_loc_Grp";
	rename -uid "78E401C0-4B94-744D-DCB3-AB9BA325750D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumbRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "Guide_thumbRoot_locShape" -p "Guide_thumbRoot_loc";
	rename -uid "3FD1B0A8-4922-D931-E70C-F98C04754531";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "Guide_thumb1_loc_Grp" -p "Guide_thumbRoot_loc";
	rename -uid "0868BF3F-462E-5595-79CA-5083010A652A";
	setAttr ".t" -type "double3" 3 0 0 ;
createNode transform -n "Guide_thumb1_loc" -p "Guide_thumb1_loc_Grp";
	rename -uid "AF53D0C2-4B78-1DB8-A582-CDA158BE6555";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "Guide_thumb1_locShape" -p "Guide_thumb1_loc";
	rename -uid "995C6CFD-4EAF-5D49-B9AC-18AE955932A7";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "Guide_thumb2_loc_Grp" -p "Guide_thumb1_loc";
	rename -uid "F9F6C3DF-4393-78AE-7044-67BC6EAF0A70";
createNode transform -n "Guide_thumb2_loc" -p "Guide_thumb2_loc_Grp";
	rename -uid "D9B67761-4EE4-951D-D45C-B59BF887FD45";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "Guide_thumb2_locShape" -p "Guide_thumb2_loc";
	rename -uid "29E86743-4E78-BCEE-964E-B8A06820096B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "Guide_thumb2_loc_Grp_pointConstraint1" -p "Guide_thumb2_loc_Grp";
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
createNode transform -n "Guide_thumb3_loc_Grp" -p "Guide_thumb1_loc";
	rename -uid "4D97FAD3-4238-8310-2934-E186D49973BD";
	setAttr ".t" -type "double3" 4 0 0 ;
createNode transform -n "Guide_thumb3_loc" -p "Guide_thumb3_loc_Grp";
	rename -uid "E1CD5808-4628-4912-961F-DDA17E183C1B";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 13;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb3";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "Guide_thumb3_locShape" -p "Guide_thumb3_loc";
	rename -uid "BCD6A746-402E-1624-6656-E88763E2BD4F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "Guide_thumb_aimVector_Grp" -p "Guide_thumb1_loc";
	rename -uid "2F43A7A9-46E0-9561-933A-87BDB3830857";
createNode transform -n "Guide_thumb_aimVector" -p "Guide_thumb_aimVector_Grp";
	rename -uid "3F4E2448-4C02-6E0D-A035-269F027A3FA0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "thumb";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hand";
createNode nurbsCurve -n "Guide_thumb_aimVectorShape" -p "Guide_thumb_aimVector";
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
createNode aimConstraint -n "Guide_thumb_aimVector_Grp_aimConstraint1" -p "Guide_thumb_aimVector_Grp";
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
createNode transform -n "Guide_pinkyRoot_loc_Grp" -p "Guide_handRoot_loc";
	rename -uid "38F331D2-4B00-F921-6ACC-F5972B250D47";
	setAttr ".t" -type "double3" 1 0 -2 ;
createNode transform -n "Guide_pinkyRoot_loc" -p "Guide_pinkyRoot_loc_Grp";
	rename -uid "E0312B78-406A-71F8-80CE-B6BD1536523A";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinkyRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "Guide_pinkyRoot_locShape" -p "Guide_pinkyRoot_loc";
	rename -uid "2542A6E4-4343-E51E-C207-18A7AF5749BD";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "Guide_pinky1_loc_Grp" -p "Guide_pinkyRoot_loc";
	rename -uid "BAD2A497-4A08-25DF-D462-5B80C080A5AE";
	setAttr ".t" -type "double3" 3 0 0 ;
createNode transform -n "Guide_pinky1_loc" -p "Guide_pinky1_loc_Grp";
	rename -uid "E1ACF165-4918-55B6-9EA4-B0AD84665D6F";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "Guide_pinky1_locShape" -p "Guide_pinky1_loc";
	rename -uid "0469AB20-4E79-2E4F-D4BB-87835FE7E627";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "Guide_pinky2_loc_Grp" -p "Guide_pinky1_loc";
	rename -uid "4C7DAD28-4B79-51BF-99BE-CD9152C6FFB3";
createNode transform -n "Guide_pinky2_loc" -p "Guide_pinky2_loc_Grp";
	rename -uid "8308772D-4E88-C3A4-E66E-6F9DFC12A6EE";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "Guide_pinky2_locShape" -p "Guide_pinky2_loc";
	rename -uid "BE83AABD-4131-2C6A-9935-A9A1FE859209";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "Guide_pinky2_loc_Grp_pointConstraint1" -p "Guide_pinky2_loc_Grp";
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
createNode transform -n "Guide_pinky3_loc_Grp" -p "Guide_pinky1_loc";
	rename -uid "5F79DEEB-4D71-AA58-FDEE-0A97DF33CC86";
createNode transform -n "Guide_pinky3_loc" -p "Guide_pinky3_loc_Grp";
	rename -uid "3A36D783-497C-7644-49F0-9A9C8F3A34FA";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky3";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "Guide_pinky3_locShape" -p "Guide_pinky3_loc";
	rename -uid "42D39D5C-44C4-4634-877A-F194E9F1DF96";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "Guide_pinky3_loc_Grp_pointConstraint1" -p "Guide_pinky3_loc_Grp";
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
createNode transform -n "Guide_pinky4_loc_Grp" -p "Guide_pinky1_loc";
	rename -uid "906E3469-4BD6-C1FA-9455-7FB6F4179D36";
	setAttr ".t" -type "double3" 6 0 0 ;
createNode transform -n "Guide_pinky4_loc" -p "Guide_pinky4_loc_Grp";
	rename -uid "74B410C4-4EAB-26E6-3898-3FBDADE32FDF";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky4";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "Guide_pinky4_locShape" -p "Guide_pinky4_loc";
	rename -uid "861A6F81-4745-FE0D-FD5B-DDAB351B7AAB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "Guide_pinky_aimVector_Grp" -p "Guide_pinky1_loc";
	rename -uid "34E06D40-498E-7A9A-4B9B-5CA896153667";
createNode transform -n "Guide_pinky_aimVector" -p "Guide_pinky_aimVector_Grp";
	rename -uid "3F4E2448-4C02-6E0D-A035-269F027A3FA0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "pinky";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hand";
createNode nurbsCurve -n "Guide_pinky_aimVectorShape" -p "Guide_pinky_aimVector";
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
createNode aimConstraint -n "Guide_pinky_aimVector_Grp_aimConstraint1" -p "Guide_pinky_aimVector_Grp";
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
createNode transform -n "Guide_ringRoot_loc_Grp" -p "Guide_handRoot_loc";
	rename -uid "96BA01F9-4310-1A6F-7E14-4AB1F99B019D";
	setAttr ".t" -type "double3" 1 0 -1 ;
createNode transform -n "Guide_ringRoot_loc" -p "Guide_ringRoot_loc_Grp";
	rename -uid "9FE727B4-49C3-8600-4362-B6AF17280A0D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ringRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "Guide_ringRoot_locShape" -p "Guide_ringRoot_loc";
	rename -uid "249CB796-4D17-6421-D175-73A83C8FBB22";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "Guide_ring1_loc_Grp" -p "Guide_ringRoot_loc";
	rename -uid "7A1A36A1-4EC4-23A0-D4AF-BF9156B21519";
	setAttr ".t" -type "double3" 3 0 0 ;
createNode transform -n "Guide_ring1_loc" -p "Guide_ring1_loc_Grp";
	rename -uid "E5509F2D-4CA3-8C0D-06BF-A381FF5D438F";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "Guide_ring1_locShape" -p "Guide_ring1_loc";
	rename -uid "4E410110-4192-B817-4187-51B19D48DFD7";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "Guide_ring2_loc_Grp" -p "Guide_ring1_loc";
	rename -uid "04F155A7-4073-39BB-6512-5284F949E6D9";
createNode transform -n "Guide_ring2_loc" -p "Guide_ring2_loc_Grp";
	rename -uid "3A59FB40-4517-12B4-44DA-0DACAC96119C";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "Guide_ring2_locShape" -p "Guide_ring2_loc";
	rename -uid "33EB5DDD-4789-4620-F9D2-3B80F156EC93";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "Guide_ring2_loc_Grp_pointConstraint1" -p "Guide_ring2_loc_Grp";
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
createNode transform -n "Guide_ring3_loc_Grp" -p "Guide_ring1_loc";
	rename -uid "C143E8A6-4859-B7C1-FB08-96867A4502E8";
createNode transform -n "Guide_ring3_loc" -p "Guide_ring3_loc_Grp";
	rename -uid "9AB18A77-43AB-5FB5-D9F9-698911A6E1CC";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring3";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "Guide_ring3_locShape" -p "Guide_ring3_loc";
	rename -uid "C5F04795-42DD-557E-B1AC-DFA4932D9856";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "Guide_ring3_loc_Grp_pointConstraint1" -p "Guide_ring3_loc_Grp";
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
createNode transform -n "Guide_ring4_loc_Grp" -p "Guide_ring1_loc";
	rename -uid "7E2866DE-4629-38D0-A4C7-9C88D306BBD4";
	setAttr ".t" -type "double3" 6 0 0 ;
createNode transform -n "Guide_ring4_loc" -p "Guide_ring4_loc_Grp";
	rename -uid "20E6F8CB-4A22-7598-3E6D-849EF9EA141D";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring4";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "Guide_ring4_locShape" -p "Guide_ring4_loc";
	rename -uid "8A62C567-4EE9-BF86-5E22-AFBE908486C2";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "Guide_ring_aimVector_Grp" -p "Guide_ring1_loc";
	rename -uid "1299AF37-4601-E2D5-3FED-F5A61618EB9C";
createNode transform -n "Guide_ring_aimVector" -p "Guide_ring_aimVector_Grp";
	rename -uid "3F4E2448-4C02-6E0D-A035-269F027A3FA0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "ring";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hand";
createNode nurbsCurve -n "Guide_ring_aimVectorShape" -p "Guide_ring_aimVector";
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
createNode aimConstraint -n "Guide_ring_aimVector_Grp_aimConstraint1" -p "Guide_ring_aimVector_Grp";
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
createNode transform -n "Guide_indexRoot_loc_Grp" -p "Guide_handRoot_loc";
	rename -uid "5F6C967C-41E7-3AA6-61EE-A7911731ED88";
	setAttr ".t" -type "double3" 1 0 1 ;
createNode transform -n "Guide_indexRoot_loc" -p "Guide_indexRoot_loc_Grp";
	rename -uid "0D219D70-475A-E4EA-93B3-72855A783E14";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "indexRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "Guide_indexRoot_locShape" -p "Guide_indexRoot_loc";
	rename -uid "B777AD7A-4AD5-7399-0194-12AE6A393A12";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "Guide_index1_loc_Grp" -p "Guide_indexRoot_loc";
	rename -uid "BA61B796-43B7-ACCD-B630-A69A75E2106C";
	setAttr ".t" -type "double3" 3 0 0 ;
createNode transform -n "Guide_index1_loc" -p "Guide_index1_loc_Grp";
	rename -uid "F31DCEFF-4DF6-3D15-2D3A-4ABFE6043D47";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "Guide_index1_locShape" -p "Guide_index1_loc";
	rename -uid "2CC90CB6-43F8-5569-2C27-4DA6D1E4313F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "Guide_index2_loc_Grp" -p "Guide_index1_loc";
	rename -uid "7F8B068F-484F-DDF5-D1FB-57981C440612";
createNode transform -n "Guide_index2_loc" -p "Guide_index2_loc_Grp";
	rename -uid "F57E6D96-404E-BAD4-025E-FC8F4F6CBAFE";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "Guide_index2_locShape" -p "Guide_index2_loc";
	rename -uid "D7F6FC3E-4DB2-6DD8-BC9B-8BA6076F348D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "Guide_index2_loc_Grp_pointConstraint1" -p "Guide_index2_loc_Grp";
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
createNode transform -n "Guide_index3_loc_Grp" -p "Guide_index1_loc";
	rename -uid "BD5F18A8-4DB1-4A07-6A00-2AA3A38FA592";
createNode transform -n "Guide_index3_loc" -p "Guide_index3_loc_Grp";
	rename -uid "0D261CDE-4FBB-507A-FB0E-2FBE98931ACE";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index3";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "Guide_index3_locShape" -p "Guide_index3_loc";
	rename -uid "BA896669-471B-8770-DC80-E9B81A890B35";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "Guide_index3_loc_Grp_pointConstraint1" -p "Guide_index3_loc_Grp";
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
createNode transform -n "Guide_index4_loc_Grp" -p "Guide_index1_loc";
	rename -uid "34408EE1-4D3E-529B-943B-E688558BE8DB";
	setAttr ".t" -type "double3" 6 0 0 ;
createNode transform -n "Guide_index4_loc" -p "Guide_index4_loc_Grp";
	rename -uid "CF0A6F60-4B3B-2963-BD66-CCBFF3B0FF49";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index4";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "Guide_index4_locShape" -p "Guide_index4_loc";
	rename -uid "0F9C5DCD-4E3E-5783-5329-5D9C8D414024";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "Guide_index_aimVector_Grp" -p "Guide_index1_loc";
	rename -uid "241082DD-48D6-BB39-DC65-03BC7B25424F";
createNode transform -n "Guide_index_aimVector" -p "Guide_index_aimVector_Grp";
	rename -uid "3F4E2448-4C02-6E0D-A035-269F027A3FA0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "index";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hand";
createNode nurbsCurve -n "Guide_index_aimVectorShape" -p "Guide_index_aimVector";
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
createNode aimConstraint -n "Guide_index_aimVector_Grp_aimConstraint1" -p "Guide_index_aimVector_Grp";
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
createNode transform -n "Guide_middleRoot_loc_Grp" -p "Guide_handRoot_loc";
	rename -uid "95944AC7-4A0B-1AAF-6316-C9A8A006AB86";
	setAttr ".t" -type "double3" 1 0 0 ;
createNode transform -n "Guide_middleRoot_loc" -p "Guide_middleRoot_loc_Grp";
	rename -uid "D7C0AE82-41DF-01AD-17FF-D9935BABA0A6";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middleRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "Guide_middleRoot_locShape" -p "Guide_middleRoot_loc";
	rename -uid "A4E6E1B9-48EA-62EF-96FF-C89E63A9B43D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "Guide_middle1_loc_Grp" -p "Guide_middleRoot_loc";
	rename -uid "E5CABB8F-4F1C-CE56-CB07-7184F93C083D";
	setAttr ".t" -type "double3" 3 0 0 ;
createNode transform -n "Guide_middle1_loc" -p "Guide_middle1_loc_Grp";
	rename -uid "53FA9391-43D3-141A-DF4A-E2839BC3126A";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle1";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "Guide_middle1_locShape" -p "Guide_middle1_loc";
	rename -uid "72435E9F-470B-C62F-657E-198BDD676033";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "Guide_middle2_loc_Grp" -p "Guide_middle1_loc";
	rename -uid "182C9BCE-4F52-1F5E-44A8-A8AAEFBC4B87";
createNode transform -n "Guide_middle2_loc" -p "Guide_middle2_loc_Grp";
	rename -uid "95897949-42CB-428D-1846-A096B2EF4F1B";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle2";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "Guide_middle2_locShape" -p "Guide_middle2_loc";
	rename -uid "507AFB7E-4053-8E05-F069-44A1F734BCDF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "Guide_middle2_loc_Grp_pointConstraint1" -p "Guide_middle2_loc_Grp";
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
createNode transform -n "Guide_middle3_loc_Grp" -p "Guide_middle1_loc";
	rename -uid "124F2871-4142-C41C-8967-FAA76E995098";
createNode transform -n "Guide_middle3_loc" -p "Guide_middle3_loc_Grp";
	rename -uid "5CB1569A-4BDD-41E7-BC70-CDB551E418CB";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle3";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "Guide_middle3_locShape" -p "Guide_middle3_loc";
	rename -uid "2A78058A-4C98-A46D-B62D-7A958982737C";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode pointConstraint -n "Guide_middle3_loc_Grp_pointConstraint1" -p "Guide_middle3_loc_Grp";
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
createNode transform -n "Guide_middle4_loc_Grp" -p "Guide_middle1_loc";
	rename -uid "7C7F6216-4619-CD5C-2472-A98F62FE9A92";
	setAttr ".t" -type "double3" 6 0 0 ;
createNode transform -n "Guide_middle4_loc" -p "Guide_middle4_loc_Grp";
	rename -uid "2CF2A2E3-4006-6EDE-B1AA-B9A098C65FAD";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle4";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "hand";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "Guide_middle4_locShape" -p "Guide_middle4_loc";
	rename -uid "A57057FF-429A-DD41-1D64-12BB776B6944";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "Guide_middle_aimVector_Grp" -p "Guide_middle1_loc";
	rename -uid "8ACDD583-41D9-CAB3-6869-C196DC917073";
createNode transform -n "Guide_middle_aimVector" -p "Guide_middle_aimVector_Grp";
	rename -uid "3F4E2448-4C02-6E0D-A035-269F027A3FA0";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".ove" yes;
	setAttr ".ovc" 6;
	setAttr ".rig_type" -type "string" "biped";
	setAttr ".rig_part" -type "string" "middle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hand";
createNode nurbsCurve -n "Guide_middle_aimVectorShape" -p "Guide_middle_aimVector";
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
createNode aimConstraint -n "Guide_middle_aimVector_Grp_aimConstraint1" -p "Guide_middle_aimVector_Grp";
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
createNode lightLinker -s -n "lightLinker1";
	rename -uid "7F2FD4FF-4C13-4160-8C8C-FCB940CCFD50";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode RedshiftOptions -s -n "redshiftOptions";
	rename -uid "2D5E1139-4312-9559-3DC1-7DB215C7C055";
	setAttr ".version" 4;
	setAttr ".unifiedFilterSize" 2.5;
	setAttr ".denoiseEngine" 3;
	setAttr ".GIEnabled" yes;
	setAttr ".primaryGIEngine" 4;
	setAttr ".secondaryGIEngine" 2;
	setAttr ".numGIBounces" 4;
	setAttr ".enableLegacyBlackBodyAndDispersionTechnique" no;
	setAttr ".enableLegacyMotionBlurSampling" no;
	setAttr ".enableLegacySSSGI" no;
	setAttr ".enableLegacyVolumePhase" no;
	setAttr ".enableOptiXRTOnSupportedGPUs" yes;
	setAttr ".enableAutomaticSampling" yes;
createNode RedshiftPostEffects -n "defaultRedshiftPostEffects";
	rename -uid "A6836B6C-43AB-30E1-7655-D281E7BF572E";
	setAttr ".v" 2;
	setAttr -s 2 ".cr[1]" -type "float2" 1 1;
	setAttr -s 2 ".cg[1]" -type "float2" 1 1;
	setAttr -s 2 ".cb[1]" -type "float2" 1 1;
	setAttr -s 2 ".cl[1]" -type "float2" 1 1;
createNode VRaySettingsNode -s -n "vraySettings";
	rename -uid "0BBFF432-4961-30C2-5DD0-C2BACE69E06D";
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
	setAttr ".mSceneName" -type "string" "D:/Code/MayaCode/autoRig/guide_rigs/guide_biped_hand.ma";
	setAttr ".rt_cpuRayBundleSize" 4;
	setAttr ".rt_gpuRayBundleSize" 128;
	setAttr ".rt_maxPaths" 10000;
	setAttr ".rt_engineType" 3;
	setAttr ".rt_gpuResizeTextures" 0;
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "A3524534-41E7-4D22-B250-45888B42C9FB";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "79483E8B-49E5-253D-109A-F1829305A482";
createNode displayLayerManager -n "layerManager";
	rename -uid "62F84B1E-46B4-0100-0122-1CB290122C65";
createNode displayLayer -n "defaultLayer";
	rename -uid "4351F25F-46A3-0712-DDAF-0195825CE703";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "57C2DC8D-4BDD-690B-62F4-7EAB05E7D96C";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "782FAD52-4D0C-4283-2878-E1A235A5814C";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "235E670B-4F50-9648-D8C6-E5AD2C6197CE";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -docTag \"RADRENDER\" \n            -camera \"|top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n"
		+ "            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n"
		+ "            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 936\n            -height 524\n            -sceneRenderFilter 0\n            -activeShadingGraph \"ballora_animatronic_shadow_rig:rsMaterial1SG,ballora_animatronic_shadow_rig:MAT_ballora,ballora_animatronic_shadow_rig:MAT_ballora\" \n            -activeCustomGeometry \"meshShaderball\" \n"
		+ "            -activeCustomLighSet \"defaultAreaLightSet\" \n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -docTag \"RADRENDER\" \n            -camera \"|side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n"
		+ "            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n"
		+ "            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 935\n            -height 524\n            -sceneRenderFilter 0\n            -activeShadingGraph \"ballora_animatronic_shadow_rig:rsMaterial1SG,ballora_animatronic_shadow_rig:MAT_ballora,ballora_animatronic_shadow_rig:MAT_ballora\" \n            -activeCustomGeometry \"meshShaderball\" \n            -activeCustomLighSet \"defaultAreaLightSet\" \n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -docTag \"RADRENDER\" \n            -camera \"|front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n"
		+ "            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 936\n            -height 524\n            -sceneRenderFilter 0\n            -activeShadingGraph \"ballora_animatronic_shadow_rig:rsMaterial1SG,ballora_animatronic_shadow_rig:MAT_ballora,ballora_animatronic_shadow_rig:MAT_ballora\" \n"
		+ "            -activeCustomGeometry \"meshShaderball\" \n            -activeCustomLighSet \"defaultAreaLightSet\" \n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -docTag \"RADRENDER\" \n            -camera \"|persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n"
		+ "            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n"
		+ "            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n"
		+ "            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1678\n            -height 1092\n            -sceneRenderFilter 0\n            -activeShadingGraph \"ballora_animatronic_shadow_rig:rsMaterial1SG,ballora_animatronic_shadow_rig:MAT_ballora,ballora_animatronic_shadow_rig:MAT_ballora\" \n            -activeCustomGeometry \"meshShaderball\" \n            -activeCustomLighSet \"defaultAreaLightSet\" \n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"rcExport2AE Outliner *DONT SELECT*\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"rcExport2AE Outliner *DONT SELECT*\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 1\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n"
		+ "            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -selectCommand \"{}\" \n            -showNamespace 1\n            -showPinIcons 0\n"
		+ "            -mapMotionTrails 0\n            -ignoreHiddenAttribute 1\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n"
		+ "            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n"
		+ "            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"ascend\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n"
		+ "                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n"
		+ "                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n                -showPlayRangeShades \"on\" \n                -lockPlayRangeShades \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -keyMinScale 1\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -valueLinesToggle 1\n                -outliner \"graphEditor1OutlineEd\" \n                -highlightAffectedCurves 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n"
		+ "                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayValues 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayValues 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n"
		+ "                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n"
		+ "                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -connectionMinSegment 0.03\n"
		+ "                -connectionOffset 0.03\n                -connectionRoundness 0.8\n                -connectionTension -100\n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -connectionMinSegment 0.03\n                -connectionOffset 0.03\n                -connectionRoundness 0.8\n                -connectionTension -100\n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n"
		+ "                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "{ string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -editorChanged \"updateModelPanelBar\" \n                -camera \"|persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n"
		+ "                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererOverrideName \"stereoOverrideVP2\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n"
		+ "                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n"
		+ "                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName; };\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n"
		+ "            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n"
		+ "            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n"
		+ "        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -docTag \\\"RADRENDER\\\" \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1678\\n    -height 1092\\n    -sceneRenderFilter 0\\n    -activeShadingGraph \\\"ballora_animatronic_shadow_rig:rsMaterial1SG,ballora_animatronic_shadow_rig:MAT_ballora,ballora_animatronic_shadow_rig:MAT_ballora\\\" \\n    -activeCustomGeometry \\\"meshShaderball\\\" \\n    -activeCustomLighSet \\\"defaultAreaLightSet\\\" \\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -docTag \\\"RADRENDER\\\" \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1678\\n    -height 1092\\n    -sceneRenderFilter 0\\n    -activeShadingGraph \\\"ballora_animatronic_shadow_rig:rsMaterial1SG,ballora_animatronic_shadow_rig:MAT_ballora,ballora_animatronic_shadow_rig:MAT_ballora\\\" \\n    -activeCustomGeometry \\\"meshShaderball\\\" \\n    -activeCustomLighSet \\\"defaultAreaLightSet\\\" \\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 52 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "82339699-4FC4-9AE1-AA20-4A9D04B37F52";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode shapeEditorManager -n "shapeEditorManager1";
	rename -uid "ACB42E0F-414C-E688-98D9-008A20491864";
createNode poseInterpolatorManager -n "poseInterpolatorManager1";
	rename -uid "EE0AA319-47D7-0B0D-4363-9B8C668AD435";
createNode renderLayerManager -n "renderLayerManager1";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer1";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "B5EF52A8-4A13-FD6B-E06E-8CB06E7AC07E";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode shapeEditorManager -n "shapeEditorManager2";
	rename -uid "ACB42E0F-414C-E688-98D9-008A20491864";
createNode poseInterpolatorManager -n "poseInterpolatorManager2";
	rename -uid "EE0AA319-47D7-0B0D-4363-9B8C668AD435";
createNode renderLayerManager -n "renderLayerManager2";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer2";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode script -n "backUp_uiConfigurationScriptNode1";
	rename -uid "B5EF52A8-4A13-FD6B-E06E-8CB06E7AC07E";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode shapeEditorManager -n "shapeEditorManager3";
	rename -uid "ACB42E0F-414C-E688-98D9-008A20491864";
createNode poseInterpolatorManager -n "poseInterpolatorManager3";
	rename -uid "EE0AA319-47D7-0B0D-4363-9B8C668AD435";
createNode renderLayerManager -n "renderLayerManager3";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer3";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode script -n "backUp_uiConfigurationScriptNode2";
	rename -uid "B5EF52A8-4A13-FD6B-E06E-8CB06E7AC07E";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode shapeEditorManager -n "shapeEditorManager4";
	rename -uid "ACB42E0F-414C-E688-98D9-008A20491864";
createNode poseInterpolatorManager -n "poseInterpolatorManager4";
	rename -uid "EE0AA319-47D7-0B0D-4363-9B8C668AD435";
createNode renderLayerManager -n "renderLayerManager4";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer4";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode script -n "backUp_uiConfigurationScriptNode3";
	rename -uid "B5EF52A8-4A13-FD6B-E06E-8CB06E7AC07E";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode shapeEditorManager -n "shapeEditorManager5";
	rename -uid "ACB42E0F-414C-E688-98D9-008A20491864";
createNode poseInterpolatorManager -n "poseInterpolatorManager5";
	rename -uid "EE0AA319-47D7-0B0D-4363-9B8C668AD435";
createNode renderLayerManager -n "renderLayerManager5";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer5";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode script -n "backUp_uiConfigurationScriptNode4";
	rename -uid "B5EF52A8-4A13-FD6B-E06E-8CB06E7AC07E";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "2E1913CC-4AAF-87AB-D6FD-12B3FCD698BD";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -436.20650068296806 -540.95194141172533 ;
	setAttr ".tgi[0].vh" -type "double2" 427.65902130474376 -106.49817208522045 ;
	setAttr -s 58 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -162.85714721679688;
	setAttr ".tgi[0].ni[0].y" -338.57144165039062;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" -97.142860412597656;
	setAttr ".tgi[0].ni[1].y" -352.85714721679688;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" -67.142860412597656;
	setAttr ".tgi[0].ni[2].y" -2500;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" -67.142860412597656;
	setAttr ".tgi[0].ni[3].y" -2370;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" -107.14286041259766;
	setAttr ".tgi[0].ni[4].y" -222.85714721679688;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" -97.142860412597656;
	setAttr ".tgi[0].ni[5].y" -222.85714721679688;
	setAttr ".tgi[0].ni[5].nvs" 18304;
	setAttr ".tgi[0].ni[6].x" -87.142860412597656;
	setAttr ".tgi[0].ni[6].y" -352.85714721679688;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[0].ni[7].x" -257.14285278320312;
	setAttr ".tgi[0].ni[7].y" -85.714286804199219;
	setAttr ".tgi[0].ni[7].nvs" 18304;
	setAttr ".tgi[0].ni[8].x" -67.142860412597656;
	setAttr ".tgi[0].ni[8].y" -2110;
	setAttr ".tgi[0].ni[8].nvs" 18304;
	setAttr ".tgi[0].ni[9].x" -320.25210571289062;
	setAttr ".tgi[0].ni[9].y" 87.731094360351562;
	setAttr ".tgi[0].ni[9].nvs" 18306;
	setAttr ".tgi[0].ni[10].x" -67.142860412597656;
	setAttr ".tgi[0].ni[10].y" -1980;
	setAttr ".tgi[0].ni[10].nvs" 18304;
	setAttr ".tgi[0].ni[11].x" -67.142860412597656;
	setAttr ".tgi[0].ni[11].y" -1850;
	setAttr ".tgi[0].ni[11].nvs" 18304;
	setAttr ".tgi[0].ni[12].x" -127.14286041259766;
	setAttr ".tgi[0].ni[12].y" 1530;
	setAttr ".tgi[0].ni[12].nvs" 18304;
	setAttr ".tgi[0].ni[13].x" -67.142860412597656;
	setAttr ".tgi[0].ni[13].y" -1720;
	setAttr ".tgi[0].ni[13].nvs" 18304;
	setAttr ".tgi[0].ni[14].x" -257.14285278320312;
	setAttr ".tgi[0].ni[14].y" -187.14285278320312;
	setAttr ".tgi[0].ni[14].nvs" 18304;
	setAttr ".tgi[0].ni[15].x" -127.14286041259766;
	setAttr ".tgi[0].ni[15].y" 1660;
	setAttr ".tgi[0].ni[15].nvs" 18304;
	setAttr ".tgi[0].ni[16].x" -118.57142639160156;
	setAttr ".tgi[0].ni[16].y" 1400;
	setAttr ".tgi[0].ni[16].nvs" 18304;
	setAttr ".tgi[0].ni[17].x" -257.14285278320312;
	setAttr ".tgi[0].ni[17].y" -491.42855834960938;
	setAttr ".tgi[0].ni[17].nvs" 18304;
	setAttr ".tgi[0].ni[18].x" -67.142860412597656;
	setAttr ".tgi[0].ni[18].y" -1330;
	setAttr ".tgi[0].ni[18].nvs" 18304;
	setAttr ".tgi[0].ni[19].x" -67.142860412597656;
	setAttr ".tgi[0].ni[19].y" -1200;
	setAttr ".tgi[0].ni[19].nvs" 18304;
	setAttr ".tgi[0].ni[20].x" -257.14285278320312;
	setAttr ".tgi[0].ni[20].y" -288.57144165039062;
	setAttr ".tgi[0].ni[20].nvs" 18304;
	setAttr ".tgi[0].ni[21].x" -67.142860412597656;
	setAttr ".tgi[0].ni[21].y" -940;
	setAttr ".tgi[0].ni[21].nvs" 18304;
	setAttr ".tgi[0].ni[22].x" -67.142860412597656;
	setAttr ".tgi[0].ni[22].y" -810;
	setAttr ".tgi[0].ni[22].nvs" 18304;
	setAttr ".tgi[0].ni[23].x" 150.75630187988281;
	setAttr ".tgi[0].ni[23].y" 151.59663391113281;
	setAttr ".tgi[0].ni[23].nvs" 18306;
	setAttr ".tgi[0].ni[24].x" -67.142860412597656;
	setAttr ".tgi[0].ni[24].y" -680;
	setAttr ".tgi[0].ni[24].nvs" 18304;
	setAttr ".tgi[0].ni[25].x" -127.14286041259766;
	setAttr ".tgi[0].ni[25].y" 1790;
	setAttr ".tgi[0].ni[25].nvs" 18304;
	setAttr ".tgi[0].ni[26].x" -67.142860412597656;
	setAttr ".tgi[0].ni[26].y" -550;
	setAttr ".tgi[0].ni[26].nvs" 18304;
	setAttr ".tgi[0].ni[27].x" -67.142860412597656;
	setAttr ".tgi[0].ni[27].y" -420;
	setAttr ".tgi[0].ni[27].nvs" 18304;
	setAttr ".tgi[0].ni[28].x" -257.14285278320312;
	setAttr ".tgi[0].ni[28].y" -390;
	setAttr ".tgi[0].ni[28].nvs" 18304;
	setAttr ".tgi[0].ni[29].x" -67.142860412597656;
	setAttr ".tgi[0].ni[29].y" -160;
	setAttr ".tgi[0].ni[29].nvs" 18304;
	setAttr ".tgi[0].ni[30].x" -67.142860412597656;
	setAttr ".tgi[0].ni[30].y" -30;
	setAttr ".tgi[0].ni[30].nvs" 18304;
	setAttr ".tgi[0].ni[31].x" -97.142860412597656;
	setAttr ".tgi[0].ni[31].y" -352.85714721679688;
	setAttr ".tgi[0].ni[31].nvs" 18304;
	setAttr ".tgi[0].ni[32].x" -318.57144165039062;
	setAttr ".tgi[0].ni[32].y" -288.57144165039062;
	setAttr ".tgi[0].ni[32].nvs" 18304;
	setAttr ".tgi[0].ni[33].x" -302.85714721679688;
	setAttr ".tgi[0].ni[33].y" -288.57144165039062;
	setAttr ".tgi[0].ni[33].nvs" 18304;
	setAttr ".tgi[0].ni[34].x" 265.71429443359375;
	setAttr ".tgi[0].ni[34].y" -237.14285278320312;
	setAttr ".tgi[0].ni[34].nvs" 18304;
	setAttr ".tgi[0].ni[35].x" -97.142860412597656;
	setAttr ".tgi[0].ni[35].y" -222.85714721679688;
	setAttr ".tgi[0].ni[35].nvs" 18304;
	setAttr ".tgi[0].ni[36].x" 265.71429443359375;
	setAttr ".tgi[0].ni[36].y" -338.57144165039062;
	setAttr ".tgi[0].ni[36].nvs" 18304;
	setAttr ".tgi[0].ni[37].x" -127.14286041259766;
	setAttr ".tgi[0].ni[37].y" 1920;
	setAttr ".tgi[0].ni[37].nvs" 18304;
	setAttr ".tgi[0].ni[38].x" -308.57144165039062;
	setAttr ".tgi[0].ni[38].y" -288.57144165039062;
	setAttr ".tgi[0].ni[38].nvs" 18304;
	setAttr ".tgi[0].ni[39].x" -162.85714721679688;
	setAttr ".tgi[0].ni[39].y" -237.14285278320312;
	setAttr ".tgi[0].ni[39].nvs" 18304;
	setAttr ".tgi[0].ni[40].x" 4.2857141494750977;
	setAttr ".tgi[0].ni[40].y" -288.57144165039062;
	setAttr ".tgi[0].ni[40].nvs" 18304;
	setAttr ".tgi[0].ni[41].x" -97.142860412597656;
	setAttr ".tgi[0].ni[41].y" -288.57144165039062;
	setAttr ".tgi[0].ni[41].nvs" 18304;
	setAttr ".tgi[0].ni[42].y" -288.57144165039062;
	setAttr ".tgi[0].ni[42].nvs" 18304;
	setAttr ".tgi[0].ni[43].x" -154.28572082519531;
	setAttr ".tgi[0].ni[43].y" -338.57144165039062;
	setAttr ".tgi[0].ni[43].nvs" 18304;
	setAttr ".tgi[0].ni[44].y" -288.57144165039062;
	setAttr ".tgi[0].ni[44].nvs" 18304;
	setAttr ".tgi[0].ni[45].x" -470;
	setAttr ".tgi[0].ni[45].y" -390;
	setAttr ".tgi[0].ni[45].nvs" 18304;
	setAttr ".tgi[0].ni[46].x" -41.428569793701172;
	setAttr ".tgi[0].ni[46].y" -352.85714721679688;
	setAttr ".tgi[0].ni[46].nvs" 18304;
	setAttr ".tgi[0].ni[47].x" -470;
	setAttr ".tgi[0].ni[47].y" -288.57144165039062;
	setAttr ".tgi[0].ni[47].nvs" 18304;
	setAttr ".tgi[0].ni[48].x" -470;
	setAttr ".tgi[0].ni[48].y" -187.14285278320312;
	setAttr ".tgi[0].ni[48].nvs" 18304;
	setAttr ".tgi[0].ni[49].x" -237.14285278320312;
	setAttr ".tgi[0].ni[49].y" -455.71429443359375;
	setAttr ".tgi[0].ni[49].nvs" 18304;
	setAttr ".tgi[0].ni[50].x" -237.14285278320312;
	setAttr ".tgi[0].ni[50].y" -325.71429443359375;
	setAttr ".tgi[0].ni[50].nvs" 18304;
	setAttr ".tgi[0].ni[51].x" -431.42855834960938;
	setAttr ".tgi[0].ni[51].y" -325.71429443359375;
	setAttr ".tgi[0].ni[51].nvs" 18304;
	setAttr ".tgi[0].ni[52].x" -97.142860412597656;
	setAttr ".tgi[0].ni[52].y" -222.85714721679688;
	setAttr ".tgi[0].ni[52].nvs" 18304;
	setAttr ".tgi[0].ni[53].x" -237.14285278320312;
	setAttr ".tgi[0].ni[53].y" -391.42855834960938;
	setAttr ".tgi[0].ni[53].nvs" 18304;
	setAttr ".tgi[0].ni[54].x" 265.71429443359375;
	setAttr ".tgi[0].ni[54].y" -338.57144165039062;
	setAttr ".tgi[0].ni[54].nvs" 18304;
	setAttr ".tgi[0].ni[55].x" -97.142860412597656;
	setAttr ".tgi[0].ni[55].y" -352.85714721679688;
	setAttr ".tgi[0].ni[55].nvs" 18304;
	setAttr ".tgi[0].ni[56].x" -97.142860412597656;
	setAttr ".tgi[0].ni[56].y" -222.85714721679688;
	setAttr ".tgi[0].ni[56].nvs" 18304;
	setAttr ".tgi[0].ni[57].x" -97.142860412597656;
	setAttr ".tgi[0].ni[57].y" -92.857139587402344;
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
	setAttr -av ".rtfm";
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
select -ne :defaultRenderUtilityList1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultRenderingList1;
	setAttr -av -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 6 ".r";
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
	setAttr -cb on ".rsMaterialId";
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
	setAttr -cb on ".rsMaterialId";
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
	setAttr -av ".bfs";
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
	setAttr -av -k off ".fbfm";
	setAttr -av -k off -cb on ".ehql";
	setAttr -av -k off -cb on ".eams";
	setAttr -av -k off ".eeaa";
	setAttr -av -k off ".engm";
	setAttr -av -k off ".mes";
	setAttr -av -k off ".emb";
	setAttr -av -k off ".mbbf";
	setAttr -av -k off ".mbs";
	setAttr -av -k off ".trm";
	setAttr -av -k off -cb on ".tshc";
	setAttr -av -k off ".enpt";
	setAttr -av -k off ".clmt";
	setAttr -av -k off -cb on ".tcov";
	setAttr -av -k off -cb on ".lith";
	setAttr -av -k off -cb on ".sobc";
	setAttr -av -k off -cb on ".cuth";
	setAttr -av -k off -cb on ".hgcd";
	setAttr -av -k off -cb on ".hgci";
	setAttr -av -k off -cb on ".mgcs";
	setAttr -av -k off ".twa";
	setAttr -av -k off ".twz";
	setAttr -av -k on ".hwcc";
	setAttr -av -k on ".hwdp";
	setAttr -av -k on ".hwql";
	setAttr -av -k on ".hwfr";
	setAttr -av -k on ".soll";
	setAttr -av -k on ".sosl";
	setAttr -av -k on ".bswa";
	setAttr -av -k on ".shml";
	setAttr -av -k on ".hwel";
connectAttr "Guide_indexRoot_locShape.wp" "Guide_index_CrvShape.cp[0]";
connectAttr "Guide_index1_locShape.wp" "Guide_index_CrvShape.cp[1]";
connectAttr "Guide_index2_locShape.wp" "Guide_index_CrvShape.cp[2]";
connectAttr "Guide_index3_locShape.wp" "Guide_index_CrvShape.cp[3]";
connectAttr "Guide_index4_locShape.wp" "Guide_index_CrvShape.cp[4]";
connectAttr "Guide_middleRoot_locShape.wp" "Guide_middle_CrvShape.cp[0]";
connectAttr "Guide_middle1_locShape.wp" "Guide_middle_CrvShape.cp[1]";
connectAttr "Guide_middle2_locShape.wp" "Guide_middle_CrvShape.cp[2]";
connectAttr "Guide_middle3_locShape.wp" "Guide_middle_CrvShape.cp[3]";
connectAttr "Guide_middle4_locShape.wp" "Guide_middle_CrvShape.cp[4]";
connectAttr "Guide_ringRoot_locShape.wp" "Guide_ring_CrvShape.cp[0]";
connectAttr "Guide_ring1_locShape.wp" "Guide_ring_CrvShape.cp[1]";
connectAttr "Guide_ring2_locShape.wp" "Guide_ring_CrvShape.cp[2]";
connectAttr "Guide_ring3_locShape.wp" "Guide_ring_CrvShape.cp[3]";
connectAttr "Guide_ring4_locShape.wp" "Guide_ring_CrvShape.cp[4]";
connectAttr "Guide_pinkyRoot_locShape.wp" "Guide_pinky_CrvShape.cp[0]";
connectAttr "Guide_pinky1_locShape.wp" "Guide_pinky_CrvShape.cp[1]";
connectAttr "Guide_pinky2_locShape.wp" "Guide_pinky_CrvShape.cp[2]";
connectAttr "Guide_pinky3_locShape.wp" "Guide_pinky_CrvShape.cp[3]";
connectAttr "Guide_pinky4_locShape.wp" "Guide_pinky_CrvShape.cp[4]";
connectAttr "Guide_thumbRoot_locShape.wp" "Guide_thumb_CrvShape.cp[0]";
connectAttr "Guide_thumb1_locShape.wp" "Guide_thumb_CrvShape.cp[1]";
connectAttr "Guide_thumb2_locShape.wp" "Guide_thumb_CrvShape.cp[2]";
connectAttr "Guide_thumb3_locShape.wp" "Guide_thumb_CrvShape.cp[3]";
connectAttr "Guide_thumb2_loc_Grp_pointConstraint1.ctx" "Guide_thumb2_loc_Grp.tx"
		;
connectAttr "Guide_thumb2_loc_Grp_pointConstraint1.cty" "Guide_thumb2_loc_Grp.ty"
		;
connectAttr "Guide_thumb2_loc_Grp_pointConstraint1.ctz" "Guide_thumb2_loc_Grp.tz"
		;
connectAttr "Guide_thumb2_loc_Grp.pim" "Guide_thumb2_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "Guide_thumb2_loc_Grp.rp" "Guide_thumb2_loc_Grp_pointConstraint1.crp"
		;
connectAttr "Guide_thumb2_loc_Grp.rpt" "Guide_thumb2_loc_Grp_pointConstraint1.crt"
		;
connectAttr "Guide_thumb3_loc.t" "Guide_thumb2_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "Guide_thumb3_loc.rp" "Guide_thumb2_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "Guide_thumb3_loc.rpt" "Guide_thumb2_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "Guide_thumb3_loc.pm" "Guide_thumb2_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "Guide_thumb2_loc_Grp_pointConstraint1.w0" "Guide_thumb2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "Guide_thumb1_loc.t" "Guide_thumb2_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "Guide_thumb1_loc.rp" "Guide_thumb2_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "Guide_thumb1_loc.rpt" "Guide_thumb2_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "Guide_thumb1_loc.pm" "Guide_thumb2_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "Guide_thumb2_loc_Grp_pointConstraint1.w1" "Guide_thumb2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "Guide_thumb_aimVector_Grp_aimConstraint1.crx" "Guide_thumb_aimVector_Grp.rx"
		;
connectAttr "Guide_thumb_aimVector_Grp_aimConstraint1.cry" "Guide_thumb_aimVector_Grp.ry"
		;
connectAttr "Guide_thumb_aimVector_Grp_aimConstraint1.crz" "Guide_thumb_aimVector_Grp.rz"
		;
connectAttr "Guide_thumb_aimVector_Grp.pim" "Guide_thumb_aimVector_Grp_aimConstraint1.cpim"
		;
connectAttr "Guide_thumb_aimVector_Grp.t" "Guide_thumb_aimVector_Grp_aimConstraint1.ct"
		;
connectAttr "Guide_thumb_aimVector_Grp.rp" "Guide_thumb_aimVector_Grp_aimConstraint1.crp"
		;
connectAttr "Guide_thumb_aimVector_Grp.rpt" "Guide_thumb_aimVector_Grp_aimConstraint1.crt"
		;
connectAttr "Guide_thumb_aimVector_Grp.ro" "Guide_thumb_aimVector_Grp_aimConstraint1.cro"
		;
connectAttr "Guide_thumb2_loc.t" "Guide_thumb_aimVector_Grp_aimConstraint1.tg[0].tt"
		;
connectAttr "Guide_thumb2_loc.rp" "Guide_thumb_aimVector_Grp_aimConstraint1.tg[0].trp"
		;
connectAttr "Guide_thumb2_loc.rpt" "Guide_thumb_aimVector_Grp_aimConstraint1.tg[0].trt"
		;
connectAttr "Guide_thumb2_loc.pm" "Guide_thumb_aimVector_Grp_aimConstraint1.tg[0].tpm"
		;
connectAttr "Guide_thumb_aimVector_Grp_aimConstraint1.w0" "Guide_thumb_aimVector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "Guide_thumb1_loc.wm" "Guide_thumb_aimVector_Grp_aimConstraint1.wum"
		;
connectAttr "Guide_pinky2_loc_Grp_pointConstraint1.ctx" "Guide_pinky2_loc_Grp.tx"
		;
connectAttr "Guide_pinky2_loc_Grp_pointConstraint1.cty" "Guide_pinky2_loc_Grp.ty"
		;
connectAttr "Guide_pinky2_loc_Grp_pointConstraint1.ctz" "Guide_pinky2_loc_Grp.tz"
		;
connectAttr "Guide_pinky2_loc_Grp.pim" "Guide_pinky2_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "Guide_pinky2_loc_Grp.rp" "Guide_pinky2_loc_Grp_pointConstraint1.crp"
		;
connectAttr "Guide_pinky2_loc_Grp.rpt" "Guide_pinky2_loc_Grp_pointConstraint1.crt"
		;
connectAttr "Guide_pinky1_loc.t" "Guide_pinky2_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "Guide_pinky1_loc.rp" "Guide_pinky2_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "Guide_pinky1_loc.rpt" "Guide_pinky2_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "Guide_pinky1_loc.pm" "Guide_pinky2_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "Guide_pinky2_loc_Grp_pointConstraint1.w0" "Guide_pinky2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "Guide_pinky4_loc.t" "Guide_pinky2_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "Guide_pinky4_loc.rp" "Guide_pinky2_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "Guide_pinky4_loc.rpt" "Guide_pinky2_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "Guide_pinky4_loc.pm" "Guide_pinky2_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "Guide_pinky2_loc_Grp_pointConstraint1.w1" "Guide_pinky2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "Guide_pinky3_loc_Grp_pointConstraint1.ctx" "Guide_pinky3_loc_Grp.tx"
		;
connectAttr "Guide_pinky3_loc_Grp_pointConstraint1.cty" "Guide_pinky3_loc_Grp.ty"
		;
connectAttr "Guide_pinky3_loc_Grp_pointConstraint1.ctz" "Guide_pinky3_loc_Grp.tz"
		;
connectAttr "Guide_pinky3_loc_Grp.pim" "Guide_pinky3_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "Guide_pinky3_loc_Grp.rp" "Guide_pinky3_loc_Grp_pointConstraint1.crp"
		;
connectAttr "Guide_pinky3_loc_Grp.rpt" "Guide_pinky3_loc_Grp_pointConstraint1.crt"
		;
connectAttr "Guide_pinky1_loc.t" "Guide_pinky3_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "Guide_pinky1_loc.rp" "Guide_pinky3_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "Guide_pinky1_loc.rpt" "Guide_pinky3_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "Guide_pinky1_loc.pm" "Guide_pinky3_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "Guide_pinky3_loc_Grp_pointConstraint1.w0" "Guide_pinky3_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "Guide_pinky4_loc.t" "Guide_pinky3_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "Guide_pinky4_loc.rp" "Guide_pinky3_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "Guide_pinky4_loc.rpt" "Guide_pinky3_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "Guide_pinky4_loc.pm" "Guide_pinky3_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "Guide_pinky3_loc_Grp_pointConstraint1.w1" "Guide_pinky3_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "Guide_pinky_aimVector_Grp_aimConstraint1.crx" "Guide_pinky_aimVector_Grp.rx"
		;
connectAttr "Guide_pinky_aimVector_Grp_aimConstraint1.cry" "Guide_pinky_aimVector_Grp.ry"
		;
connectAttr "Guide_pinky_aimVector_Grp_aimConstraint1.crz" "Guide_pinky_aimVector_Grp.rz"
		;
connectAttr "Guide_pinky_aimVector_Grp.pim" "Guide_pinky_aimVector_Grp_aimConstraint1.cpim"
		;
connectAttr "Guide_pinky_aimVector_Grp.t" "Guide_pinky_aimVector_Grp_aimConstraint1.ct"
		;
connectAttr "Guide_pinky_aimVector_Grp.rp" "Guide_pinky_aimVector_Grp_aimConstraint1.crp"
		;
connectAttr "Guide_pinky_aimVector_Grp.rpt" "Guide_pinky_aimVector_Grp_aimConstraint1.crt"
		;
connectAttr "Guide_pinky_aimVector_Grp.ro" "Guide_pinky_aimVector_Grp_aimConstraint1.cro"
		;
connectAttr "Guide_pinky2_loc.t" "Guide_pinky_aimVector_Grp_aimConstraint1.tg[0].tt"
		;
connectAttr "Guide_pinky2_loc.rp" "Guide_pinky_aimVector_Grp_aimConstraint1.tg[0].trp"
		;
connectAttr "Guide_pinky2_loc.rpt" "Guide_pinky_aimVector_Grp_aimConstraint1.tg[0].trt"
		;
connectAttr "Guide_pinky2_loc.pm" "Guide_pinky_aimVector_Grp_aimConstraint1.tg[0].tpm"
		;
connectAttr "Guide_pinky_aimVector_Grp_aimConstraint1.w0" "Guide_pinky_aimVector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "Guide_pinky1_loc.wm" "Guide_pinky_aimVector_Grp_aimConstraint1.wum"
		;
connectAttr "Guide_ring2_loc_Grp_pointConstraint1.ctx" "Guide_ring2_loc_Grp.tx";
connectAttr "Guide_ring2_loc_Grp_pointConstraint1.cty" "Guide_ring2_loc_Grp.ty";
connectAttr "Guide_ring2_loc_Grp_pointConstraint1.ctz" "Guide_ring2_loc_Grp.tz";
connectAttr "Guide_ring2_loc_Grp.pim" "Guide_ring2_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "Guide_ring2_loc_Grp.rp" "Guide_ring2_loc_Grp_pointConstraint1.crp";
connectAttr "Guide_ring2_loc_Grp.rpt" "Guide_ring2_loc_Grp_pointConstraint1.crt"
		;
connectAttr "Guide_ring1_loc.t" "Guide_ring2_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "Guide_ring1_loc.rp" "Guide_ring2_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "Guide_ring1_loc.rpt" "Guide_ring2_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "Guide_ring1_loc.pm" "Guide_ring2_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "Guide_ring2_loc_Grp_pointConstraint1.w0" "Guide_ring2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "Guide_ring4_loc.t" "Guide_ring2_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "Guide_ring4_loc.rp" "Guide_ring2_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "Guide_ring4_loc.rpt" "Guide_ring2_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "Guide_ring4_loc.pm" "Guide_ring2_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "Guide_ring2_loc_Grp_pointConstraint1.w1" "Guide_ring2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "Guide_ring3_loc_Grp_pointConstraint1.ctx" "Guide_ring3_loc_Grp.tx";
connectAttr "Guide_ring3_loc_Grp_pointConstraint1.cty" "Guide_ring3_loc_Grp.ty";
connectAttr "Guide_ring3_loc_Grp_pointConstraint1.ctz" "Guide_ring3_loc_Grp.tz";
connectAttr "Guide_ring3_loc_Grp.pim" "Guide_ring3_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "Guide_ring3_loc_Grp.rp" "Guide_ring3_loc_Grp_pointConstraint1.crp";
connectAttr "Guide_ring3_loc_Grp.rpt" "Guide_ring3_loc_Grp_pointConstraint1.crt"
		;
connectAttr "Guide_ring1_loc.t" "Guide_ring3_loc_Grp_pointConstraint1.tg[0].tt";
connectAttr "Guide_ring1_loc.rp" "Guide_ring3_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "Guide_ring1_loc.rpt" "Guide_ring3_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "Guide_ring1_loc.pm" "Guide_ring3_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "Guide_ring3_loc_Grp_pointConstraint1.w0" "Guide_ring3_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "Guide_ring4_loc.t" "Guide_ring3_loc_Grp_pointConstraint1.tg[1].tt";
connectAttr "Guide_ring4_loc.rp" "Guide_ring3_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "Guide_ring4_loc.rpt" "Guide_ring3_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "Guide_ring4_loc.pm" "Guide_ring3_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "Guide_ring3_loc_Grp_pointConstraint1.w1" "Guide_ring3_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "Guide_ring_aimVector_Grp_aimConstraint1.crx" "Guide_ring_aimVector_Grp.rx"
		;
connectAttr "Guide_ring_aimVector_Grp_aimConstraint1.cry" "Guide_ring_aimVector_Grp.ry"
		;
connectAttr "Guide_ring_aimVector_Grp_aimConstraint1.crz" "Guide_ring_aimVector_Grp.rz"
		;
connectAttr "Guide_ring_aimVector_Grp.pim" "Guide_ring_aimVector_Grp_aimConstraint1.cpim"
		;
connectAttr "Guide_ring_aimVector_Grp.t" "Guide_ring_aimVector_Grp_aimConstraint1.ct"
		;
connectAttr "Guide_ring_aimVector_Grp.rp" "Guide_ring_aimVector_Grp_aimConstraint1.crp"
		;
connectAttr "Guide_ring_aimVector_Grp.rpt" "Guide_ring_aimVector_Grp_aimConstraint1.crt"
		;
connectAttr "Guide_ring_aimVector_Grp.ro" "Guide_ring_aimVector_Grp_aimConstraint1.cro"
		;
connectAttr "Guide_ring2_loc.t" "Guide_ring_aimVector_Grp_aimConstraint1.tg[0].tt"
		;
connectAttr "Guide_ring2_loc.rp" "Guide_ring_aimVector_Grp_aimConstraint1.tg[0].trp"
		;
connectAttr "Guide_ring2_loc.rpt" "Guide_ring_aimVector_Grp_aimConstraint1.tg[0].trt"
		;
connectAttr "Guide_ring2_loc.pm" "Guide_ring_aimVector_Grp_aimConstraint1.tg[0].tpm"
		;
connectAttr "Guide_ring_aimVector_Grp_aimConstraint1.w0" "Guide_ring_aimVector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "Guide_ring1_loc.wm" "Guide_ring_aimVector_Grp_aimConstraint1.wum";
connectAttr "Guide_index2_loc_Grp_pointConstraint1.ctx" "Guide_index2_loc_Grp.tx"
		;
connectAttr "Guide_index2_loc_Grp_pointConstraint1.cty" "Guide_index2_loc_Grp.ty"
		;
connectAttr "Guide_index2_loc_Grp_pointConstraint1.ctz" "Guide_index2_loc_Grp.tz"
		;
connectAttr "Guide_index2_loc_Grp.pim" "Guide_index2_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "Guide_index2_loc_Grp.rp" "Guide_index2_loc_Grp_pointConstraint1.crp"
		;
connectAttr "Guide_index2_loc_Grp.rpt" "Guide_index2_loc_Grp_pointConstraint1.crt"
		;
connectAttr "Guide_index1_loc.t" "Guide_index2_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "Guide_index1_loc.rp" "Guide_index2_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "Guide_index1_loc.rpt" "Guide_index2_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "Guide_index1_loc.pm" "Guide_index2_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "Guide_index2_loc_Grp_pointConstraint1.w0" "Guide_index2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "Guide_index4_loc.t" "Guide_index2_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "Guide_index4_loc.rp" "Guide_index2_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "Guide_index4_loc.rpt" "Guide_index2_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "Guide_index4_loc.pm" "Guide_index2_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "Guide_index2_loc_Grp_pointConstraint1.w1" "Guide_index2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "Guide_index3_loc_Grp_pointConstraint1.ctx" "Guide_index3_loc_Grp.tx"
		;
connectAttr "Guide_index3_loc_Grp_pointConstraint1.cty" "Guide_index3_loc_Grp.ty"
		;
connectAttr "Guide_index3_loc_Grp_pointConstraint1.ctz" "Guide_index3_loc_Grp.tz"
		;
connectAttr "Guide_index3_loc_Grp.pim" "Guide_index3_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "Guide_index3_loc_Grp.rp" "Guide_index3_loc_Grp_pointConstraint1.crp"
		;
connectAttr "Guide_index3_loc_Grp.rpt" "Guide_index3_loc_Grp_pointConstraint1.crt"
		;
connectAttr "Guide_index1_loc.t" "Guide_index3_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "Guide_index1_loc.rp" "Guide_index3_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "Guide_index1_loc.rpt" "Guide_index3_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "Guide_index1_loc.pm" "Guide_index3_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "Guide_index3_loc_Grp_pointConstraint1.w0" "Guide_index3_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "Guide_index4_loc.t" "Guide_index3_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "Guide_index4_loc.rp" "Guide_index3_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "Guide_index4_loc.rpt" "Guide_index3_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "Guide_index4_loc.pm" "Guide_index3_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "Guide_index3_loc_Grp_pointConstraint1.w1" "Guide_index3_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "Guide_index_aimVector_Grp_aimConstraint1.crx" "Guide_index_aimVector_Grp.rx"
		;
connectAttr "Guide_index_aimVector_Grp_aimConstraint1.cry" "Guide_index_aimVector_Grp.ry"
		;
connectAttr "Guide_index_aimVector_Grp_aimConstraint1.crz" "Guide_index_aimVector_Grp.rz"
		;
connectAttr "Guide_index_aimVector_Grp.pim" "Guide_index_aimVector_Grp_aimConstraint1.cpim"
		;
connectAttr "Guide_index_aimVector_Grp.t" "Guide_index_aimVector_Grp_aimConstraint1.ct"
		;
connectAttr "Guide_index_aimVector_Grp.rp" "Guide_index_aimVector_Grp_aimConstraint1.crp"
		;
connectAttr "Guide_index_aimVector_Grp.rpt" "Guide_index_aimVector_Grp_aimConstraint1.crt"
		;
connectAttr "Guide_index_aimVector_Grp.ro" "Guide_index_aimVector_Grp_aimConstraint1.cro"
		;
connectAttr "Guide_index2_loc.t" "Guide_index_aimVector_Grp_aimConstraint1.tg[0].tt"
		;
connectAttr "Guide_index2_loc.rp" "Guide_index_aimVector_Grp_aimConstraint1.tg[0].trp"
		;
connectAttr "Guide_index2_loc.rpt" "Guide_index_aimVector_Grp_aimConstraint1.tg[0].trt"
		;
connectAttr "Guide_index2_loc.pm" "Guide_index_aimVector_Grp_aimConstraint1.tg[0].tpm"
		;
connectAttr "Guide_index_aimVector_Grp_aimConstraint1.w0" "Guide_index_aimVector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "Guide_index1_loc.wm" "Guide_index_aimVector_Grp_aimConstraint1.wum"
		;
connectAttr "Guide_middle2_loc_Grp_pointConstraint1.ctx" "Guide_middle2_loc_Grp.tx"
		;
connectAttr "Guide_middle2_loc_Grp_pointConstraint1.cty" "Guide_middle2_loc_Grp.ty"
		;
connectAttr "Guide_middle2_loc_Grp_pointConstraint1.ctz" "Guide_middle2_loc_Grp.tz"
		;
connectAttr "Guide_middle2_loc_Grp.pim" "Guide_middle2_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "Guide_middle2_loc_Grp.rp" "Guide_middle2_loc_Grp_pointConstraint1.crp"
		;
connectAttr "Guide_middle2_loc_Grp.rpt" "Guide_middle2_loc_Grp_pointConstraint1.crt"
		;
connectAttr "Guide_middle1_loc.t" "Guide_middle2_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "Guide_middle1_loc.rp" "Guide_middle2_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "Guide_middle1_loc.rpt" "Guide_middle2_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "Guide_middle1_loc.pm" "Guide_middle2_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "Guide_middle2_loc_Grp_pointConstraint1.w0" "Guide_middle2_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "Guide_middle4_loc.t" "Guide_middle2_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "Guide_middle4_loc.rp" "Guide_middle2_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "Guide_middle4_loc.rpt" "Guide_middle2_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "Guide_middle4_loc.pm" "Guide_middle2_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "Guide_middle2_loc_Grp_pointConstraint1.w1" "Guide_middle2_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "Guide_middle3_loc_Grp_pointConstraint1.ctx" "Guide_middle3_loc_Grp.tx"
		;
connectAttr "Guide_middle3_loc_Grp_pointConstraint1.cty" "Guide_middle3_loc_Grp.ty"
		;
connectAttr "Guide_middle3_loc_Grp_pointConstraint1.ctz" "Guide_middle3_loc_Grp.tz"
		;
connectAttr "Guide_middle3_loc_Grp.pim" "Guide_middle3_loc_Grp_pointConstraint1.cpim"
		;
connectAttr "Guide_middle3_loc_Grp.rp" "Guide_middle3_loc_Grp_pointConstraint1.crp"
		;
connectAttr "Guide_middle3_loc_Grp.rpt" "Guide_middle3_loc_Grp_pointConstraint1.crt"
		;
connectAttr "Guide_middle1_loc.t" "Guide_middle3_loc_Grp_pointConstraint1.tg[0].tt"
		;
connectAttr "Guide_middle1_loc.rp" "Guide_middle3_loc_Grp_pointConstraint1.tg[0].trp"
		;
connectAttr "Guide_middle1_loc.rpt" "Guide_middle3_loc_Grp_pointConstraint1.tg[0].trt"
		;
connectAttr "Guide_middle1_loc.pm" "Guide_middle3_loc_Grp_pointConstraint1.tg[0].tpm"
		;
connectAttr "Guide_middle3_loc_Grp_pointConstraint1.w0" "Guide_middle3_loc_Grp_pointConstraint1.tg[0].tw"
		;
connectAttr "Guide_middle4_loc.t" "Guide_middle3_loc_Grp_pointConstraint1.tg[1].tt"
		;
connectAttr "Guide_middle4_loc.rp" "Guide_middle3_loc_Grp_pointConstraint1.tg[1].trp"
		;
connectAttr "Guide_middle4_loc.rpt" "Guide_middle3_loc_Grp_pointConstraint1.tg[1].trt"
		;
connectAttr "Guide_middle4_loc.pm" "Guide_middle3_loc_Grp_pointConstraint1.tg[1].tpm"
		;
connectAttr "Guide_middle3_loc_Grp_pointConstraint1.w1" "Guide_middle3_loc_Grp_pointConstraint1.tg[1].tw"
		;
connectAttr "Guide_middle_aimVector_Grp_aimConstraint1.crx" "Guide_middle_aimVector_Grp.rx"
		;
connectAttr "Guide_middle_aimVector_Grp_aimConstraint1.cry" "Guide_middle_aimVector_Grp.ry"
		;
connectAttr "Guide_middle_aimVector_Grp_aimConstraint1.crz" "Guide_middle_aimVector_Grp.rz"
		;
connectAttr "Guide_middle_aimVector_Grp.pim" "Guide_middle_aimVector_Grp_aimConstraint1.cpim"
		;
connectAttr "Guide_middle_aimVector_Grp.t" "Guide_middle_aimVector_Grp_aimConstraint1.ct"
		;
connectAttr "Guide_middle_aimVector_Grp.rp" "Guide_middle_aimVector_Grp_aimConstraint1.crp"
		;
connectAttr "Guide_middle_aimVector_Grp.rpt" "Guide_middle_aimVector_Grp_aimConstraint1.crt"
		;
connectAttr "Guide_middle_aimVector_Grp.ro" "Guide_middle_aimVector_Grp_aimConstraint1.cro"
		;
connectAttr "Guide_middle2_loc.t" "Guide_middle_aimVector_Grp_aimConstraint1.tg[0].tt"
		;
connectAttr "Guide_middle2_loc.rp" "Guide_middle_aimVector_Grp_aimConstraint1.tg[0].trp"
		;
connectAttr "Guide_middle2_loc.rpt" "Guide_middle_aimVector_Grp_aimConstraint1.tg[0].trt"
		;
connectAttr "Guide_middle2_loc.pm" "Guide_middle_aimVector_Grp_aimConstraint1.tg[0].tpm"
		;
connectAttr "Guide_middle_aimVector_Grp_aimConstraint1.w0" "Guide_middle_aimVector_Grp_aimConstraint1.tg[0].tw"
		;
connectAttr "Guide_middle1_loc.wm" "Guide_middle_aimVector_Grp_aimConstraint1.wum"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "defaultRedshiftPostEffects.msg" ":redshiftOptions.postEffects";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "renderLayerManager1.rlmi[0]" "defaultRenderLayer1.rlid";
connectAttr "renderLayerManager2.rlmi[0]" "defaultRenderLayer2.rlid";
connectAttr "renderLayerManager3.rlmi[0]" "defaultRenderLayer3.rlid";
connectAttr "renderLayerManager4.rlmi[0]" "defaultRenderLayer4.rlid";
connectAttr "renderLayerManager5.rlmi[0]" "defaultRenderLayer5.rlid";
connectAttr "Guide_thumb2_loc_Grp_pointConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "Guide_thumb_Crv.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr "Guide_index_aimVectorShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "shapeEditorManager1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "sceneConfigurationScriptNode.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "Guide_thumb_CrvShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn"
		;
connectAttr "uiConfigurationScriptNode.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn"
		;
connectAttr "Guide_index_aimVector.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn"
		;
connectAttr "poseInterpolatorManager1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn"
		;
connectAttr "Guide_indexRoot_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn"
		;
connectAttr "shapeEditorManager2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn"
		;
connectAttr "poseInterpolatorManager3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn"
		;
connectAttr "backUp_uiConfigurationScriptNode2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn"
		;
connectAttr "Guide_pinky_aimVectorShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[13].dn"
		;
connectAttr "Guide_middle_aimVector.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[14].dn"
		;
connectAttr "backUp_uiConfigurationScriptNode3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[15].dn"
		;
connectAttr "backUp_uiConfigurationScriptNode.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[16].dn"
		;
connectAttr "Guide_thumb_aimVector.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[17].dn"
		;
connectAttr "Guide_middle_aimVectorShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[18].dn"
		;
connectAttr "Guide_thumb_aimVectorShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[19].dn"
		;
connectAttr "Guide_ring_aimVector.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[20].dn"
		;
connectAttr "shapeEditorManager5.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[21].dn"
		;
connectAttr "poseInterpolatorManager5.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[22].dn"
		;
connectAttr "Guide_index_CrvShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[23].dn"
		;
connectAttr "poseInterpolatorManager2.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[24].dn"
		;
connectAttr "backUp_uiConfigurationScriptNode1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[25].dn"
		;
connectAttr "Guide_ring_aimVectorShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[26].dn"
		;
connectAttr "shapeEditorManager3.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[27].dn"
		;
connectAttr "Guide_pinky_aimVector.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[28].dn"
		;
connectAttr "shapeEditorManager4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[29].dn"
		;
connectAttr "poseInterpolatorManager4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[30].dn"
		;
connectAttr "Guide_handRoot_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[31].dn"
		;
connectAttr "Guide_middle_aimVector_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[32].dn"
		;
connectAttr "Guide_ring_aimVector_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[33].dn"
		;
connectAttr "Guide_thumb_aimVector_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[34].dn"
		;
connectAttr "Guide_handRoot_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[35].dn"
		;
connectAttr "Guide_index_aimVector_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[36].dn"
		;
connectAttr "backUp_uiConfigurationScriptNode4.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[37].dn"
		;
connectAttr "Guide_pinky_aimVector_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[38].dn"
		;
connectAttr "Guide_thumb_aimVector_Grp_aimConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[39].dn"
		;
connectAttr "Guide_ring_aimVector_Grp_aimConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[40].dn"
		;
connectAttr "Guide_handRoot_loc_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[41].dn"
		;
connectAttr "Guide_pinky_aimVector_Grp_aimConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[42].dn"
		;
connectAttr "Guide_index_aimVector_Grp_aimConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[43].dn"
		;
connectAttr "Guide_middle_aimVector_Grp_aimConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[44].dn"
		;
connectAttr "Guide_thumb3_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[45].dn"
		;
connectAttr "Guide_thumb1_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[46].dn"
		;
connectAttr "Guide_thumb1_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[47].dn"
		;
connectAttr "Guide_thumb2_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[48].dn"
		;
connectAttr "Guide_thumbRoot_loc.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[49].dn"
		;
connectAttr "Guide_thumbRoot_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[50].dn"
		;
connectAttr "Guide_thumb2_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[51].dn"
		;
connectAttr "Guide_thumb3_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[52].dn"
		;
connectAttr "Guide_hand_nonParant.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[53].dn"
		;
connectAttr "Guide_thumb2_loc_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[54].dn"
		;
connectAttr "Guide_thumb1_loc_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[55].dn"
		;
connectAttr "Guide_thumb3_loc_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[56].dn"
		;
connectAttr "Guide_thumbRoot_loc_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[57].dn"
		;
connectAttr "defaultRedshiftPostEffects.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer1.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer2.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer3.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer4.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer5.msg" ":defaultRenderingList1.r" -na;
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
// End of guide_biped_hand.ma
