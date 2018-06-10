#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

function rand() {
    local pool=(0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
    local poolLength=${#pool[@]}
    local i=0
    local randomString
    for ((;i<$1;i++))
    do
        randomString=${randomString}${pool[$((RANDOM%poolLength))]}
        ((i++))
    done
    echo ${randomString}
    return 0
}

function main() {
    local i
    for ((i=1;i<=10;i++))
    do
        green $(rand $i)
        ((i++))
    done
    return $?
}

main $*
exit $?

