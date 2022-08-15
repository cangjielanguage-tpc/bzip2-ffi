<p align="center">
<img src="./doc/assets/bzip2.png" width="30%" >
</p>

<p align="center">
<img alt="" src="https://img.shields.io/badge/release-v0.0.1-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/build-pass-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjc-v0.31.4-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/cjcov-100%25-brightgreen" style="display: inline-block;" />
<img alt="" src="https://img.shields.io/badge/project-open-brightgreen" style="display: inline-block;" />
</p>


## <img alt="" src="./doc/assets/readme-icon-introduction.png" style="display: inline-block;" width=3%/>介绍

bzip2是一款文件压缩和解压缩工具。[参考链接](https://github.com/LuaDist/bzip2)

### 特性

- 🚀 文件压缩和解压缩


### 未来规划

- 丰富接口

##    <img alt="" src="./doc/assets/readme-icon-framework.png" style="display: inline-block;" width=3%/> 架构

### 源码目录

```shell
.
├── doc
├── gitee_gate.cfg
├── lib
│   └── libmybzip2.so
├── module.json
├── README.md
├── src
│   └── bzip4cj
│       └── bzutils.cj
│       └── native.cj
└── test
    ├── HLT
    ├── LLT
    └── UT
```

- `doc`是库的设计文档、提案、库的使用文档
- `src`是库源码目录
- `test`是存放测试用例，包括HLT用例、LLT 用例和UT用例
- `lib`是存放`bizp2`源码动态库

### 接口说明

主要是核心类和成员函数说明,详情见 [API](./doc/api.md)

#### class BZUtils


文件压缩

```cangjie
func compress(fileName: String)
```

- fileName：需要压缩文件的名称


文件解压缩

```cangjie
func decompress(fileName: String)
```

- fileName：需要解压缩文件的名称

#### class BZCommon



设置全局变量

```cangjie
func GlobalParamSet(args: GlobalParam): Unit
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
// DEPENDENCE: a.txt
// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from bzip2 import bzip4cj.*
from std import os.posix.*
from std import io.*

main() {
    var args = GlobalParam()
    var path2: String = getcwd()
    BZCommon.globalParamSet(args)
    BZUtils.compress("${path2}/a.txt")
    var rFs: FileStream = FileStream("${path2}/a.txt.bz2", OpenMode.Open)
    if (rFs.openFile()) {
        return 0
    } else {
        return 1
    }
}
```

执行后查看是否生成压缩文件：

```shell
cd /bzip2/ci_test/test_temp/run/test_compress_01_cj_1655346048_1717525
```

验证解压后是否与压缩文件`a.txt`内容一致

```shell
bzip2 -d a.txt.bz2
```



## <img alt="" src="./doc/assets/readme-icon-contribute.png" style="display: inline-block;" width=3%/>参与贡献

主要写参与贡献的人以及个人主页链接

[@zhoulq1024](https://gitee.com/zhoulq1024)
