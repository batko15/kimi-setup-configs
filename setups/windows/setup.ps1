# Windows Kimi Setup Script (PowerShell)

Write-Host "Starting Kimi setup for Windows..."

# Check Node and Python
if (!(Get-Command node -ErrorAction SilentlyContinue)) { throw "Node.js is required" }
if (!(Get-Command python -ErrorAction SilentlyContinue)) { throw "Python is required" }

# Install pnpm and uv
npm install -g pnpm
pip install uv

# Setup Kimi CLI
Write-Host "Setting up Kimi CLI..."
uv tool install kimi-cli
$cliConfigDir = "$env:USERPROFILE\.kimi-cli"
if (!(Test-Path $cliConfigDir)) { New-Item -ItemType Directory -Path $cliConfigDir }
Set-Content -Path "$cliConfigDir\config.toml" -Value @"
[default]
model = "kimi-k2.5"

[api]
moonshot = "YOUR_MOONSHOT_API_KEY"
"@

# Setup Kimi Code
Write-Host "Setting up Kimi Code..."
pnpm add -g kimi-code
$codeConfigDir = "$env:USERPROFILE\.kimi-code"
if (!(Test-Path $codeConfigDir)) { New-Item -ItemType Directory -Path $codeConfigDir }
Set-Content -Path "$codeConfigDir\config.toml" -Value @"
[default]
model = "kimi-k2.5"

[api]
moonshot = "YOUR_MOONSHOT_API_KEY"
"@

Write-Host "Windows Setup Complete!"
