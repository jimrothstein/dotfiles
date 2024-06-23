# Set personal aliases, overriding those provided by oh-my-zsh 
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
#   v = number
alias dirs='dirs -lpv'

# --------------------------------------------------------------------------------
#   ALIAS - KEEP ALPHA order
# --------------------------------------------------------------------------------


#	coding, 
alias goADMIRAL_adam='cd ~/code/pharmaverseadam/R'
alias goADVANCED_R='cd ~/code/try_things_here/ADVANCED_R'
alias goBASE='cd ~/code/try_things_here/BASE/'
alias goBee='cd ~/code/beekeeper/'
alias goBlog='cd ~/code/jimrothstein.github.io/'   # same as goJimrothstein
alias goBUILD='cd ~/code/QUARTO/BUILD_qmd/'
alias goCode='cd ~/code/'
alias goDocs='cd ~/code/docs'
alias goEmacs='cd ~/.config/emacs'
alias goDT='cd ~/code/try_things_here/DT/'
alias goHealth='cd ~/code/health_labs/'
alias goHTTR2='cd ~/code/httr2_project/'
alias goJimrothstein='cd ~/code/jimrothstein.github.io'
alias goJobs='cd ~/code/docs/jobs/'
alias goKickstart='cd ~/.config/kickstart/'
alias goLazy='cd ~/.local/share/nvim'
alias goLua='cd ~/code/lua_project/'
alias goNectar='cd ~/code/nectar/'
alias goMp3='cd ~/code/mp3/'
alias goNSE='cd ~/code/try_things_here/NSE_project/'
alias goPartD='cd ~/code/SHINY/PART_D'
alias goPublish='cd ~/code/QUARTO'  
alias goQuarto='cd ~/code/QUARTO'  
alias goSdtm='cd ~/code/sdtmchecks/'
alias goRacket='cd ~/code/racket_project'
alias goRscripts='cd ~/code/jimTools/Rscripts'
alias goRapid='cd ~/code/rapid/'
alias goRHome='cd /usr/share/R/'              # R_HOME
alias goShaina='cd ~/code/stats_project/shaina/' 
alias goStats='cd ~/code/stats_project/'
alias goTry='cd ~/code/try_things_here/'
alias goTools='cd ~/code/jimTools/'
alias goShiny='cd ~/code/SHINY'
alias goTech='cd ~/code/docs/tech_notes'
alias goTT='cd ~/code/TIDY_TUESDAY/'
alias goVECTOR='cd ~/code/try_things_here/VECTORS_LISTS/'
alias goYoutubeR='cd ~/code/youtubeR/R/'
alias goWapir='cd ~/code/httr2_project/WAPIR/'
alias goZsh='cd ~/code/zsh_project/'
alias goZC='cd ~/.config/zsh'               # go Zsh Config

#	config
alias goDot='cd ~/dotfiles'
alias goVim='cd ~/.config/nvim/'
#
alias goBin='cd ~/bin/'
alias goConfig='cd ~/.config/'
alias goBackup='cd ~/.config/nvim/backup/'
alias goDownloads='cd ~/Downloads/'
alias cx='chmod +x'				# USE:    cx  new_script.sh

#	docs

# export (so go<TAB> works)
export goCode goDot goVim goBin 
export goYoutubeR goTry
export goRRapply  

##
#   Added 24JUNE 2023
export R_VERSION=4.3.1

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
