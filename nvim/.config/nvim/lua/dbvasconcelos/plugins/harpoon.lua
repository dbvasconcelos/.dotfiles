return {
	"ThePrimeagen/harpoon",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"folke/which-key.nvim",
			opts = {
				defaults = {
					["<leader>m"] = { name = "+marks" },
				},
			},
		},
	},
	keys = {
		{
			"<leader>ma",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Add",
		},
		{
			"<leader>ms",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Search",
		},
		{
			"<leader>mn",
			function()
				require("harpoon.ui").nav_next()
			end,
			desc = "Next Mark",
		},
		{
			"<leader>mN",
			function()
				require("harpoon.ui").nav_prev()
			end,
			desc = "Previous Mark",
		},
		{
			"<leader>m1",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			desc = "Goto Mark #1",
		},
		{
			"<leader>m2",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			desc = "Goto Mark #2",
		},
		{
			"<leader>m3",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			desc = "Goto Mark #3",
		},
		{
			"<leader>m4",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			desc = "Goto Mark #4",
		},
		{
			"<leader>m5",
			function()
				require("harpoon.ui").nav_file(5)
			end,
			desc = "Goto Mark #5",
		},
	},
}
