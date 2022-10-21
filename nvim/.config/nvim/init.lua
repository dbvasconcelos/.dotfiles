-- Filetype detection
vim.g.do_filetype_lua = 1

-- disable providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load neovim options
require("dbvasconcelos.options")

-- Load Plugins
require("dbvasconcelos.plugins")

-- Set Colorscheme
require("dbvasconcelos.colorscheme")

-- Load neovim options
require("dbvasconcelos.automations")

-- Neovim builtin LSP configuration
require("dbvasconcelos.lsp")

-- Fuzzy Finder
require("dbvasconcelos.telescope")

-- Keymappings
require("dbvasconcelos.keymaps")
