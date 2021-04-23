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

ctags -R  --exclude=@.ctagsignore ~/code
# ctags -R  --exclude=.ctagsignore ~/code

## WHY?   ctags is verbose!

if [ 1 -eq 0 ]
then
  ctags -R --exclude=dir1 --exclude=dir2 --exclude=dir3 .
fi

#   if [ -z $PS1 ] # no prompt?
# ### if [ -v PS1 ]   # On Bash 4.2+ ...
# then
#   # non-interactive
#     echo "no prompt"  ...
# else
#   # interactive					# this one
#     echo "yes prompt"
# fi
# exit
