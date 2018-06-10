#!/bin/bash

## 引入 colorRender.sh 文件
source /learning/base.sh

## 可以通过 man test 命令查看测试条件

file=/learning/condition/fileCond.sh
dir=/learning/condition

[ -e "$file" ] && {
    green "${file}文件存在"
} || {
    red "${file}文件不存在"
}

[ -f $file ] && green "${file}是普通文件（regular fie）" || red "${file}不是regular文件"

[ -r $file ] && green "${file}文件可读" || red "${file}文件不可读"

[ -w $file ] && green "${file}文件可写" || red "${file}不可写"

[ -x $file ] && green "${file}文件可执行" || red "${file}文件不可执行"

[ -d $file ] && green "${file}是目录" || red "${file}不是目录"

[ -d "$file" ] && green "${file}是目录" || red "${file}不是目录"

[ -d $dir ] && green "${dir}是目录" || red "${dir}不是目录"

[ -d "$dir" ] && green "${dir}是目录" || red "${dir}不是目录"


f1=/etc/rc.local ## 链接文件
f2=/etc/services ## 普通文件

[ -f "$f1" -a -f "$f2" ] && green "$f1 和 $f2 都是普通文件" || red "$f1 和 $f2 不都是普通文件"

[ -f $f1 -a -f $f2 ] && green "$f1 和 $f2 都是普通文件" || red "$f1 和 $f2 不都是普通文件"


