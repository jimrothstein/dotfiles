# ~/dotifles/.zshrc
#
# =================================================
# ARTICLE:
# 		https://thevaluable.dev/zsh-install-configure/
# 		Suggests, ~/.zshrc only contain env!
# 		Config files put in ~/.config/zsh/
# =================================================
#
#
# ==========================================================
#			COMPLETION.ZSH   -  for   (some)setopt, zstyle
# ==========================================================
#
#

# NO BELL,  nvim/R annoying bell.
# Unfortunately, this turns OFF bell everywhere in zsh
setopt nobeep
#

# --------
set NO_BEEP

# need extendedglob
bindkey '^z'  backward-delete-word

