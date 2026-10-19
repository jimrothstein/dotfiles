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
- tech_notes: for the eReader, decide used Go 10.3 Gen 1 (~$200-250) vs used/open-box Go 10.3 Gen II (~$300-380, Android 15 = longer life). Set eBay saved searches (Sold filter): `BOOX Go 10.3`, `BOOX Note Air3` (B/W only), `BOOX Note Air2 Plus`, `BOOX Tab Ultra`.
- tech_notes: review `2026_laptop_requirements.md` options and set up eBay saved searches (T14/T14s Gen 4 AMD 32GB, X13 Gen 3 AMD).
- advisory: check the directory's website for broken URL links (see `advisory/advisory_project.md`).
- AGENTS: review the files in `~/code/docs/AGENTS` — some are really skills and some have rules that may apply to R projects.

## Current state
- 2026-10-19: tech_notes/2026_eReader_requirements.md — REVISED "Findings and recommendations" for constraints the user added to the file during research: no color, buy used/price sensitive, front light NOT required, device must last 3-4 yrs, no writing/drawing. New pick: **used BOOX Go 10.3 Gen 1** ($150-260, 300 ppi mono, Android 12, no microSD); alt **Note Air3 B/W** ($200-280, 227 ppi, microSD); durability play = used/open-box Go 10.3 Gen II ($280-380, Android 15); Note3/Note5 (2020-21) deprioritized as too old. All color/Kaleido 3 models moved to "Ruled out" (no color). Added stylus analysis (no benefit without writing; penless listings fine), used-price table with asking vs Swappa avg sale, eBay buying checklist. Caution: user edits the requirements file while the agent works — always re-read before rewriting (a head -N rebuild truncated user lines 32-34; caught and restored, USER_HEADER_PRESERVED verified). Committed 1c250, pushed. Renders gfm+typst EXIT=0.
- 2026-10-19: tech_notes/2026_eReader_requirements.md — appended "Findings and recommendations" (10.3" e-ink for technical PDFs). Pick: BOOX Go 10.3 Gen II Lumi $449.99 (mono 300 ppi, Android 15); runner-up BOOX Note Air6 C $579.99 (Kaleido 3 color, Android 16, microSD); used: Go 10.3 Gen 1 / Note Air3. Ruled out Kindle Scribe, Kobo Elipsa 2E, PocketBook InkPad X Pro, Supernote, reMarkable. Deciding factor = Android (Google Drive app, KOReader/Calibre-Web OPDS, file grouping). Linked from new `### 2026_eReader_notes` fence in 300_tech_notes.qmd. Verified: quarto gfm + typst renders EXIT=0. Committed 4d8c, pushed.
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
