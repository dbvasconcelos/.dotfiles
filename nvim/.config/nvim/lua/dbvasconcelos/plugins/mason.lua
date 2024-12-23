return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		build = ":MasonUpdate",
		opts = {
			ui = {
				border = "rounded",
			},
		},
		keys = {
			{ "<leader>tl", "<cmd>Mason<cr>", desc = "LSP" },
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			{ "williamboman/mason.nvim" },
		},
		opts = function()
			local tools = {}
			-- LSP
			table.insert(tools, {
				"bash-language-server",
				"buf",
				"css-lsp",
				"dockerfile-language-server",
				"gitlab-ci-ls",
				"gopls",
				"hyprls",
				"jdtls",
				"json-lsp",
				"lua-language-server",
				"pyright",
				"taplo",
				"texlab",
				"yaml-language-server",
			})
			-- Debug
			table.insert(tools, {
				"bash-debug-adapter",
				"debugpy",
				"delve",
			})
			-- Format
			table.insert(tools, {
				"black",
				"goimports",
				"golines",
				"isort",
				"prettier",
				"shfmt",
				"stylua",
			})
			-- Lint
			table.insert(tools, {
				"gitlint",
				"golangci-lint",
				"hadolint",
				"jsonlint",
				"luacheck",
				"protolint",
				"flake8",
				"shellcheck",
				"yamllint",
			})
			return {
				ensure_installed = tools,
				auto_update = true,
			}
		end,
	},
}
