#!/bin/bash
# OmniPresence: Agent Matrix - Status Command
# Architect: @wh1ko

echo "📡 全域矩阵状态巡检"
echo "===================="
echo ""

echo "🛠️ 同步进程:"
ps aux | grep "matrix-engine.sh" | grep -v grep || echo "  无运行中进程"

echo ""
echo "📝 最新心跳:"
for log in ~/.openclaw/logs/sync-*.log; do
    if [ -f "$log" ]; then
        name=$(basename "$log" .log)
        echo "  $name:"
        tail -n 1 "$log" 2>/dev/null | sed 's/^/    /'
    fi
done

echo ""
echo "✅ 巡检完成"
