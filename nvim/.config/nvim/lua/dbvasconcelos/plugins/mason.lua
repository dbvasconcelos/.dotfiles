return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	dependencies = {
		{
			"folke/which-key.nvim",
			opts = {
				groups = {
					["<leader>t"] = { name = "+tools" },
				},
			},
		},
	},
	build = ":MasonUpdate",
	opts = {
		ui = {
			border = "rounded",
		},
	},
	keys = {
		{
			"<leader>tp",
			"<cmd>Lazy sync<cr>",
			desc = "Plugins",
		},
		{
			"<leader>tl",
			"<cmd>Mason<cr>",
			desc = "LSP",
		},
	},
}
