#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)
contentFile="/learning/05_sed/00_content.txt"

function sedGroupReplace() {
    local now=$(date +"%F %T")
    
    pink -n '${now} ==> '${now}

    yellow -n 'sed 正则替换，不加 -r 选项则需要对(){}这几个括号添加 \ 做转义'
    green -n $(echo $now | sed 's#^\([0-9]\{1,\}\)-\([0-9]\{1,\}\)-\([0-9]\{1,\}\) \([0-9]\{1,\}\):\([0-9]\{1,\}\):\([0-9]\{1,\}\)$#\1年\2月\3日 \4时\5分\6秒#')
    yellow -n 'sed -r 正则替换，不需要添加\转义'
    green -n $(echo $now | sed -r 's#^([0-9]{4})-([0-9]{2})-([0-9]{2}) ([0-9]{2}):([0-9]{2}):([0-9]{2})$#\1年\2月\3日 \4时\5分\6秒#g')
    separator

    return 0
}

function main() {
    sedGroupReplace
    return $?
}

main $*
exit $?

