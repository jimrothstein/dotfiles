echo "this is initialize.zsh"

# xmodmap is ancient
# xmodmap ~/.xmodmap

# On HP,  see X11  config

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
