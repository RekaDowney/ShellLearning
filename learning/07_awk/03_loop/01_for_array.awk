BEGIN {
    ## 对于一维数组，可以简单看成 Map，其中 Key 为索引，Value 为值
    arr[1]="A"
    arr[2]="B"
    arr[3]="C"
    arr[4]="D"
}

{
    for (idx in arr) {
        print idx" --> "arr[idx]
    }
}

END {

}
