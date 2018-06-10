#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

function judge() {
    if [ $# -ne 1 ]; then
        red "Usage: $0 <num>"
        return 1
    fi
   
    #set -x
    isNum $1
    if [ $? -ne 0 ]
    then
        red "Usage: $0 <num>"
        return 2
    fi
    #set +x

    if [ $1 -lt 60 ]; then
        yellow "不及格"
    else
        green "及格"
    fi
    return 0
}

function main() {
    judge $*
    local retval=$?
    return $retval
}

main "$*"
retval=$?
exit $retval


