// DEPENDENCE: test_BZUtils_compress.md
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import fs.*

main() {
    var path: String = getcwd()
    var fileName: String = "${path}/test_BZUtils_compress.md"
    var params = GlobalParam()

    params.setKeepInputFiles(true) // 预期结果为源文件保留

    BZCommon.globalParamSet(params)
    BZUtils.compress(fileName)

    if(!File.exists("${path}/test_BZUtils_compress.md.bz2")) {
        return -1
    }
    return 0
}
