#!/usr/bin/env bash

set -x

NRJOBS=`getconf _NPROCESSORS_ONLN`

CROSS_GCC_DIR=/opt/toolchains/hisi/arm-hisiv510-linux/target/bin
CROSS_GCC_PATH=${CROSS_GCC_DIR}/arm-hisiv510-linux-
CROSS_HOST=arm-hisiv510-linux

GCC=${CROSS_GCC_PATH}gcc

INSTALL_PREFIX=`pwd`/../install

INSTALL_PREFIX_LIB=${INSTALL_PREFIX}/lib
INSTALL_PREFIX_INC=${INSTALL_PREFIX}/include

build_com()
{
    LDFLAGS_COM="-L${INSTALL_PREFIX_LIB}"
    CPPFLAGS_COM="-I${INSTALL_PREFIX_INC}"

    ./configure \
        $1 \
        --prefix=${INSTALL_PREFIX} \
        LDFLAGS="${LDFLAGS_COM}" \
        CPPFLAGS="${CPPFLAGS_COM}" \
        CC=${GCC} \
        --host=${CROSS_HOST}
}

build_zlib()
{
    export CHOST=${CROSS_GCC_DIR}/${CROSS_HOST}

    ./configure \
        --prefix=${INSTALL_PREFIX}
}

build_libpng()
{
    build_com
}

build_jpegsrc()
{
    rm -rf ${2}-${3}
    tar xvf ${1}.v${3}.tar.gz >/dev/null 2>&1
    cd ${2}-${3}

    build_com
}

build_freetype()
{
    build_com --with-harfbuzz=no
}

#      src_name     name        version     cmd             flag
zlib=("zlib         zlib        1.2.8       build_zlib      tar_gz")
libpng=("libpng     libpng      1.6.36      build_libpng    tar_gz")
jpegsrc=("jpegsrc   jpeg        7           build_jpegsrc   no_tar")
freetype=("freetype freetype    2.6.1       build_freetype  tar_gz")

libs=(zlib libpng jpegsrc freetype)
 
for i in ${libs[@]};
do
    eval lib_info=\${${i}[@]}
    lib_info=(${lib_info})

    src_name=${lib_info[0]}
    name=${lib_info[1]}
    version=${lib_info[2]}
    cmd=${lib_info[3]}
    flag=${lib_info[4]}

    # echo ${name} ${version} ${cmd} ${flag}

    if [ ${flag} = tar_gz ]; then
        rm -rf ${src_name}-${version}
        tar xvf ${src_name}-${version}.tar.gz >/dev/null 2>&1

        cd ${name}-${version}
    fi

    ${cmd} ${src_name} ${name} ${version}

    make clean; make -j${NRJOBS}; make install
    cd -
done

