#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

## /dev/random 设备存储当前运行环境的实时数据，通过阻塞方式产生优质的随机数
function randByDevRandom() {
    head -n 200 /dev/random | cksum | 
}

## /dev/urandom 通过非阻塞方式产生随机数，读取速度块，但是安全性较差
function randByDevUrandom() {
    
}

function main() {
    return $?
}

main $*
exit $?

