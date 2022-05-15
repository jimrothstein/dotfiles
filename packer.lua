return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}

	
 
 
  use 'scrooloose/nerdtree'
	use 'tpope/vim-surround'
	use 'jalvesaq/Nvim-R' -- {'branch': 'stable'}

  end)
  

