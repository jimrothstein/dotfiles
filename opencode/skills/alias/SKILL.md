---
name: alias
description:  Use this skill when ever user wants to list, create or delete zsh alias.
---


## File with zsh aliases
- ~/dotfiles/aliases.zsh
- do not modify any other files

## List alias
- Read aliases.zsh
- list all aliases in alphabetically order, and in table, example 
|alias|zsh command|
|goBin|cd ~/bin/|
|goConfig|cd ~/.config/|


## Create alias
- User provides new alias name and command: `alias <name>='<command>'`
- Check if alias name already exists in aliases.zsh
  - If exists: warn user and stop (do not overwrite unless user explicitly confirms)
- Insert new alias line in correct alphabetical position among existing aliases
- Save the file

## Remove alias
- When user says "delete alias" or "remove alias", find the alias in aliases.zsh
- Display the alias to user.   Wait for confirmation.
- Example:  if user says "remove goBin alias":  
[ ] Find the line and display to user. (alias goBin='cd ~/bin/') 
[ ] Ask for user permisison to delete.   
[ ] If user approves, then delete this single line.
[ ]Save the file.
