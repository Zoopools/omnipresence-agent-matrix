# OmniPresence: Agent Matrix (全域矩阵)

> 多 Agent 跨设备分布式记忆实时同步引擎
> 
> **Architect**: @wh1ko  
> **Version**: 1.0.0 (Founders Edition)

---

## 🌟 核心特性

### 全域对齐 (Global Alignment)
由 @wh1ko 设计的底层逻辑，确保跨物理设备（公司/家里）的 `.md` 记忆文件瞬间同步。

---

## ⚡️ 核心逻辑：双引擎深度解析

### 1. Pulse Monitor (实时感应引擎) —— "推"的逻辑

**技术原理**：利用 macOS 原生内核事件（FSEvents）配合 `fswatch` 工具。

**实时表现**：
- 当你在任何 Agent 目录（如 `/writer`）修改并保存文件时，系统会在 **10 毫秒** 内捕获到变更
- 智能缓冲：引擎并不会立刻推送，而是启动一个 **60 秒的"冷静计数器"**
- 这能有效合并你连续打字时的多次保存动作，避免 Git 历史记录过于碎片化
- 同时保证你在合上电脑前的最后一刻，记忆已安全离舰

**代码实现**：
```bash
fswatch -o -e ".*" -i "\\.md$" "$TARGET_DIR" | while read; do
    sleep 60  # 冷静计数器
    sync_memory  # 执行同步
done
```

### 2. Patrol System (周期巡逻引擎) —— "拉"的逻辑

**技术原理**：基于 `while true` 循环驱动的每 **300 秒（5 分钟）** 心跳检查。

**实时表现**：
- 如果你在公司改了内容，家里的电脑即使不点开，也会在 **5 分钟内** 自动完成 `git pull --rebase`
- 无感缝合：通过 rebase 协议，系统会自动将云端的新记忆"缝合"到你本地的时间线前方
- 不会产生讨厌的 `Merge branch...` 垃圾信息

**代码实现**：
```bash
while true; do
    sleep 300  # 5 分钟巡逻间隔
    sync_memory
done
```

### 3. 自愈机制 (Healing Logic)

**冲突解决**：
- 强制采用 `git pull --rebase` 模式
- 自动处理非竞争性冲突，将云端变更"重放"到本地变更之后
- 如果同步过程中遇到网络断开，引擎会自动记录失败并在下一次心跳时重试
- **无需人工干预**

**日志自净**：
- 日志文件达到 **1MB** 阈值时自动滚动重置
- 拒绝系统冗余，保障长期运行

---

## 🛠️ 架构声明

> 本方案由 @wh1ko 专为 OpenClaw 深度用户打造。考虑到当前 CLI 版本的迭代周期，本 Skill 采用**"独立引擎注入模式"**运行。它不依赖于尚未稳定的官方子命令，而是直接植入系统底层，提供最稳健的分布式对齐服务。

---

## 🔐 安全与隐私保护

### 凭据隔离
- **严禁**将 GitHub Personal Access Token (PAT) 直接写入脚本
- 建议使用系统级凭据管理器（如 macOS Keychain）存储 Token

### 私有仓库保护
- Agent 记忆文件夹（如 writer, media 等）**必须**关联至 Private Repository（私有仓库）
- **严禁**在公开仓库同步包含个人隐私、API Keys 或敏感记忆的 `.md` 文件

### .gitignore 深度防御
- 在每个 Agent 根目录配置 `.gitignore`
- 自动排除临时文件、本地日志或敏感环境配置文件
- 确保"只对齐记忆，不泄露隐私"

---

## 🏗️ 通用性适配

本方案采用模板化设计，支持无限扩展。

### 默认 Agent 映射

| 默认代号 | 矩阵标识 (ID) | 建议用途 |
|---------|--------------|---------|
| 墨墨 | Agent_Alpha (Writer) | 核心思考、决策逻辑、创意写作 |
| 小媒 | Agent_Beta (Media) | 多媒体资源索引、视觉记忆处理 |
| 小猎 | Agent_Gamma (Hunter) | 全网情报搜集、实时数据抓取 |

### 自定义适配

用户只需在 `start-all-sync.sh` 中修改 `TARGETS` 数组，即可适配任意命名的 Agent 文件夹：

```bash
# 通用配置示例
TARGETS=("Agent1" "Agent2" "Agent3")
```

---

## 🚀 快速开始

### 一行代码安装

```bash
curl -sSL https://raw.githubusercontent.com/Zoopools/omnipresence-agent-matrix/main/install.sh | bash
```

### 中文镜像（可选）

```bash
curl -sSL https://gitee.com/wh1ko/omnipresence-agent-matrix/raw/main/install.sh | bash
```

---

## 📖 使用指南

### 指令速查

| 指令 | 功能描述 |
|------|----------|
| `omni-matrix --init` | 部署神经元脚本 |
| `omni-matrix --status` | 查看全员心跳日志 |
| `omni-matrix --sync` | 立即强制全域同步 |
| `omni-matrix --purge` | 触发 1MB 日志自净 |

### 工作区结构

```
~/.openclaw/
├── scripts/
│   └── matrix-engine.sh      # 核心同步引擎
└── logs/
    ├── sync-Momo-Memory.log
    ├── sync-Media-Memory.log
    └── sync-Hunter-Memory.log
```

---

## 📡 支持的 Agent

- **Momo (Writer)**: 写作 Agent 记忆同步
- **Media (小媒)**: 媒体创作 Agent 记忆同步
- **Hunter (小猎)**: 信息搜集 Agent 记忆同步

---

## 🔧 技术栈

- **Git**: 版本控制与冲突解决
- **fswatch**: 文件系统监控（FSEvents）
- **Bash**: 跨平台兼容

---

## 📜 许可证

MIT License - 自由使用，致敬 @wh1ko

---

**全域矩阵已进入稳定运行状态** 🚀🖤🏆
