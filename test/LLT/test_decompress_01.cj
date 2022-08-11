// DEPENDENCE: a.txt.bz2
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*

main() {
    var a = GlobalParam()
    a.setOpMode(2)
    var path2: String = getcwd()
    BZCommon.GlobalParamSet(a)
    BZUtils.decompress("${path2}/a.txt.bz2")
    return 0
}
