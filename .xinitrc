#		PURPOSE:	maps ChromeBox "capslock" key to Escape.
#		-	133 to find this use > kev...
#		- xmodmap is older, but simpler.
#		- newere is kxb... but I find more effort to figure out simple things.
#		-	SEE  tech_notes
#
xmodmap -e "keycode 133 = Escape"
