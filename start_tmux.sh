#!/bin/bash
## ~/dotfiles/start_tmux.sh


#### FAILS  thinks nesting ####

#tmux -f /dev/null			# no config
#tmux rename-session jimSession
###############################


#### WORKS ####

# If no server, TMUX creates one with new session command
tmux new-session -d -s jimSession
tmux rename-window win_tmux
tmux new-window -n win_nvim
tmux new-window -n win_rstudio
tmux new-window -n win_zotero
tmux new-window -n win_bash
tmux new-window -n win_other
tmux select-window -t jimSession:1	# win_nvim
tmux attach-session	-t jimSession

#### vim :checkhealth ####
# set 29 JUNE 2018 because :checkhealth said to
tmux set-option -sg escape-time 10
tmux set-option -g  default-terminal "screen-256color"
# but then checkhealth dislikes $TERM and TMUX


# CHECK
echo "test -z $TMUX"		# if non zero string, displays file
