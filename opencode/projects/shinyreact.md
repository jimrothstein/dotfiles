# shinyreact

## PROJECT SUMMARY
- 2026-10-24: Built no-build React UI for faithful histogram app (130_shinyexpress_faithful.py): slider 1-50 bins, SVG histogram, loading/recalc dimming, error display. Factored binning into faithful.py. Added tests (pure + local_server). Fixed unset input guard.
- 2026-10-26: 150_iris_filter.py now loads iris from scikit-learn (load_iris) instead of embedded IRIS_ROWS; column names derived from feature_names. Heavy-module cache added for test_server reloads. 4 tests pass.

## NEXT STEPS
- Verify histogram renders in browser; tune SVG axes.
- Consider Vite tier if more components needed.

## TODO
- [ ] Add client-side (jsdom) test for www/ui.js wire ids
- [ ] Keep 100_simple hello UI (currently overwritten by shared ui.js)

## GOAL
Learn shinyreact ui.tsx pattern with Python Express apps.
