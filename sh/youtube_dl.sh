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
#
#  --cookies-from-browser firefox (if youtube wants permission)
#  -I --playlist-items 1,3
#	-o FORMAT
#	for	 text xxx
#	include var:   ${day}
#	include command:   example: $(date -I)
#	-i  ignore errors
#	-v  verbose
#	-- audio-format  best (default), aac, vorbis ...
#	-F  list all formats of requested video
#	-q  quiet
#	--download_archive  creates with ID of downloaded files
#	--dateafter DATE  (only download newer videos, uses date added to playlist?)
#	--no-overwrites
#	--ignore-errors
# ----------------------------------------
#
# mkdir -p ~/mp3_downloads/

# setup
list="PLbcglKxZP5PNPlN66_s2GoWS_Ystw6c8j"

## (MASTER COPY is on external SATA SSD. 240GB)
dir=/home/jim/mp3_downloads/

## url
mylist=https://www.youtube.com/playlist?list="${list}"

#  For prefix
#	-o ${dir}'%(autonumber)s_%(artist)s_%(title)s_'$(date +%d%b%Y)'.%(ext)s' \
    #	 limit to 1,3 files
# -I 1,3
#
#
#  .archive.txt - IDs of all downloaded files (since 10AUG2026)
#

yt-dlp \
  --cookies-from-browser firefox \
  -x -i \
  --audio-format vorbis \
  --download-archive ${dir}.archive.txt \
  -o ${dir}'%(artist)s_%(title)s_'$(date +%d%b%Y | tr '[:lower:]' '[:upper:]')'.%(ext)s'  ${mylist}

exit

# SEARCH
# list 10, with ID, Title
# yt-dlp ytsearch10:lebron james --get-id --get-title
#
