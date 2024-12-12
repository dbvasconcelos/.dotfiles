local languages = require("dbvasconcelos.plugins.lspconfig.lang")
return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- Register LSP servers
			for _, lang in pairs(languages) do
				local config = {
					capabilities = capabilities,
				}
				if type(lang.config) == "table" then
					table.insert(config, lang.config)
				end
				lspconfig[lang.lsp].setup(config)
			end

			-- Keymaps
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					vim.keymap.set(
						"n",
						"gd",
						"<cmd>Trouble lsp_definitions toggle<cr>",
						{ buffer = event.buf, desc = "go to definition" }
					)

					vim.keymap.set(
						"n",
						"gD",
						"<cmd>Trouble lsp_declarations toggle<cr>",
						{ buffer = event.buf, desc = "go to declaration" }
					)

					vim.keymap.set(
						"n",
						"gr",
						"<cmd>Trouble lsp_references toggle<cr>",
						{ buffer = event.buf, desc = "go to references" }
					)

					vim.keymap.set(
						"n",
						"gI",
						"<cmd>Trouble lsp_implementations toggle<cr>",
						{ buffer = event.buf, desc = "go to implementations" }
					)

					vim.keymap.set(
						"n",
						"<leader>lt",
						"<cmd>Trouble lsp_type_definitions toggle<cr>",
						{ buffer = event.buf, desc = "Type definition" }
					)

					vim.keymap.set(
						"n",
						"<leader>ls",
						require("telescope.builtin").lsp_document_symbols,
						{ buffer = event.buf, desc = "Document Symbols" }
					)

					vim.keymap.set(
						"n",
						"<leader>lS",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						{ buffer = event.buf, desc = "Workspace Symbols" }
					)

					vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { buffer = event.buf, desc = "Rename" })

					vim.keymap.set(
						{ "n", "x" },
						"<leader>la",
						vim.lsp.buf.code_action,
						{ buffer = event.buf, desc = "Code Action" }
					)

					-- Highlight symbol under cursor
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
							end,
						})
					end
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
