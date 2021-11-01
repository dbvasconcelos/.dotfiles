local actions = require("telescope.actions")

require("telescope").setup {
    defaults = {
        layout_config = {
            width = 0.95,
            height = 0.85,
            prompt_position = "top",
            horizontal = {
                preview_width = function(_, cols, _)
                    if cols > 200 then
                        return math.floor(cols * 0.4)
                    else
                        return math.floor(cols * 0.6)
                    end
                end
            },
            vertical = {width = 0.9, height = 0.95, preview_height = 0.5},
            flex = {horizontal = {preview_width = 0.9}}
        },
        sorting_strategy = "ascending",
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
            i = {
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true
        },
    }
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('dap')
require('telescope').load_extension('neoclip')

local M = {}

-- Dotfile Pick
function M.dotfiles()
    require('telescope.builtin').find_files {
        prompt_title = "Config files",
        cwd = "~/.dotfiles",
        hidden = true
    }
end

local function refactor(prompt_bufnr)
    local content = require("telescope.actions.state").get_selected_entry(
        prompt_bufnr
    )
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
