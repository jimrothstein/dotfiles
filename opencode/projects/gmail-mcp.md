# gmail-mcp

## Summary
Goal (user, 2026-10-17): **use MCP server tools to clean up Gmail** (sort, label,
archive, trash). Google's hosted Gmail MCP server is not available to the user →
that route is closed.

Three code artifacts exist:
1. `/home/jim/code/mcp_project/gmail-mcp/server.py` — our old self-hosted server
   (2 read-only tools, mcp `MCPServer`). Unused now.
2. `/home/jim/code/mcp_project/gmail-mcp/auth_gmail.py` — our one-shot OAuth.
3. `/home/jim/code/mcp_project/gmail-mcp/client.py` — client for Google's hosted
   Gmail MCP. Dead end (preview-gated); do not pursue.

**Active path (experiment, user said "not a project"):** third-party
`theposch/gmail-mcp` (GPL-3.0) cloned to
`/home/jim/code/mcp_project/theposch_gmail-mcp` — 27 tools incl. `search-emails`,
`read-email`, `apply-label`/`remove-label`, `mark-email-as-read`,
`archive-email`, `batch-archive`, `restore-to-inbox`, `trash-email`, filters,
folders, drafts, send. Registered in opencode as MCP server `gmail`.

Credentials: `/home/jim/.gmail-mcp/credentials.json` + `tokens.json`
(dir 700, files 600), account `jimrothstein@gmail.com`, scope `gmail.modify`.
OAuth client = Desktop client `jim_youtube_http2_test_app` in GCP project
`light-tribute-354619`, **in Testing mode → refresh token expires ~every 7 days**;
re-run the server's auth command (delete tokens.json) to recover.

## Decisions
- 2026-10-17: Reviewed `gmail-mcp`. Findings: no `.venv`/`pyproject`/creds; the
  opencode `gmail-organizer` entry pointed at a nonexistent path
  (`/home/jim/code/python_project/gmail-mcp`); `gmail-mcp/project.md` is a plain
  49-byte file, not a symlink; `server.py` is read-only (only `search_messages`,
  `list_labels`) so it cannot meet the cleanup goal; `credentials.json`/`token.json`
  were ignored only by the global `~/.gitignore` rule `*.json`.
- 2026-10-17: User decision — hosted Google Gmail MCP is closed to us (no Workspace
  Developer Preview enrollment). Chosen path: third-party `theposch/gmail-mcp`
  (Python, single file `src/gmail/server.py`, 1987 lines, run via `uv run gmail
  --creds-file-path ... --token-path ...`). User explicitly framed it as an
  experiment, not a project → no project.md/AGENTS.md scaffolding created.
- 2026-10-17: Cloned to `/home/jim/code/mcp_project/theposch_gmail-mcp`
  (commit `f4c8`, includes "Update project to use Python MCP SDK version 2.0").
  `uv sync` → mcp 2.2.0 + google-api-python-client. It is a low-level
  `mcp.server.Server` (handlers) and calls sync Google APIs inside async
  handlers — long searches can block its own event loop (accepted).
- 2026-10-17: OAuth client — reused the existing **Desktop** client from project
  `light-tribute-354619` (`jim_youtube_http2_test_app`); console no longer allows
  viewing/downloading existing secrets, so the JSON was re-downloaded from the
  console. Consent screen: External, self added as test user.
- 2026-10-17: Verified before wiring: stdio probe (`/tmp/opencode/gmail_probe.py`)
  → initialize OK, 27 tools listed, `search-emails {query: in:inbox}` returned real
  messages, `list-labels` OK, exit 0. Probe gotcha: mcp 2.x client result field is
  `is_error`, not `isError`.
- 2026-10-17: opencode config — added `gmail` server entry using
  `uv run --directory /home/jim/code/mcp_project/theposch_gmail-mcp gmail
  --creds-file-path /home/jim/.gmail-mcp/credentials.json --token-path
  /home/jim/.gmail-mcp/tokens.json` (timeout 30000); **removed** the broken
  `gmail-organizer` entry. Pushed to `~/dotfiles` (commit `917f` + removal commit).
- 2026-08-31: Added a second upstream-SDK/Google quirk patch to `client.py`: Google
  advertises `authorization_response_iss_parameter_supported` but omits `iss` in
  the redirect, and mcp 2.0.0's `validate_authorization_response_iss` rejects a
  missing `iss` in that case, aborting OAuth. Patched `_oauth2` to tolerate a
  missing `iss` (same monkeypatch style as the trailing-slash fix).
- 2026-08-31: Verified `client.py` end to end (OAuth + PKCE + tools/list work);
  only `tools/call` was blocked by preview-enrollment (403 "project ... is enrolled
  in the Google Workspace Developer Preview Program").
- 2026-08-31: Re-authenticated Gmail token (deleted stale token.json, ran auth_gmail.py).
  User noted Google still identifies as old R HTTP2 app.
- 2026-08-31: Review directive from user: be terse; when running bash say only "running bash script";
  when editing files say only one line, don't display edits.
- 2026-08-18: Implemented all four TODO items in server.py: friendly error if
  `token.json` missing, re-auth hint on refresh failure, `gmail()` cached via
  `functools.cache`, and switched the N+1 fetch in `search_messages` to
  `service.new_batch_http_request()` (Gmail has no `batchGet`; the legacy
  `www.googleapis.com/batch` endpoint 404s).
- 2026-08-18: Use shared Google OAuth client (old R app's) rather than a dedicated
  one; migrated server.py from `FastMCP` to `MCPServer` (mcp 2.0.0 removed
  `mcp.server.fastmcp`); registered `gmail-organizer` in opencode global config;
  run scripts with the project-local `.venv/bin/python`.
- 2026-08-18: Removed `ailang-docs` MCP server from opencode global config
  (commit dd3bf3 in `~/dotfiles`). Why: pre-1.0, ~33 stars; wasted context tokens.

## NEXT STEPS
- Restart opencode so the new `gmail` MCP server loads, then exercise cleanup on a
  small batch first (e.g. "search newsletters, apply label, archive") and confirm
  the changes are visible in Gmail.
- Re-run auth when the ~7-day Testing-mode refresh token expires: delete
  `/home/jim/.gmail-mcp/tokens.json` and re-run
  `uv run --directory /home/jim/code/mcp_project/theposch_gmail-mcp gmail
  --creds-file-path /home/jim/.gmail-mcp/credentials.json
  --token-path /home/jim/.gmail-mcp/tokens.json`.
- Decide the fate of our own `/home/jim/code/mcp_project/gmail-mcp/{server.py,client.py}`
  (likely move `client.py` to an `attic/` with a "do not run" note; `server.py`
  superseded).
- Fix `/home/jim/code/mcp_project/gmail-mcp/project.md` → symlink to
  `~/dotfiles/opencode/projects/gmail-mcp.md` (still a plain file).

## TODO
- [ ] Replace `mcp_project/gmail-mcp/project.md` with symlink to this file
- [ ] Move `client.py` (hosted path) to `attic/` with a warning header
- [ ] Consider publishing the OAuth consent screen to stop 7-day re-auth
- [ ] Optional: add a per-project `.gitignore` in `mcp_project/gmail-mcp`

## PLAN
Clean up Gmail through MCP tools. Short term: the third-party `theposch/gmail-mcp`
server wired into opencode (running now). Fallback if it disappoints: extend our own
minimal `server.py` to add read/label/archive/trash tools.
