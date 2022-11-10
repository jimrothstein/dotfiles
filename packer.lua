--  packer.lua only

vim.g.completeopt="menu,menuone,noselect"

require('packer').startup(function(use)
use 'wbthomason/packer.nvim'                                       -- Packer can manage itself
use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }            -- Add git related info in the signs columns and popups

use 'nvim-treesitter/nvim-treesitter'                                                -- Highlight, edit, and navigate code
use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } } -- Additional textobjects for treesitter

use 'neovim/nvim-lspconfig'                                        --	common config that langage servers need
use { "williamboman/mason.nvim" }                                  -- replaces 'williamboman/nvim-lsp-installer'
	require("mason").setup()
 use 'williamboman/mason-lspconfig.nvim'                                              -- Automatically install language servers to stdpath

--	completion sources
use	{'hrsh7th/nvim-cmp', requires=  {	'hrsh7th/cmp-nvim-lsp'}}
-- use	'hrsh7th/cmp-buffer'
-- use	'hrsh7th/cmp-path'
use	'hrsh7th/cmp-cmdline'
use	'hrsh7th/cmp-nvim-lua'

---------------------------------------------
--   indent-blankline.nvim
---------------------------------------------

use "lukas-reineke/indent-blankline.nvim"

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {

--  my windows.lua created errors with next 2 lines  (treesitter?)
--    show_current_context = true,		-- activates?
--    show_current_context_start = true,
    show_end_of_line = true,
    space_char_blankline = ".",
		indent_blank_line_car = "|",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}

-----  luapad, for practice
use 'rafcamlet/nvim-luapad'

use { 'L3MON4D3/LuaSnip' }
use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }                -- Snippet Engine and Snippet Expansion

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }
  
----- treesitter

use 'sharkdp/fd'

-- next line is installed via apt
use 'BurntSushi/ripgrep'

------ for telescope-bookmarks (firefox needs sqlite)
-----------------------------------------------------
use 'kkharji/sqlite.lua'
use {'dhruvmanila/telescope-bookmarks.nvim',
 tag = '*',
  -- Uncomment if the selected browser is Firefox, Waterfox or buku
  requires = {
    'kkharji/sqlite.lua',
  }
}
--	for QUARTO support in neovim
use { 'quarto-dev/quarto-nvim',
  requires = {'neovim/nvim-lspconfig'}
}

--  which-key
use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

use 'scrooloose/nerdtree'
use  'tpope/vim-surround' 
use 'jalvesaq/Nvim-R' -- {'branch': 'stable'}
-- use 'latex-lsp/texlab'
use 'lervag/vimtex'


--	bufferline.nvim
use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

-- experimental
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})

end)

--   END packer
-----------------------------------------------------


