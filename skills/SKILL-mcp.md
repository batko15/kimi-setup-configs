---
name: "Kimi Agent Integrator"
description: "Skill for teaching Kimi how to integrate with external tools via MCP"
---

# Kimi Agent Integrator Skill

When asked to integrate Kimi with a new tool, follow this procedure:

1. **Verify MCP Compatibility**: Check if the tool exposes a Model Context Protocol (MCP) server.
2. **Configure JSON**: Add the MCP server configuration to the user's `config.toml` under the `[mcp.servers]` map or in the dedicated `mcp-supercharged.json` file.
3. **Restart Kimi**: Instruct the user to restart `kimi-code` or `kimi-cli`.
4. **Test**: Run a prompt specifically requesting data from the newly added tool to verify the connection.

Example:
```toml
[mcp.servers.github]
command = "npx"
args = ["-y", "@modelcontextprotocol/server-github"]
```
