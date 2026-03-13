# OmniPresence: Agent Matrix (全域矩阵)

> 多 Agent 跨设备分布式记忆实时同步引擎
> 
> **Architect**: @wh1ko  
> **Version**: 1.0.0 (Founders Edition)

---

## 🌟 核心特性

### 全域对齐 (Global Alignment)
由 @wh1ko 设计的底层逻辑，确保跨物理设备（公司/家里）的 `.md` 记忆文件瞬间同步。

### 双模引擎 (Dual-Engine)
- **Pulse (脉冲)**: 基于 fswatch 的毫秒级变更捕获，60s 内自动推送
- **Patrol (巡逻)**: 300s 周期性主动拉取，确保开盖即最新

### 自愈协议 (Healing Protocol)
强制采用 Git Rebase 模式，解决多端并发写入产生的逻辑冲突。

### 矩阵自净 (Self-Purge)
日志文件达到 1MB 阈值时自动滚动重置，拒绝系统冗余。

---

## 🚀 快速开始

### 一行代码安装

```bash
curl -sSL https://raw.githubusercontent.com/wh1ko/omnipresence-agent-matrix/main/install.sh | bash
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

## 🛠️ 架构声明

> 本方案由 @wh1ko 专为 OpenClaw 深度用户打造。考虑到当前 CLI 版本的迭代周期，本 Skill 采用**"独立引擎注入模式"**运行。它不依赖于尚未稳定的官方子命令，而是直接植入系统底层，提供最稳健的分布式对齐服务。

---

## 📡 支持的 Agent

- **Momo (Writer)**: 写作 Agent 记忆同步
- **Media (小媒)**: 媒体创作 Agent 记忆同步
- **Hunter (小猎)**: 信息搜集 Agent 记忆同步

---

## 🔧 技术栈

- **Git**: 版本控制与冲突解决
- **fswatch**: 文件系统监控
- **Bash**: 跨平台兼容

---

## 📜 许可证

MIT License - 自由使用，致敬 @wh1ko

---

**全域矩阵已进入稳定运行状态** 🚀🖤🏆
