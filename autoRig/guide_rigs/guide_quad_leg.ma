//Maya ASCII 2022 scene
//Name: guide_quad_leg.ma
//Last modified: Thu, Jul 02, 2026 04:28:55 PM
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
fileInfo "UUID" "F0EBDB85-453E-A100-9F8C-85B1CD96F15B";
createNode transform -s -n "persp";
	rename -uid "36473F08-4242-12F7-CB35-A38F76965AAD";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 110.79285832899861 72.330320390599866 55.748802215788544 ;
	setAttr ".r" -type "double3" -26.738352730504662 62.599999999998815 0 ;
	setAttr ".rp" -type "double3" 1.7763568394002505e-15 1.7763568394002505e-15 0 ;
	setAttr ".rpt" -type "double3" -2.509650463776879e-16 -2.5273834839902892e-16 -1.2894393407317253e-15 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "93803798-4610-3955-A101-6EB6BD1346C9";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 141.61078104163875;
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
	setAttr ".t" -type "double3" 1000.1 6.6441085138395497 2.4357229112911494 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "83A80353-4739-5B73-C137-F99F40D1E892";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 45.593772984605806;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -n "L_hip_nonParent";
	rename -uid "F721292A-42FF-9A8F-C6E2-6E9102182494";
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
	setAttr ".rig_boneType" -type "string" "leg";
createNode transform -n "L_hip_curve" -p "L_hip_nonParent";
	rename -uid "9DFC13E9-4EE6-275F-8622-14908825D98A";
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
	setAttr ".rig_boneType" -type "string" "leg";
createNode nurbsCurve -n "L_hip_curveShape" -p "L_hip_curve";
	rename -uid "8F332B94-4DF2-97A1-6728-5FB1D282BB08";
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
		6 22 0
		6 12 3.0000000000000004
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg";
createNode transform -n "L_knee_curve" -p "L_hip_nonParent";
	rename -uid "198E6739-4542-56AB-7C70-8EB9C72A75CA";
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
	setAttr ".rig_boneType" -type "string" "leg";
createNode nurbsCurve -n "L_knee_curveShape" -p "L_knee_curve";
	rename -uid "86DCE80B-467D-B64E-5866-9BBB3693CAF5";
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
		6 12 3.0000000000000004
		6 7 -2
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg";
createNode transform -n "L_ankle_curve" -p "L_hip_nonParent";
	rename -uid "3AA8C448-461C-04D6-9F54-C59FE79D9C78";
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
	setAttr ".rig_boneType" -type "string" "leg";
createNode nurbsCurve -n "L_ankle_curveShape" -p "L_ankle_curve";
	rename -uid "80D4A981-4555-51C3-0235-A68FACE36C1C";
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
		6 7 -2
		6 1 0
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg";
createNode transform -n "L_toe_curve" -p "L_hip_nonParent";
	rename -uid "BBA44DEC-4A3A-56E3-A8A2-D79D3C905EF4";
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
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg";
createNode nurbsCurve -n "L_toe_curveShape" -p "L_toe_curve";
	rename -uid "B161EECC-428F-93F8-A838-EF814DE387CE";
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
		6 1 0
		6 1 3
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg";
createNode transform -n "L_hip_loc_mirror";
	rename -uid "42E5F459-420F-2330-369A-0C9C28433EE0";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".t" -type "double3" 6 22 0 ;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "leg";
createNode transform -n "L_hip_loc_Grp" -p "L_hip_loc_mirror";
	rename -uid "17D71914-40E8-989F-0081-29AFFC4F80B3";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "rootPoint";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "leg";
createNode transform -n "L_hip_loc" -p "L_hip_loc_Grp";
	rename -uid "B37D72AC-45D0-4133-00FD-A4B2DA2CD0F8";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_hip_locShape" -p "L_hip_loc";
	rename -uid "59FDD858-4F20-0383-5F11-FABADBF7E7D6";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_knee_loc_Grp" -p "L_hip_loc";
	rename -uid "C44F2F85-4C65-BEBD-B6A0-EF93F1FDFEEF";
	setAttr ".t" -type "double3" 0 -10 3.0000000000000004 ;
createNode transform -n "L_knee_loc" -p "L_knee_loc_Grp";
	rename -uid "069DDE44-4F59-DB83-F663-8E93B0DA7E4C";
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
	setAttr ".rig_boneType" -type "string" "leg";
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
	setAttr ".rig_boneType" -type "string" "leg";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_kneeExtra_locShape" -p "L_kneeExtra_loc";
	rename -uid "5CA066B8-4726-F1AD-78B2-B1ABD1EFFC08";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_knee_ankleExtra1_loc_Grp" -p "L_knee_loc";
	rename -uid "E2C4A7DF-49A8-9B0B-0066-B48A3AC07B1B";
createNode transform -n "L_knee_ankleExtra1_loc" -p "L_knee_ankleExtra1_loc_Grp";
	rename -uid "B0CE03B0-4D0F-FAD9-7DCD-1396C1279655";
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
	setAttr ".rig_boneType" -type "string" "leg";
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
	setAttr ".t" -type "double3" 0 -15 -2 ;
createNode transform -n "L_ankle_loc" -p "L_ankle_loc_Grp";
	rename -uid "70E8F839-4D56-4123-8672-398B550FF291";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_ankle_locShape" -p "L_ankle_loc";
	rename -uid "C69E2FC9-4AEE-C1FD-17AF-86A44206155E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_knee_ankleExtra2_loc_Grp" -p "L_ankle_loc";
	rename -uid "A32F9E8D-4E86-A47A-8AA4-789854C90EBB";
createNode transform -n "L_knee_ankleExtra2_loc" -p "L_knee_ankleExtra2_loc_Grp";
	rename -uid "E3C29A6D-4277-CAB0-BEEF-8E87338001B1";
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
	setAttr ".rig_boneType" -type "string" "leg";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_ankleExtra_locShape" -p "L_ankleExtra_loc";
	rename -uid "22E04330-408F-6AD6-0F1D-3F8363C0E1DF";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_toeExtra_loc_Grp" -p "L_ankle_loc";
	rename -uid "62EAF5D0-405E-0016-C1EA-94ADC2E31ACF";
	setAttr ".r" -type "double3" -3.1805546814635168e-15 0 0 ;
createNode transform -n "L_toeExtra_loc" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_ankle_loc_Grp|L_ankle_loc|L_toeExtra_loc_Grp";
	rename -uid "9FF6F4BA-48AA-8E41-51E7-229BE1A37402";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_toeExtra_locShape" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_ankle_loc_Grp|L_ankle_loc|L_toeExtra_loc_Grp|L_toeExtra_loc";
	rename -uid "BE3FCA4C-4334-F492-5197-2291C87567B3";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "L_toeExtra_loc_Grp_parentConstraint1" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_ankle_loc_Grp|L_ankle_loc|L_toeExtra_loc_Grp";
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
createNode transform -n "L_toe_loc_Grp" -p "L_hip_loc";
	rename -uid "4AE5D26A-4CFC-83C2-3D5C-6ABAB4311124";
	setAttr ".t" -type "double3" 0 -21 0 ;
createNode transform -n "L_toe_loc" -p "L_toe_loc_Grp";
	rename -uid "44D7A192-4045-1FEE-B023-FBBAC7205C08";
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
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_toe_locShape" -p "L_toe_loc";
	rename -uid "2F9CAAA3-466D-CA35-D272-ABBB35893E3A";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_toeEnd_loc_Grp" -p "L_toe_loc";
	rename -uid "C516A1B3-4F49-1332-0A29-44A909F74E44";
	setAttr ".t" -type "double3" 0 0 3 ;
createNode transform -n "L_toeEnd_loc" -p "L_toeEnd_loc_Grp";
	rename -uid "A863ABB6-44CB-4F37-A2D3-A29B578EF92B";
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
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_toeEnd_locShape" -p "L_toeEnd_loc";
	rename -uid "44A3C471-4ABB-439D-1ED9-28A735957E32";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "L_bankRight_loc_Grp" -p "L_toe_loc";
	rename -uid "F3F2626E-481A-3705-F512-AC85BE4659F9";
	setAttr ".t" -type "double3" -1 -1 1 ;
createNode transform -n "L_bankRight_loc" -p "L_bankRight_loc_Grp";
	rename -uid "F0A478CF-45CE-9066-4A62-23A25CFCE717";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "L_bankRight_locShape" -p "L_bankRight_loc";
	rename -uid "18849A31-465C-1F15-4FDB-B592AD7C53C9";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_bankLeft_loc_Grp" -p "L_toe_loc";
	rename -uid "0B2C7F88-4493-9D99-932D-98AD6F31A680";
	setAttr ".t" -type "double3" 1 -1 1 ;
createNode transform -n "L_bankLeft_loc" -p "L_bankLeft_loc_Grp";
	rename -uid "E6DFB17C-4F2D-6308-EBB7-E59B486D3FEF";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "L_bankLeft_locShape" -p "L_bankLeft_loc";
	rename -uid "F1F309B0-42DA-51CF-A270-5FB59C40941F";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_toeExtra_loc_Grp" -p "L_toe_loc";
	rename -uid "3DA064A8-4E69-44EF-C369-59813152C293";
	setAttr ".t" -type "double3" 0 -1 1 ;
createNode transform -n "L_toeExtra_loc" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toe_loc_Grp|L_toe_loc|L_toeExtra_loc_Grp";
	rename -uid "487A0803-4126-3940-2361-A8B7D8B20EC6";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "L_toeExtra_locShape" -p "|L_hip_loc_mirror|L_hip_loc_Grp|L_hip_loc|L_toe_loc_Grp|L_toe_loc|L_toeExtra_loc_Grp|L_toeExtra_loc";
	rename -uid "4B70FA86-46F9-0136-A9A1-D58EC16A4207";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_toeEndExtra_loc_Grp" -p "L_toe_loc";
	rename -uid "0403E2F0-4F69-756D-1C5E-62A0282761AC";
	setAttr ".t" -type "double3" 0 -1 3 ;
createNode transform -n "L_toeEndExtra_loc" -p "L_toeEndExtra_loc_Grp";
	rename -uid "E09F0D9F-48C6-D5EF-754B-A78B38BFE501";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "L_toeEndExtra_locShape" -p "L_toeEndExtra_loc";
	rename -uid "23104371-42BA-19E0-A5C7-E69F32CEF6EB";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_heelExtra_loc_Grp" -p "L_toe_loc";
	rename -uid "C3AE3CEE-4444-F840-2457-B993D063E01C";
	setAttr ".t" -type "double3" 0 -1 -1 ;
createNode transform -n "L_heelExtra_loc" -p "L_heelExtra_loc_Grp";
	rename -uid "D6BD302A-45E5-06EB-FA6F-2A95F0E9B538";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "L_heelExtra_locShape" -p "L_heelExtra_loc";
	rename -uid "4FD8DA4A-4B45-76D3-E5D2-52A738D9DC61";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "L_leg_vector_Grp" -p "L_hip_loc";
	rename -uid "DAD227F5-4DFD-F9E8-A96B-CDA320723B32";
createNode transform -n "L_leg_vector" -p "L_leg_vector_Grp";
	rename -uid "3F4E2448-4C02-6E0D-A035-269F027A3FA0";
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
	setAttr ".rig_part" -type "string" "leg";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hip";
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
	rename -uid "A2BCDA1A-4F93-A138-9B9F-CC96F3489F81";
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
	setAttr ".rig_boneType" -type "string" "leg";
createNode transform -n "R_hip_curve" -p "R_hip_nonParent";
	rename -uid "1CAC4B8E-4797-4CAA-2871-D78579CDF223";
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
	setAttr ".rig_boneType" -type "string" "leg";
createNode nurbsCurve -n "R_hip_curveShape" -p "R_hip_curve";
	rename -uid "1F64575E-4784-B9D8-B318-8DA349735F31";
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
		-6 22 0
		-6 12 3.0000000000000004
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "hip";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg";
createNode transform -n "R_knee_curve" -p "R_hip_nonParent";
	rename -uid "7D9C2B91-44D3-499B-A1FD-02B4CA84BADC";
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
	setAttr ".rig_boneType" -type "string" "leg";
createNode nurbsCurve -n "R_knee_curveShape" -p "R_knee_curve";
	rename -uid "0D182B78-464E-7A22-5D4D-8A81F9B29409";
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
		-6 12 3.0000000000000004
		-6 7 -2
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "knee";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg";
createNode transform -n "R_ankle_curve" -p "R_hip_nonParent";
	rename -uid "AECA4A6F-4623-D0EE-EA23-EAA326900B44";
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
	setAttr ".rig_boneType" -type "string" "leg";
createNode nurbsCurve -n "R_ankle_curveShape" -p "R_ankle_curve";
	rename -uid "37278443-4DC3-5993-F32E-8DBC7487A358";
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
		-6 7 -2
		-6 1 0
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "ankle";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg";
createNode transform -n "R_toe_curve" -p "R_hip_nonParent";
	rename -uid "1F9E089B-435C-8304-BBA8-13A380545323";
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
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curve";
	setAttr ".rig_boneType" -type "string" "leg";
createNode nurbsCurve -n "R_toe_curveShape" -p "R_toe_curve";
	rename -uid "208CE08C-4C04-F243-8178-0C9CE06F84F1";
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
		-6 1 0
		-6 1 3
		;
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "curveShape";
	setAttr ".rig_boneType" -type "string" "leg";
createNode transform -n "R_hip_loc_mirror";
	rename -uid "FF339525-42D2-D701-DE4E-20830EE1673A";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".t" -type "double3" -6 22 0 ;
	setAttr ".s" -type "double3" -1 1 1 ;
	setAttr ".rig_side" -type "string" "R";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "mirrorRoot";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "leg";
createNode transform -n "R_hip_loc_Grp" -p "R_hip_loc_mirror";
	rename -uid "E35C1CA2-4AF1-B65C-11A1-2E83B74C6FB1";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_boneType" -ln "rig_boneType" -dt "string";
	setAttr ".rig_side" -type "string" "L";
	setAttr ".rig_type" -type "string" "quad";
	setAttr ".rig_part" -type "string" "rootPoint";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "space";
	setAttr ".rig_boneType" -type "string" "leg";
createNode transform -n "R_hip_loc" -p "R_hip_loc_Grp";
	rename -uid "3602B4EC-4C0B-E981-C398-B5ABD32A6A98";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_hip_locShape" -p "R_hip_loc";
	rename -uid "BB920448-428D-0398-0917-93A39C9E1860";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_knee_loc_Grp" -p "R_hip_loc";
	rename -uid "44D14C49-410E-B269-743D-87A88BD7DD22";
	setAttr ".t" -type "double3" 0 -10 3.0000000000000004 ;
createNode transform -n "R_knee_loc" -p "R_knee_loc_Grp";
	rename -uid "21C5831A-44A6-9595-C145-FDB29D1C46D3";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_knee_locShape" -p "R_knee_loc";
	rename -uid "44C2F2B3-426A-5FAA-B6EF-5D9409C4C798";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_hipExtra_loc_Grp" -p "R_knee_loc";
	rename -uid "6C5F0B5C-4C09-4CC0-F61C-72A544AE9CDE";
	setAttr ".r" -type "double3" 3.1805546814635168e-15 0 0 ;
createNode transform -n "R_hipExtra_loc" -p "R_hipExtra_loc_Grp";
	rename -uid "0DD42606-4407-2365-18B8-D4AE66627368";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_hipExtra_locShape" -p "R_hipExtra_loc";
	rename -uid "B095FA34-44E5-DFD8-4D77-B2A1163BF2F7";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_hipExtra_loc_Grp_parentConstraint1" -p "R_hipExtra_loc_Grp";
	rename -uid "E043B970-4575-7B32-A18C-54A76F8C5722";
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
	rename -uid "EC7F7D57-4180-91FF-A2F8-67A392B2B201";
	setAttr ".t" -type "double3" 0 0 1 ;
createNode transform -n "R_kneeExtra_loc" -p "R_kneeExtra_loc_Grp";
	rename -uid "11C4AB2F-4BD9-4301-3B62-3C90E0C1B305";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_kneeExtra_locShape" -p "R_kneeExtra_loc";
	rename -uid "853BA394-417C-F560-84D2-C7B0683E7B8E";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_knee_ankleExtra1_loc_Grp" -p "R_knee_loc";
	rename -uid "3D615F52-4BBD-31E9-C752-048008E48740";
createNode transform -n "R_knee_ankleExtra1_loc" -p "R_knee_ankleExtra1_loc_Grp";
	rename -uid "7E8795D6-4281-8658-971A-70B59D2018A1";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_knee_ankleExtra1_locShape" -p "R_knee_ankleExtra1_loc";
	rename -uid "7A5C69D0-4EB1-D6E9-CE05-9588F9A91334";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_knee_ankleExtra1_loc_Grp_parentConstraint1" -p "R_knee_ankleExtra1_loc_Grp";
	rename -uid "15F770E2-4FED-CE3E-55E6-D18FDF8F2156";
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
	rename -uid "1012DD0C-45ED-95E7-8FF2-99BD2CAF6B28";
	setAttr ".t" -type "double3" 0 0 -4.4408920985006262e-16 ;
createNode aimConstraint -n "R_L_aim_support1_aimConstraint1" -p "R_L_aim_support1";
	rename -uid "6D293737-4D02-C866-F17A-4E855FA01FB5";
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
	rename -uid "2442DC07-410E-5C55-696F-22AEBD01F8EF";
	setAttr ".t" -type "double3" 0 0 -4.4408920985006262e-16 ;
createNode aimConstraint -n "R_L_aim_support2_aimConstraint1" -p "R_L_aim_support2";
	rename -uid "9D7287B8-4E0C-2B9D-042E-7BA617349506";
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
	rename -uid "4E47ED60-45FA-483E-C6D3-2C930995F700";
	setAttr ".t" -type "double3" 0 -15 -2 ;
createNode transform -n "R_ankle_loc" -p "R_ankle_loc_Grp";
	rename -uid "1C10EAA1-4607-1911-C2BC-F0AE90510F6D";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_ankle_locShape" -p "R_ankle_loc";
	rename -uid "E3511A5D-4717-B3FF-DD49-74B0B540C518";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_knee_ankleExtra2_loc_Grp" -p "R_ankle_loc";
	rename -uid "289194FE-401C-376C-BD45-4EADA42C2611";
createNode transform -n "R_knee_ankleExtra2_loc" -p "R_knee_ankleExtra2_loc_Grp";
	rename -uid "E50F7CE6-4DDA-A1F7-1EA3-F3B6DDEAE11A";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_knee_ankleExtra2_locShape" -p "R_knee_ankleExtra2_loc";
	rename -uid "D80CBB8D-48E8-1169-5DC2-93AF0DF0A684";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_knee_ankleExtra2_loc_Grp_parentConstraint1" -p "R_knee_ankleExtra2_loc_Grp";
	rename -uid "A0E426E4-40A7-5AC1-8BA5-3CA49B2B97B9";
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
	rename -uid "0ABE76DB-4CED-B073-F4B0-E29B1361B0C0";
	setAttr ".t" -type "double3" 0 0 -1 ;
createNode transform -n "R_ankleExtra_loc" -p "R_ankleExtra_loc_Grp";
	rename -uid "DD13225E-4860-35D4-C003-75A7482154C2";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_ankleExtra_locShape" -p "R_ankleExtra_loc";
	rename -uid "47FC3F23-421B-7FAF-7D21-2E8AFF86378B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_toeExtra_loc_Grp" -p "R_ankle_loc";
	rename -uid "88249D5F-43BA-82C0-04FE-AA9607CC57D5";
	setAttr ".r" -type "double3" -3.1805546814635168e-15 0 0 ;
createNode transform -n "R_toeExtra_loc" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_ankle_loc_Grp|R_ankle_loc|R_toeExtra_loc_Grp";
	rename -uid "4561CFE6-4819-4D49-A294-6182A81D7857";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_toeExtra_locShape" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_ankle_loc_Grp|R_ankle_loc|R_toeExtra_loc_Grp|R_toeExtra_loc";
	rename -uid "E1F295EB-460F-D9CB-9530-6CA43B269C3D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode parentConstraint -n "R_toeExtra_loc_Grp_parentConstraint1" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_ankle_loc_Grp|R_ankle_loc|R_toeExtra_loc_Grp";
	rename -uid "8FD8CA4E-4346-9C44-CC35-658836CFF265";
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
	rename -uid "74DD3C30-4A64-4CED-AFF5-0D8F053A4B81";
createNode aimConstraint -n "R_L_aim_support3_aimConstraint1" -p "R_L_aim_support3";
	rename -uid "E72F488E-439D-7A1E-5D88-D8BE15AF8207";
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
	rename -uid "5CA19732-4DC7-9091-650E-D49725B19DE6";
createNode aimConstraint -n "R_L_aim_support4_aimConstraint1" -p "R_L_aim_support4";
	rename -uid "7D4553D9-43B9-35F9-A1DC-C2AD37EB5F7C";
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
createNode transform -n "R_toe_loc_Grp" -p "R_hip_loc";
	rename -uid "C8ABF65E-4712-C0E8-F269-7E834641B5FE";
	setAttr ".t" -type "double3" 0 -21 0 ;
createNode transform -n "R_toe_loc" -p "R_toe_loc_Grp";
	rename -uid "5CF662F8-4FBB-2974-C718-5A82B4F44F7A";
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
	setAttr ".rig_part" -type "string" "toe";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_toe_locShape" -p "R_toe_loc";
	rename -uid "FB81B058-45E2-76F8-77F6-7A86BBCF4E20";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_toeEnd_loc_Grp" -p "R_toe_loc";
	rename -uid "AD3E35D7-4FCF-B140-D085-59B9E50F9B1B";
	setAttr ".t" -type "double3" 0 0 3 ;
createNode transform -n "R_toeEnd_loc" -p "R_toeEnd_loc_Grp";
	rename -uid "716952C6-463A-12AF-79B6-A488C5D75FC2";
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
	setAttr ".rig_part" -type "string" "toeEnd";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "loc";
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_toeEnd_locShape" -p "R_toeEnd_loc";
	rename -uid "27E55CC2-41F9-1402-5CC9-AAB4BBDBE0BD";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.5 0.5 0.5 ;
createNode transform -n "R_bankRight_loc_Grp" -p "R_toe_loc";
	rename -uid "C84B033B-48E3-748B-AA38-E88DA65901FA";
	setAttr ".t" -type "double3" -1 -1 1 ;
createNode transform -n "R_bankRight_loc" -p "R_bankRight_loc_Grp";
	rename -uid "8F293820-4692-8AE4-46B5-E2B3D049E21D";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "1";
createNode locator -n "R_bankRight_locShape" -p "R_bankRight_loc";
	rename -uid "3A27B8E7-45E5-8814-DCFC-80995C90B18D";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_bankLeft_loc_Grp" -p "R_toe_loc";
	rename -uid "70CC8FB5-4509-FF94-D0B2-479B0DE2B27E";
	setAttr ".t" -type "double3" 1 -1 1 ;
createNode transform -n "R_bankLeft_loc" -p "R_bankLeft_loc_Grp";
	rename -uid "5F3B1BD8-42C1-4300-E478-B6B3602982C6";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "0";
createNode locator -n "R_bankLeft_locShape" -p "R_bankLeft_loc";
	rename -uid "2754932C-41B5-6690-9C86-59B91A15519B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_toeExtra_loc_Grp" -p "R_toe_loc";
	rename -uid "F7625AF2-4736-6AE3-E49A-C6A460829192";
	setAttr ".t" -type "double3" 0 -1 1 ;
createNode transform -n "R_toeExtra_loc" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toe_loc_Grp|R_toe_loc|R_toeExtra_loc_Grp";
	rename -uid "90640E3A-4AF1-0159-C8AD-C388CF239A51";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "3";
createNode locator -n "R_toeExtra_locShape" -p "|R_hip_loc_mirror|R_hip_loc_Grp|R_hip_loc|R_toe_loc_Grp|R_toe_loc|R_toeExtra_loc_Grp|R_toeExtra_loc";
	rename -uid "E6C7DDD6-4D4C-C590-4CCA-3ABB57E106F5";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_toeEndExtra_loc_Grp" -p "R_toe_loc";
	rename -uid "F64B957C-4100-34DC-4397-64A7EBEAFE77";
	setAttr ".t" -type "double3" 0 -1 3 ;
createNode transform -n "R_toeEndExtra_loc" -p "R_toeEndExtra_loc_Grp";
	rename -uid "61794E5A-4105-D94E-1F8B-DB98098F61B7";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "4";
createNode locator -n "R_toeEndExtra_locShape" -p "R_toeEndExtra_loc";
	rename -uid "FB050D8F-4720-BF8A-6DEF-57B0CFA70E10";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_heelExtra_loc_Grp" -p "R_toe_loc";
	rename -uid "23F9CC4D-4575-3551-E891-E2A3288FF2E2";
	setAttr ".t" -type "double3" 0 -1 -1 ;
createNode transform -n "R_heelExtra_loc" -p "R_heelExtra_loc_Grp";
	rename -uid "B2B17244-4001-0A21-A395-298213F5BF5D";
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
	setAttr ".rig_boneType" -type "string" "leg";
	setAttr ".rig_index" -type "string" "2";
createNode locator -n "R_heelExtra_locShape" -p "R_heelExtra_loc";
	rename -uid "9008E259-4F88-F63C-4248-ED814ADBB579";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.25 0.25 0.25 ;
createNode transform -n "R_leg_vector_Grp" -p "R_hip_loc";
	rename -uid "34C85FBF-4044-503B-49B9-A580A243EED9";
createNode transform -n "R_leg_vector" -p "R_leg_vector_Grp";
	rename -uid "2E637378-408C-E112-9C10-33ADE86D05C1";
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
	setAttr ".rig_part" -type "string" "leg";
	setAttr ".rig_role" -type "string" "main";
	setAttr ".rig_data" -type "string" "aimVector";
	setAttr ".rig_boneType" -type "string" "hip";
createNode nurbsCurve -n "R_leg_vectorShape" -p "R_leg_vector";
	rename -uid "2AEC5522-4249-B86C-2E9C-188C8FA31DAE";
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
	rename -uid "3A3C0EAE-418B-7B5B-1BA6-B39E8BE3B19D";
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
	rename -uid "BD8502AF-4C31-6D94-1E39-C7955D945935";
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
	rename -uid "FDA3E8CD-47D1-0562-4E5F-12AD895D6020";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "95EE210B-4C2F-DC50-C474-0A9B6DAF5C99";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "B5DEC747-4F12-F80D-A856-F3B33158D93F";
createNode displayLayerManager -n "layerManager";
	rename -uid "9BF1FED6-4B45-A197-C5ED-D5922E6EA688";
createNode displayLayer -n "defaultLayer";
	rename -uid "0349FAA2-4037-1166-BDD1-40B61D17DED6";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "E89E4766-46B8-1F54-2FAD-CE95A6F472C0";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "18BD152B-47D0-B8AF-228D-98BB6CE1C394";
	setAttr ".g" yes;
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
	setAttr ".mSceneName" -type "string" "D:/Code/MayaCode/autoRig/guide_rigs/guide_quad_leg.ma";
	setAttr ".rt_cpuRayBundleSize" 4;
	setAttr ".rt_gpuRayBundleSize" 128;
	setAttr ".rt_maxPaths" 10000;
	setAttr ".rt_engineType" 3;
	setAttr ".rt_gpuResizeTextures" 0;
createNode shapeEditorManager -n "shapeEditorManager1";
	rename -uid "ACB42E0F-414C-E688-98D9-008A20491864";
createNode poseInterpolatorManager -n "poseInterpolatorManager1";
	rename -uid "EE0AA319-47D7-0B0D-4363-9B8C668AD435";
createNode renderLayerManager -n "renderLayerManager1";
	rename -uid "176C7874-4131-79A0-9A8E-0B9215D7095D";
createNode renderLayer -n "defaultRenderLayer1";
	rename -uid "6904B8B9-44D8-89A6-F9F7-CFAB4708A9BB";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "73D5ED51-4D1D-183D-A736-A49103CE9E18";
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
	rename -uid "8949A734-4E5F-FB47-89AE-F6B226D8570B";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "B5EF52A8-4A13-FD6B-E06E-8CB06E7AC07E";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "6CE21F9B-4909-BB49-41FF-D7A8EF85B36D";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -358.62365193157376 6.200807059332436 ;
	setAttr ".tgi[0].vh" -type "double2" 553.6985434364932 465.024323601444 ;
	setAttr -s 13 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 30;
	setAttr ".tgi[0].ni[0].y" -121.42857360839844;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" 30;
	setAttr ".tgi[0].ni[1].y" 8.5714282989501953;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" 10;
	setAttr ".tgi[0].ni[2].y" 528.5714111328125;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" 30;
	setAttr ".tgi[0].ni[3].y" 138.57142639160156;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" 30;
	setAttr ".tgi[0].ni[4].y" 268.57144165039062;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" 30;
	setAttr ".tgi[0].ni[5].y" 398.57144165039062;
	setAttr ".tgi[0].ni[5].nvs" 18304;
	setAttr ".tgi[0].ni[6].x" -21.428571701049805;
	setAttr ".tgi[0].ni[6].y" 658.5714111328125;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[0].ni[7].x" -72.449005126953125;
	setAttr ".tgi[0].ni[7].y" 764.391845703125;
	setAttr ".tgi[0].ni[7].nvs" 18306;
	setAttr ".tgi[0].ni[8].x" 287.9737548828125;
	setAttr ".tgi[0].ni[8].y" 820.93670654296875;
	setAttr ".tgi[0].ni[8].nvs" 18306;
	setAttr ".tgi[0].ni[9].x" -354.95797729492188;
	setAttr ".tgi[0].ni[9].y" 494.20166015625;
	setAttr ".tgi[0].ni[9].nvs" 18306;
	setAttr ".tgi[0].ni[10].x" -330;
	setAttr ".tgi[0].ni[10].y" 268.57144165039062;
	setAttr ".tgi[0].ni[10].nvs" 18304;
	setAttr ".tgi[0].ni[11].x" 317.14285278320312;
	setAttr ".tgi[0].ni[11].y" 268.57144165039062;
	setAttr ".tgi[0].ni[11].nvs" 18304;
	setAttr ".tgi[0].ni[12].x" 10;
	setAttr ".tgi[0].ni[12].y" 268.57144165039062;
	setAttr ".tgi[0].ni[12].nvs" 18304;
createNode script -n "backUp_uiConfigurationScriptNode1";
	rename -uid "69FF169C-4342-667B-29C3-F6864FE16C50";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
	setAttr -s 2 ".r";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr ".ren" -type "string" "arnold";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya2022-default/config.ocio";
	setAttr ".vtn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".vn" -type "string" "ACES 1.0 SDR-video";
	setAttr ".dn" -type "string" "sRGB";
	setAttr ".wsn" -type "string" "ACEScg";
	setAttr ".otn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".potn" -type "string" "ACES 1.0 SDR-video (sRGB)";
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "L_hip_locShape.wp" "L_hip_curveShape.cp[0]";
connectAttr "L_knee_locShape.wp" "L_hip_curveShape.cp[1]";
connectAttr "L_knee_locShape.wp" "L_knee_curveShape.cp[0]";
connectAttr "L_ankle_locShape.wp" "L_knee_curveShape.cp[1]";
connectAttr "L_ankle_locShape.wp" "L_ankle_curveShape.cp[0]";
connectAttr "L_toe_locShape.wp" "L_ankle_curveShape.cp[1]";
connectAttr "L_toe_locShape.wp" "L_toe_curveShape.cp[0]";
connectAttr "L_toeEnd_locShape.wp" "L_toe_curveShape.cp[1]";
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
connectAttr "L_toe_loc.t" "L_L_aim_support4_aimConstraint1.tg[0].tt";
connectAttr "L_toe_loc.rp" "L_L_aim_support4_aimConstraint1.tg[0].trp";
connectAttr "L_toe_loc.rpt" "L_L_aim_support4_aimConstraint1.tg[0].trt";
connectAttr "L_toe_loc.pm" "L_L_aim_support4_aimConstraint1.tg[0].tpm";
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
connectAttr "R_hip_locShape.wp" "R_hip_curveShape.cp[0]";
connectAttr "R_knee_locShape.wp" "R_hip_curveShape.cp[1]";
connectAttr "R_knee_locShape.wp" "R_knee_curveShape.cp[0]";
connectAttr "R_ankle_locShape.wp" "R_knee_curveShape.cp[1]";
connectAttr "R_ankle_locShape.wp" "R_ankle_curveShape.cp[0]";
connectAttr "R_toe_locShape.wp" "R_ankle_curveShape.cp[1]";
connectAttr "R_toe_locShape.wp" "R_toe_curveShape.cp[0]";
connectAttr "R_toeEnd_locShape.wp" "R_toe_curveShape.cp[1]";
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
connectAttr "R_toe_loc.t" "R_L_aim_support4_aimConstraint1.tg[0].tt";
connectAttr "R_toe_loc.rp" "R_L_aim_support4_aimConstraint1.tg[0].trp";
connectAttr "R_toe_loc.rpt" "R_L_aim_support4_aimConstraint1.tg[0].trt";
connectAttr "R_toe_loc.pm" "R_L_aim_support4_aimConstraint1.tg[0].tpm";
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
connectAttr "L_leg_vectorShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "uiConfigurationScriptNode.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "sceneConfigurationScriptNode.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "shapeEditorManager1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "poseInterpolatorManager1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "L_leg_vector.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "backUp_uiConfigurationScriptNode.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn"
		;
connectAttr "L_ankle_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn"
		;
connectAttr "L_ankle_curveShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn"
		;
connectAttr "L_toe_locShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn";
connectAttr "L_leg_vector_Grp_pointConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn"
		;
connectAttr "L_leg_vector_Grp_aimConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn"
		;
connectAttr "L_leg_vector_Grp.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn"
		;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "defaultRenderLayer1.msg" ":defaultRenderingList1.r" -na;
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
// End of guide_quad_leg.ma
