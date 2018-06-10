#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

readonly pwdFile="/etc/passwd"

echo ${pwdFile}

## 这里不能使用单引号，否则 ${pwdFile} 无法识别
cmd="cat ${pwdFile} | column -t -s :"
eval $cmd

## 设置 readonly 变量时将报错
# ./readonlyVariable.sh: line 14: pwdFile: readonly variable
pwdFile="/etc/group"

