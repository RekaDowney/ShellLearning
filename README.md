## Shell脚本开发常用命令

### read

**格式**：

　　`read [-p <prompt>] [-t <timeout>] [-s] var1 var2... remainderVar`

**选项说明**：

　　`-p <prompt>`：提示信息，在读取变量之前打印。

　　`-s`：静默模式，用户输入的字符不在终端上显示。

　　`-t <timeout>`：超时控制，超过指定`${timeout}`秒数后，该变量保留原来的值（如果原来没有那就没有）。

**特殊场景**：

　　`read`命令不加任何参数，会将输入的一行数据读入到变量`REPLY`中，可以通过`$REPLY`获取输入的行信息。

　　`read -a <arrayName>`命令将输入的以空格分隔的数据存入到指定名称的数组中。



### alias

**新建脚本**

```shell
## 拷贝 /learning/script.template 文件到指定脚本，授予可执行权限，并打开该脚本
alias newScript='function __newScript() { cp /learning/script.template $1; chmod +x $1; vim $1; unset -f __newScript; }; __newScript'
```



**CPU 占用最多的 N 个进程**

```shell
    ## CPU 占用最多的 N 个进程
    alias cputop='function __cputop() { num=$(($1+1)); cmd="ps auxw | head -n 1; ps auxw | sort -rn -k 3 | sed -n \"2,${num}p\""; echo $cmd; eval $cmd; unset -f __cputop; }; __cputop'
```


**内存占用最多的 N 个进程**

```shell
## 内存占用最多的 N 个进程
    alias memtop='function __memtop() { cmd="ps auxw | head -n 1; ps auxw | sort -rn -k 4 | head -n $1"; echo $cmd; eval $cmd; unset -f __memtop; }; __memtop'
```

alias memtop='function __memtop() { local num=3; if [ $# -eq 1 ]; then num=$1; fi; cmd="ps auxw | head -n 1; ps auxw | sort -rn -k 4 | head -n $num"; echo $cmd; eval $cmd; unset -f __memtop; }; __memtop'

**虚拟内存占用最多的 N 个进程**

```shell
## 虚拟内存占用最多的 N 个进程
    alias virtmemtop='function __virtmemtop() { cmd="ps auxw | head -n 1; ps auxw | sort -rn -k 5 | head -n $1"; echo $cmd; eval $cmd; unset -f __virtmemtop; }; __virtmemtop'
```



**驻留区内存占用最多的 N 个进程**

```shell
## 驻留区内存占用最多的 N 个进程
    alias rsstop='function __rsstop() { cmd="ps auxw | head -n 1; ps auxw | sort -rn -k 6 | head -n $1"; echo $cmd; eval $cmd; unset -f __rsstop; }; __rsstop'
```

**驻留区内存占用最多的 N 个进程（默认3个进程）**
```shell
## 驻留区内存占用最多的 N 个进程
    alias rsstop='function __rsstop() { local num; if [ $# -eq 1 ]; then num=$1; fi; cmd="ps auxw | head -n 1; ps auxw | sort -rn -k 6 | head -n $num"; echo $cmd; eval $cmd; unset -f __rsstop; }; __rsstop'
```



### cat

**结束标志**

　　常用`cat << EOF`命令从`标准输入`输入多行数据，该命令在遇到`EOF`单独出现在一行时将结束输入，并将之前读取到的输入输出到`标准输出`中。比如：

```shell
[root@domestic job02]# cat << EOF
> Hello
> Boys
## EOF 如果前面有空格则视为正常输入
>   EOF
> And Girls
## EOF 后面如果有其他字符也视为正常输入
>EOF  ^_^
> EOF
## 说明：以上六行数据中，只有前五行数据被 cat 命令缓存并输出，第六行的 EOF 作为结束标志
Hello
Boys
  EOF
And Girls
EOF  ^_^
```

　　`EOF`只是习惯用法，我们也可以使用`END`等标识符。

**写入文件**

　　`cat > ${file}`命令或者`cat >> ${file}`从标准输入中读取数据并写入（追加）到指定文件中，结束标志符为行首输入`Ctrl D`。

　　`cat > ${file} << EOF`命令或者`cat >> ${file} << EOF`从标准输入中读取数据并写入（追加）到指定文件中，结束标志符为行首输入`EOF`。

**脚本信息**

　　`cat << EOF`命令常用于脚本信息提示，比如在`base.sh`脚本中，有这么一段信息：

```shell
cat << EOF
  _______________________________________________________________
  User:$USER                              DATE:$(date +'%Y-%m-%d %H:%M:%S')
  _______________________________________________________________

                    1、本脚本balabala
                    2、你可以balabala
                    0、balabala
  _______________________________________________________________

EOF
```

