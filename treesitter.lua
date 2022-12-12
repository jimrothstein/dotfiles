-- file <- "lua/treesitter-config/treesitter.lua"
----------------------------
-- PURPOSE:     Modules provide features as highlighting, indent ..., 
--              Superior to native neovim features, I guess.
--      
--	NOTE:				Note directory; 
--
-- SETUP FILE:  "/home/jim/.config/nvim/lua/jim_code/telescope.lua-"
--
-- HELP:        :h telescope.nvim
--
-- SETUP:       follow :h telescope (SAME:  github.com/ ..telescope)
----------------------------


require'nvim-treesitter.configs'.setup {
	-- require is pointing to install  treesitter in runtimepath
  ensure_installed = {"lua", "R",  "r", "markdown" },

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- List of parsers to ignore installing
	--  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true } ,

  indent = {
    enable = true},

    -- list of language that will be disabled
		-- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
   additional_vim_regex_highlighting = false,
}



------------------------------------------------------
-- FOLDS
-- Sun 14Aug2022:  fold Does not work in R (return to manual, old way)
-- When expert, return to using TREESITTER for folding
------------------------------------------------------
--
--  turn on folding, using treesitter
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

------------------------------------------------------

