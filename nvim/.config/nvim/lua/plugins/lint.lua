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
				make = { "checkmake" },
				proto = { "protolint" },
				python = { "ruff" },
				sh = { "shellcheck" },
				yaml = { "yamllint" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})

			require("lint").linters.luacheck.args = {
				"--globals",
				"vim",
				"Snacks",
				"hl",
			}
		end,
	},
}
