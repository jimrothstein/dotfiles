# ~/dotifles/.zsh
#
#	confused WHERE   $PATH 1st set, start fresh here:
PATH=/usr/local/bin:/usr/bin:/bin
export PATH=$HOME/bin:$PATH

# NO BELL,  nvim/R annoying bell.
# Unfortunately, this turns OFF bell everywhere in zsh
setopt nobeep
#
# Path to your oh-my-zsh installation.
  export ZSH="/home/jim/.oh-my-zsh"

# ==============================================================
# fpath:   array of directories zsh searches for all functions
# ==============================================================
# my functions linked by ~.zfunctions
# SEE:  https://unix.stackexchange.com/questions/33255/how-to-define-and-load-your-own-shell-function-in-zsh
# --------
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

#	Prompt is usually set in THEME
#	this is from "intheloop"
echo "set prompt in THEME"

#PROMPT='
#%{$fg_bold[grey]%}[%{$reset_color%}%{$fg_bold[${host_color}]%}%n@%m%{$reset_color%}%{$fg_bold[grey]%}]%{$reset_color%}
#%{$fg_bold[blue]%}%10c%{$reset_color%} $(git_prompt_info) $(git_remote_status)
#%{$fg_bold[cyan]%}❯%{$reset_color%} '


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


# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
#
# ##################
# 	HISTORY
# ##################
# export HISTFILE					# default=~/.zsh_history
export HISTTIMEFORMAT='%F %T'
export SAVEHIST=1000
export HISTSIZE=1000
export INC_IGNORE_DUPS="true"		# if adjacent
export INC_APPEND_HISTORY="true"	# all zsh shells show same hist
export HISTIGNORE='ll; ls -la;pwd'

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

#	manages universe of zsh plugins
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
set -o emacs		# default, and easier for edit zsh/bash command lines

#	##################
#	use emacs:
#	if 'vi' is found in this env variable,  switches to vi mode
#
#	export EDITOR='nvim'
#	#################

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# (jr) To find WHERE alias defined:
# >which <alias>
# >grep -r '<alias=xxxx>'
#
# #######################
# 	alias
# #######################
#	zsh help is  run-help
alias help='run-help'
alias man='run-help'

# Uncomment, IF want 	always use LESS
# alias more='less'
#
# Uncomment, to add flag for less?
# alias -g L='| less'	# USE:  ll L <enter>

#	coding, 
alias goCode='cd ~/code/'
alias goYoutube='cd ~/code/pkg_yt_api/'
alias goMp3='cd ~/code/pkg_mp3_files/'
alias goTry='cd ~/code/r_try_things_here/'
alias goOpenSecrets='cd ~/code/opensecrets/'


#	config
alias goDot='cd ~/dotfiles'
alias goVim='cd ~/.config/nvim/'

alias goBin='cd ~/bin'
alias goBackup='cd ~/.config/nvim/backup/'
alias cx='chmod +x'				# USE:    cx  new_script.sh

#	docs
alias goDocs='cd ~/Downloads/documents/'
alias goLegal='cd ~/Downloads/documents/legal_18CR/'

# export (so go<TAB> works)
export goCode goDot goVim goBin 
export goYoutube goTry

# ============
# Experiment
# ============
#
# long, 1-per line, desc (size), no permissions, more
# -S  to sort desc (size)
# USAGE:   ll * m
#
alias ll='ls -laphog'
alias -g m='| more'

#	env var
export V=$VIMRC
export Z=~/.zshrc
export G=~/code/.gitignore


# example of setting PROMPT
#PROMPT=%h%~:$PROMPT		# history #, directory
#PROMPT='${PROMPT} ${status} > '
#
# ===================================
# 	set PS2 (when waiting for input)
# ===================================
PS2='wait for user: '

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
mp3=~/Downloads/mp3/
legal=~/Downloads/documents/legal_18CR/
dotfiles=~/dotfiles
bash_project=~/code/bash_project/
linear=~/code/pkg_linear_algebra/
try_things_here=~/code/r_try_things_here/

# initialize
:	~docs ~mp3 ~legal ~code ~dotfiles ~bash_project		# ':'   does nothing
: ~linear



# More Experiments


set NO_BEEP
# need extendedglob
bindkey '^z'  backward-delete-word

