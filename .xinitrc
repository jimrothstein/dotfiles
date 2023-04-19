#		PURPOSE:	maps "capslock" key to Escape.
#		.xinitrc is one (of many) ways to configure X11
#
#		
#
#		-	USE kev to find keycode for "capslock" and "escape"
#		- xmodmap is older, but simpler.
#		- newer is kxb... but I find more effort to figure out simple things. -	SEE  tech_notes
#
# xmodmap -e "keycode 133 = Escape"

# lenvovo T480
#
# ONE Method
# xmodmap -e "keycode 66 = Escape"

# SECOND Method
xmodmap ~/.xmodmap
