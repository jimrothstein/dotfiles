#		PURPOSE:	maps "capslock" key to Escape.
#		.xinitrc is one (of many) ways to configure X11
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
