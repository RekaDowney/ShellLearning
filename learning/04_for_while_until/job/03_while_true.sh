#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

function t() {
    local times=0;
    while true
    do
        if [ $times -eq 10 ]; then
            break;
        fi
        echo "$times --> Hello World!"
        ((times++))
    done
    return 0
}

function main() {
    t
    return $?
}

main $*
exit $?

