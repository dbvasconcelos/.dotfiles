local M = {}

M.signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

M.setup = function()
	for type, icon in pairs(M.signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

return M
