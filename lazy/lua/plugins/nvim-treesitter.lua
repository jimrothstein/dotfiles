--   from reddit, add a language parser
--   error:  nvim-treesitter
--
return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"r",
				"yaml",
				"lua",
			},
		},
	},
}
