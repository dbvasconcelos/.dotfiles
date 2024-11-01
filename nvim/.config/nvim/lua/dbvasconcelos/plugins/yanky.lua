return {
	{
		"gbprod/yanky.nvim",
		opts = {},
		keys = {
			{
				"p",
				mode = { "n", "x" },
				"<Plug>(YankyPutAfter)",
				desc = "Put After",
			},
			{
				"P",
				mode = { "n", "x" },
				"<Plug>(YankyPutBefore)",
				desc = "Put Before",
			},
			{
				"gp",
				mode = { "n", "x" },
				"<Plug>(YankyGPutAfter)",
				desc = "Put After",
			},
			{
				"gP",
				mode = { "n", "x" },
				"<Plug>(YankyGPutBefore)",
				desc = "Put Before",
			},
			{
				"<c-p>",
				"<Plug>(YankyPreviousEntry)",
				desc = "Previous Yank",
			},
			{
				"<c-n>",
				"<Plug>(YankyNextEntry)",
				desc = "Next Yank",
			},
		},
	},
}
