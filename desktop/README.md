# Kimi Desktop

This guide explains how to package the Kimi Web UI (or your local MiroFlow UI) into a native desktop application using `pake-cli`.

## Prerequisites

1. Install Node.js
2. Install Rust (for Tauri packaging via Pake)
3. Install `pake-cli`:
   ```bash
   npm install -g pake-cli
   ```

## Build Instructions

To build a standalone Kimi Desktop wrapper for Windows, macOS, or Linux:

```bash
pake https://kimi.moonshot.cn --name "KimiDesktop" --icon ./kimi.ico --transparent --show-menu
```

For a local Kimi UI (like MiroFlow) running on port 3000:
```bash
pake http://localhost:3000 --name "KimiLocalUI" --transparent
```

## Features
- **Native OS integration**: Pinned to taskbar/dock.
- **Lightweight**: Uses OS-native WebView via Tauri instead of Electron.
- **Cross-platform**: Works on Windows, Mac, Linux.
