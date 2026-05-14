# -*- coding: utf-8 -*-
import datetime, os , re



def get_todayFolder( path):
    """오늘 날짜 폴더 경로 (없으면 생성)"""
    today = datetime.datetime.now().strftime("%Y-%m-%d")
    folder = os.path.join(path, today)
    if not os.path.exists(folder):
        os.makedirs(folder)
    return folder.replace("\\", "/")

    
def get_nextSnapShot(path, prefix="snap_", ext=".jpg", padding=3):
    """
    다음 스냅샷 파일 경로를 반환합니다. (정규식 제거 버전)
    예: snap_001.jpg, snap_002.jpg
    """
    todayFolder = get_todayFolder(path)
    numbers = []

    for file in os.listdir(todayFolder):
        if file.startswith(prefix) and file.endswith(ext):
            #file 문자열에서 제거해서 숫자만
            num_str = file[len(prefix):-len(ext)] 
            if num_str.isdigit(): #숫자 맞는지 확인
                numbers.append(int(num_str))

    nextNumber = max(numbers) + 1 if numbers else 1
    nextNumber = str(nextNumber).zfill(padding)
    fileName = "{}{}{}".format(prefix, nextNumber, ext)
    return os.path.join(todayFolder, fileName).replace("\\", "/")


def get_resultFolder():
    """다음 결과 이미지 경로"""
    #작성예정