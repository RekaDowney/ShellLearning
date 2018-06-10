#!/bin/bash

source /learning/base.sh

num1=11
num2=11

isNum $num1 || {
    red "$num1 不是数字"
    exit 1
}

isNum $num2 || {
    red "$num2 不是数字"
    exit 1
}

[ $num1 -gt $num2 ] && {
    green "$num1 大于 $num2"
    exit 0
}

[ $num1 -eq $num2 ] && {
    green "$num1 等于 $num2"
    exit 0
}

green "$num1 小于 $num2"


