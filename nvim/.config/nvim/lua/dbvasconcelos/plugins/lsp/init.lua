return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		},
		config = function()
			local lspconfig = require("lspconfig")

			-- Register LSP servers
			local languages = require("dbvasconcelos.plugins.lsp.lang")
			for _, lang in pairs(languages) do
				local config = lspconfig.util.default_config
				if type(lang.config) == "table" then
					vim.tbl_deep_extend("force", config, lang.config)
				end
				local autocompletion = require("cmp_nvim_lsp").default_capabilities()
				config.capabilities = vim.tbl_deep_extend("force", config.capabilities, autocompletion)
				lspconfig[lang.lsp].setup(config)
			end

			-- On attach config
			local keymaps = require("dbvasconcelos.plugins.lsp.keymaps")
			local features = require("dbvasconcelos.plugins.lsp.features")
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					keymaps.setup(event.buf)

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					local feats =
						features.setup(client, event.buf, vim.api.nvim_create_augroup("lsp-features", { clear = true }))

					-- Cleanup
					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = feats, buffer = event2.buf })
						end,
					})
				end,
			})

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
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = " ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
			})
		end,
	},
}
