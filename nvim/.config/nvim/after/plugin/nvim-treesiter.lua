require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"cpp",
		"css",
		"dockerfile",
		"go",
		"html",
		"json",
		"lua",
		"php",
		"vim",
	},

	highlight = { enable = true },
	indent = { enable = true },
})
