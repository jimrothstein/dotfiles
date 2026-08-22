# Agent Configuration

## PLAN
### Done
- All configuration, skills, and agents live in `~/dotfiles/opencode/`; `~/.config/opencode` is a soft link to it.
- Stale duplicate skill trees deleted (`skills/.agents/`, `skills/agent_CHECK/`). Rule added: never keep duplicate skill trees.
- `~/dotfiles/opencode/projects/` created for all `project.md` files. Rule added: symlink each project's `project.md` into this folder; never create `project.md` elsewhere.
- No Claude — opencode only.
- PLAN section convention added to AGENTS.md; `global_setup_to_do.md` folded into this file.

### Future / low priority
- `get_news` skill is broken: file is `get_news.md`, not `SKILL.md`; `name:` frontmatter is invalid and description references KDnuggets.
- `md2pdf/` has no `SKILL.md` at all — complete or remove.
- `python/python.md` is an orphan next to `python/SKILL.md` — remove or fold into `SKILL.md`.
- Frontmatter violations: `audio_files` uses `version: .001` (not in allowed set).
- Description grammar typos: `alias` ("when ever"), `random` ("generates"), `bump_version` ("users says"), `hello` ("user wants to list").
- Review the files in `~/code/docs/AGENTS` — some are really skills and some have rules that may apply to R projects.

## NEXT STEPS
- None pending; see PLAN Future / low priority.

## Decisions
- 2026-08-12: All opencode configuration, skills, and agents live in `~/dotfiles/opencode/`; `~/.config/opencode` is a soft link to it. Why: keeps everything under version control in dotfiles.
- 2026-08-12: Stale duplicate skill trees (`skills/.agents/`, `skills/agent_CHECK/`) deleted; rule added that duplicates must always be removed. Why: only one canonical skills tree at `~/dotfiles/opencode/skills/`.
- 2026-08-12: All `project.md` memory files live in `~/dotfiles/opencode/projects/`, symlinked into each project root. Why: one backup location for all project memory via GitHub.
- 2026-08-12: No Claude — opencode only.
- 2026-08-22: Typst skill (`skills/typst/SKILL.md`) cleaned up: removed stray `.typ`-style YAML frontmatter from the Quarto section (qmd files don't use it); clarified "update/add" rules — target is a `*.qmd` by default, `*.typ` only when user explicitly specifies it (with confirmation). Frontmatter name renamed to "typst SKILL" (by Jim). Committed as 2ff9.

## Current state
Global rules for skill hygiene and project memory are documented in `~/dotfiles/opencode/AGENTS.md`. The skills tree contains only the canonical skills; broken/low-priority skill fixes (get_news, md2pdf, python orphan, audio_files frontmatter, grammar typos) are deferred and listed in `global_setup_to_do.md`.

## Paths chosen
- Using `~/dotfiles/opencode/` as the single source of truth for opencode config, with `~/.config/opencode` symlinked.
- Skills cleanup and project-memory conventions maintained in `AGENTS.md`.
