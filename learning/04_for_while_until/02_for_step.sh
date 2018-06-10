#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

function forStep() {
    local i
    local sum=0
    #set -x
    ## 当使用 num1..num2..step 模式时，不支持其中某个参数为变量的形式
    ## 形如 for i in {1..$1..$2} 的形式是无法被识别成数组的
    for i in {1..100..2}
    do
       sum=$((sum+i))
    done
    #set +x
    echo $sum
    return 0
}

function forStep2() {
    #[ $# -ne 3 ] && {
    #    red "Usage: $currentScript <firstNum> <lastNum> <step>"
    #    return 1
    #}
    local i
    local sum=0
    #set -x
    for i in $(seq $1 $3 $2)
    do
        sum=$((sum+i))
    done
    #set +x  
    echo $sum
    return 0
}

function main() {
    local result=$(forStep 100 2)
    red "计算1 + 3 + ... + 100，即统计1到100之间，步进为2的数字之和："$result

    [ $# -ne 3 ] && {
        red "Usage: $currentScript <start> <end> <step>"
        return 1
    }
    result=$(forStep2 $*)
    red "计算 $1 + ... + $2，步进为 $3 的数字之和："$result
    return $?
}

main $*
exit $?

