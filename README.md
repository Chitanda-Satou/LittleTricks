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
### 判断文件夹是否存在
```
if [ ! -d "/data/" ];then
    mkdir /data
else
    echo "文件夹已经存在"
fi
```
### 判断文件是否存在
```
if [ -d "/data/test" ];then
    echo "文件存在"
else
    echo "文件不存在"
fi
```
