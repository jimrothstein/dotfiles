# mcp_project

## Project Summary
- Simple MCP server demo (`server.py`) using the `mcp` SDK's `MCPServer` class: one tool (`add`), one resource (`greeting://{name}`), one prompt (`summarize`).
- 2026-08-25: Debugged MCP Inspector showing "Disconnected" for `uv run server.py`. Root cause: server.py never called `mcp.run()`, so the process exited immediately over stdio. Added `if __name__ == "__main__": mcp.run()`. Verified with a raw JSON-RPC initialize request over stdio — handshake succeeds (server name "Demo").
- Note on workflow: pasted PNG screenshots failed with an upstream error; worked around by running `tesseract` on the screenshot in ~/Downloads to extract text.

- 2026-08-25: Fixed MCP Inspector connection issues. Two causes: (1) multiple stale inspector instances competing for ports 6274/6275 — kill them all and run one instance; (2) shell exported `HOST=jim-debian`, which the Inspector uses as its bind address → bound to 127.0.1.1, so `localhost` was unreachable AND non-loopback HTTP is an insecure browser context (`crypto.randomUUID is not a function`). Fix: launch with `HOST=127.0.0.1 uv run mcp dev server.py` and open `http://127.0.0.1:6274/?MCP_INSPECTOR_API_TOKEN=<token>`. User plans to remove the `HOST` env var from shell config.
- Note: `crypto.randomUUID` requires a secure context (HTTPS or localhost/127.0.0.1); don't use HTTPS with the Inspector (no TLS support), use loopback hostnames instead.
- Environment note: Node.js v20.19.2 in use (satisfies MCP Inspector's Node >= 20 requirement).

- 2026-08-25: Inspector fully working end-to-end: connected and `add` tool tested successfully from the UI.
- 2026-08-25: Confirmed all MCP server issues resolved; user continuing with an MCP tutorial (will report back if trouble arises).
- 2026-08-25: Added `filesystem` MCP server to global config (`~/dotfiles/opencode/opencode.jsonc`): `npx -y @modelcontextprotocol/server-filesystem /home/jim/code/mcp_project`. Tutorial was mac/windows; adapted paths for Linux. Later may widen access to `~/code/`.

- 2026-08-25: Verified opencode ↔ filesystem MCP connection works end-to-end (listed `~/code/mcp_project` contents via the server). Tutorial steps completed.
- 2026-08-25: ULTIMATE GOAL set by user: connect opencode to Gmail so opencode can help sort/label/organize emails. Gmail work will live in THIS folder (`~/code/mcp_project`) and use THIS memory file.
  - Existing asset: a Gmail MCP server already exists at `/home/jim/code/python_project/gmail-mcp/server.py` and is registered as `gmail-organizer` in `~/dotfiles/opencode/opencode.jsonc`. Decide whether to move/reuse it here or build fresh.
- 2026-08-25: User prefers gmail-mcp live in `~/code/mcp_project`; discussion of the move/reuse planned for next session.

## NEXT STEPS
- User reviewing candidate directions offline; pick one next session:
  1. Study examples at https://github.com/modelcontextprotocol/servers
  2. Build my own MCP server
  3. Connect to a remote MCP server
  4. Understand the MCP protocol itself
- All are in service of the Gmail goal above.
- Consider adding a git remote so commits can be pushed (currently no remote configured).

## TODO
- Decide how to fold existing `gmail-mcp` (in python_project) into this folder/memory, or start fresh.

## PLAN
- Keep this as a minimal learning/demo project for MCP servers; possibly extend with more tools/resources later.
- Long term: extend into a Gmail organizing MCP server (sort/label emails) used via opencode.
