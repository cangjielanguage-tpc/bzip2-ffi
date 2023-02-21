// DEPENDENCE: test_GlobalParam.md
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import fs.*

main() {
    var path: String = getcwd()
    var fileName: String = "${path}/test_GlobalParam.md"
    var params = GlobalParam()
    params.setSrcMode(3) //目前只支持 3
    BZCommon.globalParamSet(params)
    BZUtils.compress(fileName)

    if(!File.exists("${path}/test_GlobalParam.md.bz2")) {
        return -1
    }
    return 0
    
}
