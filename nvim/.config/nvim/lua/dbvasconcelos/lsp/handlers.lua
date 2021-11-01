local M = {}

M.setup = function()
  -- Definition
  vim.lsp.handlers["textDocument/definition"] = function(_, _, result)
    if not result or vim.tbl_isempty(result) then
      print "[LSP] Could not find definition"
      return
    end

    if vim.tbl_islist(result) then
      vim.lsp.util.jump_to_location(result[1])
    else
      vim.lsp.util.jump_to_location(result)
    end
  end

  -- Diagnostics
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = "",
      spacing = 0,
    },
    signs = true,
    underline = true,
  })

  -- Hover
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
  })

  -- Signature Help
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single",
  })
end

return M
