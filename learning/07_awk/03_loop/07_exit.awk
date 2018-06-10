## 统计 1 + 2 + ... + 9 + 10
BEGIN {
    sum=0
    i=1
}

{
    while(1 == 1) {
        sum+=i
        i++
        if (i == 11) {
            exit
        }
    }
    print "sum in {} block ==> "sum
}

END {
    print "sum in END block ==> "sum
}
