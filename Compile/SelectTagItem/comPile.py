import py_compile
File = "SelectTagItem.py"
Path = r"C:\Users\P097\Documents\maya\scripts\SelectTagItem\{}" 

py_compile.compile(Path.format(File) , cfile=Path.format('SelectTagItem.pyc'), dfile=None)