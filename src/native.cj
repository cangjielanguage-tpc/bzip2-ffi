/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2022-2024. All rights reserved.
 */

/**
 * @file
 * The file declars the GlobalParam class.
 */
package bz2ffi

/**
 * The struct is GlobalParam
 * @author zhoulq1024
 * @since 0.29.3
 */
@C
public struct GlobalParam {
    var opMode: Int32 = 1
    var srcMode: Int32 = 3
    var forceOverwrite: Bool = false
    var smallMode: Bool = false
    var noisy: Bool = true
    var workFactor: Int32 = 30
    var blockSize100k: Int32 = 9
    var verbosity: Int32 = 0
    var keepInputFiles: Bool = false

    /**
     * The Function is setOpMode
     *
     * @param opMode of Int32
     * @since 0.29.3
     */
    public mut func setOpMode(opMode: Int32) {
        this.opMode = opMode
    }

    /**
     * The Function is setSrcMode
     *
     * @param srcMode of Int32
     * @since 0.29.3
     */
    public mut func setSrcMode(srcMode: Int32) {
        this.srcMode = srcMode
    }

    /**
     * The Function is setForceOverwrite
     *
     * @param forceOverwrite of Bool
     * @since 0.29.3
     */
    public mut func setForceOverwrite(forceOverwrite: Bool) {
        this.forceOverwrite = forceOverwrite
    }

    /**
     * The Function is setSmallMode
     *
     * @param smallMode of Bool
     * @since 0.29.3
     */
    public mut func setSmallMode(smallMode: Bool) {
        this.smallMode = smallMode
    }

    /**
     * The Function is setNoisy
     *
     * @param noisy of Bool
     * @since 0.29.3
     */
    public mut func setNoisy(noisy: Bool) {
        this.noisy = noisy
    }

    /**
     * The Function is setWorkFactor
     *
     * @param workFactor of Int32
     * @since 0.29.3
     */
    public mut func setWorkFactor(workFactor: Int32) {
        this.workFactor = workFactor
    }

    /**
     * The Function is setBlockSize100k
     *
     * @param blockSize100k of Int32
     * @since 0.29.3
     */
    public mut func setBlockSize100k(blockSize100k: Int32) {
        this.blockSize100k = blockSize100k
    }

    /**
     * The Function is setVerbosity
     *
     * @since 0.29.3
     */
    public mut func setVerbosity() {
        verbosity += 1
    }

    /**
     * The Function is setKeepInputFiles
     *
     * @param keepInputFiles of Bool
     * @since 0.29.3
     */
    public mut func setKeepInputFiles(keepInputFiles: Bool) {
        this.keepInputFiles = keepInputFiles
    }
}

foreign func GlobalParamSet(m: CPointer<GlobalParam>): Int32
foreign func compress(str: CString): Int32
foreign func uncompress(str: CString): Int32
foreign func malloc(size: UIntNative): CPointer<Unit>
foreign func free(p: CPointer<GlobalParam>): Unit

/**
 * The Function is cjCompress
 *
 * @param name of String
 *
 * @return Type of Unit
 * @since 0.29.3
 */
public func cjCompress(name: String): Int32 {
    unsafe {
        let str: CString = LibC.mallocCString(name)
        var ret: Int32 = compress(str)
        LibC.free(str)
        ret
    }
}

/**
 * The Function is cjUncompress
 *
 * @param name of String
 *
 * @return Type of Unit
 * @since 0.29.3
 */
public func cjUncompress(name: String): Int32 {
    unsafe {
        var str: CString= LibC.mallocCString(name)
        var ret: Int32 = uncompress(str)
        LibC.free(str)
        ret
    }
}

/**
 * The Function is cjGlobalParamSet
 *
 * @param a of GlobalParam
 *
 * @return Type of Unit
 * @since 0.29.3
 */
public func cjGlobalParamSet(args: GlobalParam): Int32 {
    unsafe {
        var ptr = malloc(120)
        var p = CPointer<GlobalParam>(ptr)
        p.write(args)
        var ret: Int32 = GlobalParamSet(p)
        free(p)
        ret
    }
}

