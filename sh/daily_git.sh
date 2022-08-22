#!/bin/zsh
#
#		file <- "daily_git.sh"
#	TODO

#		USAGE:		daily_git<CR>

##	Sat 13Aug2022
#		chron log says `git_add_push.sh` not found
#		As test, added canonical path to  few lines below 
#		
	line="==========================="
	echo "\n"
	echo "BEGIN ..." $line
	echo "--- daily_git.sh --- "
	echo "directory is .... ${1}"
	echo $(date) 
	echo $line

#	---------------------
#	FIRST, all the code repos
#	---------------------
#
cd /home/jim/code/mp3
/home/jim/.local/bin/git_add_push.sh .

cd /home/jim/code/youtube-api
/home/jim/.local/bin/git_add_push.sh .



cd /home/jim/code/publish_project
/home/jim/.local/bin/git_add_push.sh .

cd /home/jim/code/zsh_project
/home/jim/.local/bin/git_add_push.sh .

cd /home/jim/code/code_publish
/home/jim/.local/bin/git_add_push.sh .

cd /home/jim/code/docs
/home/jim/.local/bin/git_add_push.sh .

cd /home/jim/code/try_things_here
/home/jim/.local/bin/git_add_push.sh .

cd /home/jim/code/nvim_project
/home/jim/.local/bin/git_add_push.sh .

cd /home/jim/code/lua_project
/home/jim/.local/bin/git_add_push.sh .

cd /home/jim/code/SHINY
/home/jim/.local/bin/git_add_push.sh .


#	---------------------
#	BEGIN:			non - code REPOS 
#	---------------------
cd /home/jim/dotfiles
/home/jim/.local/bin/git_add_push.sh .

cd /home/jim/.local/bin/
/home/jim/.local/bin/git_add_push.sh .

cd
