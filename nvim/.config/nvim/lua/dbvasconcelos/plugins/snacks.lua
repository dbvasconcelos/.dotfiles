return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = {},
		bufdelete = {},
		dashboard = {
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		dim = {},
		explorer = {
			replace_netrw = true,
		},
		image = {},
		indent = {},
		input = {},
		notifier = {},
		picker = {
			sources = {
				explorer = {},
			},
		},
		quickfile = {},
		rename = {},
		scope = {},
		scroll = {},
		statuscolumn = {},
		terminal = {},
		words = {},
	},
	keys = {
		{
			"<leader>bq",
			function()
				Snacks.bufdelete()
			end,
			desc = "Close Buffer",
		},
		{
			"<leader>bQ",
			function()
				Snacks.bufdelete.other()
			end,
			desc = "Close Others",
		},
		{
			"<leader>bf",
			function()
				Snacks.dim()
			end,
			desc = "Focus Dim",
		},
		{
			"<leader><Home>",
			function()
				Snacks.dashboard()
			end,
			desc = "Show Dashboard",
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
		{
			"<leader>bd",
			function()
				Snacks.dim()
			end,
			desc = "Toggle Buffer Dim",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Tree",
		},
		{
			"<leader>sf",
			function()
				Snacks.picker.smart()
			end,
			desc = "Files",
		},
		{
			"<leader>sb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.grep()
			end,
			desc = "String",
		},
		{
			"<leader>sc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Config File",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Git Files",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Log",
		},
		{
			"<leader>gL",
			function()
				Snacks.picker.git_log_line()
			end,
			desc = "Git Log Line",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		{
			"<leader>s/",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search History",
		},
		{
			"<leader>s:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			"<leader>si",
			function()
				Snacks.picker.icons()
			end,
			desc = "Icons",
		},
		{
			"<leader>ls",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>lS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
	},
}
