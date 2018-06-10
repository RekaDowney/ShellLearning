#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

function mt() {
    local i=1
    local j=1
    for ((;i<=$1;i++))
    do
        for ((j=1;j<=i;j++))
        do
            echo -ne "$j * $i = $((i*j))\t"
        done
        echo
    done
    return 0
}


function main() {
    [ $# -ne 1 ] && {
        red "Usage: ${currentScript} <num>"
        exit 1
    }

    isNum $1 || {
        red "Usage: ${currentScript} <num>"
        exit 2
    }

    mt $1
    local retval=$?
    return $retval
}

main $*
exit $?

