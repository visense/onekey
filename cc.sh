#!/bin/bash

# 创建 script.sh 并写入清理日志的命令
cat <<EOF >/root/script.sh
#!/bin/bash
find /var/log -name "*.log" -type f -mtime +30 -exec rm -f {} \;
EOF

# 使 script.sh 可执行
chmod +x /root/script.sh

# 添加 cron 任务，每周运行一次 script.sh
(crontab -l 2>/dev/null; echo "0 2 * * 0 /root/script.sh") | crontab -

echo "script.sh 创建成功并设置了 cron 任务。"