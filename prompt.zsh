# file <- "/home/jim/.config/zsh/prompt.zsh#"
#
# ---
# TAGS:  VCS_INFO, PROMPT, PS1, autoload,  
# ---
#
#~/code/MASTER_INDEX.md



#####################################################################################################
#	STOLE this from 
#	!so https://stackoverflow.com/questions/1128496/to-get-a-prompt-which-indicates-git-branch-in-zsh
#
# parse_git_branch() {
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#####################################################################################################
#
# setopt PROMPT_SUBST
# PROMPT='%9c%{%F{green}%}$(parse_git_branch)%{%F{none}%} $ '

# =========
## PROMPT
# =========
# Following: https://voracious.dev/a-guide-to-customizing-the-zsh-shell-prompt
# REF:  Z Shell manual: Ch 13 prompt.
#                     : Ch 26 user contribution (for vcs_info)
#

#   Both PS1 and PROMPT will work
#   Claim:  use PROMPT (?)
#
## include colors
autoload -U colors && colors 

## method 1 (works) , but duplicates in zstyle

# PS1='%h_%n@%m %F{red}%/%f $ '
# exit


# %h  = comand no
# %n@%m = user@machine
# %F{red} = begin color red
# %/
# %f = end color


# method 2 (VCS_INFO)
# ============
##  VCS_INFO
# ============

##  VCS_INFO is 3rd party add-in. To display git or other svn info.  Configured by zstyle.
##  Details can be taken as the default:   The purpose is create variable
#{vcs_info_msg_0_}, which holds versioning info and is used in PROMPT.
#
## REF:  https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html
## Enable vcs_info.
## Call it in a pre-command.
## Include the variable in your prompt.
## 

## load & run module, creates variable ${vcs_info_msg_0_}
  autoload -Uz vcs_info # enable vcs_info
  precmd () { vcs_info } # always load before displaying the prompt

## format
## zstyle has many features, formats, autoformats ....
  #zstyle ':vcs_info:*' formats ' %s(%b)' # git(main)
  zstyle ':vcs_info:*' formats ' (%F{red}%b%u%c%f)' # git(main)

# %s = version control sysem (eg 'git')
# %b = branch
# %u = unstage changes
# %c = staged changes

## Don't Need?  
#  zstyle ':vcs_info:*' enable git svn
#
#
## Works better WITH this line (activates $vcs...)
    setopt prompt_subst


## Put all together:
  # PROMPT='%h_${vcs_info_msg_0_}%# '  # minimal
  PS1='%h_%n@%m %F{green}%/%f$vcs_info_msg_0_ $ ' # david@macbook /tmp/repo (main) $



## zstyle -more info
  ## general format
  #zstyle ':vcs_info:git*' formats "%{$fg[grey]%}%s %{$reset_color%}%r/%S%{$fg[grey]%} %{$fg[green]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "

## make clearer?
  #zstyle ':vcs_info:git*' actionformats "%s  %r/%S %b %m%u%c "




# -------------------------------------------------
#	RPROPMT, on the far RIGHT
# -------------------------------------------------
# Works, but can take up too much space
# RPROMPT='%w::$(date +%b)::%t::$vcs_info_msg_0_'



#############################################
### MOVE to new file:  autoload or equivalent
#   <X-x><X-e> at CLI will edit text in vim
autoload -U edit-command-line
zle -N edit-command-line 
bindkey -M vicmd v edit-command-line
