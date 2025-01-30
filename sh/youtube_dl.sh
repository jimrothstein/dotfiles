#!/bin/zsh
# ------------------------
#	file <- "/home/jim/dotfiles/sh/youtube_dl.sh#"
# ---------------------------------------------------------------------------------------------
#       27 JAN 2025
#       adb sync - do not use
#       easiest:   use Thunar file mngr (offers to skip duplicates)

#       03 OCT 2024
#       Update:  yt-dlp -U   (# ignore prior update instructions, below)
# ---------------------------------------------------------------------------------------------
#       10 AUG 2024
#         ffmpeg, install via apt
# ---------------------------------------------------------------------------------------------
#       24 JUNE 2024
#         to upgrade:  use detailed instructions:   https://github.com/yt-dlp/yt-dlp/wiki/Installation
#         NO-Upgrade?   run sudo apt install yt-dlp
# ---------------------------------------------------------------------------------------------
#       20 JUNE 2023 
#   -   now using yt-dtl       BE SURE to use ~/sh/dotfiles version!
#   -   *youtube-dl*  do NOT USE.
#   -   REF:    https://github.com/yt-dlp/yt-dlp/wiki/Installation
# -------------------------------------------------------------------------------
#   USAGE:  (on youtube)
#   - Use `dl` playlist, for all videos to download (select from `to_Download`)
#   - download using this script.
#   - then, move all videos to `all music`
#   - then empty `dl`, but do not delete it
#   - MASTER COPY:  external BX500 SSD, 240GB
# -------------------------------------------------------------------------------------------
#	DOWNLOADS  music in .ogg format
#	- youtube list	must be "public"
#------------------------
#	-o FORMAT
#	for	 text xxx
#	include var:   ${day}
#	include command:   example: $(date -I)
#	-i  ignore errors
#	-v  verbose
#	-- audio-format  best (default), aac, vorbis ...
#	-F  list all formats of requested video
# ----------------------------------------
#
mkdir -p ~/latest_mp3_downloads/

# setup
list=PLbcglKxZP5PMzNbrnMtdwtoPkkCi64cbw

## (MASTER COPY is on external SATA SSD. 240GB)
dir=/home/jim/latest_mp3_downloads/

## url
mylist=https://www.youtube.com/playlist?list="${list}"

# download
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



