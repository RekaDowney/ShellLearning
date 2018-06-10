#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

lampScrit=/learning/condition/job02/lamp.sh
lnmpScrit=/learning/condition/job02/lnmp.sh

cat << EOF
1) Install LAMP;
2) Install LNMP;
0) Exit
Please input the Web Server you want to install: 
EOF
read choice

isNum $choice || {
    red "Incorrect input"
    exit 3
}

[ $choice -eq 1 ] && {
    [ -x "$lampScript" ] && {
        green "Start install lamp..."
        eval "$lampScript"
        exit 0
    } || {
        red "The lamp install script is not exists or unexecutable."
        exit 1
    }
}

[ $choice -eq 2 ] && {
    [ -x "$lnmpScript" ] && {
        green "Start install lnmp..."
        eval "$lnmpScript"
        exit 0
    } || {
        red "The lnmp install script is not exists or unexecutable."
        exit 2
    }
}

[ $choice -eq 0 ] && {
    exit 0
} || {
    red "Incorrect input"
    exit 3
}





