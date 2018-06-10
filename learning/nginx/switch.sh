#!/bin/bash

# 导入 base.sh 脚本
source /learning/base.sh

# 导入通用函数库
source /etc/init.d/functions

source /etc/profile

upstreamFile='/learning/nginx/upstream.conf'
vod443File='/learning/nginx/vod443.conf'
ng=$(which nginx)

## currentScript 变量存储当前脚本的绝对路径
currentScript=$(currentScript)

function nginxReload() {
    ${ng} -t 2>/dev/null || {
        ${ng} -t
        red -n "Nginx 配置修改有问题"
        return 2
    }
    ${ng} -s reload && {
        echo "服务切换完毕 $1"
        return 0
    } || {
        echo -e "Nginx重启失败！"
        return 3
    }
}

function switchChoice() {
    local action
    green -n "请选择服务切换操作："
    select action in "主 -> 备" "备 -> 主"
    do
        break
    done
    case "$action" in
        '主 -> 备')
            red -n '即将将服务切换到备机（备服务）'
            sed -i '3s/server 127.0.0.1:9081;/#server 127.0.0.1:9081;/' ${upstreamFile}
            sed -i '4s/#server 127.0.0.1:9082;/server 127.0.0.1:9082;/' ${upstreamFile}
            sed -i 's#MM.PORTAL.VOD#MM.PORTAL.VOD.BAK#g' ${vod443File}
            nginxReload "$action"
            ;;
        '备 -> 主')
            red -n '即将将服务切换到主机（主服务）'
            sed -i '3s/#server 127.0.0.1:9081;/server 127.0.0.1:9081;/' ${upstreamFile}
            sed -i '4s/server 127.0.0.1:9082;/#server 127.0.0.1:9082;/' ${upstreamFile}
            sed -i 's#MM.PORTAL.VOD.BAK#MM.PORTAL.VOD#g' ${vod443File}
            nginxReload "$action"
            ;;
        *)
            red -n "非法的选项"
            return 1
            ;;
    esac
}

function main() {
    switchChoice
    return $?
}

main $*
exit $?
