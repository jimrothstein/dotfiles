# context7-mcp

Learning project: connect to Context7's LOCAL MCP server from Python.

## Project Summary
- 2026-09-17: Explored `--transport http --port 3000`. Server = Express app, endpoint `/mcp`, POST JSON-RPC, responds `text/event-stream` (SSE). `GET /` errors (API, not website). GET `/ping` → `{"status":"ok","message":"pong"}`. OpenTelemetry Prometheus metrics at `:9464/metrics`. CORS `*`; OAuth hint in `WWW-Authenticate: Bearer` header.
- 2026-09-17: Wrote `client_http.py` — same CLI as `client.py` but via `streamable_http_client(SERVER_URL)` (no OAuth needed, anonymous). Verified end-to-end: list_tools + resolve-library-id(flask) both work over HTTP.
- Background server got killed when a bash command timed out; restarted with `setsid nohup ... > /tmp/context7-http.log 2>&1 &` so it survives.
- 2026-09-16: Built a minimal Python MCP **client** (`client.py`) that spawns Context7's real local MCP server (`@upstash/context7-mcp` v4.1.1 via `npx -y @upstash/context7-mcp`) over stdio using the official `mcp` SDK (uv project, mcp>=2.2.0, Python 3.12).
- Key learning: Context7 is a Node/TS MCP server — there is no Python version. The Python code to learn is the client side: `StdioServerParameters` (how to spawn), `stdio_client()` (launches subprocess, yields `(read, write)` streams), `ClientSession` (`initialize()` / `list_tools()` / `call_tool()`).
- Verified end-to-end: `resolve-library-id` (Flask → `/pallets/flask`) and `query-docs` both returned real doc snippets; anonymous use works, no API key (rate-limited).
- mcp 2.x gotchas: `Tool.input_schema` (snake_case, not `inputSchema`); `result.content` items carry `.text`. Server banner ("...running on stdio") goes to stderr, so it does not corrupt stdio framing.
- CLI: `uv run python client.py` (list tools), `resolve NAME QUERY` (interactive two-step), `call TOOL 'JSON'`.
- Repo-level rule applied: committed a clean baseline before starting, per global AGENTS.md.
- 2026-09-16 (session 2): User walked the interactive `resolve p... Flask` flow by hand, picked `/pallets/flask`, and got real Flask routing docs (GET/POST, 3 routing functions). Reviewed client.py line-by-line (`from __future__ import annotations`, spawn semantics). Discussed processes seen in `ps aux`: opencode itself spawns local MCP servers (server-filesystem node + notes-mcp python) and keeps them alive for its session; our client.py spawns context7 on demand and it exits when the script ends.
- Key conceptual point (user said "important to know"): stdio transport has NO port/browser exposure — it only speaks over stdin/stdout pipes. http transport would respond on http://127.0.0.1:3000 but with MCP JSON-RPC messages, not a web page — an API endpoint, not a website.

## NEXT STEPS
- Register local Context7 server in `~/dotfiles/opencode/opencode.jsonc` (`type: remote`, url `http://127.0.0.1:3000/mcp`) — proves JSON config side vs Python client side; opencode loads Context7 docs automatically.
- Drive full raw MCP protocol with curl by hand: `notifications/initialized`, `tools/list`, `tools/call` — see the wire format behind the SDK (only `initialize` done so far).
- Browser page via fetch — CORS is `*`, so any HTML page can call the two tools; tiny demo of MCP from pure JS.
- Multiple concurrent clients — unlike stdio (1:1 pipe), several clients can share one HTTP server instance; watch sessions.
- Side-by-side comparison of the stdio (`client.py`) vs HTTP (`client_http.py`) clients already in the repo.

## TODO
- none

## PLAN
- Keep as a tiny learning fixture for MCP client patterns (stdio). Extend only if a new MCP learning topic needs it.