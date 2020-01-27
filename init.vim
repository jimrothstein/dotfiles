" ~/.config/nvim/init.vim -> ~/dotfiles/init.vim
"
"		 VIM-PLUG {{{
" ------------------------
"
" Specify a directory for plugins
call plug#begin('~/.config/nvim/vim-plug')

"	vim-plug (my plugin mgr)
Plug 'junegunn/vim-plug'	
"
"	nerdtree
Plug 'scrooloose/nerdtree'

" do I need vimux?	
"	vimux - interacts with tmux within vim
Plug 'benmills/vimux'

"	surround.vim (only need   NAME/program    as per git)
Plug 'tpope/vim-surround' 


" nvim-R and related

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
" Optional: for snippet support
" Further configuration might be required, read below
Plug 'sirver/UltiSnips'
Plug 'ncm2/ncm2-ultisnips'

" FROM gaalcaras/ncm-R  EXAMple
" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" c-j c-k for moving in snippet
" let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

"	my help (cloned from tinyheero)
Plug 'jimrothstein/vim-myhelp'


"#### vim-rmarkdown ####
"	vim-rmarkdown (interfers with nvim-R ?)
" Plug 'vim-pandoc/vim-rmarkdown'  

" vim-rmarkdown needs ....
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'

" configure vim-rmarkdown with vim-pandoc
"let g:pandoc#modules#disabled=["folding","spell"]
"let g:pandoc#syntax#conceal#use=0
" #### ######
"
" render Markdown!
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" markdown syntax highligthing
Plug 'plasticboy/vim-markdown'

" use vim folding
let g:vim_markdown_folding_disabled = 1

" Initialize plugin system
call plug#end()"}}}

"		MY CODE, mapleader:"{{{
"------------------------
"	vim hard way -- ch18
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END"

"  NOTE
"  underline.vim is in ~/.config/nvim/plugin
"  loads automatically!
"
"	mapleader
let mapleader=","		" default = \ 
map <Leader>A :echo "hi"<enter> " <Leader> is synta:, not variable:

"	maplocalleader
let maplocalleader=","			" might be clashes
map <LocalLeader>a  :echo "hello LocalLeader"<CR>}}}

" neovim Windows{{{
" Since chrome grabs <C-W> ...
"
" To toggle bet windows, <Leader>w
nnoremap <Leader>w <C-w>w
inoremap <Leader>w <C-W>w

" To swap windows (viewports)
nnoremap <Leader>r <C-w>r
inoremap <Leader>r <C-W>r


"
" Window max (focus) 
nnoremap <Leader>_ <C-W>_

" Window equalize (focus)
nnoremap <Leader>= <C-W>=

" Window - toggle horiz|vertical
nnoremap <Leader>K <C-W>K 

" vertical
nnoremap <Leader>H <C-W>H


"---- jump bet terminal  ----
"
tnoremap <Esc> <C-\><C-n>		" return to normal mode
tnoremap <Leader>h <C-\><C-n><C-w>h		" (insert)jump to left screen
tnoremap <Leader>l <C-\><C-n><C-w>l		" (insert) jump to right screen

"}}}
" 
"  maps for editing{{{
" -----------------
"
"  quick save
" avoid commnets on same line as mapping,   vim can get confused
nnoremap <C-s> :w<Enter>:echo "use ,s!"<CR> 	" save file
nnoremap <Leader>s :w<Enter>

" SAVE and exit insertmode,  
inoremap <Leader>s <esc>:w<Enter>

" exit Insert mode
inoremap jj <Esc>			" always use Xnoremap
inoremap jk <Esc>			" less damage if normal mode!
inoremap kk <Esc>			" 

" keep cursor fixed, but move remainder of line to next line
nnoremap <Leader>o i<CR><esc>k$

" comments
nnoremap <Leader>c I#<esc>
"
"----- frequent files ----

nnoremap <Leader>cd  :cd %:p:h<Enter>		" cd to current file %

" $VIMRC
nnoremap <Leader>sv	:source $VIMRC<cr>

"	surround word in quotes
nnoremap <Leader>" viw<esc>a"<esc>bi"<esc>lel
"
"	run code (<C-P> twice (since just saved file))
"
" inoremap <Leader>r <esc>:w<cr>:<C-P>:<C-P>
" nnoremap <Leader>r :w<cr>:<C-P>:<C-P>


"	use vim as MAN PAGER
"	see ~/.bashrc
" ------------------------
"	ABBREV  
"-----------------------
" insert mode, type j then r  
abbr jr Jim:	
abbr % %>%
abbr %% %		" twice 
abbr <Leader># # ------------"
" }}}

" --many options -------------	{{{
autocmd TermOpen * startinsert			" begin term as insert

" after 'updateime' millisecs (1500?) INSERT mode reverts to NORMAL
au CursorHoldI * stopinsert

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
set list				" display TABS, and EOL}}}

"{{{ colors & format
"------------------
"
"set background=dark			" easier to read on dark (black) background
"set nohlsearch				" no highlight on search matches
"set noh				" compare
":verbose hi statusline		" tells where edited
"
"
" autogroup jim_colors
" autocmd!
" autocmd colorscheme jimColor hi SpellBad cterm=underline,bold
" autocmd colorscheme jimColor hi SpellBad ctermfg=blue
" autogroup END


" SpellBad words look nice!:w
hi clear SpellBad
hi SpellBad cterm=underline,bold
hi SpellBad ctermfg=blue

" based on 'darkblue'
colorscheme jimColor		" ~/.config/nvim/colors/jimColor.vim

" need status line to see file name
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
"}}}
"
"		show TABS  {{{
" ------------------------

"uncomment to display tabs
"set list						" set nolis
"set list listchars=tab:^\,eol:$
"set tabstop=1					" number spaces}}}
"
"	BACKUP{{{
" ---------------
"
set backup 
set backupdir=~/.config/nvim/backup/	" do not surround with quotes!}}}
"
"---- netRW, required ----{{{
set nocp                    " 'compatible' is not set
filetype plugin on          " plugins are enabled}}}

"  	BUFFERS{{{
" -----------------------
" display buffers
nnoremap ls :ls<CR>:"}}}
"
"---- Jump bet windows ----{{{
"
" <Leader>l conflict with nvim-R
" nnoremap <Leader>l	<C-w>l			" avoids Google activated by <C-w>
" nnoremap <Leader>h 	<C-w>h
" nnoremap <Leader>j	<C-w>j			" great for Help!
" nnoremap <Leader>k  <C-w>k"

" STANDARDIZE
nnoremap <C-l>	<C-w>l
nnoremap <C-j>	<C-w>j
nnoremap <C-k>	<C-w>k
nnoremap <C-h>  <C-w>h "}}}

" --- nvim-R{{{
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
"
" Ref for init.vim for nvim-r
" https://gist.githubusercontent.com/tgirke/7a7c197b443243937f68c422e5471899/raw/init.vim
map <F2> <Plug>RStart
map <Leader><F2> <Plug>RStop

" Send selection or line to R with space bar, respectively.
vmap <Space> <Plug>RDSendSelection
" Shortcut for R's assignment operator: 0 turns it off; 1 assigns underscore; 2 assigns two underscores
" just one "_"
let R_assign = 1 

" Ensures usage of your own ~/.tmux.conf file
" let R_notmuxconf = 1

" Shows function arguments in a separate viewport during omni completion with Ctrl-x Ctrl-o:w
let R_show_args = 1

" Use Ctrl-Space to do omnicompletion
inoremap <C-Space> <C-x><C-o>


"let R_in_buffer = 0
"let R_tmux_split = 1
"let R_applescript = 0
"let R_tmux_close = 0

" omni-completion
inoremap <C-Space> <C-X><C-O>
"}}}

"	SPELL{{{
"------------------------
"uncomment to have SPELL on always
"otherwise,  in window :setlocal spell
"set spell

"}}}

" THESAURAS{{{
setlocal thesaurus+=~/.config/nvim/thesaurus/thesaurii.txt"}}}

"	FUNCTIONS{{{
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
" SpellBad words look nice!:w
hi clear SpellBad
hi SpellBad cterm=underline,bold
hi SpellBad ctermfg=blue
endfunction

nnoremap <Leader>t :call ToggleSpellCheck()<CR>"}}}

"  :set nopaste {{{
"  WORKAROUND
"  if get INSERT (paste) nusance
"  Either
"  	(1) :set nopaste
"  	(2) au InsertLeave * set nopaste
"  -------------
"	remove autocmd
au InsertLeave * set nopaste

":autocmd BufNewFile * :write
"}}}
"
"	snippet to use skelton for .md{{{
augroup skeleton
	au!
	autocmd BufNewFile *.md r ~/.config/nvim/templates/skeleton.md
	autocmd BufNewFile *.sh r ~/.config/nvim/templates/skeleton.sh
augroup END"}}}


"	EXPERIMENTAL
"	tell vim that .md is markdown and not pandoc flavor
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown


