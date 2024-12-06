local filetypes = require("dbvasconcelos.plugins.lsp.filetypes")
return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{
				"williamboman/mason-lspconfig.nvim",
				dependencies = "williamboman/mason.nvim",
				opts = function()
					local servers = {}
					for _, ft in pairs(filetypes) do
						if ft.lsp then
							table.insert(servers, ft.lsp)
						end
					end
					return {
						ensure_installed = servers,
					}
				end,
			},
			{
				"stevearc/conform.nvim",
				opts = function()
					local formatters = {}
					for ftstr, ft in pairs(filetypes) do
						if ft.formatter then
							formatters[ftstr] = { ft.formatter }
						end
					end
					return {
						formatters_by_ft = formatters,
						format_on_save = {
							lsp_format = "fallback",
						},
					}
				end,
			},
			{
				"mfussenegger/nvim-lint",
				config = function()
					local linters = {}
					for ftstr, ft in pairs(filetypes) do
						if ft.linter then
							linters[ftstr] = { ft.linter }
						end
					end
					require("lint").linters_by_ft = linters
				end,
			},
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- Register LSP servers
			for _, ft in pairs(filetypes) do
				local config = {}
				if type(ft.config) == "table" then
					config = vim.tbl_deep_extend("force", {
						on_attach = require("dbvasconcelos.plugins.lsp.onattach"),
						capabilities = capabilities
					}, ft.config)
				end
				lspconfig[ft.lsp].setup(config)
			end

			-- Diagnostics appearance on buffer
			vim.diagnostic.config({
				virtual_text = {
					source = "if_many",
				},
				severity_sort = true,
				float = {
					show_header = true,
					border = "rounded",
					source = "if_many",
				},
			})

			-- Diagnostics Symbols
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end
		end,
	},
}
