# ~/code/docs project

Single project.md for the whole `~/code/docs/` repo, with one section per subdirectory/activity.

## PLAN
### Done
- 2026-08-12: Single project.md covers the whole repo; symlinked from `~/dotfiles/opencode/projects/docs_project.md`.
- 2026-08-12: advisory got its own memory file. Created `cdc_urls.qmd` with CDC.gov links found on Lane County Public Health pages.

### TODO
- advisory: check the directory's website for broken URL links (see `advisory/advisory_project.md`).
- AGENTS: review the files in `~/code/docs/AGENTS` — some are really skills and some have rules that may apply to R projects.

## NEXT STEPS
- tech_notes: review `2026_laptop_requirements.md` options and set up eBay saved searches (T14/T14s Gen 4 AMD 32GB, X13 Gen 3 AMD).
- advisory: check the directory's website for broken URL links (see `advisory/advisory_project.md`).
- AGENTS: review the files in `~/code/docs/AGENTS` — some are really skills and some have rules that may apply to R projects.

## Current state
- 2026-10-18: 2026_laptop_requirements.md extended with "Laptop requirements and options" research (Dell has no AMD Latitude; T14/X13 Gen 4 AMD and L14 G3/Framework as fallbacks). 300_tech_notes.qmd fence now points to it as "requirements and options". Verified: quarto gfm + typst renders EXIT=0. Committed 6172, pushed.
- 2026-10-18: tech_notes/2026_laptop_requirements.md added (Perplexity: Lenovo T14s Gen 3 ranking + P14s vs T14s). Linked from the literal fence in 300_tech_notes.qmd `### 2026_laptop_notes`. Verified: `quarto render 300_tech_notes.qmd --to gfm` and `--to typst` both EXIT=0. Committed c4ef, pushed.
- 2026-08-22: tech_notes/300_tech_notes.qmd — fixed unclosed code fence at EOF and appended a `### Typst - purple ellipse` section with a `{=typst}` chunk using built-in `#ellipse(fill: purple)`. Verified via `quarto render --to typst` (PDF OK). Committed (2152) and pushed.
- 2026-08-12: Project set up. Single project.md (this file) covers the whole repo. Symlinked from `~/dotfiles/opencode/projects/docs_project.md`. advisory/ contains 4 AI-tool comparison docs (gemini, google_search, perplexity, default) on the infant-vaccine query.
- 2026-08-12: advisory now has its own memory file `advisory/advisory_project.md` (symlinked from `~/dotfiles/opencode/projects/advisory_project.md`) plus `cdc_urls.qmd` listing CDC.gov links found on Lane County Public Health pages.

## advisory
- First goal: check the directory's website for broken URL links.
- Has its own project memory: `advisory/advisory_project.md`.

## ALZ

## health_notes

## jobs

## legal_notes

## misc_files

## tech_notes

## tex_headers_templates
