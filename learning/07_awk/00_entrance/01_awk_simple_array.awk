## awk 脚本
## awk 脚本中不能包含 source 命令，不能创建函数，只能由 BEGIN END 构成

## 执行方式： awk -f ${currentScript}

## awk 的数组索引从 1 开始
BEGIN {
    arr[1]="Jan"
    arr[2]="Feb"
    for (idx in arr)
        print idx, arr[idx]
}
