return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		dashboard = {
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		lazygit = {},
		notifier = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		terminal = {},
		words = { enabled = true },
	},
	keys = {
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Close Buffer",
		},
		{
			"<leader>bD",
			function()
				Snacks.bufdelete.other()
			end,
			desc = "Close Others",
		},
		{
			"<leader><Home>",
			function()
				Snacks.dashboard()
			end,
			desc = "Show Dashboard",
		},
		{
			"<leader>gS",
			function()
				Snacks.lazygit()
			end,
			desc = "Status on Lazygit",
		},
		{
			"<leader>nn",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notifications History",
		},
		{
			"<leader>nd",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss Notifications",
		},
		{

			"<c-\\>",
			function()
				Snacks.terminal()
			end,
			mode = { "n", "t" },
			desc = "Toggle Terminal",
		},
	},
}
