#!/bin/bash

source /learning/base.sh

read -p "请输入用户名：" name

## 静默输入之后回车符被 read 读取，因此需要执行换行操作
read -s -p "请输入密码：" password
newline

read -p "输入两个数：" num1 num2

blue "$num1 -- $num2"

read -t 3 -p "请在3秒内输入 1 + 2 + 3 的结果：" result

green "欢迎您！$name"
yellow "您的密码为： $password"
pink "您输入的 1 + 2 + 3 的结果为：$result"


