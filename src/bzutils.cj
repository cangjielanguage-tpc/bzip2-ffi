/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights reserved.
 */

/**
 * @file
 *
 * This is a class that provides compression and decompression functions.
 * Provides function such as compress deCompress.
 */

package bz2ffi

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
    public static func compress(fileName: String): Int32 {
        var ret: Int32 = cjCompress(fileName)
        ret
    }

    /**
     * The Function is decompress
     *
     * @param fileName of String
     * @since 0.29.3
     */
    public static func decompress(fileName: String): Int32 {
        var ret: Int32 = cjUncompress(fileName)
        ret
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
    public static func globalParamSet(args: GlobalParam): Int32 {
        var ret: Int32 = cjGlobalParamSet(args)
        ret
    }
}
