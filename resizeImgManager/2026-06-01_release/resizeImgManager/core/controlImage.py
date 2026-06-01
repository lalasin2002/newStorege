
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import cv2
import os
import numpy

def resizeImage(imagePath , width = 512 , height = 512):
    """
    지정한 경로의 이미지 파일을 읽어와 원하는 크기(width, height)로 리사이즈한 후 NumPy 배열 형태로 반환합니다.

    Args:
        imagePath (str): 리사이즈할 원본 이미지 파일의 절대 또는 상대 경로.
        width (int, optional): 변경할 이미지의 가로 픽셀 크기. 기본값은 512.
        height (int, optional): 변경할 이미지의 세로 픽셀 크기. 기본값은 512.

    Returns:
        numpy.ndarray or None: 리사이즈가 완료된 이미지의 데이터. 파일 처리 실패 시 None을 반환합니다.
        
    Raises:
        FileNotFoundError: 지정한 경로에 원본 파일이 존재하지 않을 경우 발생합니다.
        ValueError: 파일은 존재하나 이미지 포맷이 아니거나 손상되어 읽을 수 없을 경우 발생합니다.
    """
    isExistPath = os.path.exists(imagePath)
    if not isExistPath:
        raise FileNotFoundError(u">> 에러 : {path} 가 존재하지않습니다.".format(imagePath))
    try:
        img = cv2.imread(imagePath)
        if img is None:
            raise ValueError(">> 에러 : {path} 이미지를 읽을수없습니다." .format(imagePath))

        reSizeImg = cv2.resize(img , (width , height))
        return reSizeImg 
    except Exception as e:
        print (">> {}" .format(e))
        return None
    



def saveImage(cv2_item , savePath ):
    """
    OpenCV로 처리된 이미지 데이터(NumPy 배열)를 지정한 경로에 파일로 저장합니다.
    저장 경로에 필요한 폴더가 존재하지 않는다면 자동으로 생성합니다.

    Args:
        cv2_item (numpy.ndarray): 저장할 이미지의 배열 데이터 (OpenCV 이미지 객체).
        savePath (str): 이미지가 저장될 전체 경로 및 파일명 (예: 'output/result.jpg').

    Returns:
        str or None: 저장이 성공적으로 완료된 경우 저장된 파일의 전체 경로를 반환합니다. 실패 시 None을 반환합니다.
        
    Raises:
        TypeError: 전달받은 cv2_item 객체가 NumPy 배열(numpy.ndarray) 타입이 아닐 경우 발생합니다.
    """
    if not isinstance(cv2_item , numpy.ndarray ):
        raise TypeError(u">> 에러 : 전달받은 이미지는 NumPy 배열이 아닙니다.")
    try:
        pathDir , fileName = os.path.split(savePath )
        isDirPath = os.path.exists(pathDir)

        if pathDir and not os.path.exists(pathDir):
            os.makedirs(pathDir)

        #cv2_item.imwrite() 가 아님 cv2.imwrite() 를 사용, OpenCV는 numpy.ndarray이다
        cv2.imwrite(savePath,cv2_item)
        return savePath

    except Exception as e:
        print (">> {}" .format(e))
        return None


