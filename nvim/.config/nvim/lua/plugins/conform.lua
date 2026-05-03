return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			go = { "goimports", "golines" },
			json = { "prettier" },
			lua = { "stylua" },
			python = { "ruff" },
			sh = { "shfmt" },
			yaml = { "prettier" },
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 500,
		},
		formatters = {
			shfmt = {
				append_args = { "-i", "2" },
			},
		},
	},
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format",
		},
	},
}
