local document_highlight = function(bufnr)
	local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
	vim.api.nvim_create_autocmd("CursorHold", {
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

local document_code_lens = function(bufnr)
	local group = vim.api.nvim_create_augroup("lsp_document_codelens", {})
	vim.api.nvim_create_autocmd("BufEnter", {
		callback = require("vim.lsp.codelens").refresh,
		once = true,
		buffer = bufnr,
		group = group,
	})

	vim.api.nvim_create_autocmd({ "BufWritePost", "CursorHold" }, {
		callback = require("vim.lsp.codelens").refresh,
		buffer = bufnr,
		group = group,
	})
end

local document_format = function(bufnr, use_lsp)
	local group = vim.api.nvim_create_augroup("lsp_formatting", {})
	if use_lsp then
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = vim.lsp.buf.formatting_sync,
			buffer = bufnr,
			group = group,
		})
	else
		vim.api.nvim_create_autocmd("BufWritePost", {
			command = "FormatWrite",
			buffer = bufnr,
			group = group,
		})
	end
end

local keybindings = require("dbvasconcelos.lsp.keybindings")
local servers = require("dbvasconcelos.lsp.servers")

local M = function(client, bufnr)
	-- Mappings
	keybindings.setup(bufnr)

	-- Highlighting
	if client.server_capabilities.documentHighlightProvider then
		document_highlight(bufnr)
	end

	-- Code Lens
	if client.server_capabilities.codeLensProvider then
		document_code_lens(bufnr)
	end

	-- Attach any filetype specific options to the client
	local filetype = vim.api.nvim_buf_get_option(0, "filetype")

	if servers[filetype] and servers[filetype].formatter then
		document_format(bufnr, false)
	else
		if client.server_capabilities.documentFormattingProvider then
			document_format(bufnr, true)
		end
	end

	if servers[filetype] and servers[filetype].callback then
		servers[filetype].callback(client)
	end
end

return M
