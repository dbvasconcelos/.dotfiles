return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = {
		{ "ThePrimeagen/refactoring.nvim" },
		{ "lewis6991/gitsigns.nvim" },
		{
			"jay-babu/mason-null-ls.nvim",
			dependencies = { { "williamboman/mason.nvim" } },
			opts = function()
				local tools = {}
				local servers = require("dbvasconcelos.plugins.lsp.servers")
				for _, server in pairs(servers) do
					if server.formatter then
						table.insert(tools, server.formatter)
					end
					if server.linter then
						table.insert(tools, server.linter)
					end
				end
				return {
					ensure_installed = tools,
					handlers = {},
				}
			end,
		},
	},
	event = { "BufReadPre", "BufNewFile" },
	opts = function()
		local null_ls = require("null-ls")
		return {
			sources = {
				null_ls.builtins.code_actions.gitsigns,
				null_ls.builtins.code_actions.refactoring,
				null_ls.builtins.diagnostics.editorconfig_checker.with({
					command = "editorconfig-checker",
				}),
			},
		}
	end,
}
