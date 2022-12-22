--  packer.lua only

vim.g.completeopt="menu,menuone,noselect"

--	HELPER:  make packer sync()
local install_plugins = false	-- driving me crazy
if install_plugins then
		require('packer').sync()
end

require('packer').startup(function(use)
use 'wbthomason/packer.nvim'                                       -- Packer can manage itself
use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('gitsigns').setup()
  end
}            -- Add git related info in the signs columns and popups

----------------------------------------------------------------------------------------
use {
  'nvim-treesitter/nvim-treesitter',                                                -- Highlight, edit, and navigate code
  run= 'TSUpdate'
}

--  TODO:   move to treesitter setup when stable.  Otherwise, use manual.

--  Treesittter suggests this WORKAROUND with Packer
-- vim.opt.foldmethod     = 'expr'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
---WORKAROUND
-- vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
--   group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--   callback = function()
--     vim.opt.foldmethod     = 'expr'
--     vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--   end
-- })
----------------------------------------------------------------------------------------
use { 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } } -- Additional textobjects for treesitter

----------------------------------------------------------------------------
-- SEE :h lspconfig.txt
-- nvim-lspconfig is a collection of community-contributed configurations...
	-- lanuage servers need 

use 'neovim/nvim-lspconfig'                                        --	common config that langage servers need
----------------------------------------------------------------------------
	--
use { "williamboman/mason.nvim" }                                  -- replaces 'williamboman/nvim-lsp-installer'
	require("mason").setup()

use 'williamboman/mason-lspconfig.nvim'                                              -- Automatically install language servers to stdpath

--	completion sources
use	{'hrsh7th/nvim-cmp', requires=  {	'hrsh7th/cmp-nvim-lsp'}}
use {'hrsh7th/cmp-omni'}
local cmp = require'cmp'


--`keyword_lenght=5 completion actives on 5 character typed
cmp.setup {
	sources={
	{name='nvim_lsp', max_item_count=10, keyword_length=5 },
	{name='nvim_lua', keyword_length=5 },     -- lua api
	{name='luasnipe', keyword_length=5 },
  {name = 'r_language_server', keyword_length=5},
	{name='buffer', keyword_length=5 },
  {name='omni', }
	},
	on_attach= function() print("I just attached")
		end

	}

-- 	cmp-config{
--   		completion = {
--     			autocomplete = false,
-- 	-- 		:h cmp.txt, cmp-config.completion.keyword_length
-- 			keyword_length =  4
--   }
--  }
-- }


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

--------------------------------------
--  which-key
--------------------------------------
use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
				-- neovim timeoutlen defaults to 1000
			spelling = {
						enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    }

				--
  end
}

use 'scrooloose/nerdtree'
use  'tpope/vim-surround' 
use 'jalvesaq/Nvim-R' -- {'branch': 'stable'}
-- activiate latex autocomplete .tex files
use 'latex-lsp/texlab'
use 'lervag/vimtex'

--   should git/branch clearly
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
}

 require('lualine').setup({
   options = {
     icons_enabled = false,
     component_separators = { left = '|', right = '|'},
     section_separators  = { left = '|', right = '|'},
   },
   sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},-- 'diff', 'diagnostics'},
        lualine_c = {'filename', 'encoding', 'fileformat', 'filetype' },
        lualine_x = {},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
 })

--	bufferline.nvim
--	Nov 23, purpose?
-- use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

use { "ellisonleao/gruvbox.nvim" }
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- experimental
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})

end)

--   END packer
-----------------------------------------------------


