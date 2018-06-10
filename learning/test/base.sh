## 使用复杂的变量名避免变量名冲突
const_color_red='\E[1;31m'
const_color_green='\E[1;32m'
const_color_yellow='\E[1;33m'
const_color_blue='\E[1;34m'
const_color_pink='\E[1;35m'
const_color_magenta='\E[1;35m'
const_color_cyan='\E[1;36m'
const_color_end='\E[0m'

function render() {
    local color=$1
    shift 1
    echo -e "${color}$*${const_color_end}" && return 0
    return 1
}

function red() {
    local arr=(${const_color_red} $@)
    render ${arr[@]}
    return $?
}

function green() {
    local arr=(${const_color_green} $@)
    render ${arr[@]}
    return $?
}

function yellow() {
    local arr=(${const_color_yellow} $@)
    render ${arr[@]}
    return $?
}

function blue() {
    local arr=(${const_color_blue} $@)
    render ${arr[@]}
    return $?
}

function magenta() {
    local arr=(${const_color_magenta} $@)
    render ${arr[@]}
    return $?
}

function cyan() {
    local arr=(${const_color_cyan} $@)
    render ${arr[@]}
    return $?
}

