// DEPENDENCE: a.txt.bz2
// DEPENDENCE: a.txt
package bzip4cj
from std import collection.ArrayList
from std import unittest.*
from std import unittest.testmacro.*

@Test
public class TestCase{

    @TestCase
    public func caseA(): Unit {
        var path2: String = getcwd()
        BZUtils.decompress("${path2}/a.txt.bz2")
        var a = GlobalParam()
        a.setKeepInputFiles(true)
        BZUtils.compress("${path2}/a.txt")
        return 0
    }

    @TestCase
    public func caseB(): Unit {
        var a = GlobalParam()
        a.setSmallMode(true)
        a.setSrcMode(1)
        a.setOpMode(6)
        a.setNoisy(false)
        a.setForceOverwrite(true)
        a.setBlockSize100k(1)
        a.setVerbosity()
        a.setWorkFactor(9)
        a.setKeepInputFiles(true)
    }
}