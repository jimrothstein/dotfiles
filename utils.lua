--	file <- "utils.lua"
--
--	REF:	https://ustrajunior.com/posts/reloading-neovim-config-with-telescope/
--
--	To source
-- .,+5source
--
--			PURPOSE:   Put utility files here
--

--			P(arg) will inspect arg
P = function(v)
  print(vim.inspect(v))
  return v
end

P("helo - from utils.lua")


--	RELOAD A MODULE 
--	pcall runs function require with arg="plenary"
--	if error, it catches it.
--	plenary.lua is one of TJ's `every function I don't want to write twice`
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

--	Spell_word function
vim.cmd [[
function! Spell_word()
  set spell
  normal ]s
  normal 1z=
endfunction

"	PURPOSE:	Auto insert date	at bottom of file (works, NOT ACTIVE)
"	USAGE:	:call DateInsert(), OR	
"	  autocmd FileWritePre *.md :call DateInsert()
function DateInsert()
	$read !date
endfunction
]]
