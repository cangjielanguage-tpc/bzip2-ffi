// DEPENDENCE: a.txt
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import io.*

main() {
    var args = GlobalParam()
    args.setVerbosity()
    var path2: String = getcwd()
    BZCommon.globalParamSet(args)
    BZUtils.compress("${path2}/a.txt")   //压缩过程中会打印压缩信息
    var rFs: FileStream = FileStream("${path2}/a.txt.bz2", OpenMode.Open)
    if (rFs.openFile()) {
        return 0
    } else {
        return 1
    }
}
