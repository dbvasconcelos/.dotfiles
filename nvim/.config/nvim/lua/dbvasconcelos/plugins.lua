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

-- Auto compile plugins when editing this file
local group = vim.api.nvim_create_augroup("packer_user_config", {})
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
	group = group,
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

		-- Buffer line
		use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" })

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

		-- Testing
		use({
			"rcarriga/vim-ultest",
			requires = { "vim-test/vim-test" },
			run = ":UpdateRemotePlugins",
		})

		-- LSP Support
		use({
			"neovim/nvim-lspconfig",
			requires = {
				"williamboman/nvim-lsp-installer",
				"numToStr/Comment.nvim",
				"mfussenegger/nvim-lint",
				"mhartington/formatter.nvim",
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

		-- Create parent folders when writing new file
		use("jghauser/mkdir.nvim")

		-- Editorconfig integration
		use("gpanders/editorconfig.nvim")

		-- Async compilation
		use({ "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } })

		-- Games to improve vim skills
		use("ThePrimeagen/vim-be-good")

		-- NSIS syntax highlighting
		use({ "k-takata/vim-nsis", ft = "nsis" })

		use({ "baskerville/vim-sxhkdrc", ft = "sxhkdrc" })

		use({ "VebbNix/lf-vim", ft = "lf" })

		use({
			"antoinemadec/FixCursorHold.nvim",
			run = function()
				vim.g.curshold_updatime = 100
			end,
		})

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
