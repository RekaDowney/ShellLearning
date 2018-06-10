BEGIN {
    map[1]="Mon"
    map[2]="Tue"
    map["Reka"]=24
    map["Rachel"]=23

}

{
    key=2
    print "删除Key为"key"的键值对之前"
    for (idx in map) {
        print idx" --> "map[idx]
    }

    delete map[key]
    print "删除Key为"key"的键值对之后"
    for (idx in map) {
        print idx" --> "map[idx]
    }

}

END {

}
