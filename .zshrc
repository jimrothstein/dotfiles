# ~/dotifles/.zsh
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#	confused WHERE   $PATH 1st set, start fresh here:
PATH=/usr/local/bin:/usr/bin:/bin
export PATH=$HOME/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/jim/.oh-my-zsh"
# --------
# fpath is array of directories zsh searches for all functions
# my functions linked by ~.zfunctions
# SEE:  https://unix.stackexchange.com/questions/33255/how-to-define-and-load-your-own-shell-function-in-zsh
# --------
fpath=( ~/.zfunctions "${fpath[@]}" )

# --------
# to autoload functions, hello, found in above fpath
#
autoload -Uz helloFile jim

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
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


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

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
# #######################
# 	alias
# #######################
#	zsh help is  run-help
alias help='run-help'

#  	always use LESS
alias more='less'

#	coding
alias goCode='cd ~/code/'
alias goMake='cd ~/code/scripts_/make_play/'
alias goScripts='cd ~/code/scripts_/'
alias goBash='cd ~/code/scripts_/bash_script_play/'
alias goMark='cd ~/code/scripts_/markdown_play/'
alias goVim='cd ~/code/scripts_/nvim_play/'
alias goGrep='cd ~/code/scripts_/grep_play/'
alias goJim='goBash;cd ..'						# works!

#	config
alias goDot='cd ~/dotfiles'
alias goR='cd ~/code/'
alias goBin='cd ~/bin'
export goCode goDot goR goBin 
alias goBackup='cd ~/.config/nvim/backup/'

#	docs
alias goDocs='cd $VISIBLE_DIR/documents/'
alias goLegal='cd ~/Downloads/documents/legal_18CR/'

#	env var
export VIMRC=~/.config/nvim/init.vim
export V=$VIMRC

# ##################
# 	vi mode
# ##################
# set VIMODE according to the current mode (default “[i]”)
#VIMODE='[i]'
#function zle-keymap-select {
# VIMODE="${${KEYMAP/vicmd/[n]}/(main|viins)/[i]}"
# zle reset-prompt
#}
#zle -N zle-keymap-select

# #################
# 	set PS1
# #################
# Set the prompt to “[user]@[host[ [vi mode] $ ”
#PROMPT="%n@%m ${VIMODE} \\$ "
PROMPT=%h%~:$PROMPT		# history #, directory

# #################
# 	set PS2 (when waiting for input)
# #################
PS2='wait for user'

############
#  named directories
###########
setopt AUTO_NAME_DIRS
DOCS=~/Downloads/documents/
code=~/code
mp3=~/Downloads/mp3/
legal=~/Downloads/documents/legal_18CR/

# initialize
:	~DOCS ~mp3 ~legal ~code		# ':'   does nothing


set NO_BEEP
