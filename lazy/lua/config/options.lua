-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
print("hello: nvim/config/options.lua")
--          PUT jr options here !:
vim.opt.relativenumber = true -- test only, already set to true by lazyv
vim.opt.number = true
vim.cmd([[ set background=dark]])
vim.cmd([[ set clipboard+=unnamedplus]])
vim.cmd([[ set listchars=tab:<->]])

vim.g.R_assign = 2

--  turn off netrw (`let g:loaded_netrw = 1`)
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

--  load luasnip?
local ls = require("luasnip")

--  load mini.surround
require("mini.surround")

--  practice function
local function nohl_or_buffer_cycle()
	if vim.v.hlsearch == 1 then
		vim.cmd("nohlsearch")
	else
		vim.g.hlsearch = 1
		-- vim.cmd("BufferLineCycleNext")
	end
end

vim.keymap.set("n", "<C-l>", nohl_or_buffer_cycle)
