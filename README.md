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
### 判断文件名中是否包含特定字符（并删除）
```
remove () {
        result=$(echo $1 | grep "2018031502")
        if [ -z $result ]; then
            rm $1
        fi
}
export -f remove 

ls | parallel remove 

# 不包含特定字符：
if [ -z $result ] # 当串的长度为0时为真(空串)
# 包含特定字符：
if [ -n $result ] # 当串的长度大于0时为真(串非空)

if [ str1 = str2 ]　　　　　 # 当两个串有相同内容、长度时为真 
if [ str1 != str2 ]　　　　　# 当串str1和str2不等时为真 
if [ -n str1 ]　　　　　　# 当串的长度大于0时为真(串非空) 
if [ -z str1 ]　　　　　　#　 当串的长度为0时为真(空串) 
if [ str1 ]　　　　　　　 # 当串str1为非空时为真
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

### 更改默认SHELL的方法
```
sudo chsh -s /bin/zsh
```
这样改是无效的。因为：
```
# Changing shell for root.
# chsh: Shell not changed.
```
正确的做法是：
```
chsh -s /bin/zsh
```
详细步骤
```
# 1 查看所有的shell
chsh -l
# 2 找到正确的shell名称，例如/bin/zsh
# 3 运行chsh -s /bin/zsh
# 该命令其实更改的是登录shell，通过修改/etc/passwd实现。
# 运行
cat /etc/passwd | grep USERNAME
# 可以看到用户的默认登录shell


iptables -t nat -A PREROUTING -p tcp -i gate --dport 18787 -j DNAT --to 10.6.8.2:8787
