#!/bin/zsh

# USAGE:   ./create_soft_link.sh
# PURPOSE:   This script creates soft links that point to ~/dotilfes.

# -f forces, in event a link aleady exists.  This will overwrite.

# in  ~/
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.Rprofile ~/.Rprofile
ln -sf ~/dotfiles/start_tmux.sh ~/start_tmux.sh
ln -sf ~/dotfiles/.Renviron  ~/.Renviron


ln -sf ~/dotfiles/init.vim 		~/.config/nvim/init.vim

# in ~/docs
ln -sf ~/docs/medical/2020/2020_medical_dds_notes.md    ~/docs/medical_notes

#  directories
#
ln -sf ~/dotfiles/vim-myhelp-docs/ ~/vim-myhelp-docs



