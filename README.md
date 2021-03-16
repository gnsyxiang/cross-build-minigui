# cross-build-minigui

## 目录介绍

### 3rd_party

* zlib
* libpng
* jpegsrc
* freetype

### minigui

* libminigui
* minigui-res

### example

* hello_world-0.0.1


## 编译

* 首先要选择平台和运行模式，详细见`shell/platform.sh`

* 如果选择的是嵌入式系统，记得指定交叉编译工具链的路径，和传递到编译的参数


### ubuntu编译

> note: ubuntu不需要编译`3rd_party`模块，因为系统已经自带了，但是要注意版本兼容性

* 全编译

```
./build_all.sh
```

* 编译`minigui`模块

```
./build_all.sh minigui
```

* 编译`example`模块

```
./build_all.sh example
```

### hi35xx编译

选择全编译或者模块编译

* 全编译

```
./build_all.sh
```

* 编译`3rd_party`模块

```
./build_all.sh 3rd_party
```

* 编译`minigui`模块

```
./build_all.sh minigui
```

* 编译`example`模块

```
./build_all.sh example
```

## FAQ




