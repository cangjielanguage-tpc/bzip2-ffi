// DEPENDENCE: test1.md.bz2
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
    
    BZUtils.decompress("${path}/test1.md.bz2")

    if(File.exist("${path}/test1.md")) {
        return -1
    }
    return 0
}
