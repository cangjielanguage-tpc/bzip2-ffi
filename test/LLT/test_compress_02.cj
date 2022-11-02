// DEPENDENCE: a.txt
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import fs.*

main() {
    var args = GlobalParam()
    args.setKeepInputFiles(true)
    var path2: String = getcwd()
    var ret: Int32 = BZCommon.globalParamSet(args)
    if (ret != 0) {
        return 1
    }
    ret = BZUtils.compress("${path2}/a.txt")  //压缩时保留源文件
    if (ret != 0) {
        return 1
    }
    var rFs1: File = File("${path2}/a.txt.bz2", Open(true, true))
    var rFs2: File = File("${path2}/a.txt", Open(true, true))
    if (rFs1.canRead()) {
        return 0
    } else {
        return 1
    }
    if (rFs2.canRead()) {
        return 0
    } else {
        return 1
    }
}
