# Global opencode rules

## Version control
- Before making a change to any project, first git commit the current state (staging all current changes) so there is a clean baseline to revert to.
- Always commit and push our work, and maintain the `project.md` file.

## Project memory
- All project memory files (`project.md`) live in `~/dotfiles/opencode/projects/`.
- In each project root, place a soft link: `ln -s ~/dotfiles/opencode/projects/<project>.md <project_root>/project.md`.
- Do not create `project.md` files anywhere else.
- This project.md file is important and may include sections for:
  - NEXT STEPS (items we hope to do at very next session)
  - TODO (items to do in future, perhaps next session but could be at an unknown future session )
  - PLAN (long-term goal, not list of TODOs. How, at this moment, we see the work in this project evolving)
  - Project Summary or Memory. Brief description of key decisions, actions we did today.
- You must keep the project.md file up-to-date. The user may say "update the
  project file or update the project summary".  But if user forgets, you must
  still do this.  
- Always append to "Project Summary or Memory".
- After each session or after major changes, you should keep the NEXT STEPS and TODO up-to-date. 
- Occasionally, "PLAN" may be updated, but the user will
  usually ask you to do this.
- Each project has just one project.md.  Do not add additional files for TODO
  or plan or planning or next step.  If you see a file like this, ask the user if the
  contents should be added to project.md file.

## Skills
- There is a single canonical skills tree at `~/dotfiles/opencode/skills/`.
- Stale duplicate trees (e.g. `skills/.agents/`, `skills/agent_CHECK/`) must be deleted whenever found. Never keep copies.
- A skill must have a `SKILL.md` (not any other filename) with valid frontmatter.
