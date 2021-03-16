#!/usr/bin/env bash

# set -x

TOP_DIR=$(dirname $(readlink -f "$0"))

NRJOBS=`getconf _NPROCESSORS_ONLN`

source ${TOP_DIR}/shell/platform.sh

source ${TOP_DIR}/3rd_party/build-3rd_party.sh
source ${TOP_DIR}/hisi/build-hisi.sh
source ${TOP_DIR}/minigui/build-minigui.sh
source ${TOP_DIR}/example/build-example.sh

if [ $# -eq 0 ]; then
    case "${PLATFORM}" in
        cross-[a-z]*)
            build_3rd_party
            ;;
        ubuntu)
            ;;
        *)
            echo "${name} Didn't match anything"
            exit
    esac
    build_minigui
    build_example
else
    case "$1" in
        3rd_party)
            build_3rd_party
            ;;
        hisi)
            build_hisi
            ;;
        minigui)
            build_minigui
            ;;
        example)
            build_example
            ;;
        *)
            echo "<|1|> Didn't match anything"
    esac
fi

