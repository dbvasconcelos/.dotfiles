local M = {}

function M.setup()
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = 0 })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = 0 })
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
	vim.keymap.set("n", "gL", vim.diagnostic.open_float, { buffer = 0 })
	vim.keymap.set("n", "gi", "<cmd>Trouble lsp_implementations<cr>", { buffer = 0 })
	vim.keymap.set("n", "gr", "<cmd>Trouble lsp_references<cr>", { buffer = 0 })
end

return M
