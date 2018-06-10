#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

## 休眠方法 usleep 单位为微秒，即 usleep = usleep 1 = 休眠1微秒
function usleepTest() {
    green "$(date +'%F %T.%N')"
    ## 休眠 100 微秒 = 休眠 0.1 毫秒
    usleep 100
    green "$(date +'%F %T.%N')"
    return 0
}

## 休眠方法 sleep 默认单位为秒，即 sleep 1 = sleep 1s = 休眠 1 秒
## 除了 s（秒）这个单位外，还有 m（分）、h（时）、d（天）这三个单位
function sleepTest() {
    yellow "$(date +'%Y-%m-%d %H:%M:%S.%N')"
    sleep 2
    yellow "$(date +'%F %T.%N')"
    
    sleep 1m
    yellow "$(date +'%F %T.%N')"
    return 0
}


function main() {
    usleepTest
    sleepTest
    return $?
}

main $*
exit $?

