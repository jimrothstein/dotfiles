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
#	Step #1, UPDATE
#	youtube-dl -U
#
#   Step #2, UPDATE ~/dotfiles/_DEC_youtube_dl.sh
#
#   USAGE:  ~/bin/youtube_dl.sh     (soft link to dotfile version)
# ====================


#	youtube_dl.sh
#	USAGE:   zsh youtube_dl.sh
#	DOWNLOADS  music in .ogg format
#	list	must be "public"
#
#
#
#	-i  ignore errors
#	-v  verbose
#	-- audio-format  best (default), aac, vorbis ...
#	-F  list all formats of requested video
##
##  Update:
##  Tue  01 Feb 2022
#
list=PLbcglKxZP5POOrsA37mx44LnPeQ_u-1RL

dir=~/mp3_files/

mylist=https://www.youtube.com/playlist?list="${list}"

youtube-dl -x -i --audio-format vorbis \
	-o '${dir}''%(autonumber)s_%(artist)s_%(title)s_'$(date +%d%b%Y)'.%(ext)s' \
	 ${mylist}
exit	


# Download just ONE  video?
#
#
# youtube-dl -x -i [video id ONLY]

# NOT with complete URL
#
# I get "no match found"
# youtube-dl -x -i https://.....



