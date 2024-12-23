local telescope = require("telescope")
local config = require("telescope.config")
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	event = "VimEnter",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = function()
		-- Search Hidden Files except .git/*
		local hidden_arg = "--hidden"
		local glob_arg = "--glob"
		local dotgit_pattern = "!**/.git/*"
		local vimgrep_arguments = { unpack(config.values.vimgrep_arguments) }
		table.insert(vimgrep_arguments, hidden_arg)
		table.insert(vimgrep_arguments, glob_arg)
		table.insert(vimgrep_arguments, dotgit_pattern)

		telescope.load_extension("fzf")

		return {
			defaults = {
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
				},
				prompt_prefix = "󰍉 ",
				selection_caret = " ",
				path_display = { "smart" },
				vimgrep_arguments = vimgrep_arguments,
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", hidden_arg, glob_arg, dotgit_pattern },
				},
			},
		}
	end,
	keys = {
		{ "<leader>sf", builtin.find_files, desc = "Search Files" },
		{ "<leader>sw", builtin.grep_string, desc = "Search Word" },
		{ "<leader>ss", builtin.live_grep, desc = "Search String" },
		{ "<leader>vo", builtin.vim_options, desc = "Vim options" },
	},
}
