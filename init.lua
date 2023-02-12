-- file <- "/home/jim/.config/nvim/init.lua"
-- TODO  ... ,id
-- Tue 31Jan2023, Treesitter config in packer.lua;
--  when stable, move to treesitter.lua
vim.cmd [[
"----------------------------
"   FILES, sourced at BOTTOM
"----------------------------
"
"  -- lua --
" $HOME/.config/nvim/lua/jim/packer.lua
" $HOME/.config/nvim/lua/jim/telescope.lua
" $HOME/.config/nvim/lua/jim/treesitter.lua
" $HOME/.config/nvim/lua/jim/bufferline.lua
" $HOME/.config/nvim/lua/jim/options.lua
" $HOME/.config/nvim/lua/jim/keymaps.lua " autocmds, keymappings
" $HOME/.config/nvim/lua/jim/utils.lua   " spell, comment
" $HOME/.config/nvim/lua/jim/windows.lua  " tabs, underline ??
" $HOME/.config/nvim/lua/jim/Nvim-R.lua

"	$HOME/.local/share/nvim/lsp_servers/
"
"  --	 ZSH --	
" $HOME/.config/zsh/
"
let mapleader=","
let maplocalleader=","

" With LSP, nvim-cmp for autocomplete no use for omnifunction
" jr removed  Nov 2022
      "autocmd FileType Rmd,R, rmd set completefunc=CompleteR

" -----------------------------
" set working dir to same as active file
" -----------------------------
nnoremap <Leader>cd  :cd %:p:h<Enter>		
nnoremap <Leader>sv	:source $VIMRC<cr>

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
" let @a = "^ifoo\<Esc>j"
" 
" ===================
" insert completion
" ===================
" jr stopped Nov 2022
" inoremap <c-l> <c-n>
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
  autocmd BufNewfile *.qmd  r ~/.config/nvim/templates/skeleton.qmd
  autocmd BufNewfile *.tex  r ~/.config/nvim/templates/skeleton.tex
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

]]

---------------
--			BEGIN LUA
---------------
--  actual location ~/.config/nvim/lua/jim.*
--require('jim.packer')
--require('jim.telescope')
--require('jim.bufferline')
-- require('jim.treesitter')

--  keybindings and autocmd
require('jim.keymaps')
require('jim.options')
require('jim.utils')        --  my functions
require("jim.windows")
require("jim.Nvim-R")


------- BASIC SETUP kickstart ----------------------------------------------------------------
---------------------------------------------------------------------------------------
-- LSP settings.
-- on_attach() runs run when an LSP server connects to a particular buffer.
local on_attach = function(_, bufnr)
  --
  -- nmap HELPER function for LSP related items.
  -- It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  -- :h vim.lsp.buf.rename
  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gr', require('telescope.builtin').lsp_references)
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('<leader>df', vim.diagnostic.goto_next, '[G]oto ')   -- not lsp
  nmap('<leader>dl', '<Cmd>Telescope diagnostics<cr>','[G]oto List ')   -- not lsp


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

---------------------------------------
-- LSP & LUA
---------------------------------------
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
      workspace = { library = vim.api.nvim_get_runtime_file('', true) ,
           checkThirdParty = false},
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}

---------------------------------------------------------------------------------------
-- VimTex confiuration
---------------------------------------------------------------------------------------
vim.cmd [[
    let g:vimtex_view_method= 'zathura'
  ]]

--






