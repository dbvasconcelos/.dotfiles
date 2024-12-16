return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	event = "VimEnter",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-lua/popup.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-treesitter/nvim-treesitter" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-telescope/telescope-media-files.nvim" },
		{ "nvim-telescope/telescope-dap.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
	},
	config = function()
		require("telescope").setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
				},
				prompt_prefix = "󰍉 ",
				selection_caret = " ",
				path_display = { "smart" },
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("media_files")
		require("telescope").load_extension("dap")
	end,
	keys = {
		{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Search Files" },
		{ "<leader>si", "<cmd>Telescope media_files<cr>", desc = "Search Images" },
		{ "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Search Word" },
		{ "<leader>ss", "<cmd>Telescope live_grep<cr>", desc = "Search String" },
		{ "<leader>vo", "<cmd>Telescope vim_options<cr>", desc = "Vim options" },
		{ "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
		{
			"<leader>/",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end,
			desc = "Find in Current Buffer",
		},
	},
}
