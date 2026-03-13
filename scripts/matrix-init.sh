#!/bin/bash
# OmniPresence: Agent Matrix - Init Command
# Architect: @wh1ko

echo "🚀 全域矩阵初始化"
echo "=================="

# 检查依赖
if ! command -v fswatch &> /dev/null; then
    echo "📦 安装 fswatch..."
    brew install fswatch
fi

# 创建目录
mkdir -p ~/.openclaw/logs

# 配置 Git
git config --global pull.rebase true

echo "✅ 矩阵神经元部署完成"
echo ""
echo "使用 'omni-matrix --status' 查看状态"
