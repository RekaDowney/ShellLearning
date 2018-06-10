#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

contentFile="/learning/06_sort/url.txt"

function summary() {
    ## 以 / 作为分隔符，截取第三列后排序，再执行相邻去重并统计出现次数，最后以数字方式逆序排序
    awk -F / '{print $3}' $contentFile | sort | uniq -c | sort -rn
    separator
    
    cut -d / -f 3 $contentFile | sort | uniq -c | sort -rn
    separator
}

function main() {
    summary
    return $?
}

main $*
exit $?

