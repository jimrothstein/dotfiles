# mcp_project

## Project Summary
- Simple MCP server demo (`server.py`) using the `mcp` SDK's `MCPServer` class: one tool (`add`), one resource (`greeting://{name}`), one prompt (`summarize`).
- 2026-08-25: Debugged MCP Inspector showing "Disconnected" for `uv run server.py`. Root cause: server.py never called `mcp.run()`, so the process exited immediately over stdio. Added `if __name__ == "__main__": mcp.run()`. Verified with a raw JSON-RPC initialize request over stdio — handshake succeeds (server name "Demo").
- Note on workflow: pasted PNG screenshots failed with an upstream error; worked around by running `tesseract` on the screenshot in ~/Downloads to extract text.

- 2026-08-25: Fixed MCP Inspector connection issues. Two causes: (1) multiple stale inspector instances competing for ports 6274/6275 — kill them all and run one instance; (2) shell exported `HOST=jim-debian`, which the Inspector uses as its bind address → bound to 127.0.1.1, so `localhost` was unreachable AND non-loopback HTTP is an insecure browser context (`crypto.randomUUID is not a function`). Fix: launch with `HOST=127.0.0.1 uv run mcp dev server.py` and open `http://127.0.0.1:6274/?MCP_INSPECTOR_API_TOKEN=<token>`. User plans to remove the `HOST` env var from shell config.
- Note: `crypto.randomUUID` requires a secure context (HTTPS or localhost/127.0.0.1); don't use HTTPS with the Inspector (no TLS support), use loopback hostnames instead.

## NEXT STEPS
- Test the `add` tool in the Inspector UI (connection succeeded 2026-08-25).
- Consider adding a git remote so commits can be pushed (currently no remote configured).

## TODO
- (none yet)

## PLAN
- Keep this as a minimal learning/demo project for MCP servers; possibly extend with more tools/resources later.
