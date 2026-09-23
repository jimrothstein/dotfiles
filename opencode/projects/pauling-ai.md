# pauling-ai

YouTube MCP server project (named "pauling"), skeleton only, living at `~/code/mcp_project/pauling-mcp`.

## Project Summary
- 2026-09-22: Created via `uv init` (src layout `pauling_mcp`, Python >=3.12, `.python-version` = 3.12, entry point `pauling-mcp = pauling_mcp:main`). Only code is a stub `main()` that prints "Hello from pauling-mcp!".
- Pre-installed venv stack points clearly at a YouTube MCP server built on the `youtube-studio-mcp` package:
  - `youtube_studio_mcp 0.3.0` (`youtube_mcp` package, tools: analytics, channel, comments, playlists, publishing, reporting, search, transcripts)
  - `mcp 2.2.0`, `google-api-python-client 2.200.0`, `google-auth-oauthlib 1.4.1`, `google-auth 2.58.0`, `youtube-transcript-api 1.2.4`, `httpx2`, `uvicorn`
- `.env` holds a Google OAuth client secret in var `YOUTUBE_MCP_CLIENT_SECRET` (note the typo "SERET"). `.env` is gitignored; never commit the secret.
- No server code, OAuth scopes, or opencode config wiring yet.

## NEXT STEPS
- Decide the shape: reuse/wrap `youtube_mcp` (youtube-studio-mcp) directly, or build a thin FastMCP server using the same deps.
- Set up Google OAuth (client ID/secret + scopes, e.g. youtube.readonly / youtube.upload) and verify the auth flow works.
- Once serving, register as a local MCP server in `~/dotfiles/opencode/opencode.jsonc` and verify in opencode (same pattern as 15-min-mcp).

## TODO
- Clarify what "pauling" should actually do: upload/publishing, analytics, transcripts, channel management, or all of the above.
- Decide whether to vendor or depend on `youtube-studio-mcp` (0.3.0, MIT, alpha).

## PLAN
- A working YouTube MCP server in `~/code/mcp_project` using the installed youtube-studio-mcp stack, wired into opencode, giving opencode access to the user's YouTube channel/data.