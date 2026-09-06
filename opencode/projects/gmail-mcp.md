# gmail-mcp

## Summary
Two things live here: (1) the original self-hosted Gmail MCP **server**
(`server.py`, `auth_gmail.py`) using `google-api-python-client`, and (2) a new
minimal MCP **client** (`client.py`) that connects to **Google's hosted Gmail
MCP server** at `https://gmailmcp.googleapis.com/mcp/v1`. Pivot decided
2026-08-31: user wants the client/hosted-server approach over the local server.

OAuth client shared with old R app (GCP project `light-tribute-354619`).
`credentials.json` and `token.json` are gitignored.

Stack: Python 3.13 project-local `.venv`, `mcp` 2.0.0, `google-api-python-client`
(server.py only), `httpx2` (client.py).

Key files:
- `auth_gmail.py` — one-shot OAuth; writes `token.json` (scope `gmail.modify`).
- `server.py` — self-hosted FastMCP/MCPServer `gmail-organizer` with tools
  `search_messages` and `list_labels` (OLD approach).
- `client.py` — NEW minimal MCP CLIENT connecting to Google's hosted Gmail MCP
  server. Reuses shared `credentials.json` as the pre-registered OAuth client
  (Google hosted MCP does NOT support dynamic client registration). Runs
  authorization-code + PKCE with a local loopback redirect; persists tokens to
  `mcp_tokens.json` (gitignored). Usage: `client.py` (list tools),
  `client.py TOOL '{"args":...}'` (call a tool).

## Decisions
- 2026-08-18: Implemented all four TODO items in server.py: friendly error if
  `token.json` missing (no mention of `auth_gmail.py`), re-auth hint on refresh
  failure, `gmail()` cached via `functools.cache`, and switched the N+1 fetch in
  `search_messages` to `service.new_batch_http_request()`. Why: `batchGet` does
  not exist in the Gmail API (verified live + 404 on REST endpoint); the client
  library's `BatchHttpRequest(url=...)` 404s on the legacy `www.googleapis.com/batch`
  endpoint, so the resource-based `new_batch_http_request()` is the correct form.
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
- 2026-08-31: Re-authenticated Gmail token (deleted stale token.json, ran auth_gmail.py).
  User noted Google still identifies as old R HTTP2 app; wants dedicated OAuth client for
  this project. 
- 2026-08-31: Added a second upstream-SDK/Google quirk patch to client.py: Google
  advertises `authorization_response_iss_parameter_supported` but omits `iss` in
  the redirect, and mcp 2.0.0's `validate_authorization_response_iss` rejects a
  missing `iss` in that case, aborting OAuth. Patched `_oauth2` to tolerate a
  missing `iss` (same monkeypatch style as the trailing-slash fix). Why: required
  to complete auth.
- 2026-08-31: Verified client.py end to end. `gmailmcp.googleapis.com` + `gmail.googleapis.com`
  were enabled (user, in GCP); a tool call then returned 403: "project ... is enrolled in the
  Google Workspace Developer Preview Program" — the hosted Gmail MCP is public-preview-only and
  the project must be enrolled (external, days). CLI request uses scopes
  gmail.modify/readonly/labels/metadata + full mail.google.com (broader than the doc's
  recommended readonly+compose).
- 2026-08-31: Review directive from user: be terse; when running bash say only "running bash script"
  (no code, no output); when editing files say only one line, don't display edits. Kept code simple,
  mcp 2.0.0 only, no extra code. (Also recorded in global AGENTS.md.)
- 2026-08-18: Removed `ailang-docs` MCP server from opencode global config
  (commit dd3bf3 in ~/dotfiles). Why: AILANG is pre-1.0 with ~33 GitHub stars /
  no adoption; keeping the MCP loaded wasted context tokens every session.
  AILANG learning remains a possible future TODO (research topic, not now).

## NEXT STEPS
- **Blocked: the hosted Gmail MCP server (`gmailmcp.googleapis.com`) is DEAD
  END for us.** It is gated behind the Google Workspace Developer Preview Program,
  which requires a non-Gmail/org account to enroll — user cannot enroll. Do NOT
  pursue the hosted client.py further.
- Viable direction is SELF-HOSTED Gmail MCP (talks to Gmail REST API, no preview
  gate). Candidates: our existing `server.py` (already written, minimal effort,
  recommended), `theposch/gmail-mcp` (feature-rich single-file), or `mcp-gmail`
  (PyPI). User chose to PAUSE — decide which self-hosted path next session.
- Note: `client.py` auth was fully verified end-to-end (OAuth + PKCE + tools/list
  work; only tools/call was blocked by preview-enrollment).

## TODO
(none pending)

## PLAN
Goal: an MCP client that can read/act on Gmail. **Hosted Google Gmail MCP server
is unusable (requires Workspace Developer Preview Program enrollment; user cannot
enroll with a gmail.com account).** Pivot to SELF-HOSTED Gmail MCP server talking
to the Gmail REST API (no preview gate), reusing the shared OAuth client. Keep
code minimal on mcp 2.0.0, no extra code.