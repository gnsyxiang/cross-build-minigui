#!/usr/bin/env bash

CROSS_GCC_DIR=/opt/toolchains/hisi/arm-hisiv510-linux/target/bin
CROSS_GCC_PATH=${CROSS_GCC_DIR}/arm-hisiv510-linux-
HOST=arm-hisiv510-linux

HISI_INC_PATH=/home/uos/data/office/meian/hi3536d/Hi3536D-V100R001C01SPC020/src-Hi3536DV100_SDK_V1.0.2.0/mpp
# CPPFLAGS_COM="-I${HISI_INC_PATH}/include -I${HISI_INC_PATH}/include/mkp"
CPPFLAGS_COM=""
LDFLAGS_COM=""

if [ x$THS_MODE = "xyes" ]; then
libminigui_param=" \
    --with-runmode=procs \
    --disable-complexscripts \
    \
    --with-osname=linux \
    \
    --disable-videodrm \
    --disable-videoqvfb \
    --disable-videopcxvfb \
    \
    --enable-videohi3536d"
else
libminigui_param="--with-runmode=ths"
hello_world_param="--enable-ths-mode"
fi

  # --enable-ttfsupport      build support for TrueType/OpenType (needs FreeType2 library) <default=yes>
  # --with-targetname=unknown/external/fmsoft/mstudio/stb810/vfanvil/vxi386/qvfb/fbcon/mx21/monaco/c33l05/bfin/vxppc/
                        # S3C6410/S3C2440/S3C2410/hi3560a     Define the target board name
