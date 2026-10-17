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

## NEXT STEPS
- [x] Set HF_TOKEN environment variable with HuggingFace API token
- [x] Verify connection and test MCP tools (via Python client)
- [x] Confirm `huggingface` remote server connects (tools load; note: was anonymous)
- [ ] Fully quit + relaunch OpenCode (not just `service restart`) so TUI/service inherit `HF_TOKEN`; then verify `hf_whoami` → authenticated (`jimrothstein`)
- [ ] Explore available HF tools (endpoints, models, spaces)

## TODO
- [ ] Document useful HF MCP tools for common workflows
- [ ] Test with OpenCode agent to manage HF endpoints

## GOAL
Experiment with HuggingFace MCP server integration in OpenCode for managing HF endpoints, models, and spaces through MCP tools.