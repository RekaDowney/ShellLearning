#!/bin/bash

## 特别注意：字符串测试判断时，所有的字符串或者字符串变量都要加上双引号再测试

source /learning/base.sh

pink "特别注意：所有的字符串或者字符串变量都应该先使用双引号括起来再执行比较操作"

emptyString=""
string="Hello World"
str1='Abc'
str2='aBc'
str3='Abc'

yellow "\n-z 判断是否为空串"

[ -z $emptyString ] && green "字符串[${emptyString}]为空" || red "字符串[${emptyString}]非空"

[ -z "$emptyString" ] && green "字符串[${emptyString}]为空" || red "字符串[${emptyString}]非空"

[ -z "$string" ] && green "字符串[${string}]为空" || red "字符串[${string}]非空"

[ -z "$string" ] && green "字符串[${string}]为空" || red "字符串[${string}]非空"


## 特别注意：非空判断时，必须将字符串变量使用双引号括起来，否则空串也被判断为非空串

yellow "\n-n 判断是否非空串"

## 测试结果非空
[ -n $emptyString ] && green "未使用双引号括起来，字符串[${emptyString}]非空" || red "未使用双引号括起来，字符串[${emptyString}]为空"

## 测试结果为空
[ -n "$emptyString" ] && green "使用双引号括起来，字符串[${emptyString}]非空" || red "使用双引号括起来，字符串[${emptyString}]为空"

[ -n $sring ] && green "字符串[${string}]非空" || red "字符串[${string}]为空"

[ -n "$string" ] && green "字符串[${string}]非空" || red "字符串[${string}]为空"


## 测试字符串是否相等
yellow "\n"'"${string1}" = "${string2}" 判断字符串是否相等'

[ "${str1}" = "${str2}" ] && green "字符串${str1}与${str2}相等" || red "字符串${str1}与${str2}不相等"

[ "${str1}" = "${str3}" ] && green "字符串${str1}与${str3}相等" || red "字符串${str1}与${str3}不相等"

[ "${str2}" = "${str3}" ] && green "字符串${str2}与${str3}相等" || red "字符串${str2}与${str3}不相等"


## 测试字符串是否相等
yellow "\n"'"${string1}" == "${string2}" 判断字符串是否相等，相等判断可以使用一个等于号，也可以使用两个等于号'

[ "${str1}" == "${str2}" ] && green "字符串${str1}与${str2}相等" || red "字符串${str1}与${str2}不相等"

[ "${str1}" == "${str3}" ] && green "字符串${str1}与${str3}相等" || red "字符串${str1}与${str3}不相等"

[ "${str2}" == "${str3}" ] && green "字符串${str2}与${str3}相等" || red "字符串${str2}与${str3}不相等"


## 测试字符串是否不相等
yellow "\n"'"${string1}" != "${string2}" 判断字符串是否不等'

[ "${str1}" != "${str2}" ] && green "字符串${str1}与${str2}不相等" || red "字符串${str1}与${str2}相等"

[ "${str1}" != "${str3}" ] && green "字符串${str1}与${str3}不相等" || red "字符串${str1}与${str3}相等"

[ "${str2}" != "${str3}" ] && green "字符串${str2}与${str3}不相等" || red "字符串${str2}与${str3}相等"


## 比较字符串大小，大于号和小于号必须用\转义。不可以使用 -gt -lt（这两个只能是数字之间的比较）
yellow "\n"'"${string1}" \< "${string2}" "${string1}" \> "${string2}" 比较字符串的大小，注意<和>都必须用转义字符转义'
[ "${str1}" \> "${str2}" ] && green "${str1}大于${str2}" || red "${str1}不大于${str2}"

[ "${str1}" \> "${str3}" ] && green "${str1}大于${str3}" || red "${str1}不大于${str3}"

[ "${str2}" \> "${str1}" ] && green "${str2}大于${str1}" || red "${str2}不大于${str1}"

[ "${str2}" \> "${str3}" ] && green "${str2}大于${str3}" || red "${str2}不大于${str3}"

[ "${str3}" \> "${str1}" ] && green "${str3}大于${str1}" || red "${str3}不大于${str1}"

[ "${str3}" \> "${str2}" ] && green "${str3}大于${str2}" || red "${str3}不大于${str2}"

[ "${str1}" \< "${str2}" ] && green "${str1}小于${str2}" || red "${str1}不小于${str2}"

[ "${str1}" \< "${str3}" ] && green "${str1}小于${str3}" || red "${str1}不小于${str3}"

[ "${str2}" \< "${str1}" ] && green "${str2}小于${str1}" || red "${str2}不小于${str1}"

[ "${str2}" \< "${str3}" ] && green "${str2}小于${str3}" || red "${str2}不小于${str3}"

[ "${str3}" \< "${str1}" ] && green "${str3}小于${str1}" || red "${str3}不小于${str1}"

[ "${str3}" \< "${str2}" ] && green "${str3}小于${str2}" || red "${str3}不小于${str2}"

















