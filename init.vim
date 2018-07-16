" ~/.config/nvim/init.vim -> ~/dotfiles/init.vim
"
"
"
imap jj <Esc>
set number				" nonumber to turn off
colorscheme darkblue		" till I figure out better
set colorcolumn=81		" display right margin

noremap <C-s> :w<Enter>		" save file
"
"####### colors #####
"set background=dark			" easier to read on dark (black) background
"
set nohlsearch				" no highlight on search matches
"set noh				" compare
"
"####################


"#### Backup ####
set backup 
set backupdir=~/.config/nvim/backup/	" do not surround with quotes!
"################
"
"
"
"####    map terminal ####
tnoremap <Esc> <C-\><C-n>		" return to normal mode
					
tnoremap <A-h> <C-\><C-n><C-w>h		" (insert)jump to left screen
tnoremap <A-l> <C-\><C-n><C-w>l		" (insert) jump to right screen

nnoremap <A-h> <C-w>h			" (normal) jump to left screen
nnoremap <A-l> <C-w>l			" (normal) jump to right screen
