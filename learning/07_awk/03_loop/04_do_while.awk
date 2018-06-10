## 统计 1 + 2 + ... + 9 + 10
BEGIN {
    sum=0
    start=1
    end=10
}

{
    do {
        sum+=start
        start++
    } while (start <= end)
}

END {
    print sum
}
