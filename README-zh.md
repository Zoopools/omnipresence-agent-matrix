# 全域矩阵 OmniPresence: Agent Matrix

> 多 Agent 跨设备分布式记忆实时同步引擎
> 
> **架构师**: @wh1ko  
> **版本**: 1.0.0 (创始版)

---

## 🌟 核心特性

### 全域对齐 (Global Alignment)
由 @wh1ko 设计的底层逻辑，确保跨物理设备（公司/家里）的 `.md` 记忆文件瞬间同步。

---

## ⚡️ 核心逻辑：双引擎深度解析

### 1. Pulse Monitor (实时感应引擎) —— "推"的逻辑

**技术原理**：利用 macOS 原生内核事件（FSEvents）配合 `fswatch` 工具。

**实时表现**：
- 当你在任何 Agent 目录修改并保存文件时，系统会在 **10 毫秒** 内捕获到变更
- 智能缓冲：引擎并不会立刻推送，而是启动一个 **60 秒的"冷静计数器"**
- 这能有效合并你连续打字时的多次保存动作，避免 Git 历史记录过于碎片化
- 同时保证你在合上电脑前的最后一刻，记忆已安全离舰

### 2. Patrol System (周期巡逻引擎) —— "拉"的逻辑

**技术原理**：基于 `while true` 循环驱动的每 **300 秒（5 分钟）** 心跳检查。

**实时表现**：
- 如果你在公司改了内容，家里的电脑即使不点开，也会在 **5 分钟内** 自动完成同步
- 无感缝合：通过 rebase 协议，系统会自动将云端的新记忆"缝合"到你本地的时间线前方
- 不会产生讨厌的 `Merge branch...` 垃圾信息

### 3. 自愈机制 (Healing Logic)

- 强制采用 `git pull --rebase` 模式
- 自动处理非竞争性冲突
- 如果同步过程中遇到网络断开，引擎会自动记录失败并在下一次心跳时重试
- **无需人工干预**

---

## 🔐 安全与隐私保护

- **凭据隔离**：严禁将 GitHub Token 直接写入脚本
- **私有仓库保护**：Agent 记忆必须关联至 Private Repository
- **.gitignore 深度防御**：自动排除临时文件和敏感配置

---

## 🚀 快速开始

### 一行代码安装

```bash
curl -sSL https://raw.githubusercontent.com/Zoopools/omnipresence-agent-matrix/main/install.sh | bash
```

---

## 📖 使用指南

| 指令 | 功能描述 |
|------|----------|
| `omni-matrix --init` | 部署神经元脚本 |
| `omni-matrix --status` | 查看全员心跳日志 |
| `omni-matrix --sync` | 立即强制全域同步 |
| `omni-matrix --purge` | 触发 1MB 日志自净 |

---

**全域矩阵已进入稳定运行状态** 🚀🖤🏆
