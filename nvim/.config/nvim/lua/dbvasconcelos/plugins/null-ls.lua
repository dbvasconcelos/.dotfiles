return {
	"jose-elias-alvarez/null-ls.nvim",
	opts = function()
		local null_ls = require("null-ls")

		local augroup = vim.api.nvim_create_augroup("LspFormat", {})

		return {
			sources = {
				null_ls.builtins.code_actions.gitsigns,
				null_ls.builtins.code_actions.refactoring,

				null_ls.builtins.diagnostics.editorconfig_checker.with({
					command = "editorconfig-checker",
				}),
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.diagnostics.hadolint,
				null_ls.builtins.diagnostics.luacheck,
				null_ls.builtins.diagnostics.shellcheck,

				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.prettier.with({ extra_filetypes = { "toml" } }),
				null_ls.builtins.formatting.shfmt.with({ extra_args = { "-i", "2", "-ci" } }),
				null_ls.builtins.formatting.stylua,
			},

			on_attach = function(_, bufnr)
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({
							filter = function(client)
								return client.name == "null-ls"
							end,
							bufnr = bufnr,
						})
					end,
				})
			end,
		}
	end,
}
