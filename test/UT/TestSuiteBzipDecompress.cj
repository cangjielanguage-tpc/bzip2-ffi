// 3rd_party_lib:bzip2/build/bzip2
// data_file:test_38m.pptx

package test

from std import unittest.*
from std import unittest.testmacro.*

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import fs.*

@Test
public class TestSuiteBzipDecompress {
    static var path: String = getcwd()
    static var fileName: String = "${path}/test_38m.pptx"
    static var fileNameOut: String = "${path}/test_38m.pptx.bz2"
    static var params = GlobalParam()
    static var paramsOut = GlobalParam()

    static var count = 0

    public override func beforeEach(): Unit {
        params = GlobalParam()
        params.setOpMode(1)
        params.setKeepInputFiles(true)
        params.setForceOverwrite(true)

        paramsOut = GlobalParam()
        paramsOut.setOpMode(2)
        paramsOut.setKeepInputFiles(true)
        paramsOut.setForceOverwrite(true)
		
		if (count == 1) {
			params.setSmallMode(true)
            paramsOut.setSmallMode(true)
		} else if (count == 2) {
			params.setVerbosity()
            paramsOut.setVerbosity()
		} else if (count == 3) {
		    params.setBlockSize100k(1)
            paramsOut.setBlockSize100k(1)
		} else if (count == 4) {
			params.setBlockSize100k(5)
            paramsOut.setBlockSize100k(5)
		} else if (count == 5) {
			params.setBlockSize100k(9)
            paramsOut.setBlockSize100k(9)
		}
        count++
        
        BZCommon.globalParamSet(params)
        BZUtils.compress(fileName)
    }

    public override func afterEach(): Unit {
        File.delete(fileNameOut)
    }

    // 默认情况 都不设置
    @Bench[20]
    @TestCase
	func testDecompressNormalT200(): Unit { 
        BZCommon.globalParamSet(paramsOut)
        BZUtils.decompress(fileNameOut)
    }

    // 开启 smallMode
    @Bench[20]
    @TestCase
	func testDecompressSmallModeT200(): Unit { 
        BZCommon.globalParamSet(paramsOut)
        BZUtils.decompress(fileNameOut)
    }

    // 开启 verbosity - 对比是否会影响效率
    @Bench[20]
    @TestCase
	func testDecompressVerbosityT200(): Unit { 
        BZCommon.globalParamSet(paramsOut)
        BZUtils.decompress(fileNameOut)
    }

    // 开启 blockSize100k - 1
    @Bench[20]
    @TestCase
	func testDecompressBlockSize100k01T200(): Unit { 
        BZCommon.globalParamSet(paramsOut)
        BZUtils.decompress(fileNameOut)
    }

    // 开启 blockSize100k - 5
    @Bench[20]
    @TestCase
	func testDecompressBlockSize100k02T200(): Unit { 
        BZCommon.globalParamSet(paramsOut)
        BZUtils.decompress(fileNameOut)
    }

    // 开启 blockSize100k - 9
    @Bench[20]
    @TestCase
	func testDecompressBlockSize100k03T200(): Unit { 
        BZCommon.globalParamSet(paramsOut)
        BZUtils.decompress(fileNameOut)
    }
}