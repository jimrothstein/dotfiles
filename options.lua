-- $HOME/.config/nvim/init.lua
-----------------
--        OPTIONS
-----------------
--  ignore (for now) global 'vim' warnings
--  expandtab is actually a buffer local 
--  here appear to be setting as a default global (don't understand)

local set = vim.opt -- set options
set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.ignorecase = true           --      make search case insensitive
set.wm = 4                      --      begin new line 4 chars before end of line.
set.number=true
set.relativenumber=true
set.laststatus=3
set.cmdheight=2

--   " after 'updateime' millisecs (1500?) INSERT mode reverts to NORMAL
--  au CursorHoldI * stopinsert

set.showmode = false  --"   12JAN22 Lightline Plugin will dispplay mode (INSERT, NORMAL etc)
set.hidden = false    --    "   [default=no] 

--  syntax enable 		on by default
--

--  set history=50		"   last 50 commands (default 10000)
set.history=50
set.showmode = true			--   show mode

set.cursorline = true		--   highlight current line

set.scrolloff=  5   --  "   scroll, keep cursor 5 lines from top


set.cmdheight=3		-- "	 avoids PRESS any Key to continue

-- set gdefault			" search global :%s/from/to/c
set.autowrite= true	--		" saves to disk when change buffers, :bn
set.autowriteall = true  --     " ...in addition, saves all after :e :n :q
set.autoread= true		--	" re-read if a file changed outside vim
set.shiftround= true	--		" indents will be multipe of shiftwidth (keeps alignment)
set.showmatch=true		--	" highlights matching bracket, paran etc.

--  "   For TRESITTER
set.foldmethod='expr'
set.foldexpr='nvim_treesitter#foldexpr()'


--   set foldmethod=marker	" create fold with zf	
-- set.foldcolumn=3		--" adds visual clue in LEFT margin
set.list=false	--			"NO display TABS, and EOL
set.wrap = true
set.errorbells = false
set.expandtab=false --			" <TAB> expands as spaces,  NO BELLS will sound in R!

set.laststatus=2		--" default=2, means all windows have statusline

-- " %n = buffer number
-- set statusline=
-- set statusline+=%m
-- set statusline+=[%{winnr()}-b%n]
-- " :highlight,  insert color inside # #
-- set statusline+=%#Title#%y[%F]    
-- 
-- --  " begin from right margin
-- set statusline+=%=
-- set statusline+=%c:%l/%L 			" line, column (with tabs, maybe estimate)
-- set statusline+=[%n]

-- set.colorcolumn=81		-- " display right margin

set.title=true
set.number= true
set.relativenumber = true


set.textwidth=79	--	" sets right margin!
set.backup = true
set.backupdir='~/.config/nvim/backup/'	-- do not surround with quotes!

-- vim.cmd [[colo jimColor]]

-- on by default: 
-- filetype plugin on         

------------------
-- disable plugins
------------------
--
-- netrw
vim.cmd [[

	:let g:loaded_netrw       = 1
	:let g:loaded_netrwPlugin = 1
	]]

