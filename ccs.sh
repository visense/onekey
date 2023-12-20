#!/bin/bash

# 创建 script.sh 并写入清理日志的命令
cat <<EOF >/root/ccd.sh
#!/bin/bash
# 删除超过30天的 syslog 和 daemon.log 文件，包括它们的旧版本
find /var/log -type f \( -name "syslog*" -o -name "daemon.log*" \) -mtime +30 -exec rm -f {} \;
EOF

