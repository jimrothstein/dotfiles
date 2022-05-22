#!/bin/zsh
#
#file <- "functions.zsh"
#
#
#	PURPOSE:	Not a shell script, this is a shell function
#	USAGE:	at CLI > test <cR>  will print date
#					ie just type function name at CLI
test() { echo $(date +"%a_%d%b%Y") }



test2() { source ~/.local/bin/git_add_push.sh . }
