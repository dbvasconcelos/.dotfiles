local M = {}

local lsp_installer = require("nvim-lsp-installer")

M.assure_installed_lsp = function(server_id)
	local supported, server = lsp_installer.get_server(server_id)
	if supported and not server:is_installed() then
		print("Installing " .. server)
		server:install()
	end
	return server
end

return M
