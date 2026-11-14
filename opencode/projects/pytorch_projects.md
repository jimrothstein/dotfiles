# pytorch_projects

## Project Summary / Memory

- 2026-11-10: **Environment cleanup (Option 1 — fresh start)**: deleted 12 GB of venvs (root `.venv` 5.3G CUDA duplicate, root stray py3.13 venv `bin/lib/include/share`, `play/.venv` 5.3G CUDA, `orbital/.venv` 13M). Baseline commit `e620` beforehand. Repo now **1.3 GB**, single env at `play/.venv` with torch 2.15.0+**cpu** via `[[tool.uv.index]] pytorch-cpu` + `[tool.uv.sources]` in `play/pyproject.toml`. Deps: torch, polars, numpy, transformers (+ ipykernel dev). All play scripts verified running; `torch.cuda.is_available() == False`.
- 2026-11-10: Fixed `play/tensors.py`: `impart polars` typo removed; polars 2.x `to_torch(return_type="dict", label="label")` → unpack via `out["features"], out["label"]` (old `return_type="tensor", label=` API invalid in polars 2.x).
- 2026-09-09: Learning session on Posit's **orbital** package (R + Python; Python version converts trained scikit-learn pipelines and PyTorch feed-forward nets into pure SQL so predictions run inside a database without a Python runtime).
- 2026-10-21: Created GitHub repo jimrothstein/pytorch_projects and pushed initial commit (source scripts + .gitignore; venv and nested gym_game/orbital excluded).
- First working end-to-end example: `orbital/110_orbital_sum.py` — a tiny `Linear(2,3)→ReLU→Linear(3,1)` net trained to add two numbers; converted via `orbital.parse_pytorch_model(model, features)` and `orbital.export_sql("MY_TABLE", pipeline, dialect="duckdb")`; SQL executed in DuckDB. Works from zsh via venv.
- The generated SQL unrolls the trained weights/biases as column arithmetic (visible as `WITH "t1"/"t2"/"t3"` CTEs); `GREATEST/CASE WHEN <0` implements ReLU.
- Learned: model extrapolates poorly — `(3,4)` (sum 7.0) gave 3.88 because training inputs were ~N(0,1). In-range inputs needed for accurate prediction.

## Decisions

- 2026-11-10: Option 1 chosen — keep only `*.py` + git-tracked files, delete all venvs, rebuild one fresh CPU-only uv env in `play/`. orbital deps (`orbital[pytorch] duckdb`) deliberately NOT reinstalled yet — user OK'd deferring. `orbital/110_orbital_sum.py` will fail until then.
- 2026-09-09: Use a shared venv for all Python projects (`~/code/pytorch_projects/.venv`), selected per-project in Positron or invoked directly from zsh. Why: avoid reinstalling torch (~2 GB) per project; system python is externally managed (PEP 668). *(Superseded 2026-11-10: single env at `play/.venv`)*
- 2026-09-09: Install command for orbital: `pip install 'orbital[pytorch]' duckdb` (quotes needed in zsh; brackets are a glob).

## Current state

Clean repo (commits `e620`, `d50b`): only scripts, `play/` uv project (CPU torch), `gym_game/`, `install_pytorch.sh` (now obsolete — root venv it created is deleted). Repo 1.3 GB, was 12 GB.

## NEXT STEPS

- User re-selects `play/.venv` interpreter in Positron.
- Reinstall orbital deps when needed: `uv add 'orbital[pytorch]' duckdb` in `play/`, then re-verify `110_orbital_sum.py`.

## TODO

- [ ] Add orbital deps to `play/` and re-verify `orbital/110_orbital_sum.py` (in-range inputs `0.5 -0.3` → 0.2).
- [ ] Delete obsolete `install_pytorch.sh` (root venv gone).
- [ ] Explore orbital further: scikit-learn pipelines, other dialects (snowflake, postgres), `parse_pipeline` for sklearn models.
- [ ] Possibly learn R version of orbital (tidymodels workflows → SQL).