# Global opencode setup — to-do

## Done
- All configuration, skills, and agents live in `~/dotfiles/opencode/`; `~/.config/opencode` is a soft link to it.
- Stale duplicate skill trees deleted (`skills/.agents/`, `skills/agent_CHECK/`). Rule added: never keep duplicate skill trees.
- `~/dotfiles/opencode/projects/` created for all `project.md` files. Rule added: symlink each project's `project.md` into this folder; never create `project.md` elsewhere.
- No Claude — opencode only.

## Future / low priority
- `get_news` skill is broken: file is `get_news.md`, not `SKILL.md`; `name:` frontmatter is invalid and description references KDnuggets.
- `md2pdf/` has no `SKILL.md` at all — complete or remove.
- `python/python.md` is an orphan next to `python/SKILL.md` — remove or fold into `SKILL.md`.
- Frontmatter violations: `audio_files` uses `version: .001` (not in allowed set).
- Description grammar typos: `alias` ("when ever"), `random` ("generates"), `bump_version` ("users says"), `hello` ("user wants to list").

## Stop
