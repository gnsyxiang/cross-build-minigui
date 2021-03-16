#!/usr/bin/env bash

# set -x

example_path=$TOP_DIR/example

wget_com_1()
{
    cd $example_path
}

build_example_com()
{
    cd ${1}
    ./autogen.sh
    ./configure \
        $2 \
        --prefix=${INSTALL_PREFIX} \
        LDFLAGS="${LDFLAGS_COM}" \
        CPPFLAGS="${CPPFLAGS_COM}" \
        CC=${GCC} \
        --host=${HOST} \
        PKG_CONFIG_PATH="$PKG_CONFIG_PATH_COM"
}

build_hello_world()
{
    target=${2}-${3}
    url=https://codeload.github.com/VincentWei/$2/tar.gz/$3

    wget_com_1
    build_example_com ${target} "${hello_world_param}"
}

build_example()
{
    #           src_name        name        version     cmd
    hello_world=("hello_world   hello_world 0.0.1       build_hello_world")

    libs=(hello_world)

    for i in ${libs[@]}; do
        eval lib_info=\${${i}[@]}
        lib_info=(${lib_info})

        src_name=${lib_info[0]}
        name=${lib_info[1]}
        version=${lib_info[2]}
        cmd=${lib_info[3]}

        # echo ${src_name} ${name} ${version} ${cmd}

        ${cmd} ${src_name} ${name} ${version}

        make clean; make -j${NRJOBS}; make install
        cd $TOP_DIR
    done
}

