" ~/.config/nvim/init.vim -> ~/dotfiles/init.vim
"
"
"
imap jj <Esc>
set number

"
"####    map terminal ####
tnoremap <Esc> <C-\><C-n>		" return to normal mode
					
tnoremap <A-h> <C-\><C-n><C-w>h		" (insert)jump to left screen
tnoremap <A-l> <C-\><C-n><C-w>l		" (insert) jump to right screen

nnoremap <A-h> <C-w>h			" (normal) jump to left screen
nnoremap <A-l> <C-w>l			" (normal) jump to right screen
