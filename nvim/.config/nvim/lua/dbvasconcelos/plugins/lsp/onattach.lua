local document_highlight = function(bufnr)
	local group = vim.api.nvim_create_augroup("lsp_document_highlight", {})
	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		callback = vim.lsp.buf.document_highlight,
		buffer = bufnr,
		group = group,
	})
	vim.api.nvim_create_autocmd("CursorMoved", {
		callback = vim.lsp.buf.clear_references,
		buffer = bufnr,
		group = group,
	})
end

local hover = function(bufnr)
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				scope = "cursor",
			}
			vim.diagnostic.open_float(nil, opts)
		end,
	})
end

local keybindings = require("dbvasconcelos.lsp.keybindings")

local M = function(client, bufnr)
	-- Mappings
	keybindings.setup(bufnr)

	-- Highlighting
	if client.server_capabilities.documentHighlightProvider then
		document_highlight(bufnr)
	end

	-- Hover
	hover(bufnr)
end

return M
