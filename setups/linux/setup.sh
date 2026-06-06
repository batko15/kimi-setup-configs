#!/bin/bash
# Linux Kimi Setup Script
set -e

echo "Starting Kimi setup for Linux..."

# Ensure Node and Python are installed
if ! command -v node &> /dev/null; then echo "Node.js is required"; exit 1; fi
if ! command -v python3 &> /dev/null; then echo "Python 3 is required"; exit 1; fi

# Install uv and pnpm
curl -LsSf https://astral.sh/uv/install.sh | sh
npm install -g pnpm

export PATH="$HOME/.cargo/bin:$PATH"

# Setup Kimi CLI
echo "Setting up Kimi CLI..."
uv tool install kimi-cli
mkdir -p ~/.kimi-cli
echo -e '[default]\nmodel = "kimi-k2.5"\n\n[api]\nmoonshot = "YOUR_MOONSHOT_API_KEY"' > ~/.kimi-cli/config.toml

# Setup Kimi Code
echo "Setting up Kimi Code..."
pnpm add -g kimi-code
mkdir -p ~/.kimi-code
echo -e '[default]\nmodel = "kimi-k2.5"\n\n[api]\nmoonshot = "YOUR_MOONSHOT_API_KEY"' > ~/.kimi-code/config.toml

echo "Linux Setup Complete!"
