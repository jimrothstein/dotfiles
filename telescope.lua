
-- telescope.vim
--
----------------------------
-- PURPOSE:     Search files
--
-- SETUP FILE:  "/home/jim/.config/nvim/jim/telescope.lua"
--
-- HELP:        :h telescope.nvim
--
-- SETUP:       follow :h telescope (SAME:  github.com/ ..telescope)
----------------------------
local actions = require("telescope.actions")

require("telescope").setup {
    defaults = {
        prompt_prefix = "$ ",
        file_ignore_patterns = {"^.git", "%.pdf", "%.jpeg", ".html$", "~/config/nvim/backup/" },
				dynamic_preview_title= true,
        cwd = "~/code"},

    mappings = {
        -- insert mode  
--        i = {
--          -- ["<C-l>"] = actions.send_to_qflist,  broken
--							 ["<esc>"] = actions.close -- close telescope
					--		 ["<M-p>"] = action_layout.toggle_preview

--
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        -- ["<C-h>"] = "which_key"
 --     }
  }
}
--[[
local M = {}


function M.grep_prompt()
    require('telescope.builtin').grep_string {
    search = vim.fn.input("g> ")
}
end


function M.grep_notes()
    local opts = {}
    --opts.search_dirs = { "~/docs/", "~/dotfiles" }
    opts.cwd = "~/docs/"
    opts.prompt_title = 'Search Notes'
    require('telescope.builtin').live_grep(opts)
    search = vim.fn.input("notes >")
end


--]]
--
--
------------------------
--  Telescope Extensions
------------------------
--	USAGE:   :telescope bookmarks
require('telescope').load_extension('bookmarks')

require('telescope').setup {
  extensions = {
-- --    bookmarks = {
--       -- Available: 'brave', 'buku', 'chrome', 'chrome_beta', 'edge', 'safari', 'firefox', 'vivaldi'
--       selected_browser = 'firefox',
-- 
--       -- Either provide a shell command to open the URL
--       url_open_command = 'open',
-- 
--       -- Or provide the plugin name which is already installed
--       -- Available: 'vim_external', 'open_browser'
--       url_open_plugin = nil,
-- 
--       -- Show the full path to the bookmark instead of just the bookmark name
--       full_path = true,
-- 
--       -- Provide a custom profile name for Firefox
--       firefox_profile_name = nil,
--     },
  }
}


--------------------
--  Telescope mappings
-- --------------------
--
-- mapping:    Had trouble with lua way,  old vim way seems most succinct 
--   Cut & pasted this:
vim.cmd [[
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
]]




-- -- for interactive, to call picker
--   :lua require('telescope.builtin').live_grep({
--     prompt_title = 'find string in open buffers...',
--     grep_open_files = true
--   })
-- 
---------------------
-- MISC Lua commands:
---------------------
--print NAME of current Buffer
--use buffer number (from :ls) to get name of other buffers
--: lua print(vim.inspect(vim.api.nvim_buf_get_name(0)))
--------------------------------------------------------
--
--
-- To see all mappings:
-- :lua print(vim.inspect(vim.api.nvim_get_keymap('n')))
--------------------------------------------------------
--
-- -- for interactive, to call picker
--   :lua require('telescope.builtin').live_grep({
--     prompt_title = 'find string in open buffers...',
--     grep_open_files = true
--   })
-- 
