local M = {}

function M.on_attach(client)
    vim.cmd "nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>"
    vim.cmd "nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>"
    vim.cmd "nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>"
    vim.cmd "nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>"
    vim.cmd "nnoremap <silent> gl <cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = 'single' })<CR>"
    vim.cmd "nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>"
    vim.cmd "nnoremap <silent> [d :lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = single}})<CR>"
    vim.cmd "nnoremap <silent> ]d :lua vim.lsp.diagnostic.goto_next({popup_opts = {border = single}})<CR>"

    if client.resolved_capabilities.document_formatting then
        vim.cmd "nnoremap <silent> <space>f <cmd>lua vim.lsp.buf.formatting()<CR>"
    elseif client.resolved_capabilities.document_range_formatting then
        vim.cmd "nnoremap <silent> <space>f <cmd>lua vim.lsp.buf.range_formatting()<CR>"
    end
end

return M
