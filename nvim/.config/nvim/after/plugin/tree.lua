require("nvim-tree").setup({
	disable_netrw = true,
	view = {
		width = 40,
		mappings = {
			list = {
				{ key = "l", action = "edit" },
				{ key = "h", action = "close_node" },
				{ key = "v", action = "vsplit" },
			},
		},
	},
	renderer = {
		group_empty = true,
		highlight_git = true,
		indent_markers = {
			enable = true,
		},
		icons = {
			glyphs = {
				git = {
					unstaged = "",
					untracked = "",
					deleted = "✗",
				},
			},
		},
	},
	update_focused_file = {
		enable = true,
	},
	diagnostics = {
		enable = true,
	},
	filters = {
		custom = { "\\.git/" },
	},
})
