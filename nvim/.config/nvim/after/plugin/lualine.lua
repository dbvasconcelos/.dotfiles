local colors = require("gruvbox.colors").setup(require("gruvbox.config"))

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

-- branch component
local branch = {
	"b:gitsigns_head",
	icon = "",
	separator = "",
	cond = hide_in_width,
}

-- diff component
local diff = {
	"diff",
	symbols = { added = " ", modified = "柳", removed = " " },
	diff_color = {
		added = { fg = colors.git.add },
		modified = { fg = colors.git.change },
		removed = { fg = colors.git.delete },
	},
	source = function()
		local gitsigns = vim.b.gitsigns_status_dict
		if gitsigns then
			return {
				added = gitsigns.added,
				modified = gitsigns.changed,
				removed = gitsigns.removed,
			}
		end
	end,
	cond = hide_in_width,
}

-- lsp diagnostics component
local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
}

-- indentation component
local indentation = {
	function()
		if not vim.bo.expandtab then
			return "⭾"
		else
			return "␣×" .. vim.bo.shiftwidth
		end
	end,
	cond = hide_in_width,
}

-- encoding component
local encoding = { "encoding", cond = hide_in_width }

-- fileformat component
local fileformat = { "fileformat", cond = hide_in_width }

-- filetype
local filetype = { "filetype", cond = hide_in_width }

require("lualine").setup({
	options = {
		theme = "gruvbox-flat",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { branch, diff },
		lualine_c = { "filename" },
		lualine_x = {
			diagnostics,
			encoding,
			fileformat,
			indentation,
			filetype,
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	extensions = { "quickfix", "fugitive", "fzf", "nvim-tree", "toggleterm" },
})
