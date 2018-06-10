#!/bin/bash

source /learning/base.sh

pink '在 [] 或者 test 测试中，支持 -a、-o、! 来表示 与、或、非运算'

a=1
b=2
f='/learning/base.sh'
s=''

yellow "\n"'-a 与运算'
[ $a -lt $b -a -e $f ] && green "$a 小于 $b 并且 $f 文件存在" || red "$a 不小于 $b 或者 $f 文件不存在"

yellow "\n"'-o 或运算'
[ $a -gt $b -o -z "$s" ] && green "$a 大于 $b 或者 [$s] 是空串" || red "$a 不大于 $b 并且 [$s] 不是空串"

yellow "\n"'! 非运算'
[ ! -z "$s" ] && green "[$s]不是空串" || red "[$s]是空串"




