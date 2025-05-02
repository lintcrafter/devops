# DevOps

![GitHub](https://img.shields.io/github/license/lintcrafter/devops?color=282661)
[![](https://img.shields.io/badge/Blog-@lintcrafter-C90C4B.svg)](https://lintcrafter.github.io)
[![](https://img.shields.io/badge/Github-@lintcrafter-1F2328.svg)](https://github.com/lintcrafter)

**DevOps** 是一个用于快速搭建开发环境的 Docker Compose 项目。
旨在为开发者提供一致、可重复的开发环境，简化本地开发和测试流程。

## 前置条件

确保已安装：

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## 快速开始

### 1. 配置环境变量

项目提供了一个示例环境变量文件 `.env.example`。

1. 在项目根目录下复制 `.env.example` 为 `.env`：
   ```bash
   cp .env.example .env
   ```
2. 根据需要修改 `.env` 文件中的配置项。

### 2. 常用 Docker Compose 命令

| 功能             | 命令                                        |
|----------------|-------------------------------------------|
| **启动服务（后台运行）** | `docker compose up -d`                    |
| **停止服务（保留容器）** | `docker compose stop`                     |
| **停止并移除服务**    | `docker compose down`                     |
| **移除服务并清理数据卷** | `docker compose down -v`                  |
| **查看服务状态**     | `docker compose ps`                       |
| **查看所有服务状态**   | `docker compose ps -a`                    |
| **查看服务日志**     | `docker compose logs`                     |
| **实时跟踪日志**     | `docker compose logs -f`                  |
| **在容器中执行命令**   | `docker compose exec <service> <command>` |
| **重启服务**       | `docker compose restart`                  |
| **检查配置文件语法**   | `docker compose config`                   |
| **移除停止的容器**    | `docker compose rm`                       |
| **使用特定环境文件**   | `docker compose --env-file <file> up -d`  |

> **警告**：使用 `docker compose down -v` 会删除所有数据卷，请提前备份数据。
