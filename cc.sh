#!/bin/bash

# 定义ccs.sh的完整路径
CCS_SCRIPT_PATH="/root/ccs.sh"

# 检查 ccs.sh 是否存在，如果存在则删除
if [ -f "$CCS_SCRIPT_PATH" ]; then
    rm -f "$CCS_SCRIPT_PATH"
fi

# 从GitHub下载最新的 ccs.sh 到 /root 目录
wget -O "$CCS_SCRIPT_PATH" https://raw.githubusercontent.com/visense/onekey/main/ccs.sh

# 使 ccs.sh 可执行
chmod +x "$CCS_SCRIPT_PATH"

# 添加 cron 任务，每天凌晨0:30分运行 ccs.sh
(crontab -l 2>/dev/null; echo "30 0 * * * $CCS_SCRIPT_PATH") | crontab -

echo "$CCS_SCRIPT_PATH 已更新并设置了每天凌晨0:30分的 cron 任务。"
