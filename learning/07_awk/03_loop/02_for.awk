## 统计 1 + 2 + ... + 9 + 10
BEGIN {
    sum=0
}

{
    for (i=1; i<=10; i++) {
        sum=sum + i
    }
}

END {
    print sum
}
