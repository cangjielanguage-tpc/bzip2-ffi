// DEPENDENCE: test1.md
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import io.*

main() {
    var path: String = getcwd()
    var params = GlobalParam()
    params.setOpMode(1)
    BZCommon.globalParamSet(params)
    
    BZUtils.compress("${path}/test1.md")

    if(!File.exist("${path}/test1.md.bz2")) {
        return -1
    }

    return 0
}
