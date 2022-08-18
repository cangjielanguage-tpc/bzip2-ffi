// DEPENDENCE: test_GlobalParam.md
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import io.*

main() {
    var path: String = getcwd()
    var fileName: String = "${path}/test_GlobalParam.md"
    var params = GlobalParam()

    params.setKeepInputFiles(true) 
    params.setForceOverwrite(true) // 连续压缩两次相同的文件，结果覆盖

    BZCommon.globalParamSet(params)
    BZUtils.compress(fileName)
    BZUtils.compress(fileName)

    if(!File.exist("${path}/test_GlobalParam.md.bz2")) {
        return -1
    }
    return 0
    
}
