#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)
contentFile="/learning/05_sed/00_content.txt"

function append() {
    echo '$1变量值为：'$1

    ## "a ${var}"命令在每一行后面插入一行数据（内容为 $var）
    yellow -n '执行 sed "a $1" $content #在每一行后面插入新行'
    green $(sed "a $1" $contentFile)
    separator

    ## "${num}a ${var}" 命令在指定行后面插入一行数据（内容为 $var）
    yellow -n '执行 sed "1a $1" $contentFile #在第一行后面插入新行'
    red $(sed "1a $1" $contentFile)
    separator

    ## ’${num}a content‘ 命令在指定行后面插入一行数据（内容为 content 文本）
    yellow -n '执行 sed '"'1a 159_Vuk_Girl'"' $contentFile #在第一行后面插入新行'
    pink $(sed '1a 159_Vuk_Girl' $contentFile)
    separator

    ## "${start},${end}a ${var}" 命令在第${start}行到第${end}行的每行后面插入一行数据（内容为 $var）
    yellow -n '执行 sed '"'1,3a '"'$1 $contentFile #在第1行到第3行后面插入新行'
    red $(sed '1,3a '$1 $contentFile)
    separator

    ## "${start},+${num}a ${var}" 命令在第${start}行到第${start+num}行后面插入一行数据（内容为 $var）
    yellow -n '执行 sed '"'5,+5a '"'"$1" $contentFile #在第5行到第5+5行后面插入新行'
    blue $(sed '5,+5a '"$1" $contentFile)
    separator

    ## yellow -n '执行 sed "10,$a $1" $contentFile'
    ## 报错
    ## yellow $(sed "10,$a $1" $contentFile)
    ## "${start},$a ${var}" 命令在第${start}行到末尾行后面插入一行数据（内容为 $var）
    yellow -n "执行 sed '10,\$a '\$1 \$contentFile #在第10行到最后一行后面插入新行"
    red $(sed '10,$a '$1 $contentFile)
    separator

    ## "${start}~${step}a ${var}" 命令在第1行，第{1+step}行，第{1+step+step}行...后面插入一行数据（内容为 $var）
    yellow -n '执行 sed '"'1~2a '"'"$1" $contentFile #在第1，3，5...行（从1开始，每次步进为2）后面插入新行'
    green $(sed '1~2a '"$1" $contentFile)
    separator

    ### 使用了'~'步进之后就无法使用','来指定结束行，后者优先级高于前者
    ## "${start}~${step},${end}a ${var}" 命令在第1行，第{1+step}行...（不可以超过第${end}行）后面插入一行数据（内容为 $var）
    ##yellow -n '执行 sed '"'1~3,10a '"'"$1" $contentFile #在第1，4，7，10行（从1开始，每次步进为3，不超过10）后面插入新行'
    ##green $(sed '1~3,10a '"$1" $contentFile)
    ##separator

    separator
    separator
    separator

    ## 结合 sed 命令执行流程，可以直到，当存在多行文本内容符合匹配时，这些行后面都将插入新行
    #### 另外，只要匹配到行，不论该行是否超过了行数约束，都将执行 sed 脚本
    yellow -n '执行 sed "/Lily/a $1" $contentFile #匹配包含Lily的所在行，在该行后面插入新行'
    pink $(sed "/Lily/a $1" $contentFile)
    separator

    yellow -n '执行 sed "/Lily/,/Coco/a $1" $contentFile #从匹配包含Lily行到匹配包含Coco行的每一行后面插入新行'
    green $(sed "/Lily/,/Coco/a $1" $contentFile)
    separator

    yellow -n '执行 sed "/Lily/,10a "$1 $contentFIle #从匹配包含Lily行到第10行的每一行后面插入新行'
    red $(sed "/Lily/,10a $1" $contentFile)
    separator

    yellow -n '执行 sed '"'/Lily/,\$a '"'$1 $contentFile #从匹配包含Lily行到最后一行的每一行后面插入新行'
    pink $(sed '/Lily/,$a '$1 $contentFile)
    separator

    yellow -n '执行 sed "/Lily/,+4a $1" $contentFile #从匹配包含Lily行到该行+4的每一行后面插入新行'
    green $(sed "/Lily/,+4a $1" $contentFile)
    separator

    local matchContent='Rachel'
    yellow -n '执行 sed "/${matchContent}/a $1" $contentFile #匹配包含${matchContent='$matchContent'}的行，在该行后面插入新行'
    red $(sed "/${matchContent}/a $1" $contentFile)
    separator

    return 0
}

function main() {
    append "111_Bean_Boy"
    return $?
}

main $*
exit $?

