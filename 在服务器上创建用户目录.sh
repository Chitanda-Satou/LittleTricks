# 1. 需要切换到su

# 2. 创建用户

AddClusterUser -u 用户名 -p 密码

# 2. 创建账户

function create_folder () {
    user_name=$1
    mkdir -p /data1/${user_name}
    mkdir -p /data/${user_name}
    mkdir -p /thinker/storage/udata/${user_name}
    chown ${user_name}:${user_name} /data1/${user_name}
    chown ${user_name}:${user_name} /data/${user_name}
    chown ${user_name}:${user_name} /thinker/storage/udata/${user_name}
}
