# bind to <Alt-a>  echo hello <ENTER>
#
bindkey -s "^[a" 'echo "hello"^M'

# <Alt-s> to run nvims (TODO: how to add 2nd ^M)
bindkey -s "^[s" 'nvims^M'
