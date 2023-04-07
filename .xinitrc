#		PURPOSE:	maps ChromeBox "capslock" key to Escape.
#
#		-	133 is escape; to find this use > kev...
#		- xmodmap is older, but simpler.
#		- newer is kxb... but I find more effort to figure out simple things. -	SEE  tech_notes
#
xmodmap -e "keycode 133 = Escape"

# lenvovo T480
xmodmap -e "keycode 66 = Escape"
