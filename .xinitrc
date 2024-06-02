#  PURPOSE:	maps "capslock" key to Escape.
#      .xinitrc is one (of many) ways to configure X11
#
#   30JUNE2024  -  CAPSLOCK now  works like ESC
#   - on HP845 G7/linuxmint  21.3
#   - TODO:  i  made  an addition to  /etc/X11/xorg.conf.d/swap_2_escape.conf
#   -        works,  but do not understand
#
#   17JULY2023, conflict between ebook-view (calibre) and esc:swap....
#   Using setxkbmap -option caps:escape  seems to fix
#   REF <archwiki setxkbmap>
#		
setxkbmap -option caps:escape
#
# ----------- Deprecated ---------------------------------------------
#		-	USE kev to find keycode for "capslock" and "escape"
#		- xmodmap is older, but simpler.
#		- newer is kxb... but I find more effort to figure out simple things. -	SEE  tech_notes
#
# xmodmap -e "keycode 133 = Escape"

# lenvovo T480
#
# ONE Method
# xmodmap -e "keycode 66 = Escape"

# SECOND Method (worked, prior to 17JULY2023)
# xmodmap ~/.xmodmap

# -----------  ---------------------------------------------
