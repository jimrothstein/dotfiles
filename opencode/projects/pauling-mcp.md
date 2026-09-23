# pauling-mcp

YouTube MCP server project (named "pauling"), skeleton only, living at `~/code/mcp_project/pauling-mcp`.

## Project Summary
- 2026-09-22: Created via `uv init` (src layout `pauling_mcp`, Python >=3.12, `.python-version` = 3.12, entry point `pauling-mcp = pauling_mcp:main`). Only code is a stub `main()` that prints "Hello from pauling-mcp!".
- Uses `youtube-studio-mcp` 0.3.0 (PyPI package `youtube_mcp`) as the actual MCP server binary. Venv also has `google-api-python-client 2.200.0`, `google-auth-oauthlib`, `youtube-transcript-api 1.2.4`, `httpx2`, `uvicorn`. `pyproject.toml` deps still empty (venv populated ad hoc; `mcp<2` pin NOT yet codified in pyproject).
- `.env` holds a Google OAuth client secret in var `YOUTUBE_MCP_CLIENT_SECRET` (note the typo "SERET"). `.env` is gitignored; never commit the secret.
- 2026-09-22: OAuth DONE. Added self as test user in Google Cloud console; ran `youtube_auth` from opencode → browser consent granted. Token saved to `pauling-mcp/.config/youtube-mcp/token.json`. Verified `youtube_get_channel` works: channel **jim rothstein** @jimrothstein (`UClB5qWyXejlAwwkDAzJis-Q`), 0 subs/views/videos, uploads playlist `UUlB5qWyXejlAwwkDAzJis-Q`. Scopes granted: youtube.readonly, youtube, youtube.upload, youtube.force-ssl, yt-analytics.readonly, yt-analytics-monetary.readonly.
- 2026-09-22: End-to-end sanity check passed. `youtube_list_playlists` (mine, max_results=0) returned **205 playlists / 11,946 videos**. Biggest: Calm Down! (4911), all music (910), 60s - early - femaleVoices (809), 000_r_next (382), politics (86). Plenty of singletons. NOTE: API-reported total (202) vs actual fetched (205) — pagination count mismatch; trust the fetched list.

## NEXT STEPS
- (1) Explain this issue to user:   (2) Decide the shape: reuse/wrap `youtube_mcp` (youtube-studio-mcp) directly, or build a thin FastMCP server using the same deps.
- Decide what "pauling" should actually do first (per TODO). Server is fully functional as-is now.   1st we must test the various tools and see it works.  Then see PLAN (below)
- Worth exploring next: analytics (`youtube_analytics_*`), transcripts, or a real use-case (e.g. maintain a playlist from a file). (SEE PLAN)
- SEE https://github.com/pauling-ai/youtube-mcp-server.  Test several tools. Ask user.
- Fix typo, spelling error:  .env change to YOUTUBE_MCP_CLIENT_SECRET.
- Explain to user the steps to start up the mcp.  And how a simple tool works.   This includes listing python code (number each line).  User is beginning, explain one thing at a time. Wait for user to tell you to continue.
- When writing Project Summary:  .  Summary should have more short bullet points. Use sentences only when necessary. Use as many bullet points as needed (each on separate line)
(Ajust the AGENTS.md file so all projects can these changes)   
***
- Here is first line of summary, redone.

- 2026-09-22: Begin, setup "pauling_mcp" , steps include:
  - Created [project] via `uv init` (src layout `pauling_mcp`, Python >=3.12, `.python-version` = 3.12, entry point `pauling-mcp = pauling_mcp:main`). 
  - Code is a only stub `main()` that prints "Hello from pauling-mcp!".
  - Uses `youtube-studio-mcp` 0.3.0 (PyPI package `youtube_mcp`) as the actual MCP server binary. 
  - Venv also has `google-api-python-client 2.200.0`, `google-auth-oauthlib`, `youtube-transcript-api 1.2.4`, `httpx2`, `uvicorn`. `pyproject.toml` 
  - deps still empty (venv populated ad hoc; `mcp<2` pin NOT yet codified in pyproject).
  -.env` holds a Google OAuth client secret in var `YOUTUBE_MCP_CLIENT_SECRET` (note the typo "SERET"). 
  -.env` is gitignored; never commit the secret.
- 2026-09-22: OAuth DONE, steps include:
  - Added jimrothstein@gmail.com (not "self") as test user in Google Cloud console; 
  - ran `youtube_auth` from opencode → browser consent granted. 
  - OAUTH Token saved to `pauling-mcp/.config/youtube-mcp/token.json`. 
  - Verified `youtube_get_channel` works: 
  - channel **jim rothstein** @jimrothstein (`UClB5qWyXejlAwwkDAzJis-Q`), 0 subs/views/videos, uploads playlist `UUlB5qWyXejlAwwkDAzJis-Q`. 
  - Scopes granted: youtube.readonly, youtube, youtube.upload, youtube.force-ssl, yt-analytics.readonly, yt-analytics-monetary.readonly.
- 2026-09-22: End-to-end sanity check passed, Begin "experiments" and user testing:
  - youtube_list_playlists` (mine, max_results=0) returned **205 playlists / 11,946 videos**. 
  - Biggest: Calm Down! (4911), all music (910), 60s - early - femaleVoices (809), 000_r_next (382), politics (86). Plenty of singletons. 
  - NOTE: API-reported total (202) vs actual fetched (205) — pagination count mismatch; trust the fetched list.
***

## Current state
- 2026-09-22: Registered as `youtube` MCP server in global `~/dotfiles/opencode/opencode.jsonc` (local, cmd = `.../pauling-mcp/.venv/bin/youtube-studio-mcp`, cwd = project) with `environment`: `YOUTUBE_MCP_CLIENT_SECRET` = `pauling-mcp/.client_secret.json`, `YOUTUBE_MCP_CONFIG_DIR` = `pauling-mcp/.config/youtube-mcp` (keeps token out of `~`).
- New `pauling-mcp/.gitignore` covers `.env`, `.client_secret.json`, `.config/`, `.venv/` (token.json also globally ignored via `*.json`). Verified: full OAuth secret appears nowhere in repo files or history.
- Venv FIX: `mcp 2.2.0` broke the server (`youtube_studio_mcp 0.3.0` uses v1 FastMCP API). Downgraded to `mcp 1.30.0` via `uv pip install --python .venv/bin/python "mcp<2"`. Verified over stdio: initialize OK, 43 tools.

## TODO
- Clarify what "pauling" should actually do: upload/publishing, analytics, transcripts, channel management, or all of the above.
- Decide whether to vendor or depend on `youtube-studio-mcp` (0.3.0, MIT, alpha).

## PLAN
- A working YouTube MCP server in `~/code/mcp_project` using the installed youtube-studio-mcp stack, wired into opencode, giving opencode access to the user's YouTube channel/data.
- The goal:   user wants to organize playlists.  For example, if two playlists can be combined then do so.   If a playlist is no longer needed, delete it.  If a playlist should be renamed, do so.   If certain videos, in one or more playlists, are no longer needed, then remove them.   In all of these case, the USER will tell you what to do.  We are still experimenting.   So there is no definite PLAN.  Over time, we may be able to write a plan or continually improve the plan.   For now, the plan is really to test and to experiment.
