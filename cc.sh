#!/bin/bash

# 检查 /root 下是否存在 cc.sh，如果存在则删除
if [ -f "/root/ccs.sh" ]; then
    rm -f /root/ccs.sh
fi

# 从GitHub下载最新的 cc.sh 到 /root 目录
wget -O /root/ccs.sh https://raw.githubusercontent.com/visense/onekey/main/ccs.sh

# 使 /root/cc.sh 可执行
chmod +x /root/ccs.sh

# 添加 cron 任务，每天凌晨0:30分运行 /root/cc.sh
(crontab -l 2>/dev/null; echo "30 0 * * * /root/ccs.sh") | crontab -

echo "/root/ccs.sh 已更新并设置了每天凌晨0:30分的 cron 任务。"
