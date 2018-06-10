BEGIN {
    arr[1]="Mon"
    arr[2]="Tue"
    arr["Reka"]=24
    arr["Rachel"]=23

    str="My name is Reka"
}

{
    for (idx in arr) {
        print idx" --> "arr[idx]
    }

    print "以空格切割\""str"\"字符串"
    lens=split(str, arr2, " ")
    for (i = 1; i <= lens; i++) {
        print arr2[i]
    }

    print "lens ==> "lens
    print "length(arr2) ==> "length(arr2)
    print "length(arr) ==> "length(arr)
    
}

END {

}
