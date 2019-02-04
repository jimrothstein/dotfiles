
  export ZSH="/home/jim/.oh-my-zsh"

ZSH_THEME="intheloop"

PROMPT='
%{$fg_bold[grey]%}[%{$reset_color%}%{$fg_bold[${host_color}]%}%n@%m%{$reset_color%}%{$fg_bold[grey]%}]%{$reset_color%}
%{$fg_bold[blue]%}%10c%{$reset_color%} $(git_prompt_info) $(git_remote_status)
%{$fg_bold[cyan]%}❯%{$reset_color%} '

export HISTTIMEFORMAT='%F %T'
export SAVEHIST=1000
export HISTSIZE=1000
export INC_IGNORE_DUPS="true"		# if adjacent
export INC_APPEND_HISTORY="true"	# all zsh shells show same hist
export HISTIGNORE='ll; ls -la;pwd'

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

set -o emacs		# default, and easier for edit zsh/bash command lines

alias help='run-help'

alias more='less'

alias goCode='cd ~/code/'
alias goMake='cd ~/code/scripts_/make_play/'
alias goScripts='cd ~/code/scripts_/'
alias goBash='cd ~/code/scripts_/bash_script_play/'
alias goMark='cd ~/code/scripts_/markdown_play/'
alias goVim='cd ~/code/scripts_/nvim_play/'
alias goGrep='cd ~/code/scripts_/grep_play/'
alias goJim='goBash;cd ..'						# works!

alias goDot='cd ~/dotfiles'
alias goR='cd ~/code/'
alias goBin='cd ~/bin'
export goCode goDot goR goBin 
alias goBackup='cd ~/.config/nvim/backup/'

alias goDocs='cd $VISIBLE_DIR/documents/'
alias goLegal='cd ~/Downloads/documents/legal_18CR/'

export VIMRC=~/.config/nvim/init.vim
export V=$VIMRC

PROMPT=%h%~:$PROMPT		# history #, directory

PS2='wait for user'

setopt AUTO_NAME_DIRS
DOCS=~/Downloads/documents/
code=~/code
mp3=~/Downloads/mp3/
legal=~/Downloads/documents/legal_18CR/

:	~DOCS ~mp3 ~legal ~code		# ':'   does nothing

set NO_BEEP
