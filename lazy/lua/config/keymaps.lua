-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--      NOTHING WORKS
-- vim.keymap.set("n", "<leader>pv", vim.cmd.e)

local builtin = require("telescope.builtin")

-- vim.keymap.set("n", "ppf", builtin.find_files({}))

-- vim.keymap.set("n", "<Leader>ps", function()
-- builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)
