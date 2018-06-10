#!/bin/bash

source /learning/base.sh

pink '[[  ]] 关键字（注意[[和[、test都不一样，前者是关键字，后两者是命令，在/usr/bin/中可以查找得到）增强了条件标志，比如可以直接使用 >、&& 来表示字符串大小判断以及逻辑与判断；支持字符串模糊匹配'

a=1
b=2
s=''
abc='abc'
abd='abd'
f='/learning/base.sh'

yellow "\n"'条件标志增强'
[[ "$abc" > "$abd" ]] && green "$abc 大于 $abd" || red "$abc 不大于 $abd"

[[ "$abd" > "$abc" ]] && green "$abd 大于 $abc" || red "$abd 不大于 $abc"

[[ "$abc" < "$abd" && $a -lt $b ]] && green "$abc 小于 $abd 并且 $a 小于 $b" || red "$abc 不小于 $abd 或者 $a 不小于 $b"

yellow "\n"'字符串模糊匹配，"?"匹配单个字符，"*"匹配任意数量字符'

[[ "$abc" = ab? ]] && green "ab? 模糊匹配到 $abc" || red "ab? 无法模糊匹配到 $abc"

[[ "$abc" = a* ]] && green "a* 模糊匹配到 $abc" || red "a* 无法模糊匹配到 $abc"

[[ "$abc" = x* ]] && green "x* 模糊匹配到 $abc" || red "x* 无法模糊匹配到 $abc"



