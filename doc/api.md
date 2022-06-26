### 接口说明

主要是核心类和成员函数说明

#### class BZUtils

```
public static func compress(fileName: String)
public static func decompress(fileName: String)
```

#### calss BZCommon

```
public static func GlobalParamSet(a: GlobalParam)
```

#### record GlobalParam

```
public mut func setOpMode(opMode: Int32)
public mut func setSrcMode(srcMode: Int32)
public mut func setForceOverwrite(forceOverwrite: Bool)
public mut func setSmallMode(smallMode: Bool)
public mut func setNoisy(noisy: Bool)
public mut func setWorkFactor(workFactor: Int32)
public mut func setBlockSize100k(blockSize100k: Int32)
public mut func setVerbosity()
public mut func setKeepInputFiles(keepInputFiles: Bool)
```

