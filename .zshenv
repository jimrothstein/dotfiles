# /home/jim/.zshenv
#
# =================================================
# ~/.zshenv
# KEEP .zshenv in $HOME/; 1st file sourced 
#  - keep ENV variables here
#
# =================================================
# ARTICLE:
# 		https://thevaluable.dev/zsh-install-configure/
# 		Suggests, ~/.zshenv only contain env!
# 		Config files put in ~/.config/zsh/
# 		(~/.config/zsh/.zshrc used for functions, paths, options, alias)
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

# TMUX
#export TMUX_TMPDIR="/tmp/tmux"

#	TMUX expects to find .tmux.conf in HOME
export T=/home/jim/.tmux.conf
#export T="/home/jim/.config/tmux/.tmux.conf"

# HISTORY
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=1000                   # Maximum events in history file
export HISTTIMEFORMAT='%F %T'
export HISTIGNORE='ll; ls -la;pwd'
export INC_IGNORE_DUPS="true"		# if adjacent
export INC_APPEND_HISTORY="true"	# all zsh shells show same hist

#	env var
export V=~/.config/nvim/init.lua
export Z=$ZDOTDIR/.zshrc
export C=~/code/
export G=~/code/.gitignore
export TEMPLATES=~/.config/nvim/templates/
# for printing
export OUT=~/Downloads/print_and_delete

# dotfiles=~/dotfiles
## When using /tmp/rebase-sandbox (GIT practice)
  export SANDBOX=/tmp/rebase-sandbox

## env var for R (August 2021)
  export R_HOME='/usr/lib/R'
  export R_LIBS_SITE='/usr/lib/R/library'


# =====END CUT ===================================================


