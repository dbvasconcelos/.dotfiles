-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("dbvasconcelos.plugins")

-- Load neovim options
require("dbvasconcelos.options")

-- Load neovim options
require("dbvasconcelos.automations")

-- Keymappings
require("dbvasconcelos.keymaps")
