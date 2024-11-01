return {
	"ThePrimeagen/harpoon",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "folke/which-key.nvim" },
	},
	branch = "harpoon2",
	config = function()
		require("which-key").add({
			{ "<leader>m", group = "Marks" },
		})
	end,
	keys = {
		{
			"<leader>ma",
			function()
				require("harpoon"):list():append()
			end,
			desc = "Add",
		},
		{
			"<leader>ms",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Search",
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
