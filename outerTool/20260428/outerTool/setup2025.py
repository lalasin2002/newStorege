# -*- coding: utf-8 -*-


# -*- coding: utf-8 -*-

# ============================================================
# Maya 2020 / Python 2.7 / Cython .pyd 빌드 필수 환경 메모
# ============================================================
#
# [왜 이 파일이 필요한가]
# - Maya 2020 내장 Python(2.7)에서 사용할 .pyd 확장 모듈 빌드용
# - 일반 python.exe가 아니라 반드시 mayapy.exe 기준
#
#
# [필수 빌드 조건]
# 1) Maya 2020 DevKit 설치 필수
#    - Python.h 위치:
#      C:\Program Files\Autodesk\Maya2020\devkitBase\include\Python
#
# 2) python27.lib 링크 필수
#    - 라이브러리 위치:
#      C:\Program Files\Autodesk\Maya2020\lib
#
# 3) 최신 VS Build Tools 사용 권장
#    - VS 2026 Build Tools (MSVC v143 이상)
#
# 4) v140 강제 사용 금지
#    - VS2015(v140)는 최신 Windows SDK와 wchar.h 충돌 가능
#    - _mm_loadu_si64 intrinsic 오류 발생 가능
#    - 반드시 vcvars64.bat + DISTUTILS_USE_SDK=1 우회 권장
#
# 5) Windows SDK 19041 사용 권장
#    - 최신 SDK(26100)는 Python2.7 / Maya2020에서 충돌 가능
#    - build bat에서 아래 강제
#      set WindowsSDKVersion=10.0.19041.0\
#
# 6) build 캐시 삭제 필수
#    - 이전 잘못된 include path 재사용 방지
#    - build/
#    - StandOuterTool.c
#    - StandOuterTool.pyd
#
#
# [빌드 실행 방법]
# - build_maya2020_pyd.bat 실행
# - 내부적으로 VS2026 vcvars64 + mayapy 사용
#
#
# [주의]
# - 일반 Python 3.x용 setup.py와 구조는 같지만
#   Maya 2020 Python 2.7은 DevKit / lib 경로가 다름
# - 다른 Maya 버전은 DevKit 경로 따로 분기 필요
# ============================================================


# 위 한 줄:
# 파일 안에 한글 주석이 들어가므로 Python 2.7에서 utf-8 인코딩을 명시
# 안 적으면 mayapy에서 한글 주석 읽다가 깨질 수 있음

from setuptools import setup, Extension
# setup      : 빌드 실행 메인 함수
# Extension  : C/C++ 확장 모듈(.pyd) 설정 객체

from Cython.Build import cythonize
# .py 파일을 C 코드(.c)로 변환 후 확장 모듈 빌드

import sys
# 현재 실행 중인 Python 버전 확인용
# Maya 2020 = Python 2.7
# Maya 2022+ = Python 3.x

# ------------------------------------------------------------
# Python 버전에 따라 Cython 문법 레벨 자동 선택
# ------------------------------------------------------------
# Python 2.7 환경이면 language_level=2
# Python 3 환경이면 language_level=3
# 하나의 setup.py로 여러 Maya 버전 대응 가능
lang_level = 3 if sys.version_info[0] >= 3 else 2


# ------------------------------------------------------------
# C 확장 모듈 설정
# ------------------------------------------------------------
ext = Extension(
    "StandOuterTool2025",
    # 최종 생성될 모듈 이름
    # import StandOuterTool 로 불러오게 됨

    ["StandOuterTool2025.py"],
    # Cython이 컴파일할 원본 Python 파일
    # 이 파일이 StandOuterTool.c 로 변환된 뒤 .pyd 생성

    ### include_dirs
    # 2.7 :: r"C:\Program Files\Autodesk\Maya2020\devkitBase\include\Python"
    # 3.11 :: r"C:\Program Files\Autodesk\Maya2025\include\Python3.11"

    ### library_dirs
    #.2.7 :: r"C:\Program Files\Autodesk\Maya2020\lib"
    # 3.11 :: r"C:\Program Files\Autodesk\Maya2025\lib"

    ### libraries
    # 2.7 :: "python27"
    # 3.11 :: "python311"
    include_dirs=[
        # Python.h 가 있는 헤더 폴더
        # Maya 2020 DevKit 전용 경로
        # Python 2.7 내장 인터프리터용 C API 헤더 사용
        r"C:\Program Files\Autodesk\Maya2025\include\Python311\Python"
    ],

    library_dirs=[
        # python27.lib 위치
        # 링커가 Python API 심볼(PyObject 등)을 연결할 때 필요
        r"C:\Program Files\Autodesk\Maya2025\lib"
    ],

    libraries=[
        # 실제 링크할 라이브러리 이름
        # python27.lib 를 자동 참조
        "python311"
    ]
)


# ------------------------------------------------------------
# 빌드 실행
# ------------------------------------------------------------
setup(
    name="StandOuterTool2020",
    # 프로젝트 이름
    # pip / build 로그에 표시되는 이름

    ext_modules=cythonize(
        [ext],
        # 위에서 정의한 Extension 객체를 Cython 빌드 대상으로 전달

        compiler_directives={
            # Python 2 / 3 문법 차이를 자동 대응
            "language_level": lang_level
        }
    )
)