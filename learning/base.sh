red='\E[1;31m'
green='\E[1;32m'
yellow='\E[1;33m'
blue='\E[1;34m'
pink='\E[1;35m'
magenta='\E[1;35m'
cyan='\E[1;36m'
colorEnd='\E[0m'

## 分隔符函数
function separator() {
    echo -e "\n${red}  ---------------  ${colorEnd}"
    echo -e "${green}  ---------------  ${colorEnd}"
    echo -e "${blue}  ---------------  ${colorEnd}"
    echo -e "${pink}  ---------------  ${colorEnd}\n"
    return 0
}

## 逐行渲染，参数1为颜色值，剩余参数为内容
## Usage: render colorValue renderContent
function render() {
    local color=$1
    shift 1
    if [ "$1" = '-n' ]; then
        shift 1
        echo -e "${color}$*${colorEnd}" && return 0
        return 1
    else
        local val
        for val in $@
        do
            echo -e "${color}${val}${colorEnd}"
        done
        return 0
    fi
    return 1
}

## 记录级别
function log() {
    local arr=(${green} $@)
    render ${arr[@]}
    return $?
}

## 通知级别
function info() {
    local arr=(${blue} $@)
    render ${arr[@]}
    return $?
}

## 警告级别
function warn() {
    local arr=(${yellow} $@)
    render ${arr[@]}
    return $?
}

## 错误级别
function error() {
    local arr=(${red} $@)
    render ${arr[@]}
    return $?
}

function green() {
    local arr=(${green} $@)
    render ${arr[@]}
    return $?
}

function yellow() {
    local arr=(${yellow} $@)
    render ${arr[@]}
    return $?
}

function blue() {
    local arr=(${blue} $@)
    render ${arr[@]}
    return $?
}

function pink() {
    local arr=(${pink} $@)
    render ${arr[@]}
    return $?
}

function red() {
    local arr=(${red} $@)
    render ${arr[@]}
    return $?
}

function isNum() {
    ## 缺陷：当 $1+1 运算返回 0 时判断$1为非数字，判断等于0时采用字符串比较更加有效
##   (($1+1)) &>/dev/null && return 0 || return 1 
##   expr $1 + 0 &>/dev/null && return 0 || return 1
    if [ $1 = "0" ] &>/dev/null; then
        return 0
    else
        (($1+0)) &>/dev/null && return 0 || return 1
    fi
}

function newline() {
    ## echo 命令不加任何参数就是换行
    echo 
}

## 只有通过 source 或者 . 方式引入当前脚本，才能够在父脚本中获取得到脚本的绝对路径

## 版本1
## 调用方式为： local scriptName=`getScriptName` 或者 local scriptName=$(getScriptName)，特别注意：由于 Shell 脚本 return 只能够返回整数，因此必须通过 echo 方式输出字符串，然后通过 `` 或者 $() 方式来获取输出的内容
function getScriptName() {
    ### 获取脚本名称
    local scriptName="$0"
    ### 截取脚本的第一个字符，如果以 . 开头，替换第一个出现的 . 字符
    if [ ${scriptName:0:1} = '.' ]; then
        #### sed 不添加 g 选项表示只替换第一个匹配的字符串
        #### local name=$(echo ${scriptName} | sed 's#\.##')
        #### sed 在末尾指定数字表示替换第 N 个匹配的字符串，加上 g 选项后可以替换第 N 个以及之后匹配的字符串
        local name=$(echo ${scriptName} | sed 's#\.##1')
        echo "$(pwd)${name}"
    else
        echo ${scriptName}
    fi
    return 0
}

## 版本2
## 直接通过 basename 命令获取得到脚本名称，然后将当前目录加上斜杠再加上脚本名称即可得到绝对路径
function getScriptName2() {
    local scriptName="$0"
    scriptName=$(basename ${scriptName})
    echo "$(pwd)/${scriptName}"
    return 0
}

function currentScript() {
    local scriptName="$0"
    scriptName=$(basename ${scriptName})
    echo "$(pwd)/${scriptName}"
    return 0 
}

## 获取随机数，生成区间为全闭 [ $min, $max ]
## rand ${min} ${max}
function rand() {
    local min=$1
    local interval=$(($2-$1+1))
    local num=$(date +'%s%N')
##    echo $((${num}%${interval}+${min}))
    echo $((num%interval+min))
    return 0
}

## 这里不可以添加 exit 0 语句，否则其他脚本在 source 的时候将会直接结束
