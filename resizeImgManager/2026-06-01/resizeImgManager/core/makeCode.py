# -*- coding: utf-8 -*-
import os ,sys ,io

def makeCodeFile(path , code):
    if sys.version_info[0] < 3:
        text_type = unicode
    else:
        text_type = str

    if not all(isinstance(x ,text_type ) for x in [path , code]):
        raise TypeError(u"path , code 모두 문자열 타입이어야합니다.")
    with io.open(path , "w" ,encoding="utf-8") as f:
        f.write(code)

    return u">> {} 생성완료" .format(path)
        
        
