#!/bin/zsh
# ------------------------
#	WORKING!
#
#	EX:	-o FORMAT
#	for	 text xxx
#	for var  ${day}
#	for command $(date -I)
#------------------------
#
#	youtube_dl.sh
#	USAGE:   zsh youtube_dl.sh
#	DOWNLOADS  music in .ogg format
#	youtube list	must be "public"
#
# ------------
#  07 DEC 2019	
#  updated 8 APR 2021
#  updated 7 SEP 2021
# ------------
#
#	Step #1, UPDATE
#	youtube-dl -U
#
day=""
list=PLbcglKxZP5PMiGsEvRHdOlRF76eS2oVQP
dir=~/mp3_files/

mylist=https://www.youtube.com/playlist?list="${list}"

youtube-dl -x -i --audio-format vorbis \
	--autonumber-start 01000 \
	-o ${dir}'%(autonumber)s_%(artist)s_%(title)s_'$(date -I)_${day}'.%(ext)s' \
	 ${mylist}

# exit	



