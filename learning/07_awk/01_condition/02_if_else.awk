## 执行命令 echo | awk -f 01_if.awk 
BEGIN {
    a="HelloWorld"
    b=10
    c=12
}

{
    ## 不匹配正则表达式
    if (a ~! /He.*Wo.*/) {
        print "\""a"\" does not match pattern /He.*Wo.*/"
    } else {
        print "\""a"\" matches pattern /He.*Wo.*/"
    }

    if (b > c) {
        print b" > "c
    } else {
        print b" < "c
    }
}

END {

}
