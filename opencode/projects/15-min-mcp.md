# 15-min-mcp

MCP server for searching local markdown notes (`*.md`), built with FastMCP.

## Project Summary
- Started 2026-09-20. Skeleton from `uv init`; replaced placeholder with FastMCP notes-search server.
- Chose FastMCP (high-level framework on top of official `mcp` SDK) over the low-level `mcp` SDK for minimal boilerplate.
- Notes default dir is `~/code/docs/tech_notes` (NOT `~/notes`), overridable via `NOTES_DIR` env var. Searches only `*.md` files.
- Related earlier projects in `~/code/mcp_project`: `simple_mcp`, `demo_mcp`, `notes-mcp`, `gmail-mcp`, `reddit-mcp`, `context7-mcp`.
- 2026-09-20 Session: built working server.
  - `src/notes_finder/` package: `server.py` defines FastMCP `"15-min-mcp"` (version 0.1.0) with one tool `search_notes(query)` — case-insensitive substring match over `*.md` files, returns filename + first matching line (200 chars), caps at 10 results. Root `server.py` is a thin wrapper (`mcp.run()`).
  - **KEY GOTCHA**: package/distro name `15_min_mcp` (starts with digit) is NOT a valid Python identifier → generated console-script stub `from 15_min_mcp import main` is a SyntaxError, and `from 15_min_mcp.server import ...` fails at parse time inside any .py. Fix: renamed DISTRIBUTION to `notes-finder` (src package `notes_finder`), kept `[project.scripts] 15-min-mcp = "notes_finder:main"` so the command and server name stay `15-min-mcp`. `uv_build` requires src package == normalized dist name.
  - `pyproject.toml`: dep `fastmcp>=2.0` (installed 4.0.5); scripts key `15-min-mcp`.
  - `.python-version` set to 3.13 to match existing venv (was stale 3.12).
  - Verified over stdio: initialize → `notifications/initialized` → tools/list → tools/call all work. GOTCHA: piping raw JSON-RPC causes "Connection closed" on tools/call if stdin hits EOF before response; keep stdin open (hold with `sleep`) when testing.
  - Global `_*` gitignore ignores `__init__.py`; had to `git add -f`.

## NEXT STEPS
- Register `15-min-mcp` as a local MCP server in `~/dotfiles/opencode/opencode.jsonc` (`uv run --directory /home/jim/code/mcp_project/15-min-mcp 15-min-mcp`, cwd = project root) and verify live in opencode against `~/code/docs/tech_notes`.

## TODO
- Full-text search beyond simple substring (e.g. ripgrep or `fuzzywuzzy`/rapidfuzz) if needed.

## PLAN
- Keep as a minimal, working notes-search MCP server; grow tools (add/update notes) only if user wants.