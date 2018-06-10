#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)
contentFile="/learning/05_sed/00_content.txt"

function sedWrite() {
    yellow -n '执行 sed "w sedOutput.txt" $contentFile #将模式空间中的所有内容输出到sedOutput.txt中'
    sed -n "w sedOutput.txt" $contentFile
    separator

    ## yellow -n '执行 sed "6,$c "''替换6到最后一行''";w sedRepaceOutput.txt" $contentFile #执行行替换后，将模式空间中的所有内容输出到sedOutput.txt中'
    ## 使用行替换无法再使用 w 命令
    ## green $(sed '6,$c 替换6到最后一行; w sedReplaceOutput.txt' $contentFile)
    yellow -n "执行 sed '6,\$d; w sedDeleteOutput.txt' \$contentFile #删除6到最后一行后将模式空间中的所有内容输出到sedDeleteOutput.txt中"
    green $(sed '6,$d; w sedDeleteOutput.txt' $contentFile)
    separator

    return 0
}

function main() {
    sedWrite
    return $?
}

main $*
exit $?

