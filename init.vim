" ~/.config/nvim/init.vim -> ~/dotfiles/init.vim
"
"  [./jim_code/experimental.vim]
"
"		 VIM-PLUG 
" ------------------------
" Specify a directory for plugins
call plug#begin('~/.config/nvim/vim-plug')

Plug 'junegunn/vim-plug'	
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'benmills/vimux'
Plug 'tpope/vim-surround' 
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

"	my help (cloned & changed name from tinyheero)
Plug 'jimrothstein/jimHelp'

" AM I USING this?
" markdown syntax highligthing
Plug 'plasticboy/vim-markdown'

" use vim folding (default = 1, disable)
" let g:vim_markdown_folding_disabled = 1

" for YAML hightlighting
" let g:vim_markdown_frontmatter = 1

" PURPOSE ?? Turn on markdown for these languges
" let g:markdown_fenced_languages = ['html',   'vim', 'md', 'rmd' ]

" Initialize plugin system
"
call plug#end()
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

" silent - no messages, except error
" silent! - also no error msgs
" Hit ESC (or my case: CapsLock) vim leave insert mode AND save
"    but ONLY if I made an actual change.
:autocmd InsertLeave *  update
"
" avoid commnets on same line as mapping,   vim can get confused
" SAVE
"nnoremap <Leader>s :w<Enter>

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
autocmd TermOpen * startinsert			" begin term as insert

" use ==#   compare strings
"
" augroup myterm | au!
" 	au TermOpen * if &buftype ==# 'terminal' | resize q0 | vert resize 50 | endif
" augroup end


" ==========
"  OPTIONS
" ==========


 
" after 'updateime' millisecs (1500?) INSERT mode reverts to NORMAL
" au CursorHoldI * stopinsert

set hidden      "   [default=no] 
syntax enable 		"  	runs syntax.vim
set history=50		"   last 50 commands (default 10000)
set showmode			"   show mode

" should next line be setlocal cursorline?
set cursorline		"   highlight current line
set scrolloff=5   "   scroll, keep cursor 5 lines from top
set number			"	nonumber
set relativenumber	" 	norelativenumber, nonumber to turn off
" was 4, try 2
set cmdheight=3		"	 avoids PRESS any Key to continue
" set gdefault			" search global :%s/from/to/c
set ignorecase			" search non-case sensitive
set autowrite			" saves to disk when change buffers, :bn
set autoread			" re-read if a file changed outside vim
set shiftround			" indents will be multipe of shiftwidth (keeps alignment)
set showmatch			" highlights matching bracket, paran etc.
set foldmethod=marker	" create fold with zf	
set foldcolumn=3		" adds visual clue in LEFT margin
set nolist				"NO display TABS, and EOL
set wrap
set noerrorbells 
set expandtab 			" <TAB> expands as spaces,  NO BELLS will sound in R!
set laststatus=2		" default=2, means all windows have statusline
" %n = buffer number
set statusline=
set statusline+=%m
set statusline+=[%{winnr()}-b%n]
" :highlight,  insert color inside # #
set statusline+=%#Title#%y[%F]    

" begin from right margin
set statusline+=%=
set statusline+=%c:%l/%L 			" line, column (with tabs, maybe estimate)
set statusline+=[%n]
set colorcolumn=81		" display right margin
set title 
set tabstop=2			" default=8
set shiftwidth=2		" set to same as tabstop
set wm=4				" 8 characters before end will begin new line
set textwidth=79		" sets right margin!
set nolist          " do NOT show tabs
"set list listchars=tab:^\,eol:$
set backup 
set backupdir=~/.config/nvim/backup/	" do not surround with quotes!

" COLORS
" ========
" sourced from ./jim_code/colors.vim (my code)
" :colorscheme <pickone>   :colorscheme jimColor
colo jimColor
"
"
" activation plugin for filetype detection
filetype plugin on         


"  windows, terminals, sizing, editor sizing
source ~/.config/nvim/jim_code/windows.vim



" completion: control popup menu, in insert mode
set completeopt=noinsert,menu,noselect,preview
"
"
" --- nvim-R ---- 
source ~/.config/nvim/jim_code/nvimR_config.vim



" ctags - R .    needs:
source ~/.config/nvim/jim_code/ctags.vim


" Use Ctrl-Space to do omnicompletion
inoremap <C-Space> <C-x><C-o>



" NERDTree
" open nerdtree
nnoremap <C-N> :NERDTreeFocus<CR>


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
" ===========
" S P E L L
" ===========
" Default:  spell is OFF
set nospell 


" For activation, use
" :setlocal spell 
" :set spell "always ON
"

" set language region
set spelllang=en_us
"
" Or, use au
autocmd BufRead,BufNewFile *.md,markdown :setlocal spelllang=en_us


" spellfile, english + medical
"
set spellfile=
"built-in
set spellfile+=~/.config/nvim/spell/en.utf-8.add   
set spellfile+=~/.config/nvim/spell/spell.utf-8.add
set spellfile+=~/.config/nvim/spell/medical.utf-8.add

" toggle localspell
func! ToggleSpellCheck()
	exe "normal! :setlocal spell! spelllang=en_us\<CR>"
  " SpellBad words look nice!:w
  " CONFLICT?   see  ./colors.vim
  hi clear SpellBad
  hi SpellBad cterm=underline,bold
  hi SpellBad ctermfg=blue
endfunction

"  USAGE:
nnoremap <Leader>t :call ToggleSpellCheck()<CR>


"
" ========
" AUTOCMD
" ========
"
" set tags  (ctags -R .)
set tags=~/code/tags


" ~/bin/run_ctags.sh does everything
" Trigger:   Write Buffer to FILE
augroup ctags
"	autocmd  BufWritePost *.R,*.Rmd :!~/bin/run_ctags.sh 
augroup end
   
" manually
nnoremap ,s :!~/bin/run_ctags.sh <CR>

" FROM ercrema - github
"
" keep filetypes consistent 
au BufNewFile,BufRead *.Rmd,*.rmd set filetype=rmd
au BufNewFile,BufRead *.md  set filetype=md
autocmd BufNewFile,BufRead *.md set filetype=markdown


au BufNewFile,BufRead *.tex, set filetype=tex

au FileType tex,latex,markdown setlocal spell spelllang=en_us

" all files, center when entering insert
" 7/2021 ... too confusing, turned off.
"au InsertEnter * norm zz

augroup help_files
	au!
	au filetype help nnoremap <buffer>q :q<CR>
	au filetype help nnoremap <buffer> <CR> <C-]> 
augroup END


"	snippet to use skelton for .md, .sh, .Rmd, .R
augroup skeleton
	au!
  autocmd BufNewfile Read.me r ~/skeletons/skeleton.readme
	autocmd BufNewFile *.md   r ~/.config/nvim/templates/skeleton.md
	autocmd BufNewFile *.sh   r ~/.config/nvim/templates/skeleton.sh
  autocmd BufNewFile *.Rmd	r ~/.config/nvim/templates/skeleton.Rmd
  autocmd BufNewFile *.R    r ~/.config/nvim/templates/skeleton.R
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
augroup END
"
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
"let g:LanguageClient_serverCommands = {
"    \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
"    \ 'rmd': ['R', '--slave', '-e', 'languageserver::run()'],
"    \ }
"
"
" as variable, ~/.config/nvim
let g:nvim_config_root = stdpath('config')
"  FUTURE:
"  source g:nvim_config_root . '/' . 'jim_code' . '/' . 'underline.vim'

"============================
" SOURCE ADD'N  Config files
"============================
" CLAIM:  just put these *.vim in vim-plug/
"
"source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/jim_code/underline.vim
source $HOME/.config/nvim/jim_code/date.vim
source $HOME/.config/nvim/jim_code/lua_inside_vim_file.vim
source $HOME/.config/nvim/jim_code/clipboard.vim
source $HOME/.config/nvim/jim_code/experimental.vim


"  colors/jimColor.vim


" TO SOURCE .luafile ~/.config/nvim/lua/lua_file.lua
" NOTE:   :luafile to source
" NOTE:   lua_file, with NO EXTENSION
"
" pause for now.
" :luafile ~/.config/nvim/lua/lua_file.lua
