local M = {}

M.setup = function()
	-- Quickfix lists
	require("trouble").setup()

	-- diagnostics appearance on buffer
	vim.diagnostic.config({
		underline = true,
		virtual_text = {
			source = "if_many",
		},
		signs = true,
		severity_sort = true,
		float = {
			show_header = true,
			border = "rounded",
			source = "if_many",
		},
	})
end

return M
