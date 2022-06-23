package bzip4cj
from std import io.*
from std import ffi.c.*

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

    public mut func setOpMode(opMode: Int32) {
        this.opMode = opMode
    }

    public mut func setSrcMode(srcMode: Int32) {
        this.srcMode = srcMode
    }

    public mut func setForceOverwrite(forceOverwrite: Bool) {
        this.forceOverwrite = forceOverwrite
    }

    public mut func setSmallMode(smallMode: Bool) {
        this.smallMode = smallMode
    }

    public mut func setNoisy(noisy: Bool) {
        this.noisy = noisy
    }

    public mut func setWorkFactor(workFactor: Int32) {
        this.workFactor = workFactor
    }

    public mut func setBlockSize100k(blockSize100k: Int32) {
        this.blockSize100k = blockSize100k
    }

    public mut func setVerbosity() {
        verbosity += 1
    }

    public mut func setKeepInputFiles(keepInputFiles: Bool) {
        this.keepInputFiles = keepInputFiles
    }
}

foreign func GlobalParamSet(m: CPointer<GlobalParam>): Unit
foreign func compress(a: CString): Unit
foreign func uncompress(a: CString): Unit
foreign func malloc(size: UIntNative): CPointer<Unit>
foreign func free(p: CPointer<GlobalParam>): Unit

public func CjCompress(name: String): Unit {
    unsafe {
        var aa = CString(name)
        compress(aa)
        aa.free()
    }
}

public func CjUncompress(name: String): Unit {
    unsafe {
        var aa = CString(name)
        uncompress(aa)
        aa.free()
    }
}

public func CjGlobalParamSet(a: GlobalParam): Unit {
    unsafe {
        var ptr = malloc(120)
        var p = CPointer<GlobalParam>(ptr)
        p.write(a)
        GlobalParamSet(p)
        free(p)
    }
}

