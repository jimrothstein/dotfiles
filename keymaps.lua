----------------

--	TODO
--
--	Sun 14Aug2022
--	remove all foldmethod in TREESITTER (R didn't work)
--	when pro, can review
-- Sun May 15 17:58:01 PDT 2022
--
--	TODO:	-	foldmethod for markdown,R, Rmd now: mnaual;  
--				-	set in keymaps.lua
--				-	for .md, setlocal nospell (till I figure out latex & spell)
----------------
--

local opts = {noremap = true}

-- cursor forward/backward one full screen
vim.api.nvim_set_keymap('n', '<leader>f', '<C-f>', opts )
vim.api.nvim_set_keymap('n', '<leader>b', '<C-b>', opts )

vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', opts )
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', opts )
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', opts )
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', opts )


--  exit insert mode  
vim.api.nvim_set_keymap('i', 'jj', '<Esc>',  opts)
vim.api.nvim_set_keymap('i', 'kk', '<Esc>',  opts)
vim.api.nvim_set_keymap('i', 'jk', '<Esc>',  opts)


--  paste contents of reg "  on command line 
vim.api.nvim_set_keymap('n', '<leader>pr', ':<C-R>"',  opts)


--	yank visual text to SYSTEM	clipboard  ( <C-v> to paste)
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', opts)

--	spell (see ~/.config/nvim/lua/jim/utils.lua)
		vim.api.nvim_set_keymap('n', '<leader>s', ':call Spell_word<CR>', opts)

--	insert date	 (put as regular vim for now)
--	vim.api.nvim_set_keymap('n', '<leader>id', ':r !date +"\%a \%d\%b\%Y" <CR>',  opts)
--- vim.api.nvim_set_keymap('n', '<leader>id', ':r !date \+\%a <CR>',  opts)

--  bold a word (cursor at beginning of word)
vim.api.nvim_set_keymap('n', '<leader>bo', 'i**<Esc>Ea**<Esc>',  opts)

--  SAVE FILE
vim.api.nvim_set_keymap('n', '<leader>s', ':w<CR>',  opts)
vim.api.nvim_set_keymap('n', '<C-S>', ':w<CR>',  opts)
vim.api.nvim_set_keymap('i', '<leader>s', '<esc>:w<CR>',  opts)


--  clear highlight
vim.api.nvim_set_keymap('n', './', ':nohlsearch<CR>',  opts)

--  open NERDTree
vim.api.nvim_set_keymap('n', '<C-N>', ':NERDTreeFocus<CR>',  opts)

--	nvim-R
vim.api.nvim_set_keymap('n', '<leader>rstop', ':RStop<CR>',  opts)

--	vsplit term
vim.api.nvim_set_keymap('n', '<Leader>tt', ':vsplit term://zsh<CR>',  opts)
--
--------------------------------------------------------------
--	TERMINAL
--	:terminal opens terminal buffer, can scroll, not enter text
--	i,a,I, A   allows typing (last line only)
--
--	t = in terminal, able to enter text	
--	n = in terminal, can only scroll
--	to stop entering text and return to scrolling in same window
--	NOTE: can use   autocmd WinEnter term://* startinsert
--------------------------------------------------------------
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-N>', opts)

--	PICK ONE:  ALT  or CTRL
--	Hop between terminal window and other windows ('tnoremap')
vim.api.nvim_set_keymap('t', '<A-h>', '<C-\\><C-N><C-W>h', opts)
vim.api.nvim_set_keymap('t', '<A-j>', '<C-\\><C-N><C-W>j', opts)
vim.api.nvim_set_keymap('t', '<A-k>', '<C-\\><C-N><C-W>k', opts)
vim.api.nvim_set_keymap('t', '<A-l>', '<C-\\><C-N><C-W>l', opts)

vim.api.nvim_set_keymap('n', '<A-k>', 'a<C-\\><C-N><C-W>k', opts)


vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-N><C-W>h', opts)
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-N><C-W>j', opts)
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-N><C-W>k', opts)
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-N><C-W>l', opts)

--OLD
--  use ==#   compare strings
--  augroup myterm | au!
--  	au TermOpen * if &buftype ==# 'terminal' | resize q0 | vert resize 50 | endif
--  augroup end
--

vim.cmd[[
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

]]
--	render md file with LATEX to pdf
--	first remove old pdf; error if DNE;  but will continue
--	NOTE:  rm -f <file>  will give no error if DNE
vim.api.nvim_set_keymap('n', '<Leader>pdf', ':!rm -f out.pdf; print_pdf.sh % out.pdf; zathura out.pdf', opts)

--	USE THIS:  display not save a pdf.	 (later, in zathura can save, if
--	desired)
--	testing?   see ZSH 029A
vim.api.nvim_set_keymap('n', '<Leader>pdf1', ':!pandoc % -f markdown -t pdf -o - | zathura - ', opts)

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



vim.api.nvim_create_autocmd("FileType", {
  pattern = {"r","R"},
		callback = function() print("FileType is r or R") end
	}
)

-- TODO:  event FileType ?  correct?
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"help"},
		callback = function()
		vim.o.relativenumber=true
	end,
	}
)

-- TermEnter (see vim.cmd[[  BELOW ...)
--
-- -- vim.api.nvim_create_autocmd("TermEnter", {
  -- -- callback = function()
-- What do I want?
-- autocmd TermOpen * startinsert			" begin term as insert
  -- end,
--	}
--	)

--	not working with once=true
vim.api.nvim_create_autocmd("BufWritePost", {
	once=true,
  callback = function() print("file saved") end }
)


vim.api.nvim_create_autocmd("BufCreate", {
  callback = function() print("Buffer Created") end }
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
	autocmd BufWrite *.md :echom "buffer written!"
	autocmd BufNewFile *.md :echom "new md file"
	autocmd FileType md :set formatoptions=tnqr
	autocmd FileType md :setlocal nowrap nospell linebreak tw=78 
	autocmd BufRead,BufNewFile *.md :setlocal nospell spelllang=en_us
" next line gives errors and no needed;  spellfile is already done
	autocmd BufRead,BufNewFile *.md :setlocal thesaurus+=~/.config/nvim/thesaurus/thesaurii.txt
augroup END

augroup mkview_gp
		au!
		au BufWrite *.md,*.R,*.Rmd mkview 
		au BufRead *.md silent! loadview 
		au BufRead *.R silent! loadview 
		au BufRead *.Rmd silent! loadview 
augroup end

"	  put in lua (see above)
augroup term_gp
	au!
	" au TermOpen,TermEnter *   startinsert
	" au TermOpen,TermEnter scratch  startinsert
	"	THIS works:
	au BufEnter * if &buftype == 'terminal' | :startinsert | endif
augroup END

]]


--  'gd' is working !   BEGIN HERE   LSP for lua


    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader><C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)

    vim.api.nvim_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_set_keymap( 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)


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
au! FileType r   :nnoremap <leader>na  "%p
au! FileType r  :nnoremap <leader>j iHELLO<esc>
" ==============================




"---------------------------------------------------------------
"  see :h cmdline.txt
"  PURPOSE:  Use emacs line editng shortcuts,   FOR vim cmdline
"	 USAGE:   emacs commands
"---------------------------------------------------------------

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

"
"  This is .vim code that uses a lua expression.
"  This makes yank visible!
"	 NOTE:	silent means no messages;  the (!) means NO error msgs either
:au TextYankPost * silent! lua vim.highlight.on_yank() 

"		insert date   (note:  vim requires percent sign be escaped)
nnoremap ,id :r !date +"\%a \%d\%b\%Y"<CR>
]]




