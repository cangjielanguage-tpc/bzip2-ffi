// DEPENDENCE: test_compress_uncompress.md
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import fs.*

main() {
    var path: String = getcwd()
    var fs: File = File("${path}/test_compress_uncompress.md", Open(true, true))
    var data: Array<UInt8> = []
    if (fs.canRead()) {      
        data = fs.readToEnd()
        //println(data)
        fs.close()
    }

    compressOne()
    decompressOne()
    var fs1: File = File("${path}/test_compress_uncompress.md", Open(true, true))
    var data1: Array<UInt8> = []
   
    if (fs1.canRead()) {      
        data1 = fs1.readToEnd()
        fs1.close()
    }
    if(data1 != data) {
        return -1
    }

    return 0
}

func compressOne() {
    var path: String = getcwd()
    var params = GlobalParam()
    params.setKeepInputFiles(false)
    params.setOpMode(1)
    BZCommon.globalParamSet(params)
    BZUtils.compress("${path}/test_compress_uncompress.md")
}
func decompressOne() {
    var path: String = getcwd()
    var params = GlobalParam()
    params.setKeepInputFiles(false)
    params.setOpMode(2)
    BZCommon.globalParamSet(params)
    BZUtils.decompress("${path}/test_compress_uncompress.md.bz2")

}