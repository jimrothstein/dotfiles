" ~/.config/nvim/init.vim -> ~/dotfiles/init.vim
"
"------------------------
"		 VIM-PLUG 
" ------------------------
"
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

"	nerdtree
Plug 'scrooloose/nerdtree'

"	vimux
Plug 'benmills/vimux'

"	surround.vim (only need   NAME/program    as per git)
Plug 'tpope/vim-surround' 

Plug 'jalvesaq/Nvim-R'



" Initialize plugin system
call plug#end()
"------------------------
"		MY CODE:
"------------------------
"	o rganize!{{{
"	vim hard way -- ch18
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END"}}}

"  NOTE
"  underline.vim is in ~/.config/nvim/plugin
"  loads automatically!
"
"	mapleader{{{
let mapleader=","		" default = \ 
map <Leader>A :echo "hi"<enter> " <Leader> is synta:, not variable:

let maplocalleader=","			" might be clashes
map <LocalLeader>a  :echo "hello LocalLeader"<CR>}}}

"	^W is used by chrome to close window{{{
nnoremap <Leader>q	<C-W>
inoremap <Leader>q	<C-W>	
inoremap <C-Q>		<C-W>"}}}
"
" -----------------
"  maps for editing{{{
" -----------------
"
"  quick save
" avoid commnets on same line as mapping,   vim can get confused
noremap <C-s> :w<Enter>		" save file

" exit Insert mode
inoremap jj <Esc>			" always use Xnoremap
inoremap jk <Esc>			" less damage if normal mode!
inoremap kk <Esc>			" 


" comments
nnoremap <Leader>#	0i#<esc>
"
"----- frequent files ----
nnoremap <Leader>cd  :cd %:p:h<Enter>		" cd to current file %

" $VIMRC
nnoremap <Leader>ev	:e $MYVIMRC<cr>
nnoremap <Leader>sv	:source $VIMRC<cr>
nnoremap <Leader>ez	:e ~/dotfiles/.zshrc<cr>

"	surround word in quotes
nnoremap <Leader>" viw<esc>a"<esc>bi"<esc>lel

"	use vim as MAN PAGER
"	see ~/.bashrc
" ------------------------
"	ABBREV  
"-----------------------
" insert mode, type j then r  
abbr jr Jim:	
abbr <Leader># # ------------"}}}

" ----- options -------------	
autocmd TermOpen * startinsert			" begin term as insert
syntax enable 		"  	why this way?
set number			"	nonumber
set relativenumber	" 	norelativenumber, nonumber to turn off
set cmdheight=4		"	 avoids PRESS any Key to continue
set gdefault			" search global :%s/from/to/c
set ignorecase			" search non-case sensitive
set autowrite			" saves to disk when change buffers, :bn
set autoread			" re-read if a file changed outside vim
set shiftround			" indent will be multipe of shiftwidth
set showmatch			" highlights matching bracket, paran etc.
set foldmethod=marker	" create fold with zf	
set foldcolumn=1		" adds visual clue in LEFT margin
"
"------------------
" 	colors & format
"------------------
"
"set background=dark			" easier to read on dark (black) background
"set nohlsearch				" no highlight on search matches
"set noh				" compare
":verbose hi statusline		" tells where edited
"
" based on 'darkblue'
colorscheme jimColor		" ~/.config/nvim/colors/jimColor.vim

set laststatus=2		" default=2, means all windows have statusline
set statusline=%F%m-b%n	" display full paths, modified, buffer #
set colorcolumn=81		" display right margin
set title				" title of window?   where?
set tabstop=4			" default=8
set shiftwidth=4		" set to same as tabstop
set wm=8				" 8 characters before end will begin new line
set textwidth=79		" sets right margin!
" wrap (default: ON, hard wrap)
" linebreak (default: OFF, soft wrap)
"
" ---- -------------------
"		TABS  
" ------------------------

"uncomment to display tabs
"set list						" set nolis
"set list listchars=tab:^\,eol:$
"set tabstop=1					" number spaces
"
" ---------------
"	BACKUP
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
" uncomment, 
" nnoremap H	0			" go to beg of line
" nnoremap L	$			" go to end
"
"---- Jump bet windows ----
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

" ------------------------
"	SPELL
"------------------------
"uncomment to have SPELL on always
"otherwise,  in window :setlocal spell
"set spell


"-----------------
"	FUNCTIONS
"-----------------
"
"	insert dotline line 
func! InsertDotLine()
	exe "normal! I"."\"-----------------\<CR>\<esc>"
endfunction
nnoremap <Leader>id :call InsertDotLine()<CR>

"	toggle localspell
func! ToggleSpellCheck()
	exe "normal! :setlocal spell! spelllang=en_us\<CR>"
endfunction

nnoremap <Leader>t :call ToggleSpellCheck()<CR>

" -------------
"  :set nopaste 
"  WORKAROUND
"  if get INSERT (paste) nusance
"  Either
"  	(1) :set nopaste
"  	(2) au InsertLeave * set nopaste
"  -------------
"	remove autocmd
au InsertLeave * set nopaste

":autocmd BufNewFile * :write

"	snippet to use skelton for .md
augroup skeleton
	au!
	autocmd BufNewFile *.md r ~/.config/nvim/templates/skeleton.md
	autocmd BufNewFile *.sh r ~/.config/nvim/templates/skeleton.sh
augroup END

