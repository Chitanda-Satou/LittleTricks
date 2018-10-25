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