# advisory (in ~/code/docs/advisory)

Project memory for the `~/code/docs/advisory/` subproject.

## NEXT STEPS
- Check the Lane County Public Health website for broken URL links.
- Compare the CDC URL list against other County Public Health pages as they're added.
- 2026-08-13: Build the GitHub Actions demo (a working, not-perfect link-audit workflow) and push it. — DONE, verified on GitHub.

## jim (the user) ADDED STEPS:
- Goal remains find all broken urls and present in list to user.
- But, we want code (R, python, bash, ....) to do this.  Once we have working code, a non-technical, non-programmer will be able to run it 2 or 3 times each month without need AI or LLM.
- Your job is now to aid in planning and writing this code.
- Best if we discuss this interactively.  Create a plan and then update this "project summary"  We do this today.

## Decisions
- 2026-08-12: Saved the found CDC.gov links as `cdc_urls.qmd` in the advisory dir. Why: keeping a machine-readable record of public-health page outbound links for link-audit work.
- 2026-08-12: Created this dedicated `advisory_project.md` (symlinked from `~/dotfiles/opencode/projects/advisory_project.md`) separate from the parent docs project.md. Why: advisory is a distinct sub-project with its own scope (website link audits).
- 2026-08-13: The end user likely runs **Windows with no Python/R installed**. Assumption: for any local solution, do NOT rely on Python or R being present. Why: confirmed we must not assume a dev environment on the user's machine.
- 2026-08-13: Two free cloud-hosting options are in play for the link-audit tool:
  1. **GitHub Actions** (free; public repo = unlimited minutes) — runs on a schedule, produces a static report served via GitHub Pages. User just opens a bookmarked URL; nothing runs locally.
  2. **Posit free tier** — a Shiny app on shinyapps.io (5 apps / 25 active-hrs/mo, no scheduling) or Connect Cloud (4 GB/1 CPU, 20 active-hrs/mo, unlimited static docs, can publish from GitHub). Runs on demand; scheduling is paid. R runs server-side, so the user's machine needs nothing.
- 2026-08-13: **Today we build the GitHub Actions option as a demonstration only.** It must work but need not be perfect — partial coverage of the Public Health site and minor errors are acceptable. We defer the Shiny/Posit path for a later session.

## Current state
- Just started. First output artifact is `cdc_urls.qmd`: 19 unique links to cdc.gov found across 3 subpages of Lane County Public Health (Immunization Program, Coronavirus (COVID-19), Preparedness). The main Public Health landing page has no CDC links; Public Health News mentions "Centers for Disease Control and Prevention" in a measles story without linking.
- 2026-08-13: Audit tool decisions settled — crawl the **entire Public Health section** recursively; "broken" = any 4xx/5xx + connection failures (DNS/timeout/SSL). Building the GitHub Actions demo now.
- 2026-08-13: GitHub Actions demo built and **verified working on GitHub**. `advisory/link_audit.py` (Python stdlib only: urllib + html.parser) crawls the PH portal (pageId-marked internal links only), extracts outbound links, checks each (HEAD/GET, redirects, DNS/timeout/SSL handling), writes `link_audit.md` + `link_audit.csv` under `advisory/audit_results/`. Workflow `.github/workflows/link_audit.yml` runs it on a monthly cron + manual `workflow_dispatch` and commits results back to the repo. Live run on GitHub: 40 PH pages → 189 unique outbound links → 29 broken. Results committed as commit `8cd7` ("Update link audit results").
- Known demo limitations (acceptable for now): (1) some 403s are bot-blocking not real breaks (ssa.gov, peacehealth, redcross); (2) SSL cert failures on public.health.oregon.gov flagged though site may still load in a browser; (3) botched URLs on the site itself (e.g. `http://https://...`) surface as DNS errors — useful findings; (4) results are committed to the repo, not yet served via GitHub Pages.

## Paths chosen
- Auditing outbound links from Lane County Public Health website, page by page.
- 2026-08-13: Target the GitHub Actions + GitHub Pages route first (free, scheduled, browser-only for the end user). Shiny app on Posit free tier is the recorded alternative.
