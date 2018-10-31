# GNU parallel的使用

### 1 CentOS安装
CentOS包管理的parallel版本太老了，手动安装最新版：

```
git clone https://git.savannah.gnu.org/git/parallel.git
cd parallel
# 依赖问题1
autoreconf -f -i
# 依赖问题2
perl -MCPAN -e shell
# 以下cpan
i /pod2pdf/
install App::pod2pdf
h
q
# 以下shell

./configure && make && sudo make install

```