# 🚀 Kimi Setup & Configurations Guide (Optimized & Supercharged)

This repository contains optimized setup instructions, script snippets, and configurations for running Kimi (including **kimi-code**, **kimi-cli**, and **Kimi Desktop**) across **Windows**, **Big Linux (Manjaro/Arch-based)**, and **Termux**.

It has been enhanced with **Supercharged MCP servers** (GitHub integration, browser automation with Puppeteer, DB clients like PostgreSQL & SQLite) and **native Desktop client packaging instructions**.

---

## 💻 1. Windows Setup

### Kimi Code & CLI Prerequisites
1. Install **Git**: [git-scm.com](https://git-scm.com/)
2. Install **Node.js (LTS)**: [nodejs.org](https://nodejs.org/)
3. Install **Python 3.11+**: Ensure you tick "Add Python to PATH" during installation.
4. Install **uv** (Python Package Manager):
   ```powershell
   powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
   ```
5. Install **pnpm**:
   ```powershell
   npm install -g pnpm
   ```

### CLI Installation
Clone the repositories and install dependencies:
```powershell
# Setup Kimi Code (TypeScript version)
git clone https://github.com/MoonshotAI/kimi-code.git
cd kimi-code
pnpm install
pnpm build
# Run CLI
pnpm dev:cli

# Setup Kimi CLI (Python version)
cd ..
git clone https://github.com/MoonshotAI/kimi-cli.git
cd kimi-cli
uv sync --no-dev
# Run CLI
uv run --no-dev --package kimi-cli kimi
```

### 🖥️ Kimi Desktop App (Windows)
Create a native lightweight Windows client using Rust & Tauri wrapper tool **Pake**:
```powershell
# Install Pake globally
npm install -g pake-cli

# Compile Kimi web into a native Windows executable (.exe)
pake https://kimi.moonshot.cn --name "Kimi" --icon "assets/icon.png" --width 1200 --height 800
```

---

## 🐧 2. Big Linux Setup (Manjaro / Arch / Debian / BigLinux)

### Prerequisites
Install basic tools, Python, Node.js, and package managers:
```bash
# Arch / Big Linux (Pacman)
sudo pacman -Syy git nodejs npm python python-pip
# Debian / Ubuntu (APT)
sudo apt update && sudo apt install -y git nodejs npm python3 python3-pip python3-venv

# Install uv (Universal Python package manager)
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/env

# Install pnpm
sudo npm install -g pnpm
```

### CLI Installation
```bash
# Setup Kimi Code
git clone https://github.com/MoonshotAI/kimi-code.git
cd kimi-code
pnpm install && pnpm build
# Run CLI
pnpm dev:cli

# Setup Kimi CLI
cd ..
git clone https://github.com/MoonshotAI/kimi-cli.git
cd kimi-cli
uv sync --no-dev
# Run CLI
uv run --no-dev --package kimi-cli kimi
```

### 🖥️ Kimi Desktop App (Linux)
You can compile Kimi into a native `.deb` package or AppImage:
```bash
# Install Pake globally
sudo npm install -g pake-cli

# Compile Kimi Web to AppImage/Debian app
pake https://kimi.moonshot.cn --name "kimi-desktop" --width 1200 --height 800
```
Or use the pre-packaged community client:
```bash
git clone https://github.com/johnohhh1/kimi-app.git
cd kimi-app
npm install && npm run tauri build
```

---

## 📱 3. Termux (Android Snapdragon / ARM64) Setup

### Prerequisites
Run the following inside Termux to install Snapdragon arm64 compatible toolchains:
```bash
pkg update && pkg upgrade -y
pkg install -y git nodejs python python-pip clang make build-essential binutils

# Install uv & pnpm
curl -LsSf https://astral.sh/uv/install.sh | sh
npm install -g pnpm
```

### CLI Installation
```bash
# Setup Kimi Code
git clone https://github.com/MoonshotAI/kimi-code.git && cd kimi-code
pnpm install && pnpm build
# Run CLI
pnpm dev:cli

# Setup Kimi CLI
cd ..
git clone https://github.com/MoonshotAI/kimi-cli.git && cd kimi-cli
uv sync --no-dev
# Run CLI
uv run --no-dev --package kimi-cli kimi
```

---

## 🛠️ Supercharged MCP Configuration (`mcp-supercharged.json`)
You can use `mcp-supercharged.json` for advanced workflows. 

### Highlighted Additions:
1. **GitHub MCP**: Let Kimi read issues, create repositories, and commit directly to GitHub (requires `GITHUB_PERSONAL_ACCESS_TOKEN`).
2. **Puppeteer MCP**: Browser automation so Kimi can browse dynamic JavaScript-heavy websites.
3. **SQLite & Postgres MCPs**: Run direct database commands and browse schemas.

Copy the configurations to:
- **Kimi Code**: `~/.kimi-code/mcp.json` (or `%USERPROFILE%\.kimi-code\mcp.json`)
- **Kimi CLI**: `~/.kimi/mcp.json` (or `%USERPROFILE%\.kimi\mcp.json`)

---

## 🚀 MASSIVE EXPANSION: Agents, Plugins, Skills, & Workflows

In the latest update, we have done a "Deep Web Search" expansion to provide an incredible suite of capabilities:

### 🤖 New Agents
- **Kimi-SEO-Expert**: Advanced agentic SEO analysis (`agents/kimi-seo-expert.json`)
- **Kimi-Auto-Coder**: Autonomous software engineer for zero-to-deployment web apps (`agents/kimi-auto-coder.json`)
- **Kimi-Wechat-Bot**: WeChat integration
- **Kimi-Deep-Research**: Long-running research analyst

### 🔌 New Plugins
- **Kimi-Discord-Bridge**: Direct Discord bot integration via MCP (`plugins/kimi-discord-bridge.json`)
- **Kimi-GitHub-Action**: Run Kimi Code automatically in CI/CD (`plugins/kimi-github-action.json`)
- **Kimi-API-Rotator**: API token load balancing

### 🧠 New Skills
- **SKILL-vision**: Teach Kimi how to parse visual UI/Architecture and emit Mermaid JS diagrams (`skills/SKILL-vision.md`)

### 🔄 New Workflows
- **Automated PR Review**: Kimi Auto-Coder triggers on GitHub Webhooks to review PRs (`workflows/ci-cd-review.yaml`)

---

## 🏢 OFFICIAL KIMI PRODUCTS INTEGRATIONS
Based on the official [Kimi Products](https://www.kimi.com/products/) offerings, the following enterprise-grade setups have been added:

### 🌟 Enterprise & Multimodal Agents
- **Kimi-Enterprise-Agent**: Configured for Kimi Enterprise/Workplace with strict Data Loss Prevention (DLP), SSO authentication, and Private Model Hosting compatibility. (`agents/kimi-enterprise-agent.json`)
- **Kimi-K2.5-Multimodal**: Advanced agent leveraging the massive Kimi-K2.5 model for vision, document parsing, and advanced reasoning. (`agents/kimi-k2.5-vision.json`)

### 🔗 Official SDK & Platform Plugins
- **Kimi-Agent-SDK-Bridge**: A bridge plugin connecting the official Moonshot Kimi Agent SDK directly to your local development environment via MCP. (`plugins/kimi-agent-sdk-bridge.json`)
- **Kimi Open Platform API Sync**: An automated workflow that syncs your local setups with the official Moonshot API (`https://api.moonshot.cn`), tracking usage stats and alerting on low token balances. (`workflows/kimi-open-platform-sync.yaml`)
