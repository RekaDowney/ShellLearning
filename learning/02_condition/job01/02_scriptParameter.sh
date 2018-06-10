#!/bin/bash

source /learning/base.sh

[ $# -eq 2 ] || {
    red "参数个数不对"
    green 'sage: 02_scriptParameter.sh <num1> <num2>'
    exit 1
}

isNum $1 || {
    red "$1 不是数字"
    exit 1
}

isNum $2 || {
    red "$2 不是数字"
    exit 1
}

[ $1 -gt $2 ] && {
    green "$1 大于 $2"
    exit 0
}

[ $1 -eq $2 ] && {
    green "$1 等于 $2"
    exit 0
}

green "$1 小于 $2"
exit 0

