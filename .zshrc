# ~/dotifles/.zshrc
#
# =================================================
# ARTICLE:
# 		https://thevaluable.dev/zsh-install-configure/

# 		Config files put in ~/.config/zsh/
# =================================================
#
#
# ==========================================================
#  ~/.zshenv MUST remain in $HOME dir for system to start
# ==========================================================
#
#

# ALIAS
source ~/.config/zsh/aliases

# COMPLETION
source ~/.config/zsh/completion.zsh

# PROMPT
source ~/.config/zsh/prompt.zsh

# PATH and path
#	Use typeset to set shell attribute to -U (maintain unique entries )
#	zsh automatically syncs env $PATH and array $path
typeset -U PATH path
PATH=/usr/local/bin:/usr/bin:/bin:~/.local/bin/
export PATH=$HOME/bin:$PATH

# ENV VAR	
VIMRC=~/.config/nvim/init.vim
export V=$VIMRC
export Z=$ZDOTDIR/.zshrc
export G=~/code/.gitignore


# =================
# PURPOSE:  
# 	in $Z, segment sections into clear FUNCTIONS
# 	Makes clearer when activating all the pieces of $Z.
#
# create function
function hello  {
	print hello $1
}

# do not run
# hello "jim"
# =================

## LEGACY
#

# Path to your oh-my-zsh installation.
#  export ZSH="/home/jim/.oh-my-zsh"


# ==============================================================
# fpath:   array of directories zsh searches for all functions
# ==============================================================
# my functions linked by ~.zfunctions
# SEE:  https://unix.stackexchange.com/questions/33255/how-to-define-and-load-your-own-shell-function-in-zsh
# --------
#
# NOTE:   "$path[@]"  and $path  should be equivalent.
fpath=( ~/.zfunctions "${fpath[@]}" )

# --------
# to autoload functions put in directory found in fpath
# 	avoids too many functions in .zshrc
# EX:   use ~/.oh-my_zsh/functions/
# USE:	example_function "jim"
autoload -Uz helloFile jim example_function

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"

ZSH_THEME="intheloop"


# export PS1=" \W \$ "
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"


# (JR:)  Not sure why, but tmux windows names works with this "true"
# Uncomment the following line to disable auto-setting terminal title.
 DISABLE_AUTO_TITLE="true"






#
#  ================
#			CORE CONFIG	
#			REF: [archwiki]( https://wiki.archlinux.org/index.php/Zsh#Simple_.zshrc )
#  ================
#
#	
autoload -Uz compinit		# basic TAB completion
bindkey -e   			# emacs

# NOW:  prompt set in oh-my-zsh
# FUTURE?  use standard zsh choices. 
# autoload -Uz promptinit
# promptinit

#
#
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

# REMOVED oh-my-zsh
#	manages universe of zsh plugins
# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

set -o emacs		# default, and easier for edit zsh/bash command lines


# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"





# ================================
#  named directories	# PURPOSE??
# ================================

setopt AUTO_NAME_DIRS
setopt extendedglob
# USAGE    > $docs<CR>
# TO LIST:  > hash -d
#
docs=~/Downloads/documents/
code=~/code
from_youtube=~/Downloads/mp3/from_youtube/
legal=~/Downloads/documents/legal_18CR/
dotfiles=~/dotfiles
linear=~/code/pkg_linear_algebra/
try_things_here=~/code/r_try_things_here/

# initialize
:	~docs ~from_youtube ~legal ~code ~dotfiles # ':'   does nothing
: ~linear


set NO_BEEP
# need extendedglob
bindkey '^z'  backward-delete-word

# # apply Debian keyboard mappings (in ~/.xmodmap)
# # maps ccaps lock to ESC
# if [ -f ~/.xmodmap ]; then
#   xmodmap ~/.xmodmap
# fi
