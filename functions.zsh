#!/bin/zsh
#
#file <- "functions.zsh"
#	Sun May 22 00:54:12 PDT 2022
#	TODO:
#		- differnce:  source this file vs using autoload
#		-	rename, improve shell fcts test, test2  
#		- trim() :  add 2 inputs begin/end columns
#		- trim() :  echo 'trim in effect' to use
#
#
# =========================================================
#	PURPOSE:	SHELL FUNCTIONS:  Not  shell script. 
#	USAGE:	at CLI > test <cR>  will print date
#					ie just type function name at CLI
# =========================================================
test() { echo $(date +"%a_%d%b%Y") }





#	trim: keep 1st 20 lines;  1st 20 characters from std input
trim() {head -20 | cut -c 1-20}


