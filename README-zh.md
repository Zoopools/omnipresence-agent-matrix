# 全域矩阵 OmniPresence: Agent Matrix

> 多 Agent 跨设备分布式记忆实时同步引擎
> 
> **架构师**: @wh1ko  
> **版本**: 1.0.0 (创始版)

---

## 🌟 核心特性

### 全域对齐 (Global Alignment)
由 @wh1ko 设计的底层逻辑，确保跨物理设备（公司/家里）的 `.md` 记忆文件瞬间同步。

### 双模引擎 (Dual-Engine)
- **脉冲 (Pulse)**: 基于 fswatch 的毫秒级变更捕获，60秒内自动推送
- **巡逻 (Patrol)**: 300秒周期性主动拉取，确保开盖即最新

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

---

## 📖 使用指南

### 指令速查

| 指令 | 功能描述 |
|------|----------|
| `omni-matrix --init` | 部署神经元脚本 |
| `omni-matrix --status` | 查看全员心跳日志 |
| `omni-matrix --sync` | 立即强制全域同步 |
| `omni-matrix --purge` | 触发 1MB 日志自净 |

---

## 🛠️ 架构声明

> 本方案由 @wh1ko 专为 OpenClaw 深度用户打造。考虑到当前 CLI 版本的迭代周期，本 Skill 采用**"独立引擎注入模式"**运行。它不依赖于尚未稳定的官方子命令，而是直接植入系统底层，提供最稳健的分布式对齐服务。

---

**全域矩阵已进入稳定运行状态** 🚀🖤🏆
