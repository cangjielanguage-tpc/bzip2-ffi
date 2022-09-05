// DEPENDENCE: test_BZUtils_decompress.md.bz2
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import io.*

main() {
    var path: String = getcwd()
    var fileName: String = "${path}/test_BZUtils_decompress.md.bz2"
    var params = GlobalParam()

    params.setKeepInputFiles(true) // 预期结果为源文件保留
    
    params.setOpMode(2)
    BZCommon.globalParamSet(params)
    BZUtils.decompress(fileName)

    if(!File.exist("${path}/test_BZUtils_decompress.md")) {
        return -1
    }
    return 0
}
