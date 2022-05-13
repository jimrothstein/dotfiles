#!/bin/zsh

# USAGE:   ./create_soft_link.sh
# PURPOSE:   This script creates soft links that point to ~/dotilfes.

# -f forces, in event a link aleady exists.  This will overwrite.
#
#
# 	TODO:
# 	~/.local/bin is not yet backedup 
# 	~/.ssh 
# 	any cron jobs
#

# ~/.config/zsh
ln -sf ~/dotfiles/.zshrc 		~/.config/zsh/.zshrc
ln -sf ~/dotfiles/completion.zsh 	~/.config/zsh/completion.zsh
ln -sf ~/dotfiles/prompt.zsh 		~/.config/zsh/prompt.zsh
ln -sf ~/dotfiles/aliases.zsh 		~/.config/zsh/aliases.zsh


# in  ~/
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.Rprofile ~/.Rprofile
ln -sf ~/dotfiles/start_tmux.sh ~/start_tmux.sh
ln -sf ~/dotfiles/.Renviron  ~/.Renviron
ln -sf ~/dotfiles/.zshenv  ~/.zshenv

ln -sf ~/dotfiles/.xinitrc  ~/.xinitrc
ln -sf ~/dotfiles/.Renviron  ~/.Renviron



# from ~/.config  


# in ~/docs


# ~/.config/nvim/
ln -sf ~/dotfiles/init.lua ~/.config/nvim/init.lua
#
# ~/.config/nvim/lua/jim
ln -sf ~/dotfiles/keymaps.lua ~/.config/nvim/lua/jim/keymaps.lua
ln -sf ~/dotfiles/options.lua ~/.config/nvim/lua/jim/options.lua
ln -sf ~/dotfiles/packer.lua ~/.config/nvim/lua/jim/packer.lua
ln -sf ~/dotfiles/windows.lua ~/.config/nvim/lua/jim/windows.lua
ln -sf ~/dotfiles/telescope.lua ~/.config/nvim/lua/jim/telescope.lua


#
#  directories



