#!/bin/bash

# 导入 Linux 通用函数库
source /etc/init.d/functions
# 导入 base.sh 脚本
source /learning/base.sh

function checkUrl() {
    responseCode=$(curl --connect-timeout 1 -I -s -o /dev/null -w "%{http_code}\n"  $1)
    if [ ${responseCode} -eq 200 ]; then
        action "ping $1 " /bin/true
        return 0
    else
        action "ping $1 " /bin/false
        return 1
    fi
}

# set -x 启动调试模式
# set -x
checkUrl $*
# set +x 关闭调试模式
# set +x

## 另外 set - 可以关闭在这之前打开的所有调试模式

retval=$?
if [ ${retval} -eq 0 ]; then
    exit 0
else
    exit 1
fi

