local actions = require("telescope.actions")

require("telescope").setup({
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
				["<C-x>"] = false,
				["<C-s>"] = actions.select_horizontal,
				["<C-k>"] = actions.cycle_history_next,
				["<C-j>"] = actions.cycle_history_prev,
			},
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = true,
			override_file_sorter = true,
		},
	},
})

require("telescope").load_extension("dap")
require("telescope").load_extension("fzy_native")
require("telescope").load_extension("media_files")
require("telescope").load_extension("neoclip")
require("telescope").load_extension("projects")
require("telescope").load_extension("smart_history")

-- Clipboard Extension
require("neoclip").setup()

local M = {}

-- Dotfile Picker
function M.dotfiles()
	require("telescope.builtin").find_files({
		prompt_title = ".dotfiles",
		cwd = "~/.dotfiles",
		hidden = true,
	})
end

return M
