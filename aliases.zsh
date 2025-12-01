# Set personal zsh aliases
# For a full list of active aliases, run `alias`.
#
# ------------------------  To find WHERE alias defined:
# >which <alias>
# >grep -r '<alias=xxxx>'
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


#  Using ex as editor

#	coding, 
alias goAdmiral='cd ~/code/admiral/R'
alias goad='cd ~/code/admiraldev/R'
alias goADVANCED_R='cd ~/code/try_things_here/ADVANCED_R'
alias goBASE='cd ~/code/try_things_here/BASE/'
alias goBlog='cd ~/code/jimrothstein.github.io/'   # same as goJimrothstein
alias goCode='cd ~/code/'
alias goDocs='cd ~/code/docs'
alias goEmacs='cd ~/code/elisp_project/'
alias goElisp='cd ~/code/elisp_project/'
alias goDT='cd ~/code/try_things_here/DT/'
alias goHealth='cd ~/code/health_labs/'
alias goHTTR2='cd ~/code/httr2_project/'
alias goJimrothstein='cd ~/code/jimrothstein.github.io'
alias goJobs='cd ~/code/docs/jobs/'
alias goghactions='cd ~/code/gh_actions_project/'
alias goLSR='cd ~/code/LSR_rbook/'
alias goMp3='cd ~/code/mp3/'
alias goNSE='cd ~/code/try_things_here/NSE_project/'
alias goPublish='cd ~/code/publish_project/'
alias goQuarto='cd ~/code/publish_project/'
alias goSdtm='cd ~/code/sdtmchecks/'
alias goRacket='cd ~/code/racket_project'
alias goRscripts='cd ~/code/jimTools/Rscripts'
alias goRapid='cd ~/code/rapid/'
alias goRHome='cd /usr/share/R/'              # R_HOME
alias goShaina='cd ~/code/stats_project/shaina/' 
alias goStats='cd ~/code/stats_project/'
alias goTeal='cd ~/code/teal_project/'
alias goTry='cd ~/code/try_things_here/'
alias goTools='cd ~/code/jimTools/'
alias goShiny='cd ~/code/shiny_project/'
alias goTech='cd ~/code/docs/tech_notes'
alias goVECTOR='cd ~/code/try_things_here/VECTORS_LISTS/'
alias goYoutubeR='cd ~/code/youtubeR/R/'
alias goWapir='cd ~/code/httr2_project/WAPIR/'
alias goZsh='cd ~/code/zsh_project/'
alias goZC='cd ~/.config/zsh'               # go Zsh Config

#	config
alias goDot='cd ~/dotfiles'
#
alias goBin='cd ~/bin/'
alias goConfig='cd ~/.config/'
alias goDownloads='cd ~/Downloads/'
alias cx='chmod +x'				# USE:    cx  new_script.sh

#	docs

# export (so go<TAB> works)
export goCode goDot goVim goBin 
export goYoutubeR goTry
export goRRapply  

##
# ============
# ll alias
# ============
# long,
# 1-per line,
# desc (size),
# no permissions, more
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
