return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = function()
			require("conform").formatters.shfmt = {
				prepend_args = { "-i", "2" },
			}
			return {
				formatters_by_ft = {
					go = { "golines" },
					json = { "prettier" },
					lua = { "stylua" },
					python = { "isort", "black" },
					sh = { "shfmt" },
					yaml = { "prettier" },
				},
				format_on_save = {
					lsp_format = "fallback",
				},
			}
		end,
	},
}
