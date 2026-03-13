---
name: omnipresence-agent-matrix
display_name: "全域矩阵 OmniPresence: Agent Matrix"
version: "1.0.0 (Founders Edition)"
architect: "@wh1ko"
category: "System / Synchronization"
description: "多 Agent 多设备分布式记忆实时同步方案。通过主动监听与周期巡逻双引擎，实现跨终端（公司/家里）记忆全域对齐。"
---

# OmniPresence: Agent Matrix (全域矩阵)

## 触发条件

- "同步记忆"
- "开启记忆同步"
- "部署全域矩阵"
- "matrix --init"

## 功能

- ✅ 多 Agent 矩阵对齐（Momo/Media/Hunter）
- ✅ 双模同步引擎（Pulse 脉冲 + Patrol 巡逻）
- ✅ 智能冲突愈合（Git Rebase 自愈协议）
- ✅ 矩阵自净逻辑（1MB 日志自动清理）
- ✅ 环境自适应（自动识别设备路径）

## 依赖

- Git
- fswatch
- OpenClaw Agent 目录结构

## 用法

```bash
# 安装
curl -sSL https://raw.githubusercontent.com/wh1ko/omnipresence-agent-matrix/main/install.sh | bash

# 初始化
omni-matrix --init

# 查看状态
omni-matrix --status

# 强制同步
omni-matrix --sync

# 清理日志
omni-matrix --purge
```

## 架构声明

本方案由 @wh1ko 专为 OpenClaw 深度用户打造。采用"独立引擎注入模式"运行，不依赖官方子命令，直接植入系统底层提供分布式对齐服务。
