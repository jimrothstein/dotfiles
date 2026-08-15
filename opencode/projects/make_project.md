# ~/code/make_project

Old makefiles salvaging useful zsh/linux commands. See `000_plan.md` for the reorg plan.

## PLAN
### Done
- 2026-08-13: Project set up. Memory file symlinked from `~/dotfiles/opencode/projects/make_project.md`.
- 2026-08-13: Reorganized per `000_plan.md` (see Current state).

### TODO
- After user approval, commit and push the reorganized makefiles.
- Review other `*.mk` files (0080, 0090_makeR, 0100, 0120, 0200, 0220, 0225, 0032, 0040, 0050) for possible future consolidation.

## NEXT STEPS
- After user approval, commit and push the reorganized makefiles.
- Review other `*.mk` files (0080, 0090_makeR, 0100, 0120, 0200, 0220, 0225, 0032, 0040, 0050) for possible future consolidation.

## Current state
- 2026-08-13: Project set up. Memory file symlinked from `~/dotfiles/opencode/projects/make_project.md`.
- 2026-08-13: Reorganized per `000_plan.md`:
  - Combined `0020_device_info_zsh_commands.mk` + `0030_disk_commands_USE.mk` + `0110_unix_tools.mk` into `0110_linux_shell_cmds.mk` (append-only, by file number).
  - Combined `0060_find_examples.mk` + `0065_grep_examples.mk` + `0090_regex_ls_find_examples.mk` into `0210_find_grep_regex.mk` (append-only, by file number; plan said `.md`, corrected to `.mk` per user decision).
  - Deleted the six original source files.
  - Other files untouched.
