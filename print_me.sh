#!/bin/zsh
# 013_print_me.sh

#-----------------
# copy file to  print folder
#-----------------


# check # lines
z="$(wc -l < "$1")"
echo "$1" ${z}

cp "$1" ~/Downloads/print_and_delete
exit

