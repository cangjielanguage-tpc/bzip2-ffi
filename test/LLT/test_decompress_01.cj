// DEPENDENCE: a.txt.bz2
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import fs.*

main() {
    var args = GlobalParam()
    args.setOpMode(2)
    var path2: String = getcwd()
    var ret: Int32 = BZCommon.globalParamSet(args)
    if (ret != 0) {
        return 1
    }
    ret = BZUtils.decompress("${path2}/a.txt.bz2")  //解压缩后当前目录生成a.txt文件
    if (ret != 0) {
        return 1
    }
    var rFs: File = File("${path2}/a.txt", Open(true, true))
    if (rFs.canRead()) {
        return 0
    } else {
        return 1
    }
}
