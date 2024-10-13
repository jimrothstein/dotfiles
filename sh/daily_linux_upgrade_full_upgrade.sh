#!/bin/zsh

#   PURPOSE:    daily linux  update, upgrade packages
#   TODO:
#       *   Works, but need to better understand update process
#
sudo apt update && sudo apt full-upgrade -y

#   update is required
#   full-upgrade avoids need to confirm -y (nope)
