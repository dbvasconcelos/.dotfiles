-- Comments
require("Comment").setup()

-- Linerule symbols
require("dbvasconcelos.lsp.signs").setup()

-- Diagnostics
require("dbvasconcelos.lsp.diagnostics").setup()

local setup_server = function(server, config)
	if not config then
		return
	end

	if type(config) ~= "table" then
		config = {}
	end

	config = vim.tbl_deep_extend("force", {
		on_attach = require("dbvasconcelos.lsp.onattach"),
		capabilities = require("dbvasconcelos.lsp.capabilities"),
		handlers = require("dbvasconcelos.lsp.handlers"),
	}, config)

	server:setup(config)
end

local linters = {}
local formatters = {}

local servers = require("dbvasconcelos.lsp.servers")
local installers = require("dbvasconcelos.lsp.installers")
for ft, config in pairs(servers) do
	if config.server_id then
		local server = installers.assure_installed_lsp(config.server_id)
		setup_server(server, config.lsp)
	end

	if config.formatter then
		formatters[ft] = {
			function()
				return config.formatter
			end,
		}
	end

	if config.linters then
		linters[ft] = config.linters
	end
end

require("formatter").setup({
	filetype = formatters,
})

require("lint").linters_by_ft = linters
