#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

function integerTest() {

    declare -i a=12
    yellow $a

    ## 可以直接使用 / * 等加减乘除运算直接计算整数
    a=$a/4
    yellow '可以直接执行$a/4得到：'$a

    ## 将字符串赋值给整数变量，此时整数变量直接变成0，不会报错
    a='string'
    yellow '将字符串赋值给a得到：'$a

    a=12

    ## 将浮点数赋值给整数变量，此时整数变量保持原来的整数值不变，但是会报错
    a=7.34
    yellow '将浮点数赋值给a得到：'$a

    ## declare +i 取消整数属性
    declare +i a
    a='string'

    yellow '使用declare -i a命令取消变量的整数属性后赋值，得到：'$a
}

## 使用 declare -r [name=[value]] 之后，变量无法撤销只读属性
function readOnlyTest() {
    ro=123
    green "变量ro值为："$ro

    ## 为变量ro授予只读属性
    declare -r ro
    ## 此时执行赋值操作将会直接报错并 exit 脚本
    #ro=321
    #green '使用declare -r ro命令为ro变量添加只读属性后修改ro得到：'$ro

    ## 无法使用 declare +r 命令撤销某个变量的只读属性
    #declare +r ro
    #ro=321
    #green '撤销只读属性后赋值：'$ro
    
    ## 可以直接在授予只读属性时直接指定变量值
    declare -r ro2=564

    green $ro2

}

function functionTest(){
    declare -f 
    greet() {
        if [ -z "$1" ]; then
            green "Hello World"
        else
            green "Hello $1"
        fi
    }
    greet Reka
    greet
}



# integerTest

# readOnlyTest

# functionTest



