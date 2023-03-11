--	file <- "utils.lua"
--
--	REF:	https://ustrajunior.com/posts/reloading-neovim-config-with-telescope/
--
--	To source
-- .,+5source
--
--
--------------------------------------------------------------------------
--			PURPOSE:   Put utility files (functions, HELPERs) here
--------------------------------------------------------------------------
--

--------------------------------------------------------------------------
--			P(arg) will inspect arg
--------------------------------------------------------------------------
P = function(v)
  print(vim.inspect(v))
  return v
end

P("helo - from utils.lua")
--- :lua P("HI") from cli
--  :lua P(vim.o.formatoptions)



-----------------------------------------------------------------------------
-- runtime directories
-- vim.api.nvim_list_runtime_paths())
-----------------------------------------------------------------------------
Show_runtimepath = function()
  local p = vim.api.nvim_list_runtime_paths()
  for i,j in pairs(p) do
    print(i, j)
  end
end

--------------------------------------------------------------------------
--	RELOAD A MODULE 
--------------------------------------------------------------------------
--	pcall runs function require with arg="plenary"
--	if error, it catches it.
--	plenary.lua is one of TJ's `every function I don't want to write twice`
--------------------------------------------------------------------------
--	toolbag
--
--	If true, ie found module, reloads it.
--	Then returns global function to reload ANY module
--
--	reload_module is key function and is part of plenary module
if pcall(require, "plenary") then
  RELOAD = require("plenary.reload").reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end

--------------------------------------------------------------------------
--	Spell_word function
--------------------------------------------------------------------------
vim.cmd [[
function! Spell_word()
  set spell
  normal ]s
  normal 1z=
endfunction

"--------------------------------------------------------------------------
"	PURPOSE:	Auto insert date	at bottom of file (works, NOT ACTIVE)
"--------------------------------------------------------------------------
"	USAGE:	:call DateInsert(), OR	
"	  autocmd FileWritePre *.md :call DateInsert()
function! DateInsert()
	$read !date
endfunction
]]

vim.cmd [[
" -----------------------------
" comments , USAGE: <Leader>c
" -----------------------------
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
]]
