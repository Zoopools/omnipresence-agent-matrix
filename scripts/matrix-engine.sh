#!/bin/bash
# OmniPresence: Agent Matrix - Core Engine
# Architect: @wh1ko
# Version: 1.0.0 (Founders Edition)

CURRENT_USER=$(whoami)
TARGET_DIR="$1"
REPO_NAME="$2"
LOG_FILE="/Users/$CURRENT_USER/.openclaw/logs/sync-$REPO_NAME.log"
FSWATCH_PATH=$(which fswatch)
MAX_LOG_SIZE=1048576 # 1MB 自动清理阈值

cd "$TARGET_DIR" || exit 1

# --- 1. 日志自动管理逻辑 (Self-Purge) ---
check_log_size() {
    if [ -f "$LOG_FILE" ]; then
        SIZE=$(stat -f%z "$LOG_FILE" 2>/dev/null || stat -c%s "$LOG_FILE" 2>/dev/null)
        if [ "$SIZE" -gt "$MAX_LOG_SIZE" ]; then
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] 🧹 矩阵自净：日志超过 1MB，执行重置" > "$LOG_FILE"
        fi
    fi
}

# --- 2. 核心同步对齐逻辑 (Healing Protocol) ---
sync_memory() {
    check_log_size
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] 📡 发起全域对齐..." >> "$LOG_FILE"
    
    # 仅针对 MD 文件进行原子化操作
    git add *.md >> "$LOG_FILE" 2>&1
    if ! git diff-index --quiet HEAD --; then
        git commit -m "Auto-Sync: $(date '+%Y-%m-%d %H:%M:%S') from $HOSTNAME" >> "$LOG_FILE" 2>&1
    fi
    
    # 自愈协议：Rebase 模式拉取 + 推送
    git pull --rebase origin main >> "$LOG_FILE" 2>&1
    git push origin main >> "$LOG_FILE" 2>&1
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ✅ 全域对齐完成" >> "$LOG_FILE"
}

echo "[$(date '+%Y-%m-%d %H:%M:%S')] 🚀 矩阵神经元启动: $REPO_NAME" >> "$LOG_FILE"

# 步骤 A：启动即执行一次对齐
sync_memory

# 步骤 B：Pulse (脉冲) - 被动触发监听本地保存
$FSWATCH_PATH -o -e ".*" -i "\\.md$" "$TARGET_DIR" | while read; do
    if git status --short | grep -qE "\.md$"; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] 🔍 Pulse 捕获变更，60s 后同步" >> "$LOG_FILE"
        sleep 60
        sync_memory
    fi
done &

# 步骤 C：Patrol (巡逻) - 每 5 分钟保底同步一次
while true; do
    sleep 300
    sync_memory
done
