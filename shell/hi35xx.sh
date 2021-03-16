#!/usr/bin/env bash

CROSS_GCC_DIR=/opt/toolchains/hisi/arm-hisiv510-linux/target/bin
CROSS_GCC_PATH=${CROSS_GCC_DIR}/arm-hisiv510-linux-
HOST=arm-hisiv510-linux

CPPFLAGS_COM=""
CPPFLAGS_COM=""
LDFLAGS_COM=""

if [ x$THS_MODE = "xno" ]; then
    libminigui_param=" \
        --with-runmode=procs \
        --disable-complexscripts \
        \
        --with-osname=linux \
        \
        --disable-videodrm \
        --disable-videoqvfb \
        --enable-videopcxvfb \
        \
        --disable-videohi3536"
else
    libminigui_param=" \
        --with-runmode=ths \
        --disable-complexscripts \
        \
        --with-osname=linux \
        \
        --enable-videodrm \
        --disable-videoqvfb \
        --disable-videopcxvfb \
        \
        --disable-videohi3536"
    hello_world_param="--enable-ths-mode"
fi

hello_world_param="${hello_world_param} --enable-cross-build"

