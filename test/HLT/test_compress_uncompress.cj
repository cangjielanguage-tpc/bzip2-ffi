// DEPENDENCE: test_compress_uncompress.md
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import io.*

main() {
    var path: String = getcwd()
    var fs: FileStream = FileStream("${path}/test_compress_uncompress.md")
    var data: String = ""
    if (fs.openFile()) {      
        data = fs.readAllText()
        //println(data)
        fs.close()
    }

    compressOne()
    decompressOne()
    var fs1: FileStream = FileStream("${path}/test_compress_uncompress.md")
    var data1: String = ""
   
    if (fs1.openFile()) {      
        data1 = fs1.readAllText() 
        fs1.close()
    }
    if(!data1.equals(data)) {
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