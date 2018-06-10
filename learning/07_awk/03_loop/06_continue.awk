## 统计 1 + 2 + ... + 9 + 10
BEGIN {
    sum=0
    i=1
}

{
    while(1 == 1) {
        sum+=i
        i++
        if (i <= 10) {
            continue
        }
        break
    }
}

END {
    print sum
}
