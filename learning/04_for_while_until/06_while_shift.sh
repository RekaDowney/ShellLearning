#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

function outputWhatInput() {
    local i=1
    while [ $# -ne 0 ]
    ## 可以判断 "$*" 是否为空串来中止循环
    ## while [[ "$*" != "" ]]
    do
        green "param$i --> $1"
        ((i++))
        shift
    done
    return 0
}

function main() {
    outputWhatInput $*
    return $?
}

main $*
exit $?

