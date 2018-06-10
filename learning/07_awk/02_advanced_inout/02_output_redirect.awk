BEGIN {
}

{
    ## 将输出内容重定向到 or.txt 文件中，文件必须使用双引号括起来
    print "Hellow Wolrd" > "or.txt"
}

END {

}
