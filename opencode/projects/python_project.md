# Python Project

## TODO

- Jim studying Python step by step (new to Python; asks questions, code reviewed chunk by chunk).

## Project Summary or Memory

- 2026-08-18: Created 220_save_model_json.py following Kaggle "Python - How to Save and Load ML Models" (prmohanty), Approach 3 (Manual Save/Restore to JSON) only. Cleaned up a duplicated `MyLogReg` class block (copy-paste artifact from the tutorial), added a runnable demo that saves a `MyLogReg` instance to `mylogreg.json` and restores it into a fresh object. scikit-learn added to venv (`uv add scikit-learn`, 1.9.0). `*.json` gitignored.
- 2026-10-08: Created 410_simple_transform.py demonstrating y=3x+2 with x from -1..1 step 0.01 (201 pts). Table: x, y, u=tanh(x), v=tanh(y). Plot: blue line y=3x+2, red (u,v) points, limits x[-2,2] y[-10,10] → 410_simple_transform_plot.png.
- 2026-10-12: Created transform/110_basic_grid.py (matplotlib axes, grid; blue rectangle; title "Transformed Rectangle"); applied horizontal shear x' = x + y to rectangle. transform/120_linear_transform.py copied onward (commits 3406, 3d8e, 7802, 121a).
- 2026-10-20: Created 520_nonlinear_transform.py: unit square plot; nonlinear transform f=(x²−y², 2xy) on square perimeter; 5 random interior points transformed; horizontal segment y=0.2 transformed. PNG outputs saved.
- 2026-11-05: Started ML for Dummies 3e work (ch10, `Dummies/ch10/`). Created 110_tennis_dt.py: loads tennis.csv (14 rows) from lmassaron GitHub, one-hot encodes, fits DecisionTreeClassifier(random_state=0). Root split verified = `outlook_Overcast` (pure 4/4 play=1). venv (Dummies/ch10/.venv) got pandas 3.1.1, scikit-learn 1.9.1, polars 2.1.0, dtreeviz 2.3.2 (system graphviz `dot` 2.42.4 OK). Note: pandas 3 get_dummies yields True/False; use `dtype=int` for 0/1.

## Decisions

- 2026-08-18: Only "Approach 3 - Manual Save/Restore to JSON"; no pickle/joblib.
- 2026-10-08: venv Python (.venv/bin/python) is the project standard; matplotlib backend Agg (headless); outputs saved to PNG, not interactive windows.
- 2026-11-05: Next ch10 session continues in **polars** (user decision). Merged transform_project.md into this file (one project.md per repo), symlink repointed.

## Current state

- Working examples: 220_save_model_json.py (iris + LogisticRegression JSON save/load), 410_simple_transform.py, 520_nonlinear_transform.py, transform/110_basic_grid.py + 120_linear_transform.py (rectangle shear, area preserved 0.5), Dummies/ch10/110_tennis_dt.py (tennis decision tree). All verified end-to-end with venv Python.

## NEXT STEPS

- Next session: continue ch10 decision-tree tutoring (110_tennis_dt.py) but convert the workflow to **polars** (user decision 2026-11-05).
- TODO
  - [ ] Rewrite 110_tennis_dt.py X/one-hot encode step in polars (or `pl.to_pandas()` bridge for sklearn)
  - [ ] Visualize tennis tree with dtreeviz
  - [ ] ch10: next scripts after 110 (ID3/cart examples, per ml4dummies_3ed book)
  - [ ] transform/: consider matrix representation for shear; compare areas (shoelace/determinant)

## Paths chosen

- Learning model serialization with scikit-learn, focusing on manual JSON save/restore for full control over what gets persisted.
- ML for Dummies 3e (lmassaron ml4dummies_3ed repo) as study curriculum; chunk-by-chunk tutoring format.
