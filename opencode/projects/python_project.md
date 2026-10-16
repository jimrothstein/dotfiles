# Python Project

## TODO

- Jim must ask questions about the python code (studying 220_save_model_json.py line by line; new to Python).

## Project Summary or Memory

- 2026-08-18: Created 220_save_model_json.py following Kaggle "Python - How to Save and Load ML Models" (prmohanty), Approach 3 (Manual Save/Restore to JSON) only. Cleaned up a duplicated `MyLogReg` class block (copy-paste artifact from the tutorial), added a runnable demo that saves a `MyLogReg` instance to `mylogreg.json` and restores it into a fresh object. Added scikit-learn to the venv via `uv add scikit-learn` (scikit-learn 1.9.0). Added `*.json` to .gitignore so generated model files are not committed.
- 2026-10-08: Created 410_simple_transform.py demonstrating linear equation y=3x+2 with x from -1 to 1 in steps of 0.01 (201 points). Table displays 4 columns: x, y, u=tanh(x), v=tanh(y). Plot shows blue line y=3x+2 and red (u,v) points with limits x[-2,2], y[-10,10]. Plot saved to 410_simple_transform_plot.png.

## Decisions

- 2026-08-18: Followed only "Approach 3 - Manual Save and Restore to JSON" from the Kaggle tutorial; user is not interested in pickle/joblib approaches.
- 2026-10-08: Script uses venv Python (.venv/bin/python) as the project standard; matplotlib backend set to non-interactive (Agg) for headless environments. Output saved to PNG file rather than interactive window.

## Current state

- Working examples: 220_save_model_json.py (iris + LogisticRegression JSON save/load) and 410_simple_transform.py (linear equation table + plot with tanh transforms). Verified end-to-end runs with venv Python.

## Decisions

- 2026-08-18: Followed only "Approach 3 - Manual Save and Restore to JSON" from the Kaggle tutorial; user is not interested in pickle/joblib approaches.

## Current state

Working scikit-learn example: iris data split -> subclass `MyLogReg(LogisticRegression)` with `save_json()`/`load_json()` methods -> demo saves and reloads the object from JSON. Verified end-to-end (run `./.venv/bin/python 220_save_model_json.py`).

## Paths chosen

- Learning model serialization with scikit-learn, focusing on manual JSON save/restore for full control over what gets persisted.