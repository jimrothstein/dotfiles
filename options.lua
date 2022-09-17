-- $HOME/.config/nvim/init.lua
-- TODO:
-- Mon May 23 22:10:02 PDT 2022
-- do want backup, but backupdir is screwy ; so removed dir to see what default
-- is.
--
--Thu Jun  2 00:19:31 PDT 2022
-- change indent per !so 51995128
-----------------
--        OPTIONS
-----------------
--  ignore (for now) global 'vim' warnings
--  expandtab is actually a buffer local 
--  here appear to be setting as a default global (don't understand)

local set = vim.opt -- set options
set.expandtab = true					--	expands as spaces
set.tabstop = 2								--	width of \t
set.shiftwidth = 0						--	use tabstop, width when using << >> 
set.softtabstop = -1					--	use tabstop
set.shiftround= true					--	indents will be multipe of shiftwidth (keeps alignment)
set.autoindent =  true				--	keep same identent as prior line
set.smartindent = true				--	increase indent with {
set.ignorecase = true           --      make search case insensitive
set.wm = 4                      --      begin new line 4 chars before end of line.
set.number=true
set.relativenumber=true
set.laststatus=3
set.splitright=true							-- vsplit puts new window to the right

--   " after 'updateime' millisecs (1500?) INSERT mode reverts to NORMAL
--  au CursorHoldI * stopinsert

set.hidden = false    --    "   [default=no] 
set.history=50
set.showmode = true			--   show mode (insert etc )
set.cursorline = true		--   highlight current line
set.scrolloff=  5   --  "   scroll, keep cursor 5 lines from top
set.cmdheight=4		-- "	 avoids PRESS any Key to continue

-- set gdefault			" search global :%s/from/to/c
set.autowrite= true	--		" saves to disk when change buffers, :bn
set.autowriteall = true  --     " ...in addition, saves all after :e :n :q
set.autoread= true		--	" re-read if a file changed outside vim
set.showmatch=true		--	" highlights matching bracket, paran etc.


--------------------------------------------------------
--					foldmethod
--	Sun 14Aug2022
--	TURNED OFF, does not work with R. see also treesiter settngs
--  "   For TRESITTER
-- set.foldmethod='expr'
--	set.foldexpr='nvim_treesitter#foldexpr()'


--   set foldmethod=marker	" create fold with zf	
-- set.foldcolumn=3		--" adds visual clue in LEFT margin
--------------------------------------------------------
--
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
--		BACKUP
set.backup = true
set.writebackup	= true				-- backup before saving changes
-- setupext (default = "~")
--

-- FAILED set.backupdir='~/.config/nvim/backup/'	-- do not surround with quotes!
-- FAILED set.backupdir=~/.backup/
-- FAILED vim.opt.backupdir=/home/jim/.backup/
vim.opt.backupdir = "/home/jim/.backup/"

-- vim.cmd [[colo jimColor]]

-- on by default: 
-- filetype plugin on         

------------------
-- disable plugins
------------------
--
-- netrw
vim.cmd [[

"	connect vim and system clipboard (xsel )
	set clipboard+=unnamedplus
	:let g:loaded_netrw       = 1
	:let g:loaded_netrwPlugin = 1
	]]

		
