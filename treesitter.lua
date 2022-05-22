-- treesetter.vim
--
----------------------------
-- PURPOSE:     Modules provide features as highlighting, indent ..., 
--              Superior to native neovim features, I guess.
--      
--
--
-- SETUP FILE:  "/home/jim/.config/nvim/lua/jim_code/telescope.lua-"
--
-- HELP:        :h telescope.nvim
--
-- SETUP:       follow :h telescope (SAME:  github.com/ ..telescope)
----------------------------
---------------------
-- Where to put this?
---------------------
--  fold is buffer? specific (default is close)
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  -- jr:   is this what downloads ALL maintained?
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true } ,

  indent = {
    enable = true},

    -- list of language that will be disabled
  disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
   additional_vim_regex_highlighting = false,
}



--  turn on folding, using treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


