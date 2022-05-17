local M = {}

function M.setup(bufnr)
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "gL", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "gi", "<cmd>Trouble lsp_implementations<cr>", opts)
	vim.keymap.set("n", "gr", "<cmd>Trouble lsp_references<cr>", opts)
end

return M
