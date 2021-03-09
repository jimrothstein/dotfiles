<<<<<<< HEAD
# Purity
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
#
# install prompt widget?
autoload -Uz promptinit; promptinit

# prompt -p  # to see choices, select:
prompt adam1

=======


ZSH_THEME="intheloop"

#	Prompt is usually set in THEME
#	this is from "intheloop"
echo "set prompt in THEME"



PROMPT='
%{$fg_bold[grey]%}[%{$reset_color%}%{$fg_bold[${host_color}]%}%n@%m%{$reset_color%}%{$fg_bold[grey]%}]%{$reset_color%}
#%{$fg_bold[blue]%}%10c%{$reset_color%} $(git_prompt_info) $(git_remote_status)
#%{$fg_bold[cyan]%}❯%{$reset_color%} '
#
#
autoload -U colors && colors 

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() {
  vcs_info
}

setopt prompt_subst
# history #, pwd
PROMPT='%h %~> '
PROMPT='${vcs_info_msg_0_}%h %~> '
zstyle ':vcs_info:git*' actionformats "%s  %r/%S %b %m%u%c "
>>>>>>> 9222441be7a830dcdee6280930fe71c34116175f
