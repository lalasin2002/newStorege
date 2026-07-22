//Maya ASCII 2022 scene
//Name: guide_quad_leg.ma
//Last modified: Wed, Jul 22, 2026 12:54:10 PM
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
fileInfo "UUID" "9F168511-487E-739C-B0F9-33A2FA4C888B";
createNode transform -s -n "persp";
	rename -uid "36473F08-4242-12F7-CB35-A38F76965AAD";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 93.305763571437609 19.403586074260097 -30.011983212617693 ;
	setAttr ".r" -type "double3" -3.9383527307317325 453.79999999977611 0 ;
	setAttr ".rp" -type "double3" 1.7763568394002505e-15 1.7763568394002505e-15 0 ;
	setAttr ".rpt" -type "double3" -2.509650463776879e-16 -2.5273834839902892e-16 -1.2894393407317253e-15 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "93803798-4610-3955-A101-6EB6BD1346C9";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 101.36647432191647;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "88C4E983-4C26-97BC-0971-B3ACAE2C6C63";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "6E3812F6-4021-5476-EE74-42931DBDE4BD";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 118.88773615234133;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "C6B6D60D-4C6A-7F3D-4497-1F88DCA7350E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 6.9721093588455219 11.679772943023266 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "BE4CF573-4B99-18EE-F904-FBA4FF6DBE56";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 92.842276761378855;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "6A2D9D4C-4920-5838-2393-02A1F3E1B16C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 1.9830821565003616 -7.013394763055194 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "83A80353-4739-5B73-C137-F99F40D1E892";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 15.054456314861275;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
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
	setAttr ".t" -type "double3" 6 22 -10 ;
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
	setAttr ".rig_part" -type "string" "toe1";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_toe1_locShape" -p "L_toe1_loc";
	rename -uid "44A3C471-4ABB-439D-1ED9-28A735957E32";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_heelPivot_loc_Grp" -p "L_toe1_loc";
	rename -uid "C3AE3CEE-4444-F840-2457-B993D063E01C";
	setAttr ".t" -type "double3" 0 -1 0 ;
createNode transform -n "L_heelPivot_loc" -p "L_heelPivot_loc_Grp";
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
createNode locator -n "L_heelPivot_locShape" -p "L_heelPivot_loc";
	rename -uid "4FD8DA4A-4B45-76D3-E5D2-52A738D9DC61";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_toeEndPivot_loc_Grp" -p "L_toe1_loc";
	rename -uid "0403E2F0-4F69-756D-1C5E-62A0282761AC";
	setAttr ".t" -type "double3" 0 -1 1.5 ;
createNode transform -n "L_toeEndPivot_loc" -p "L_toeEndPivot_loc_Grp";
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
createNode locator -n "L_toeEndPivot_locShape" -p "L_toeEndPivot_loc";
	rename -uid "23104371-42BA-19E0-A5C7-E69F32CEF6EB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_bankLeftPivot_loc_Grp" -p "L_toe1_loc";
	rename -uid "0B2C7F88-4493-9D99-932D-98AD6F31A680";
	setAttr ".t" -type "double3" 1 -1 0.75 ;
createNode transform -n "L_bankLeftPivot_loc" -p "L_bankLeftPivot_loc_Grp";
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
createNode locator -n "L_bankLeftPivot_locShape" -p "L_bankLeftPivot_loc";
	rename -uid "F1F309B0-42DA-51CF-A270-5FB59C40941F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_toePivot_loc_Grp" -p "L_toe1_loc";
	rename -uid "3DA064A8-4E69-44EF-C369-59813152C293";
	setAttr ".t" -type "double3" 0 -1 0.75 ;
createNode transform -n "L_toePivot_loc" -p "L_toePivot_loc_Grp";
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
createNode locator -n "L_toePivot_locShape" -p "L_toePivot_loc";
	rename -uid "4B70FA86-46F9-0136-A9A1-D58EC16A4207";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_bankRightPivot_loc_Grp" -p "L_toe1_loc";
	rename -uid "F3F2626E-481A-3705-F512-AC85BE4659F9";
	setAttr ".t" -type "double3" -1 -1 0.75 ;
createNode transform -n "L_bankRightPivot_loc" -p "L_bankRightPivot_loc_Grp";
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
createNode locator -n "L_bankRightPivot_locShape" -p "L_bankRightPivot_loc";
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
	setAttr ".rig_part" -type "string" "toe2";
	setAttr ".rig_index" -type "string" "5";
createNode locator -n "L_toe2_locShape" -p "L_toe2_loc";
	rename -uid "6A357B7C-4B57-8B32-40B1-F78CE5273AB5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_leg_vector_Grp" -p "L_hip_loc";
	rename -uid "DAD227F5-4DFD-F9E8-A96B-CDA320723B32";
createNode transform -n "L_leg_vector" -p "L_leg_vector_Grp";
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
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_module" -type "string" "leg_type";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_part" -type "string" "leg";
	setAttr ".rig_index" -type "string" "";
createNode nurbsCurve -n "L_leg_vectorShape" -p "L_leg_vector";
	rename -uid "27CD6502-4552-B1AD-B701-CC9057AD26B0";
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
	setAttr ".t" -type "double3" -6 22 -10 ;
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
	setAttr ".rig_part" -type "string" "toe1";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_toe1_locShape" -p "R_toe1_loc";
	rename -uid "2C5C4C64-486F-EE1B-9D0A-9A8CB348319F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_heelPivot_loc_Grp" -p "R_toe1_loc";
	rename -uid "FC92B127-4910-517F-1286-39892B925B9A";
	setAttr ".t" -type "double3" 0 -1 0 ;
createNode transform -n "R_heelPivot_loc" -p "R_heelPivot_loc_Grp";
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
createNode locator -n "R_heelPivot_locShape" -p "R_heelPivot_loc";
	rename -uid "7F3C5C46-46F2-BC0B-22FC-D3A2734CD530";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_toeEndPivot_loc_Grp" -p "R_toe1_loc";
	rename -uid "C4C93857-4221-5197-6BE7-FDB75DA18950";
	setAttr ".t" -type "double3" 0 -1 1.5 ;
createNode transform -n "R_toeEndPivot_loc" -p "R_toeEndPivot_loc_Grp";
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
createNode locator -n "R_toeEndPivot_locShape" -p "R_toeEndPivot_loc";
	rename -uid "CE7DA429-41B2-727B-A2C4-C8BB9D6AF143";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_bankLeftPivot_loc_Grp" -p "R_toe1_loc";
	rename -uid "E74470F2-4A63-6CC7-C879-798B5346D5B9";
	setAttr ".t" -type "double3" 1 -1 0.75 ;
createNode transform -n "R_bankLeftPivot_loc" -p "R_bankLeftPivot_loc_Grp";
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
createNode locator -n "R_bankLeftPivot_locShape" -p "R_bankLeftPivot_loc";
	rename -uid "D4F32454-45C7-0C4D-4C87-6DB2A4597366";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_toePivot_loc_Grp" -p "R_toe1_loc";
	rename -uid "1A25D28C-4E1E-5121-0BC3-22877BF4B492";
	setAttr ".t" -type "double3" 0 -1 0.75 ;
createNode transform -n "R_toePivot_loc" -p "R_toePivot_loc_Grp";
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
createNode locator -n "R_toePivot_locShape" -p "R_toePivot_loc";
	rename -uid "0FC0BCC4-48B8-BF0B-9F00-71801157AE20";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_bankRightPivot_loc_Grp" -p "R_toe1_loc";
	rename -uid "C96FC9F4-4595-FB81-7169-55BA9A461732";
	setAttr ".t" -type "double3" -1 -1 0.75 ;
createNode transform -n "R_bankRightPivot_loc" -p "R_bankRightPivot_loc_Grp";
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
createNode locator -n "R_bankRightPivot_locShape" -p "R_bankRightPivot_loc";
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
	setAttr ".rig_part" -type "string" "toe2";
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
createNode lightLinker -s -n "lightLinker1";
	rename -uid "EF405838-4A69-2534-168C-6CA234A4A95E";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager1";
	rename -uid "DA4CEB85-4FC9-9A7B-DC9A-1E8EFE4E3570";
createNode poseInterpolatorManager -n "poseInterpolatorManager1";
	rename -uid "C6F73AF9-47BB-5B22-1599-E28F48A2BDAD";
createNode displayLayerManager -n "layerManager";
	rename -uid "BD619251-4BFA-4F82-677F-FEB854EA7EBB";
createNode displayLayer -n "defaultLayer";
	rename -uid "0349FAA2-4037-1166-BDD1-40B61D17DED6";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "5D3D6FEC-4D98-E2DE-AC63-8B90A7AA5B69";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "18BD152B-47D0-B8AF-228D-98BB6CE1C394";
	setAttr ".g" yes;
createNode renderLayerManager -n "renderLayerManager1";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer1";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "FC1309F4-4C88-92E0-6804-CC8FA30D0230";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode VRaySettingsNode -s -n "vraySettings";
	rename -uid "1EE88575-4191-CB19-87C0-0FA22687A412";
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
	rename -uid "07EF144A-42E8-227C-B57B-9B93E040F5B0";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "1A41ECCA-4842-C7BD-04A0-FCBE74E9082B";
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
	setAttr -s 2 ".r";
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
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "renderLayerManager1.rlmi[0]" "defaultRenderLayer1.rlid";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer1.msg" ":defaultRenderingList1.r" -na;
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
// End of guide_quad_leg.ma
