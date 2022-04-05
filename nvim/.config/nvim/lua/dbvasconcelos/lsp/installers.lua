local M = {}

local lsp_installer = require("nvim-lsp-installer")
local dap_install = require("dap-install")
local di_api = require("dap-install.api.debuggers")

M.assure_installed_lsp = function(server_id)
	local supported, server = lsp_installer.get_server(server_id)
	if supported and not server:is_installed() then
		print("Installing " .. server)
		server:install()
	end
	return server
end

M.assure_installed_debugger = function(debugger_id)
	local installed = false
	for _, d in pairs(di_api.get_installed_debuggers()) do
		if d == debugger_id then
			installed = true
			break
		end
	end
	if not installed then
		print("Installing " .. debugger_id)
		require("dap-install.core.install").install_debugger(debugger_id)
	end

	dap_install.config(debugger_id, {})
end
return M
