# Global opencode rules

## Version control
- Before each change to any project, first git commit the current state (staging all current changes) so there is a clean baseline to revert to.
- Always commit and push our work, and maintain the `project.md` file.

## Project memory
- All project memory files (`project.md`) live in `~/dotfiles/opencode/projects/`.
- In each project root, place a soft link: `ln -s ~/dotfiles/opencode/projects/<project>.md <project_root>/project.md`.
- Do not create `project.md` files anywhere else.
- Every `project.md` must have a section near the top named `NEXT STEPS`.

## Skills
- There is a single canonical skills tree at `~/dotfiles/opencode/skills/`.
- Stale duplicate trees (e.g. `skills/.agents/`, `skills/agent_CHECK/`) must be deleted whenever found. Never keep copies.
- A skill must have a `SKILL.md` (not any other filename) with valid frontmatter.
