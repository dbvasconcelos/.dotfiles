return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-lua/popup.nvim" },
		{ "kkharji/sqlite.lua" },
		{
			"ahmedkhalf/project.nvim",
			event = "VeryLazy",
			opts = {},
			config = function(_, opts)
				require("project_nvim").setup(opts)
				require("telescope").load_extension("projects")
			end,
			keys = {
				{ "<leader>sP", "<cmd>Telescope projects<cr>", desc = "Projects" },
			},
		},
		{
			"AckslD/nvim-neoclip.lua",
			event = "VeryLazy",
			opts = {},
			config = function(_, opts)
				require("neoclip").setup(opts)
				require("telescope").load_extension("neoclip")
			end,
			keys = {
				{ "<leader>c", "<cmd>Telescope neoclip<cr>", desc = "Clipboard" },
			},
		},
		{
			"nvim-telescope/telescope-media-files.nvim",
			event = "VeryLazy",
			config = function()
				require("telescope").load_extension("media_files")
			end,
			keys = {
				{ "<leader>si", "<cmd>Telescope media_files<cr>", desc = "Images" },
			},
		},
		{
			"ghassan0/telescope-glyph.nvim",
			event = "VeryLazy",
			config = function()
				require("telescope").load_extension("glyph")
			end,
			keys = {
				{ "<leader>se", "<cmd>Telescope glyph<cr>", desc = "Emoji" },
			},
		},
		{
			"debugloop/telescope-undo.nvim",
			event = "VeryLazy",
			config = function()
				require("telescope").load_extension("undo")
			end,
			keys = {
				{ "<leader>u", "<cmd>Telescope undo<cr>", desc = "Undo Tree" },
			},
		},
		{
			"nvim-telescope/telescope-fzy-native.nvim",
			event = "VeryLazy",
			config = function()
				require("telescope").load_extension("fzy_native")
			end,
		},
		{
			"nvim-telescope/telescope-dap.nvim",
			event = "VeryLazy",
			config = function()
				require("telescope").load_extension("dap")
			end,
		},
		{
			"tsakirist/telescope-lazy.nvim",
			event = "VeryLazy",
			config = function()
				require("telescope").load_extension("lazy")
			end,
			keys = {
				{ "<leader>sp", "<cmd>Telescope lazy<cr>", desc = "Plugins" },
			},
		},
	},
	cmd = "Telescope",
	opts = {
		defaults = {
			sorting_strategy = "ascending",
			layout_config = {
				prompt_position = "top",
			},
			prompt_prefix = " ",
			selection_caret = " ",
			path_display = { "smart" },
			history = {
				path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
				limit = 100,
			},
			mappings = {
				i = {
					["<c-t>"] = function(...)
						return require("trouble.providers.telescope").open_with_trouble(...)
					end,
					["<a-t>"] = function(...)
						return require("trouble.providers.telescope").open_selected_with_trouble(
							...
						)
					end,
					["<C-j>"] = function(...)
						return require("telescope.actions").cycle_history_next(...)
					end,
					["<C-k>"] = function(...)
						return require("telescope.actions").cycle_history_prev(...)
					end,
					["<C-d>"] = function(...)
						return require("telescope.actions").preview_scrolling_down(...)
					end,
					["<C-u>"] = function(...)
						return require("telescope.actions").preview_scrolling_up(...)
					end,
				},
				n = {
					["q"] = function(...)
						return require("telescope.actions").close(...)
					end,
				},
			},
			extensions = {
				undo = {
					side_by_side = true,
					layout_strategy = "vertical",
					layout_config = {
						preview_height = 0.8,
					},
				},
			},
		},
	},
	keys = {
		{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
		{ "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
		{ "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
		{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
		{ "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
	},
}
