#!/bin/bash
# OmniPresence: Agent Matrix - One-Line Installer
# Architect: @wh1ko
# Version: 1.0.0 (Founders Edition)

echo "🚀 全域矩阵 OmniPresence: Agent Matrix"
echo "======================================="
echo ""
echo "Architect: @wh1ko"
echo "Version: 1.0.0 (Founders Edition)"
echo ""

# 检查依赖
echo "📦 检查依赖..."
if ! command -v git &> /dev/null; then
    echo "❌ 请先安装 Git"
    exit 1
fi

if ! command -v fswatch &> /dev/null; then
    echo "📥 安装 fswatch..."
    brew install fswatch
fi

# 创建目录
echo "📁 创建矩阵工作区..."
mkdir -p ~/.openclaw/scripts
mkdir -p ~/.openclaw/logs
mkdir -p ~/.openclaw/skills/omnipresence-agent-matrix

# 下载脚本（如果是本地安装则复制）
echo "📥 部署矩阵神经元..."
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ -f "$SCRIPT_DIR/scripts/matrix-engine.sh" ]; then
    # 本地安装
    cp "$SCRIPT_DIR/scripts/"*.sh ~/.openclaw/scripts/
    cp "$SCRIPT_DIR/bin/omni-matrix" ~/.openclaw/scripts/
else
    # 远程安装
    echo "📥 从远程下载..."
    curl -sSL https://raw.githubusercontent.com/wh1ko/omnipresence-agent-matrix/main/scripts/matrix-engine.sh -o ~/.openclaw/scripts/matrix-engine.sh
    curl -sSL https://raw.githubusercontent.com/wh1ko/omnipresence-agent-matrix/main/scripts/matrix-init.sh -o ~/.openclaw/scripts/matrix-init.sh
    curl -sSL https://raw.githubusercontent.com/wh1ko/omnipresence-agent-matrix/main/scripts/matrix-status.sh -o ~/.openclaw/scripts/matrix-status.sh
    curl -sSL https://raw.githubusercontent.com/wh1ko/omnipresence-agent-matrix/main/scripts/matrix-sync.sh -o ~/.openclaw/scripts/matrix-sync.sh
    curl -sSL https://raw.githubusercontent.com/wh1ko/omnipresence-agent-matrix/main/scripts/matrix-purge.sh -o ~/.openclaw/scripts/matrix-purge.sh
    curl -sSL https://raw.githubusercontent.com/wh1ko/omnipresence-agent-matrix/main/bin/omni-matrix -o ~/.openclaw/scripts/omni-matrix
fi

# 赋予权限
chmod +x ~/.openclaw/scripts/*.sh
chmod +x ~/.openclaw/scripts/omni-matrix

# 添加到 PATH
if ! grep -q ".openclaw/scripts" ~/.zshrc 2>/dev/null; then
    echo 'export PATH="$HOME/.openclaw/scripts:$PATH"' >> ~/.zshrc
    echo "📌 已添加到 PATH (请重启终端或 source ~/.zshrc)"
fi

# 配置 Git
git config --global pull.rebase true

echo ""
echo "✅ 全域矩阵部署完成！"
echo ""
echo "使用方法:"
echo "  omni-matrix --init    部署神经元"
echo "  omni-matrix --status  查看心跳"
echo "  omni-matrix --sync    强制同步"
echo "  omni-matrix --purge   清理日志"
echo ""
echo "🚀 全域矩阵已进入稳定运行状态 🖤"
