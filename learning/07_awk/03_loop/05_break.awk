## 统计 1 + 2 + ... + 9 + 10
BEGIN {
    sum=0
    i=1
}

{
    while(1 == 1) {
        if (i > 10) {
            break
        }
        sum+=i
        i++
    }
}

END {
    print sum
}
