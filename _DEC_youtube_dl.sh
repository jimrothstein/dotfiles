#!/bin/zsh
# ------------------------
#	WORKING!
#	EX:	-o FORMAT
#	for	 text xxx
#	for var  ${day}
#	for command $(date -I)
#------------------------
#
#
#
#
# ====================
##  Fri  09 Apr 2021

# FORK
# USE yt-dlp
# ====================


#	youtube_dl.sh
#	USAGE:   zsh youtube_dl.sh
#	DOWNLOADS  music in .ogg format
#	list	must be "public"
#
# ------------
#  07 DEC 2019	
# ------------
#
#	Step #1, UPDATE
#	youtube-dl -U
#
#	-i  ignore errors
#	-v  verbose
#	-- audio-format  best (default), aac, vorbis ...
#	-F  list all formats of requested video
##

day=""
list=PLbcglKxZP5PMDe2rhvTaahCV3BzFurnYJ
dir=from_youtube/

mylist=https://www.youtube.com/playlist?list="${list}"

youtube-dl -x -i --audio-format vorbis \
	--autonumber-start 03000 \
	-o '${dir}''%(autonumber)s_%(artist)s_%(title)s_'$(date -I)_${day}'.%(ext)s' \
	 ${mylist}
exit	


# Download just ONE  video?
#
#
youtube-dl -x -i [video id ONLY]

# NOT with complete URL
#
# I get "no match found"
youtube-dl -x -i https://.....



