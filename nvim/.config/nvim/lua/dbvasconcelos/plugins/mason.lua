return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
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
					{ "<leader>tp", "<cmd>Lazy sync<cr>", desc = "Plugins" },
					{ "<leader>tl", "<cmd>Mason<cr>",     desc = "LSP" },
				},
			},
		},
		opts = function()
			local tools = {}
			local filetypes = require("dbvasconcelos.plugins.lsp.filetypes")
			for _, ft in pairs(filetypes) do
				if ft.formatter then
					table.insert(tools, ft.formatter)
				end
				if ft.linter then
					table.insert(tools, ft.linter)
				end
			end
			return {
				ensure_installed = tools,
			}
		end,
	},
}
