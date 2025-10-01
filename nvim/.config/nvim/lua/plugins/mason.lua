return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		opts = {},
		keys = {
			{ "<leader>tl", "<cmd>Mason<cr>", desc = "LSP" },
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
		opts = {
			ensure_installed = {
				"bashls",
				"dockerls",
				"editorconfig-checker",
				"golangci-lint",
				"golines",
				"gopls",
				"jsonls",
				"lua_ls",
				"luacheck",
				"shellcheck",
				"shfmt",
				"stylua",
				"yamlls",
			},
			auto_update = true,
		},
	},
}
