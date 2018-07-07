#!/bin/bash


#tmux new-session jimSession
tmux -f /dev/null			# no config
tmux rename-session jimSession
tmux rename-window win_tmux
tmux new-window -n win_nvim
tmux new-window -n win_rstudio
tmux new-window -n win_other
tmux select-window -t jimSession:1	# win_nvim

