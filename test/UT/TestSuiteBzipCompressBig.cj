// 3rd_party_lib:bzip2/build/bzip2
// data_file:output.mp4

package test

from std import unittest.*
from std import unittest.testmacro.*

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import fs.*

@Test
public class TestSuiteBzipCompress {
    static var path: String = getcwd()
    static var fileName: String = "${path}/output.mp4"
    static var fileNameOut: String = "${path}/output.mp4.bz2"
    static var params = GlobalParam()

    static var count = 0

    public override func beforeEach(): Unit {
       params = GlobalParam()
       params.setOpMode(1)
       params.setKeepInputFiles(true)
       params.setForceOverwrite(true)

       if (count == 1) {
			params.setSmallMode(true)
		} else if (count == 2) {
			params.setVerbosity()
		} else if (count == 3) {
		    params.setBlockSize100k(1)
		} else if (count == 4) {
			params.setBlockSize100k(5)
		} else if (count == 5) {
			params.setBlockSize100k(9)
		}
        count++
    }

    public override func afterEach(): Unit {
        File.delete(fileNameOut)
    }

    // 默认情况 都不设置
    @Bench[5]
    @TestCase
	func testCompressNormalT50(): Unit { 
        BZCommon.globalParamSet(params)
        BZUtils.compress(fileName)
    }

    // 开启 smallMode
    @Bench[5]
    @TestCase
	func testCompressSmallModeT50(): Unit { 
        BZCommon.globalParamSet(params)
        BZUtils.compress(fileName)
    }

    // 开启 verbosity - 对比是否会影响效率
    @Bench[5]
    @TestCase
	func testCompressVerbosityT50(): Unit { 
        BZCommon.globalParamSet(params)
        BZUtils.compress(fileName)
    }

    // 开启 blockSize100k - 1
    @Bench[5]
    @TestCase
	func testCompressBlockSize100k01T50(): Unit { 
        BZCommon.globalParamSet(params)
        BZUtils.compress(fileName)
    }

    // 开启 blockSize100k - 5
    @Bench[5]
    @TestCase
	func testCompressBlockSize100k02T50(): Unit { 
        BZCommon.globalParamSet(params)
        BZUtils.compress(fileName)
    }

    // 开启 blockSize100k - 9
    @Bench[5]
    @TestCase
	func testCompressBlockSize100k03T50(): Unit { 
        BZCommon.globalParamSet(params)
        BZUtils.compress(fileName)
    }
}