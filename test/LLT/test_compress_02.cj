// DEPENDENCE: a.txt
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import io.*

main() {
    var args = GlobalParam()
    args.setKeepInputFiles(true)
    var path2: String = getcwd()
    BZCommon.globalParamSet(args)
    BZUtils.compress("${path2}/a.txt")  //压缩时保留源文件
    var rFs1: FileStream = FileStream("${path2}/a.txt.bz2", OpenMode.Open)
    var rFs2: FileStream = FileStream("${path2}/a.txt", OpenMode.Open)
    if (rFs1.openFile()) {
        return 0
    } else {
        return 1
    }
    if (rFs2.openFile()) {
        return 0
    } else {
        return 1
    }
}
