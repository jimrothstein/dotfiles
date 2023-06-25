#!/bin/zsh
# ------------------------
#	file <- "/home/jim/dotfiles/sh/youtube_dl.sh#"
#
# ---------------------------------------------------------------------------------------------
#       20 JUNE 2023 
#   -   now using yt-dtl       BE SURE to use ~/dotfiles version!
#
#		23 AUG 2022
#		-	source file is 
#		"/home/jim/dotfiles/sh/youtube_dl.sh"
#
#		5 AUG 2022
#		-	fix some notes
##      Update:
#		4 JULY 2022
#
##	    Update rules have changed:
##		REF:		http://ytdl-org.github.io/youtube-dl/download.html
##	
# -------------------------------------------------------------------------------------------
#   DO FIRST !
##  sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
##	sudo chmod a+rx /usr/local/bin/youtube-dl
# -------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------
#	youtube_dl.sh
# -------------------------------------------------------------------------------------------
#	USAGE:   zsh youtube_dl.sh
#	DOWNLOADS  music in .ogg format
#	youtube list	must be "public"
#
#
#	WORKING!
#	EX:	-o FORMAT
#	for	 text xxx
#	for var example:  ${day}
#	for command:   example: $(date -I)
#------------------------
#
#	-i  ignore errors
#	-v  verbose
#	-- audio-format  best (default), aac, vorbis ...
#	-F  list all formats of requested video
##
#
#list=PLbcglKxZP5POb1urZdM7wgIG0IgEXTeWz
list=PLbcglKxZP5PMzNbrnMtdwtoPkkCi64cbw

# dir=/home/jim/mp3_files/

# On Acer Chromebox?  [ problems with this dir]
dir='/mnt/chromeos/removable/USB\ Drive/home/jim/mp3_files/'

mylist=https://www.youtube.com/playlist?list="${list}"

# old
#youtube-dl -x -v -i --audio-format vorbis \
#	-o ${dir}'%(autonumber)s_%(artist)s_%(title)s_'$(date +%d%b%Y)'.%(ext)s' \
#	 ${mylist}



yt-dlp -x -v -i --audio-format vorbis \
	-o ${dir}'%(autonumber)s_%(artist)s_%(title)s_'$(date +%d%b%Y)'.%(ext)s' \
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



