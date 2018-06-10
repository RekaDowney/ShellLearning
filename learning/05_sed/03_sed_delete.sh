#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)
contentFile="/learning/05_sed/00_content.txt"

function sedDelete() {
    echo '$1变量值为：'$1

    yellow -n '执行 sed "d" $contentFile #删除所有行'
    green $(sed "d" $contentFile)
    separator

    yellow -n '执行 sed "1,+4d" $contentFile #删除第1行到第1+4行'
    green $(sed "1,+4d" $contentFile)
    separator

    return 0
}

function main() {
    sedDelete "111_Bean_Boy"
    return $?
}

main $*
exit $?

