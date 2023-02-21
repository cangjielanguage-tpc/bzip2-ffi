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
    params.setSrcMode(100) //目前只支持 3
    var ret = BZCommon.globalParamSet(params)
    if(ret == -1) {
        return 0
    }

    return -1  
}
