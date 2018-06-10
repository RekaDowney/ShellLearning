## 执行命令 awk -F "/" -f 02_awk_unique.awk url.txt
## 如果需要排序，则通过管道符加 sort 实现，如 | sort -k2rn

{
    ## 取第三列作为 key，然后值自增1，数组默认自动初始化为0或者空串
    ## 此时如果 key 一致，则实际上可以将该数组看成是 Map
    arr[$3]=arr[$3]+1
    ## arr[$3]+=1
    ## arr[$3]++
    ## 自增1还可以使用 arr[$3]++ 或者 arr[$3]+=1
}

END {
    for (idx in arr)
        ## 使用 print 变量1, 变量2 将会输出 变量1的值 空格 变量2的值
        ## print idx, arr[idx]
        print idx" --> "arr[idx]
}
