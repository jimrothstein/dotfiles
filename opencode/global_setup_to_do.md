# Global opencode setup — to-do

Goal: write `~/.config/opencode/AGENTS.md` (none exists today) with rules for
`SKILL.md` and for project management files (`project.md`).

## Skills (`SKILL.md`)

1. **`get_news` is broken and never loads.** The file is
   `skills/get_news/get_news.md`, but opencode only scans for `**/SKILL.md`.
   Also frontmatter `name: get_news.md` (invalid, has extension) and the
   description is copy-paste from `posit-news` (references "KDnuggets-news").
   Rename file to `SKILL.md`, fix name, rewrite description.
2. **Stale duplicates: `skills/agent_CHECK/` and `skills/.agents/`** each hold
   a full nested copy of the 24 posit skills, while `skills-lock.json` lists
   them as installed yet none exist at the top level. Decide the canonical
   location and delete the other two trees.
3. **Empty/orphan skills:** `skills/md2pdf/` has no `SKILL.md` at all;
   `skills/python/python.md` is an orphan next to `python/SKILL.md`. Either
   complete or remove.
4. **Frontmatter violations:** `audio_files` uses `version: .001` (not in the
   allowed frontmatter set — only `name`, `description`, `license`,
   `compatibility`, `metadata`); `hello`/`random`/`alias`/`bump_version`
   descriptions have grammar typos ("when ever", "generates", "users says").
   Document the allowed fields + a "trigger keywords in description" rule, and
   fix the offenders.
5. **Document SKILL.md content rules globally:** body < 500 lines, imperative
   voice, explain *why* instead of all-caps MUSTs, use bundled
   `scripts/`/`references/`/`assets/` for progressive disclosure, `name` must
   equal the folder name. Point to `skill-creator` as the canonical guide.

## Project management files (`project.md`)

6. **Adopt `project-memory` as the global convention.** Global AGENTS.md
   should mandate: read `project.md` at session start, record decisions as
   they happen (not only at end), format `Decisions / Current state / Paths
   chosen`, date-stamped bullets with a one-line why, and never record failed
   paths. `~/project.md` and `~/code/jimTools/project.md` are the live
   examples.
7. **Scope ambiguity:** `project.md` sits at `~/` (home) and in
   `~/code/jimTools`. Document that a `project.md` lives in the project root
   (cwd) only, and that `~/project.md` is a special case for home-level work —
   otherwise sessions will write memory to the wrong place.

## Global config

8. **Write `~/.config/opencode/AGENTS.md`** (auto-loaded). Keep it
   personal/behavioral only; project-level rules already exist in
   `~/dotfiles/AGENTS.md`, `~/bin/AGENTS.md`, etc.
9. **Document precedence:** local project `AGENTS.md`/`CLAUDE.md` wins over
   global, global wins over `~/.claude/CLAUDE.md`; first match wins per
   category. Global rules must defer to project files (e.g.
   `~/dotfiles/AGENTS.md` has its own "be terse / explain every line"
   contract).
10. **Capture cross-cutting behavioral rules:** "be terse", "present a plan
    before changing files, ask instead of guessing" (already scattered in
    `typst`, `audio_files`, `dotfiles/AGENTS.md`), plus the
    `~/.config/opencode/opencode.jsonc` gap — it has no `instructions` field,
    no `skills.paths`, and `agents/` is empty, so nothing references these
    conventions today.
