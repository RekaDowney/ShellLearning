#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

function forLike() {
    local i
    local sum
    #set -x
    for((i=1;i<$1;i++))
    do
        ## 不累加3的倍数的数值
        if ((i%3==0))
        then
            continue
        fi
       ((sum=sum+i))
    done
    #set +x
    echo $sum
    return 0
}



function main() {
    [ $# -ne 1 ] && {
        red "Usage: ${currentScript} <num>"
        exit 1
    }
    local sum=$(forLike $*)
    green $sum
    return $?
}

main $*
exit $?

