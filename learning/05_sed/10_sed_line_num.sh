#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)
contentFile="/learning/05_sed/00_content.txt"

function sedLineNum() {

    yellow -n '执行 sed "=" $contentFile #打印行号后换行再输出每行的内容'
    sed "=" $contentFile
    separator

    yellow -n '执行 sed "=" $contentFile | sed '"'N; s#\\\\n# #'"' #打印行号后不换行输出每行的内容'
    sed "=" $contentFile | sed 'N; s#\n# #'
    separator

    return 0
}

function main() {
    sedLineNum
    return $?
}

main $*
exit $?

