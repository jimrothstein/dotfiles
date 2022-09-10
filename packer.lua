return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'

use 	'hrsh7th/nvim-cmp'   
use	'hrsh7th/cmp-nvim-lsp'
use	'hrsh7th/cmp-buffer'
use	'hrsh7th/cmp-path'
use	'hrsh7th/cmp-cmdline'
use	'hrsh7th/cmp-nvim-lua'

use 'williamboman/nvim-lsp-installer'

----- treesitter
use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

use 'sharkdp/fd'

-- next line is installed via apt
use 'BurntSushi/ripgrep'

------ for telescope-bookmarks (firefox needs sqlite)
--" Plug 'dhruvmanila/telescope-bookmarks.nvim'
-- Plug 'tami5/sqlite.lua'

use 'scrooloose/nerdtree'
use  'tpope/vim-surround' 
use 'jalvesaq/Nvim-R' -- {'branch': 'stable'}

use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}

--	bufferline.nvim
use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}


--	end packer
end )
