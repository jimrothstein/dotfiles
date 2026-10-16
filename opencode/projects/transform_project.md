# transform_project

## PROJECT SUMMARY
- **Date:** 2026-10-12
- **Activities:** Created `110_basic_grid.py` with matplotlib graph (axes, grid, title, legend); removed sine wave, added blue rectangle; applied horizontal shear transformation `x' = x + y` to rectangle; changed title to "Transformed Rectangle"
- **Files modified:** `transform/110_basic_grid.py`, `transform/120_linear_transform.py`
- **Commits:** 3406 (110_basic_grid), 3d8e (120_linear_transform copy), 7802 (shear correction), 121a (title update)

## TODO
- [ ] Review python code together (NEXT STEPS item 1)
- [ ] Consider using matrices for transformation representation
- [ ] Compare areas: before (rectangle area = 0.5) and after (sheared parallelogram area = 0.5, preserved under shear)
- [ ] Decide on final naming for the project (transform_project vs python_project association)
- [ ] Verify soft link setup: `ln -s ~/dotfiles/opencode/projects/transform_project.md <project_root>/project.md`

## NEXT STEPS
1. **Review python code together** — Examine `110_basic_grid.py` and `120_linear_transform.py`; discuss structure, choices, and potential refinements
2. **Consider using matrices** — Represent the shear transformation `x' = x + y, y' = y` as a matrix; explore matrix multiplication approach for transforming shapes
3. **Compare areas: before and after transform** — Rectangle area = 0.5; sheared parallelogram area = 0.5 (shear preserves area); verify with shoelace formula or determinant of transformation matrix

## GOAL
Document the evolution of the `110_basic_grid` → `120_linear_transform` code lineage, the affine/shear transformation concepts applied, and the geometric properties (area preservation, vertex mapping) for reference and potential extension to other transformation types.