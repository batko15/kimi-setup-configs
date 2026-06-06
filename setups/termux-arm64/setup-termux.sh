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
echo "Setting up Kimi Code via npm (ignoring native scripts to prevent build errors)..."
npm install -g kimi-code --ignore-scripts
mkdir -p ~/.kimi-code
cat << 'EOF' > ~/.kimi-code/config.toml
[default]
model = "kimi-k2.5"

[api]
moonshot = "YOUR_MOONSHOT_API_KEY"
EOF

# Apply Keytar Patch for Termux compat
echo "Applying keytar compat patch to kimi-code..."
NODE_KIMI_INDEX="/data/data/com.termux/files/usr/lib/node_modules/kimi-code/index.js"
if [ -f "$NODE_KIMI_INDEX" ]; then
  node -e '
  const fs = require("fs");
  const file = process.argv[1];
  let content = fs.readFileSync(file, "utf8");
  const mockKeytar = `const fs = require("fs");
const path = require("path");
const keyFile = path.join(require("os").homedir(), ".kimi-code-key.json");

const keytar = {
  async getPassword(service, account) {
    try {
      if (fs.existsSync(keyFile)) {
        const data = JSON.parse(fs.readFileSync(keyFile, "utf8"));
        return data[\`\${service}:\${account}\`] || null;
      }
    } catch (e) {}
    return null;
  },
  async setPassword(service, account, password) {
    try {
      let data = {};
      if (fs.existsSync(keyFile)) {
        data = JSON.parse(fs.readFileSync(keyFile, "utf8"));
      }
      data[\`\${service}:\${account}\`] = password;
      fs.writeFileSync(keyFile, JSON.stringify(data), "utf8");
    } catch (e) {}
  },
  async deletePassword(service, account) {
    try {
      if (fs.existsSync(keyFile)) {
        let data = JSON.parse(fs.readFileSync(keyFile, "utf8"));
        delete data[\`\${service}:\${account}\`];
        fs.writeFileSync(keyFile, JSON.stringify(data), "utf8");
      }
    } catch (e) {}
  }
};`;
  content = content.replace("const keytar = require(\x27keytar\x27);", mockKeytar);
  fs.writeFileSync(file, content, "utf8");
  ' "$NODE_KIMI_INDEX"
fi

# Add alias if not present
BASHRC="$HOME/.bashrc"
if ! grep -q "alias kimi-code=" "$BASHRC" 2>/dev/null; then
  echo -e "\n# Kimi CLI and Kimi Code aliases\nalias kimi-code=\"node /data/data/com.termux/files/usr/lib/node_modules/kimi-code/index.js\"" >> "$BASHRC"
fi

echo "Setup Complete! Make sure to run 'source ~/.bashrc' or restart your shell."
echo "Use 'kimi' to access the Python Kimi CLI, and 'kimi-code' to access the Node.js Kimi Code proxy."

