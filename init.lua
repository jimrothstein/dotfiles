-- file <- "/home/jim/.config/nvim/init.lua"

--	TODO
--	a lot to do.
--	MOVE autocommands to keymaps.lua
--	:TSBufEnable highlight (does nothing)

vim.cmd [[
"----------------------------
"   FILES, sourced at BOTTOM
"----------------------------
"
" -- legacy --
" $HOME/.config/nvim/jim_code/underline.vim
" $HOME/.config/nvim/jim_code/date.vim
" $HOME/.config/nvim/jim_code/clipboard.vim
" ~/.config/nvim/jim_code/ctags.vim
"
"  -- lua --

" $HOME/.config/nvim/lua/jim/packer.lua
" $HOME/.config/nvim/lua/jim/lsp_experimental.lua
" $HOME/.config/nvim/lua/jim/telescope.lua
" $HOME/.config/nvim/lua/jim/treesitter.lua
" $HOME/.config/nvim/lua/treesitter-config/
"
" $HOME/.config/nvim/lua/jim/cmp.lua
" $HOME/.config/nvim/lua/jim/cleanup.lua
" $HOME/.config/nvim/lua/jim/bufferline.lua
" $HOME/.config/nvim/lua/jim/options.lua
" $HOME/.config/nvim/lua/jim/keymaps.lua " autocmds, keymappings
" $HOME/.config/nvim/lua/jim/functions.lua
" $HOME/.config/nvim/lua/jim/tools.lua
" $HOME/.config/nvim/lua/jim/utils.lua
" $HOME/.config/nvim/lua/jim/windows.lua  " tabs, underline ??
" $HOME/.config/nvim/lua/jim/colors.lua
" $HOME/.config/nvim/lua/jim/Nvim-R.lua
"
"
"  --	 ZSH --	
" $HOME/.config/zsh/
"
"
"vim.g.mapleader=','         --  default = \
"vim.g.maplocalleader=','    --  might be clashes

let mapleader=","
let maplocalleader=","

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

" FROM ercrema - github
"
"----------------------------
"				keep filetypes consistent 
"----------------------------

au BufNewFile,BufRead *.Rmd,*.rmd set filetype=rmd
au BufNewFile,BufRead *.md  set filetype=md
autocmd BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.tex, set filetype=tex

au FileType tex,latex,markdown setlocal spell spelllang=en_us

"	close help files
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
	autocmd FileType markdown :setlocal foldmethod=manual
	autocmd FileType r,rmd :setlocal foldmethod=manual
augroup END

" For .Rmd files, find next/previous 'chunk'
augroup knitr
  autocmd BufNewFile,BufRead *.Rmd nnoremap ]r /```{r<CR>
  autocmd BufNewFile,BufRead *.Rmd nnoremap [r ?```{r<CR>
augroup END



" as variable, ~/.config/nvim
let g:nvim_config_root = stdpath('config')
"  FUTURE:
"  source g:nvim_config_root . '/' . 'jim_code' . '/' . 'underline.vim'

]]

---------------
--			BEGIN LUA 
---------------
--

--  list all *.lua files here (aka modules)
--  actual location ~/.config/nvim/lua/jim.* 
require('jim.packer')
require('jim.telescope')
require('jim.bufferline')
-- require('jim.treesitter')
-- require('jim.lsp_cmp')
-- require('jim_code.lightline')

--  keybindings and autocmd
require('jim.keymaps')
require('jim.options')
require('jim.utils')
require("jim.windows")
require("jim.Nvim-R")
require("treesitter-config")
require("jim.cmp")
-- require("jim.lsp_experimental")
-- require("jim.functions")
-- require("jim.tools")
-- require("jim.cleanup")
-- require("jim.globals")
-- require("jim.colors")

---------
--    LSP
---------


--	ATTEMPT to run r_language_server (works)
require'lspconfig'.r_language_server.setup{}
