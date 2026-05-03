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
		opts = {
			ensure_installed = {
				"bashls",
				"dockerls",
				"gitlab_ci_ls",
				"gopls",
				"hyprls",
				"jsonls",
				"lua_ls",
				"pyright",
				"protols",
				"taplo", -- TOML
				"yamlls",
			},
		},
	},
	{
		"owallb/mason-auto-install.nvim",
		dependencies = {
			"mason-org/mason.nvim",
		},
		opts = {
			packages = {
				-- Linters
				"checkmake",
				"editorconfig-checker",
				"gitlint",
				"golangci-lint",
				"hadolint",
				"jsonlint",
				"luacheck",
				"ruff", -- Python
				"shellcheck",
				"yamllint",
				-- Formatters
				"goimports",
				"golines",
				"prettier",
				"shfmt",
				"stylua",
				-- Debug Adapters
				"delve",
			},
		},
	},
}
