#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

## 通过 date +%s%N 获取10位时间戳和当前纳秒的组合值
function rand() {
    local min=$1
    local interval=$(($2-$1+1))
    local num=$(date +'%s%N')
    echo $((${num}%${interval}+${min}))
    return 0
}

function main() {
    local i=0
    while [ $i -lt 10 ];
    do
        echo $(rand 1 50)
        ((i++))
    done

    i=0
    while [ $i -lt 10 ];
    do
        echo $(rand 10000 80000)
        ((i++))
    done

    return $?
}

main $*
exit $?

