BEGIN {
    for (i = 1; i < 10; i++ ) {
        for (j = 1; j <= i; j++) {
            arr[i,j]=i * j
        }
    }
}

{
    if ( (1,4) in arr) {
        print "arr 中存在 (1,4)"
    } else {
        print "arr 中不存在 (1,4)"
    }
    
    if ( (6,4) in arr) {
        print "arr 中存在 (6,4)"
    } else {
        print "arr 中不存在 (6,4)"
    }

    print "访问某个成员"
    print arr[4, 4]
    print arr[6, 4]

    print "遍历"
    for (a in arr) {
        ## 下面的遍历一维数组回报错
        #for (idx in a) {
        #    print idx" --> "a[idx]
        #}

        ## awk使用一个特殊的字符串SUBSEP作为分割字段
        split(a, subArr, SUBSEP)
        for (idx in subArr) {
            ## 输出内容怪怪的
            print idx" --> "subArr[idx]
        }
    }
}

END {

}
