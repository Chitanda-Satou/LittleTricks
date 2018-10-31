# Linux系统负载监控

## 1 软件

参考资料：
https://blog.csdn.net/u010419967/article/details/30748355?utm_source=blogxgwz0


https://github.com/sysstat/sysstat

```
# CentOS
sudo yum install -y sysstat

sudo systemctl enable sysstat
sudo systemctl start sysstat
ls /var/log/sa
# 日志储存在/var/log/sa/
# 后面的数字代表日期

# 使用sadf查看某天日志
sadf  -d /var/log/sa/sa25
```
批量执行的脚本
```
mkdir /thinker/storage/udata/bing/system_load/
ssh gm66-7
ssh gm66-6
ssh gm66-5
ssh gm66-4
ssh gm66-3
ssh gm66-2
ssh gm66-1
for i in /var/log/sa/sa*; do
    sadf -d $i >> /thinker/storage/udata/bing/system_load/20181030.txt
done

