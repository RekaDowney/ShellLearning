#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

num=0
min=1
max=50

function generate() {
    num=$(rand $min $max)
    return 0
}

function guess() {
    read -p "请输入$min~$max：" input
    #set -x
    isNum $input || {
        red "请输入数字"
        guess
        return $?
    }
    #set +x
    [ $input -lt $min -o $input -gt $max ] && {
        red "输入的数字不在范围内，请重新输入"
        guess
        return $?
    }
    [ $input -eq $num ] && {
        return 0
    }
    [ $input -lt $num ] && {
        return 1
    }
    return 2
}

function main() {
    local choice
    local retval
    while true
    do
        select choice in "生成随机数" "猜数" "退出"
        do
            break
        done
        case $choice in
        "生成随机数")
            generate
            green "随机数生成完毕，请开始猜数"
        ;;
        "猜数")
            guess
            retval=$?
            if [ $retval -eq 0 ]
            then 
                green "恭喜您！猜对了。"
            elif [ $retval -eq 1 ]
            then
                yellow "对不起！您猜的数小了"
            elif [ $retval -eq 2 ]
            then
                blue "对不起！您猜的数大了"
            else
                red "输入错误"
            fi
        ;;
        "退出")
            break
        ;;
        *)
            red "请选择有效的选项"
        ;;
        esac
    done
    return 0
}

main $*
exit $?

