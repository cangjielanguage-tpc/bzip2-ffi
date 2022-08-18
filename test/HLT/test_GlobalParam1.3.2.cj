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
    params.setForceOverwrite(false) //设置为 flase,此时:连续两次压缩需要报错,该文件已经存在

    BZCommon.globalParamSet(params)

    BZUtils.compress(fileName)
    BZUtils.compress(fileName)

    if(!File.exist("${path}/test_GlobalParam.md.bz2")) {
        return -1
    }
    return 0
    
}
