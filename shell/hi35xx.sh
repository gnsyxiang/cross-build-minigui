#!/usr/bin/env bash

CROSS_GCC_DIR=/opt/toolchains/hisi/arm-hisiv510-linux/target/bin
CROSS_GCC_PATH=${CROSS_GCC_DIR}/arm-hisiv510-linux-
HOST=arm-hisiv510-linux

CPPFLAGS_COM=""
LDFLAGS_COM=""

libminigui_param="--with-runmode=ths --disable-videoqvfb --disable-videopcxvfb"
