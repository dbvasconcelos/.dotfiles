-- Linerule symbols
require("dbvasconcelos.lsp.signs").setup()

-- Handlers
require("dbvasconcelos.lsp.handlers").setup()

-- Mappings
require("dbvasconcelos.lsp.keybindings").setup()

-- Comments
require("Comment").setup()

-- Lists
require("trouble").setup()

local servers = require("dbvasconcelos.lsp.servers").servers

-- On Attach
local on_attach = function(client)
	-- Highlighting
	if client.resolved_capabilities.document_highlight then
		vim.cmd([[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]])
	end

	-- Code Lens
	if client.resolved_capabilities.code_lens then
		vim.cmd([[
            augroup lsp_document_codelens
                autocmd! * <buffer>
                autocmd BufEnter ++once         <buffer> lua require"vim.lsp.codelens".refresh()
                autocmd BufWritePost,CursorHold <buffer> lua require"vim.lsp.codelens".refresh()
            augroup END
        ]])
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
		on_attach = on_attach,
		capabilities = capabilities,
		flags = { debounce_text_changes = 50 },
	}, config)

	server:setup(config)
end

-- Install
local lsp_installer = require("nvim-lsp-installer")

local formatters = {}
local linters = {}
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
	if config.linter then
		linters[filetype] = config.linter
	end
	setup_server(server, config.lsp)
end

-- Formatters
require("formatter").setup({ logging = false, filetype = formatters })

-- Linters
require("lint").linters_by_ft = linters

-- Run lint on save
vim.cmd([[
    augroup lsp_document_lint
        autocmd! * <buffer>
        autocmd BufWritePost <buffer> lua require"lint".try_lint()
    augroup END
]])
