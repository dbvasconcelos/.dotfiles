local M = vim.lsp.protocol.make_client_capabilities()

M.textDocument.codeLens = { dynamicRegistration = false }
M = require("cmp_nvim_lsp").update_capabilities(M)

return M
