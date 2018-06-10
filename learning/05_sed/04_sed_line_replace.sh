#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)
contentFile="/learning/05_sed/00_content.txt"

function sedLineReplace() {
    echo '$1变量值为：'$1

    yellow -n '执行 sed "1,+4c $1" $contentFile #将第1行到第1+4行总共5行的内容替换成指定内容'
    red "特别注意：不是逐行替换"
    green $(sed "1,+4c $1" $contentFile)
    separator

    return 0
}

function main() {
    sedLineReplace "111_Bean_Boy"
    return $?
}

main $*
exit $?

