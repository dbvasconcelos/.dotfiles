return {
	"eddyekofo94/gruvbox-flat.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.gruvbox_sidebars = { "Trouble" }
		vim.cmd("colorscheme gruvbox-flat")
	end,
}
