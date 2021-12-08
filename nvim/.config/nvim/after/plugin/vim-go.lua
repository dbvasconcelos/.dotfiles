-- load gopls from nvim lsp
vim.g.go_gopls_options = { "-remote=auto" }

-- disable vim-go :GoDef short cut (gd)
-- vim.g.go_def_mapping_enabled = 0

-- Run goimports along gofmt on each save
vim.g.go_fmt_command = "goimports"

-- Automatically get signature/type info for object under cursor
vim.g.go_auto_type_info = 1
