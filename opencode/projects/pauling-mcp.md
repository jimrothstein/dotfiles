# pauling-mcp

YouTube MCP server project (named "pauling"), skeleton only, living at `~/code/mcp_project/pauling-mcp`.

## Project Summary
- 2026-09-22: Created via `uv init` (src layout `pauling_mcp`, Python >=3.12, `.python-version` = 3.12, entry point `pauling-mcp = pauling_mcp:main`). Only code is a stub `main()` that prints "Hello from pauling-mcp!".
- Uses `youtube-studio-mcp` 0.3.0 (PyPI package `youtube_mcp`) as the actual MCP server binary. Venv also has `google-api-python-client 2.200.0`, `google-auth-oauthlib`, `youtube-transcript-api 1.2.4`, `httpx2`, `uvicorn`. `pyproject.toml` deps still empty (venv populated ad hoc; `mcp<2` pin NOT yet codified in pyproject).
- `.env` (gitignored) holds the Google OAuth client secret in `YOUTUBE_MCP_CLIENT_SECRET`; never commit. (Var name fixed 2026-10-18; was typo `..._SERET`.)
- 2026-09-22: OAuth DONE. Added self as test user in Google Cloud console; ran `youtube_auth` from opencode → browser consent granted. Token saved to `pauling-mcp/.config/youtube-mcp/token.json`. Verified `youtube_get_channel` works: channel **jim rothstein** @jimrothstein (`UClB5qWyXejlAwwkDAzJis-Q`), 0 subs/views/videos, uploads playlist `UUlB5qWyXejlAwwkDAzJis-Q`. Scopes granted: youtube.readonly, youtube, youtube.upload, youtube.force-ssl, yt-analytics.readonly, yt-analytics-monetary.readonly.
- 2026-09-22: End-to-end sanity check passed. `youtube_list_playlists` (mine, max_results=0) returned **205 playlists / 11,946 videos**. Biggest: Calm Down! (4911), all music (910), 60s - early - femaleVoices (809), 000_r_next (382), politics (86). Plenty of singletons. NOTE: API-reported total (202) vs actual fetched (205) — pagination count mismatch; trust the fetched list.
- 2026-10-18: Deps codified. `pyproject.toml` now declares `mcp>=1.30.0,<2` + `youtube-studio-mcp>=0.3.0`; `[tool.uv].constraint-dependencies = ["oauthlib<4"]`. Generated `uv.lock`; `uv sync` upgraded all patch/minor packages (52 pkgs, venv now uv-managed). Removed orphan leftovers (mcp-types, httpx2, httpcore2, truststore). Re-verified over stdio: initialize OK, 43 tools. Deliberately NOT upgraded: `mcp` (2.x breaks ysm 0.3.0) and `oauthlib` (major 4.x).
- 2026-10-18: **BLOCKER — YouTube auth dead.** `youtube_auth_status` → `authenticated: false, expired: true, has_refresh_token: true`. CLI repro `creds.refresh(Request())` → `google.auth.exceptions.RefreshError: ('invalid_grant: Bad Request', ...)`. `token.json` unchanged since 2026-09-22 (`expiry 2026-09-23`). Suspected cause: Google Cloud OAuth consent screen in **"Testing"** → refresh tokens expire after 7 days (9/22 + 7 ≈ 9/29). Re-auth attempted via `youtube_auth` → browser flow failed: `OAuth flow failed: Scope has changed from <all 6 scopes> to <youtube + youtube.readonly>` i.e. only 2 scopes came back — **unexplained, unresolved**. OAuth client = project `pauling-ai-youtube`, client `967779732318-o3452e…` (installed-app type).
- 2026-10-18: Stale MCP process: youtube server PIDs 86354/86376 started 22:28:41, i.e. **before** `uv sync` (22:31) → restart opencode so it relaunches on the upgraded deps.

## NEXT STEPS
- **IMMEDIATE (resume here):** (1) Restart opencode (picks up upgraded deps + fresh MCP process). (2) Re-auth YouTube: run `youtube_auth`, complete consent in browser as jimrothstein@gmail.com; unverified-app → Advanced → Go to *pauling-ai-youtube (unsafe)*. (3) Answer the open question the user asked: does a playlist named **"my stuff"** / **"my_stuff"** exist? (never answered — auth blocked it). (4) Investigate why the consent/token exchange returns only 2 of the 6 scopes. (5) Consider setting the OAuth consent screen to **"In production"** so refresh tokens stop expiring every 7 days.
- Open SECURITY item: the Google OAuth client secret (`GOCSPX-…`) was inadvertently printed into an opencode session transcript on 2026-10-18 — consider rotating it in Google Cloud Console.
- Moved to `~/dotfiles/.zshrc_secret`? Not yet — user wants all secrets centralized there (policy now in AGENTS.md); pauling's secret still lives in `.env` + `.client_secret.json`.
- (1) Explain this issue to user:   (2) Decide the shape: reuse/wrap `youtube_mcp` (youtube-studio-mcp) directly, or build a thin FastMCP server using the same deps.
- Decide what "pauling" should actually do first (per TODO). Server is fully functional as-is now.   1st we must test the various tools and see it works.  Then see PLAN (below)
- Worth exploring next: analytics (`youtube_analytics_*`), transcripts, or a real use-case (e.g. maintain a playlist from a file). (SEE PLAN)
- SEE https://github.com/pauling-ai/youtube-mcp-server.  Test several tools. Ask user.
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
  -.env` (gitignored) holds the Google OAuth client secret in `YOUTUBE_MCP_CLIENT_SECRET`.
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
- [x] Decide whether to vendor or depend on `youtube-studio-mcp` (0.3.0, MIT, alpha). → Depend (declared in pyproject + uv.lock).

## PLAN
- A working YouTube MCP server in `~/code/mcp_project` using the installed youtube-studio-mcp stack, wired into opencode, giving opencode access to the user's YouTube channel/data.
- The goal:   user wants to organize playlists.  For example, if two playlists can be combined then do so.   If a playlist is no longer needed, delete it.  If a playlist should be renamed, do so.   If certain videos, in one or more playlists, are no longer needed, then remove them.   In all of these case, the USER will tell you what to do.  We are still experimenting.   So there is no definite PLAN.  Over time, we may be able to write a plan or continually improve the plan.   For now, the plan is really to test and to experiment.

## PLAN — opencode MCP cleanup (2026-10-18, global config)
Context/constraints from user:
- Most `~/code/mcp_project/*` dirs are **toys** (experiments/learning, not production) → don't invest in hardening them.
- `context7` is used **often** → keep it globally enabled.
- All the **other** MCP servers can be turned **off globally** (for now).

Facts: opencode v2.0.32; `~/dotfiles/opencode/opencode.jsonc` has 7 servers, all `enabled: true` → ~99 tool defs + ~10 processes every session (youtube 43, gmail 27, filesystem 14, notes 8, huggingface 4, context7 2, 15-min 1). Flat `mcp.<name>` form is **deprecated** in v2; new form is `mcp.servers.<name>` with `disabled: true` (plus `codemode`, `protocol`, `timeout: {startup,catalog,execution}`). Project config: `<project>/opencode.json(c)` or `<project>/.opencode/opencode.json(c)`, merged over global.

Tasks:
- [ ] Migrate `mcp` flat map → `mcp.servers` map; replace `enabled: true/false` with `disabled: true/false`.
- [ ] Keep enabled globally: `context7` only.
- [ ] Disable globally: `youtube`, `gmail`, `notes`, `15-min-mcp`, `huggingface`.
- [ ] Remove `filesystem` entirely — redundant with opencode's built-in read/write/edit/glob/grep; was scoped to `/home/jim/code/mcp_project` only.
- [ ] Add opt-in per project: `<project>/opencode.json` declaring only that project's server (e.g. `pauling-mcp/opencode.json` → `youtube` with its `environment`).
- [ ] Keep secrets in `~/dotfiles/.zshrc_secret` (policy in AGENTS.md); reference via `{env:...}` where possible.
- [ ] Verify after restart: `ps` shows no local MCP procs; tool catalog only context7 (+ any project-level server); re-verify youtube via `.venv/bin/python /tmp/opencode/mcp_probe.py`.
