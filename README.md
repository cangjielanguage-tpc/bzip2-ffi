<div align="center">
<h1>bzip2</h1>
</div>

<p align="center">
<img alt="" src="https://img.shields.io/badge/release-v0.0.3-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/build-pass-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjc-v0.36.4-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjcov-100%25-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/project-open-brightgreen" style="display: inline-block;" />
</p>

## <img alt="" src="./doc/assets/readme-icon-introduction.png" style="display: inline-block;" width=3%/>介绍

bzip2是一款文件压缩和解压缩工具。[参考链接](https://gitee.com/openharmony/third_party_bzip2)

### 特性

- 🚀 文件压缩和解压缩

### 未来规划

- 丰富接口

## <img alt="" src="./doc/assets/readme-icon-framework.png" style="display: inline-block;" width=3%/> 架构

### 源码目录

```shell
.
├── doc
├── gitee_gate.cfg
├── lib
├── module.json
├── README.md
├── src
│   └── bzip4cj
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
- `lib`存放`bizp2`源码动态库
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

## <img alt="" src="./doc/assets/readme-icon-compile.png" style="display: inline-block;" width=3%/>编译执行

### 编译

编译描述和具体shell命令

```shell
cpm update
cpm build
```

### 测试

- 获取`ci_tools`源码`git clone https://gitee.com/HW-PLLab/testJekins`

- 将`ci_tools`下的`ci_confg`和`ci_test`拷贝到bzip2工程的根目录

- 执行`python3 ci_test/main.py test`命令后，查看用例是否成功

### 压缩示例

示例描述

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

## <img alt="" src="./doc/assets/readme-icon-contribute.png" style="display: inline-block;" width=3%/>参与贡献

主要写参与贡献的人以及个人主页链接

[@zhoulq1024](https://gitee.com/zhoulq1024)
