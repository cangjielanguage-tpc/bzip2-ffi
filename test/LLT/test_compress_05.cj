// DEPENDENCE: a.txt
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import io.*

main() {
    var args = GlobalParam()
    args.setForceOverwrite(true)
    var path2: String = getcwd()
    var ret: Int32 = BZCommon.globalParamSet(args)
    if (ret != 0) {
        return 1
    }
    ret = BZUtils.compress("${path2}/a.txt")    //覆盖目标文件
    if (ret != 0) {
        return 1
    }
    var rFs: File = File("${path2}/a.txt.bz2", Read, Open)
    if (rFs.canRead()) {
        return 0
    } else {
        return 1
    }
}

