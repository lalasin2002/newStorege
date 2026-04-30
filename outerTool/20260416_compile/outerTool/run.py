# -*- coding: utf-8 -*-
import sys, os , re ,importlib


def launchTool():
    try:
        current_path = __file__
    except NameError:
        current_path = sys.argv[0]
    app_path = sys.executable
    version = 2020
    search = re.search(r"Maya(\d{4})", app_path, re.IGNORECASE)
    if search:
        version = int(search.group(1))
    target_module_name = "StandOuterTool{}".format(version)


    current_folderPath = os.path.abspath(os.path.dirname(current_path))
    if current_folderPath not in sys.path:
        sys.path.append(current_folderPath)
    try:
        tool_module = importlib.import_module(target_module_name)
        tool_module.show()
    except ImportError as e:
        print(u">> [에러] {} 버전에 맞는 pyd 모듈을 찾을 수 없거나 DLL 로드에 실패했습니다.".format(version))
        print(u">> [상세 에러]: {}".format(e))
    except Exception as e:
            print(u">> [에러] 실행 중 알 수 없는 에러 발생: {}".format(e))


if __name__ == "__main__":
    launchTool()

