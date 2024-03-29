--  packer.lua only

vim.g.completeopt="menu,menuone,noselect,noinsert"

--	HELPER:  make packer sync()
local install_plugins = true
if install_plugins then
	--		require('packer').sync()
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
-- Setup mason so it can manage external tooling (LSP, plugins ..)
use { "williamboman/mason.nvim" }                                  -- replaces 'williamboman/nvim-lsp-installer'
	require("mason").setup()

use 'williamboman/mason-lspconfig.nvim'                                              -- Automatically install language servers to stdpath

--	completion sources, nvim-cmp replaces built-in omnicomplete AND does
  --	autocompetion!   To connect to LSP source, requires cmp-nvim-lsp.u
use	{'hrsh7th/nvim-cmp', requires=  {	'hrsh7th/cmp-nvim-lsp'}}
-- use {'hrsh7th/cmp-omni'}  NO, NO, NO ... 
--
use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }                -- Snippet Engine and Snippet Expansion

local luasnip = require 'luasnip'
local cmp = require'cmp'

-- `keyword_lenght=5 completion actives on 5 character typed

cmp.setup {
   snippet = {
     expand = function(args)
       luasnip.lsp_expand(args.body)
     end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    --  documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
       elseif luasnip.expand_or_jumpable() then
         luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
	sources={
    {name='nvim_lsp', max_item_count=10  },
    {name='nvim_lua' },     -- lua api
<<<<<<< HEAD
=======
  {name='luasnip'},
>>>>>>> 96fc08f7229b3f2eb38662de029ee258c2a86a19
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
<<<<<<< HEAD
             "jmbuhr/otter.nvim"
},
=======
             "jmbuhr/otter.nvim" },
>>>>>>> 96fc08f7229b3f2eb38662de029ee258c2a86a19
  config= function()
    require'quarto'.setup{
      lspFeatures = {
        enabled = true,
        languages = {'r' },
        diagnostics = {
          enabled = true,
          triggers = { "BufWrite" }
        },
        completion = {
          enabled = true
        }
      }
    }
  end
  }
  --
<<<<<<< HEAD
use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
        --
      -- disable the WhichKey popup for certain buf types and file types.
      -- Disabled by deafult for Telescope
      disable = {
        buftypes = { },
        filetypes = { "TelescopePrompt, r" },
        }
    }
  end
}
=======

--  which-key  Turn OFF till disable for .r files 
-- use {
--   "folke/which-key.nvim",
--   config = function()
--     vim.o.timeout = true
--     vim.o.timeoutlen = 500
--       -- disable the WhichKey popup for certain buf types and file types.
--       -- Disabled by deafult for Telescope
--     require("which-key").setup {
--       -- your configuration comes here
--       -- or leave it empty to use the default settings
--       -- refer to the configuration section below
--       disable = {
--         buftypes = { },
--         filetypes = { "TelescopePrompt, r" },
--         }
--         --
--     }
--   end
-- }
>>>>>>> 96fc08f7229b3f2eb38662de029ee258c2a86a19

use 'scrooloose/nerdtree'
use  'tpope/vim-surround'

  -- for MOST recent Nvim-R 
use { 'jalvesaq/Nvim-R', branch = 'master' }

--use 'jalvesaq/Nvim-R' -- {'branch': 'stable'} -- older, stable
local status_ok, ver = pcall(require, "jalvesaq/Nvim-R")
if not status_ok then
    vim.notify("WARNING: Nvim-R failed to load.")
    return
end


-- activiate latex autocomplete .tex files
use 'latex-lsp/texlab'

--  copy from lervag/vimtex
use{ 'lervag/vimtex',
    vim.cmd([[
    " # let g:vimtex_view_method = 'skim'
    "  let g:vimtex_view_automatic = 0
    "  let g:vimtex_compiler_latexmk = {'continuous': 0}
    "  let g:vimtex_quickfix_open_on_warning = 0
    "  let g:vimtex_view_method= 'zathura'
      ]])
}

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
use({'rcarriga/nvim-notify'})
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})

end)

--	ATTEMPT to run r_language_server (works), 
--	code inside setup will run each buffer, as r_language_server attaches
--
--require'lspconfig'.r_language_server.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--   }
--   END packer
-----------------------------------------------------


