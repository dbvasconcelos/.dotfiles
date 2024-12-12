return {
	"eddyekofo94/gruvbox-flat.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		vim.g.gruvbox_sidebars = {
			"qf",
			"terminal",
			"Trouble",
			"neo-tree",
		}
		vim.g.gruvbox_theme = {
			TelescopePreviewBorder = { fg = "fg", bg = "bg2" },
			TelescopePreviewNormal = { bg = "bg2" },
			TelescopePreviewTitle = { fg = "bg2", bg = "green" },
			TelescopePromptBorder = { fg = "fg", bg = "bg2" },
			TelescopePromptNormal = { fg = "fg", bg = "bg2" },
			TelescopePromptPrefix = { fg = "red", bg = "bg2" },
			TelescopePromptTitle = { fg = "bg2", bg = "red" },
			TelescopeResultsBorder = { fg = "fg", bg = "bg2" },
			TelescopeResultsNormal = { bg = "bg2" },
			TelescopeResultsTitle = { fg = "bg2", bg = "blue" },
		}
	end,
	config = function()
		vim.cmd.colorscheme("gruvbox-flat")
	end,
}
