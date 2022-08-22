# 三方库设计说明

## 1 需求场景分析

bzip2是一款文件压缩和解压缩工具。

## 2 三方库对外提供特性

- 压缩文件
- 解压缩文件

## 3 特性设计文档

### 3.1 特性介绍

- 压缩
- 解压缩

### 3.2 实现方案

```cangjie
文件通过compress和uncompress接口实现压缩和解压缩功能，通过globalparamset设置参数来实现压缩和解压缩的不同方法。
```

### 3.3 接口介绍

BZUtils 包含压缩和解压缩

| 成员函数   | 入参             | 返回值 | 作用描述                        |
| ---------- | ---------------- | ------ | ------------------------------- |
| compress   | filename：String | Int32  | 实现文件压缩，生成*.bz2格式文件 |
| uncompress | filename：String | Int32  | 实现文件解压缩                  |

BZCommon 设置全局参数

| 成员函数       | 入参              | 返回值 | 作用描述                         |
| -------------- | ----------------- | ------ | -------------------------------- |
| globalParamSet | args: GlobalParam | Int32  | 设置全局参数，实现不同的压缩形式 |

### 3.4 示例展示

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
    var ret = BZCommon.globalParamSet(args)
    if (ret != 0) {
	return 1
    }
    ret = BZUtils.compress("${path2}/a.txt")   //当前目录下生成a.txt.bz2压缩文件
    if (ret != 0) {
	return 1
    }
    var rFs: FileStream = FileStream("${path2}/a.txt.bz2", OpenMode.Open)
    if (rFs.openFile()) {
        return 0
    } else {
        return 1
    }
}
```

