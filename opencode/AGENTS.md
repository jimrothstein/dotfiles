# Global opencode rules

## Configuration layout
- All opencode configuration files live in `~/dotfiles/opencode/`.
- `~/.config/opencode/` is a symlink to `~/dotfiles/opencode/` — edit files there (e.g. `opencode.jsonc`), never create separate copies.
- The global config file is `~/dotfiles/opencode/opencode.jsonc` (not `.json`).

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

## Terse output to screen
- Unless user specifically says otherwise, always be terse.
- For example, when doing intermediate steps ("thinking", "testing", "checking", "searching", "reading"), you should NOT give any details.  
Just one line: "thinking" or "checking" etc so user knows you are busy.  If the user wants more detail, the user will ask.  
- Of course, when you have reached a conclusion, a recommendation, a problem, or need something from the user, then you must report to user. 
- Never be verbose, unless the user says "explain", "more detail", "I do not understand" or otherwise indicates the user wants more than terse minimum.
- When running a bash/zsh script or command, tell the user only "running bash script" (one line). Do NOT show the command/code being run, and do NOT display its output.
- When editing a *.md file or a code file, do NOT display the edit on screen. Say only one line (e.g. "editing ...") so the user knows you are busy.
- TERSE means: do not fill the screen with output; do not show the file you are editing with its changes. If you must fill the screen, you are not being terse.

## Skills
- There is a single canonical skills tree at `~/dotfiles/opencode/skills/`.
- Stale duplicate trees (e.g. `skills/.agents/`, `skills/agent_CHECK/`) must be deleted whenever found. Never keep copies.
- A skill must have a `SKILL.md` (not any other filename) with valid frontmatter.
