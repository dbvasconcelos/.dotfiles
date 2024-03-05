return {
	{
		"moll/vim-bbye",
		lazy = false,
		keys = {
			{
				"<leader>q",
				vim.cmd.Bdelete,
				desc = "Close Buffer",
			},
			{
				"<leader>Q",
				vim.cmd.Bwipeout,
				desc = "Close All Buffers",
			},
		},
	},
}
