#!/usr/bin/env bash

# set -x

PLATFORM=hi35xx

if [ ${PLATFORM} = hi35xx ]; then
    source ${TOP_DIR}/shell/hi35xx.sh
fi

GCC=${CROSS_GCC_PATH}gcc

INSTALL_PREFIX=${TOP_DIR}/install

INSTALL_PREFIX_LIB=${INSTALL_PREFIX}/lib
INSTALL_PREFIX_INC=${INSTALL_PREFIX}/include

LDFLAGS_COM="$LDFLAGS_COM -L${INSTALL_PREFIX_LIB}"
CPPFLAGS_COM="$CPPFLAGS_COM -I${INSTALL_PREFIX_INC}"
PKG_CONFIG_PATH_COM=${INSTALL_PREFIX}/lib/pkgconfig

echo ""
echo "**************************************************"
echo "GCC: $GCC"
echo "LDFLAGS: $LDFLAGS_COM"
echo "CPPFLAGS: $CPPFLAGS_COM"
echo "PKG_CONFIG_PATH: $PKG_CONFIG_PATH_COM"
echo "**************************************************"
echo ""

