#!/bin/bash

source /learning/base.sh

a='Hello'
b=''
startOffset=1
length=4
num=1234

yellow '${var1:-${var2}} 表达式：当 var1 变量未定义或者为空串时，返回变量 var2 的值'
green "b为空串返回变量a -- ${b:-$a}"
blue '执行完毕${b:-$a}后变量b的值为 -- '$b
green "c未定义返回变量a -- ${c:-$a}"
blue '执行完毕${c:-$a}后变量c的值为 -- '$c

yellow "\n"'${var1:=${var2}} 表达式：当 var1 变量未定义或者为空串时，返回变量 var2 的值并将变量 var2 的值赋值给变量 var1'
green "b为空串返回变量a -- ${b:=$a}"
blue '执行完毕${b:=$a}后变量b的值为 -- '$b
green "c未定义返回变量a -- ${c:=$a}"
blue '执行完毕${c:=$a}后变量c的值为 -- '$c

yellow "\n"'${var1:${startOffset}} 表达式：获取变量 var1 从 startOffset 索引开始的子串'
green '${a:2}'"获取$a从索引为2开始的子串 -- ${a:2}"
green '${a:${startOffset}}'"获取${a}从索引为${startOffset}开始的子串 -- ${a:${startOffset}}"

yellow "\n"'${var1:${startOffset}:${length}} 表达式：获取变量 var1 从 startOffset 索引开始，总共 length 个字符的子串'
green '${a:2:2}'"获取$a从索引为2开始，总共2个字符的子串 -- ${a:2:2}"
green '${a:${startOffset}:${length}}'"获取${a}从索引为${startOffset}开始，总共${length}个字符的子串 -- ${a:${startOffset}:${length}}"

yellow "\n"'${#var} 表达式：获取变量 var 的字符个数'
green "获取${num}的字符长度 -- ${#num}"
green "获取${a}的字符长度 -- ${#a}"

