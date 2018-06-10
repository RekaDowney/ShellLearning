## 执行命令 echo | awk -f 01_if.awk 
BEGIN {
    ## awk 不支持参数名为 in
    _in="HelloWorld"
}

{
    ## 正则表达式无法用变量存储
    if (_in ~ /He.*Wo.*/) {
        print "\""_in"\" matches pattern /He.*Wo.*/"
    }
}

END {

}
