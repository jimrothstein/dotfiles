" ~/.config/nvim/init.vim -> ~/dotfiles/init.vim
"
"
"		 VIM-PLUG 
" ------------------------
" Specify a directory for plugins
call plug#begin('~/.config/nvim/vim-plug')

"
Plug 'junegunn/vim-plug'	
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
"	need?  vimux - interacts with tmux within vim
Plug 'benmills/vimux'
Plug 'tpope/vim-surround' 
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
"	my help (cloned from tinyheero)
Plug 'jimrothstein/vim-myhelp'
" markdown syntax highligthing
Plug 'plasticboy/vim-markdown'
" use vim folding
let g:vim_markdown_folding_disabled = 1

" for YAML hightlighting
let g:vim_markdown_frontmatter = 1
" Initialize plugin system
call plug#end()
" ===================
"

" ACTIVATES REditorSupport/languageserver
" UNCOMMENT TO USE
"
" LanguageClient_
" let g:LanuageClient_serverCommands = {
"     \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
"     \ }
"
 " ==========================
"		MY CODE, mapleader:"
" ==========================
"
"	mapleader
let mapleader=","		" default = \ 

"	maplocalleader
let maplocalleader=","			" might be clashes
"

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

" turnoff highlight
noremap <silent> ./ :nohlsearch<CR>  


" cursor forward/backward one full screen
nnoremap <Leader>f <C-f>
nnoremap <Leader>b <C-b>

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

augroup R_values
	au!
	au! FileType r,rmd abbr false FALSE 
	au! FileType r,rmd abbr true TRUE 
augroup END


" ==========
" TERMINAL
" ==========
" --many options -------------	{{{
autocmd TermOpen * startinsert			" begin term as insert

" use ==#   compare strings
"
augroup myterm | au!
	au TermOpen * if &buftype ==# 'terminal' | resize q0 | vert resize 50 | endif
augroup end

" after 'updateime' millisecs (1500?) INSERT mode reverts to NORMAL
" au CursorHoldI * stopinsert

syntax enable 		"  	runs syntax.vim
set history=50		"   last 50 commands (default 10000)
set showmode			"   show mode
set cursorline		"   highlight current line
set scrolloff=2   "   scroll, keep cursor 2 lines from top
set number			"	nonumber
set relativenumber	" 	norelativenumber, nonumber to turn off
" was 4, try 2
set cmdheight=2		"	 avoids PRESS any Key to continue
" set gdefault			" search global :%s/from/to/c
set ignorecase			" search non-case sensitive
set autowrite			" saves to disk when change buffers, :bn
set autoread			" re-read if a file changed outside vim
set shiftround			" indents will be multipe of shiftwidth (keeps alignment)
set showmatch			" highlights matching bracket, paran etc.
set foldmethod=marker	" create fold with zf	
set foldcolumn=3		" adds visual clue in LEFT margin
set nolist				"NO display TABS, and EOL}}}
set wrap
set noerrorbells 
set expandtab 			" <TAB> expands as spaces,  NO BELLS will sound in R!
set laststatus=2		" default=2, means all windows have statusline
" %n = buffer number
set statusline=
set statusline+=%m[%{winnr()}-b%n]
set statusline+=[%F]%y    
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
" sourced from ./jim_code/colors.vim (my code)

" Solarize, change so I can see "comments
hi Comment ctermfg=103
hi CursorLine ctermbg=4			" blue	
"}}}
"
" activation plugin for filetype detection
filetype plugin on         

"  WINDOWS 
" ==============
" see ./jim_code/maps.vim
source ~/.config/nvim/jim_code/maps.vim

" --- nvim-R ---- 
"

" completion: control popup menu, in insert mode
set completeopt=noinsert,menu,noselect,preview
"
"
source ~/.config/nvim/jim_code/nvimR_config.vim

" =============================================================
" N O T E !!
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




"	FUNCTIONS
"-----------------
"
"	insert dotline line 
"	CONFLICT with ,id (insert date)
"-----------------
" func! InsertDotLine()
" 	exe "normal! I"."\"-----------------\<CR>\<esc>"
" endfunction
" nnoremap <Leader>id :call InsertDotLine()<CR>
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
" AUTOCMD
" ========
"
" set tags  (ctags -R .)
set tags=~/code/tags

"  -f ~/code/tags   location for output files
augroup ctags
	autocmd  BufWritePost *.R,*.Rmd silent! :!ctags -f ~/code/tags -R ~/code 
augroup end

" FROM ercrema - github
"
" keep filetypes consistent 
au BufNewFile,BufRead *.Rmd set filetype=rmd
au BufNewFile,BufRead *.md  set filetype=md
autocmd BufNewFile,BufRead *.md set filetype=markdown

augroup help_files
	au!
	au filetype help nnoremap <buffer>q :q<CR>
	au filetype help nnoremap <buffer> <CR> <C-]> 
augroup END



"	snippet to use skelton for .md, .sh, .Rmd
augroup skeleton
	au!
	autocmd BufNewFile *.md r ~/.config/nvim/templates/skeleton.md
	autocmd BufNewFile *.sh r ~/.config/nvim/templates/skeleton.sh
  autocmd BufNewFile  *.Rmd	r ~/.config/nvim/templates/skeleton.Rmd
augroup END

" HARD WRAP, experiment, :messages
" To see effect, look what happens (live) to buffer if columns=40
augroup md_specs
	autocmd!
	autocmd BufWrite *.md :echom "Good"
	autocmd BufWrite *.md :echom "Bye"
	autocmd BufNewFile *.md :echom "new md file"
	autocmd FileType md :set formatoptions=tnqr
	autocmd FileType md :setlocal nowrap spell linebreak tw=78 
	autocmd BufRead,BufNewFile *.md :setlocal spell spelllang=en_us

	autocmd BufRead,BufNewFile *.md :setlocal spellfile=~/.config/nvim/spell/en.utf-8.add
	autocmd BufRead,BufNewFile *.md :setlocal thesaurus+=~/.config/nvim/thesaurus/thesaurii.txt
	"
augroup END

augroup R_specs
	autocmd!
	" to be sure Comments repeat as expected
	autocmd FileType r,rmd :set formatoptions+=ro
	autocmd FileType r,rmd inoremap <leader>mm %*% 
	autocmd FileType r,rmd inoremap <leader>pp %>% 
augroup END


augroup ALZ
	autocmd! BufRead criminal.md abbr <buffer> PO PO Marcelina
augroup END


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


" ---- yaml ----
"  vice nice to align!
"  specific setttings for .yml files
autocmd FileType yaml setlocal ai et sw=2 ts=2 cuc cul 

" EXAMPLE:   mapping based on file .ext	
" autocmd BufNewFile,BufRead *.R 		nnoremap ,id I# ---------<esc>j 
" autocmd BufNewFile,BufRead *.vim 	nnoremap ,id I" ---------<esc>j 



" For .Rmd files, find next/previous 'chunk'
augroup knitr
  autocmd BufNewFile,BufRead *.Rmd nnoremap ]r /```{r<CR>
  autocmd BufNewFile,BufRead *.Rmd nnoremap [r ?```{r<CR>
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
" 
 
" ===================
" insert completion
" ===================

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
"  underline, maps vim is in ~/.config/nvim/jim_code/
"  better:    exe 'source ....../*.vim'
"exe 'source ~/.config/nvim/jim_code/underline.vim'
"
"
" (1) first install, in R,  
" devtools::install_github("REditorSupport/languageserver")
" (2)
" code below configers for lsp plugin called: LanguageClient-neovim (see
" Plugins)
" (3) be sure plugin autozimu/LanguageClient-neovim (at top)
let g:LanguageClient_serverCommands = {
    \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
    \ 'rmd': ['R', '--slave', '-e', 'languageserver::run()'],
    \ }
"
"============================
" SOURCE ADD'N  Config files
"============================
"source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/jim_code/underline.vim
source $HOME/.config/nvim/jim_code/date.vim
source $HOME/.config/nvim/jim_code/lua_inside_vim_file.vim


" TO SOURCE .luafile ~/.config/nvim/lua/lua_file.lua
" NOTE:   :luafile to source
" NOTE:   lua_file, with NO EXTENSION
"
" pause for now.
" :luafile ~/.config/nvim/lua/lua_file.lua
