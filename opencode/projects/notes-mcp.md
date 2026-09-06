# notes-mcp

Notes MCP server built with the official `mcp` SDK (`MCPServer`).

## Project Summary
- Python MCP server (`server.py`) exposing tools to manage notes stored in a local `notes.json`: `search_notes`, `add_note`, `update_note`, `delete_note`, `get_all_notes`, plus `get_weather`, `search_docs`, and `fetch_page`; a resource `notes://all`; and a prompt `plan_my_day`.
- 2026-08-29: Fixed `uv run mcp dev server.py` failure: `Expected a Python module at: src/notes_mcp/__init__.py`.
  - Root cause: `uv_build` build backend expects a `src/notes_mcp` package because `[project.scripts] notes-mcp = "notes_mcp:main"` exists, but no such package was present.
  - Fix: created `src/notes_mcp/` package with `__init__.py`, `main.py`, `server.py`. Root `server.py` is now a thin wrapper (`from notes_mcp.server import mcp; mcp.run()`).
  - Also fixed latent bugs while moving files: `NOTES_PATH` now resolves to project root via `Path(__file__).resolve().parent.parent.parent`; re-enabled `httpx` import; made `fetch_page` import optional (guarded) and `rag.retrieve` imported lazily inside `search_docs` since those modules don't exist yet.
  - Verified: `uv build` succeeds, `uv run notes-mcp` prints `Hello from notes-mcp!`, `notes_mcp.server` imports, `mcp run server.py` exits cleanly.
- GOTCHA: the global `~/.gitignore` has a `_*` pattern (line 51) that ignores `__init__.py`. Had to `git add -f src/notes_mcp/__init__.py` to stage it. This will bite again for any `_*` package files. Consider scoping that rule.
- 2026-09-05: Fixed `uv run mcp dev server.py` failing with `failed to spawn 'mcp'`: the venv was stale from when the project lived at the old path (`/home/jim/code/notes-mcp`), leaving a broken shebang in `.venv/bin/mcp`. Fix: `rm -rf .venv && uv sync`.
- 2026-09-05: Registered `notes` MCP server in `~/dotfiles/opencode/opencode.jsonc` as a local server (`uv run --directory /home/jim/code/mcp_project/notes-mcp python server.py`, `cwd` = project root). Verified live in opencode: get_all_notes works.
- 2026-09-05: Made `search_notes` case-insensitive substring match on title (was exact/empty-match style). Note: an already-connected MCP session keeps the old code until the server is restarted/reconnected.

## NEXT STEPS
- Decide how to actually run the server: `uv run mcp dev server.py` (via root wrapper) or the `notes-mcp` console script.
- `fetch_page` and `rag`/`retrieve` modules are referenced but do not exist yet (tools return error strings). Build them or remove the tools.
- Commit the current state (repo has no commits yet); consider adding a git remote for pushes.

## TODO
- Implement `fetch_page.py` (page fetcher) and `rag.py` (`retrieve(query, top_k)`) if the docs-searching features are wanted.
- Decide on transport: stdio (default) vs streamable-http (currently commented out in `if __name__ == "__main__"`).

## PLAN
- Keep as a working Notes MCP server, growing tools/resources as needed.
