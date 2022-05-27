#!/bin/zsh
#
#file <- "functions.zsh"
#	Sun May 22 00:54:12 PDT 2022
#	TODO:
#		-	rename, improve shell fcts test, test2  
#
#
# =========================================================
#	PURPOSE:	Not a shell script, this is a shell function
#	USAGE:	at CLI > test <cR>  will print date
#					ie just type function name at CLI
# =========================================================
test() { echo $(date +"%a_%d%b%Y") }



# =========================================================
#	PURPOSE:	Runs git_add_push script for CURRENT directory
#						(ie push to github)
#	USAGE:	> test2 <CR>
# =========================================================
#
test2() { source ~/.local/bin/git_add_push.sh . }

#  sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io docker-compose-plugin
# 
# 
#   sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io docker-compose-plugin
# sudo apt-get install docker-ce=18.03.1~ce~3-0~ubuntu docker-ce-cli=18.03.1~ce~3-0~ubuntu containerd.io docker-compose-plugin
# 18.03.1~ce~3-0~ubuntu
# 18.03.1~ce~3-0~ubuntu

