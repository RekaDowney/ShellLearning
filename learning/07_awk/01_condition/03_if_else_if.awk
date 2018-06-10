## 执行命令 echo | awk -f 01_if.awk 
BEGIN {
    a=17
}

{
    if (a > 20) {
        print a" > 20"
    } else if (a > 15) {
        print "15 < "a" < 20"
    } else {
        print a" < 15"
    }
}

END {

}
