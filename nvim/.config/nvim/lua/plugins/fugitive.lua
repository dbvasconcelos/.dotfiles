return {
	{
		"tpope/vim-fugitive",
		keys = {
			{
				"<leader>gs",
				vim.cmd.Git,
				desc = "Git Status",
			},
			{
				"<leader>gP",
				"<cmd>Git push<cr>",
				desc = "Git Push",
			},
			{
				"<leader>gp",
				"<cmd>Git pull --rebase<cr>",
				desc = "Git Pull",
			},
			{
				"<leader>gf",
				"<cmd>Git fetch --all<cr>",
				desc = "Git Fetch",
			},
		},
	},
}
