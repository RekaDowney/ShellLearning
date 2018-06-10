#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

currentScript=$(currentScript)


function judge() {
    [ $# -ne 1 ] && {
        red "Usage: ${currentScript} <num>"
        return 1
    }
    
    isNum $1
    [ $? -ne 0 ] && {
        red "Usage: ${currentScript} <num>"
        return 2
    }

    if [ $1 -lt 0 ]; then
        red "num must not be negative."
        return 3
    elif [ $1 -lt 60 ]; then
        red "不及格"
    elif [ $1 -lt 70 ]; then
        yellow "及格"
    elif [ $1 -lt 80 ]; then
        pink "良好"
    elif [ $1 -lt 90 ]; then
        blue "优良"
    elif [ $1 -le 100 ]
    then
        green "优秀"
    else
        red "num must not greater than 100"
        return 4
    fi
    return 0
}

function main() {
    judge $*
    return $?
}

main $*
exit $?

