import maya.cmds as cmds

def Setup_Locator_Constraints():
    """
    숫자패드 배열로 명명된 27개 로케이터에 각 위치에 맞는 3개의 컨트롤러를 다중 구속(Parent Constraint)하고 가중치를 0으로 초기화
    Args:
        없음 (씬 내부의 이름 규칙을 기반으로 자동 실행)
    Returns:
        없음
    """
    # 층(Y축) 매핑 딕셔너리
    layer_map = {'F': 'upA_Ctrl', 'S': 'upB_Ctrl', 'T': 'upC_Ctrl'}
    
    # 행(Z축) 매핑 딕셔너리 (1,2,3=앞 / 4,5,6=중간 / 7,8,9=뒤)
    row_map = {
        1: 'frontA_Ctrl', 2: 'frontA_Ctrl', 3: 'frontA_Ctrl',
        4: 'frontB_Ctrl', 5: 'frontB_Ctrl', 6: 'frontB_Ctrl',
        7: 'frontC_Ctrl', 8: 'frontC_Ctrl', 9: 'frontC_Ctrl'
    }
    
    # 열(X축) 매핑 딕셔너리 (1,4,7=좌 / 2,5,8=중앙 / 3,6,9=우)
    col_map = {
        1: 'sideA_Ctrl', 4: 'sideA_Ctrl', 7: 'sideA_Ctrl',
        2: 'sideB_Ctrl', 5: 'sideB_Ctrl', 8: 'sideB_Ctrl',
        3: 'sideC_Ctrl', 6: 'sideC_Ctrl', 9: 'sideC_Ctrl'
    }

    # F, S, T 층을 순서대로 순회
    for layer_prefix, up_ctrl in layer_map.items():
        # 1번부터 9번까지 로케이터 순회
        for i in range(1, 10):
            # 로케이터 이름 조합 (예: loc_FCube01_Ctrl)
            loc_name = "loc_{0}Cube{1:02d}_Ctrl".format(layer_prefix, i)
            
            # 해당 로케이터가 씬에 존재하는지 확인 후 진행
            if not cmds.objExists(loc_name):
                continue
            
            # 현재 로케이터에 묶여야 할 앞/뒤, 좌/우 컨트롤러 색출
            front_ctrl = row_map[i]
            side_ctrl = col_map[i]
            
            # 묶어야 할 3개의 컨트롤러 리스트
            target_ctrls = [up_ctrl, front_ctrl, side_ctrl]
            
            # 다중 부모 구속(Parent Constraint) 적용 (오프셋 유지)
            constraint_node = cmds.parentConstraint(target_ctrls, loc_name, maintainOffset=True)[0]
            
            # 생성된 컨스트레인트 노드의 가중치(Weight) 속성 목록 가져오기
            weight_attrs = cmds.parentConstraint(constraint_node, query=True, weightAliasList=True)
            
            # 3개의 가중치를 모두 0으로 초기화 (스위치 끄기)
            for attr in weight_attrs:
                full_attr_path = "{0}.{1}".format(constraint_node, attr)
                cmds.setAttr(full_attr_path, 0)
                
    print (u"27개 로케이터의 다중 구속 및 가중치 0 세팅이 완료되었습니다.")


# 함수 실행
try: 
    cmds.undoInfo(openChunk=1)
    Setup_Locator_Constraints()
finally:
    cmds.undoInfo(closeChunk=1)