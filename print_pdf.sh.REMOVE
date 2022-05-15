#!/bin/zsh
# ----------------------------
#	FILE:	
# ----------------------------
#
# =========================
#
#   PURPOSE:  Print pdf files using pandoc with tex in -- include-in-header

# 	USAGE:	pandoc <file.md> <out.pdf>
#
#	  NOTE:			 FILE geometry.tex MUST be in same directory as file to print
# (file.md)


# =========================
#
#
pandoc "$1" \
				-f markdown \
				--include-in-header ~/dotfiles/geometry.tex \
				-o "$2"

exit

