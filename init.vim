" ~/.config/nvim/init.vim -> ~/dotfiles/init.vim
"
"		 VIM-PLUG {{{
" ------------------------
" Specify a directory for plugins
call plug#begin('~/.config/nvim/vim-plug')

"	vim-plug (my plugin mgr)
Plug 'junegunn/vim-plug'	
Plug 'altercation/vim-colors-solarized'
"	nerdtree
Plug 'scrooloose/nerdtree'
"	need?  vimux - interacts with tmux within vim
Plug 'benmills/vimux'
"	surround.vim (only need   NAME/program    as per git)
Plug 'tpope/vim-surround' 
" ncm2 = neovim completion mgr
" Plug 'ncm2/ncm2' 
" nvim-R and related
" Plug 'roxma/nvim-yarp'
Plug 'jalvesaq/Nvim-R'
" Plug 'gaalcaras/ncm-R'
"	my help (cloned from tinyheero)
Plug 'jimrothstein/vim-myhelp'
" render Markdown!
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" markdown syntax highligthing
Plug 'plasticboy/vim-markdown'
" use vim folding
let g:vim_markdown_folding_disabled = 1
" Initialize plugin system
call plug#end()"}}}
" ===================
"
"
" ==========================
"		MY CODE, mapleader:"{{{
" ==========================
"
"	mapleader
let mapleader=","		" default = \ 

"	maplocalleader
let maplocalleader=","			" might be clashes
"# }}}

" ======================
"# keystoke DELAY?"{{{
" ======================
"
"# set timeoutlen=1000 (or even 10) 
"# set ttimeoutlen=0    (defaut=50)}}}
"
" ======================
"  maps for editing{{{
" ======================
"
" avoid commnets on same line as mapping,   vim can get confused
" SAVE 
nnoremap <Leader>s :w<Enter>

" SAVE and exit insertmode,  
inoremap <Leader>s <esc>:w<Enter>

" exit Insert mode
inoremap jj <Esc>			" always use Xnoremap
inoremap jk <Esc>			" less damage if normal mode!
inoremap kk <Esc>			" 


" comments , USAGE: <Leader>c
nnoremap <Leader>c :call CommentThisLine()<cr>
inoremap <Leader>c <esc>:call CommentThisLine()<cr>

function! CommentThisLine()
		if &filetype  == "vim"
			"  insert " (must escape); also escape to exit
			execute "normal I\" \<esc>"
		else
			exe "normal I# \<esc>"
		endif
endfunction

"
" set working dir to same as active file
nnoremap <Leader>cd  :cd %:p:h<Enter>		

" $VIMRC
nnoremap <Leader>sv	:source $VIMRC<cr>

" ==========
"	ABBREV  
" ==========
abbr false FALSE	
abbr true TRUE


" --many options -------------	{{{
autocmd TermOpen * startinsert			" begin term as insert

" use ==#   compare strings
"
augroup myterm | au!
	au TermOpen * if &buftype ==# 'terminal' | resize 20 | vert resize 50 | endif
augroup end

" after 'updateime' millisecs (1500?) INSERT mode reverts to NORMAL
" au CursorHoldI * stopinsert

syntax enable 		"  	colors? why this way?
set history=50		"   last 50 commands (default 10000)
set showmode			"   show mode
set scrolloff=4   "   scroll, keep cursor 4 lines from top
set number			"	nonumber
set relativenumber	" 	norelativenumber, nonumber to turn off
set cmdheight=4		"	 avoids PRESS any Key to continue
" set gdefault			" search global :%s/from/to/c
set ignorecase			" search non-case sensitive
set autowrite			" saves to disk when change buffers, :bn
set autoread			" re-read if a file changed outside vim
set shiftround			" indent will be multipe of shiftwidth
set showmatch			" highlights matching bracket, paran etc.
set foldmethod=marker	" create fold with zf	
set foldcolumn=3		" adds visual clue in LEFT margin
set nolist				"NO display TABS, and EOL}}}
set wrap
set noerrorbells 
set laststatus=2		" default=2, means all windows have statusline
set statusline=
set statusline+=%m[%{winnr()}-b%{bufnr()}][%F]%y    " modified, win#, full path filetype,
set statusline+=[%l,%c%V]										" line, column (with tabs, maybe estimate)
set colorcolumn=81		" display right margin
set title 
set tabstop=2			" default=8
set shiftwidth=2		" set to same as tabstop
set wm=4				" 8 characters before end will begin new line
set textwidth=79		" sets right margin!
set nolist          " do NOT show tabs
"set list listchars=tab:^\,eol:$
set backup 
set backupdir=~/.config/nvim/backup/	" do not surround with quotes!}}}
"set columns=80  "default, leave it alone

" COLORS
" ========
" sourced from ./plugin/colors.vim (my code)

" Solarize, change so I can see "comments
hi Comment ctermfg=103
"}}}
"
"---- netRW, required ----{{{
" set nocp                    " 'compatible' is not set
" filetype plugin on          " plugins are enabled}}}

"  WINDOWS {{{
" ==============
" see plugins/maps.vim

" --- nvim-R ---- {{{
" =====================
"
" FROM ercrema - github
"
" set rmarkdown file type for safety
au BufNewFile,BufRead *.Rmd set filetype=rmd

" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menu,noselect,preview
"
" Ref for init.vim for nvim-r
" https://gist.githubusercontent.com/tgirke/7a7c197b443243937f68c422e5471899/raw/init.vim
"
map <F2> <Plug>RStart
map <Leader><F2> <Plug>RStop
imap <Leader>d <Plug>RDSendLine

" Send selection or line to R with space bar, respectively.
vmap <Space> <Plug>RDSendSelection


" =============================================================
" :echo R_assign     to see value (no quotes)
" :let R_assign=n     to change value (effectively immediate)
" =============================================================
"
" Shortcut for R assignment operator: 0 turns it off; 
" 1 requires one _ to produce <- 
" 2 requires two __ to produce <- 
let R_assign = 2 

" Always open in vertical (ie dividing line is vertical) split
" was 57 and 18	
let R_rconsole_with=47
let R_min_editor_width=120

" Ensures usage of your own ~/.tmux.conf file
" let R_notmuxconf = 1

" R wd same as vim directory (when R starts)
let R_nvim_wd = 1

" Use Ctrl-Space to do omnicompletion
inoremap <C-Space> <C-x><C-o>


" R startup args (do not use .RData)
let R_args = [ '--no-save', '--no-restore-data'  ]


"let R_in_buffer = 0
"let R_tmux_split = 1
"let R_applescript = 0
"let R_tmux_close = 0

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
"-----------------
func! InsertDotLine()
	exe "normal! I"."\"-----------------\<CR>\<esc>"
endfunction
nnoremap <Leader>id :call InsertDotLine()<CR>
"-----------------
"
"
" toggle localspell
"-----------------
func! ToggleSpellCheck()
	exe "normal! :setlocal spell! spelllang=en_us\<CR>"
" SpellBad words look nice!:w
hi clear SpellBad
hi SpellBad cterm=underline,bold
hi SpellBad ctermfg=blue
endfunction
"-----------------
"
nnoremap <Leader>t :call ToggleSpellCheck()<CR>"}}}


"
" ========
" AUTCMD
" ========
"
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" match folds
" autocmd FileType r,rmd,md set mps+={{{:}}}

autocmd FileType r,rmd inoremap <leader>mm %*% 
autocmd FileType r,rmd inoremap <leader>pp %>% 

"	snippet to use skelton for .md, .sh, .Rmd
augroup skeleton
	au!
	autocmd BufNewFile *.md r ~/.config/nvim/templates/skeleton.md
	autocmd BufNewFile *.sh r ~/.config/nvim/templates/skeleton.sh
  autocmd BufNewFile  *.Rmd	r ~/.config/nvim/templates/skeleton.Rmd

augroup END"

" workaround ?
au InsertLeave * set nopaste

" Insert mode - change status line color!
" Prior?    ctermfg=245 ctermbg=235
au InsertEnter * hi Statusline cterm=reverse 					 ctermbg=5
au InsertLeave * hi Statusline cterm=reverse ctermfg=0 ctermbg=2     

" number help files!
autocmd FileType help setlocal number relativenumber

" autcmd QuitPre * confirm
" confirm
"autocmd QuitPre * let ans=call confirm("Are you sure ?", "&yes\n&Cancel",0)

"if ans == 1
"	quit()
"else
"endif

" ---- yaml ----
"  vice nice to align!
"  specific setttings for .yml files
autocmd FileType yaml setlocal ai et sw=2 ts=2 cuc cul 

" EXAMPLE:   mapping based on file .ext	
" autocmd BufNewFile,BufRead *.R 		nnoremap ,id I# ---------<esc>j 
" autocmd BufNewFile,BufRead *.vim 	nnoremap ,id I" ---------<esc>j 

" rmd, R files only
augroup  r_code
	"inoremap <leader>mm %*%<SP>
augroup END



"	vim hard way -- ch18
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END"
"-----------------
" MACRO- reg a, @a
"-----------------
" if lines exist,
" 10@a will insert "foo"
" @a is register a, same as yanking into reg a
let @a = "^ifoo\<Esc>j"
" }}}
 
" ===================
" insert completion
" ===================
"	replace <c-n>
"
"	l?   b/c near  to p

inoremap <c-l> <c-n>
" inoremap <c-f> <c-n>   " f? forward, but too far from p	 
" likewise ^n works, but too far
"
" obliterate InactiveWindow
" 15=white
" 16=black
" 8 = grey
hi ActiveWindow ctermfg=15 ctermbg=16 | hi InactiveWindow ctermbg=8
set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow

"  NOTE
"  underline, maps vim is in ~/.config/nvim/plugin
