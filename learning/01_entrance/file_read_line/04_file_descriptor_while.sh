#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

function readFile() {
    [ -r $1 ] || {
        red "$1 文件不存在或者文件不可读"
        return 1
    }
    ## 将标准输入流重定向到文件描述符3中
    exec 3<&0
    ## 读取文件内容到标准输入流
    exec 0<$1
    local line
    local idx=1
    while read line
    do
        green $idx' --> '$line
        ((idx++))
    done
    ## 将文件描述符3重定向到标准输入流
    exec 0<&3
    return 0
}

function main() {
    [ $# -ne 1 ] && {
        red "Usage: ${currentScript} <file>"
        return 1
    }
    readFile $1
    return $?
}

main $*
exit $?

