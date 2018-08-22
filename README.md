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
if [ -f "/data/test" ];then
    echo "文件存在"
else
    echo "文件不存在"
fi
```

### Github访问慢的解决方法
国内访问Github实在太慢，挂代理、改hosts无明显效果。发现码云可以同步github的代码，故提出解决方案如下：
### 1 在码云构建github的同步镜像
网址是：https://gitee.com/
注册账户，创建项目时，勾选“导入已有项目”
将github的git链接贴入，等待同步完成。

### 2 git clone码云的代码，速度极快

### 3 解决R包的安装问题。
首先要安装好所有的依赖；
其次，将R包的代码git clone到本地；
然后即可从本地安装，代码如下：
```
install.packages("path/to/R_package/root/", repos=NULL, type="source")
```
