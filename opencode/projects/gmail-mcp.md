# gmail-mcp

## Summary
Minimal Gmail MCP server built at `/home/jim/code/python_project/gmail-mcp`.
OAuth client shared with old R app (GCP project `light-tribute-354619`); user
approved shared client. `credentials.json` and `token.json` are gitignored.

Stack: Python 3.13 project-local `.venv` (uses `/usr/bin/python3`), `mcp`
2.0.0, `google-api-python-client` 2.198.0, `google-auth-oauthlib`,
`google-auth-httplib2`, uvicorn/sse-starlette.

Key files:
- `auth_gmail.py` — one-shot OAuth; writes `token.json` (scope `gmail.modify`).
- `server.py` — FastMCP server `gmail-organizer` with tools `search_messages`
  and `list_labels`; refresh flow persists refreshed token.

## Decisions
- 2026-08-18: Use shared Google OAuth client (old R app's) rather than a
  dedicated one. Why: no new consent needed, acceptable for personal use.
- 2026-08-18: Migrated server.py from `FastMCP` (v1 API) to `MCPServer` from
  `mcp.server` — mcp 2.0.0 removed `mcp.server.fastmcp` entirely; the rename is
  otherwise a drop-in (`@mcp.tool()` and `mcp.run()` unchanged). Why: the
  project venv has mcp 2.0.0 installed.
- 2026-08-18: Registered `gmail-organizer` as a local MCP server in opencode
  global config `~/.config/opencode/opencode.json` (type local, venv python +
  server.py, cwd set, timeout 15000). Requires opencode restart.
- 2026-08-18: Use the project-local `.venv/bin/python` to run scripts; the
  parent repo's Python 3.12 venv lacks google packages.
- 2026-08-18: Start with minimal two-tool MCP server before adding features.

## NEXT STEPS
- Fix server.py review issues (see TODO #1-#3).

## TODO
1. Friendly error if `token.json` is missing: call out running `auth_gmail.py`.
2. Re-auth hint if token refresh fails (currently exception escapes).
3. Consider `users.messages.batchGet` for N+1 fetch in `search_messages`.
4. (nit) Cache the gmail service (e.g. `functools.cache` on `gmail()`).

## PLAN
Build up a functional Gmail MCP server; add more tools (send, labels, threads)
as needed. Security-conscious: keep OAuth files out of git.