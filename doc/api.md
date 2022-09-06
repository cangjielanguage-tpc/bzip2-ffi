# bzip2库

## 介绍

bzip2是一款文件压缩和解压缩工具。

### 主要接口

#### class BZUtils

此类包含压缩和解压缩两个特性

```cangjie
public class BZUtils {
	/*
	 * 功能介绍：压缩文件
	 *
	 * fileName - 文件名
	 * 返回值：0：成功， -1：失败
	 */
	public static func compress(fileName: String): Int32
	/*
	 * 功能介绍：文件解压缩
	 *
	 * fileName - 文件名
	 * 返回值：0：成功， -1：失败
	 */
	public static func decompress(fileName: String): Int32
}
```

#### calss BZCommon

此类设置压缩和解压缩时用到的参数

```cangjie
public class BZCommon {
	/*
	 * 功能介绍：设置全局变量
	 *
	 * args - 全局参数结构体，包含一些压缩和解压缩时用到的参数
	 * 返回值：0：成功， -1：失败
	 */
	public static func GlobalParamSet(args: GlobalParam): Int32
}
```

#### struct GlobalParam

此结构体包含压缩和解压缩时用到的参数

```cangjie
struct GlobalParam {
	//operation modes,value 1和2. 1:compress;2:uncompress。
	public mut func setOpMode(opMode: Int32)
	//source modes; value 3:F2F; F==file。
	public mut func setSrcMode(srcMode: Int32)
	//输出文件与现有文件同名，预设不会覆盖现有文件。若要覆盖，请使用此参数。
	public mut func setForceOverwrite(forceOverwrite: Bool)
	//降低程序执行时内存的使用量。
	public mut func setSmallMode(smallMode: Bool)
	//设置块大小，值：1-9，1：fast 9:best
	public mut func setBlockSize100k(blockSize100k: Int32)
	//压缩或解压缩文件时，显示详细的信息。
	public mut func setVerbosity()
	//bzip2在压缩或解压缩后，会删除原始的文件。若要保留原始文件，请使用此参数。
	public mut func setKeepInputFiles(keepInputFiles: Bool)
}
```

## 示例

### compress的使用

代码如下：

```cangjie
from bzip2 import bzip4cj.*
from std import os.posix.*
from std import io.*

main() {
    var args = GlobalParam()
    var path2: String = getcwd()
    var ret = BZCommon.globalParamSet(args)
    if (ret != 0) {
	return 1
    }
    ret = BZUtils.compress("${path2}/a.txt")   //当前目录下生成a.txt.bz2压缩文件
    if (ret != 0) {
	return 1
    }
    var rFs: File = File("${path2}/a.txt.bz2", Read, Open)
    if (rFs.canRead()) {
        return 0
    } else {
        return 1
    }
}
```

运行结果如下：

```cangjie
xxx$ ls
xxx$ a.txt.bz2
```

