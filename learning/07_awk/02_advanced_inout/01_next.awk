BEGIN {
}

{
    if (NR % 2 == 1) {
    ## 如果当前行为奇数行，则跳过当前行的处理
    ## 相当于 {} 语句块的 continue
        print NR" _ "$0
        next
    }
    print NR" --> "$0
}

END {

}
