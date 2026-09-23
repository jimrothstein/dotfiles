# pauling-mcp

YouTube MCP server project (named "pauling"), skeleton only, living at `~/code/mcp_project/pauling-mcp`.

## Project Summary
- 2026-09-22: Created via `uv init` (src layout `pauling_mcp`, Python >=3.12, `.python-version` = 3.12, entry point `pauling-mcp = pauling_mcp:main`). Only code is a stub `main()` that prints "Hello from pauling-mcp!".
- Uses `youtube-studio-mcp` 0.3.0 (PyPI package `youtube_mcp`) as the actual MCP server binary. Venv also has `google-api-python-client 2.200.0`, `google-auth-oauthlib`, `youtube-transcript-api 1.2.4`, `httpx2`, `uvicorn`. `pyproject.toml` deps still empty (venv populated ad hoc; `mcp<2` pin NOT yet codified in pyproject).
- `.env` holds a Google OAuth client secret in var `YOUTUBE_MCP_CLIENT_SECRET` (note the typo "SERET"). `.env` is gitignored; never commit the secret.

## NEXT STEPS
- Fix credentials: package expects `YOUTUBE_MCP_CLIENT_SECRET` to be a PATH to `client_secret.json`, but `.env` holds the raw GOCSPX-… string → server already starts, but `youtube_auth` will fail. Get the full client_secret.json from Google Cloud console and tell the server where it lives (env var = path), tokens go to `~/.youtube-mcp/token.json`.
- Decide the shape: reuse/wrap `youtube_mcp` (youtube-studio-mcp) directly, or build a thin FastMCP server using the same deps.
- Set up Google OAuth (client ID/secret + scopes, e.g. youtube.readonly / youtube.upload) and verify the auth flow works via the `youtube_auth` tool.
- Restart opencode to load the new `youtube` MCP server.

## Current state
- 2026-09-22: Registered as `youtube` MCP server in global `~/dotfiles/opencode/opencode.jsonc` (local, cmd = `.../pauling-mcp/.venv/bin/youtube-studio-mcp`, cwd = project).
- Venv FIX: `mcp 2.2.0` broke the server (`youtube_studio_mcp 0.3.0` uses v1 FastMCP API). Downgraded to `mcp 1.30.0` via `uv pip install --python .venv/bin/python "mcp<2"`. Verified over stdio: initialize OK, 43 tools.

## TODO
- Clarify what "pauling" should actually do: upload/publishing, analytics, transcripts, channel management, or all of the above.
- Decide whether to vendor or depend on `youtube-studio-mcp` (0.3.0, MIT, alpha).

## PLAN
- A working YouTube MCP server in `~/code/mcp_project` using the installed youtube-studio-mcp stack, wired into opencode, giving opencode access to the user's YouTube channel/data.