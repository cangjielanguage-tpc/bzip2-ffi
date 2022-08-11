// DEPENDENCE: a.txt.bz2
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import io.*

main() {
    var args = GlobalParam()
    args.setOpMode(2)
    var path2: String = getcwd()
    BZCommon.globalParamSet(args)
    BZUtils.decompress("${path2}/a.txt.bz2")  //解压缩后当前目录生成a.txt文件
    var rFs: FileStream = FileStream("${path2}/a.txt", OpenMode.Open)
    if (rFs.openFile()) {
        return 0
    } else {
        return 1
    }
}
