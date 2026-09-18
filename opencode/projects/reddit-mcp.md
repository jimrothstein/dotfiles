# reddit-mcp

List, search, and organize saved Reddit posts via Reddit's private saved
feed (JSON), authenticated with your `reddit_session` cookie. No API app
or Data API registration needed. (MCP was explored first; plain Python
chosen because no MCP server offers delete/unsave or full saved history.)

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
- 2026-09-17: WORKING live. With `REDDIT_SESSION_COOKIE` set, `list` fetches
  jimrothstein's saved posts. List output improved: clickable full URLs
  (permalink + external content link), saved date (YYYY-MM-DD), post id,
  subreddit, title. Verified against real account (r/opencode, r/medicare,
  r/learnmath posts). Committed/pushed to local repo + mcp_project monorepo.

## NEXT STEPS
- Brainstorm + implement more useful features (see TODO).
- Possibly pursue unsave/delete: the session cookie grants write-ish access;
  legacy POST /api/unsave on www.reddit.com with `id=t3_..` + modhash (from
  GET /api/me.json) may work without Data API registration. Test cautiously.

## TODO
- Ideas to make it more useful:
  - Export to CSV / Markdown / JSON file for archiving.
  - Stats + grouping by subreddit (what do I save the most of?).
  - Selftext preview; extra columns: author, domain, NSFW, score.
  - Local storage so history survives the ~100-item feed window.
  - Per-post unsave/delete (via cookie+modhash, or manual link printout).
  - Optional MCP wrapper exposing the feed as a tool (project name is reddit-mcp).

## PLAN
- Grow from list/search into a personal saved-posts manager: richer display,
  export, stats, and (if workable) unsave via the session cookie — plus an
  optional MCP server wrapper.