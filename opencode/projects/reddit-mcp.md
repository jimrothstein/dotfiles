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
- 2026-09-17: SWITCHED OFF PRAW to the RSS-only approach (Path B).
  Why: Reddit now blocks creating a script app with a robot/captcha loop
  and requires Data API registration. `saved.py` rewritten to use the
  private saved-links RSS feed (`REDDIT_SAVED_RSS_URL` from
  reddit.com/prefs/feeds/) via `feedparser` + stdlib urllib.
  - Constraints: read-only (no unsave/delete), ~100 most recent saved
    items, sortable/filterable. PRAW removed; deps now feedparser +
    python-dotenv only.
  - `saved.py` parses title, link, subreddit (regex from content/link),
    post id, published time; `list [--keyword] [--limit] [--json]`.
  - Verified parsing against a mock entry; CLI help/compile OK.
- 2026-09-17: Switched feed format to JSON (`saved.json?feed=...`) instead of
  RSS. Why: JSON is the structured-data standard on Reddit's feeds page (prefs/feeds
  has both RSS and JSON buttons), richer fields (id, subreddit, permalink,
  selftext, created_utc), no XML parsing. `feedparser` dependency dropped
  (stdlib `json` + `urllib` only).
  - `REDDIT_SAVED_RSS_URL` still auto-converts to `.json` (`.rss?` -> `.json?`);
    optional `REDDIT_SAVED_JSON_URL` override.
  - Skips non-post children (kind != t3, e.g. saved comments).
  - Test caught a bug: `kind` lives on the child object, not inside `data`;
    fixed. Verified URL transform + payload parsing with mock backend.
- 2026-09-17: Live test of the feed: public `.rss` works (200) but public
  `.json` is 403 (keyless .json shutdown May 2026). Private saved feed
  (both .rss and .json) returned 403/cxn-reset from curl/urllib with any UA,
  yet renders fine logged-in in a browser (sample shows `kind Listing`,
  dist 100). Conclusion: the feed token is valid but Reddit now requires the
  account's `reddit_session` cookie on top of the token. Added
  `REDDIT_SESSION_COOKIE` support to `saved.py` (Cookie header added when set).

## NEXT STEPS
- Copy `reddit_session` cookie value from browser DevTools (Application ->
  Cookies -> reddit.com) into `.env` as `REDDIT_SESSION_COOKIE`, then
  `uv run python saved.py list --keyword mcp`.

## TODO
- Live-test against the real feed.
- If delete/unsave ever becomes important: register for Data API (Path A)
  or pursue a browser-session-cookie approach.

## PLAN
- Small, simple, keyless RSS-based tool for listing/searching saved posts.
  No MCP server. No web framework.