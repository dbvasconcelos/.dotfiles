return {
	{
		"famiu/bufdelete.nvim",
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
