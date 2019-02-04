" ~/.config/nvim/init.vim -> ~/dotfiles/init.vim
"
" ---- mapleader ----
" restart vim if mapleader changed
let mapleader=","		" default = \ 
map <Leader>A :echo "hi"<enter> " <Leader> is syntax, not variable:
let localmapleader="\\"		" note:  escaped

" -----------------
"  map for editing
" -----------------
"
" avoid commnets on same line as mapping,   vim can get confused
noremap <C-s> :w<Enter>		" save file

" exit Insert mode
inoremap jj <Esc>			" always use Xnoremap
inoremap jk <Esc>			" less damage if normal mode!
inoremap kk <Esc>			" 


" comments
nnoremap <Leader>#	0i#<esc>
"
"##### frequent files ####
nnoremap <Leader>cd  :cd %:p:h<Enter>		" cd to current file %
" $VIMRC
nnoremap <Leader>ev	:e $MYVIMRC<cr>
nnoremap <Leader>sv	:source $VIMRC<cr>
nnoremap <Leader>ez	:e ~/dotfiles/.zshrc<cr>
"	use vim as MAN PAGER
"	see ~/.bashrc
"-----------------------

"#### abbrev  #####
" insert mode, type j then r  
abbr jr Jim:	
abbr <Leader># # ------------

" ----- params ------
autocmd TermOpen * startinsert			" begin term as insert
set number" 	norelativenumber, nonumber to turn off
set cmdheight=4		"	 avoids PRESS any Key to continue
set gdefault			" search global :%s/from/to/c
set ignorecase			" search non-case sensitive
set autowrite			" saves to disk when change buffers, :bn
set autoread			" re-read if a file changed outside vim
set shiftround			" indent will be multipe of shiftwidth
set showmatch			" highlights matching bracket, paran etc.
"
"------------------
" 	colors & format
"------------------
"
"set background=dark			" easier to read on dark (black) background
"set nohlsearch				" no highlight on search matches
"set noh				" compare
":verbose hi statusline		" tells where edited
"######################
colorscheme jimColor		" ~/.config/nvim/colors/jimColor.vim
" colorscheme darkblue		" till I figure out better
"with darkblue color scheme, make Statusline readable 

set laststatus=2		" default=2, means all windows have statusline
set statusline=%F%m-b%n	" display full paths, modified, buffer #
set colorcolumn=81		" display right margin
set title				" title of window?   where?
set tabstop=4			" default=8
set shiftwidth=4		" set to same as tabstop
set wm=8				" 8 characters before end will begin new line
set textwidth=79		" sets right margin!
" wrap (default: ON)
" linebreak (default: OFF)
"
" ---- Tabs  ----
"uncomment to show tabs
"set list						" set nolis
"set list listchars=tab:^\,eol:$
"set tabstop=1					" number spaces
" ---------------
"	Backup
" ---------------
"
set backup 
set backupdir=~/.config/nvim/backup/	" do not surround with quotes!
"
"---- netRW, required ----
set nocp                    " 'compatible' is not set
filetype plugin on          " plugins are enabled
"
"---------------------
"	navigation
"---------------------
"
nnoremap H	0			" go to beg of line
nnoremap L	$			" go to end
"
"---- bet windows ----
"
nnoremap <Leader>l	<C-w>l			" avoids Google activated by <C-w>
nnoremap <Leader>h 	<C-w>h
nnoremap <Leader>j	<C-w>j			" great for Help!
nnoremap <Leader>k  <C-w>k
" 
"---- bet terminal  ----
"
tnoremap <Esc> <C-\><C-n>		" return to normal mode
tnoremap <Leader>h <C-\><C-n><C-w>h		" (insert)jump to left screen
tnoremap <Leader>l <C-\><C-n><C-w>l		" (insert) jump to right screen

" -------------
"  :set nopaste 
"  WORKAROUND
"  if get INSERT (paste) nusance
"  Either
"  	(1) :set nopaste
"  	(2) au InsertLeave * set nopaste
"  -------------
au InsertLeave * set nopaste
