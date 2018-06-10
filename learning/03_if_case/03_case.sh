#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

function judge() {
    [ $# -ne 1 ] && {
        red "Usage: ${currentScript} <num>"
        exit 1
    }

    #set -x
    isNum $1
    [ $? -ne 0 ] && {
        red "Usage: ${currentScript} <num>"
        exit 2
    }
    #set +x

    local _100=100
    case "$1" in
        ## 可以使用正则匹配
        [0-9]|1[0-9]|2?|3?|4?|5?)
            red "不及格"
            return 0
            ## 即使上一条语句 return 了，这里依然要加上 ;; 中断符，否则报错
            ;;
        ## 这里不可以将 6? 加上双引号，否则将被识别成字符串，造成 6N 无法被匹配
        6?)
            yellow "及格"
            return 0
            ;;
        7?)
            pink "良好"
            return 0
            ;;
        8?)
            blue "优良"
            return 0
            ;;
        9?)
            green "优秀"
            return 0
            ;;
        ## 这里可以使用变量来匹配
        "$_100")
            green "精英"
            return 0
            ;;
        ## * 匹配所有
        *)
            red "num must between 0 and 100"
            return 3
            ;;
    esac
}

function main() {
    judge $*
    return $?
}

main $*
exit $?

