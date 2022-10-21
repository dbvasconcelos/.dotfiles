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
	vim.command([[packadd packer.nvim]])
end

local augroup = vim.api.nvim_create_augroup("packer_user_config", {})
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
	group = augroup,
	desc = "Auto compile plugins when editing this file",
})

-- Plugin Declarations
return require("packer").startup({
	function(use)
		-- Plugin Manager itself
		use("wbthomason/packer.nvim")

		-- Color Scheme
		use("eddyekofo94/gruvbox-flat.nvim")

		-- Auto Pairing Parenthesis/Brackets/Curly
		use("windwp/nvim-autopairs")

		-- Buffers
		use("moll/vim-bbye")

		-- Auto Completion
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-cmdline",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lsp-signature-help",
				"hrsh7th/cmp-nvim-lsp-document-symbol",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-path",
				"saadparwaiz1/cmp_luasnip",
				"onsails/lspkind-nvim",
			},
		})

		-- Color Code Highlighting
		use("norcalli/nvim-colorizer.lua")

		-- Debugging
		use({
			"mfussenegger/nvim-dap",
			requires = {
				"rcarriga/nvim-dap-ui",
				"theHamsta/nvim-dap-virtual-text",
				"Pocco81/dap-buddy.nvim",
				"leoluz/nvim-dap-go",
			},
		})

		-- Web Browser Integration
		use({
			"glacambre/firenvim",
			run = function()
				vim.fn["firenvim#install"](0)
			end,
		})

		-- Git Signs
		use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })

		-- Marks
		use({
			"ThePrimeagen/harpoon",
			requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
		})

		-- Motion
		use("ggandor/leap.nvim")

		-- Status Line
		use({
			"nvim-lualine/lualine.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		})

		-- Snippets
		use({
			"L3MON4D3/LuaSnip",
			requires = {
				"rafamadriz/friendly-snippets",
			},
		})

		-- Markdown Preview
		use({
			"iamcco/markdown-preview.nvim",
			run = "cd app && npm install",
			setup = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		})

		-- Tooling Installer
		use("williamboman/mason.nvim")

		-- Testing
		use({
			"nvim-neotest/neotest",
			requires = {
				"nvim-neotest/neotest-go",
				"nvim-lua/plenary.nvim",
				"nvim-treesitter/nvim-treesitter",
				"antoinemadec/FixCursorHold.nvim",
			},
		})

		use("ahmedkhalf/project.nvim")

		-- Refactoring
		use({
			"ThePrimeagen/refactoring.nvim",
			requires = {
				{ "nvim-lua/plenary.nvim" },
			},
		})

		-- Terminal
		use("akinsho/nvim-toggleterm.lua")

		-- File Tree
		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "kyazdani42/nvim-web-devicons" },
		})

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			requires = {
				"nvim-treesitter/nvim-treesitter-textobjects",
			},
		})

		-- LSP Support
		use({
			"neovim/nvim-lspconfig",
			requires = {
				"numToStr/Comment.nvim",
				"jose-elias-alvarez/null-ls.nvim",
				"j-hui/fidget.nvim",
				{ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" },
			},
		})

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
				{ "AckslD/nvim-neoclip.lua" },
			},
		})

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

		-- Editorconfig integration
		use("gpanders/editorconfig.nvim")

		-- Async compilation
		use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })

		-- NSIS syntax highlighting
		use({ "k-takata/vim-nsis", ft = "nsis" })

		-- sxhkd conf file syntax highlighting
		use({ "baskerville/vim-sxhkdrc", ft = "sxhkdrc" })

		-- lf conf file syntax highlighting
		use({ "VebbNix/lf-vim", ft = "lf" })

		-- distraction-free writing
		use("Pocco81/TrueZen.nvim")

		if PACKER_BOOTSTRAP then
			require("packer").sync()
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
