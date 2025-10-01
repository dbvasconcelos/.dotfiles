return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			go = { "golines" },
			json = { "prettier" },
			lua = { "stylua" },
			python = { "isort", "black" },
			sh = { "shfmt" },
			yaml = { "prettier" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = {
			timeout_ms = 500,
		},
		formatters = {
			shfmt = { append_args = { "-i", "2" } },
		},
	},
}
