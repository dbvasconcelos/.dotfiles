return {
	{
		"famiu/bufdelete.nvim",
		event = "VimEnter",
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
