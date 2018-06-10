#!/bin/bash 
## 第一行后面的选项说明：
## -v （verbose 的简称）运行脚本时显示所有行，激活详细模式。
## -n （noexec 或 no execution 的简称），运行脚本时只读取脚本内容而不执行任何命令，这个选项通常用来激活语法检查模式。
## -x （xtrace 或 execution trace 的简称），运行脚本时显示所有执行的命令和他们的参数，这个选项通常用来启动 Shell 跟踪调试模式。
## -vn 为 v 和 n 选项的组合；-vx 为 v 和 x 选项的组合；切记不能拆分成 -v -n 或者 -v -x 来使用，否则报错

source /learning/base.sh

yellow "反引号执行命令"
green "当前目录是`pwd`"

echo
yellow '$(cmd)执行命令'
pink "当前目录是$(pwd)"

echo
yellow '$($cmdVar)执行命令'
cmd="pwd"
blue "当前目录是$($cmd)"

echo
yellow 'eval $cmdVar 执行命令'
red "当前目录是"
eval $cmd

