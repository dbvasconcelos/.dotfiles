require("gitsigns").setup({
	on_attach = function(bufnr)
		-- Navigation
		vim.keymap.set(
			"n",
			"]h",
			"&diff ? ']h' : '<cmd>Gitsigns next_hunk<CR>'",
			{ expr = true, buffer = bufnr }
		)
		vim.keymap.set(
			"n",
			"[h",
			"&diff ? '[h' : '<cmd>Gitsigns prev_hunk<CR>'",
			{ expr = true, buffer = bufnr }
		)
	end,
	signs = {
		add = {
			hl = "GitSignsAdd",
			text = "▎",
			numhl = "GitSignsAddNr",
			linehl = "GitSignsAddLn",
		},
		change = {
			hl = "GitSignsChange",
			text = "▎",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
		delete = {
			hl = "GitSignsDelete",
			text = "契",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		topdelete = {
			hl = "GitSignsDelete",
			text = "契",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		changedelete = {
			hl = "GitSignsChange",
			text = "▎",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
	},
})
