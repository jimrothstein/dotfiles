# hf-mcp

## PROJECT SUMMARY
- 2026-10-15: Created project for experimenting with HuggingFace MCP server in OpenCode
- 2026-10-15: Added remote MCP server config to opencode.jsonc using HF token via env var
- 2026-10-15: Project directory created at ~/code/mcp_project/hf-mcp
- 2026-10-15: Committed config to git, pushed to origin
- 2026-10-15: HF_TOKEN confirmed set in environment
- 2026-10-15: Built Python MCP client `hf_client.py` (uv project) connecting to the HF remote MCP over streamable HTTP with `Authorization: Bearer $HF_TOKEN`. Verified: lists 4 tools (hf_whoami, hub_repo_search, hub_repo_details, hf_fs); `whoami` and `hub_repo_search` calls succeed (exit 0).
- 2026-10-15: Note — Python `mcp` SDK 2.3.0 uses `httpx2` (not `httpx`); `streamable_http_client(url, *, http_client=None, terminate_on_close=True, max_sse_event_size=...)` yields a 2-tuple. Headers/timeouts go on an `httpx2.AsyncClient`.
- 2026-10-17: `huggingface` MCP connected but **anonymous** — `{env:HF_TOKEN}` absent from OpenCode's process env. Root cause: nothing sourced `~/dotfiles/.zshrc_secret` (holds the valid `HF_TOKEN`); `~/.zshenv` had it commented out.
- 2026-10-17: Latent bug found — `$ZDOTDIR/.zshenv` (`~/.config/zsh/.zshenv`) was missing, so `~/.zshenv` was skipped in every descendant shell (ZDOTDIR already set). `.zshenv` only ever took effect in the first shell of a session.
- 2026-10-17: Fixed — `.zshenv` now sources `~/dotfiles/.zshrc_secret`; added symlink `~/.config/zsh/.zshenv -> ~/dotfiles/.zshenv`. Verified `HF_TOKEN` present (len 37) in fresh / interactive / descendant shells; token valid vs HF API (whoami-v2 → 200, user `jimrothstein`). Committed+pushed `.zshenv` (reference only, no secret).
- 2026-10-17: `opencode service restart` does NOT re-resolve env (new service inherits stale env from the TUI parent) → a full OpenCode relaunch is required to authenticate.
- 2026-10-17: `huggingface` MCP now **authenticated** — `hf_whoami` returns user `jimrothstein` (is_pro false, no orgs). Confirms the `.zshenv`/`HF_TOKEN` fix works end-to-end.
- 2026-10-17: Cataloged the full HF MCP toolset — exactly **4 tools**: `hf_whoami`, `hub_repo_search`, `hub_repo_details`, `hf_fs`. There is **no inference/chat tool**: the server is read-only Hub access (browse, metadata, files) and cannot run/serve models. Free model calls therefore require a separate provider (Groq, NVIDIA NIM, OpenRouter, OpenCode Zen).
- 2026-10-17: Learned the `hf_fs` model — an `hf://` virtual filesystem with roots `models`, `datasets`, `spaces`, `buckets`, `collections`, `papers`, `docs`; ops `ls`, `cat`, `attach`, `stat`, `find`, `search`. Limits: ≤30 ops/call; `cat` ≤80KB; `search` default 100 (docs 5); `ls`/`find` default 1000. Use `search` for global discovery, `find` for traversal inside one repo/scope.
- 2026-10-17: Picked 3 beginner docs to read (located via `hf_fs` on `hf://docs/hub`): `hf://docs/hub/repositories` (core Git-repo model), `repositories-getting-started`, `models-the-hub`.

## NEXT STEPS
- [x] Set HF_TOKEN environment variable with HuggingFace API token
- [x] Verify connection and test MCP tools (via Python client)
- [x] Confirm `huggingface` remote server connects (tools load; note: was anonymous)
- [x] Fully quit + relaunch OpenCode (not just `service restart`) so TUI/service inherit `HF_TOKEN`; then verify `hf_whoami` → authenticated (`jimrothstein`) — done 2026-10-17
- [x] Explore available HF tools — cataloged full toolset (4 tools) and `hf_fs` operations — done 2026-10-17

## TODO
- [ ] Document useful HF MCP tools for common workflows
- [ ] Test with OpenCode agent to manage HF endpoints

## GOAL
Experiment with HuggingFace MCP server integration in OpenCode for managing HF endpoints, models, and spaces through MCP tools.