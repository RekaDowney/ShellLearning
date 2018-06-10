#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

yellow "当前Shell运行层级"$SHLVL

green "使用 source 命令运行"
source /learning/01_entrance/justForTest.sh
source /learning/01_entrance/sourceAndDot.sh

green "使用 . 命令运行"
. /learning/01_entrance/justForTest.sh
. /learning/01_entrance/sourceAndDot.sh

green "使用 /bin/bash 命令运行"
/bin/bash /learning/01_entrance/justForTest.sh
/bin/bash /learning/01_entrance/sourceAndDot.sh
