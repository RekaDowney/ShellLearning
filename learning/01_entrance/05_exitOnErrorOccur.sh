#!/bin/bash

## 如果本脚本中额命令运行失败则让脚本退出执行
# set -o errexit
## 除了使用 set -o errexit 外，还可以使用如下命令
set -e


# 导入 base.sh 脚本
source /learning/base.sh

a='a'

## 这里对返回 false 做了处理，因此可以正常往下执行脚本
isNum $a || {
    red "非数"
}

green "判断 $a 是不是数字，是的话返回 0，否的话返回 1。返回1时由于设置了 erreixt，因此会直接退出脚本"
## 由于设置了 set -e，因此当函数返回 1 时将会退出脚本
isNum $a
echo $?

green "到了"
exit 0

