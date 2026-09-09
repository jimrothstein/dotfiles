# pytorch_projects

## Project Summary / Memory

- 2026-09-09: Learning session on Posit's **orbital** package (R + Python; Python version converts trained scikit-learn pipelines and PyTorch feed-forward nets into pure SQL so predictions run inside a database without a Python runtime).
- First working end-to-end example: `orbital/110_orbital_sum.py` — a tiny `Linear(2,3)→ReLU→Linear(3,1)` net trained to add two numbers; converted via `orbital.parse_pytorch_model(model, features)` and `orbital.export_sql("MY_TABLE", pipeline, dialect="duckdb")`; SQL executed in DuckDB. Works from zsh via venv.
- The generated SQL unrolls the trained weights/biases as column arithmetic (visible as `WITH "t1"/"t2"/"t3"` CTEs); `GREATEST/CASE WHEN <0` implements ReLU.
- Learned: model extrapolates poorly — `(3,4)` (sum 7.0) gave 3.88 because training inputs were ~N(0,1). In-range inputs needed for accurate prediction.

## Decisions

- 2026-09-09: Use a shared venv for all Python projects (`~/code/pytorch_projects/.venv`), selected per-project in Positron or invoked directly from zsh. Why: avoid reinstalling torch (~2 GB) per project; system python is externally managed (PEP 668).
- 2026-09-09: Install command for orbital: `pip install 'orbital[pytorch]' duckdb` (quotes needed in zsh; brackets are a glob).

## Current state

`orbital/110_orbital_sum.py` runs cleanly from the shell; next step is testing with in-range inputs (`0.5, -0.3` → 0.2) to see an accurate prediction.

## NEXT STEPS

- Rerun script with in-range test values to confirm the net predicts accurately in-distribution.

## TODO

- Explore orbital further: scikit-learn pipelines, other dialects (snowflake, postgres), `parse_pipeline` for sklearn models.
- Possibly learn R version of orbital (tidymodels workflows → SQL).