BEGIN {
    map[1]="Mon"
    map[2]="Tue"
    map["Reka"]=24
    map["Rachel"]=23

}

{
    key=1
    if ( key in map) {
        print "map 中存在键为"key"的键值对"
    } else {
        print "map 中不存在键为"key"的简直对"
    }
    key="Reka"
    if ( key in map) {
        print "map 中存在键为"key"的键值对"
    } else {
        print "map 中不存在键为"key"的简直对"
    }
    key="ABC"
    if ( key in map) {
        print "map 中存在键为"key"的键值对"
    } else {
        print "map 中不存在键为"key"的简直对"
    }
}

END {

}
