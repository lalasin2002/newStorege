//Maya ASCII 2022 scene
//Name: guide_quad_arm.ma
//Last modified: Mon, Jul 06, 2026 09:13:44 PM
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
fileInfo "UUID" "4E7549C8-4716-BBD5-3B85-A887D1B73A02";
createNode transform -s -n "persp";
	rename -uid "677F818C-4641-C61C-0643-5A9D17F65ED7";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -27.970326093895089 116.35593708797268 53.218251793089195 ;
	setAttr ".r" -type "double3" -61.538352728803915 -26.199999999999097 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "BCA734B1-40F3-EFAA-FB90-5F97BA39E322";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 122.77700341018195;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 6 0 11.24999972723694 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "055EFCF8-40E0-6D66-7503-C0928C045399";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "15521102-47CC-B1D4-8300-E883C2A915FC";
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
	rename -uid "4FAB0583-499A-8E38-5425-8B9C7DF56950";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 4.8510097805287806 11.455396590164352 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "EACFD528-48BF-C45F-7824-0683DA170289";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 60.584173991531905;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "D381FFDB-4D31-FD43-DEA5-1F842498C241";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 1.6229122802956102 14.40815326511445 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "C98843EB-4040-4086-DC3F-94A75176E06A";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 29.550106458700757;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -n "L_arm_loc_mirror";
	rename -uid "42127E0D-4C0F-A0AA-1249-1097F5592145";
	addAttr -ci true -sn "rig_type" -ln "rig_type" -dt "string";
	addAttr -ci true -sn "rig_module" -ln "rig_module" -dt "string";
	addAttr -ci true -sn "rig_side" -ln "rig_side" -dt "string";
	addAttr -ci true -sn "rig_role" -ln "rig_role" -dt "string";
	addAttr -ci true -sn "rig_data" -ln "rig_data" -dt "string";
	addAttr -ci true -sn "rig_part" -ln "rig_part" -dt "string";
	addAttr -ci true -sn "rig_index" -ln "rig_index" -dt "string";
	setAttr ".t" -type "double3" 4 23 9 ;
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
createNode transform -n "L_bankRightPivot_loc" -p "L_bankRightPivot_loc_Grp";
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
createNode locator -n "L_bankRightPivot_locShape" -p "L_bankRightPivot_loc";
	rename -uid "04D9B464-4FF3-CF4F-EC3F-20AA2C6BD319";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_heelPivot_loc_Grp" -p "L_wristToe_loc";
	rename -uid "08B3E68F-4046-79FA-67E4-93B0A326F35A";
	setAttr ".t" -type "double3" 0 -1 -2.7276306013845897e-07 ;
createNode transform -n "L_heelPivot_loc" -p "L_heelPivot_loc_Grp";
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
createNode locator -n "L_heelPivot_locShape" -p "L_heelPivot_loc";
	rename -uid "9C504851-48C4-CDB3-6601-8B929703B988";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_bankLeftPivot_loc_Grp" -p "L_wristToe_loc";
	rename -uid "2B1F250C-439C-B8C2-8219-3A954D425EB5";
	setAttr ".t" -type "double3" 1 -1 0.74999972723693986 ;
createNode transform -n "L_bankLeftPivot_loc" -p "L_bankLeftPivot_loc_Grp";
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
createNode locator -n "L_bankLeftPivot_locShape" -p "L_bankLeftPivot_loc";
	rename -uid "BFF4BB71-479F-333C-E8CB-55A7571F1283";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_toePivot_loc_Grp" -p "L_wristToe_loc";
	rename -uid "D1851D4B-41E9-430A-4987-95B617C57BB6";
	setAttr ".t" -type "double3" 0 -1 0.74999972723693986 ;
createNode transform -n "L_toePivot_loc" -p "L_toePivot_loc_Grp";
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
createNode locator -n "L_toePivot_locShape" -p "L_toePivot_loc";
	rename -uid "7E54710D-4DEC-1153-9689-48A9FAA0A1C0";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "L_toeEndPivot_loc_Grp" -p "L_wristToe_loc";
	rename -uid "C3DE309D-46C5-7B36-6198-F18F1A508A6F";
	setAttr ".t" -type "double3" 0 -1 1.4999997272369399 ;
createNode transform -n "L_toeEndPivot_loc" -p "L_toeEndPivot_loc_Grp";
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
createNode locator -n "L_toeEndPivot_locShape" -p "L_toeEndPivot_loc";
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
	setAttr ".t" -type "double3" -4 23 9 ;
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
createNode transform -n "R_bankRightPivot_loc" -p "R_bankRightPivot_loc_Grp";
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
createNode locator -n "R_bankRightPivot_locShape" -p "R_bankRightPivot_loc";
	rename -uid "E63538FF-4F01-195A-57C5-7F9D75CF378B";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_heelPivot_loc_Grp" -p "R_wristToe_loc";
	rename -uid "65F5FD79-49D7-89E3-EF48-C3A5C6D5577E";
	setAttr ".t" -type "double3" 0 -1 -2.7276306013845897e-07 ;
createNode transform -n "R_heelPivot_loc" -p "R_heelPivot_loc_Grp";
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
createNode locator -n "R_heelPivot_locShape" -p "R_heelPivot_loc";
	rename -uid "7512ECD6-4444-01AB-09DB-B6B67C6007A2";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_bankLeftPivot_loc_Grp" -p "R_wristToe_loc";
	rename -uid "40915ABB-40F9-47F2-4114-1FA5D20B67CB";
	setAttr ".t" -type "double3" 1 -1 0.74999972723693986 ;
createNode transform -n "R_bankLeftPivot_loc" -p "R_bankLeftPivot_loc_Grp";
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
createNode locator -n "R_bankLeftPivot_locShape" -p "R_bankLeftPivot_loc";
	rename -uid "F69BE47C-4D42-28E5-20B9-39BE7F3A0292";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_toePivot_loc_Grp" -p "R_wristToe_loc";
	rename -uid "1D83C169-4440-B523-9A0C-5ABAD949C2EE";
	setAttr ".t" -type "double3" 0 -1 0.74999972723693986 ;
createNode transform -n "R_toePivot_loc" -p "R_toePivot_loc_Grp";
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
createNode locator -n "R_toePivot_locShape" -p "R_toePivot_loc";
	rename -uid "7E50932C-4829-3F13-B857-38AD7D2DE161";
	setAttr -k off ".v";
	setAttr ".los" -type "double3" 0.125 0.125 0.125 ;
createNode transform -n "R_toeEndPivot_loc_Grp" -p "R_wristToe_loc";
	rename -uid "3270F570-4797-1F9C-5FA3-258A14E715E8";
	setAttr ".t" -type "double3" 0 -1 1.4999997272369399 ;
createNode transform -n "R_toeEndPivot_loc" -p "R_toeEndPivot_loc_Grp";
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
createNode locator -n "R_toeEndPivot_locShape" -p "R_toeEndPivot_loc";
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
createNode lightLinker -s -n "lightLinker1";
	rename -uid "33F89EBC-4EE3-DCD5-37B4-49ACA94E49BE";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "758C3BF5-44AA-5BEF-6E22-DCB1D096C717";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "C3037264-4D05-4AB9-B6D0-7AB3D4AA0643";
createNode displayLayerManager -n "layerManager";
	rename -uid "8FEC3F46-4F78-E7DF-FE19-4A988D119182";
createNode displayLayer -n "defaultLayer";
	rename -uid "6EDC4998-46F1-E072-5DC2-2B8107F2EACF";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "471985CF-464C-F034-7E8E-E5BE19497592";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "D67474E4-4AF3-57C5-9E5B-988B5300D1F3";
	setAttr ".g" yes;
createNode script -n "backUp_uiConfigurationScriptNode";
	rename -uid "751FC17C-4A77-7AF8-B32A-B29510E8AEE0";
	setAttr ".b" -type "string" "// Maya Mel UI Configuration File.\n// No UI generated in batch mode.\n";
	setAttr ".st" 2;
createNode VRaySettingsNode -s -n "vraySettings";
	rename -uid "BA421CF7-4734-7FBD-768C-D6B53C0F8EEF";
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
	setAttr ".mSceneName" -type "string" "D:/Code/MayaCode/autoRig/guide_rigs/guide_quad_arm.ma";
	setAttr ".rt_cpuRayBundleSize" 4;
	setAttr ".rt_gpuRayBundleSize" 128;
	setAttr ".rt_maxPaths" 10000;
	setAttr ".rt_engineType" 3;
	setAttr ".rt_gpuResizeTextures" 0;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "8FA2B277-407B-4117-EAC0-858FD96DAE7B";
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
	rename -uid "06C1F400-470F-771B-61B2-929A6C0253C4";
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
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
dataStructure -fmt "raw" -as "name=externalContentTablZ:string=nodZ:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
dataStructure -fmt "raw" -as "name=idStructure:int32=ID";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_FBX:string=54";
dataStructure -fmt "raw" -as "name=faceConnectOutputStructure:bool=faceConnectOutput:string[200]=faceConnectOutputAttributes:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=faceConnectMarkerStructure:bool=faceConnectMarker:string[200]=faceConnectOutputGroups";
dataStructure -fmt "raw" -as "name=FBXFastExportSetting_MB:string=19424";
// End of guide_quad_arm.ma
