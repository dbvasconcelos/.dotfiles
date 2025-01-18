return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		},
		config = function()
			local lspconfig = require("lspconfig")

			-- Register LSP servers
			local languages = {
				bashls = {},
				buf_ls = {},
				dockerls = {},
				gopls = {
					settings = {
						gopls = {
							analyses = {
								unusedparams = true,
								shadow = true,
							},
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
							experimentalPostfixCompletions = true,
							staticcheck = true,
						},
					},
					init_options = {
						usePlaceholders = true,
					},
				},
				hyprls = {},
				jdtls = {},
				jsonls = {},
				lua_ls = {
					on_init = function(client)
						if client.workspace_folders then
							local path = client.workspace_folders[1].name
							if vim.loop.fs_stat(path .. "/.luarc.json") then
								return
							end
						end
						client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
							runtime = {
								-- Tell the language server which version of Lua you're using
								-- (most likely LuaJIT in the case of Neovim)
								version = "LuaJIT",
							},
							-- Make the server aware of Neovim runtime files
							workspace = {
								checkThirdParty = false,
								library = {
									vim.env.VIMRUNTIME,
								},
							},
						})
					end,
					settings = {
						Lua = {},
					},
				},
				pyright = {},
				taplo = {},
				yamlls = {},
			}
			for lsp, conf in pairs(languages) do
				local def = lspconfig.util.default_config
				vim.tbl_deep_extend("force", def, conf)
				local autocompletion = require("cmp_nvim_lsp").default_capabilities()
				def.capabilities = vim.tbl_deep_extend("force", def.capabilities, autocompletion)
				lspconfig[lsp].setup(def)
			end

			-- On attach config
			local keymaps = require("dbvasconcelos.plugins.lsp.keymaps")
			local features = require("dbvasconcelos.plugins.lsp.features")
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					keymaps.setup(event.buf)

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					local augroup = vim.api.nvim_create_augroup("lsp-features", { clear = true })
					features.setup(client, event.buf, augroup)

					-- Cleanup
					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = augroup, buffer = event2.buf })
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
