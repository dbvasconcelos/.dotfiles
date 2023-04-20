return {
	{ "folke/lazy.nvim" },
	{ "ahmedkhalf/project.nvim" },
	{ "mbbill/undotree" },
	{ "moll/vim-bbye" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-repeat" },
	{ "gpanders/editorconfig.nvim" },
	{ "VebbNix/lf-vim", ft = "lf" },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"numToStr/Comment.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"j-hui/fidget.nvim",
		},
	},
}
