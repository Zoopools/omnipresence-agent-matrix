#!/bin/bash
# OmniPresence: Agent Matrix - Sync Command
# Architect: @wh1ko

echo "⚡ 发起强制全域同步"
echo "==================="

BASE_DIR="$HOME/Documents/openclaw/agents"

for agent in writer media hunter; do
    dir="$BASE_DIR/$agent"
    if [ -d "$dir/.git" ]; then
        echo "📡 同步 $agent..."
        cd "$dir" || continue
        git add *.md 2>/dev/null
        git diff-index --quiet HEAD -- || git commit -m "Manual-Sync: $(date '+%Y-%m-%d %H:%M:%S')"
        git pull --rebase origin main
        git push origin main
        echo "✅ $agent 同步完成"
    fi
done

echo ""
echo "🎉 全域同步完成"
