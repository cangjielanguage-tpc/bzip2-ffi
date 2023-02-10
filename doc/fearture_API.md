## bzip2库

### 介绍

    第三方库实现bz2格式压缩和解压缩，并提供相应接口。第三方库实现bz2格式压缩和解压缩，并提供相应接口。 参考地址：https://gitee.com/openharmony/third_party_bzip2

### 1 提供bzip2格式数据压缩和解压缩功能

前置条件：NA 

场景：
1. OHOS， Linux， windows支持bzip2压缩、解压缩、压缩设置功能。
2. 约束：
3. 性能：支持版本几何性能持平
4. 可靠性：NA

#### 1.1 提供bzip2压缩功能 

##### 1.1.1 主要接口

```
/**
* 文件压缩
* @param fileName 压缩的文件路径
*/
func compress(fileName: String): Int32

```

#### 1.1.2 示例

```cangjie
from bzip2 import bzip4cj.*
from std import os.posix.*
from std import fs.*

main() {
    var args = GlobalParam()
    var path2: String = getcwd()
    var ret: Int32 = BZCommon.globalParamSet(args)
    if (ret != 0) {
        return 1
    }
    ret = BZUtils.compress("${path2}/a.txt")
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
 执行后查看是否生成压缩文件： ：

```shell
cd /bzip2/ci_test/test_temp/run/test_compress_01_cj_1655346048_1717525
```

 验证解压后是否与压缩文件`a.txt`内容一致 

```
bzip2 -d a.txt.bz2
```

#### 1.2 提供bzip2解压缩功能

#####  1.2.1 主要接口


```cangjie
/**
* 文件解压缩
* @param fileName 解压缩的文件路径
*/
func decompress(fileName: String): Int32
```
#####  1.2.2 示例

```cangjie
from bzip2 import bzip4cj.*
from std import os.posix.*
from std import fs.*

main() {
    var path: String = getcwd()
    var fileName: String = "${path}/test_BZUtils_decompress.md.bz2"
    var params = GlobalParam()

    params.setKeepInputFiles(true) // 预期结果为源文件保留
    
    params.setOpMode(2)
    BZCommon.globalParamSet(params)
    BZUtils.decompress(fileName)

    if(!File.exists("${path}/test_BZUtils_decompress.md")) {
        return -1
    }
    return 0
}
```


#### 1.3 提供压缩参数设置功能 

#####  1.3.1 主要接口

```
/**
* The Function is GlobalParamSet
*
* @param a of GlobalParam
*
* @return Type of Unit
*/
func GlobalParamSet(args: GlobalParam): Int32


/**
* opMode：设置压缩模式，1：压缩，2：解压缩
* srcMode：源文件模式，目前只支持文件到文件模式，默认值为3；
* forceOverwrite：强制覆盖输出文件；true：覆盖 false：不覆盖
* keepInputFiles：保留输入文件； true:保留 false:不保留
* smallMode：在压缩或解压缩过程中降低内存用量； true:小 false
* verbosity：详尽模式 -- 显示每个被处理文件的压缩率；
* blockSize100k：压缩时将块长度设置为100k，200k...900k，对应值为1-9。
*/
GlobalParamSet类参数
```

##### 1.2.2 示例

```
from bzip2 import bzip4cj.*
from std import os.posix.*
from std import fs.*

main() {
	var path: String = getcwd()
    var fileName: String = "${path}/test.txt"
    var params = GlobalParam()
    var params = GlobalParam()
    params.setOpMode(1) 1：压缩，2：解压缩
    params.setSrcMode(3) //目前只支持 3
    params.setSmallMode(true) 
    params.setForceOverwrite(true) // 连续压缩两次相同的文件，结果覆盖
    params.setKeepInputFiles(true) 
    params.setVerbosity()
    params.setBlockSize100k(9) 
    BZCommon.globalParamSet(params) 
    BZUtils.compress(fileName)
}
```

