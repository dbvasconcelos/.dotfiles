local document_highlight = function()
	local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
	vim.api.nvim_create_autocmd("CursorHold", {
		callback = vim.lsp.buf.document_highlight,
		group = group,
	})
	vim.api.nvim_create_autocmd("CursorMoved", {
		callback = vim.lsp.buf.clear_references,
		group = group,
	})
end

local document_code_lens = function()
	local group = vim.api.nvim_create_augroup("lsp_document_codelens", { clear = true })
	vim.api.nvim_create_autocmd("BufEnter", {
		callback = require("vim.lsp.codelens").refresh,
		group = group,
		once = true,
	})

	vim.api.nvim_create_autocmd({ "BufWritePost", "CursorHold" }, {
		callback = require("vim.lsp.codelens").refresh,
		group = group,
	})
end

local document_format = function(use_lsp)
	local group = vim.api.nvim_create_augroup("lsp_formatting", { clear = true })
	if use_lsp then
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = vim.lsp.buf.formatting_sync,
			group = group,
		})
	else
		vim.api.nvim_create_autocmd("BufWritePost", {
			command = "FormatWrite",
			group = group,
		})
	end
end

-- Extended On Attach
local M = function(client)
	-- Mappings
	require("dbvasconcelos.lsp.keybindings").setup()

	-- Highlighting
	if client.resolved_capabilities.document_highlight then
		document_highlight()
	end

	-- Code Lens
	if client.resolved_capabilities.code_lens then
		document_code_lens()
	end

	local servers = require("dbvasconcelos.lsp.servers")

	-- Attach any filetype specific options to the client
	local filetype = vim.api.nvim_buf_get_option(0, "filetype")

	if servers[filetype] and servers[filetype].formatter then
		document_format(false)
	else
		if client.resolved_capabilities.document_formatting then
			document_format(true)
		end
	end

	if servers[filetype] and servers[filetype].callback then
		servers[filetype].callback(client)
	end
end

return M
