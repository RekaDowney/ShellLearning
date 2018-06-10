#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)
contentFile="/learning/05_sed/00_content.txt"

function sedReplaceFlag() {
    echo '$1变量值为：'$1

    ## g 标志：行内容全局替换，而不是默认的 1 替换
    ## i 标志：忽略大小写替换
    yellow -n "执行 sed \"s#lily#\$1#ig\" \$contentFile 忽略大小写，替换每行中所有匹配的文本"
    green $(sed "s#lily#$1#ig" $contentFile)
    separator

    ## 2 标志：替换第二个匹配的文本
    ## ${num} 标志：数字标志指定对第 ${num} 个匹配的文本进行替换操作
    yellow -n "执行 sed \"s#lily#\$1#2i\" \$contentFile 忽略大小写，替换每行中第二个匹配的文本"
    red $(sed "s#lily#$1#2i" $contentFile)
    separator

    ## p 标志通常需要关闭默认的模式空间输出，否则内容会重复
    yellow -n "执行 sed -n \"s#lily#\$1#ip\" \$contentFile 忽略大小写，替换每行中第一个匹配的文本，然后输出模式空间的内容"
    green $(sed -n "s#lily#$1#ip" $contentFile)
    separator

    ## w 标志将替换后的内容输出到文件中
    yellow -n "执行 sed -n \"s#lily#\$1#iw sedFlagOutput.txt\" \$contentFile 忽略大小写，替换每行中第一个匹配的文本，然后将模式空间中的内容输出到sedFlagOutput.txt中"
    red $(sed -n "s#lily#$1#iw sedFlagOutput.txt" $contentFile)
    separator

    ## e 标志将替换后的模式空间逐行执行
    local files="/learning/05_sed/00_content.txt\n/etc/passwd"
    echo -e $files | sed "s#^#ls -lh #e"
    separator
    
    return 0
}

function main() {
    sedReplaceFlag "111_Bean_Boy"
    return $?
}

main $*
exit $?

