#!/bin/bash
# Termux ARM64 (Snapdragon) Kimi Setup Script
set -e

echo "Starting Kimi setup for Termux ARM64..."

# Install dependencies
pkg update -y
pkg install -y python nodejs git rust binutils make clang
npm install -g pnpm uv

# Setup Kimi CLI
echo "Setting up Kimi CLI via uv..."
uv tool install kimi-cli
mkdir -p ~/.kimi-cli
cat << 'EOF' > ~/.kimi-cli/config.toml
[default]
model = "kimi-k2.5"

[api]
moonshot = "YOUR_MOONSHOT_API_KEY"
EOF

# Setup Kimi Code
echo "Setting up Kimi Code via pnpm..."
pnpm add -g kimi-code
mkdir -p ~/.kimi-code
cat << 'EOF' > ~/.kimi-code/config.toml
[default]
model = "kimi-k2.5"

[api]
moonshot = "YOUR_MOONSHOT_API_KEY"
EOF

echo "Setup Complete! Make sure to replace YOUR_MOONSHOT_API_KEY in ~/.kimi-cli/config.toml and ~/.kimi-code/config.toml"
