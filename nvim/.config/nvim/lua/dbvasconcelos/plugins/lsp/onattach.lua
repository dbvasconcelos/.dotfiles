-- Keymaps
local keybindings = function(bufnr)
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "gL", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "gi", "<cmd>Trouble lsp_implementations<cr>", opts)
	vim.keymap.set("n", "gr", "<cmd>Trouble lsp_references<cr>", opts)
end

-- Show line diagnostics automatically in hover window
local diagnostics_hover = function(bufnr)
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

-- Highlight symbol under cursor
local document_highlight = function(bufnr)
	local group = vim.api.nvim_create_augroup("lsp_document_highlight", {})
	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		callback = vim.lsp.buf.document_highlight,
		buffer = bufnr,
		group = group,
	})
	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		callback = vim.lsp.buf.clear_references,
		buffer = bufnr,
		group = group,
	})
end

local M = function(client, bufnr)
	keybindings(bufnr)
	diagnostics_hover(bufnr)
	if client.server_capabilities.documentHighlightProvider then
		document_highlight(bufnr)
	end
end

return M
