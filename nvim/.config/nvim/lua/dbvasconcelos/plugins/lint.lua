return {
	{
		"mfussenegger/nvim-lint",
		lazy = false,
		config = function()
			require("lint").linters_by_ft = {
				dockerfile = { "hadolint" },
				git = { "gitlint" },
				go = { "golangcilint" },
				json = { "jsonlint" },
				lua = { "luacheck" },
				proto = { "protolint" },
				python = { "flake8" },
				sh = { "shellcheck" },
				yaml = { "yamllint" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
