--  packer.lua only

vim.g.completeopt="menu,menuone,noselect,noinsert"

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
----------------------------------------------------------------------------------------
  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }---------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

--  TODO:   move to treesitter setup when stable.  Otherwise, use manual.

-- vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
--   group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--   callback = function()
--     vim.opt.foldmethod     = 'expr'
--     vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--   end
-- })
----------------------------------------------------------------------------------------
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = {  'lua',  'r', 'help', 'vim' },

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

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

--	completion sources, nvim-cmp replaces built-in omnicomplete AND does
  --	autocompetion!   To connect to LSP source, requires cmp-nvim-lsp.u
use	{'hrsh7th/nvim-cmp', requires=  {	'hrsh7th/cmp-nvim-lsp'}}
-- use {'hrsh7th/cmp-omni'}  NO, NO, NO ... 
local cmp = require'cmp'

--`keyword_lenght=5 completion actives on 5 character typed
cmp.setup {
	sources={
    {name='nvim_lsp', max_item_count=10  },
    {name='nvim_lua' },     -- lua api
    {name='luasnipe' },
    {name = 'r_language_server', max_item_count=10},
    {name='buffer', keyword_length=5 },
--  {name='omni', keyword_length = 5 }   NONONO
	},
	on_attach= function() print("I just attached")
		end

	}




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
  requires = {'neovim/nvim-lspconfig',
              "jmbuhr/otter.nvim"}
}
  -- from:  quarto github 
require'quarto'.setup{
  lspFeatures = {
    enabled = true,
    languages = {'r', 'python'},
    diagnostics = {
      enabled = false
    },
    cmpSource = {
      enabled = true
    }
  }
}
--------------------------------------
--  which-key   SEE ~/.config/nvim/lua/jim/which-key.lua
--------------------------------------

use 'scrooloose/nerdtree'
use  'tpope/vim-surround'
use {'jalvesaq/Nvim-R',  {branch = 'master'} }  -- most recentl

--use 'jalvesaq/Nvim-R' -- {'branch': 'stable'} -- older, stable
    --
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
vim.o.background = "light" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

-- experimental
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})

end)

--   END packer
-----------------------------------------------------


