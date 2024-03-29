 #!/bin/zsh

# USAGE:   ./create_soft_links.sh
# PURPOSE:   This script creates soft links that point to ~/dotilfes.

# -f forces, in event a link aleady exists.  This will overwrite.
#
#
# 	TODO:
# 	~/.ssh 
# 	any cron jobs
# 	-	~/.Renviron - what to do?
# 	include SPELL  (en.utf-8.add, medical.utf-8.add)
#

lazy=1      # use lazyvim
# in  ~/    $HOME
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore ~/.gitignore
ln -sf ~/dotfiles/.Rprofile ~/.Rprofile
ln -sf ~/dotfiles/.Renviron  ~/.Renviron
ln -sf ~/dotfiles/.zshenv  ~/.zshenv

#	Lenovo T480  NEED
ln -sf ~/dotfiles/.xinitrc  ~/.xinitrc

# .gitignore should block 
ln -sf ~/dotfiles/.Renviron  ~/.Renviron

# in ~/dotfiles			 (backup with git)
# in ~/.local/bin    (backup with git)


# from ~/.config  

# ~/.config/tmux/
ln -sf ~/dotfiles/.tmux.conf 		~/.tmux.conf

# ~/.config/zsh
ln -sf ~/dotfiles/.zshrc 		~/.config/zsh/.zshrc
ln -sf ~/dotfiles/completion.zsh 	~/.config/zsh/completion.zsh
ln -sf ~/dotfiles/prompt.zsh 		~/.config/zsh/prompt.zsh
ln -sf ~/dotfiles/aliases.zsh 		~/.config/zsh/aliases.zsh
ln -sf ~/dotfiles/bindkey.zsh		~/.config/zsh/bindkey.zsh
ln -sf ~/dotfiles/functions.zsh		~/.config/zsh/functions.zsh



# ~/.config/nvim/
# no init.lua with lazyivm 
# ln -sf ~/dotfiles/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/lazy/lua/config/ ~/.config/nvim/lua/config  
ln -sf ~/dotfiles/lazy/lua/plugins/ ~/.config/nvim/lua/plugins  

if [ $lazy -eq 1 ]; then echo " using lazyvim"
else
#
# ~/.config/nvim/lua/jim
ln -sf ~/dotfiles/keymaps.lua ~/.config/nvim/lua/jim/keymaps.lua
ln -sf ~/dotfiles/options.lua ~/.config/nvim/lua/jim/options.lua
ln -sf ~/dotfiles/packer.lua ~/.config/nvim/lua/jim/packer.lua
ln -sf ~/dotfiles/windows.lua ~/.config/nvim/lua/jim/windows.lua
ln -sf ~/dotfiles/telescope.lua ~/.config/nvim/lua/jim/telescope.lua
ln -sf ~/dotfiles/Nvim-R.lua ~/.config/nvim/lua/jim/Nvim-R.lua
ln -sf ~/dotfiles/treesitter.lua ~/.config/nvim/lua/jim/treesitter.lua
ln -sf ~/dotfiles/utils.lua ~/.config/nvim/lua/jim/utils.lua
ln -sf ~/dotfiles/bufferline.lua ~/.config/nvim/lua/bufferline.lua		

fi

# ~/.config/nvim/spell ??


# ~/.config/nvim/templates
ln -sf ~/dotfiles/tex/skeleton.tex ~/.config/nvim/templates/skeleton.tex
ln -sf ~/dotfiles/skeleton.sh ~/.config/nvim/templates/skeleton.sh
ln -sf ~/dotfiles/skeleton.R ~/.config/nvim/templates/skeleton.R
ln -sf ~/dotfiles/skeleton.qmd ~/.config/nvim/templates/skeleton.qmd
ln -sf ~/dotfiles/skeleton.md ~/.config/nvim/templates/skeleton.md
ln -sf ~/dotfiles/skeleton.Rmd ~/.config/nvim/templates/skeleton.Rmd

#
#  directories



