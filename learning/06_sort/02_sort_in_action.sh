#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

contentFile="/learning/06_sort/ip.txt"


## 需求，将 /learning/06_sort/ip.txt 文本中按照IP的第三段逆序排序，然后按照第四段正序排序
function sortAction() {
    ## sort -t '.' -k 3 -rn -k 4.1,4.3 -n $contentFile
    ## 要点1：先按照第三个字段排序时，必须写成 -k3,3rn 如果写成 -k3rn 则后续的-k字段排序都无法生效
    ## 要点2：通常将k、r、n这三个排序关键字按照 k${FStart}.${CStart},${FEnd.CEnd}rn 这样排列
    sort -t '.' -k3,3rn -k4.1,4.3n $contentFile
    separator

    ## 先按照第四列前三个字符正序排序，再按照第三列逆序排序
    sort -t '.' -k4.1,4.3n -k3,3rn $contentFile
    separator
}

function main() {
    sortAction
    return $?
}

main $*
exit $?

