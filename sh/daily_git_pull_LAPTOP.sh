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
	echo "--- daily_git_pull.sh --- "
	echo "directory is .... ${1}"
	echo $(date) 
	echo $line

#	---------------------
#	FIRST, all the code repos
#	---------------------
#
cd /home/jim/code/mp3

cd /home/jim/code/youtube_api

cd /home/jim/code/zsh_project
git pull


cd /home/jim/code/docs
git pull

cd /home/jim/code/try_things_here
git pull


cd /home/jim/code/nvim_project
git pull

cd /home/jim/code/lua_project
git pull

# cd /home/jim/code/NSE_project
# git pull

cd /home/jim/code/SHINY
git pull


cd /home/jim/code/health_labs

cd /home/jim/code/code_publish
git pull

#	---------------------
#	BEGIN:			non - code REPOS 
#	---------------------
cd /home/jim/dotfiles
git pull

cd /home/jim/bin/
git pull

cd
