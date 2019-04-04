#!/bin/bash
## ~/dotfiles/start_tmux.sh



#### WORKS ####

# If no server, TMUX creates one with new session command
tmux new-session -d -s jimSession
tmux rename-window 'win_tmux'
tmux new-window -n 'win_code'
# create panel in nvim, toggle is ctrl-b ;
tmux split-window -h

tmux new-window -n win_docs
tmux new-window -n win_
tmux new-window -n win_w3m


tmux select-window -t jimSession:1	# win_nvim
tmux attach-session	-t jimSession

#### vim :checkhealth ####
# set 29 JUNE 2018 because :checkhealth said to
tmux set-option -sg escape-time 0
tmux set-option -g  default-terminal "color-256color"
# but then checkhealth dislikes $TERM and TMUX


# CHECK
echo "test -z $TMUX"		# if non zero string, displays file
