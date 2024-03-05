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
		},
	},
}
