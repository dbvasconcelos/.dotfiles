return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	opts = {
		settings = {
			save_on_toggle = true,
		},
	},
	keys = {
		{
			"<leader>ma",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Add Mark",
		},
		{
			"<leader>mm",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "List Marks",
		},
		{
			"<leader>mn",
			function()
				require("harpoon"):list():next()
			end,
			desc = "Next Mark",
		},
		{
			"<leader>mN",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "Previous Mark",
		},
		{
			"<leader>m1",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Goto Mark #1",
		},
		{
			"<leader>m2",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Goto Mark #2",
		},
		{
			"<leader>m3",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Goto Mark #3",
		},
		{
			"<leader>m4",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Goto Mark #4",
		},
	},
}
