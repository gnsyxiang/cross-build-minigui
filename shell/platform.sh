#!/usr/bin/env bash

# set -x

# ubuntu hi35xx
PLATFORM=ubuntu
THS_MODE=yes

case "${PLATFORM}" in
    ubuntu)
        source ${TOP_DIR}/shell/ubuntu.sh
        INSTALL_PREFIX=${TOP_DIR}/install_5.0.3_ubuntu
        ;;
    hi35xx)
        source ${TOP_DIR}/shell/hi35xx.sh
        INSTALL_PREFIX=${TOP_DIR}/install_5.0.3_hi35xx
        ;;
    *)
        echo "${PLATFORM} Didn't match anything"
esac

GCC=${CROSS_GCC_PATH}gcc

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

