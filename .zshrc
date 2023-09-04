##	file <- "/home/jim/.config/zsh/.zshrc
#
# ~/dotifles/.zshrc
#
# =================================================
#   ARTICLE:
# 		https://thevaluable.dev/zsh-install-configure/
# 		Config files put in ~/.config/zsh/
#     **alias:** ~/.config/zsh/aliases.zsh
# =================================================
#   NOTES
#   * use `setopt` , not `set`
#  ~/.zshenv MUST remain in $HOME dir for system to start
# =================================================
#   CORE CONFIG	
#			REF: [archwiki]( https://wiki.archlinux.org/index.php/Zsh#Simple_.zshrc )
# =================================================
#   TODO
#       -  04/24/2023  clean up !
# =================================================
#		no need for promptinit
autoload -Uz vcs_info # enable vcs_info
precmd () { vcs_info } # always load before displaying the prompt
setopt prompt_subst    # need this

#	create variable vcs_info_msg_0_
#	start|stop a sqquence with %F...%f
#	All codes here:		https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
zstyle ':vcs_info:*' formats ' %s(%F{red}%b%f)' # git(main)
PS1='%n@%m %F{cyan}%/%f$vcs_info_msg_0_ $ ' # david@macbook /tmp/repo (main) $


#	on the far RIGHT
RPROMPT='%w::$(date +%b)::%t::$vcs_info_msg_0_'

setopt histignorealldups sharehistory

# Use emacs keybindings (prefer) even if our EDITOR is set to vi
bindkey -e

# History:   keep 1000 lines of shell history;  save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
#================
#			COMPLETION:	
#
#			Use modern completion system: compinit
#			compsys:	collection of functions; scripts; 1 more 'completers'
#			man zshcompsys
#
#			In given context, specific zstyles run to effect the completion
#			`zstyle` is ZSH module useful in settings based on PATTERN.
#			zstyle <pattern> <style> <values>
#			man zshcompsys
#================
autoload -Uz compinit
compinit


# EXAMPLE
zstyle ':completion:*:*:cp:*' file-sort size

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# ===================
#  >setopt    # output of setopt (Aug 2021)
# ===================
#
#
#
# =========================================================
#  SOURCING
# =========================================================

# INITIALIZE (set softlinks, set key changes - caps lock)
source ~/.config/zsh/initialize.zsh

# ALIAS (not env)
source ~/.config/zsh/aliases.zsh

# COMPLETION
source ~/.config/zsh/completion.zsh

# PROMPT
# source ~/.config/zsh/prompt.zsh

# FUNCTIONS (my shell functions)
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
    PATH=/usr/local/bin:/usr/bin:/bin
	PATH+=:~/.local/bin
    export PATH=$HOME/bin:$PATH

## ==============================================================
##    fpath:   array of directories zsh searches for all functions
## ==============================================================
## my functions linked by ~.zfunctions
## SEE:  https://unix.stackexchange.com/questions/33255/how-to-define-and-load-your-own-shell-function-in-zsh
## NOTE:   "$path[@]"  and $path  should be equivalent.
#
#    fpath=( ~/.zfunctions "${fpath[@]}" )
     fpath=( ~/zsh_TAB_completion/ $fpath)

# ========================================================
#   autoload  (see man zshbuiltins)
# ========================================================
## Autoload functions found in fpath
## aids in separating functions (I write?) from external programs
## TIP:   write my functions prefixed by f_FUN
##
## USE:	example_function "jim"
    autoload -Uz helloFile jim example_function

ZSH_THEME="intheloop"


# (JR:)  Not sure why, but tmux windows names works with this "true"
# Uncomment the following line to disable auto-setting terminal title.
 DISABLE_AUTO_TITLE="true"

#
#	
# ================
# TAB completion
# ================
# autoload -Uz compinit		
compinit


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


# initialize
# ~dotfiles # ':'   does nothing


set NO_BEEP

# # apply Debian keyboard mappings (in ~/.xmodmap)
#  ~/.xinitrc contains xmodmap statment to make CAPS LOCK behave like ESC
#  (many other ways to do this)
#  SEE  https://wiki.archlinux.org/title/Xmodmap
source ~/.xinitrc
#
##  open terminal - infinite LOOP   do not do this !!!

## 2023-08-19 - experiment  WORKS
## video : https://www.youtube.com/watch?v=LkHjJlSgKZY      Elijahmanor
## nvims :  switch between nvim configs  REF: https://gist.github.com/elijahmanor/b279553c0132bfad7eae23e34ceb593b
## 
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvims() {
  items=("default" "kickstart" "LazyVim" "NvChad" "AstroNvim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
#   config=""
    config="kickstart"    # jim's default
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
