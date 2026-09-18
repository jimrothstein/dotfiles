# reddit-mcp

List, search, and organize saved Reddit posts using PRAW.
(Not actually using MCP — PRAW chosen over an MCP server because no MCP server
offers unsave/delete or full saved-post history.)

## Project Summary
- 2026-09-17: Project created at `~/code/mcp_project/reddit-mcp`.
- Decided to use PRAW directly rather than a Reddit MCP server.
  Why: `reddit-mcp-ai` only supports read-only `get_saved_posts` via RSS
  (most recent ~100, no full text, no delete/unsave). PRAW gives full
  pagination, full post text, filter/search, and `.unsave()`.
- Requires a Reddit script app (client_id/client_secret/username/password).
- Goal: a small CLI/script that lists saved posts, filters by keyword
  (e.g. "mcp"), and can unsave/delete selected posts.

## NEXT STEPS
- Create credentials `.env` (script app from reddit.com/prefs/apps) and a
  `saved.py` script using PRAW.
- Decide how credentials are stored (env file, gitignored).

## TODO
- (first session) scaffold `saved.py` with list / search / delete subcommands.

## PLAN
- Small, simple PRAW-based tool. No MCP server. No web framework.