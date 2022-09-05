// DEPENDENCE: test1.md
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import io.*

main() {
    var path: String = getcwd()

    var params = GlobalParam()
    params.setOpMode(100) // BZCommon.globalParamSet(params) 返回-1
    var ret = BZCommon.globalParamSet(params)
    if(ret == -1) {
        return 0
    }
    return -1
}
