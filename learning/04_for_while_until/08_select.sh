#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

function selectChoice() {
    local color
    green -n "Please choose what color you like: "
    select color in "red" "green" "yellow" "pink" "blue"
    do
        break
    done
    echo "Your choice is $color"
    case "$color" in
        'red')
            red "Red"
            ;;
        'green')
            green "Green"
            ;;
        'yellow')
            yellow "Yellow"
            ;;
        'pink')
            pink "Pink"
            ;;
        'blue')
            blue "Blue"
            ;;
        *)
            red "Invalid choice."
            ;;
    esac
}

function main() {
    selectChoice
    return $?
}

main $*
exit $?

