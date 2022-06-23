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

-- LSP Install
require("nvim-lsp-installer").setup({
	automatic_installation = true,
})

local custom_oninit = require("dbvasconcelos.lsp.oninit")
local custom_onattach = require("dbvasconcelos.lsp.onattach")
local updated_capabilities = require("dbvasconcelos.lsp.capabilities")
local custom_handlers = require("dbvasconcelos.lsp.handlers")

local lspconfig = require("lspconfig")
local setup_server = function(server, config)
	if not config then
		return
	end

	if type(config) ~= "table" then
		config = {}
	end

	config = vim.tbl_deep_extend("force", {
		on_init = custom_oninit,
		on_attach = custom_onattach,
		capabilities = updated_capabilities,
		handlers = custom_handlers,
	}, config)

	lspconfig[server].setup(config)
end

local linters = {}
local formatters = {}

local servers = require("dbvasconcelos.lsp.servers")
for ft, server in pairs(servers) do
	setup_server(server.lsp, server.config)

	if server.formatter then
		formatters[ft] = {
			function()
				return server.formatter
			end,
		}
	end

	if server.linters then
		linters[ft] = server.linters
	end
end

require("formatter").setup({
	filetype = formatters,
})

require("lint").linters_by_ft = linters
