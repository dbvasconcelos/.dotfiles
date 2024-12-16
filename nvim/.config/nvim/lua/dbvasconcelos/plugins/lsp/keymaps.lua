local M = {}

M.setup = function(buffer)
	vim.keymap.set(
		"n",
		"gd",
		require("telescope.builtin").lsp_definitions,
		{ buffer = buffer, desc = "go to definition" }
	)

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = buffer, desc = "go to declaration" })

	vim.keymap.set(
		"n",
		"gr",
		require("telescope.builtin").lsp_references,
		{ buffer = buffer, desc = "go to references" }
	)

	vim.keymap.set(
		"n",
		"gI",
		require("telescope.builtin").lsp_implementations,
		{ buffer = buffer, desc = "go to implementations" }
	)

	vim.keymap.set(
		"n",
		"<leader>lt",
		require("telescope.builtin").lsp_type_definitions,
		{ buffer = buffer, desc = "Type definition" }
	)

	vim.keymap.set(
		"n",
		"<leader>ls",
		require("telescope.builtin").lsp_document_symbols,
		{ buffer = buffer, desc = "Document Symbols" }
	)

	vim.keymap.set(
		"n",
		"<leader>lS",
		require("telescope.builtin").lsp_dynamic_workspace_symbols,
		{ buffer = buffer, desc = "Workspace Symbols" }
	)

	vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { buffer = buffer, desc = "Rename" })

	vim.keymap.set({ "n", "x" }, "<leader>la", vim.lsp.buf.code_action, { buffer = buffer, desc = "Code Action" })
end

return M
