-- file <- "/home/jim/.config/nvim/init.lua"


vim.cmd [[
"----------------------------
"   FILES, sourced at BOTTOM
"----------------------------
"
"  -- lua --
" $HOME/.config/nvim/lua/jim/packer.lua
" $HOME/.config/nvim/lua/jim/telescope.lua
" $HOME/.config/nvim/lua/treesitter-config/
" $HOME/.config/nvim/lua/jim/cmp.lua
" $HOME/.config/nvim/lua/jim/bufferline.lua
" $HOME/.config/nvim/lua/jim/options.lua
" $HOME/.config/nvim/lua/jim/keymaps.lua " autocmds, keymappings
" $HOME/.config/nvim/lua/jim/utils.lua
" $HOME/.config/nvim/lua/jim/windows.lua  " tabs, underline ??
" $HOME/.config/nvim/lua/jim/Nvim-R.lua
"
"
"  --	 ZSH --	
" $HOME/.config/zsh/
"
"
"vim.g.mapleader=','         --  default = \
"vim.g.maplocalleader=','    --  might be clashes

let mapleader=","
let maplocalleader=","

"
" --------------
"  MOVE TO LUA
"  OMNICOMPLETE
" --------------

"### "  OMNICOMPLETE:   Default, insert mode, press <C-P>
" Rmk:   What does next line do?
" Rmk:   set omnifunc = v:lua.vim.lsp.omnifunc
" Rmk:   omnifunc is function that responds to insert ^X^O
"  {
"   set omnifunc = v:lua.vim.lsp.omnifunc
      autocmd FileType Rmd,R, rmd set completefunc=CompleteR
"  
"  }
"


" -----------------------------
" comments , USAGE: <Leader>c
" -----------------------------
nnoremap <Leader>c :call CommentThisLine()<cr>
inoremap <Leader>c <esc>:call CommentThisLine()<cr>

function! CommentThisLine()
		if &filetype  == "vim"
			"  insert " (must escape); also escape to exit
			execute "normal I\" \<esc>"
		else
			exe "normal I# \<esc>"
		endif
endfunction

" -----------------------------
" set working dir to same as active file
" -----------------------------
nnoremap <Leader>cd  :cd %:p:h<Enter>		

" $VIMRC
nnoremap <Leader>sv	:source $VIMRC<cr>



" Use Ctrl-Space to do omnicompletion
inoremap <C-Space> <C-x><C-o>



" ------------------------------------------------------------------
"		SPELL
" ------------------------------------------------------------------
set nospell 
" For activation, use
" :setlocal spell 
" :set spell "always ON

" set language region
set spelllang=en_us
"
" Or, use au  NEED this line?
autocmd BufRead,BufNewFile *.md,markdown :setlocal spelllang=en_us

au FileType tex,latex,markdown setlocal spell spelllang=en_us

" spellfile, english + medical
"
set spellfile=
"built-in
set spellfile+=~/.config/nvim/spell/en.utf-8.add   
set spellfile+=~/.config/nvim/spell/spell.utf-8.add
set spellfile+=~/.config/nvim/spell/medical.utf-8.add

" toggle localspell
func! ToggleSpellCheck()
	exe "normal! :setlocal spell! spelllang=en_us\<CR>"
  " SpellBad words look nice!:w
  " CONFLICT?   see  ./colors.vim
  hi clear SpellBad
  hi SpellBad cterm=underline,bold
  hi SpellBad ctermfg=blue
endfunction

"  USAGE:
nnoremap <Leader>t :call ToggleSpellCheck()<CR>
"
"
"-----------------
" MACRO- reg a, @a
"-----------------
" if lines exist,
" 10@a will insert "foo"
" @a is register a, same as yanking into reg a
let @a = "^ifoo\<Esc>j"
" 
" ===================
" insert completion
" ===================

inoremap <c-l> <c-n>
" inoremap <c-f> <c-n>   " f? forward, but too far from p	 
" likewise ^n works, but too far
"
"
" as variable, ~/.config/nvim
let g:nvim_config_root = stdpath('config')

"----------------------------
"				keep filetypes consistent 
"----------------------------
au BufNewFile,BufRead *.Rmd,*.rmd set filetype=rmd
au BufNewFile,BufRead *.md  set filetype=md
autocmd BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.tex, set filetype=tex

au FileType tex,latex,markdown setlocal spell spelllang=en_us

"	close help files
augroup help_files
	au!
	au filetype help nnoremap <buffer>q :q<CR>
	au filetype help nnoremap <buffer> <CR> <C-]> 
augroup END

"	snippet to use skelton for .md, .sh, .Rmd, .R
augroup skeleton
	au!
  autocmd BufNewfile Read.me r ~/skeletons/skeleton.readme
	autocmd BufNewFile *.md   r ~/.config/nvim/templates/skeleton.md
	autocmd BufNewFile *.sh   r ~/.config/nvim/templates/skeleton.sh
  autocmd BufNewFile *.Rmd	r ~/.config/nvim/templates/skeleton.Rmd
  autocmd BufNewFile *.R    r ~/.config/nvim/templates/skeleton.R
augroup END

augroup R_specs
	autocmd!
	" to be sure Comments repeat as expected
	autocmd FileType r,rmd :set formatoptions+=ro
	autocmd FileType r,rmd inoremap <leader>mm %*% 
	autocmd FileType r,rmd inoremap <leader>pp %>% 
	autocmd FileType markdown :setlocal foldmethod=manual
	autocmd FileType r,rmd :setlocal foldmethod=manual
augroup END

" For .Rmd files, find next/previous 'chunk'
augroup knitr
  autocmd BufNewFile,BufRead *.Rmd nnoremap ]r /```{r<CR>
  autocmd BufNewFile,BufRead *.Rmd nnoremap [r ?```{r<CR>
augroup END


]]

---------------
--			BEGIN LUA 
---------------
--

--  list all *.lua files here (aka modules)
--  actual location ~/.config/nvim/lua/jim.* 
require('jim.packer')
require('jim.telescope')
require('jim.bufferline')
-- require('jim.treesitter')

--  keybindings and autocmd
require('jim.keymaps')
require('jim.options')
require('jim.utils')
require("jim.windows")
require("jim.Nvim-R")
require("treesitter-config")

---------
--    LSP
---------


------- BASIC SETUP kickstart ----------------------------------------------------------------
---------------------------------------------------------------------------------------
-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gr', require('telescope.builtin').lsp_references)
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })
end


-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Enable the following language servers
local servers = { 'r_language_server', 'sumneko_lua' }

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

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
    ['<C-Space>'] = cmp.mapping.complete(),
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
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
  -- Set configuration for specific filetype.
--   cmp.setup.filetype('gitcommit', {
--     sources = cmp.config.sources({
--       { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--     }, {
--       { name = 'buffer' },
--     })
--   })

	--
---------------------------------------------------------------------------------------
-- VimTex confiuration
---------------------------------------------------------------------------------------
vim.cmd [[
    let g:vimtex_view_method= 'zathura'
  ]]

--

--	make packer sync()
local install_plugins = false	-- driving me crazy
if install_plugins then
		require('packer').sync()
end


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--	ATTEMPT to run r_language_server (works)
--	require'lspconfig'.r_language_server.setup{}
  




