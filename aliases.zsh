
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# (jr) To find WHERE alias defined:
# >which <alias>
# >grep -r '<alias=xxxx>'
# 
#
# TODO:  in this file, wrap all alias calls in a function()
# from .zshrc,  call this function
# benefit?  ctags will tag the function
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

#   ZHS , dirstack, dirs cmd
#   l = full path
#   p = 1 per line
#   v = number
alias dirs='dirs -lpv'

#	coding, 
alias goCode='cd ~/code/'
alias goBlog='cd ~/code/blog5'
alias goYoutube='cd ~/code/youtube_api/'
alias goParameters='cd ~/code/easystats/parameters/'
alias goTestVCR='cd ~/code/test_vcr/'
alias goTry='cd ~/code/try_things_here/'
alias goTools='cd ~/code/jimTools/'
alias goHealth='cd ~/code/health_labs/'
alias goLua='cd ~/code/lua_project/'
alias goTAGS='cd ~/code/TAGS/'
alias goOUT='cd ~/Downloads/print_and_delete'

alias goMp3='cd ~/code/mp3/'
alias goHelp='cd ~/code/jimHelp/doc/'
alias goNSE='cd ~/code/NSE_project/'
alias goCurl='cd ~/code/zsh_project/CURL_examples/'
alias goPublish='cd ~/code/code_publish/'
alias goZsh='cd ~/code/zsh_project/'



#	config
alias goDot='cd ~/dotfiles'
alias goVim='cd ~/.config/nvim/'
alias goTmux='cd ~/.config/tmux/'

# ~/bin too crowded
# use ~/.local/bin for scripts
#
alias goBin='cd ~/.local/bin/'
alias go.local.bin='cd ~/.local/bin/'
alias goConfig='cd ~/.config/'
alias goBackup='cd ~/.config/nvim/backup/'
alias cx='chmod +x'				# USE:    cx  new_script.sh

#	docs
alias goDocs='cd ~/code/docs'
alias goLegal='cd ~/code/docs'

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

# show sym links only
alias lsym='ls -l *(@)'

# directories only
alias ldir='ll -d *(/)'

#	R --no-save
alias R='R --no-save'
# GREP
alias grep='grep --color=always'
