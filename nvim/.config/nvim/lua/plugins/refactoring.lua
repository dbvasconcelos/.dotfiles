return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-treesitter/nvim-treesitter" },
	},
	opts = {
		prompt_func_return_type = {
			go = true,
			cpp = true,
			java = true,
		},
		prompt_func_param_type = {
			go = true,
			cpp = true,
			java = true,
		},
	},
	keys = {
		{
			"<leader>dP",
			function()
				require("refactoring").debug.cleanup({})
			end,
			desc = "Undo Prints",
		},
		{
			"<leader>dp",
			function()
				require("refactoring").debug.printf({ below = false })
			end,
			desc = "Print Function",
		},
		{
			"<leader>dv",
			function()
				require("refactoring").debug.print_var({})
			end,
			desc = "Print Var",
		},
		{
			"<leader>lr",
			function()
				require("refactoring").select_refactor({})
			end,
			mode = { "n", "x" },
			desc = "Refactor",
		},
	},
}
