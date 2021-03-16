#!/usr/bin/env bash

# set -x

minigui_path=$TOP_DIR/minigui

wget_minigui_com()
{
    cd $minigui_path
    if [ ! -f $1.tar.gz ];then
        wget -O $1.tar.gz -c $2
    fi

    rm -rf ${1}
    tar xvf ${1}.tar.gz >/dev/null 2>&1
}

build_minigui_com()
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

build_libminigui()
{
    target=${2}-${3}
    url=https://codeload.github.com/VincentWei/$2/tar.gz/$3

    wget_minigui_com ${target} ${url}
    build_minigui_com ${target} "${libminigui_param}"
}

build_minigui_res()
{
    target=${2}-${3}
    url=https://codeload.github.com/VincentWei/$2/tar.gz/$3

    wget_minigui_com ${target} ${url}
    build_minigui_com ${target}
}

build_minigui()
{
    #           src_name        name        version     cmd
    libminigui=("libminigui     minigui     ver-5-0-3   build_libminigui")
    minigui_res=("minigui-res   minigui-res ver-5-0-3   build_minigui_res")

    libs=(libminigui minigui_res)

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

