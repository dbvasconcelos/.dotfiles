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
			{
				{ "williamboman/mason.nvim" },
				{ "williamboman/mason-lspconfig.nvim", opts = {} },
				{ "jay-babu/mason-nvim-dap.nvim" },
				{ "jay-babu/mason-null-ls.nvim" },
			},
		},
		opts = function()
			local languages = require("dbvasconcelos.plugins.lsp.lang")
			local tools = {}
			for _, lang in pairs(languages) do
				if lang.lsp then
					table.insert(tools, lang.lsp)
				end
				if lang.formatter then
					for _, f in pairs(lang.formatter) do
						if type(f) == "string" then
							table.insert(tools, f)
						end
					end
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
