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
/*
* 文件压缩
* @param fileName 压缩的文件路径
* @return 0成功 -1失败
*/
func compress(fileName: String): Int32

```

##### 1.1.2 示例

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
    ret = BZUtils.compress("${path2}/a.txt")   //当前目录下生成a.txt.bz2压缩文件
    if (ret != 0) {
        return 1
    }
    var rFs: File = File("${path2}/a.txt.bz2", Open(true, true))
    if (rFs.canRead()) {
        return 0
    } else {
        return 1
    }
}
```

执行示例：

```shell
# 将上述代码保存为: test/LLT/test_compress_01.cj

# 新建一个待压缩文件: 
echo 'helloworld' > test/LLT/a.txt

# 使用ci_test编译
python3 ci_test/main.py build

# 使用ci_test执行所有用例
python3 ci_test/main.py test

# test_compress_01.cj已被编译并执行main方法
# 进入执行用例的临时目录
cd ci_test/test_temp/run/test_compress_01_cj*

# 解压生成的a.txt.bz2
bzip2 -d a.txt.bz2

# 验证解压后的内容
cat a.txt
```

#### 1.2 提供bzip2解压功能

##### 1.2.1 主要接口

```cangjie
/*
* 文件解压缩
* @param fileName 解压缩的文件路径
* @return 0成功 -1失败
*/
func decompress(fileName: String): Int32
```

##### 1.2.2 示例

```cangjie
from bzip2 import bzip4cj.*
from std import os.posix.*
from std import fs.*

main() {
    var args = GlobalParam()
    args.setOpMode(2)
    var path2: String = getcwd()
    var ret: Int32 = BZCommon.globalParamSet(args)
    if (ret != 0) {
        return 1
    }
    ret = BZUtils.decompress("${path2}/a.txt.bz2")  //解压缩后当前目录生成a.txt文件
    if (ret != 0) {
        return 1
    }
    var rFs: File = File("${path2}/a.txt", Open(true, true))
    if (rFs.canRead()) {
        return 0
    } else {
        return 1
    }
}
```

执行示例: 参照1.1.2的执行过程

#### 1.3 提供压缩参数设置功能

##### 1.3.1 主要接口

```cangjie
/*
 * 设置参数的工具类
 */
public open class BZCommon {
    /*
     * 设置参数
     * @param GlobalParam参数
     * @return 0成功 -1失败
     */
    public static func globalParamSet(args: GlobalParam): Int32
}

/*
 * 参数信息
 */
public struct GlobalParam {

    /*
     * 设置压缩模式
     * @param opMode 1:压缩 2:解压缩 其他:无效globalParamSet时抛出异常
     */
    public mut func setOpMode(opMode: Int32): Unit

    /*
     * 源文件模式，目前只支持文件到文件模式，默认值为3
     * @param srcMode Int32
     */
    public mut func setSrcMode(srcMode: Int32): Unit

    /*
     * 强制覆盖输出文件
     * @param forceOverwrite true: 覆盖 false: 不覆盖
     */
    public mut func setForceOverwrite(forceOverwrite: Bool): Unit

    /*
     * 在压缩或解压缩过程中降低内存用量
     * @param smallMode true:启用 false:不启用
     */
    public mut func setSmallMode(smallMode: Bool): Unit

    /*
     * 是否打印非关键错误消息
     * @param Noisy true显示 false忽略
     */
    public mut func setNoisy(noisy: Bool): Unit

    /*
     * 设置WorkFactor参数
     * @param WorkFactor Int32
     */
    public mut func setWorkFactor(workFactor: Int32): Unit

    /*
     * 压缩时将块长度设置为100k,200k...900k. 对应值为1-9
     * @param blockSize100k Int32
     */
    public mut func setBlockSize100k(blockSize100k: Int32): Unit

    /*
     * 详尽模式 显示每个被处理文件的压缩率
     */
    public mut func setVerbosity(): Unit

    /*
     * 保留输入文件
     * @param keepInputFiles true:保留 false:不保留
     */
    public mut func setKeepInputFiles(keepInputFiles: Bool): Unit
}
```

##### 1.2.2 示例

```
from bzip2 import bzip4cj.*
from std import os.posix.*
from std import fs.*

main() {
    var args = GlobalParam()
    args.setBlockSize100k(9)
    args.setVerbosity()
    var path2: String = getcwd()
    var ret: Int32 = BZCommon.globalParamSet(args)
    if (ret != 0) {
        return 1
    }
    ret = BZUtils.compress("${path2}/a.txt")    //压制不重要的警告信息
    if (ret != 0) {
        return 1
    }
    var rFs: File = File("${path2}/a.txt.bz2", Open(true, true))
    if (rFs.canRead()) {
        return 0
    } else {
        return 1
    }
}
```

执行示例: 参照1.1.2的执行过程

#### 1.4 对libbzip2的引用

##### 1.4.1 主要接口

```
/**
 * 调用bz2压缩
 * @param name filepath
 * @return 0成功 -1失败
 */
public func cjCompress(name: String): Int32

/**
 * 调用bz2解压
 * @param name filepath
 * @return 0成功 -1失败
 */
public func cjUncompress(name: String): Int32

/**
 * 调用bz2设置参数
 * @param args 参数
 * @return 0成功 -1失败
 */
public func cjGlobalParamSet(args: GlobalParam): Int32
```
