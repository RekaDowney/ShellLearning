#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

function getLastParam() {
    yellow "参数长度为：$#"
    echo
    
    yellow "获取最后一个参数：（实现方式：变量的间接引用）"
    pink "方式一"
    len=$#
    last=${!len}
    green $last
    
    pink "方式二"
    green ${!#}

    ## 当参数个数大于10时，想要读取该参数必须添加花括号，否则读取出来的值是错误的
    red "位置大于10的参数必须使用花括号来访问"

    pink "方式三：不加花括号"
    green $(eval echo "\$$#")

    pink "方式三：加花括号"
    green $(eval echo "\${$#}")
    
    pink "方式四：不加花括号"
    cmd="echo \$$#"
    echo $cmd
    eval $cmd
    
    pink "方式四：加花括号"
    cmd="echo \${$#}"
    echo $cmd
    eval $cmd
}

getLastParam A B C D E F G H I J K L M N O P

