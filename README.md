# cross-build-minigui

## 目录介绍

```
.
├── 3rd_party
│   └── build-3rd_party.sh
├── build_all.sh
├── example
│   ├── build-example.sh
│   └── hello_world-0.0.1
├── LICENSE
├── minigui
│   └── build-minigui.sh
├── README.md
└── shell
    ├── hi35xx.sh
    ├── platform.sh
    └── ubuntu.sh
```

### shell

* 平台选择脚本`platform.sh`

* 具体平台配置脚本
    * hi35xx配置脚本`hi35xx.sh`
    * ubuntu配置脚本`ubuntu.sh`

### 3rd_party

* 包含构建脚本`build-3rd_party.sh`

* 需要编译的库
    * zlib
    * libpng
    * jpegsrc
    * freetype

### minigui

* 包含构建脚本`build-minigui.sh`

* 需要编译的库
    * libminigui
    * minigui-res

### example

* 包含构建脚本`build-example.sh`

* 测试demo程序
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

### 在`ubuntu`执行

```
$ cd install_5.0.3_ubuntu/bin
$ ./mginit 
MISC: Can not locate your MiniGUI.cfg file or bad files!
KERNEL>InitGUI (step 3): Can not initialize miscellous things!
```

上面提示没有找到配置文件，可以通过下面命令来指定

```
$ export MG_CFG_PATH=../etc
$ ./mginit
KERNEL>LoadSharedResource: No such file or directory
KERNEL>InitGUI (step 10): Can not load shared resource!
```

上面提示没有找到资源文件，可以修改`MiniGUI.cfg`配置文件，如下：

```
$ vim ../etc/MiniGUI.cfg
[cursorinfo]
# Edit following line to specify cursor files path
cursorpath=/usr/local/share/minigui/res/cursor/

[resinfo]
respath=/usr/local/share/minigui/res/
```

修改上面两处路径，然后就可以正常运行了

