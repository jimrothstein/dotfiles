# hf-mcp

## PROJECT SUMMARY
- 2026-10-15: Created project for experimenting with HuggingFace MCP server in OpenCode
- 2026-10-15: Added remote MCP server config to opencode.jsonc using HF token via env var
- 2026-10-15: Project directory created at ~/code/mcp_project/hf-mcp
- 2026-10-15: Committed config to git, pushed to origin
- 2026-10-15: HF_TOKEN confirmed set in environment
- 2026-10-15: Built Python MCP client `hf_client.py` (uv project) connecting to the HF remote MCP over streamable HTTP with `Authorization: Bearer $HF_TOKEN`. Verified: lists 4 tools (hf_whoami, hub_repo_search, hub_repo_details, hf_fs); `whoami` and `hub_repo_search` calls succeed (exit 0).
- 2026-10-15: Note — Python `mcp` SDK 2.3.0 uses `httpx2` (not `httpx`); `streamable_http_client(url, *, http_client=None, terminate_on_close=True, max_sse_event_size=...)` yields a 2-tuple. Headers/timeouts go on an `httpx2.AsyncClient`.

## NEXT STEPS
- [x] Set HF_TOKEN environment variable with HuggingFace API token
- [x] Verify connection and test MCP tools (via Python client)
- [ ] Restart OpenCode / run `/mcps` to confirm the built-in `huggingface` remote server shows connected
- [ ] Explore available HF tools (endpoints, models, spaces)

## TODO
- [ ] Document useful HF MCP tools for common workflows
- [ ] Test with OpenCode agent to manage HF endpoints

## GOAL
Experiment with HuggingFace MCP server integration in OpenCode for managing HF endpoints, models, and spaces through MCP tools.