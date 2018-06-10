#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

## 手机充值
## 例如：充10元，每发一次短信（输出当前余额）扣1角5分钱，当余额低于1角5分钱不能发短信，提示余额不足，请充值(可以允许用户充值继续发短信），请用 while 语句实现。
## 小提示：（单位换算。统一单位，统一成整数）10元=1000分，1角5分=15分

## 定义余额，单位：分
balance=0

## 充值
function recharge() {
    green "请选择充值金额："
    local money
    select money in "5毛" "1元" "2元" "5元" "10元" "20元"
    do
        break
    done

#    if [ -z "$money" ]; then
#        red "请从提供的选项中选择要充值的金额"
#        red " ------------------------------ "
#        red " ------------------------------ "
#        echo
#        recharge
#        return 1
#    fi

    case $money in
    "5毛")
        balance=$((balance + 50))
    ;;
    "1元")
        ((balance+=100))
    ;;
    "2元")
        ((balance+=200))
    ;;
    "5元")
        ((balance+=500))
    ;;
    "10元")
        ((balance+=1000))
    ;;
    "20元")
        ((balance+=2000))
    ;;
    *)
        red "请从提供的选项中选择要充值的金额"
        red " ------------------------------ "
        red " ------------------------------ "
        echo
        recharge
        return 1
    ;;
    esac
    return 0
}

## 发送短信，实际功能为广播消息
function sendSmsByWall() {

    if [ $balance -lt 15 ]; then
        red "Your balance[${balance}] is not enough to send sms. Please recharge."
        return 1
    fi

    read -p "Please input you sms message: " sms

    green "Send sms success [ $sms ]"
#    wall <<EOF
#        $sms
#EOF
#    2>/dev/null

    ## 输入 Ctrl D 结束从标准输入读取信息
    # wall

    if [ $? -ne 0 ]; then
        red "send sms broadcast error. "
        return 2
    fi

    ((balance-=15))    

    return 0
}

function sendSms() {
    if [ $balance -lt 15 ]; then
        red "Your balance[${balance}] is not enough to send sms. Please recharge."
        return 1
    fi
    read -p "Please input you sms message: " sms

    green "Send sms success [ $sms ]"
    if [ $? -ne 0 ]; then
        red "send sms broadcast error. "
        return 2
    fi

    ((balance-=15))    

    return 0
}

function main() {
    local choice=0

    while true
    do
        select choice in "余额查询" "充值" "发送短信" "清屏" "退出"
        do
            break
        done
        case $choice in
        "余额查询")
            pink "当前余额为：$balance"
        ;;
        "充值")
            recharge
            [ $? -eq 0 ] && {
                green "充值成功！当前余额为：$balance 分"
            } || {
                red "充值失败"
            }
        ;;
        "发送短信")
            sendSms
        ;;
        "清屏")
            clear
        ;;
        "退出")
            break
        ;;
        *)
            red "请重新确认操作"
        ;;
        esac
    done
    return $?
}

main $*
exit $?

