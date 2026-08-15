# advisory (in ~/code/docs/advisory)

Project memory for the `~/code/docs/advisory/` subproject.

## PLAN
### Done
- 2026-08-12: Saved CDC.gov links as `cdc_urls.qmd` (19 links, 3 subpages).
- 2026-08-13: GitHub Actions demo built and verified on GitHub — link audit workflow runs monthly cron + manual trigger, commits results.
- 2026-08-13: Marketplace review — no URL-checker action crawls; custom `link_audit.py` retained.

### TODO
- jim to test the GitHub Actions workflow himself (Actions tab → Run workflow, or monthly cron); return feedback.
- Check Lane County Public Health website for broken URL links.
- Compare CDC URL list against other County Public Health pages as they're added.
- Plan and write the non-technical-user code (see jim's steps below); discuss interactively today.

## NEXT STEPS
- Check the Lane County Public Health website for broken URL links.
- Compare the CDC URL list against other County Public Health pages as they're added.
- 2026-08-13: Build the GitHub Actions demo (a working, not-perfect link-audit workflow) and push it. — DONE, verified on GitHub.
- 2026-08-13: **jim will try the GitHub Actions workflow himself** (trigger via Actions tab → Run workflow, or wait for the monthly cron). Return tomorrow with results/feedback.

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
- 2026-08-13: Reviewed the **GitHub Actions Marketplace** for URL checkers (query "url check", 43 results). Finding: none crawl an external website — they all check URL lists you supply: urlchecker-action/URL Checker/URLs Checker scan URLs embedded in your repo's own files (.md/.py/.rst); Check URLs reads a JSON list and needs a SLACK_WEBHOOK; URL Health Check / Check URL Status ping hardcoded URLs. Our use case needs **discovery (crawl) + checking**, which the marketplace actions don't cover. **Decision: keep the custom `link_audit.py` as-is** — it already does both, stdlib-only, and was verified live on GitHub. No marketplace action adopted.

## Current state
- Just started. First output artifact is `cdc_urls.qmd`: 19 unique links to cdc.gov found across 3 subpages of Lane County Public Health (Immunization Program, Coronavirus (COVID-19), Preparedness). The main Public Health landing page has no CDC links; Public Health News mentions "Centers for Disease Control and Prevention" in a measles story without linking.
- 2026-08-13: Audit tool decisions settled — crawl the **entire Public Health section** recursively; "broken" = any 4xx/5xx + connection failures (DNS/timeout/SSL). Building the GitHub Actions demo now.
- 2026-08-13: GitHub Actions demo built and **verified working on GitHub**. `advisory/link_audit.py` (Python stdlib only: urllib + html.parser) crawls the PH portal (pageId-marked internal links only), extracts outbound links, checks each (HEAD/GET, redirects, DNS/timeout/SSL handling), writes `link_audit.md` + `link_audit.csv` under `advisory/audit_results/`. Workflow `.github/workflows/link_audit.yml` runs it on a monthly cron + manual `workflow_dispatch` and commits results back to the repo. Live run on GitHub: 40 PH pages → 189 unique outbound links → 29 broken. Results committed as commit `8cd7` ("Update link audit results").
- Known demo limitations (acceptable for now): (1) some 403s are bot-blocking not real breaks (ssa.gov, peacehealth, redcross); (2) SSL cert failures on public.health.oregon.gov flagged though site may still load in a browser; (3) botched URLs on the site itself (e.g. `http://https://...`) surface as DNS errors — useful findings; (4) results are committed to the repo, not yet served via GitHub Pages.
- 2026-08-13: Marketplace review complete — no URL-checker action fits (none discover links by crawling); custom script retained. Next: jim personally tests the workflow.

## Paths chosen
- Auditing outbound links from Lane County Public Health website, page by page.
- 2026-08-13: Target the GitHub Actions + GitHub Pages route first (free, scheduled, browser-only for the end user). Shiny app on Posit free tier is the recorded alternative.
