---
name: dotfiles
description: Dotfiles management best practices
---

# Dotfiles Management

## Config Locations

- Most, but not all, applications store config in `~/.config`
- Examples: `~/.config/i3/`, `~/.config/gh/`

## Dotfiles Folder Strategy

- Move configuration files to `~/dotfiles/` for easier backup
- Use soft links (symlinks) so applications can find their config files

## Symlink Examples

### Emacs

- Config location: `~/.config/emacs/init.el`
- Create symlink: `init.el -> ~/dotfiles/emacs/init.el`
- Actual file lives at: `~/dotfiles/emacs/init.el`

### GitHub CLI (gh)

- Config location: `~/.config/gh/config.yml`
- Create symlink to: `~/dotfiles/gh/config.yml`

### Zsh

- Config files in `~/.config/zsh/`
- Several symlinks in `~/.config/zsh/` pointing to `~/dotfiles/`

## Backup Benefits

Storing all configuration in `~/dotfiles/` and using symlinks makes backing up your configuration simple - just back up one folder instead of hunting through `~/.config/`, `~/`, and other locations.
