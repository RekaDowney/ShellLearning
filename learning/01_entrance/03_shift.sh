#!/bin/bash

source /learning/base.sh

## 具体参考： http://blog.csdn.net/nyist327/article/details/44804745

## shift [num] 命令用来从参数列表中左移出指定数量的参数，默认 num 为 1。移除之后参数列表长度减去指定数量
function shiftFunc() {
    green "总共 $# 个参数"
    lastMinus1=$(($#-1))
    until [ $# -eq 0 ]
    do
        yellow "剩余 $# 个参数，左移出一个参数 -- $1"
        shift
    done
}

pink '参数列表小于 10'"\n"

shiftFunc a b c d e f g

pink "\n"'参数列表大于 10'"\n"

shiftFunc a b c d e f g h i j k l m n

function func() {
    green "总共 $# 个参数"
    yellow "$*"
}

func a b c d e f g
func a b c d e f g h i j k l m n 

