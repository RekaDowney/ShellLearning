#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

## 系统默认的换行符即 IFS，默认 IFS 包括 空格、回车、制表符
## readFile <file> 函数必须先将 IFS 设置成换行，否则在读取文件时遇到空格或者制表符都将作为中断并存储到 line 变量中
function readFile() {
    ## 备份系统默认的 IFS
    local IFS_BAK=$IFS
    ## 将 IFS 设置成换行符
    IFS="
"
    [ -r $1 ] || {
        read "$1 文件不存在或者文件不可访问"
        return 1
    }
    local line
    local idx=1
    for line in $(cat $1)
    do
        green ${idx}' --> '${line}
        ((idx++))
    done
    ## 恢复成系统默认的 IFS
    IFS=$IFS_BAK
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

