local M = {}

M.setup = function()
	-- Quickfix lists
	require("trouble").setup()

	-- Show line diagnostics automatically in hover window
	local group = vim.api.nvim_create_augroup("lsp_diagnostics", { clear = true })
	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
		callback = function()
			vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
		end,
		group = group,
	})

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

	vim.api.nvim_create_autocmd("BufEnter", {
		callback = function()
			require("lint").try_lint()
		end,
		once = true,
		group = group,
	})

	vim.api.nvim_create_autocmd("TextChanged", {
		callback = function()
			require("lint").try_lint()
		end,
		group = group,
	})
end

return M
