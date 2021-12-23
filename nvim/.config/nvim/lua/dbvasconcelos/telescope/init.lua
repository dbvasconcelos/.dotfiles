local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		layout_config = {
			prompt_position = "top",
		},
		sorting_strategy = "ascending",
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		history = {
			path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
			limit = 100,
		},
	},
	mappings = {
		i = {
			["<C-x>"] = false,
			["<C-s>"] = actions.select_horizontal,
			["<C-k>"] = actions.cycle_history_next,
			["<C-j>"] = actions.cycle_history_prev,
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
require("telescope").load_extension("smart_history")

local M = {}

-- Dotfile Pick
function M.dotfiles()
	require("telescope.builtin").find_files({
		prompt_title = "Config files",
		cwd = "~/.dotfiles",
		hidden = true,
	})
end

local function refactor(prompt_bufnr)
	local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
	require("telescope.actions").close(prompt_bufnr)
	require("refactoring").refactor(content.value)
end

-- Refactor Pick
function M.refactors()
	require("telescope.pickers").new({}, {
		prompt_title = "Refactors",
		finder = require("telescope.finders").new_table({
			results = require("refactoring").get_refactors(),
		}),
		sorter = require("telescope.config").values.generic_sorter({}),
		attach_mappings = function(_, map)
			map("i", "<CR>", refactor)
			map("n", "<CR>", refactor)
			return true
		end,
	}):find()
end
return M
