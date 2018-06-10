#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

## 使用系统变量 RANDOM 来生成随机数
## 默认 $RANDOM 产生 0 ~ 32767 的随机整数，可以通过
## 与某个大数相加后进行求余来实现大于5位数的随机数


function rand() {
    local min=$1
    local interval=$(($2-$1+1))
    local num=$(($RANDOM+1000000000))
    echo $((${num}%${interval}+${min}))
    return 0
}

function main() {
    local i=0
    while [ $i -lt 10 ];
    do
        echo $(rand 10000 80000)
        ((i++))
    done
    
    i=0
    while [ $i -lt 10 ];
    do
        echo $(rand 1000 6000)
        ((i++))
    done

    return $?
}

main $*
exit $?

