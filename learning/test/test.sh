#!/bin/bash

source base.sh
source /etc/profile

upstreamFile='/learning/nginx/upstream.conf'
vod443File='/learning/nginx/vod443.conf'

ng=$(which nginx)

function nginxReload() {
    ${ng} -t 2>/dev/null || {
        ${ng} -t
        red "Nginx 配置修改有问题"
        return 2
    }
    ${ng} -s reload && {
        green "Nginx重启完毕"
        return 0
    } || {
        red "Nginx重启失败！"
        return 3
    }
}

function switchNginx() {
    local action
    green "请选择服务切换操作："
    select action in "主 -> 备" "备 -> 主"
    do
        break
    done

    case "${action}" in
        '主 -> 备')
            green '即将将服务切换到备机（备服务）'
            sed -i '3s/server 127.0.0.1:9081;/#server 127.0.0.1:9081;/' ${upstreamFile}
            sed -i '4s/#server 127.0.0.1:9082;/server 127.0.0.1:9082;/' ${upstreamFile}
            sed -i 's#MM.PORTAL.VOD#MM.PORTAL.VOD.BAK#g' ${vod443File}
            nginxReload
            ;;
        '备 -> 主')
            yellow '即将将服务切换到主机（主服务）'
            sed -i '3s/#server 127.0.0.1:9081;/server 127.0.0.1:9081;/' ${upstreamFile}
            sed -i '4s/server 127.0.0.1:9082;/#server 127.0.0.1:9082;/' ${upstreamFile}
            sed -i 's#MM.PORTAL.VOD.BAK#MM.PORTAL.VOD#g' ${vod443File}
            nginxReload
            ;;
        *)
            red "非法的选项"
            return 1
            ;;
    esac
}

function main() {
    switchNginx
    return $?
}

main $*
exit $?

