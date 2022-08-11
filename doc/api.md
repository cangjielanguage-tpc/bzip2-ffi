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

#### struct GlobalParam

```cangjie
//operation modes,value 1-3. 1:compress;2:uncompress;3:test
public mut func setOpMode(opMode: Int32)
//source modes; value 1-3. 1:I2O; 2:F2O; 3:F2F; F==file, I==stdin, O==stdout, 
public mut func setSrcMode(srcMode: Int32)
//输出文件与现有文件同名，预设不会覆盖现有文件。若要覆盖，请使用此参数。
public mut func setForceOverwrite(forceOverwrite: Bool)
//降低程序执行时内存的使用量。
public mut func setSmallMode(smallMode: Bool)
//压制不重要的警告信息。属于 I/O 错误及其它严重事件的信息将不会被压制，默认true。
public mut func setNoisy(noisy: Bool)
//用于决定何时使用回退排序算法，默认值为30
public mut func setWorkFactor(workFactor: Int32)
//设置块大小，值：1-9，1：fast 9:best
public mut func setBlockSize100k(blockSize100k: Int32)
//压缩或解压缩文件时，显示详细的信息。
public mut func setVerbosity()
//bzip2在压缩或解压缩后，会删除原始的文件。若要保留原始文件，请使用此参数。
public mut func setKeepInputFiles(keepInputFiles: Bool)
```

