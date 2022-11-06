

vim.g.completeopt="menu,menuone,noselect"
return require('packer').startup(function(use)
use 'wbthomason/packer.nvim'                                       -- Packer can manage itself
use 'neovim/nvim-lspconfig'                                        --	common config that langage servers need
use { "williamboman/mason.nvim" }                                  -- replaces 'williamboman/nvim-lsp-installer'
	require("mason").setup()

--	completion sources
use	'hrsh7th/nvim-cmp'   
use	'hrsh7th/cmp-nvim-lsp'
use	'hrsh7th/cmp-buffer'
use	'hrsh7th/cmp-path'
use	'hrsh7th/cmp-cmdline'
use	'hrsh7th/cmp-nvim-lua'



use { 'L3MON4D3/LuaSnip' }
use {
  'hrsh7th/nvim-cmp',
  config = function ()
    require'cmp'.setup {
    snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
      end
    },

    sources = {
      { name = 'luasnip' },
      -- more sources
    },
  }
  end
}
use { 'saadparwaiz1/cmp_luasnip' }      -- snip completion

--  Seup lspconfig (for nvim_cmp)
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    capabilities = capabilities
  }

----- treesitter
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

use 'sharkdp/fd'

-- next line is installed via apt
use 'BurntSushi/ripgrep'

------ for telescope-bookmarks (firefox needs sqlite)
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


use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}

--	bufferline.nvim
use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

-- experimental
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})

-----  luapad, for practice
use 'rafcamlet/nvim-luapad'


--	make packer sync()
local install_plugins = false	-- driving me crazy
if install_plugins then
		require('packer').sync()
end

--	end packer
end )
