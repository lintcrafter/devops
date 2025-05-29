# DevOps

[![License](https://img.shields.io/github/license/lintcrafter/devops?color=282661)](https://github.com/lintcrafter/devops/blob/main/LICENSE)
[![LintCrafter's Blog](https://img.shields.io/badge/Blog-@LintCrafter-C90C4B.svg)](https://lintcrafter.github.io)
[![LintCrafter](https://img.shields.io/badge/Github-@LintCrafter-1F2328.svg)](https://github.com/lintcrafter)

**DevOps** 是一个用于快速搭建开发环境的 Docker Compose 项目。
旨在为开发者提供一致、可重复的开发环境，简化本地开发和测试流程。

**注意：在 Windows 下使用 Docker Desktop 时，如果需要将配置文件从宿主机映射到容器内部，最好将宿主机的文件设置为只读。
原因见[「`MySql` 配置文件不生效问题」](#mysql-配置文件不生效问题)。**

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
3. 启动所有服务（后台运行）：
   ```bash
   docker compose --profile all up -d
   ```

### 2. 常用 Docker Compose 命令

| 功能                                            | 命令                                                                   |
|-----------------------------------------------|----------------------------------------------------------------------|
| **启动服务（后台运行）**                                | `docker compose up -d`                                               |
| **停止服务（保留容器）**                                | `docker compose stop`                                                |
| **停止并移除服务**                                   | `docker compose down`                                                |
| **移除服务并清理数据卷**                                | `docker compose down -v`                                             |
| **查看服务状态**                                    | `docker compose ps`                                                  |
| **查看所有服务状态**                                  | `docker compose ps -a`                                               |
| **查看服务日志**                                    | `docker compose logs`                                                |
| **实时跟踪日志**                                    | `docker compose logs -f`                                             |
| **在容器中执行命令**                                  | `docker compose exec <service> <command>`                            |
| **重启服务**                                      | `docker compose restart`                                             |
| **检查配置文件语法**                                  | `docker compose config`                                              |
| **移除停止的容器**                                   | `docker compose rm`                                                  |
| **使用特定环境文件**                                  | `docker compose --env-file <file> up -d`                             |
| **执行命令时，包含标记了 profile_name 的服务**              | `docker compose --profile <profile_name> <command>`                  |
| **执行命令时，包含标记了 profile1 或 profile2 的服务（并集关系）** | `docker compose --profile <profile1> --profile <profile2> <command>` |

> **警告**：使用 `docker compose down -v` 会删除所有数据卷，请提前备份数据。

## 常见问题

### MySQL 配置文件不生效问题

**问题**：在 Windows 的 Docker Desktop 中，MySQL 配置文件映射到容器内时可能不生效。

**解决步骤**：

1. 查看容器日志：
   ```bash
   docker logs mysql-container
   ```
2. 若日志显示类似以下警告，说明 Windows 宿主机文件权限在映射时发生错误（原因未知）：
   ```
   mysqld: [Warning] World-writable config file '/etc/mysql/conf.d/my.cnf' is ignored.
   ```
3. 解决方案是将配置文件设置为只读：
   ```bash
   chmod 0444 mysql/my.cnf
   ```
4. 重新启动服务：
   ```bash
   docker compose up -d
   ```
