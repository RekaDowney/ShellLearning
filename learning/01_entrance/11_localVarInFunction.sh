#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

## 默认函数中除了入参属于局部变量外，其他在函数中声明的变量作用域默认都是global（全局的）
## 可以通过 local 关键字将函数中的变量声明定义为局部的，这样整个变量只能够在函数中访问，如果此时发现存在同名的全局变量则会临时隐藏全局变量

function greet() {
    local defaultName='World'
    [ -z "$1" ] && yellow "Hello $defaultName" || yellow "Hello $1"
    return 0
}

greet
green "defaultName=$defaultName"

greet 'Reka'
green "defaultName=$defaultName"

function greet2() {
    defaultName='World'
    [ -z "$1" ] && pink "Hello $defaultName" || pink "Hello $1"
    return 0
}

greet2
green "defaultName=$defaultName"

greet2 'Reka'
green "defaultName=$defaultName"
