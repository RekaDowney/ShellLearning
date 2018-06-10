#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

function breakWithoutNum() {
    local i
    local j
    for i in {a..d}
    do
        echo -n $i' --> '
        for j in $(seq 1 10)
        do
            if [ $j -eq 5 ]; then
                ## break 不携带数字表示跳出当前层的循环
                break
            fi
            echo -n "$j "
        done
        echo
    done
    return 0
}


function breakWithNum() {
    local i
    local j
    for i in {a..d}
    do
        echo -n $i' --> '
        for j in $(seq 1 10)
        do
            if [ $j -eq 5 ]; then
                ## break 2 表示跳出当前层以及上层总共2层循环
                break 2
            fi
            echo -n "$j "
        done
        echo
    done
    echo
    return 0
}

function continueWithoutNum() {
    local i
    local j
    for i in {a..c}
    do
        echo -n $i' --> '
        for j in $(seq 1 2 10)
        do
            if [ $j -eq 5 ]; then
                ## continue 不携带数字表示忽略本次循环体并继续当前层的循环
                continue
            fi
            echo -n "$j "
        done
        echo
    done
    return 0
}

function continueWithNum() {
    local i
    local j
    for i in {a..c}
    do
        echo -e "\n$i start..."
        for j in $(seq 1 2 10)
        do
            if [ $j -eq 5 ]; then
                ## continue 不携带数字表示忽略本次循环体并继续当前层的循环
                continue 2
            fi
            echo -n "$j "
        done
        echo "$i end..."
    done
    return 0
}

function main() {
    green '采用 break 跳出该层循环'
    breakWithoutNum

    pink '使用 break 2 跳出该层以及上层总共两层循环'
    breakWithNum

    yellow '使用 continue 忽略当前循环体并继续执行当前循环'
    continueWithoutNum

    blue '使用 continue 2 忽略当前循环体以及上层循环体，并继续执行上层循环'
    continueWithNum
    echo 

    return $?
}

main $*
exit $?

