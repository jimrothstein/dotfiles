# Global opencode rules

## Configuration layout
- All opencode configuration files live in `~/dotfiles/opencode/`.
- `~/.config/opencode/` is a symlink to `~/dotfiles/opencode/` — edit files there (e.g. `opencode.jsonc`), never create separate copies.
- The global config file is `~/dotfiles/opencode/opencode.jsonc` (not `.json`).

## Version control
- Before making any change to a project or AGENTS.md, first git commit the current state (staging all changes) to create a clean baseline.
- Always commit and push your work.


## project.md

### Project memory / project summary
- All project memory files (`project.md`) live in `~/dotfiles/opencode/projects/`.
- In each project root, place a soft link: `ln -s ~/dotfiles/opencode/projects/<project>.md <project_root>/project.md`.
- Do not create `project.md` files anywhere else.
- Maintain exactly one `project.md` per project. If the user says there is no project.md or this is not a project, skip this.
- For each project's AGENTS.md, you may update: PROJECT SUMMARY (most frequently, even multiple times per session), TODO (as needed), and NEXT STEPS (as needed). Update PLAN only on request.
- The user may request updates; if forgotten, still keep relevant sections current.

### Structure (sections) of each projects.md

Sections for each project.md may include:

- <NAME>      -     name of project
- <PROJECT SUMMARY> -   
- <NEXT STEPS>- Tasks to do at very next session (unless user says not to)
- <TODO>      - Tasks to do at some future time; terse; use [ ]  (checkbox) for each task.
- <PLAN>      - What is direction of project/What is long-term goal? (seldom updated;  user will tell you)


### Updating project.md file
- Keep PROJECT SUMMARY (dated, bullet points - only major decisions/achievements), NEXT STEPS, and TODO current. Update PROJECT SUMMARY as often as needed (possibly multiple times per session).
- Update TODO and NEXT STEPS only as needed. Update PLAN only on request.
- Do not add separate files for TODO/PLAN/NEXT STEPS; if found, ask whether to merge into project.md.
- PROJECT SUMMARY must be terse - not instructions to recreate the project. Include date and only essential context.

## Terse output to screen
- Default to terse (one line). For intermediate steps ("thinking", "testing", "checking", "searching", "reading"), output only the action name.
- When running commands or editing files, output only status (e.g. "running bash script" or "editing ..."); do not show command output or file diffs.
- Report conclusions, recommendations, problems, or needs to the user. Be detailed only when explicitly requested ("explain", "more detail", "I do not understand").

## Skills
- There is a single canonical skills tree at `~/dotfiles/opencode/skills/`.
- Stale duplicate trees (e.g. `skills/.agents/`, `skills/agent_CHECK/`) must be deleted whenever found. Never keep copies.
- A skill must have a `SKILL.md` (not any other filename) with valid frontmatter.
