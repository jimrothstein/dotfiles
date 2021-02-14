# /home/jim/.zshenv
#
# =================================================
# KEEP .zshenv in $HOME/
# =================================================
# ARTICLE:
# 		https://thevaluable.dev/zsh-install-configure/
# 		Suggests, ~/.zshrc only contain env!
# 		Config files put in ~/.config/zsh/
# =================================================

export XDG_CONFIG_HOME="$HOME/.config"

# nvim expects this:
export XDG_DATA_HOME="$HOME/.local/share"
#
# nvim DOES NOT expect this:
#export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"

export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export EDITOR="nvim"

# ~/.config/zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# ~/dotfiles
export DOT_DIR="$HOME/dotfiles"


# HISTORY
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=1000                   # Maximum events in history file
export HISTTIMEFORMAT='%F %T'
export HISTIGNORE='ll; ls -la;pwd'
export INC_IGNORE_DUPS="true"		# if adjacent
export INC_APPEND_HISTORY="true"	# all zsh shells show same hist

#	env var
VIMRC=~/.config/nvim/init.vim
export V=$VIMRC
export Z=$ZDOTDIR/.zshrc
export G=~/code/.gitignore
# =====END CUT ===================================================


