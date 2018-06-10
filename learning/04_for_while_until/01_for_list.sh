#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

function listFor() {
    ## 定义 val 为局部变量，避免变量污染（全局变量如果存在val则会被临时隐藏）
    local val
    ## for 循环的第一种方式：直接在 for variable in <list> 遍历
    for val in {1..5}
    do
        yellow "$val"
    done
    
    for val in {a..e}
    do
        pink $val
    done
    return 0
}

function listFor2() {
    local val
    ## for vairable in <list> 的变体，直接将 list 中的每个成员用空格分隔
    for val in 1 2 3 4 5 6
    do
        green "$val"
    done
    return  0
}

function forLs() {
    local fileList=$(ls $1)
    for file in $fileList
    do
        red "$file"
    done
    return
}

function forParamList() {
    local param
    for param in $@
    do
        yellow $param
    done
    return 0
}

function main() {
    blue '通过 for variable in <list> 方式遍历，<list> 以 {1..5} 和 {a..e} 为例'
    listFor $*
    
    blue '通过 for variable in <list> 变体遍历，<list> 以 1 2 3 4 5 6 出现'
    listFor2 $*

    blue '通过 for variable in $listVariable 遍历，其中目录为 /learning'
    forLs '/learning'

    blue '遍历参数列表'
    forParamList $*
    return $?
}

main $*
exit $?

