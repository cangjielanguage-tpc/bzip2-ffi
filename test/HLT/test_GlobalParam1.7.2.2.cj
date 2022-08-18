// DEPENDENCE: test_GlobalParam1.7.2.2.md.bz2
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import io.*

main() {
    var path: String = getcwd()
    var fileName: String = "${path}/test_GlobalParam1.7.2.2.md.bz2"
    var params = GlobalParam()

    params.setOpMode(2)
    params.setKeepInputFiles(false) // 预期结果为源文件不保留

    BZCommon.globalParamSet(params)
    BZUtils.decompress(fileName)

    if(File.exist("${path}/test_GlobalParam1.7.2.2.md.bz2")) {
        return -1
    }
    return 0
    
}
