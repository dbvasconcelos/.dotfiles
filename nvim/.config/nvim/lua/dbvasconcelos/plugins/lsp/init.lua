return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{
				"williamboman/mason-lspconfig.nvim",
				dependencies = { { "williamboman/mason.nvim" } },
				opts = function()
					local to_install = {}
					local servers = require("dbvasconcelos.plugins.lsp.servers")
					for _, server in pairs(servers) do
						if server.lsp then
							table.insert(to_install, server.lsp)
						end
					end
					return {
						ensure_installed = to_install,
					}
				end,
			},
		},
		config = function()
			-- Diagnostics appearance on buffer
			vim.diagnostic.config({
				underline = true,
				virtual_text = {
					source = "if_many",
				},
				signs = true,
				severity_sort = true,
				float = {
					show_header = true,
					border = "rounded",
					source = "if_many",
				},
			})

			-- Diagnostics Symbols
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

            -- Register LSP servers
			local servers = require("dbvasconcelos.plugins.lsp.servers")
			for _, server in pairs(servers) do
				local config = {}
				if type(server.config) == "table" then
					config = vim.tbl_deep_extend("force", {
						on_attach = require("dbvasconcelos.plugins.lsp.onattach"),
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
					}, server.config)
				end
				require("lspconfig")[server.lsp].setup(config)
			end
		end,
	},
}
