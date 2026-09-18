# reddit-mcp

List, search, and organize saved Reddit posts using PRAW.
(Not actually using MCP — PRAW chosen over an MCP server because no MCP server
offers unsave/delete or full saved-post history.)

## Project Summary
- 2026-09-17: Project created at `~/code/mcp_project/reddit-mcp`.
  Decided to use PRAW directly rather than a Reddit MCP server.
  Why: `reddit-mcp-ai` only supports read-only `get_saved_posts` via RSS
  (most recent ~100, no full text, no delete/unsave). PRAW gives full
  pagination, full post text, filter/search, and `.unsave()`.
- 2026-09-17: Scaffolded `saved.py` (CLI via argparse):
  - `list [--keyword] [--limit] [--json]` — prints/filters saved posts.
  - `delete KEYWORD [--yes]` — unsave posts whose title/selftext/subreddit
    matches keyword, with confirmation prompt.
  - `delete-ids ID... [--yes]` — unsave by post id.
  - Credentials via env vars or `.env` (gitignored); `.env.example` committed.
  - Project uses `uv` (praw 8.0.3, python-dotenv); python >=3.12.
  - Git repo initialized and committed.
  - Added to shared GitHub monorepo `jimrothstein/mcp_project` (as
    `reddit-mcp/` subdir); project `project.md` symlink + memory file created.
- Requires a Reddit script app (client_id/client_secret/username/password).

## NEXT STEPS
- Create `.env` with real credentials (copy `.env.example`, fill in from
  reddit.com/prefs/apps) and run `uv run python saved.py list` to verify.

## TODO
- Live-test list / delete against a real account.

## PLAN
- Small, simple PRAW-based tool. No MCP server. No web framework.