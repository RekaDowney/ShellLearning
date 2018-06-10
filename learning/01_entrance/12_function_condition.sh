#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)


## 函数返回值的条件判断
### 形式一：非if结构
function notIfStructure() {
    isNum '9' && {
        green "9是整数"
    }

    isNum 'a' || {
        green "a不是整数"
    }
}

### 形式二：if结构
function ifStructure() {
    if isNum 9; then
        green "9是整数"
    fi

    if ! isNum 'a'; then
        green "a不是整数"
    fi
}

function main() {
    notIfStructure
    ifStructure
    return $?
}

main $*
exit $?

