return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			plugins = {
				presets = {
					operators = false, -- no help for operators like d, y, ...
					motions = false, -- no help for motions
					text_objects = false, -- no help for text objects triggered after entering an operator
				},
			},
			spec = {
				{ "[", group = "prev" },
				{ "]", group = "next" },
				{ "g", group = "goto" },
				{ "<leader>b", group = "buffer" },
				{ "<leader>d", group = "debug" },
				{ "<leader>g", group = "git" },
				{ "<leader>h", group = "hunks" },
				{ "<leader>l", group = "lsp" },
				{ "<leader>m", group = "marks" },
				{ "<leader>s", group = "search" },
				{ "<leader>t", group = "tools" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Keymaps",
			},
			{ "<leader>tp", "<cmd>Lazy sync<cr>", desc = "Plugins" },
		},
	},
}
