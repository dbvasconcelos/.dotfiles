return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["<C-h>"] = false,
				["<C-l>"] = false,
				["<M-s>"] = "actions.select_split",
				["q"] = "actions.close",
			},
		},
		keys = {
			{
				"-",
				vim.cmd.Oil,
				desc = "Open parent directory",
			},
		},
	},
}
