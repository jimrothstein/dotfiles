--
-- Sun May 15 17:58:01 PDT 2022
--	Date format - remove time (get fouled up in syntax)
--	TODO:	-	foldmethod for markdown, now: vimscript want: lua
--				-	for .md, setlocal nospell (till I figure out latex & spell)
-- these 2 work
vim.api.nvim_set_keymap('n', '<leader>p', ':<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>e', ':echo "hi"<CR> ', {})


local opts = {noremap = true}

-- cursor forward/backward one full screen
vim.api.nvim_set_keymap('n', '<leader>f', '<C-f>', opts )
vim.api.nvim_set_keymap('n', '<leader>b', '<C-b>', opts )


vim.api.nvim_set_keymap('n', '<C-L>', ':wincmd l<CR>', opts )
vim.api.nvim_set_keymap('n', '<C-H>', ':wincmd h<CR>', opts )
vim.api.nvim_set_keymap('n', '<C-J>', ':wincmd j<CR>', opts )

--	1st exit insert mode; then jump
vim.api.nvim_set_keymap('t', '<C-K>', '<C-\\><C-N>:wincmd k<CR>', opts )

--  FUTURE
--
-- vim.api.nvim_set_keymap('n', '<leader>e', 'vim.cmd("echo init.vim")', {})
-- vim.api.nvim_set_keymap('n', '<leader>x', '<cmd>lua require("jim_code.tools").makeScratch()<CR>', {})
--
--
--  exit insert mode  
vim.api.nvim_set_keymap('i', 'jj', '<Esc>',  opts)
vim.api.nvim_set_keymap('i', 'kk', '<Esc>',  opts)
vim.api.nvim_set_keymap('i', 'jk', '<Esc>',  opts)


--  FUTURE: (inserts :>)   paste * reg on command line
vim.api.nvim_set_keymap('n', '<leader>pr', ':<C-R>"',  opts)


--	yank visual text to SYSTEM	clipboard  ( <C-v> to paste)
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', opts)



--	insert date	
vim.api.nvim_set_keymap('n', '<leader>id', ':r !date <CR>',  opts)

--  bold a word (cursor at beginning of word)
vim.api.nvim_set_keymap('n', '<leader>bo', 'i**<Esc>Ea**<Esc>',  opts)

--  SAVE FILE
vim.api.nvim_set_keymap('n', '<leader>s', ':w<CR>',  opts)

vim.api.nvim_set_keymap('n', '<C-S>', ':w<CR>',  opts)
vim.api.nvim_set_keymap('i', '<leader>s', '<esc>:w<CR>',  opts)


--  clear highlight
vim.api.nvim_set_keymap('n', './', ':nohlsearch<CR>',  opts)

--  NERDTree
-- open nerdtree
vim.api.nvim_set_keymap('n', '<C-N>', ':NERDTreeFocus<CR>',  opts)

--	nvim-R
vim.api.nvim_set_keymap('n', '<leader>rstop', ':RStop<CR>',  opts)

--	vsplit term
--
--	in terminal mode (ie type into shell) return to NORMAL
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-N>', opts)

vim.api.nvim_set_keymap('n', '<Leader>tt', ':vsplit term://zsh<CR>',  opts)


--	render md file with LATEX to pdf
--	first remove old pdf; error if DNE;  but will continue
--	NOTE:  rm -f <file>  will give no error if DNE
vim.api.nvim_set_keymap('n', '<Leader>pdf', ':!rm out.pdf; print_pdf.sh % out.pdf; zathura out.pdf', opts)

-----------------
--  autocmd WORKS
-----------------
--  event is "FileType"
--  USAGE:  :messages (to retrieve )
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"lua", "text"},
  callback = function()
    local data = {
      buf  = vim.fn.expand("<abuf>"),
      file = vim.fn.expand("<afile>"),
      match  = vim.fn.expand("<amatch>"),
    }
    vim.schedule(function()
        print(vim.inspect(data))
    end)
  end,
  }  -- end opts
)    -- end autocmd

--	foldmethod for .md
vim.cmd [[
	autocmd FileType markdown :setlocal foldmethod=manual
	]]


-- TODO:  event FileType ?  correct?
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"help"},
		callback = function()
		vim.o.relativenumber=true
	end,
	}
)

-- TermEnter
--
vim.api.nvim_create_autocmd("TermEnter", {
  callback = function()
-- What do I want?
-- autocmd TermOpen * startinsert			" begin term as insert
  end,
}
)

vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function() print("file saved") end }
)

--	legacy (TDO)
vim.cmd [[
" ==================================
" HARD WRAP, experiment, :messages
" ==================================
" For writing, many recommed hard wrap.  .md is `code` since it
" will pass through pandoc, knitr etc.
" To see effect, look what happens (live) to buffer if columns=40
augroup md_specs
	autocmd!
	autocmd BufWrite *.md :echom "Good"
	autocmd BufWrite *.md :echom "Bye"
	autocmd BufNewFile *.md :echom "new md file"
	autocmd FileType md :set formatoptions=tnqr
	autocmd FileType md :setlocal nowrap nospell linebreak tw=78 
	autocmd BufRead,BufNewFile *.md :setlocal nospell spelllang=en_us

" next line gives errors and no needed;  spellfile is already done
	autocmd BufRead,BufNewFile *.md :setlocal thesaurus+=~/.config/nvim/thesaurus/thesaurii.txt
	"
augroup END

]]

--OLD
--  use ==#   compare strings
--  augroup myterm | au!
--  	au TermOpen * if &buftype ==# 'terminal' | resize q0 | vert resize 50 | endif
--  augroup end
--



local opts = {noremap = true}

-- cursor forward/backward one full screen
vim.api.nvim_set_keymap('n', '<leader>f', '<C-f>', opts )
vim.api.nvim_set_keymap('n', '<leader>b', '<C-b>', opts )

--  FUTURE
--
-- vim.api.nvim_set_keymap('n', '<leader>e', 'vim.cmd("echo init.vim")', {})
-- vim.api.nvim_set_keymap('n', '<leader>x', '<cmd>lua require("jim_code.tools").makeScratch()<CR>', {})
--
--

--  'gd' is working !   BEGIN HERE   LSP for lua
local opts = { noremap = true } 


    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)

    vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)

    vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

    vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)

    vim.api.nvim_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_set_keymap( 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)


-----------------------------
---     FUTURE:   reset ctags
-----------------------------

--- " set tags  (ctags -R .)
--- set tags=~/code/tags
--- " ~/bin/run_ctags.sh does everything
--- " Trigger:   Write Buffer to FILE
--- augroup ctags
--- 	autocmd  BufWritePost *.R,*.Rmd :!~/bin/run_ctags.sh 
--- augroup end
--
--
------------------------------
--				LEGACY  -- DO NOT DELETE
------------------------------
vim.cmd [[

" ==============================
"			PURPOSE:		Command to update (write if changed) buffers, delete all buffers, finally edit last buffer
"			USAGE:			:Bd

command! Bd :up | %bd | e#
" ==============================


" ==============================
"			PURPOSE:	USER COMMAND;    generate PDF via Latex, pandoc
"			USAGE:			:Pdf
 command! Pdf  :!print_pdf.sh % out.pdf; zathura out.pdf
" ==============================


" ==============================
"  PURPOSE:		allow user to pick buffer
   nnoremap <F5> :buffers<CR>:buffer<Space>
" ==============================


" ==============================
"  insert quoted filename in R
" ==============================
"
"  clumpsy 1st attempt
"  insert in R, file <-_" filename"
noremap ,if ifile <- <esc>"<C-%>pBi"<esc>A"<esc><CR>
"
" This is BETTER, but must QUOTE file name
" R, insert current file name, no path
" map <leader>na "%p
" ,naME
au! filetype r,rmd   :nnoremap <leader>na  "%p
" ==============================

"  R:  map for magrittr %>%
au! filetype r,rmd   :nnoremap <leader>%  i%>% <esc>
au! filetype r,rmd   :inoremap <leader>%  %>% 




"	 =====================
"  see :h cmdline.txt
"  PURPOSE:  Use emacs line editng shortcuts,   FOR vim cmdline

" =====================
	" start of line
	:cnoremap <C-A>		<Home>

	" back one character
	:cnoremap <C-B>		<Left>

	" delete character under cursor
	:cnoremap <C-D>		<Del>

	" end of line
	:cnoremap <C-E>		<End>

	" forward one character
	:cnoremap <C-F>		<Right>

	" recall newer command-line
	:cnoremap <C-N>		<Down>

	" recall previous (older) command-line
	:cnoremap <C-P>		<Up>

	" back one word
	:cnoremap <Esc><C-B>	<S-Left>

	" forward one word
	:cnoremap <Esc><C-F>	<S-Right>

" ========================
  " AUTOINSERT closing } brackets
" ========================
" https://vim.fandom.com/wiki/Automatically_append_closing_characters#A_simple_solution
" more details in above link.
"
" dislike !
"inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O



" ==============================
"  :C   command to invoke :noh
"  of course  :noh is just as easy
" ==============================
"
"  / is register vim stores search pattern
"  @/ is way to access the contents
"  let @/ = ""    empties the pattern
" :command C let@/ = ""



"   But this blocks (Normal) q: to open history
" -----------------------------------------------------------
"   FAT FINGER, typing `q` accidentally in normal mode (to create macro)
" -----------------------------------------------------------
"
:nnoremap q :echo "FAT FINGER"<CR>

"-----
" LUA
"-----
"
" This is .vim file
"   But it contains   some lua code.
"   :so %
"
"
"
"  This is .vim code that uses a lua expression.
"  This makes yank visible!
:au TextYankPost * silent! lua vim.highlight.on_yank() 

]]



