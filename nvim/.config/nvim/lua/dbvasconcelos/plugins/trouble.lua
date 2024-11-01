return {
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {
			auto_close = true,
		},
		keys = {
			{
				"<leader>lp",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics",
			},
			{
				"<leader>lP",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Workspace Diagnostics",
			},
		},
	},
}
