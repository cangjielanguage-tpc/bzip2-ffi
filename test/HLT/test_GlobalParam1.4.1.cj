// DEPENDENCE: test.txt.bz2
// DEPENDENCE: test1.txt.bz2
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import io.*

main() {
    var path: String = getcwd()
    compress_one()
    compress_two()

    if(!File.exist("${path}/test.txt") || !File.exist("${path}/test1.txt")) {
        return -1
    }
    return 0
    
}

func compress_one() {
    var path: String = getcwd()
    var fileName: String = "${path}/test.txt.bz2"
    var params = GlobalParam()

    params.setOpMode(2)
    params.setSmallMode(false) 
    params.setVerbosity()

    BZCommon.globalParamSet(params)
    BZUtils.decompress(fileName)
}

func compress_two() {
    var path: String = getcwd()
    var fileName: String = "${path}/test1.txt.bz2"
    var params = GlobalParam()

    params.setOpMode(2) 
    params.setSmallMode(true) 
    params.setVerbosity()
    
    BZCommon.globalParamSet(params)
    BZUtils.decompress(fileName)
}