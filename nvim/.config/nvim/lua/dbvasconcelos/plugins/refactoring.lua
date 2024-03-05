return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-treesitter/nvim-treesitter" },
		{ "folke/which-key.nvim" },
	},
	config = function()
		require("which-key").register({
			["<leader>r"] = { name = "Refactor" },
		})
	end,
	opts = {
		-- prompt for return type
		prompt_func_return_type = {
			go = true,
			java = true,
		},
		-- prompt for function parameters
		prompt_func_param_type = {
			go = true,
			java = true,
		},
	},
	keys = {
		{
			"<leader>dP",
			"<cmd>lua require('refactoring').debug.cleanup({})<cr>",
			desc = "Undo Prints",
		},
		{
			"<leader>dp",
			"<cmd>lua require('refactoring').debug.printf({below = false})<cr>",
			desc = "Print Function",
		},
	},
}
