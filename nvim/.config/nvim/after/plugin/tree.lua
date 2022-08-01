require("nvim-tree").setup({
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

local group = vim.api.nvim_create_augroup("nvim-tree", {})
vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if
			#vim.api.nvim_list_wins() == 1
			and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
		then
			vim.cmd("quit")
		end
	end,
	group = group,
	desc = "Auto close vim when tree is the last window",
})
