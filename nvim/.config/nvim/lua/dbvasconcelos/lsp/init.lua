-- Linerule symbols
require("dbvasconcelos.lsp.signs").setup()

-- Pictograms
require("dbvasconcelos.lsp.pictograms").setup()

-- Handlers
require("dbvasconcelos.lsp.handlers").setup()

-- Comments
require("Comment").setup()

-- On init
local on_init = function(client)
	client.config.flags = client.config.flags or {}
	client.config.flags.allow_incremental_sync = true
end

local lsp_mappings = require("dbvasconcelos.lsp.keybindings")
local servers = require("dbvasconcelos.lsp.servers").servers

-- On Attach
local on_attach = function(client)
	-- Mappings
	lsp_mappings.on_attach(client)

	-- Enable completion triggered by <c-x><c-o>
	vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

	-- Highlighting
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
            augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
            ]],
			false
		)
	end

	-- Code Lens
	if client.resolved_capabilities.code_lens then
		vim.api.nvim_exec(
			[[
            augroup lsp_document_codelens
            au! * <buffer>
            autocmd BufWritePost,CursorHold <buffer> lua vim.lsp.codelens.refresh()
            augroup END
            ]],
			false
		)
	end

	-- Attach any filetype specific options to the client
	local filetype = vim.api.nvim_buf_get_option(0, "filetype")
	if servers[filetype] and servers[filetype].callback then
		servers[filetype].callback(client)
	end
end

-- Extended capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.codeLens = { dynamicRegistration = false }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Setup
local setup_server = function(server, config)
	if not config then
		return
	end

	if type(config) ~= "table" then
		config = {}
	end

	config = vim.tbl_deep_extend("force", {
		on_init = on_init,
		on_attach = on_attach,
		capabilities = capabilities,
		flags = { debounce_text_changes = 50 },
	}, config)

	server:setup(config)
end

-- Install
local lsp_installer = require("nvim-lsp-installer")

local formatters = {}
for filetype, config in pairs(servers) do
	local supported, server = lsp_installer.get_server(config.server)
	if supported then
		if not server:is_installed() then
			print("Installing " .. config.server)
			server:install()
		end
	end
	if config.formatter then
		formatters[filetype] = {
			function()
				return config.formatter
			end,
		}
	end
	setup_server(server, config.lsp)
end

-- Formatters
require("formatter").setup({ logging = false, filetype = formatters })
