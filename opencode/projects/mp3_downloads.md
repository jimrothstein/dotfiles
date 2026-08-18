# /home/jim/mp3_downloads

Personal music/podcast download directory (~5092 files, mostly `.ogg`; some `.mp3`/`.m4a`/`.ogx`/`.opus`/`.webm`). Contains accumulated duplicates from repeated batch downloads (same song, different date suffix or separator style).

## PLAN

### Done
- 2026-08-16: Duplicate scan. Parsed all 5092 filenames into canonical song names (lowercase, strip extension + batch-date suffix, collapse separators), grouped by (canonical name, exact byte size) → 168 candidate clusters / 344 files. Verified with MD5 → only groups where content is byte-identical were kept.
- 2026-08-16: Wrote `duplicate_report.md` (56 true duplicate clusters, 113 files involved). Report only — no deletions.
- 2026-08-16: Wrote plan to `~/code/docs/000_duplicate_music_plan.md`.
- 2026-08-17: User reviewed `duplicate_report.md` and approved deletion (keep MIME/newest per cluster). All 56 clusters re-verified with MD5 (canonical name + byte size + identical MD5), then 57 duplicate files (146 MB) moved to `/tmp/opencode/mp3_dup_removed_2026-08-17/` (recoverable staging, not hard-deleted). Directory now 5037 entries; re-scan confirms 0 duplicate clusters.
- 2026-08-17: User spotted a missed duplicate (`ANGEL_BABY_Kathy_Young`). Original date-suffix stripping covered only `_2021-10-27`, `_08Sep2020`, `_02Feb2022` styles; a second, broader scan (also stripping `_YYYY_MM_DD`, `_DD_Mmm_YYYY`, `_ddmmyyyy`, run-style suffixes) found 33 more true-duplicate clusters / 33 files (95.4 MB, MD5-verified, content identical). Same policy applied (keep MIME/newest); moved to staging. Final state: 90 files staged over two passes (241.5 MB), directory now 5004 entries, scan reports 0 clusters. A final over-broad "also drop trailing year" scan also confirms 0.

### TODO
- (none currently)

## NEXT STEPS
- `duplicate_report.md` is now historical (predates the 2026-08-17 deletions). Can be deleted or kept as-is.
- Staged duplicates in `/tmp/opencode/mp3_dup_removed_2026-08-17/` (90 files / 241.5 MB) can be hard-deleted once the user is satisfied (safe to `rm -rf`). 2026-08-17: user will review tomorrow before deciding.
- On 2026-08-17 the original plan file `~/code/docs/000_duplicate_music_plan.md` was deleted (marked obsolete by user). Plan contents are fully captured in this file, so nothing is lost.

## Method notes
- Duplicate definition (user-approved): same canonical song name AND byte-identical size, verified by MD5 content hash. Deliberately conservative (exact size only) to avoid false positives; fuzzy name-matching intentionally NOT done (too slow, more error-prone).
- Surprising finding: many same-name+same-size pairs are NOT identical content (e.g. 3× Annette Funicello "Rock and Roll Waltz" all 1,454,520 B but different MD5). MD5 verification is essential.
- Batch-date suffix patterns stripped: `_08Sep2020`, `_2021-12-13_`, `_15Feb2026`, `_02Feb2022`, `_13Jul2020`, etc.
- Some duplicate twins lose their `.ogg` extension entirely (e.g. `Buddy_Johnson_and_His_Orchestra_Mush_Mouth_08Sep2020` vs `..._08Sep2020.ogg`).