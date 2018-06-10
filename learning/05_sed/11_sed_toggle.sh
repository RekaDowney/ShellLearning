#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)
contentFile="/learning/05_sed/00_content.txt"

function sedToggle() {
    yellow -n '执行 sed "y#are#ARE#" $contentFile #将a替换成A，将r替换成R，将e替换成E'
    green $(sed "y#are#ARE#" $contentFile)
    separator

    return 0
}

function main() {
    sedToggle
    return $?
}

main $*
exit $?

