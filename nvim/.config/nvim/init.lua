-- Filetype detection
vim.g.do_filetype_lua = 1

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load neovim options
require("dbvasconcelos.options")

-- Load Plugins
require("dbvasconcelos.plugins")

-- Load Color Scheme
require("dbvasconcelos.colorscheme")

-- Load neovim options
require("dbvasconcelos.automations")

-- Neovim builtin LSP configuration
require("dbvasconcelos.lsp")

-- Fuzzy Finder
require("dbvasconcelos.telescope")

-- Keymappings
require("dbvasconcelos.keymaps")
