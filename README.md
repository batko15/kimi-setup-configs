# 🚀 Kimi Setup & Configurations Guide (Optimized & Supercharged)

This repository contains optimized setup instructions, script snippets, and configurations for running Kimi (including **kimi-code** and **kimi-cli**) across **Windows**, **Big Linux (Manjaro/Arch-based)**, and **Termux**.

It has been enhanced with **Supercharged MCP servers** (GitHub integration, browser automation with Puppeteer, DB clients like PostgreSQL & SQLite) and workflow tips.

---

## 💻 1. Windows Setup

### Prerequisites
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

### Installation & Launch Scripts
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

### Installation
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

---

## 📱 3. Termux (Android) Setup

### Prerequisites
Run the following inside Termux to install toolchains:
```bash
pkg update && pkg upgrade -y
pkg install -y git nodejs python python-pip clang make build-essential binutils

# Install uv & pnpm
curl -LsSf https://astral.sh/uv/install.sh | sh
npm install -g pnpm
```

### Installation
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
