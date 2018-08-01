" ~/.config/nvim/init.vim -> ~/dotfiles/init.vim
"
"
"#### begin Vundle  ##################
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin('~/.config/nvim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vimwiki/vimwiki'

" g:vimwiki is a 'dictionary', one for each wiki?
"
"let g:vimwiki_list = [{'path': '~/Downloads/vimwiki/'}]

    let wiki_1 = {}
    let wiki_1.path = '~/Downloads/vimwiki/'
	let wiki_1.path_html = '~/Downloads/vimwiki/html'
	let wiki_1.ext = '.md'
	let wiki_1.template_default = 'default'
	let wiki_1.syntax = 'markdown'

    let wiki_2 = {}
    let wiki_2.path = '~/Downloads/vimwiki/jim'
	let wiki_2.path_html = '~/Downloads/vimwiki/jim/html'
	let wiki_2.ext = '.md'
	let wiki_2.template_default = 'default'
	let wiki_2.syntax = 'markdown'
	
	let g:vimwiki_list = [wiki_1,wiki_2]

"
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"###### end Vundle  ##################
"
"
"####  jim's stuff begin here ####
"
"
"#### mapping ####
" avoid commnets on same line as mapping,   vim can get confused
noremap <C-s> :w<Enter>		" save file
inoremap jj <Esc>			" always use Xnoremap
" IF change mapleader, must restart vim
let mapleader=","		" setting variable default = \
map <Leader>A :echo "hi"<enter> " <Leader> is syntax, not variable:
vnoremap <Leader>n :norm i#<enter>	" ,n comments the line
"
"#################


"##### frequent files ####
nnoremap <Leader>ev	:vsplit $MYVIMRC<cr>
nnoremap <Leader>evb	:vsplit ~/dotfiles/.bashrc<cr>
nnoremap <Leader>evbenv	:vsplit ~/dotfiles/.bash_env<cr>
nnoremap <Leader>sv	:source $VIMRC<cr>
nnoremap <Leader>el	:vsplit $legal
"#### ####  
"
"
"#### abbrev  #####
" insert mode, type j then r  
abbr jr Jim:	
abbr def Claim: 
"
"#################
"

"#### params ####
set number				" nonumber to turn off
" wrong:  statusline is what appears 
"set statusline=2		" 2 lines at bottom
set cmdheight=2			" avoids PRESS any Key to continue
set gdefault			" search global :%s/from/to/c
set ignorecase			" search non-case sensitive
set autowrite			" saves to disk when change buffers, :bn
set autoread			" re-read if a file changed outside vim
set shiftround			" indent will be multipe of shiftwidth
set showmatch			" highlights matching bracket, paran etc.
"
"################
"
"
"##### colors #####
"set background=dark			" easier to read on dark (black) background
"set nohlsearch				" no highlight on search matches
"set noh				" compare
colorscheme darkblue		" till I figure out better
"set statusline+=%F		" display full paths - WRONG?
set colorcolumn=81		" display right margin

set tabstop=4			" default=8
set shiftwidth=4		" set to same as tabstop
"####################

"#### Backup ####
set backup 
set backupdir=~/.config/nvim/backup/	" do not surround with quotes!
"################


"#### split windows ####
nnoremap <Leader>l	<C-w>l			" avoids Google activated by <C-w>
nnoremap <Leader>h 	<C-w>h
nnoremap <Leader>j	<C-w>j
nnoremap <Leader>k  <C-w>k
"#### ####

"####  map terminal ####
tnoremap <Esc> <C-\><C-n>		" return to normal mode
tnoremap <A-h> <C-\><C-n><C-w>h		" (insert)jump to left screen
tnoremap <A-l> <C-\><C-n><C-w>l		" (insert) jump to right screen

nnoremap <A-h> <C-w>h			" (normal) jump to left screen
nnoremap <A-l> <C-w>l			" (normal) jump to right screen
"###############
