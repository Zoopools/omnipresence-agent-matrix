#!/bin/bash
# OmniPresence: Agent Matrix - Purge Command
# Architect: @wh1ko

echo "🧹 触发矩阵自净"
echo "================"

LOG_DIR="$HOME/.openclaw/logs"

for log in "$LOG_DIR"/sync-*.log; do
    if [ -f "$log" ]; then
        name=$(basename "$log")
        size=$(stat -f%z "$log" 2>/dev/null || stat -c%s "$log" 2>/dev/null)
        size_mb=$(echo "scale=2; $size / 1048576" | bc)
        
        echo "  $name: ${size_mb}MB"
        
        if [ "$size" -gt 1048576 ]; then
            echo "    🧹 超过 1MB，执行自净..."
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] 🧹 矩阵自净：日志重置" > "$log"
            echo "    ✅ 已重置"
        fi
    fi
done

echo ""
echo "✅ 矩阵自净完成"
