# /home/jim/.zshenv
#
# =================================================
# ~/.zshenv
# PURPOSE:  - 1st zsh file to be sourced.
#           - must be in ~/.zshenv
#           - keep ENV (only) variables here    
#
# NOTE:     
#
# config:   ~/.config/zsh/.zshrc,  for functions, paths, options, alias
# alias:    ~/.config/zsh/aliases.zsh
# =================================================
# ARTICLE:
# 		https://thevaluable.dev/zsh-install-configure/
# 		Suggests, ~/.zshenv only contain env!
# 		Config files put in ~/.config/zsh/
# =================================================

## DO NOT SEND to GITHUB !!!

# keys - for LLM, put into LLM_project/ directory in .env
export GEMINI_API_KEY="AIzaSyByqDSI6T-n3PuM3ayV-fIL8iwthCKYMoE"
export key="AIzaSyBW7YFOeje58b-KADLR65vxMUej9BqkpWU"    # July 25, 2025

export XDG_CONFIG_HOME="$HOME/.config"

# nvim expects this:
export XDG_DATA_HOME="$HOME/.local/share"
#

export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

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
export A=~/dotfiles/aliases.zsh
export G=~/dotfiles/.gitignore
export V=~/.config/nvim/init.lua
export Z=$ZDOTDIR/.zshrc

