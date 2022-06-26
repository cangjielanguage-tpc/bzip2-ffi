/*
 * Copyright (c) Cangjie Library Team 2022-2022. All rights resvered.
 */

/**
 * @file
 * The file declars the GlobalParam class.
 */
package bzip4cj
from std import io.*
from std import ffi.c.*

/**
 * The record is GlobalParam
 * @author zhoulq1024
 * @since 0.29.3
 */
@c
public record GlobalParam {
    var opMode: Int32 = 0
    var srcMode: Int32 = 0
    var forceOverwrite: Bool = false
    var smallMode: Bool = false
    var noisy: Bool = true
    var workFactor: Int32 = 0
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

foreign func GlobalParamSet(m: CPointer<GlobalParam>): Unit
foreign func compress(a: CString): Unit
foreign func uncompress(a: CString): Unit
foreign func malloc(size: UIntNative): CPointer<Unit>
foreign func free(p: CPointer<GlobalParam>): Unit

/**
 * The Function is CjCompress
 *
 * @param name of String
 *
 * @return Type of Unit
 * @since 0.29.3
 */
public func CjCompress(name: String): Unit {
    unsafe {
        var aa = CString(name)
        compress(aa)
        aa.free()
    }
}

/**
 * The Function is CjUncompress
 *
 * @param name of String
 *
 * @return Type of Unit
 * @since 0.29.3
 */
public func CjUncompress(name: String): Unit {
    unsafe {
        var aa = CString(name)
        uncompress(aa)
        aa.free()
    }
}

/**
 * The Function is CjGlobalParamSet
 *
 * @param a of GlobalParam
 *
 * @return Type of Unit
 * @since 0.29.3
 */
public func CjGlobalParamSet(a: GlobalParam): Unit {
    unsafe {
        var ptr = malloc(120)
        var p = CPointer<GlobalParam>(ptr)
        p.write(a)
        GlobalParamSet(p)
        free(p)
    }
}

