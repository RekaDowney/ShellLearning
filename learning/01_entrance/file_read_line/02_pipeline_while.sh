#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

## 使用管道符和 while read 结合也可以逐行读取文件，不需要修改 IFS
function readFile() {
    [ -r $1 ] || {
        red "文件不存在或者文件不可读"
        return 1
    }
    local line
    local idx=1
    cat $1 | while read line
    do
        green $idx' --> '$line
        ((idx++))
    done
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

