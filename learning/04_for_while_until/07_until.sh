#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

function untilSummary() {
    local i=1
    local sum=0
    until [ $i -gt $1 ]
    do
        ((sum=sum+i))
        ((i++))
    done
    echo $sum
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

    local result=$(untilSummary $1)
    local retval=$?
    green "1 + ... + $1 = "$result
    return $retval
}

main $*
exit $?

