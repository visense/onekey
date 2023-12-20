#!/bin/bash

# 定义ccd.sh的完整路径
CCD_SCRIPT_PATH="/root/ccd.sh"

# 创建 ccd.sh 并写入清理日志的命令
cat <<EOF >"$CCD_SCRIPT_PATH"
#!/bin/bash
# 删除超过30天的 syslog 和 daemon.log 文件，包括它们的旧版本
find /var/log -type f \( -name "syslog*" -o -name "daemon.log*" \) -exec rm -f {} \;
EOF

# 使 ccd.sh 可执行
chmod +x "$CCD_SCRIPT_PATH"

echo "$CCD_SCRIPT_PATH 已创建并设置为可执行。"


