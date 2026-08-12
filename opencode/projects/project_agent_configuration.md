# Agent Configuration

## Decisions
- 2026-08-12: All opencode configuration, skills, and agents live in `~/dotfiles/opencode/`; `~/.config/opencode` is a soft link to it. Why: keeps everything under version control in dotfiles.
- 2026-08-12: Stale duplicate skill trees (`skills/.agents/`, `skills/agent_CHECK/`) deleted; rule added that duplicates must always be removed. Why: only one canonical skills tree at `~/dotfiles/opencode/skills/`.
- 2026-08-12: All `project.md` memory files live in `~/dotfiles/opencode/projects/`, symlinked into each project root. Why: one backup location for all project memory via GitHub.
- 2026-08-12: No Claude — opencode only.

## Current state
Global rules for skill hygiene and project memory are documented in `~/dotfiles/opencode/AGENTS.md`. The skills tree contains only the canonical skills; broken/low-priority skill fixes (get_news, md2pdf, python orphan, audio_files frontmatter, grammar typos) are deferred and listed in `global_setup_to_do.md`.

## Paths chosen
- Using `~/dotfiles/opencode/` as the single source of truth for opencode config, with `~/.config/opencode` symlinked.
- Skills cleanup and project-memory conventions maintained in `AGENTS.md`.
