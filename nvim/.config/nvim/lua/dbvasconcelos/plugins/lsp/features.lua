local M = {}

M.setup = function(client, buffer, augroup)
	-- Highlight symbol under cursor
	if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = buffer,
			group = augroup,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = buffer,
			group = augroup,
			callback = vim.lsp.buf.clear_references,
		})
	end
	-- Inlay hints
	if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
		if vim.api.nvim_buf_is_valid(buffer) and vim.bo[buffer].buftype == "" then
			vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
		end
	end
	-- Code lens
	if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_codeLens) then
		vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
			group = augroup,
			buffer = buffer,
			callback = vim.lsp.codelens.refresh,
		})
	end
	-- Diagnostic on hover
	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		group = augroup,
		callback = function()
			vim.diagnostic.open_float(nil, { focus = false })
		end,
	})
end

return M
