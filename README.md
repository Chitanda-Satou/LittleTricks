# LittleTricks
### 判断一类文件是否存在
```
file_counts=`ls *.log 2>/dev/null | wc -l`
if [[ "$file_counts" != "0" ]]; then
    do something
else
    do something
fi
```
