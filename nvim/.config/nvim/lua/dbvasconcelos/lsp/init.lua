-- Root dir
require("project_nvim").setup({
	show_hidden = true,
})

-- Comments
require("Comment").setup()

-- Progress
require("fidget").setup()

-- Linerule symbols
require("dbvasconcelos.lsp.signs").setup()

-- Diagnostics
require("dbvasconcelos.lsp.diagnostics").setup()

local custom_onattach = require("dbvasconcelos.lsp.onattach")
local custom_handlers = require("dbvasconcelos.lsp.handlers")
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local servers = require("dbvasconcelos.lsp.servers")

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in pairs(servers) do
	local config = {}
	if type(server.config) == "table" then
		config = vim.tbl_deep_extend("force", {
			on_attach = custom_onattach,
			capabilities = capabilities,
			handlers = custom_handlers,
		}, server.config)
	end

	lspconfig[server.lsp].setup(config)
end
