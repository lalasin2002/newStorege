# -*- coding: utf-8 -*-

from setuptools import Extension, setup
from Cython.Build import cythonize


extension = Extension(
    "StandOuterTool2024",
    ["StandOuterTool2024.py"],
)


setup(
    name="StandOuterTool2024",
    ext_modules=cythonize(
        [extension],
        compiler_directives={"language_level": 3},
    ),
)
