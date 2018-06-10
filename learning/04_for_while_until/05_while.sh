#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

function summary() {
    local i=1
    local sum=0
    # set -x
    while [ $i -le $1 ]
    do
        sum=$((sum+i))
        # 使用 i=$((i++)) 是错误的，此时i依然是1
        # i=$((i++))
        ((i++))
        ## 使用 i=$((i+1)) 也行
        # i=$((i+1))
    done
    # set +x
    echo $sum
    return 0
}


function main() {
    [ $# -ne 1 ] && {
        red "Usage: ${currentScript} <num>"
        return 1
    }

    #isNum $1 || {
    #    red "Usage: ${currentScript} <num>"
    #    return 2
    #}
    if ! isNum $1; then
        red "Usage: ${currentScript} <num>"
        return 2
    fi

    local sum=$(summary $*)
    local retval=$?
    [ $retval -eq 0 ] && {
        green "1 + ... + $1 = $sum"
    }
    return $retval
}

main $*
exit $?

