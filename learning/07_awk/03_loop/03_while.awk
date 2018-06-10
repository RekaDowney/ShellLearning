## 统计 1 + 2 + ... + 9 + 10
BEGIN {
    sum=0
    start=1
    end=10
}

{
    while (start <= end) {
        sum+=start
        start++
    }
}

END {
    print sum
}
