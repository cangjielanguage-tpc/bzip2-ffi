// DEPENDENCE: test.txt
// DEPENDENCE: test1.txt
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import fs.*

main() {
    var path: String = getcwd()
    var fileName: String = "${path}/test.txt"
    var params = GlobalParam()

    params.setBlockSize100k(100) 
    params.setVerbosity()

    var ret = BZCommon.globalParamSet(params)
    
    if(ret == -1) {
        return 0
    }
    
    return -1
    
}
