# ~/dotifles/.zshrc
#
# =================================================
# ARTICLE:
# 		https://thevaluable.dev/zsh-install-configure/

# 		Config files put in ~/.config/zsh/
# =================================================
#
#   NOTES
#   * use `setopt` , not `set`
#  ~/.zshenv MUST remain in $HOME dir for system to start
#
# ===================
#  output of setopt (Aug 2021)
# ===================
#
## autocd
## autonamedirs
## autopushd
## nobeep
## nocaseglob
## emacs
## extendedglob
## interactive
## login
## monitor
## promptsubst
## shinstdin
## zle
#
#
# =========================================================
#  SOURCING
# =========================================================

# INITIALIZE (set softlinks, set key changes - caps lock)
source ~/.config/zsh/initalize.zsh

# ALIAS (not env)
source ~/.config/zsh/aliases

# COMPLETION
source ~/.config/zsh/completion.zsh

# PROMPT
source ~/.config/zsh/prompt.zsh

# FUNCTIONS
source ~/.config/zsh/functions.zsh

# BINDKEY
## SEE ALSO file <- 410_bindkey_examples.Rmd
source ~/.config/zsh/bindkey.zsh


# =========================================================
##   PATH and path
# =========================================================
##	Use typeset to set shell attribute to -U (maintain unique entries )
##	zsh automatically syncs env $PATH and array $path
    typeset -U PATH path
    PATH=/usr/local/bin:/usr/bin:/bin:~/.local/bin/
    PATH+=:~/code/zsh_scripts_project/
    export PATH=$HOME/bin:$PATH

## ==============================================================
##    fpath:   array of directories zsh searches for all functions
## ==============================================================
## my functions linked by ~.zfunctions
## SEE:  https://unix.stackexchange.com/questions/33255/how-to-define-and-load-your-own-shell-function-in-zsh
## NOTE:   "$path[@]"  and $path  should be equivalent.
    fpath=( ~/.zfunctions "${fpath[@]}" )

# ========================================================
#   autoload  (see man zshbuiltins)
# ========================================================
## Autoload functions found in fpath
## aids in separating functions (I write?) from external programs
## TIP:   write my functions prefixed by f_FUN
##
## USE:	example_function "jim"
    autoload -Uz helloFile jim example_function


# =========================================================
#     ENV VAR	
# =========================================================
    VIMRC=~/.config/nvim/init.vim
    export V=$VIMRC
    export Z=$ZDOTDIR/.zshrc
    export G=~/code/.gitignore
    export TEMPLATES=~/.config/nvim/templates/




ZSH_THEME="intheloop"


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
# ================
# TAB completion
# ================
autoload -Uz compinit		
compinit






# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

set -o emacs		# default, and easier for edit zsh/bash command lines


# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"


# ===============
#   directory stack
# ===============

# autopush dirs on to stack
# dirs -lpv
  setopt autopushd

# changes stackdir navigation to - (default is +)
# ie cd -2  now means go back 2 directories in history
    setopt PUSHD_MINUS

# limit to last 7 
  DIRSTACKSIZE=7

# ================================
#  named directories,  
#    if export DIR=~/path/to/dir/
#    then cd $DIR will display `~DIR` and not actual path
# ================================
 setopt AUTO_NAME_DIRS

# ================================
#  AUTO_CD   > DIR   zsh recognizes you meant cd DIR
# ================================
  setopt AUTO_CD

setopt extendedglob

# case insenstive
setopt NO_CASE_GLOB   
# USAGE    > $docs<CR>
# TO LIST:  > hash -d
#
#
code=~/code
mp3=~/mp3_files
# dotfiles=~/dotfiles


# initialize
# ~dotfiles # ':'   does nothing


set NO_BEEP
# need extendedglob

# # apply Debian keyboard mappings (in ~/.xmodmap)
# # maps ccaps lock to ESC
# if [ -f ~/.xmodmap ]; then
#   xmodmap ~/.xmodmap
# fi
#
# =========================================================
#  LEGACY
# =========================================================
#
# export PS1=' \W \$ '
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

