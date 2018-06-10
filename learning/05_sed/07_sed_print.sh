#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)
contentFile="/learning/05_sed/00_content.txt"

function sedPrint() {

    yellow -n '执行 sed "6p" $contentFile #不关闭默认的模式空间输出，打印第6行'
    green $(sed "6p" $contentFile)
    separator

    yellow -n '执行 sed -n "6,10p" $contentFile #关闭默认的模式空间输出，然后打印第6到10行'
    red $(sed -n "6,10p" $contentFile)
    separator
    return 0
}

function main() {
    sedPrint
    return $?
}

main $*
exit $?

