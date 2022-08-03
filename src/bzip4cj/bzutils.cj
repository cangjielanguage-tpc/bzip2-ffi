/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 *
 * This is a class that provides compression and decompression functions.
 * Provides function such as compress deCompress.
 */

package bzip4cj
from std import collection.*
from std import io.*

/**
 * The class is BZUtils
 * @author zhoulq1024
 * @since 0.29.3
 */
public open class BZUtils {
    /**
     * The Function is compress
     *
     * @param fileName of String
     * @since 0.29.3
     */
    public static func compress(fileName: String) {
        var a = GlobalParam()
        a.setOpMode(1)
        a.setSrcMode(3)
        BZCommon.globalParamSet(a)
        cjCompress(fileName)
    }

    /**
     * The Function is decompress
     *
     * @param fileName of String
     * @since 0.29.3
     */
    public static func decompress(fileName: String) {
        var a = GlobalParam()
        a.setOpMode(2)
        a.setSrcMode(3)
        BZCommon.globalParamSet(a)
        cjUncompress(fileName)
    }
}


/**
 * The class is BZCommon
 * @author zhoulq1024
 * @since 0.29.3
 */
public open class BZCommon {

    /**
     * The Function is GlobalParamSet
     *
     * @param a of GlobalParam
     *
     * @return Type of Unit
     * @since 0.29.3
     */
    public static func globalParamSet(a: GlobalParam): Unit {
        cjGlobalParamSet(a)
    }
}
