-- file <- "/home/jim/.config/nvim/init.lua"

vim.cmd [[
"----------------------------
"   FILES, sourced at BOTTOM
"----------------------------
"
" -- legacy --
" $HOME/.config/nvim/jim_code/underline.vim
" $HOME/.config/nvim/jim_code/date.vim
" $HOME/.config/nvim/jim_code/clipboard.vim
" ~/.config/nvim/jim_code/nvimR_config.vim
" ~/.config/nvim/jim_code/ctags.vim
"
"  -- lua --

" $HOME/.config/nvim/lua/jim/packer.lua
" $HOME/.config/nvim/lua/jim/lsp_experimental.lua
" $HOME/.config/nvim/lua/jim/telescope.lua
" $HOME/.config/nvim/lua/jim/treesitter.lua
" $HOME/.config/nvim/lua/jim/cleanup.lua
" $HOME/.config/nvim/lua/jim/bufferline.lua
" $HOME/.config/nvim/lua/jim/options.lua
" $HOME/.config/nvim/lua/jim/keymaps.lua
" $HOME/.config/nvim/lua/jim/functions.lua
" $HOME/.config/nvim/lua/jim/tools.lua
" $HOME/.config/nvim/lua/jim/windows.lua
" $HOME/.config/nvim/lua/jim/colors.lua
"
"
"  --	 ZSH --	
" $HOME/.config/zsh/
"
" --------------------------
"		 VIM-PLUG 
" ------------------------
"call plug#begin('~/.config/nvim/vim-plug')

" ----- lsp
"Plug 'neovim/nvim-lspconfig'

" ----- completion engine
"Plug 'hrsh7th/nvim-cmp'   
"
" ----- completion sources
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'hrsh7th/cmp-nvim-lua'
" "  ----- nvim-lsp-installe
" Plug 'williamboman/nvim-lsp-installer'
" " ----- treesitter
" "(FUTURE) We recommend updating the parsers on update
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
" "------
" 
" "------ telescope
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'sharkdp/fd'
" " next line is installed via apt
" Plug 'BurntSushi/ripgrep'
" "------ for telescope-bookmarks (firefox needs sqlite)
" Plug 'dhruvmanila/telescope-bookmarks.nvim'
" Plug 'tami5/sqlite.lua'
" "------
" "
" Plug 'akinsho/bufferline.nvim'
" Plug 'itchyny/lightline.vim'
" Plug 'junegunn/vim-plug'	
" Plug 'altercation/vim-colors-solarized'
" Plug 'scrooloose/nerdtree'
" Plug 'benmills/vimux'
" Plug 'tpope/vim-surround' 
" Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
" Plug 'EdenEast/nightfox.nvim' 
" 
" "
" "------
" "	my help (cloned & changed name from tinyheero)
" "   Plug 'jimrothstein/jimHelp'
" 
" call plug#end()
"
"vim.g.mapleader=','         --  default = \
"vim.g.maplocalleader=','    --  might be clashes

let mapleader=","

"
" --------------
"  MOVE TO LUA
"  OMNICOMPLETE
" --------------

"### "  OMNICOMPLETE:   Default, insert mode, press <C-P>
" Rmk:   What does next line do?
" Rmk:   set omnifunc = v:lua.vim.lsp.omnifunc
" Rmk:   omnifunc is function that responds to insert ^X^O
"  {
"   set omnifunc = v:lua.vim.lsp.omnifunc
      autocmd FileType Rmd,R, rmd set completefunc=CompleteR
"  
"  }
"


" ================================================================
"   Terminal mode:  Copy current line and run in Terminal Buffer
" ================================================================
"
nnoremap <leader>tl Vy<C-w>wpa<CR><C-\><C-n><C-w>pj
" Vy  yank line
" <C-w>w  move to right
" p paste
" a<CR> append line (which runs)
" exit terminal mode (to normal)
" <C-w>p prior window
" j  move down line ##
"
" ERROR in LUA,  why?
"vim.api.nvim_set_keymap('n', '<leader>tl', 'Vy<C-w>wpa<CR><C-\><C-n><C-w>pj', {})
" ================================================================




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



" Use Ctrl-Space to do omnicompletion
inoremap <C-Space> <C-x><C-o>


"-----------------
"	FUNCTIONS
"-----------------
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
"
" as variable, ~/.config/nvim
let g:nvim_config_root = stdpath('config')
"  FUTURE:
"  source g:nvim_config_root . '/' . 'jim_code' . '/' . 'underline.vim'

"============================
" SOURCE ADD'N  Config files
"============================
"  windows, terminals, sizing, editor sizing

" TODO
"	source $HOME/.config/nvim/jim_code/underline.vim
"	source $HOME/.config/nvim/jim_code/date.vim
"	source $HOME/.config/nvim/jim_code/clipboard.vim

" ctags - R .    needs:
" source ~/.config/nvim/jim_code/ctags.vim

" NOTE:   :luafile to source
" NOTE:   lua_file, with NO EXTENSION

]]

---------------
--			BEGIN LUA 
---------------
--

--  list all *.lua files here (aka modules)
--  actual location ~/.config/nvim/lua/jim.* 
require('jim.packer')
require('jim.telescope')
-- require('jim.treesitter')
-- require('jim.lsp_cmp')
-- require('jim.bufferline')
-- require('jim_code.lightline')

--  keybindings and autocmd
require('jim.keymaps')
require('jim.options')
-- require("jim.lsp_experimental")
-- require("jim.functions")
-- require("jim.tools")
-- require("jim.cleanup")
-- require("jim.globals")
require("jim.windows")
-- require("jim.colors")
require("jim.Nvim-R")





