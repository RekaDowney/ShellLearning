#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

contentFile="/learning/01_entrance/ip.txt"

function main() {
    ## 使用 uniq 可以忽略相邻的内容相同的行
    yellow -n '执行 uniq $contentFile # 剔除重复的相邻行'
    green $(uniq $contentFile)
    separator

    ## 先使用 sort 命令对文件内容排序后再执行 uniq 可以得到行内容不重复的内容
    yellow -n '执行 sort $contentFile | uniq -c # 对文件内容排序后剔除重复的相邻行可以得到不重复的内容，同时统计咩行出现的次数'
    green $(sort $contentFile | uniq -c)
    separator
    
    yellow -n '执行 sort -u $contentFile # 对文件内容进行行唯一排序'
    green $(sort -u $contentFile)
    separator

    return $?
}

main $*
exit $?

