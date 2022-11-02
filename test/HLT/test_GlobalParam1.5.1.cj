// DEPENDENCE: test.txt
// DEPENDENCE: test1.txt
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import fs.*

main() {
    var path: String = getcwd()
    compress_one()
    compress_two()

    if(!File.exists("${path}/test.txt.bz2") || !File.exists("${path}/test1.txt.bz2")) {
        return -1
    }
    
    return 0
    
}

func compress_one() {
    var path: String = getcwd()
    var fileName: String = "${path}/test.txt"
    var params = GlobalParam()

    params.setBlockSize100k(1) 
    params.setVerbosity()

    BZCommon.globalParamSet(params)
    BZUtils.compress(fileName)
}

func compress_two() {
    var path: String = getcwd()
    var fileName: String = "${path}/test1.txt"
    var params = GlobalParam()

    params.setBlockSize100k(9) 
    params.setVerbosity()

    BZCommon.globalParamSet(params)
    BZUtils.compress(fileName)
}