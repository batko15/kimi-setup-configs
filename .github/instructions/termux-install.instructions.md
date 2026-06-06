---
description: Workarounds for installing Node.js CLI tools and dependencies globally on Termux (Android ARM64).
---

# Termux Node.js / NPM Global Installation Workarounds

When installing Node.js packages globally in Termux (especially those that compile native modules like `keytar` or have strict filesystem assumptions), follow these constraints:

## 1. Avoid Global `pnpm`
`pnpm` relies on hardlinks and symlinks for its global store. Android's user space filesystem configuration in Termux frequently lacks permissions to create these hardlinks, resulting in `ENOENT` or `EPERM` errors.
- **Wrong**: `pnpm add -g kimi-code`
- **Right**: `npm install -g kimi-code`

## 2. Ignore Compilation Scripts for Native Addons
Many global packages compile optional C/C++ dependencies (like `keytar` for OS keyring integrations). These will fail to compile on Termux because:
- The `libsecret` library or other dev dependencies are not in the standard search paths.
- The `clang`/`node-gyp` setup is not fully native or matching Android NDK.

**Solution**:
Bypass native compilation scripts using `--ignore-scripts`.
- **Right**: `npm install -g kimi-code --ignore-scripts`
Most CLI tools will gracefully degrade and fallback to environment variables or plain text configuration when native keyring bindings are unavailable.
