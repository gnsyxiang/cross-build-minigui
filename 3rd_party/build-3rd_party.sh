#!/usr/bin/env bash

# set -x

party_3rd_path=$TOP_DIR/3rd_party

wget_3rd_party_com()
{
    cd $party_3rd_path
    if [ ! -f $1.tar.gz ];then
        wget $2
    fi

    rm -rf ${1}
    tar xvf ${1}.tar.gz >/dev/null 2>&1
}

build_3rd_party_com()
{
    cd ${1}
    ./configure \
        $2 \
        --prefix=${INSTALL_PREFIX} \
        LDFLAGS="${LDFLAGS_COM}" \
        CPPFLAGS="${CPPFLAGS_COM}" \
        CC=${GCC} \
        --host=${HOST}
}

build_zlib()
{
    target=${2}-${3}
    url=https://udomain.dl.sourceforge.net/project/libpng/zlib/${3}/${target}.tar.gz

    wget_3rd_party_com ${target} ${url}

    export CHOST=${CROSS_GCC_DIR}/${HOST}

    cd ${target}
    ./configure \
        --prefix=${INSTALL_PREFIX}
}

build_libpng()
{
    target=${2}-${3}
    url=https://udomain.dl.sourceforge.net/project/libpng/libpng16/${3}/${target}.tar.gz

    wget_3rd_party_com ${target} ${url}
    build_3rd_party_com ${target}
}

build_jpegsrc()
{
    target=${2}-${3}
    url=http://www.ijg.org/files/${1}.v${3}.tar.gz

    wget_3rd_party_com ${1}.v${3} ${url}
    build_3rd_party_com ${target}
}

build_freetype()
{
    target=${2}-${3}
    url=https://udomain.dl.sourceforge.net/project/freetype/freetype2/${3}/${target}.tar.gz

    wget_3rd_party_com ${target} ${url}
    build_3rd_party_com ${target} --with-harfbuzz=no
}

build_3rd_party()
{
    #      src_name     name        version     cmd
    zlib=("zlib         zlib        1.2.8       build_zlib")
    libpng=("libpng     libpng      1.6.36      build_libpng")
    jpegsrc=("jpegsrc   jpeg        7           build_jpegsrc")
    freetype=("freetype freetype    2.6.1       build_freetype")

    libs=(zlib libpng jpegsrc freetype)

    for i in ${libs[@]};
    do
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


