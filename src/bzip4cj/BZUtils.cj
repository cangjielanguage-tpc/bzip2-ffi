/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2022. All rights reserved.
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
 * This class provides compression and decompression of bzip2
 * @since 0.29.3
 */

public open class BZUtils {
     /**
     * The Function is compress
     *
     * @param fileName compressed file name
     *
     * @reture None
     */
    public static func compress(fileName: String) {
        var a = GlobalParam()
        a.setOpMode(1)
        a.setSrcMode(3)
        BZCommon.GlobalParamSet(a)
        CjCompress(fileName)
    }
    public static func decompress(fileName: String) {
        /**
         * The Function is decompress
         *
         * @param fileName decompressed file name
         *
         * @return None
         */
        var a = GlobalParam()
        a.setOpMode(2)
        a.setSrcMode(3)
        BZCommon.GlobalParamSet(a)
        CjUncompress(fileName)
    }
}

/**
 * This is a class that provides public functions.
 * @since 0.29.3
 */

public open class BZCommon {
    /**
     * The Function is GlobalParamSet
     *
     * @param GlobalParam Setting the compression or decompression mode
     *
     * @reture None
     */
    public static func GlobalParamSet(a: GlobalParam): Unit {
        CjGlobalParamSet(a)
    }
}
