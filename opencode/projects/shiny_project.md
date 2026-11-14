# shiny_project

## PROJECT SUMMARY
- 2026-11-12: Started chatlas exploration (`chatlas/` dir). Toy app `chatlas/110_chatlas_simple.py` uses `ChatOpenRouter` with free model `particle-ai/particle-1:free` (chat + tool calling verified working). Chose particle-1 because google/gemma free pools returned upstream 429s.
- Environment: project `.venv` (uv, Python 3.14.3), `chatlas==0.23.0`. API key: `OPENROUTER_API_KEY` in `~/dotfiles/.zshrc_secret`. Positron interpreter: `.venv/bin/python`.

## NEXT STEPS
- Experiment with more chatlas features: streaming, structured data, multi-turn.

## TODO
- [ ] Retry `google/gemma-4-31b-it:free` when the shared free pool isn't rate-limited.

## GOAL
- Learn chatlas (Posit's Python LLM chat library) using free OpenRouter models.
