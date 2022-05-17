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

	local group = vim.api.nvim_create_augroup("lsp_diagnostics", {})

	-- Show line diagnostics automatically in hover window
	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		callback = function()
			vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
		end,
		group = group,
	})

	vim.api.nvim_create_autocmd("BufEnter", {
		callback = function()
			require("lint").try_lint()
		end,
		group = group,
	})

	-- Run linter on text change
	vim.api.nvim_create_autocmd("TextChanged", {
		callback = function()
			require("lint").try_lint()
		end,
		group = group,
	})
end

return M
