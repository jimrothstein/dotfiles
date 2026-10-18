# gmail-mcp

## GOAL
Use MCP server tools to clean up Gmail — sort, label, archive, trash.
(user, 2026-10-17; seldom revised)

## PROJECT SUMMARY
**Canonical path (2026-10-17): `/home/jim/code/mcp_project/theposch_gmail-mcp`.**
This memory file keeps the short name `gmail-mcp`, but the project code lives in
`theposch_gmail-mcp` (third-party `theposch/gmail-mcp`, wired into opencode as MCP
server `gmail`). Any future work here means that directory, not
`/home/jim/code/mcp_project/gmail-mcp`.

Google's hosted Gmail MCP server is not available to the user (no Workspace
Developer Preview enrollment) → that route is closed.

**Status 2026-10-17 (end of day): DONE — the `gmail` MCP server is live and verified
in opencode (27 tools, reads + writes tested, all test changes reverted). Next is
real cleanup work.**

Gmail account state (2026-10-17): 35 labels = 16 user + 19 system. User naming scheme:
`000_tech/*` (`opencode`, `typst`, `math`, `LLM AI neural`), `000_tech`, `000_read`,
`Legal_Financial/*` (incl. `zimmerman/*`, `Tow`), `apt`, `Call log`, `kidney_oxalate`,
`prius`, `Scanned_Nov2012`. `get-unread-emails` reported the 100-item cap (heavier
than it looks: ~34 KB). No triage/label bucket for mail cleanup yet.

**Retired first attempt** — `/home/jim/code/mcp_project/gmail-mcp`: 4 tracked files
(`server.py` 2 read-only tools, `auth_gmail.py` one-shot OAuth, `client.py` client for
the hosted Gmail MCP, `project.md` a plain stub — not a symlink). Nothing live depends
on it, no credentials inside (those are in `~/.gmail-mcp/`), working tree clean, fully
preserved in the `mcp_project` git history (commits `58f4`, `66b4`, `74b9`) → safe to
delete whenever. The one non-obvious trick worth keeping is `server.py`'s
`service.new_batch_http_request()` for the N+1 message fetch (recorded 2026-08-18
below), and `client.py`'s two Google/SDK monkeypatches (recorded 2026-08-31 below).

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
- 2026-10-17 (live test, PASS): after `opencode service restart`, `opencode mcp list`
  shows `✓ gmail connected` (gmail-organizer gone) and all 27 `gmail_*` tools are in
  the Code Mode catalog. Verified **read**: list-labels (35 labels, 16 user),
  search-emails (real mail), read-email, search-by-label, list-folders, list-drafts,
  get-unread-emails (capped at 100, ~34 KB payload — heavy). Verified **write** and
  confirmed with the Gmail API directly (`/tmp/opencode/gmail_check*.py`, read-only,
  same token): create-label, apply-label, remove-label, delete-label, archive-email
  (INBOX dropped), restore-to-inbox (INBOX back). All test changes reverted; label
  set and inbox state back to the original 16 user labels.
  **BUG (upstream, unfixed):** `search-by-label(label_id)` returns 0 results — it
  passes the label **ID** (`Label_112`) to Gmail's `label:` operator, which needs the
  label **NAME**. Workaround: `search-emails {query: "label:<name>"}` (works).
- 2026-10-17 (test): Ran the EXACT command opencode is configured with
  (`uv run --directory …/theposch_gmail-mcp gmail --creds-file-path … --token-path …`)
  as a stdio MCP server: initialize OK (`gmail 0.1.0`), **27 tools**, `search-emails
  {in:inbox}` → real mail, `list-labels` OK, exit 0. The server binary + token work.
- 2026-10-17 (test): The server is NOT live in the opencode session: no `gmail_*`
  tools in the catalog, and `opencode mcp list` still prints
  `✗ gmail-organizer failed: NotFound …/python_project/gmail-mcp` with **no** `gmail`
  entry, although the config file on disk has `gmail` and no `gmail-organizer`.
  Cause: the **shared background service (pid 38524, started 15:09) owns MCP config
  and loaded it before the `gmail` entry was committed (19:28)**. A TUI restart does
  NOT reload it (TUI pid 108629 started 19:29 and still saw the stale entry).
  Documented fix: `opencode service restart` (docs: /v2/docs/troubleshooting).
- 2026-10-17: V2 docs note (from /v2/docs/mcp-servers): V2 wants servers under
  `mcp.servers` and uses `disabled` instead of `enabled`; server `timeout` is an
  object (`startup`/`catalog`/`execution`), not the integer ms we used. Our flat
  `mcp: {name: …}` + `"timeout": 30000` is deprecated V1 shape — still works today
  (other servers load), but migrate if gmail fails to load after the restart.
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
- Continue where the user stopped: run the first real cleanup batch and confirm in
  Gmail. Method: `search-emails` (small `max_results`) → `create-label`/`apply-label`
  → `archive-email` or `batch-archive {query, max_results}`; verify, then next batch.
  Use `search-emails "label:<name>"` — `search-by-label` is broken. User's prefixes:
  `000_tech/...`, `000_read`, `Legal_Financial/...`.
- When a new MCP server or config change does not show up: MCP config is owned by the
  background service → `opencode service restart` (TUI restart is NOT enough).
  Second suspect: migrate `mcp` in `opencode.jsonc` to the V2 shape (`mcp.servers`,
  `disabled`, object `timeout`).
- Re-run auth when the ~7-day Testing-mode refresh token expires: delete
  `/home/jim/.gmail-mcp/tokens.json` and re-run
  `uv run --directory /home/jim/code/mcp_project/theposch_gmail-mcp gmail
  --creds-file-path /home/jim/.gmail-mcp/credentials.json
  --token-path /home/jim/.gmail-mcp/tokens.json`.
- Tidy: the retired `/home/jim/code/mcp_project/gmail-mcp` dir can be deleted (see
  TODO). Remember the live project path is `mcp_project/theposch_gmail-mcp`.

## TODO
- [ ] Delete the retired `/home/jim/code/mcp_project/gmail-mcp` dir (user's call;
      recoverable from git history)
- [ ] Decide on a cleanup label scheme before bulk work (e.g. reuse `000_read`,
      add `000_read/newsletters`, or a `zz-junk` bucket)
- [ ] Optional: patch our clone so `search-by-label` resolves label ID → name
      (upstream bug; workaround is `search-emails "label:<name>"`)
- [ ] Consider publishing the OAuth consent screen to stop 7-day re-auth
- [ ] Optional: add a per-project `.gitignore` in `mcp_project/gmail-mcp`
- [ ] Optional: keep `mcp_project/theposch_gmail-mcp` out of the parent repo
      (`mcp_project` has it as an untracked nested clone)

## PLAN
Clean up Gmail through MCP tools. Short term: the third-party `theposch/gmail-mcp`
server wired into opencode (live now). Fallback if it disappoints: extend our own
minimal `server.py` to add read/label/archive/trash tools.
Working method: small batches, verify after each batch in Gmail, prefer reversible
moves (label first, then archive; `trash-email` last).
