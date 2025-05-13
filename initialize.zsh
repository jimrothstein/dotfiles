echo "this is initialize.zsh"

# xmodmap is ancient
# xmodmap ~/.xmodmap

# On HP,  see X11  config


## ------------------------  X11, xset

## xset tools to manage X11
## xset q    # display current X11 settings
## REF:  https://askubuntu.com/questions/763994/screen-times-out-in-i3-wm

## set screen saver to 1200 sec (20 minutes)
xset s 1200
## ------------------------  X11, xset

## print OS
echo $OSTYPE
echo $hostname

export HOST=$(hostname)

##  test if MACHINE_NAME was set    
if [[ -n $HOST ]] ; then
    echo $(hostname)
else
	echo "X never set "
fi
if [[ $(hostname) == "jim-ThinkPad-T480" ]]
	then
		echo "You are working on lenovo"
	else
		echo "Are you working on HP laptop?"
	fi
