#!/bin/bash

source /learning/base.sh

num0=0
num5=5
num19=19
num23=23

pink '不支持在 [] 中使用加减乘除运算符'

yellow "\n"'数字大小比较，可以在 [] 中使用 -eq -ne -gt -ge -lt -le 来执行等于、不等、大于、大于等于、小于、小于等于判断'

## [ $num5 -eq $num0 + $num5 ] && green "${num5} 等于 ${num0} + ${num5}" || red "${num5} 不等于 ${num0} + ${num5}"

num=$((num0+num5))
[ $num5 -eq $num ] && green "${num5} 等于 ${num}" || red "${num5} 不等于 ${num}"

[ ${num5} -ne ${num19} ] && green "${num5} 不等于 ${num19}" || red "${num5} 等于 ${num19}"

[ ${num5} -lt ${num19} ] && green "${num5} 小于 ${num19}" || red "${num5} 不小于 ${num19}"

[ ${num19} -gt ${num5} ] && green "${num19} 大于 ${num5}" || red "${num19} 不大于 ${num5}"

[ ${num} -ge ${num5} ] && green "${num} 大于等于 ${num5}" || red "${num} 小于 ${num5}"

[ ${num} -le ${num5} ] && green "${num} 小于等于 ${num5}" || red "${num} 大于 ${num5}"


yellow "\n"'let 只能用来做算数运算，无法直接参数条件判断'
let num=num19+num5 && green "$num19 + $num5 等于 $num" || red 'let 运算发生错误'

pink "\n"'形如 let num5<num19 的条件判断将会报错，因此let运算不支持条件判断'
## let $num5<$num19 && green Y || red N

yellow "\n"'$(()) 只能用来做算数运算，无法直接参数条件判断'
num=$((num0+num5+num19-num23)) && green "$num0 + $num5 + $num19 - $num23 等于 $num" || red '$(())运算发生错误'

pink "\n"'形如 $((num0<num23)) 的条件判断将会报错，因此$(())不支持条件判断'
## $((num0<num23)) && green Y $num || red N

yellow "\n"'(()) 支持算数运算与条件判断其中 ==、!=、<、<=、>、>= 分别代表等于、不等于、小于、小于等于、大于、大于等于判断'
((num5+num19>num23)) && green "$num5 + $num19 大于 $num23" || red "$num5 + $num19 不大于 $num23"
((num5+num0>=num5)) && green "$num5 + $num0 大于等于 $num5" || red "$num5 + $num0 小于 $num5"

((num5+num0!=num5)) && green "$num5 + $num0 不等于 $num5" || red "$num5 + $num0 等于 $num5"

((num5+num0==num5)) && green "$num5 + $num0 等于 $num5" || red "$num5 + $num0 不等于 $num5"








