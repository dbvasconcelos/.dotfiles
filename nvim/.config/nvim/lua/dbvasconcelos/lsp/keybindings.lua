local M = {}

function M.setup()
	vim.cmd("nnoremap <silent> K :lua vim.lsp.buf.hover()<cr>")
	vim.cmd("nnoremap <silent> [d :lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = single}})<cr>")
	vim.cmd("nnoremap <silent> ]d :lua vim.lsp.diagnostic.goto_next({popup_opts = {border = single}})<cr>")
	vim.cmd("nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<cr>")
	vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<cr>")
	vim.cmd("nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<cr>")
	vim.cmd("nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<cr>")
end

return M
