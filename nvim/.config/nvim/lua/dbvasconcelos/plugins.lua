-- Bootstrap
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.cmd("packadd packer.nvim")
end

-- Auto sync plugins when editing this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local packer = require("packer")

-- Declarations
return packer.startup({
	function(use)
		-- Plugin Manager itself
		use("wbthomason/packer.nvim")

		-- Color Scheme
		use("eddyekofo94/gruvbox-flat.nvim")

		-- Status Line
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})

		-- File Tree
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})

		-- Terminal
		use("akinsho/nvim-toggleterm.lua")

		-- Clipboard
		use("AckslD/nvim-neoclip.lua")

		-- LSP Support
		use("neovim/nvim-lspconfig")

		-- LSP Formatting
		use("mhartington/formatter.nvim")

		-- LSP Lint
		use("mfussenegger/nvim-lint")

		-- LSP Installation
		use("williamboman/nvim-lsp-installer")

		-- LSP Problems
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		})
		-- Commenting
		use("numToStr/Comment.nvim")

		-- Snippets
		use({
			"L3MON4D3/LuaSnip",
			requires = {
				"rafamadriz/friendly-snippets",
			},
		})

		-- Auto Completion
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-path",
				"saadparwaiz1/cmp_luasnip",
				"onsails/lspkind-nvim",
			},
		})

		-- Debugging
		use({
			"mfussenegger/nvim-dap",
			requires = "theHamsta/nvim-dap-virtual-text",
		})

		-- Refactoring
		use({
			"ThePrimeagen/refactoring.nvim",
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-treesitter/nvim-treesitter" },
			},
		})

		-- Treesitter
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

		-- Auto Pairing Parenthesis/Brackets/Curly
		use("windwp/nvim-autopairs")

		-- Fuzzy Finder
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				{ "nvim-lua/popup.nvim" },
				{ "nvim-lua/plenary.nvim" },
                { "tami5/sqlite.lua" },
                { "nvim-telescope/telescope-dap.nvim" },
				{ "nvim-telescope/telescope-fzy-native.nvim" },
				{ "nvim-telescope/telescope-media-files.nvim" },
				{ "nvim-telescope/telescope-smart-history.nvim" },
			},
		})

		-- Color Code Highlighting
		use("norcalli/nvim-colorizer.lua")

		-- Undo Tree
		use("mbbill/undotree")

		-- Hotkey Helper
		use("folke/which-key.nvim")

		-- Surround text objects
		use("tpope/vim-surround")

		-- Git Integration
		use("tpope/vim-fugitive")

		-- Repeat command (.) for plugins
		use("tpope/vim-repeat")

		-- Git Signs
		use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })

		-- Extend block navigation to language keywords
		use("andymass/vim-matchup")

		-- Argument Utility
		use("AndrewRadev/sideways.vim")

		-- Projects
		use({
			"ahmedkhalf/project.nvim",
			config = function()
				require("project_nvim").setup({})
			end,
		})

		-- Marks
		use({
			"ThePrimeagen/harpoon",
			requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
		})

		-- Create parent folders when writing new file
		use("jessarcher/vim-heritage")

		-- Editor Config per project
		use("editorconfig/editorconfig-vim")

		-- Async compilation
		use("tpope/vim-dispatch")

		-- Testing
		use("vim-test/vim-test")

		use({
			"antoinemadec/FixCursorHold.nvim",
			run = function()
				vim.g.curshold_updatime = 1000
			end,
		})

		use("ThePrimeagen/vim-be-good")

		if PACKER_BOOTSTRAP then
			packer.sync()
		end
	end,

	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	},
})
