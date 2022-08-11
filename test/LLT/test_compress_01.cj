// DEPENDENCE: a.txt.bz2
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import io.*

main() {
    var args = GlobalParam()
    var path2: String = getcwd()
    BZCommon.globalParamSet(args)
    BZUtils.compress("${path2}/a.txt")   //当前目录下生成a.txt.bz2压缩文件
    var rFs: FileStream = FileStream("${path2}/a.txt.bz2", OpenMode.Open)
    if (rFs.openFile()) {
        return 0
    } else {
        return 1
    }
}
