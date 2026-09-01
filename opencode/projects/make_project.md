# ~/code/make_project

Old makefiles salvaging useful zsh/linux commands. See `000_plan.md` for the reorg plan.

## PLAN
### Done
- 2026-08-13: Project set up. Memory file symlinked from `~/dotfiles/opencode/projects/make_project.md`.
- 2026-08-13: Reorganized per `000_plan.md` (see Current state).

### TODO
Plan from `000_plan.md` (to be deleted after review):
- Goal: reorganize certain make files (*.mk*) in this directory.
- Some files may be combined:
  - Files beginning with 0030_, 0020, 0110 -> rename to `0110_linux_shell_cmds.mk` (DONE).
  - Files beginning with 0060_, 0065_, 0090_regex -> rename resulting file to `0210_find_grep_regex.mk` (DONE).
- If a file is not listed above, ignore it.
- Do not edit files other than appending. If you see make errors, ignore these.
- This is a "project" and needs a "project management file". Commit before any changes. Commit and push only when user approves.
- After user approval, commit and push the reorganized makefiles.
- Review other `*.mk` files (0080, 0090_makeR, 0100, 0120, 0200, 0220, 0225, 0032, 0040, 0050) for possible future consolidation.

## NEXT STEPS
- Remaining consolidation candidates (not yet done): 0001_ryan_tutorial_makefile.mk -> 0210_find_grep_regex.mk; 0032 + 0120 -> 0110_linux_shell_cmds.mk; 0040_dpkg_tools.mk -> 0110; 0080 + 0090_makeR.mk merge.

## Current state
- 2026-08-19: Improved `0225_ls_grep_GLOB_QUANTIFIERS.mk`: fixed header comment, retitled "OLDER" section to "CLASSIC LS & GREP", added all file-less targets to `.PHONY`. Deleted `0220_ls_grep_examples.mk` (was a strict subset of 0225). User later added a "These use zsh features" banner before the glob-quantifier targets.
- 2026-08-19: Created `0300_make_learning.mk` merging `0050_echo_examples.mk` + `0200_dates_recurive.mk` (append-only, 0050 then 0200, section banners). Deleted both originals. Verified with `make -f 0300_make_learning.mk -n date manual test`. User then cleaned it (removed `makefile` dep from archive.tar, stale header, empty experimental section); added file-less targets to `.PHONY`.
- 2026-08-13: Project set up. Memory file symlinked from `~/dotfiles/opencode/projects/make_project.md`.
- 2026-08-13: Reorganized per `000_plan.md`:
  - Combined `0020_device_info_zsh_commands.mk` + `0030_disk_commands_USE.mk` + `0110_unix_tools.mk` into `0110_linux_shell_cmds.mk` (append-only, by file number).
  - Combined `0060_find_examples.mk` + `0065_grep_examples.mk` + `0090_regex_ls_find_examples.mk` into `0210_find_grep_regex.mk` (append-only, by file number; plan said `.md`, corrected to `.mk` per user decision).
  - Deleted the six original source files.
  - Other files untouched.
