return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			{
				{ "williamboman/mason-lspconfig.nvim" },
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
			},
		},
		opts = function()
			local tools = {}
			local languages = require("dbvasconcelos.plugins.lspconfig.lang")
			for _, lang in pairs(languages) do
				if lang.lsp then
					table.insert(tools, lang.lsp)
				end
				if lang.formatter then
					table.insert(tools, lang.formatter)
				end
				if lang.linter then
					table.insert(tools, lang.linter)
				end
			end
			return {
				ensure_installed = tools,
				auto_update = true,
			}
		end,
	},
}
