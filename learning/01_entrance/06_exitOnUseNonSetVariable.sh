#!/bin/bash

## 使用 set -o nounset 让脚本在使用到未设置的变量时退出执行
set -o nounset
## 或者使用下面的 set -u 命令
# set -u

# 导入 base.sh 脚本
source /learning/base.sh

green "打印未设置的变量a之前"
## 由于不允许使用未设置的变量，因此下面这里报错并退出脚本了。
## 如果没有 set -o nounset 命令，那么下面将打印空行
echo $a
green "打印未设置的变量a之后"
