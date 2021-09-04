# file <- "/home/jim/.config/zsh/prompt.zsh#"
#
# ---
# TAGS:  VCS_INFO, PROMPT, PS1, autoload,  
# ---
#
#~/code/MASTER_INDEX.md




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

#
#
#
# ========
# LEGACY (not used)
# ========
# Purity
#
# by Kevin Lanni
# https://github.com/therealklanni/purity
# MIT License

# For my own and others sanity
# git:
# %b => current branch
# %a => current action (rebase/merge)
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)
#
## %s
##     The current version control system, like git or svn.
## %r
##     The name of the root directory of the repository
## %S
##     The current path relative to the repository root directory
## %b
##     Branch information, like master
## %m
##     In case of Git, show information about stashes
## %u
##     Show unstaged changes in the repository
## %c
##     Show staged changes in the repository 
#
#
#
# install 'standard prompt widget' ?
# afterwards  | prompt -p | lists all installed themes
#  autoload -Uz promptinit; promptinit

# prompt -p  # to see choices, select:
#  prompt adam1


#  ZSH_THEME="intheloop"




# PROMPT='
# %{$fg_bold[grey]%}[%{$reset_color%}%{$fg_bold[${host_color}]%}%n@%m%{$reset_color%}%{$fg_bold[grey]%}]%{$reset_color%}
#%{$fg_bold[blue]%}%10c%{$reset_color%} $(git_prompt_info) $(git_remote_status)
#%{$fg_bold[cyan]%}❯%{$reset_color%} '
#
#




