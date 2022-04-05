local tree_cb = require("nvim-tree.config").nvim_tree_callback

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		untracked = "",
		deleted = "✗",
	},
}

require("nvim-tree").setup({
	disable_netrw = true,
	update_focused_file = {
		enable = true,
	},
	diagnostics = {
		enable = true,
	},
	filters = {
		custom = { ".git/" },
	},
	view = {
		width = 40,
		auto_resize = true,
		mappings = {
			list = {
				{ key = "l", cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
			},
		},
	},
})

local group = vim.api.nvim_create_augroup("autoclose_tree", { clear = true })
-- auto close tree
vim.api.nvim_create_autocmd("BufEnter", {
	command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
	group = group,
})
