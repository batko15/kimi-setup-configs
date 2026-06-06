# 🚀 Kimi Setup & Configurations Guide

This repository contains setup instructions, script snippets, and configurations for running Kimi (including **kimi-code** and **kimi-cli**) across **Windows**, **Big Linux (Manjaro/Arch-based)**, and **Termux**.

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

### Installation
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

### Configuration Paths
- **Kimi Code**: `%USERPROFILE%\.kimi-code\config.toml` & `%USERPROFILE%\.kimi-code\mcp.json`
- **Kimi CLI**: `%USERPROFILE%\.kimi\config.toml` & `%USERPROFILE%\.kimi\mcp.json`

---

## 🐧 2. Big Linux Setup (Manjaro / Arch / Debian)

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
pnpm install
pnpm build
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

### Configuration Paths
- **Kimi Code**: `~/.kimi-code/config.toml` & `~/.kimi-code/mcp.json`
- **Kimi CLI**: `~/.kimi/config.toml` & `~/.kimi/mcp.json`

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
Ensure that `pyinstaller` is skipped or compiled dynamically since prebuilt binary bootloaders are not available on Termux arm64:
```bash
# Setup Kimi Code
git clone https://github.com/MoonshotAI/kimi-code.git && cd kimi-code
pnpm install && pnpm build
# Run CLI
pnpm dev:cli

# Setup Kimi CLI (avoiding pyinstaller compiling checks by building only app requirements)
cd ..
git clone https://github.com/MoonshotAI/kimi-cli.git && cd kimi-cli
uv sync --no-dev
# Run CLI
uv run --no-dev --package kimi-cli kimi
```

### Configuration Paths
- **Kimi Code**: `/data/data/com.termux/files/home/.kimi-code/config.toml`
- **Kimi CLI**: `/data/data/com.termux/files/home/.kimi/config.toml`

---

## 🛠️ MCP Configuration Template (`mcp.json`)
Create this file at `~/.kimi/mcp.json` or `%USERPROFILE%\.kimi\mcp.json` (also copy to `.kimi-code/mcp.json`):

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "<replace_with_home_directory_path>"]
    },
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"]
    },
    "sequential-thinking": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"]
    },
    "fetch": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-fetch"]
    },
    "git": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-git", "--repository", "<replace_with_home_directory_path>"]
    },
    "everything": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-everything"]
    },
    "brave-search": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-brave-search"],
      "env": { "BRAVE_API_KEY": "YOUR_BRAVE_API_KEY" }
    }
  }
}
```
