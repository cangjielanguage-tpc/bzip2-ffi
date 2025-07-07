<div align="center">
<h1>bzip2-ffi</h1>
</div>

<p align="center">
<img alt="" src="https://img.shields.io/badge/release-v1.0.2-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/build-pass-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjc-v1.0.0-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjcov-100%25-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/project-open-brightgreen" style="display: inline-block;" />
</p>

## 介绍

bzip2-ffi是一款文件压缩和解压缩工具。

### 特性

- 🚀 文件压缩和解压缩

### 未来规划

- 丰富接口

## 架构

### 源码目录

```shell
.
├── doc
├── lib
├── README.md
├── src
│   └── bz2
│       └── bzutils.cj
│       └── native.cj
├── third_party
└── test
    ├── HLT
    ├── LLT
    └── UT
```

- `doc`存放库的设计文档、提案、库的使用文档
- `src`存放库源码目录
- `test`存放测试用例，包括HLT用例、LLT 用例和UT用例
- `lib`存放`bizp2-ffi`源码动态库
- `third_party`存放c相关引用

### 接口说明

主要是核心类和成员函数说明,详情见 [API](./doc/feature_api.md)

#### class BZUtils

文件压缩

```cangjie
func compress(fileName: String): Int32
```

- fileName：需要压缩文件的名称

文件解压缩

```cangjie
func decompress(fileName: String): Int32
```

- fileName：需要解压缩文件的名称

#### class BZCommon

设置全局变量

- opMode：设置压缩模式，1：压缩，2：解压缩‘
- srcMode：源文件模式，目前只支持文件到文件模式，默认值为3；
- forceOverwrite：强制覆盖输出文件；
- keepInputFiles：保留输入文件；
- smallMode：在压缩或解压缩过程中降低内存用量；
- verbosity：详尽模式 -- 显示每个被处理文件的压缩率；
- blockSize100k：压缩时将块长度设置为100k，200k...900k，对应值为1-9。

```cangjie
func GlobalParamSet(args: GlobalParam): Int32
```

## 编译执行

### 编译

1. linux x86_64 编译

   进入bzip2-ffi根目录，执行下面语句

   ```shell
   cd third_party/third_party_bzip2-OpenHarmony-v3.1-Release
   make -f Makefile2Cangjie clean && make -f Makefile2Cangjie
   cp liblibbz2.so ../../lib
   cd ../../
   cpm clean && cpm build
   ```

2. Windows编译

   进入bzip2-ffi根目录，执行下面语句

   ```shell
   cd third_party/third_party_bzip2-OpenHarmony-v3.1-Release
   make -f Makefile2Cangjie clean && make -f Makefile2Cangjie EXE=dll
   cp liblibbz2.dll ../../lib
   cd ../../
   cpm clean && cpm build
   ```

3. ohos编译

   进入bzip2-ffi根目录，执行下面语句（其中`/usr1/ohos/llvm/bin/`是ohos编译器路径，`/usr1/ohos/llvm/include/aarch64-linux-ohos`是ohos的头文件，请自行设置）

   ```shell
   cd third_party/third_party_bzip2-OpenHarmony-v3.1-Release
   make -f Makefile2Cangjie clean && make -f Makefile2Cangjie CC="/usr1/ohos/llvm/bin/clang" CFLAGS="-I/usr1/ohos/llvm/include/aarch64-linux-ohos --target=aarch64-linux-ohos" STRIP="/usr1/ohos/llvm/bin/llvm-strip"
   cp liblibbz2.so ../../lib
   cd ../../
   cpm clean && cpm build
   ```

### 测试


### 压缩示例

示例描述

```cangjie
import bz2ffi.*
import std.posix.*
import std.fs.*

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
    var rFs: File = File("${path2}/a.txt.bz2", OpenMode.ReadWrite)
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

# 使用cjpm编译
cjpm build

# 使用cjc执行用例
 cjc  --import-path /target/release -L /lib/ -l libbz2   -L /target/release/bz2ffi -l bz2ffi  test_compress_01.cj 

# test_compress_01.cj已被编译并执行main方法
# 进入执行用例的临时目录
cd 

# 解压生成的a.txt.bz2
bzip2 -d a.txt.bz2

# 验证解压后的内容
cat a.txt
```

## 开源协议

本项目基于 [copyright (C) 1996-2007 Julian R Seward](./LICENSE)，请自由的享受和参与开源。

## 参与贡献

欢迎给我们提交PR，欢迎给我们提交Issue，欢迎参与任何形式的贡献。
