#!/usr/bin/zsh

# PURPOSE:  Given missing keys (sudo apt update), this script should fix.

#  $1 is public key presented in error msg.

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $1
