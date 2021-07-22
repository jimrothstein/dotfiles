#!/bin/zsh
# ----------------------------
#	FILE:	032_find_for_PE_sed_name_change.sh
# 	DIR:	/home/jim/code/bash_project
# ----------------------------
# 	USAGE:	./032... 1
#   PURPOSE:  	find for PE change names ... {} \;
#   SEE ALSO:  woolridge: https://mywiki.wooledge.org/BashFAQ/073
# ----------------------------


##  PURPOSE:   run ctags, exclude files etc.


## BEST WAY, use alias to .ctagsignore
# -R recursive
# --exclude   use file to identify files/dir to exclude
# -f  dir to put resuling tagss file
# ~/code   target directory

ctags -R  --exclude=~/.ctagsignore -f ~/code/tags ~/code
# ctags -R  --exclude=.ctagsignore ~/code

## WHY?   ctags is verbose!

if [ 1 -eq 0 ]
then
  ctags -R --exclude=dir1 --exclude=dir2 --exclude=dir3 .
fi

